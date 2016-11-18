CREATE OR REPLACE PACKAGE MAINTAIN_MARKIT_CURVES_PKG AS
-----------------------------------------------------------------------------
--                                                                         --
-- Author    : Tom Kampersal                                               --
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
   $Revision: bloomberg_fenge/3 $
   $Modtime:   13 Sep 2005 11:11:14  $
   $Log: maintain_markit_curves_hdr.sql $
   Revision bloomberg_fenge/3 2010/09/14 18:01:28 fenge
   	For TD 4432 - Maintain Markit Sector Curve version (retire and renew)
   
   Revision bloomberg_fenge/2 2010/09/13 14:52:42 fenge
   	For TD 4432 - Add version control logic for Markit sector curve
   
   Revision bloomberg_WIP_kampeta/7 2006/11/03 20:27:06 kampeta
   	Modified how issuer linking is done. Added use of sequences.
   
   Revision bloomberg_WIP_kampeta/6 2006/11/02 21:13:55 kampeta
   	removed Initialize paramter. This will be done using seperate scripts
   
   Revision bloomberg_WIP_kampeta/5 2006/11/01 17:57:05 kampeta
   	Added initialize flag to use when we load history or initialize curve tables
   
   Revision bloomberg_WIP_kampeta/4 2006/10/27 19:58:34 kampeta
   	Added Investment Entity Linking logic (commented out until privileges granted)
   
   Revision bloomberg_WIP_kampeta/3 2006/10/26 19:20:54 kampeta
   	Uncommented out interpolated flag logic after column was added
   
   Revision bloomberg_WIP_kampeta/2 2006/10/25 19:59:30 kampeta
   	Latest changes for analytics


