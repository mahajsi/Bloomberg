CREATE OR REPLACE PACKAGE BODY MAINTAIN_MARKIT_CURVES_PKG
IS
-----------------------------------------------------------------------------
--                                                                         --
-- Author    : Tom Siddy                                               --
-- Package   : MAINTAIN_MARKIT_CURVES_PKG                                  --
-- Date      : 13 Oct 2006                                                 --
-- Copyright : Wellington Management Company, LLP 2001-2003                --
--                                                                         --
-----------------------------------------------------------------------------
--                                                                         --
-- Description :                                                           --
--                                                                         --
-- Comments    :                                                           --
--                                                                         --
-- Contains    :                                                           --
-----------------------------------------------------------------------------
-- Revisions:                                                              --
/*
   $Revision: bloomberg_fenge/6 $
   $Modtime:   13 Sep 2005 11:11:14  $
   $Log: maintain_markit_curves_pkg.sql $
   Revision bloomberg_fenge/6 2010/09/17 13:58:06 fenge
   	For issuer error in stage - ORA-02291: integrity constraint (WMC.CURVE_ANALYTICS_FK1) violated - parent key not found]
   	No investment entity id value found for curve [68966], or issuer [182618]
   
   Revision bloomberg_fenge/5 2010/09/17 00:57:41 fenge
   	For issuer error in stage - ORA-02291: integrity constraint (WMC.CURVE_ANALYTICS_FK1) violated - parent key not found]
   	No investment entity id value found for curve [68966], or issuer [182618]
   
   Revision bloomberg_WIP_garcin/1 2010/09/16 16:49:35 garcin
   	No Comment Entered
   
   Revision bloomberg_fenge/4 2010/09/14 18:01:28 fenge
   	For TD 4432 - Maintain Markit Sector Curve version (retire and renew)
   
   Revision bloomberg_fenge/3 2010/09/13 18:48:20 fenge
   	For TD 4432 - Changed version from 5 to 7 for sector curve downloading.
   
   Revision bloomberg_fenge/2 2010/09/13 14:52:42 fenge
   	For TD 4432 - Add version control logic for Markit sector curve
   
   Revision bloomberg_WIP_kampeta/12 2006/12/06 16:37:01 kampeta
   	performance fix in get_prior_analytics
   
   Revision bloomberg_WIP_kampeta/11 2006/11/08 16:46:10 kampeta
   	Modified whoch date is used when there is no change when populating analytics table
   
   Revision bloomberg_WIP_kampeta/10 2006/11/08 16:17:27 kampeta
   	Fixed number format when checking for differences
   
   Revision bloomberg_WIP_kampeta/9 2006/11/07 15:53:32 kampeta
   	Removed checking dates for differnces in analytics procedure
   
   Revision bloomberg_WIP_kampeta/8 2006/11/03 20:27:06 kampeta
   	Modified how issuer linking is done. Added use of sequences.
   
   Revision bloomberg_WIP_kampeta/7 2006/11/02 21:13:55 kampeta
   	removed Initialize paramter. This will be done using seperate scripts
   
   Revision bloomberg_WIP_kampeta/6 2006/11/01 17:57:06 kampeta
   	Added initialize flag to use when we load history or initialize curve tables
   
   Revision bloomberg_WIP_kampeta/5 2006/10/31 15:52:54 kampeta
   	Changes for Investment linking
   
   Revision bloomberg_WIP_kampeta/4 2006/10/27 19:58:34 kampeta
   	Added Investment Entity Linking logic (commented out until privileges granted)
   
   Revision bloomberg_WIP_kampeta/3 2006/10/26 19:20:54 kampeta
   	Uncommented out interpolated flag logic after column was added
   
   Revision bloomberg_WIP_kampeta/2 2006/10/25 19:59:30 kampeta
   	Latest changes for analytics
   

*/
    --
    -- maintain_markit_data is called from the following
    -- Markit Sector Curves and Markit Issuer Curves Maestro schedules
    -- IIMKTSC and IIMKTIC
    -- this way hopefully all logic changes can be done via sql instead
    -- of changes to schedules/jobs/etc.
    PROCEDURE maintain_markit_curves (p_type curve.curve_typ%TYPE)
    IS
        l_party_id          party.party_id%TYPE;
        l_next_curve_id     curve.curve_id%TYPE;

    BEGIN
        l_party_id := get_party_id(c_party_typ, c_subtyp_id_char);

        IF    p_type = c_curve_typ_sector THEN
            OPEN c_markit_sector_curve;

            LOOP
                FETCH c_markit_sector_curve INTO g_markit_sector_data;
                EXIT WHEN c_markit_sector_curve%NOTFOUND;

                maintain_sector_curve (g_markit_sector_data, l_party_id);
            END LOOP;

            CLOSE c_markit_sector_curve;

        ELSIF p_type = c_curve_typ_issuer THEN
            OPEN c_markit_issuer_curve;

            LOOP
                FETCH c_markit_issuer_curve INTO g_markit_issuer_data;
                EXIT WHEN c_markit_issuer_curve%NOTFOUND;

                maintain_issuer_curve (g_markit_issuer_data, l_party_id);
            END LOOP;

            CLOSE c_markit_issuer_curve;

        ELSE
            dbms_output.put_line('ERROR: MAINTAIN_MARKIT_CURVES: Invalid TYPE passed in for type:['|| p_type ||'].');
        END IF;

    END; -- end of maintain_markit_curves

    PROCEDURE maintain_sector_curve (p_markit_sector c_markit_sector_curve%ROWTYPE, p_party_id party.party_id%TYPE)
    IS
        l_curve_id          curve.curve_id%TYPE;
        l_catlg_item_id     curve_catlg_tbl.catlg_item_id%TYPE;
        l_curve_nm          curve.curve_nm%TYPE;

    BEGIN
        l_curve_nm      := p_markit_sector.industry_name || c_curve_nm_sep || p_markit_sector.rating || c_curve_nm_suffix_sector;

        l_curve_id      := get_curve_id (c_curve_typ_sector, p_party_id, l_curve_nm, c_sector_version_id);
        l_catlg_item_id := get_catlg_item_id(c_srce_cd_ICB, c_attr_id_ICB, c_catlg_id_ICB, p_markit_sector.industry_name);

        IF l_curve_id IS NULL THEN
            dbms_output.put_line('ERROR: NO Curve Id found, cannot create or maintain curve for industry_name[' || p_markit_sector.industry_name || '], rating[' || p_markit_sector.rating || '].');
        ELSE
            ins_curve_sector    (l_curve_id, p_party_id, p_markit_sector.rating, l_curve_nm, c_sector_version_id);
            ins_curve_catlg_tbl (l_curve_id, c_catlg_id_ICB, l_catlg_item_id);
            maintain_curve_terms(c_curve_typ_sector, l_curve_id, p_party_id, p_markit_sector, NULL);
            maintain_curve_analytics (c_curve_typ_sector, l_curve_id, p_markit_sector, NULL);
        END IF;
    END; -- end of maintain_sector_curves

    PROCEDURE maintain_issuer_curve (p_markit_issuer c_markit_issuer_curve%ROWTYPE, p_party_id party.party_id%TYPE)
    IS
        l_curve_id             curve.curve_id%TYPE;
        l_catlg_item_id        curve_catlg_tbl.catlg_item_id%TYPE;
        l_catlg_item_id_region curve_catlg_tbl.catlg_item_id%TYPE;
        l_curve_nm             curve.curve_nm%TYPE;
        l_country              curve.cntry_cd%TYPE;
        
        l_email_text           VARCHAR2(4000);

    BEGIN
        l_curve_nm             := p_markit_issuer.ticker || c_curve_nm_sep || p_markit_issuer.tier || c_curve_nm_sep || p_markit_issuer.ccy || c_curve_nm_sep || p_markit_issuer.doc_clause || c_curve_nm_suffix_issuer;
        l_curve_id             := get_curve_id (c_curve_typ_issuer, p_party_id, l_curve_nm, null);
        l_catlg_item_id        := get_catlg_item_id(c_srce_cd_ICB, c_attr_id_ICB, c_catlg_id_ICB, p_markit_issuer.sector);
        l_catlg_item_id_region := get_catlg_item_id(c_srce_cd_markit, c_attr_id_Region, c_catlg_id_Region, p_markit_issuer.region);
        l_country              := get_country_cd(p_markit_issuer.country);
        
        IF l_country IS NULL THEN
            -- send email to #Curve Data Support with curve_id, curve_nm, country
            l_email_text := 'No country code found in ref_attr_value for curve_id [' || l_curve_id || '], country[' || l_country || '], curve_nm[' || l_curve_nm || '].';
            dbms_output.put_line (' Send email to #Curve Data Support: ' || l_email_text);
            email_error('Markit Curve - Missing Country Code in REF_ATTR_VALUE', l_email_text);
        END IF;

        IF l_curve_id IS NULL THEN
            dbms_output.put_line('ERROR: NO Curve Id found, cannot create or maintain issuer curve for curve_nm[' || l_curve_nm || '].');
        ELSE
            ins_curve_issuer    (l_curve_id, p_party_id, p_markit_issuer, l_curve_nm, l_country);
            IF p_markit_issuer.red IS NOT NULL THEN
                maintain_issuer_link (l_curve_id, p_markit_issuer.red);
            END IF;
            ins_curve_catlg_tbl (l_curve_id, c_catlg_id_ICB, l_catlg_item_id);
            ins_curve_catlg_tbl (l_curve_id, c_catlg_id_Region, l_catlg_item_id_region);
            maintain_curve_terms(c_curve_typ_issuer, l_curve_id, p_party_id, NULL, p_markit_issuer);
            maintain_curve_analytics (c_curve_typ_issuer, l_curve_id, NULL, p_markit_issuer);
        END IF;
        
    END; -- end of maintain_issuer_curves

    FUNCTION get_party_id ( p_party_typ party.party_typ%TYPE, p_subtyp_id_char party.subtyp_id_char%TYPE )
    RETURN party.party_id%TYPE
    IS
        l_party_id party.party_id%TYPE;
    BEGIN
        l_party_id := NULL;

        SELECT
            p.party_id
        INTO
            l_party_id
        FROM party p
        WHERE
            p.party_typ      = p_party_typ      AND
            p.subtyp_id_char = p_subtyp_id_char
        ;

        RETURN l_party_id;

        EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;

    END; -- end of get_party_id

    FUNCTION get_next_curve_id ( p_type curve.curve_typ%TYPE, p_party_id party.party_id%TYPE )
    RETURN curve.curve_id%TYPE
    IS
        l_next_curve_id curve.curve_id%TYPE;
    BEGIN
        l_next_curve_id := NULL;
        
        -- old logic would find max then increment by 1. 
        -- we have since added sequences for each type to maintain the values

        IF p_type = c_curve_typ_sector THEN
            SELECT
                markit_sector_curve_seq.NEXTVAL
            INTO
                l_next_curve_id
            FROM dual;
        ELSIF p_type = c_curve_typ_issuer THEN
            SELECT
                markit_issuer_curve_seq.NEXTVAL
            INTO
                l_next_curve_id
            FROM dual;
        END IF;

        RETURN l_next_curve_id;

        EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;

    END; -- end of get_next_curve_id

    FUNCTION get_curve_id (
                           p_type         IN    curve.curve_typ%TYPE, 
                           p_party_id     IN    party.party_id%TYPE, 
                           p_curve_nm     IN    curve.curve_nm%TYPE, 
                           p_curve_vsn    IN    curve.version%TYPE
    )
    RETURN curve.curve_id%TYPE
    IS
        l_curve_id curve.curve_id%TYPE;
    BEGIN
        l_curve_id := NULL;

            SELECT
                c.curve_id
            INTO
                l_curve_id
            FROM
                curve c
            WHERE
                c.party_id  = p_party_id AND
                c.curve_typ = p_type     AND
                c.curve_nm  = p_curve_nm AND
                NVL(c.version, 0) = NVL(p_curve_vsn, 0)
            ;

        RETURN l_curve_id;

        EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('**ERROR**- Too many CURVE rows were found for type[' || p_type || '], curve_nm[' || p_curve_nm || '].');
            RETURN NULL;

        WHEN no_data_found THEN
            l_curve_id := get_next_curve_id(p_type, p_party_id);
            RETURN l_curve_id;

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error looking up sector CURVE rows for type[' || p_type || '], curve_nm[' || p_curve_nm || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');
            RETURN NULL;

    END; -- end of get_curve_id

    FUNCTION get_catlg_item_id ( p_srce_cd ref_attr_value.srce_cd%TYPE, p_attr_id ref_attr_value.attr_id%TYPE, p_catlg_id catlg_item.catlg_id%TYPE, p_short_dsc ref_attr_value.short_dsc%TYPE, p_Mtge VARCHAR2 DEFAULT NULL)
    RETURN curve_catlg_tbl.catlg_item_id%TYPE
    IS
        l_catlg_item_id curve_catlg_tbl.catlg_item_id%TYPE;
    BEGIN
        l_catlg_item_id := NULL;

        SELECT
            c.catlg_item_id
        INTO
            l_catlg_item_id
        FROM
            catlg_item c,
            ref_attr_value r
        WHERE
            c.low_lv_cd_value = r.code_value AND
            c.catlg_id        = p_catlg_id   AND
            r.short_dsc       = p_short_dsc  AND
            r.attr_id         = p_attr_id    AND
            r.srce_cd         = p_srce_cd
        ;

        RETURN l_catlg_item_id;

        EXCEPTION
        WHEN too_many_rows THEN
          BEGIN
            IF p_Mtge = 'Y' THEN
              l_catlg_item_id := NULL;

              SELECT
                c.catlg_item_id
              INTO
                l_catlg_item_id
              FROM
                catlg_item c,
                ref_attr_value r
              WHERE
                c.low_lv_cd_value = r.code_value AND
                c.catlg_id        = p_catlg_id   AND
                r.short_dsc       = p_short_dsc  AND
                r.attr_id         = p_attr_id    AND
                r.srce_cd         = p_srce_cd    AND
                r.code_value      LIKE 'MTGE%'
              ;
            ELSIF p_Mtge = 'N' THEN
              l_catlg_item_id := NULL;

              SELECT
                c.catlg_item_id
              INTO
                l_catlg_item_id
              FROM
                catlg_item c,
                ref_attr_value r
              WHERE
                c.low_lv_cd_value = r.code_value AND
                c.catlg_id        = p_catlg_id   AND
                r.short_dsc       = p_short_dsc  AND
                r.attr_id         = p_attr_id    AND
                r.srce_cd         = p_srce_cd    AND
                r.code_value      NOT LIKE 'MTGE%'
              ;
            ELSIF p_Mtge IS NULL THEN
              l_catlg_item_id := NULL;

              SELECT
                c.catlg_item_id
              INTO
                l_catlg_item_id
              FROM
                catlg_item c,
                ref_attr_value r
              WHERE
                c.low_lv_cd_value = r.code_value AND
                c.catlg_id        = p_catlg_id   AND
                r.short_dsc       = p_short_dsc  AND
                r.attr_id         = p_attr_id    AND
                r.srce_cd         = p_srce_cd
              ;              
            END IF;

            RETURN l_catlg_item_id;

          EXCEPTION
            WHEN too_many_rows THEN
              dbms_output.put_line('**ERROR**- Too many catalog item rows were found for srce_cd[' || p_srce_cd || '], attr_id[' || p_attr_id || '], catlg_id[' ||   p_catlg_id || '], short_dsc[' || p_short_dsc || '].');
              RETURN NULL;
          END;

        WHEN no_data_found THEN
            RETURN NULL;

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error looking up catalog items for srce_cd[' || p_srce_cd || '], attr_id[' || p_attr_id || '], catlg_id[' || p_catlg_id || '], short_dsc[' || p_short_dsc || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');
            RETURN NULL;

    END; -- end of get_catlg_item_id

    FUNCTION get_country_cd ( p_country ref_attr_value.short_dsc%TYPE )
    RETURN curve.cntry_cd%TYPE
    IS
        l_cntry_cd curve.cntry_cd%TYPE;
    BEGIN
        l_cntry_cd := NULL;

        SELECT
            v.code_value
        INTO
            l_cntry_cd
        FROM
            ref_Attr_value v
        WHERE
            v.attr_id   = c_attr_id_country AND
            v.srce_cd   = c_srce_cd_markit  AND
            v.short_dsc = p_country
        ;

        RETURN l_cntry_cd;

        EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('**ERROR**- Too many country code rows were found for srce_cd[' || c_srce_cd_markit || '], attr_id[' || c_attr_id_country || '], short_dsc[' || p_country || '].');
            RETURN NULL;

        WHEN no_data_found THEN
            dbms_output.put_line('**ERROR**- No country code rows were found for srce_cd[' || c_srce_cd_markit || '], attr_id[' || c_attr_id_country || '], short_dsc[' || p_country || '].');
            RETURN NULL;

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error looking up country code for srce_cd[' || c_srce_cd_markit || '], attr_id[' || c_attr_id_country || '], short_dsc[' || p_country || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');
            RETURN NULL;

    END; -- end of get_country_cd

    FUNCTION get_next_term_id ( p_party_id party.party_id%TYPE )
    RETURN curve_term.term_id%TYPE
    IS
        l_next_term_id curve_term.term_id%TYPE;
    BEGIN
        l_next_term_id := NULL;
        
        -- old logic would find max then increment by 1. 
        -- we have since added a sequence for to maintain the values

        SELECT
            markit_curve_term_seq.NEXTVAL
        INTO
            l_next_term_id
        FROM dual;

        RETURN l_next_term_id;

        EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;

    END; -- end of get_next_term_id

    FUNCTION get_term_id (p_curve_id curve.curve_id%type, p_party_id party.party_id%TYPE, p_seq_no curve_term.seq_no%TYPE)
    RETURN curve_term.term_id%TYPE
    IS
        l_term_id curve_term.term_id%TYPE;
    BEGIN
        l_term_id := NULL;

        SELECT
            c.term_id
        INTO
            l_term_id
        FROM
            curve_term c
        WHERE
            c.curve_id  = p_curve_id     AND
            c.seq_no    = p_seq_no
        ;

        RETURN l_term_id;

        EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('**ERROR**- Too many CURVE_TERM rows were found for curve_id[' || p_curve_id || '], seq_no[' || p_seq_no || '].');
            RETURN NULL;

        WHEN no_data_found THEN
            l_term_id := get_next_term_id(p_party_id);
            RETURN l_term_id;

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error looking up TERM_ID rows for curve_id[' || p_curve_id || '], seq_no[' || p_seq_no || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');
            RETURN NULL;

    END; -- end of get_term_id

    PROCEDURE maintain_issuer_link (p_curve_id curve.curve_id%type, p_red g_markit_issuer_data.red%TYPE)
    IS
        l_curve_isr        issuer.isr_id%TYPE;
        l_ext_id_isr       isr_external_id.Isr_Id%TYPE;
        l_entity_id_curve  wmc.inv_entity_ref.inv_entity_id%TYPE;
        l_entity_id_issuer wmc.inv_entity_ref.inv_entity_id%TYPE;
        
        l_email_text       VARCHAR2(4000);
        
    BEGIN
        -- find issuers for RED vlaue passed in
        FOR v_data IN
        (SELECT 
            e.isr_id
        FROM 
            isr_external_id e
        WHERE 
            e.extern_id_typ = 'ENTITYCLIP' AND
            e.extern_id     = p_red        AND
            e.eff_dt        = (SELECT MAX(e2.eff_dt)
                               FROM
                                   isr_external_id e2
                               WHERE 
                                   e2.extern_id      = e.extern_id     AND
                                   e2.extern_id_typ  = e.extern_id_typ AND
                                   e2.eff_dt        <= SYSDATE
                              ) AND
            nvl(e.exp_dt, SYSDATE) >= SYSDATE
        )
        
        LOOP
            l_ext_id_isr := v_data.isr_id;
            -- It is possible that a Markit RED value can be associated with multiple Issuers in IDR
            -- Loop through each issuer and create link for each.
            IF l_ext_id_isr IS NOT NULL THEN
                BEGIN
                    -- lookup inv_entity_ids for issuer and curve
                    SELECT
                        ier.Inv_Entity_Id
                    INTO
                        l_entity_id_curve
                    FROM wmc.inv_entity_ref ier
                    WHERE
                        ier.system            = 'IDR' AND
                        ier.inv_entity_typ    = 'CURVE' AND
                        ier.entity_id_numeric = p_curve_id
                    ;
    
                    SELECT
                        ier.Inv_Entity_Id
                    INTO
                        l_entity_id_issuer
                    FROM wmc.inv_entity_ref ier
                    WHERE
                        ier.system            = 'IDR' AND
                        ier.inv_entity_typ    = 'ISSUER' AND
                        ier.entity_id_numeric = l_ext_id_isr
                    ;
                    
                    IF l_entity_id_issuer IS NOT NULL AND
                       l_entity_id_curve  IS NOT NULL
                    THEN
                        INSERT INTO wmc.inv_entity_mm_tbl ies
                        ( INS_LOGIN,
                          UPD_LOGIN,
                          INV_ENTITY_ID,
                          RELATED_INV_ENTITY_ID,
                          RELATIONSHIP_TYP
                        )
                        SELECT
                          'MARKIT_SCRUB',
                          'MARKIT_SCRUB',
                          l_entity_id_curve,
                          l_entity_id_issuer,
                          'CURVE-TO-ISSUER'
                        FROM dual
                        WHERE NOT EXISTS (SELECT 1
                                          FROM wmc.inv_entity_mm_tbl ies2
                                          WHERE 
                                              ies2.inv_entity_id         = l_entity_id_curve  AND
                                              ies2.related_inv_entity_id = l_entity_id_issuer AND
                                              ies2.relationship_typ      = 'CURVE-TO-ISSUER'
                                          )
                         ;
                  END IF;
    
                  EXCEPTION
                  WHEN no_data_found THEN
                      l_email_text := 'No investment entity id value found for curve [' || p_curve_id ||'], or issuer [' || l_ext_id_isr || '].';
                      dbms_output.put_line (' Send email to #Curve Data Support: ' || l_email_text);
                      email_error('Markit Curve - Missing INVE_ENTITY_REF value', l_email_text);
                      
      
                  WHEN OTHERS THEN
                      dbms_output.put_line (' ERROR looking up investment entity id values for curve [' || p_curve_id ||'], or issuer [' || l_ext_id_isr || '].');
                  
                END;
            END IF;
        END LOOP;

        EXCEPTION
        WHEN no_data_found THEN
            l_email_text := 'No issuers found in isr_external_id for RED [' || p_red || ', for curve_id [' || p_curve_id || '].';
            dbms_output.put_line (' Send email to #Curve Data Support: ' || l_email_text);
            email_error('Markit Curve - No Issuer found in ISR_EXTERNAL_ID', l_email_text);
                    
        WHEN OTHERS THEN
            dbms_output.put_line ('ERROR looking up isr_external_id.isr_id for red value [' || p_red || ', for curve_id [' || p_curve_id || '].');
            
    END; -- end of maintain_issuer_link

    PROCEDURE ins_curve_sector (
        p_curve_id        IN        curve.curve_id%type, 
        p_party_id        IN        party.party_id%TYPE, 
        p_rating          IN        curve.rating%type, 
        p_curve_nm        IN        curve.curve_nm%TYPE, 
        p_version         IN        curve.version%TYPE
    )
    IS
    BEGIN
        INSERT INTO curve
            ( INS_LOGIN, UPD_LOGIN,
              CURVE_ID,
              CURVE_SYM,
              CURVE_NM,
              FREQUENCY,
              INACTIVE_DT,
              COMMENTS,
              PARTY_ID,
              SOURCE_TYP,
              RATING,
              CURVE_TYP,
              VERSION
            )
         SELECT
            'MARKIT_CURVE', 'MARKIT_CURVE',
            p_curve_id,
            p_curve_id,
            p_curve_nm,
            c_frequency_daily,
            NULL,
            NULL,
            p_party_id,
            c_source_typ_input,
            p_rating,
            c_curve_typ_sector,
            p_version
        FROM dual
        WHERE NOT EXISTS (SELECT 1
                          FROM curve c
                          WHERE
                              c.party_id  = p_party_id         AND
                              c.curve_typ = c_curve_typ_sector AND
                              c.curve_nm  = p_curve_nm         AND
                              c.version   = p_version
                         )
        ;

        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            dbms_output.put_line('**ERROR**- Sector curve already exists for curve_id[' || p_curve_id ||'].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error inserting new sector CURVE row with curve_id[' || p_curve_id ||'] and curve_nm[' || p_curve_nm || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of ins_curve_sector

    PROCEDURE ins_curve_issuer (p_curve_id curve.curve_id%type, p_party_id party.party_id%TYPE, p_markit_issuer c_markit_issuer_curve%ROWTYPE, p_curve_nm curve.curve_nm%TYPE, p_country curve.cntry_cd%TYPE)
    IS
    BEGIN
        INSERT INTO curve
            ( INS_LOGIN, UPD_LOGIN,
              CURVE_ID,
              CURVE_SYM,
              CURVE_NM,
              CURCY_CD,
              FREQUENCY,
              INACTIVE_DT,
              COMMENTS,
              PARTY_ID,
              SOURCE_TYP,
              CNTRY_CD,             
              TIER,
              DOC_CLAUSE,
              CURVE_TYP,
              VNDR_DESCRIPTOR -- ticker              
            )
         SELECT
            'MARKIT_CURVE', 'MARKIT_CURVE',
            p_curve_id,
            p_curve_id,
            p_curve_nm,
            p_markit_issuer.ccy,
            c_frequency_daily,
            NULL,
            NULL,
            p_party_id,
            c_source_typ_input,
            p_country,
            p_markit_issuer.tier,
            p_markit_issuer.doc_clause,
            c_curve_typ_issuer,
            p_markit_issuer.ticker
        FROM dual
        WHERE NOT EXISTS (SELECT 1
                          FROM curve c
                          WHERE
                              c.party_id  = p_party_id         AND
                              c.curve_typ = c_curve_typ_issuer AND
                              c.curve_nm  = p_curve_nm
                         )
        ;

        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            dbms_output.put_line('**ERROR**- Issuer curve already exists for curve_id[' || p_curve_id ||'] and curve_nm[' || p_curve_nm || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error inserting new issuer CURVE row with curve_id[' || p_curve_id ||'] and curve_nm[' || p_curve_nm || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of ins_curve_issuer

    PROCEDURE ins_curve_catlg_tbl (p_curve_id curve.curve_id%type, p_catlg_id curve_catlg_tbl.catlg_id%TYPE, p_catlg_item_id curve_catlg_tbl.catlg_item_id%TYPE)
    IS
    BEGIN

        INSERT INTO curve_catlg_tbl
            ( INS_LOGIN, UPD_LOGIN,
              CURVE_ID,
              CATLG_ID,
              CATLG_ITEM_ID
            )
        SELECT
            'MARKIT_CURVE', 'MARKIT_CURVE',
             p_curve_id,
             p_catlg_id,
             p_catlg_item_id
        FROM dual
        WHERE NOT EXISTS (SELECT 1
                          FROM curve_catlg_tbl c
                          WHERE
                              c.curve_id = p_curve_id AND
                              c.catlg_id = p_catlg_id
                         )
        ;

        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            dbms_output.put_line('**ERROR**- Catalog already exists for curve_id[' || p_curve_id ||'] and catlg_id[' || p_catlg_id ||'].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error inserting new catalog item row for curve_id[' || p_curve_id ||'] and catlg_id[' || p_catlg_id ||'].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of ins_curve_catlg_tbl

    PROCEDURE ins_curve_term ( p_term_id curve_term.term_id%TYPE, p_curve_id curve.curve_id%type, p_seq_no curve_term.seq_no%TYPE, p_term_units curve_term.term_units%TYPE, p_term_units_typ curve_term.term_units_typ%TYPE, p_term_sym curve_term.term_symbol%TYPE)
    IS
    BEGIN

        INSERT INTO curve_term
            ( INS_LOGIN, UPD_LOGIN,
              TERM_ID,
              CURVE_ID,
              SEQ_NO,
              TERM_UNITS,
              TERM_UNITS_TYP,
              TERM_SYMBOL
            )
        SELECT
            'MARKIT_CURVE', 'MARKIT_CURVE',
             p_term_id,
             p_curve_id,
             p_seq_no,
             p_term_units,
             p_term_units_typ,
             p_term_sym
         FROM dual
         WHERE NOT EXISTS (SELECT 1
                           FROM curve_term c
                           WHERE
                               c.curve_id = p_curve_id AND
                               c.seq_no   = p_seq_no
                           )
         ;

        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            dbms_output.put_line('**ERROR**- Curve Term already exists for term_id [' || p_term_id || '],curve_id[' || p_curve_id ||'], seq_no[' || p_seq_no|| '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error inserting new CURVE_TERM row with term_id [' || p_term_id || '],curve_id[' || p_curve_id ||'] and seq_no[' || p_seq_no || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of ins_curve_term

    FUNCTION get_prior_analytics (p_curve_id curve.curve_id%type, p_eff_dt curve_analytics.eff_dt%TYPE)
    RETURN curve_analytics%ROWTYPE
    IS
        l_curve_analytics curve_analytics%ROWTYPE;
    BEGIN
        l_curve_analytics := NULL;

        SELECT
            cap.*
        INTO
            l_curve_analytics
        FROM
            curve_analytics cap
        WHERE
            cap.curve_id = p_curve_id AND
            cap.eff_dt   = (SELECT MAX(ca.eff_dt)
                            FROM curve_analytics ca
                            WHERE
                                ca.curve_id = p_curve_id AND
                                ca.eff_dt   < p_eff_dt)
        ;

        RETURN l_curve_analytics;

        EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('**ERROR**- Too many prior CURVE_ANALYTICS rows were found for curve_id[' || p_curve_id || '], eff_dt[' || p_eff_Dt || '].');
            RETURN NULL;

        WHEN no_data_found THEN
            RETURN l_curve_analytics;

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error looking up prior CURVE_ANALYTICS row for curve_id[' || p_curve_id || '], eff_dt[' || p_eff_Dt || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');
            RETURN NULL;

    END; -- end of get_prior_analytics

    PROCEDURE maintain_term_val ( p_term_id curve_term_value.term_id%TYPE, p_snap_dt curve_term_value.snap_date_time%type, p_value curve_term_value.value%TYPE, p_rating curve_term_value.rating%TYPE, p_comp_lvl curve_term_value.comp_lvl%TYPE)
    IS
    BEGIN
        -- only update/insert if these have at least one value
        IF p_value    IS NOT NULL OR
           p_rating   IS NOT NULL OR
           p_comp_lvl IS NOT NULL
        THEN
            UPDATE
                curve_term_value
            SET
                UPD_TS   = SYSDATE,
                VALUE    = p_value,
                RATING   = p_rating,
                COMP_LVL = p_comp_lvl
            WHERE
                term_id        = p_term_id AND
                snap_date_time = p_snap_dt
            ;
            
            IF SQL%NOTFOUND THEN
                INSERT INTO curve_term_value
                    ( UPD_TS,
                      SNAP_DATE_TIME,
                      TERM_ID,
                      VALUE,
                      RATING,
                      COMP_LVL
                    )
                SELECT
                    SYSDATE,
                    p_snap_dt,
                    p_term_id,
                    p_value,
                    p_rating,
                    p_comp_lvl
                FROM dual
                WHERE NOT EXISTS (SELECT 1
                                  FROM curve_term_value c
                                  WHERE
                                      c.term_id        = p_term_id AND
                                      c.snap_date_time = p_snap_dt
                                   )
                ;
            END IF;
        END IF;

        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            dbms_output.put_line('**ERROR**- Curve Term Value already exists for term_id[' || p_term_id ||'], snap_date_time[' || p_snap_dt || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error inserting new CURVE_TERM row with term_id[' || p_term_id ||'], snap_date_time[' || p_snap_dt || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of maintain_term_val

    PROCEDURE maintain_curve_terms (p_type curve.curve_typ%TYPE, p_curve_id curve.curve_id%type, p_party_id party.party_id%TYPE, p_markit_sector c_markit_sector_curve%ROWTYPE, p_markit_issuer c_markit_issuer_curve%ROWTYPE)
    IS
        l_term_id      curve_term_value.term_id%TYPE;
        l_val_spread   curve_term_value.value%TYPE;
        l_val_rating   curve_term_value.rating%TYPE;
        l_val_comp_lvl curve_term_value.comp_lvl%TYPE;
        l_curr_dt      curve_term_value.snap_date_time%TYPE;          
  
    BEGIN
        --
        -- Loop through each TERM value and check if we need to get the next TERM_ID or not.
        FOR v_data IN
        ( SELECT '6M' term, 100 seq_no, 6 term_units, 'MONTH' term_units_typ FROM dual
          UNION ALL
          SELECT '1Y' term, 200 seq_no, 1 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '2Y' term, 300 seq_no, 2 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '3Y' term, 400 seq_no, 3 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '4Y' term, 500 seq_no, 4 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '5Y' term, 600 seq_no, 5 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '7Y' term, 700 seq_no, 7 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '10Y' term, 800 seq_no, 10 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '15Y' term, 900 seq_no, 15 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '20Y' term, 1000 seq_no, 20 term_units, 'YEAR' term_units_typ FROM dual
          UNION ALL
          SELECT '30Y' term, 1100 seq_no, 30 term_units, 'YEAR' term_units_typ FROM dual
        )

        LOOP
            l_term_id      := NULL;
            l_val_spread   := NULL;
            l_val_rating   := NULL;
            l_val_comp_lvl := NULL;
            l_curr_dt      := NULL;           
            
            IF p_type = c_curve_typ_sector THEN
                l_curr_dt := p_markit_sector.curr_dt;
                IF v_data.term = '6M' AND p_markit_sector.spread_6M IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_6M;
                    l_term_id    := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '1Y' AND p_markit_sector.spread_1Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_1Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '2Y' AND p_markit_sector.spread_2Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_2Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '3Y' AND p_markit_sector.spread_3Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_3Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '4Y' AND p_markit_sector.spread_4Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_4Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '5Y' AND p_markit_sector.spread_5Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_5Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '7Y' AND p_markit_sector.spread_7Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_7Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '10Y' AND p_markit_sector.spread_10Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_10Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '15Y' AND p_markit_sector.spread_15Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_15Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '20Y' AND p_markit_sector.spread_20Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_20Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '30Y' AND p_markit_sector.spread_30Y IS NOT NULL THEN
                    l_val_spread := p_markit_sector.spread_30Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
            ELSIF p_type = c_curve_typ_issuer THEN
                l_curr_dt := p_markit_issuer.curr_dt;
                IF v_data.term = '6M' AND
                   (
                    p_markit_issuer.spread_6M   IS NOT NULL OR
                    p_markit_issuer.rating_6M   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_6M IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_6M;
                    l_val_rating   := p_markit_issuer.rating_6M;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_6M;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '1Y' AND
                   (
                    p_markit_issuer.spread_1Y   IS NOT NULL OR
                    p_markit_issuer.rating_1Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_1Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_1Y;
                    l_val_rating   := p_markit_issuer.rating_1Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_1Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '2Y' AND
                   (
                    p_markit_issuer.spread_2Y   IS NOT NULL OR
                    p_markit_issuer.rating_2Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_2Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_2Y;
                    l_val_rating   := p_markit_issuer.rating_2Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_2Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '3Y' AND
                   (
                    p_markit_issuer.spread_3Y   IS NOT NULL OR
                    p_markit_issuer.rating_3Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_3Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_3Y;
                    l_val_rating   := p_markit_issuer.rating_3Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_3Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '4Y' AND
                   (
                    p_markit_issuer.spread_4Y   IS NOT NULL OR
                    p_markit_issuer.rating_4Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_4Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_4Y;
                    l_val_rating   := p_markit_issuer.rating_4Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_4Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '5Y' AND
                   (
                    p_markit_issuer.spread_5Y   IS NOT NULL OR
                    p_markit_issuer.rating_5Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_5Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_5Y;
                    l_val_rating   := p_markit_issuer.rating_5Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_5Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '7Y' AND
                   (
                    p_markit_issuer.spread_7Y   IS NOT NULL OR
                    p_markit_issuer.rating_7Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_7Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_7Y;
                    l_val_rating   := p_markit_issuer.rating_7Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_7Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '10Y' AND
                   (
                    p_markit_issuer.spread_10Y   IS NOT NULL OR
                    p_markit_issuer.rating_10Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_10Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_10Y;
                    l_val_rating   := p_markit_issuer.rating_10Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_10Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '15Y' AND
                   (
                    p_markit_issuer.spread_15Y   IS NOT NULL OR
                    p_markit_issuer.rating_15Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_15Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_15Y;
                    l_val_rating   := p_markit_issuer.rating_15Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_15Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '20Y' AND
                   (
                    p_markit_issuer.spread_20Y   IS NOT NULL OR
                    p_markit_issuer.rating_20Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_20Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_20Y;
                    l_val_rating   := p_markit_issuer.rating_20Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_20Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
                IF v_data.term = '30Y' AND
                   (
                    p_markit_issuer.spread_30Y   IS NOT NULL OR
                    p_markit_issuer.rating_30Y   IS NOT NULL OR
                    p_markit_issuer.comp_lvl_30Y IS NOT NULL
                   )
                THEN
                    l_val_spread   := p_markit_issuer.spread_30Y;
                    l_val_rating   := p_markit_issuer.rating_30Y;
                    l_val_comp_lvl := p_markit_issuer.comp_lvl_30Y;
                    l_term_id := get_term_id(p_curve_id, p_party_id, v_data.seq_no);
                    ins_curve_term(l_term_id, p_curve_id, v_data.seq_no, v_data.term_units, v_data.term_units_typ, l_term_id);
                END IF;
            END IF;
            
            -- variables being passed are set within one of the IF blocks above
            maintain_term_val(l_term_id, l_curr_dt, l_val_spread, l_val_rating, l_val_comp_lvl);
        END LOOP;
    END; -- end of maintain_curve_terms

    PROCEDURE maintain_curve_analytics (p_type curve.curve_typ%TYPE, p_curve_id curve.curve_id%type, p_markit_sector c_markit_sector_curve%ROWTYPE, p_markit_issuer c_markit_issuer_curve%ROWTYPE)
    IS
        l_curr_dt                  curve_analytics.eff_dt%TYPE;
        l_prior                    curve_analytics%ROWTYPE;
        l_recovery                 curve_analytics.RECOVERY%TYPE;
        l_recovery_chg_dt          curve_analytics.recovery_chg_dt%TYPE;
        l_interpolated_flg         curve_analytics.interpolated_flg%TYPE;
        l_interpolated_flg_chg_dt  curve_analytics.interpolated_flg_chg_dt%TYPE;
        l_comp_depth_5y            curve_analytics.comp_depth_5y%TYPE;
        l_comp_depth_5yr_chg_dt    curve_analytics.comp_depth_5yr_chg_dt%TYPE;
        l_comp_curve_rating        curve_analytics.comp_curve_rating%TYPE;
        l_comp_curve_rating_chg_dt curve_analytics.comp_curve_rating_chg_dt%TYPE;
        l_avg_rating               curve_analytics.avg_rating%TYPE;
        l_avg_rating_chg_dt        curve_analytics.avg_rating_chg_dt%TYPE;
        l_implied_rating           curve_analytics.implied_rating%TYPE;
        l_implied_rating_chg_dt    curve_analytics.implied_rating_chg_dt%TYPE;
        l_comp_lvl_recovery        curve_analytics.comp_lvl_recovery%TYPE;
        l_comp_lvl_recovery_chg_dt curve_analytics.comp_lvl_recovery_chg_dt%TYPE;
    BEGIN
    NULL;
        l_prior   := NULL;
        l_curr_dt := NULL;
        l_recovery                 := NULL;
        l_recovery_chg_dt          := NULL;
        l_interpolated_flg         := NULL;
        l_interpolated_flg_chg_dt  := NULL;
        l_comp_depth_5y            := NULL;
        l_comp_depth_5yr_chg_dt    := NULL;
        l_comp_curve_rating        := NULL;
        l_comp_curve_rating_chg_dt := NULL;
        l_avg_rating               := NULL;
        l_avg_rating_chg_dt        := NULL;
        l_implied_rating           := NULL;
        l_implied_rating_chg_dt    := NULL;
        l_comp_lvl_recovery        := NULL;
        l_comp_lvl_recovery_chg_dt := NULL;
        
        IF p_type = c_curve_typ_sector THEN
            l_curr_dt := p_markit_sector.curr_dt;
        ELSIF p_type = c_curve_typ_issuer then
            l_curr_dt := p_markit_issuer.curr_dt;
        END IF;
        
        l_prior  := get_prior_analytics (p_curve_id, l_curr_dt);
        
        IF p_type = c_curve_typ_sector THEN
            SELECT 
                p_markit_sector.RECOVERY,
                decode(nvl(to_number(to_char(p_markit_issuer.RECOVERY,'9999.9999999')),-9999), nvl(l_prior.RECOVERY,-9999), nvl(l_prior.recovery_chg_dt, l_curr_dt), l_curr_dt),
                p_markit_sector.interpolated_flg,
                decode(nvl(p_markit_sector.interpolated_flg,'xQx'), nvl(l_prior.interpolated_flg,'xQx'), nvl(l_prior.interpolated_flg_chg_dt, l_curr_dt), l_curr_dt)
            INTO
                l_recovery,
                l_recovery_chg_dt,
                l_interpolated_flg,
                l_interpolated_flg_chg_dt
            FROM dual
            ;
        ELSIF p_type = c_curve_typ_issuer then
            SELECT 
                p_markit_issuer.RECOVERY,
                decode(nvl(to_number(to_char(p_markit_issuer.RECOVERY,'9999.9999999')),-9999), nvl(l_prior.RECOVERY,-9999), nvl(l_prior.recovery_chg_dt, l_curr_dt), l_curr_dt),
                p_markit_issuer.composite_depth_5y,
                decode(nvl(p_markit_issuer.composite_depth_5y,-9999), nvl(l_prior.comp_depth_5y,-9999), nvl(l_prior.comp_depth_5yr_chg_dt, l_curr_dt), l_curr_dt),
                p_markit_issuer.composite_curve_rating,
                decode(nvl(p_markit_issuer.composite_curve_rating,'xQx'), nvl(l_prior.comp_curve_rating,'xQx'), nvl(l_prior.comp_curve_rating_chg_dt, l_curr_dt), l_curr_dt),
                p_markit_issuer.av_rating,
                decode(nvl(p_markit_issuer.av_rating,'xQx'), nvl(l_prior.avg_rating,'xQx'), nvl(l_prior.avg_rating_chg_dt, l_curr_dt), l_curr_dt),
                p_markit_issuer.implied_rating,
                decode(nvl(p_markit_issuer.implied_rating,'xQx'), nvl(l_prior.implied_rating,'xQx'), nvl(l_prior.implied_rating_chg_dt, l_curr_dt), l_curr_dt),
                p_markit_issuer.comp_lvl_recovery,
                decode(nvl(p_markit_issuer.comp_lvl_recovery,'xQx'), nvl(l_prior.comp_lvl_recovery,'xQx'), nvl(l_prior.comp_lvl_recovery_chg_dt, l_curr_dt), l_curr_dt)
             INTO
                l_recovery,
                l_recovery_chg_dt,
                l_comp_depth_5y,
                l_comp_depth_5yr_chg_dt,
                l_comp_curve_rating,
                l_comp_curve_rating_chg_dt,
                l_avg_rating,
                l_avg_rating_chg_dt,
                l_implied_rating,
                l_implied_rating_chg_dt,
                l_comp_lvl_recovery,
                l_comp_lvl_recovery_chg_dt
            FROM dual
            ;
        END IF;
        
        UPDATE
            curve_analytics ca
        SET
            ca.RECOVERY                 = l_recovery,
            ca.recovery_chg_dt          = l_recovery_chg_dt,
            ca.interpolated_flg         = l_interpolated_flg,
            ca.interpolated_flg_chg_dt  = l_interpolated_flg_chg_dt,
            ca.comp_depth_5y            = l_comp_depth_5y,
            ca.comp_depth_5yr_chg_dt    = l_comp_depth_5yr_chg_dt,
            ca.comp_curve_rating        = l_comp_curve_rating,
            ca.comp_curve_rating_chg_dt = l_comp_curve_rating_chg_dt,
            ca.avg_rating               = l_avg_rating,
            ca.avg_rating_chg_dt        = l_avg_rating_chg_dt,
            ca.implied_rating           = l_implied_rating,
            ca.implied_rating_chg_dt    = l_implied_rating_chg_dt,
            ca.comp_lvl_recovery        = l_comp_lvl_recovery,
            ca.comp_lvl_recovery_chg_dt = l_comp_lvl_recovery_chg_dt
        WHERE 
            ca.curve_id = p_curve_id AND
            ca.eff_dt   = l_curr_dt
        ;
       
        IF SQL%NOTFOUND  AND
            (
            nvl(l_prior.RECOVERY, -9999) != nvl(l_recovery, -9999) OR
            nvl(l_prior.interpolated_flg, 'xQx') != nvl(l_interpolated_flg, 'xQx') OR
            nvl(l_prior.comp_depth_5y, -9999) != nvl(l_comp_depth_5y, -9999) OR
            nvl(l_prior.comp_curve_rating, 'xQx') != nvl(l_comp_curve_rating, 'xQx') OR
            nvl(l_prior.avg_rating, 'xQx') != nvl(l_avg_rating, 'xQx') OR
            nvl(l_prior.implied_rating, 'xQx') != nvl(l_implied_rating, 'xQx') OR
            nvl(l_prior.comp_lvl_recovery, 'xQx') != nvl(l_comp_lvl_recovery, 'xQx')
            )
        THEN
       
            INSERT INTO curve_analytics
            (
                CURVE_ID,
                EFF_DT,
                RECOVERY,
                RECOVERY_CHG_DT,
                INTERPOLATED_FLG,
                INTERPOLATED_FLG_CHG_DT,
                COMP_DEPTH_5Y,
                COMP_DEPTH_5YR_CHG_DT,
                COMP_CURVE_RATING,
                COMP_CURVE_RATING_CHG_DT,
                AVG_RATING,
                AVG_RATING_CHG_DT,
                IMPLIED_RATING,
                IMPLIED_RATING_CHG_DT,
                COMP_LVL_RECOVERY,
                COMP_LVL_RECOVERY_CHG_DT
            )
            SELECT
                p_curve_id,
                l_curr_dt,
                l_recovery,
                l_recovery_chg_dt,
                l_interpolated_flg,
                l_interpolated_flg_chg_dt,
                l_comp_depth_5y,
                l_comp_depth_5yr_chg_dt,
                l_comp_curve_rating,
                l_comp_curve_rating_chg_dt,
                l_avg_rating,
                l_avg_rating_chg_dt,
                l_implied_rating,
                l_implied_rating_chg_dt,
                l_comp_lvl_recovery,
                l_comp_lvl_recovery_chg_dt
            FROM dual
            WHERE NOT EXISTS (SELECT 1
                              FROM curve_analytics ca
                              WHERE
                                  ca.curve_id = p_curve_id AND
                                  ca.eff_dt   = l_curr_dt
                              )
            ;
       
        END IF;
       
        -- update future rows in case prior eff_dt was modified
        -- call proc to loop through each future row
        -- where at least one of the change date is less than or equeal to l_curr_dt
        FOR v_data IN
        (SELECT *
         FROM curve_analytics caf
         WHERE 
             caf.curve_id = p_curve_id AND
             caf.eff_dt   > l_curr_dt
         ORDER BY caf.eff_dt
        )
        
        LOOP
            l_prior  := get_prior_analytics (p_curve_id, v_data.eff_dt);
            
            SELECT 
                CASE WHEN nvl(v_data.RECOVERY,-9999) != nvl(l_prior.RECOVERY,-9999) AND nvl(v_data.recovery_chg_dt, v_data.eff_dt) < nvl(l_prior.recovery_chg_dt, v_data.eff_dt)
                     THEN l_prior.RECOVERY ELSE v_data.RECOVERY               
                END,
                CASE WHEN nvl(v_data.recovery_chg_dt, v_data.eff_dt) < nvl(l_prior.recovery_chg_dt, v_data.eff_dt)
                     THEN l_prior.recovery_chg_dt ELSE v_data.eff_dt               
                END,
                CASE WHEN nvl(v_data.interpolated_flg,'xQx') != nvl(l_prior.interpolated_flg,'xQx') AND nvl(v_data.interpolated_flg_chg_dt, v_data.eff_dt) < nvl(l_prior.interpolated_flg_chg_dt, v_data.eff_dt)
                     THEN l_prior.interpolated_flg ELSE v_data.interpolated_flg               
                END,
                CASE WHEN nvl(v_data.interpolated_flg_chg_dt, v_data.eff_dt) < nvl(l_prior.interpolated_flg_chg_dt, v_data.eff_dt)
                     THEN l_prior.interpolated_flg_chg_dt ELSE v_data.eff_dt               
                END,
                CASE WHEN nvl(v_data.comp_depth_5y,-9999) != nvl(l_prior.comp_depth_5y,-9999) AND nvl(v_data.comp_depth_5yr_chg_dt, v_data.eff_dt) < nvl(l_prior.comp_depth_5yr_chg_dt, v_data.eff_dt)
                     THEN l_prior.comp_depth_5y ELSE v_data.comp_depth_5y               
                END,
                CASE WHEN nvl(v_data.comp_depth_5yr_chg_dt, v_data.eff_dt) < nvl(l_prior.comp_depth_5yr_chg_dt, v_data.eff_dt)
                     THEN l_prior.comp_depth_5yr_chg_dt ELSE v_data.eff_dt               
                END,
                CASE WHEN nvl(v_data.comp_curve_rating,'xQx') != nvl(l_prior.comp_curve_rating,'xQx') AND nvl(v_data.comp_curve_rating_chg_dt, v_data.eff_dt) < nvl(l_prior.comp_curve_rating_chg_dt, v_data.eff_dt)
                     THEN l_prior.comp_curve_rating ELSE v_data.comp_curve_rating               
                END,
                CASE WHEN nvl(v_data.comp_curve_rating_chg_dt, v_data.eff_dt) < nvl(l_prior.comp_curve_rating_chg_dt, v_data.eff_dt)
                     THEN l_prior.comp_curve_rating_chg_dt ELSE v_data.eff_dt               
                END,
                CASE WHEN nvl(v_data.avg_rating,'xQx') != nvl(l_prior.avg_rating,'xQx') AND nvl(v_data.avg_rating_chg_dt, v_data.eff_dt) < nvl(l_prior.avg_rating_chg_dt, v_data.eff_dt)
                     THEN l_prior.avg_rating ELSE v_data.avg_rating               
                END,
                CASE WHEN nvl(v_data.avg_rating_chg_dt, v_data.eff_dt) < nvl(l_prior.avg_rating_chg_dt, v_data.eff_dt)
                     THEN l_prior.avg_rating_chg_dt ELSE v_data.eff_dt               
                END,
                CASE WHEN nvl(v_data.implied_rating,'xQx') != nvl(l_prior.implied_rating,'xQx') AND nvl(v_data.implied_rating_chg_dt, v_data.eff_dt) < nvl(l_prior.implied_rating_chg_dt, v_data.eff_dt)
                     THEN l_prior.implied_rating ELSE v_data.implied_rating               
                END,
                CASE WHEN nvl(v_data.implied_rating_chg_dt, v_data.eff_dt) < nvl(l_prior.implied_rating_chg_dt, v_data.eff_dt)
                     THEN l_prior.implied_rating_chg_dt ELSE v_data.eff_dt               
                END,
                CASE WHEN nvl(v_data.comp_lvl_recovery,'xQx') != nvl(l_prior.comp_lvl_recovery,'xQx') AND nvl(v_data.comp_lvl_recovery_chg_dt, v_data.eff_dt) < nvl(l_prior.comp_lvl_recovery_chg_dt, v_data.eff_dt)
                     THEN l_prior.comp_lvl_recovery ELSE v_data.comp_lvl_recovery               
                END,
                CASE WHEN nvl(v_data.comp_lvl_recovery_chg_dt, v_data.eff_dt) < nvl(l_prior.comp_lvl_recovery_chg_dt, v_data.eff_dt)
                     THEN l_prior.comp_lvl_recovery_chg_dt ELSE v_data.eff_dt               
                END
             INTO
                l_recovery,
                l_recovery_chg_dt,
                l_interpolated_flg,
                l_interpolated_flg_chg_dt,
                l_comp_depth_5y,
                l_comp_depth_5yr_chg_dt,
                l_comp_curve_rating,
                l_comp_curve_rating_chg_dt,
                l_avg_rating,
                l_avg_rating_chg_dt,
                l_implied_rating,
                l_implied_rating_chg_dt,
                l_comp_lvl_recovery,
                l_comp_lvl_recovery_chg_dt
            FROM dual
            ;
            
            UPDATE
                curve_analytics ca
            SET
                ca.RECOVERY                 = l_recovery,
                ca.recovery_chg_dt          = l_recovery_chg_dt,
                ca.interpolated_flg         = l_interpolated_flg,
                ca.interpolated_flg_chg_dt  = l_interpolated_flg_chg_dt,
                ca.comp_depth_5y            = l_comp_depth_5y,
                ca.comp_depth_5yr_chg_dt    = l_comp_depth_5yr_chg_dt,
                ca.comp_curve_rating        = l_comp_curve_rating,
                ca.comp_curve_rating_chg_dt = l_comp_curve_rating_chg_dt,
                ca.avg_rating               = l_avg_rating,
                ca.avg_rating_chg_dt        = l_avg_rating_chg_dt,
                ca.implied_rating           = l_implied_rating,
                ca.implied_rating_chg_dt    = l_implied_rating_chg_dt,
                ca.comp_lvl_recovery        = l_comp_lvl_recovery,
                ca.comp_lvl_recovery_chg_dt = l_comp_lvl_recovery_chg_dt
            WHERE 
                ca.curve_id = p_curve_id AND
                ca.eff_dt   = v_data.eff_dt
            ;
        END LOOP;

        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error maintaining analytic rows for curve_id[' || p_curve_id || '], eff_dt[' || l_curr_dt || '].');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of maintain_curve_analytics

    PROCEDURE email_error (p_subject VARCHAR2, p_text VARCHAR2)
    IS
        l_addr_curve_data      VARCHAR2(100);
        l_db                   VARCHAR2(20);
        l_email_flg            CHAR(1);
        g_maicon               UTL_SMTP.connection;
        
    BEGIN
   
        SELECT
              UPPER(CSM_COMMON.get_global_name('E'))
        INTO
            l_db
        FROM
            dual
        ;
        
        SELECT
            param_value
        INTO
            l_email_flg
        FROM 
            param_tab
        WHERE 
            program_id   =  'MARKIT_CRV'   AND
            param_key    =  'EMAIL_FLG';

        SELECT
            param_value
        INTO
            l_addr_curve_data
        FROM 
            param_tab
        WHERE 
            program_id   =  'MARKIT_CRV'   AND
            param_key    =  'EMAIL_ADDRESS1';
            

        IF (l_email_flg = 'Y'  AND LENGTH(p_text) > 0) THEN
        
            g_maicon := UTL_SMTP.open_connection('localhost');
        
            UTL_SMTP.helo(g_maicon,'localhost');   
            UTL_SMTP.mail(g_maicon, l_addr_curve_data);
            UTL_SMTP.rcpt(g_maicon, l_addr_curve_data);
            
            --
            --< create message text >--
            --
        
            UTL_SMTP.open_data(g_maicon);
        
            UTL_SMTP.write_data(g_maicon, 'From: "'
                                           || l_addr_curve_data || '"<' || l_addr_curve_data || '>' 
                                           || utl_tcp.crlf);
        
        
            UTL_SMTP.write_data(g_maicon, 'To: "'
                                           || l_addr_curve_data || '"<' || l_addr_curve_data || '>' 
                                           || utl_tcp.crlf);
        
            UTL_SMTP.write_data(g_maicon, 'Subject: ' || l_db || ': ' ||  p_subject || utl_tcp.crlf);
        
            UTL_SMTP.write_data(g_maicon, p_text);
        
            UTL_SMTP.close_data(g_maicon);
        
            UTL_SMTP.quit(g_maicon);
        
        END IF;

        EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('**WARNING**- Email not sent. Missing PARAM_TAB values for program_id MARKIT_CRV.');
    END;
    
    /************************************************************************
    *
    *   retire_sector_curve_version: Published
    *
    *   This procedure is to retire existing sector curves from Markit
    *
    *   p_inRtdVsn_Dt       Date that Version is marked to be retired
    *   p_inRtdVsn_Id       Version marked on retired Sector curves
    *
    ************************************************************************/
    PROCEDURE retire_sector_curve_version (
        p_inRtdVsn_Dt       IN       DATE,
        p_inRtdVsn_Id       IN       NUMBER
    )
    IS
    
        l_version          NUMBER := NULL;
        
    BEGIN
      
        IF p_inRtdVsn_Id <> 5 THEN
            l_version := p_inRtdVsn_Id;
        END IF;
        
        UPDATE curve
           SET version = p_inRtdVsn_Id,
               inactive_dt = p_inRtdVsn_Dt,
               comments = c_curve_retire_comments              
         WHERE curve_typ = c_curve_typ_sector   AND
               NVL(version, 0) = NVL(l_version, 0)
        ;

        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('**ERROR**- Error retiring existing sector CURVE rows to Version: ' || p_inRtdVsn_Id ||'.');
            dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of retire_sector_curve_version
    
    
    /************************************************************************
    *
    *   maintain_sector_curve_version: PUBLISHED
    *
    *   This procedure is the entry point to maintain sector curve versions 
    *   from Markit
    *
    *   p_inRtdVsn_Dt       Date that Version is marked to be retired
    *   p_inRtdVsn_Id       Version to be retired on Sector curves
    *   p_inNewVsn_Id       Version to be active on Sector curves
    *
    ************************************************************************/
    PROCEDURE maintain_sector_curve_version (
        p_inRtdVsn_Dt       IN       DATE,
        p_inRtdVsn_Id       IN       NUMBER,
        p_inNewVsn_Id       IN       NUMBER
    )
    IS
        l_curve_id          curve.curve_id%TYPE;
        l_version           NUMBER := NULL;

    BEGIN
        
        --
        -- Enter the version from table CURVE to be retired. 
        -- Currently the version is NULL
        -- 
        IF p_inRtdVsn_Id <> 5 THEN
            l_version := p_inRtdVsn_Id;
        END IF;
        
        IF c_markit_sr_curve_vsn%ISOPEN THEN
            CLOSE c_markit_sr_curve_vsn;
        END IF;
        OPEN c_markit_sr_curve_vsn (l_version);

            LOOP
              
                FETCH c_markit_sr_curve_vsn INTO g_markit_sr_data_vsn;
                EXIT WHEN c_markit_sr_curve_vsn%NOTFOUND;
                
                l_curve_id := get_curve_id (
                                  c_curve_typ_sector, 
                                  g_markit_sr_data_vsn.party_id, 
                                  g_markit_sr_data_vsn.curve_nm, 
                                  c_sector_version_id
                              );
                
                ins_curve_sector (
                    l_curve_id, 
                    g_markit_sr_data_vsn.party_id, 
                    g_markit_sr_data_vsn.rating, 
                    g_markit_sr_data_vsn.curve_nm, 
                    p_inNewVsn_Id
                );                
           
            END LOOP;

         CLOSE c_markit_sr_curve_vsn;
         
         retire_sector_curve_version (p_inRtdVsn_Dt, p_inRtdVsn_Id);
         
         COMMIT;

         EXCEPTION
             WHEN OTHERS THEN
                 ROLLBACK;
                 dbms_output.put_line('**ERROR**- MAINTAIN_MARKIT_CURVES: Error maintaining sector curve versions for curve id:['|| l_curve_id ||'].');
                 dbms_output.put_line('**SQLERRM:[' || substr(SQLERRM,1,240) || ']');

    END; -- end of maintain_sector_curve_version

    /************************************************************************
    *
    *   get_catlg_item_low_cd: PUBLISHED
    *
    *   This function returns the low code value for a catlg item
    *
    *   p_inCatlg_item_id      Catlg Item ID
    *
    ************************************************************************/
    FUNCTION get_catlg_item_low_cd (
        p_inCatlg_item_id       IN       catlg_item.catlg_item_id%TYPE
    )
    RETURN catlg_item.low_lv_cd_value%TYPE
    IS
      v_catlg_item_low_cd catlg_item.low_lv_cd_value%TYPE;
    BEGIN
      IF p_inCatlg_item_id IS NULL THEN
        RETURN NULL;
      ELSE
        SELECT low_lv_cd_value
          INTO v_catlg_item_low_cd
          FROM catlg_item
         WHERE catlg_item_id = p_inCatlg_item_id;
      END IF;
      
      RETURN v_catlg_item_low_cd;
      
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
    END get_catlg_item_low_cd;
    
    /************************************************************************
    *
    *   get_catlg_item_id_cd: PUBLISHED
    *
    *   This function returns the catlg item id for a catlg item low cd
    *
    *   p_inCatlg_item_low_cd      Catlg Item Low Cd
    *   p_inCatlg_id               Catlg ID
    *
    ************************************************************************/
    FUNCTION get_catlg_item_id_cd (
        p_inCatlg_item_low_cd       IN       catlg_item.low_lv_cd_value%TYPE,
        p_inCatlg_id                IN       catlg_item.catlg_id%TYPE
    )
    RETURN catlg_item.catlg_item_id%TYPE
    IS
      v_catlg_item_id catlg_item.catlg_item_id%TYPE;
    BEGIN
      IF p_inCatlg_item_low_cd IS NULL THEN
        RETURN NULL;
      ELSE
        SELECT catlg_item_id
          INTO v_catlg_item_id
          FROM catlg_item
         WHERE catlg_id        = p_inCatlg_id
           AND low_lv_cd_value = p_inCatlg_item_low_cd;
      END IF;
      
      RETURN v_catlg_item_id;
      
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;  
    END get_catlg_item_id_cd;

END MAINTAIN_MARKIT_CURVES_PKG;
/