*/


    --
    -- 10/17/2006 - The following constants SHOULD NOT be modified!!!! The logic
    --              uses the curve_nm field to find a specific row.
    --              A seperate script would be necessary for
    --              data clean up purposes if that is the case
    --
    c_curve_nm_sep                  CONSTANT VARCHAR2(20) := ' - ';
    c_curve_nm_suffix_sector        CONSTANT VARCHAR2(20) := ' Sector Curve';
    c_curve_nm_suffix_issuer        CONSTANT VARCHAR2(20) := '';
    c_curve_retire_comments         CONSTANT VARCHAR2(50) := 'Archived Curve Version. A Newer Version Exists.';
    --
    --
    --
    c_curve_typ_sector              CONSTANT VARCHAR2(20) := 'SIDD';
    c_curve_typ_issuer              CONSTANT VARCHAR2(20) := 'ISSUER';
    c_source_typ_input              CONSTANT VARCHAR2(20) := 'INPUT';
    c_frequency_daily               CONSTANT VARCHAR2(20) := 'DAILY';
    c_curve_nm_sector               CONSTANT VARCHAR2(20) := 'Sector Curve';
    c_start_curve_id_sector         CONSTANT NUMBER       := 10000;
    c_start_curve_id_issuer         CONSTANT NUMBER       := 11000;
    c_start_curve_term_id           CONSTANT NUMBER       := 100000;
    c_sector_version_id             CONSTANT NUMBER       := 7;

    c_party_typ                     CONSTANT VARCHAR2(20) := 'DATA_VENDOR';
    c_subtyp_id_char                CONSTANT VARCHAR2(20) := 'MARKIT';

    c_catlg_id_ICB                  CONSTANT catlg_item.catlg_id%TYPE := 272;
    c_catlg_id_Region               CONSTANT catlg_item.catlg_id%TYPE := 287;

    c_attr_id_ICB                   CONSTANT ref_attr_value.attr_id%TYPE := 29;
    c_attr_id_Region                CONSTANT ref_attr_value.attr_id%TYPE := 4;
    c_attr_id_country               CONSTANT ref_attr_value.attr_id%TYPE := 9;
    c_srce_cd_ICB                   CONSTANT ref_attr_value.srce_cd%TYPE := 'ICB';
    c_srce_cd_markit                CONSTANT ref_attr_value.srce_cd%TYPE := 'MARKIT';

    CURSOR c_markit_sector_curve IS
        SELECT
            sc.type, sc.curr_dt, sc.prev_dt, nvl(sc.industry_name, 'All') industry_name,
            sc.rating, sc.interpolated_flg, sc.recovery,
            sc.spread_6m, sc.spread_1y, sc.spread_2y, sc.spread_3y,
            sc.spread_4y, sc.spread_5y, sc.spread_7y, sc.spread_10y,
            sc.spread_15y, sc.spread_20y, sc.spread_30y
        FROM markit_sector_curve sc
        ;
        
    CURSOR c_markit_sr_curve_vsn (p_current_version NUMBER) IS
        SELECT
            c.curve_nm, 
            c.comments, 
            c.party_id,
            c.rating
        FROM curve c
        WHERE 
            c.curve_typ = c_curve_typ_sector 
            AND NVL(version, 0) = NVL(p_current_version, 0)
            ORDER BY c.curve_nm
        ;

    g_markit_sector_data        c_markit_sector_curve%ROWTYPE;        -- cursor for markit sector curves rows

    g_markit_sr_data_vsn        c_markit_sr_curve_vsn%ROWTYPE;        -- cursor to return 84 rows of markit sector curves types

    CURSOR c_markit_issuer_curve IS
        SELECT
            ic.curr_dt, ic.ticker, ic.short_nm, ic.red,
            ic.tier, ic.ccy, ic.doc_clause, ic.contributor,
            ic.spread_6m, ic.spread_1y, ic.spread_2y, ic.spread_3y,
            ic.spread_4y, ic.spread_5y, ic.spread_7y, ic.spread_10y,
            ic.spread_15y, ic.spread_20y, ic.spread_30y,
            ic.recovery,
            ic.rating_6m, ic.rating_1y, ic.rating_2y, ic.rating_3y,
            ic.rating_4y, ic.rating_5y, ic.rating_7y, ic.rating_10y,
            ic.rating_15y, ic.rating_20y, ic.rating_30y,
            ic.composite_curve_rating, ic.composite_depth_5y,
            nvl(ic.sector, 'All') sector, ic.region, ic.country, ic.av_rating, ic.implied_rating,
            ic.comp_lvl_6m, ic.comp_lvl_1y, ic.comp_lvl_2y, ic.comp_lvl_3y,
            ic.comp_lvl_4y, ic.comp_lvl_5y, ic.comp_lvl_7y, ic.comp_lvl_10y,
            ic.comp_lvl_15y, ic.comp_lvl_20y, ic.comp_lvl_30y,
            ic.comp_lvl_recovery
        FROM markit_issuer_curve ic
        ;

    g_markit_issuer_data        c_markit_issuer_curve%ROWTYPE;        -- cursor for markit issuer curves rows

    PROCEDURE maintain_markit_curves (p_type curve.curve_typ%TYPE);
    PROCEDURE maintain_sector_curve (p_markit_sector c_markit_sector_curve%ROWTYPE, p_party_id party.party_id%TYPE);
    PROCEDURE maintain_issuer_curve (p_markit_issuer c_markit_issuer_curve%ROWTYPE, p_party_id party.party_id%TYPE);
    FUNCTION get_party_id ( p_party_typ party.party_typ%TYPE, p_subtyp_id_char party.subtyp_id_char%TYPE )
    RETURN party.party_id%TYPE;
    FUNCTION get_next_curve_id ( p_type curve.curve_typ%TYPE, p_party_id party.party_id%TYPE )
    RETURN curve.curve_id%TYPE;
    FUNCTION get_curve_id (p_type curve.curve_typ%TYPE, p_party_id party.party_id%TYPE, p_curve_nm curve.curve_nm%TYPE, p_curve_vsn curve.version%TYPE)
    RETURN curve.curve_id%TYPE;
    FUNCTION get_catlg_item_id ( p_srce_cd ref_attr_value.srce_cd%TYPE, p_attr_id ref_attr_value.attr_id%TYPE, p_catlg_id catlg_item.catlg_id%TYPE, p_short_dsc ref_attr_value.short_dsc%TYPE, p_Mtge VARCHAR2 DEFAULT NULL)
    RETURN curve_catlg_tbl.catlg_item_id%TYPE;
    FUNCTION get_country_cd ( p_country ref_attr_value.short_dsc%TYPE )
    RETURN curve.cntry_cd%TYPE;
    FUNCTION get_next_term_id ( p_party_id party.party_id%TYPE )
    RETURN curve_term.term_id%TYPE;
    FUNCTION get_term_id (p_curve_id curve.curve_id%type, p_party_id party.party_id%TYPE, p_seq_no curve_term.seq_no%TYPE)
    RETURN curve_term.term_id%TYPE;
    PROCEDURE maintain_issuer_link (p_curve_id curve.curve_id%type, p_red g_markit_issuer_data.red%TYPE);
    
    PROCEDURE ins_curve_sector (
        p_curve_id        IN        curve.curve_id%type, 
        p_party_id        IN        party.party_id%TYPE, 
        p_rating          IN        curve.rating%type, 
        p_curve_nm        IN        curve.curve_nm%TYPE, 
        p_version         IN        curve.version%TYPE
    );
    
    PROCEDURE ins_curve_issuer (p_curve_id curve.curve_id%type, p_party_id party.party_id%TYPE, p_markit_issuer c_markit_issuer_curve%ROWTYPE, p_curve_nm curve.curve_nm%TYPE, p_country curve.cntry_cd%TYPE);
    PROCEDURE ins_curve_catlg_tbl (p_curve_id curve.curve_id%type, p_catlg_id curve_catlg_tbl.catlg_id%TYPE, p_catlg_item_id curve_catlg_tbl.catlg_item_id%TYPE);
    PROCEDURE ins_curve_term ( p_term_id curve_term.term_id%TYPE, p_curve_id curve.curve_id%type, p_seq_no curve_term.seq_no%TYPE, p_term_units curve_term.term_units%TYPE, p_term_units_typ curve_term.term_units_typ%TYPE, p_term_sym curve_term.term_symbol%TYPE);
    FUNCTION get_prior_analytics (p_curve_id curve.curve_id%type, p_eff_dt curve_analytics.eff_dt%TYPE)
    RETURN curve_analytics%ROWTYPE;
    PROCEDURE maintain_curve_terms (p_type curve.curve_typ%TYPE, p_curve_id curve.curve_id%type, p_party_id party.party_id%TYPE, p_markit_sector c_markit_sector_curve%ROWTYPE, p_markit_issuer c_markit_issuer_curve%ROWTYPE);
    PROCEDURE maintain_term_val ( p_term_id curve_term_value.term_id%TYPE, p_snap_dt curve_term_value.snap_date_time%type, p_value curve_term_value.value%TYPE, p_rating curve_term_value.rating%TYPE, p_comp_lvl curve_term_value.comp_lvl%TYPE);
    PROCEDURE maintain_curve_analytics (p_type curve.curve_typ%TYPE, p_curve_id curve.curve_id%type, p_markit_sector c_markit_sector_curve%ROWTYPE, p_markit_issuer c_markit_issuer_curve%ROWTYPE);
    PROCEDURE email_error (p_subject VARCHAR2, p_text VARCHAR2);
    
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
    );
         
    /************************************************************************
    *
    *   maintain_sector_curve_version: PUBLISHED
    *
    *   This procedure is the entry point to maintain Markit sector curve  
    *   versions
    *
    *   p_inRtdVsn_Dt       Date that Version is marked to be retired
    *   p_inOldVsn_Id       Version marked on retired Sector curves
    *   p_inNewVsn_Id       Version marked on active Sector curves
    *
    ************************************************************************/
    PROCEDURE maintain_sector_curve_version (
        p_inRtdVsn_Dt       IN       DATE,
        p_inRtdVsn_Id       IN       NUMBER,
        p_inNewVsn_Id       IN       NUMBER
    );

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
    RETURN catlg_item.low_lv_cd_value%TYPE;
    
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
    RETURN catlg_item.catlg_item_id%TYPE;

END MAINTAIN_MARKIT_CURVES_PKG;
/
