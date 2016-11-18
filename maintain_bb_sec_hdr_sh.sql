PROMPT Creating package MAINTAIN_BB_SEC_PKG, please wait...  

CREATE OR REPLACE PACKAGE WMCVNDR.MAINTAIN_BB_SEC_PKG
IS
--
/* PACKAGE HEADER PVCS $Revision: bloomberg_WIP_deonp/7 $ $Modtime:   Sep 29 2005 14:52:04  $ */
-----------------------------------------------------------------------------
--                                                                         --
-- Author    : Muliple                                                     --
-- Product   : Bloomberg Data Interfaces                                   --
-- Package   : MAINTAIN_BB_SEC_PKG                                         --
-- Date      : 20-Jun-2002                                                 --
-- Copyright : Wellington Management Company, LLP 2001-2003                --
--                                                                         --
-----------------------------------------------------------------------------
--                                                                         --
-- Description : This package contains routines to assemble additional     --
--               Bloomberg data fields                                     --
-- Comments    :                                                           --
--                                                                         --
--                                                                         --
-- Contains    : See below                                                 --
--                                                                         --
--                                                                         --
-----------------------------------------------------------------------------
--                                                                         --
-- Revisions:                                                              --
--                                                                         --
/*

   $Revision: bloomberg_WIP_deonp/7 $
   $Modtime:   Sep 29 2005 14:52:04  $
   $Log: maintain_bb_sec_hdr_sh.sql $
   Revision bloomberg_WIP_deonp/7 2011/08/10 19:52:12 deonp
     TD 2739 - quasi sovg

   Revision bloomberg_WIP_deonp/6 2011/08/09 18:40:18 deonp
     TD 2739 to test

   Revision bloomberg_WIP_deonp/5 2011/05/27 18:18:27 deonp
     td 4918 - put back lockout expiration

   Revision bloomberg_WIP_deonp/4 2011/05/27 18:09:57 deonp
     td 4918 - removed lockout expiration

   Revision bloomberg_WIP_deonp/3 2011/05/25 12:46:39 deonp
     TD 4918 - paydn changes

   Revision bloomberg_khetrm/1 2011/05/20 16:17:07 khetrm
     5082:06/17:khetrm:Added maintain_lockup_expiration_dt to load lockup expiration date from CSFB Feed.

   Revision bloomberg_WIP_deonp/2 2011/05/11 17:01:06 deonp
     TD 4918 - paydown loss changes

   Revision bloomberg_WIP_deonp/1 2011/05/09 20:15:42 deonp
     TD 4981 - Paydown Loass changes

   Revision bloomberg_wadeks/7 2011/03/31 08:56:23 wadeks
     TD4861: DBRS ratings at the security level


   Revision bloomberg_wadeks/5 2011/03/10 12:31:02 wadeks
     TD4861: DBRS ratings at the security level

   Revision bloomberg_wadeks/4 2010/11/10 06:40:36 wadeks
     TD4595:Modified data types for bb_cntry_of_ : wadeks:11-NOV-2010

   Revision bloomberg_wadeks/3 2010/10/18 09:10:07 wadeks
     TD4595:BuryeG:Move to test:Added code for 2 new fields requested from bloomberg.

   Revision bloomberg_wadeks/2 2010/10/18 08:43:00 wadeks
     TD4595:BuryeG:Move to test:Added code for 2 new fields requested from bloomberg.

   Revision bloomberg_20100305_WIP_buryeg/2 2010/10/12 15:07:14 buryeg
     TD4595:BuryeG:Code revert.Will put back code when data entered in attribute_definition table

   Revision bloomberg_20100305_WIP_buryeg/1 2010/10/12 05:35:59 buryeg
     TD4595:BuryeG:Move to test:Added code for 2 new fields requested from bloomberg.

   Revision bloomberg_wadeks/1 2010/06/30 08:36:51 wadeks
     TD4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 30-JUN-2010.

   Revision Bloomberg_WIP_hsus/2 2009/11/16 23:31:05 hsus
     Increased char length of constant loan_repayment_schedule

   Revision Bloomberg_WIP_hsus/1 2009/11/10 17:44:25 hsus
     TD4136 - Bank Loans - Add HYBL Repayment Schedule and Source from BBG

   Revision bloomberg_WIP_garcin/5 2009/10/22 15:00:56 garcin
     TD4330 new options symbology

   Revision bloomberg_WIP_garcin/4 2009/09/04 12:44:52 garcin
     merged

   Revision bloomberg_WIP_garcin/3 2009/09/03 17:09:49 garcin
     TD4273 routine to validate price

   Revision bloomberg_WIP_pdrive_hilld/5 2008/10/29 13:45:48 hilld
     TD 2602

   Revision bloomberg_WIP_pdrive_hilld/4 2008/10/21 15:47:33 hilld
     TD2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/3 2008/10/03 13:28:26 hilld
     merged

   Revision bloomberg__WIP_Dibyendu_duttad/10 2008/09/09 15:39:51 duttad
     TD 3759

   Revision bloomberg_WIP_pdrive_hilld/2 2008/08/13 15:29:23 hilld
        Reverting code for TD 2602 RIC futures

   Revision bloomberg__WIP_Dibyendu_duttad/6 2008/08/07 18:58:06 duttad
        TD3728

   Revision bloomberg_WIP_pdrive_hilld/1 2008/07/30 15:57:01 hilld
        TD 2602 RICs on Futures

   Revision bloomberg__WIP_Dibyendu_duttad/4 2008/07/08 13:01:08 duttad
        TD3644

   Revision bloomberg__WIP_Dibyendu_duttad/3 2008/06/26 21:29:29 duttad
        TD3654

   Revision bloomberg_Jun_6_WIP_agnihr/11 2008/06/03 14:56:35 agnihr
        Defect-113,114

   Revision bloomberg_Jun_6_WIP_agnihr/10 2008/05/30 17:30:31 agnihr
        TD#3322 and TD#3389 NSS

   Revision bloomberg_Jun_6_WIP_agnihr/9 2008/05/27 04:07:16 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/8 2008/05/22 12:12:48 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/6 2008/05/15 10:46:55 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/5 2008/05/14 14:48:01 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/4 2008/05/09 12:43:00 agnihr
    June Release

   Revision bloomberg_8.04_WIP_meshrs/8 2008/04/14 15:23:38 meshrs
    Updated for TD 3352

   Revision bloomber_sreeni_csr/7 2008/04/13 17:53:09 csr
    04/25 Release changes

   Revision bloomberg_8.04_WIP_meshrs/7 2008/04/11 09:50:48 meshrs
    Updated for TD 3352

   Revision bloomber_sreeni_csr/6 2008/04/03 19:00:30 csr
    04/01 Release changes

   Revision bloomberg_8.04_WIP_meshrs/5 2008/04/03 08:58:01 meshrs
    merged

   Revision bloomber_sreeni_csr/5 2008/04/01 21:36:46 csr
    GDA code changes

   Revision bloomber_sreeni_csr/3 2008/03/27 18:57:26 csr
    04/11 Release Changes

   Revision bloomber_sreeni_csr/1 2008/03/25 23:08:26 csr
    04/11 Release changes

   Revision bloomberg_8.04_WIP_meshrs/4 2008/03/10 13:53:07 meshrs
    March Release TDs

   Revision bloomberg_8.04_WIP_meshrs/2 2008/02/29 10:08:27 meshrs
    Updated for March TD Release

   Revision bloomberg_WIP_garcin/2 2008/01/07 17:30:58 garcin
    TD 3423 remove extended processing for callable, putable, and sinkable; these are now maintained in csm_security

   Revision bloomberg_WIP_P_kampeta/5 2007/12/06 20:18:53 kampeta
    REmoved WM_ prefix for fix_to_float to help confusion on analyst side.

   Revision bloomberg_WIP_P_kampeta/4 2007/12/06 18:04:14 kampeta
    TD 3174 modified to add WM_ prefix to fix_to_float_reset_dt

   Revision bloomberg_WIP_P_kampeta/3 2007/11/30 19:12:25 kampeta
    TD3174 - changes for handling date format

   Revision bloomberg_WIP_P_kampeta/2 2007/11/29 22:04:11 kampeta
    TD 3174 Adjusted size for constant and commented out call to maintain_security_Attribute until the row is created by DBA's

   Revision bloomberg_WIP_P_kampeta/1 2007/11/29 19:45:09 kampeta
    TD 3174 added FIX_TO_FLOAT_RESET_DT and maintain_security_attribue procedure

   Revision bloomberg_WIP_garcin/1 2007/10/08 19:06:31 garcin
    TD 3291 add WM_MTG_WAL

   Revision bloomberg_WIP_pitchv/4 2007/09/11 19:48:07 pitchv
    TD 3175 Changes

   Revision bloomberg_12_01_WIP_hilld/12 2007/04/04 21:00:42 hilld
    TD 2818 Interval date

   Revision bloomberg_12_01_WIP_hilld/11 2007/03/30 18:53:24 hilld
    td2818 Interval date

   Revision bloomberg_12_01_WIP_hilld/10 2007/03/22 12:50:39 hilld
    TD2818 Interval_dt

   Revision bloomberg_WIP_kampeta/9 2007/02/20 22:26:15 kampeta
    Add order_erp_types and order by cluase in get_bulk_data for erp_types

   Revision bloomberg_WIP_pitchv/3 2007/02/06 23:55:35 pitchv
    TD-2956 changes added function chk_sec_factor_schd

   Revision bloomberg_WIP_kampeta/8 2007/01/30 19:40:00 kampeta
    Added functions to handle bulk field for muni erp types with zero rows.

   Revision bloomberg_WIP_kampeta/7 2007/01/26 22:09:17 kampeta
    Added muni_erp_types to get_bulk_data.

   Revision bloomberg_WIP_kampeta/6 2007/01/19 19:59:25 kampeta
    added get_code_value function. fixed maintain_sec_Attr_list_tbl

   Revision bloomberg_WIP_kampeta/5 2007/01/11 20:58:42 kampeta
    Added muni erp types

   Revision bloomberg_WIP_kampeta/4 2007/01/11 14:59:57 kampeta
    Added muni erp types

   Revision bloomberg_WIP_kampeta/3 2007/01/10 21:02:37 kampeta
    merged

   Revision bloomberg_12_01_WIP_deonpe/9 2007/01/10 20:21:52 deonpe
    td 2425 add obligor override

   Revision bloomberg_WIP_pitchv/2 2006/11/01 15:21:28 pitchv
    Function get_vndrmsg_hst_transval changes

   Revision bloomberg_WIP_pitchv/1 2006/10/27 15:45:02 pitchv
    TD_IDS #2791 and 2792 adjusted Maturity Date rules
    -- Added Function get_vndrmsg_hst_transval

   Revision bloomberg_12_01_WIP_deonpe/8 2006/07/10 15:38:33 deonpe
    td 2667 duration checks  function for tolerance

   Revision bloomberg_WIP_ignativ/5 2006/07/06 18:15:10 ignativ
    TD 2582

   Revision bloomberg_12_01_WIP_deonpe/7 2006/05/23 14:00:58 deonpe
    TD 2574 - set quasi relation pct to null instead of 50

   Revision bloomberg_12_01_WIP_hilld/9 2006/05/10 19:45:57 hilld
    TD2566 - get_fut_chain global table contained entries for prior requests because it was not being cleaned out - resulted in bogus vendor_rel_request records

   Revision bloomberg_12_01_WIP_hilld/8 2006/05/03 19:16:37 hilld
    merged

   Revision bloomberg_12_01_WIP_hilld/7 2006/05/03 19:09:36 hilld
    TD2566 prevent duplicate fut chain requests by moving setup to single threaded 800 queue

   Revision bloomberg_12_01_WIP_hilld/6 2006/05/03 17:35:22 hilld
    TD2566 prevent duplicate fut chain requests by moving setup to single threaded 800 queue

   Revision bloomberg_12_01_WIP_hilld/5 2006/05/03 14:52:07 hilld
    merged
   Revision bloomberg_WIP_ignativ/4 2006/05/03 16:15:32 ignativ
    TD 2490

   Revision bloomberg_12_01_WIP_hilld/2 2006/03/17 23:11:25 hilld
    TD2566 moving to 800 queue for setup
   Revision bloomberg_WIP_ignativ/3 2006/04/20 18:45:06 ignativ
    TD 2490

   Revision bloomberg_WIP_ignativ/2 2006/04/19 22:01:50 ignativ
    td 2490 - unknown values will be mapped to 'n/a' and shown as exception for SP, FITCH and MOODY. Also includes rule changes 652,1452,1436

   Revision bloomberg_WIP_ignativ/1 2006/04/12 21:53:13 ignativ
    TD 2490

   Revision bloomberg_12_01_WIP_deonpe/6 2006/03/14 19:41:57 deonpe
    removed extra slash at end

   Revision bloomberg_12_01_WIP_hilld/1 2006/02/28 19:43:51 hilld
    TD1674 FUT_CHAIN create NSS

   Revision bloomberg_WIP_kampeta/2 2006/01/17 21:00:08 kampeta
    missing slash at eof

   Revision bloomberg_12_01_WIP_kampeta/3 2006/01/13 21:00:47 kampeta
    TD2316 - Added function get_idx_invest_id for rule mapping

   Revision WIP_NALLA_nallan/4 2006/01/05 17:05:19 nallan
    Added Constant Comdty

   Revision WIP_NALLA_nallan/3 2005/12/16 17:09:30 nallan
    Futures Changes

   Revision WIP_NALLA_nallan/1 2005/12/07 22:00:55 nallan
    Added Constants

   Revision bloomberg_12_01_WIP_2314_ignativ/4 2005/11/29 18:42:31 ignativ
    Add External ID Types for HYBL - TD 2314

   Revision bloomberg_12_01_WIP_2314_ignativ/3 2005/11/28 22:35:51 ignativ
    TD 2314

   Revision bloomberg_12_01_WIP_2314_ignativ/2 2005/11/28 18:40:44 ignativ
    merged

   Revision bloomberg_12_01_WIP_kampeta/2 2005/11/28 16:30:22 kampeta
    changed type references to not use security view

   Revision bloomberg_12_01_WIP_kampeta/1 2005/11/28 16:08:38 kampeta
    changed type references to not use security view
   Revision bloomberg_12_01_WIP_2314_ignativ/1 2005/11/28 15:09:36 ignativ
    TD 2314

   Revision bloomberg_12_01_WIP_deonpe/4 2005/11/17 19:42:49 deonpe
    added benchmark dummy invest id function

   Revision bloomberg_12_01_WIP_td2251_ignativ/2 2005/11/14 15:56:12 ignativ
    TD 1922 and 2251

   Revision bloomberg_12_01_WIP_td2251_ignativ/1 2005/11/11 00:05:18 ignativ
    td 2251

   Revision bloomberg_12_01_WIP_deonpe/3 2005/11/08 19:00:42 deonpe
    quasi sovg project

   Revision bloomberg_12_01_WIP_deonpe/2 2005/11/07 15:31:41 deonpe
    issuer family quasi sovereign

   Revision bloomberg_12_01_WIP_deonpe/1 2005/11/07 13:38:14 deonpe
    issuer family quasi sovereign

   Revision bloomberg_5.11.1_WIP_deonpe/3 2005/10/26 16:54:33 deonpe
    merged

   Revision bloomberg_5.11.1_WIP_deonpe/2 2005/10/17 17:42:25 deonpe
    No Comment Entered

   Revision bloomberg_5.11.1_WIP_deonpe/1 2005/10/17 17:29:16 deonpe
    No Comment Entered


   Rev 1.18   06 Apr 2005 13:52:12   SaranN
SWAPs changes First cut

   Rev 1.16   11 Mar 2005 16:33:34   JainD
TD 1571 is taken out of this release, so commented the code for it.

   Rev 1.15   04 Mar 2005 13:22:34   MahadS
Correction for TD 715

   Rev 1.14   03 Mar 2005 13:56:28   JainD
TD 1571 BB Ticker enhancement.

   Rev 1.13   23 Feb 2005 16:38:34   MahadS
TD 725- Factor changes

   Rev 1.12   13 Oct 2004 17:11:34   SaranN
TD 1488 Changes for RIC and SYM scrub

   Rev 1.11   11 Oct 2004 13:59:36   MahadS
Mored changes for factor schedules

   Rev 1.10   20 Sep 2004 16:02:28   SaranN
TD 1488  RIC mainrenance added

   Rev 1.9   01 Sep 2004 09:08:00   MahadS
Factor changes rolled in with floating coupon changes

   Rev 1.7   26 Aug 2004 16:03:18   MahadS
Added floating coupon changes

   Rev 1.6   25 Aug 2004 13:34:48   MahadS
More changes for Factor Schedule

   Rev 1.5   06 Aug 2004 09:52:42   MahadS
Factor sourcing - TD715

   Rev 1.4   24 Feb 2004 10:51:16   MahadS
Initial changes for Q1 2004 release

   Rev 1.3   05 Nov 2003 09:44:26   MahadS
Bloomberg Q42003 changes - first cut

   Rev 1.2   08 Aug 2003 11:42:04   MahadS
Modified to sync with current production version

   Rev 1.1   04 Aug 2003 11:21:10   HunteS
code cleanup - productization and removal redundant code

   Rev 1.0   01 Aug 2003 13:26:18   HunteS
Initial revision.

*/


    --
    --  Globals
    --
    g_debug_flg                         BOOLEAN                         := FALSE;

    --
    --  Constants
    --
    c_success                           CONSTANT        PLS_INTEGER     :=  0;
    c_failure                           CONSTANT        PLS_INTEGER     :=  1;
    c_true                              CONSTANT        BOOLEAN         :=  TRUE;
    c_false                             CONSTANT        BOOLEAN         :=  FALSE;

    c_def_bulk_sep                      CONSTANT        CHAR(1)         :=  ';';
    c_blmbg_date_format                 CONSTANT        VARCHAR2(8)     :=  'YYYYMMDD';    -- TD 2818 HillD 4/4/2008
    c_login_name                        CONSTANT        vendor_request.upd_login%TYPE
                                                                        :=  'BLMBGCNTLR';

    c_rating_sp                         CONSTANT        VARCHAR2(2)     :=  'SP';
    c_rating_moody                      CONSTANT        VARCHAR2(5)     :=  'MOODY';
    c_factor_typ                        CONSTANT        VARCHAR2(2)     :=  'FI';
    c_factor_source                     CONSTANT        VARCHAR2(6)     :=  'BLMBRG';
    c_rating_fitch                      CONSTANT        VARCHAR2(5)     :=  'FITCH';        --  Gap 07/01/2003 (SH)
    c_rating_dbrs                       CONSTANT        VARCHAR2(4)     :=  'DBRS';  --TD4861:DBRS ratings at the security level.
    c_outlook                           CONSTANT        VARCHAR2(1)     :=  'L';  --TD4861:DBRS ratings at the security level.
    c_watchlist                         CONSTANT        VARCHAR2(1)     :=  'W';  --TD4861:DBRS ratings at the security level.
    c_vndr_srce_cd                      CONSTANT        VARCHAR2(6)     :=  'BLMBRG';
    c_call_schd_name                    CONSTANT        VARCHAR2(15)    :=  'CALL_SCHEDULE';
    c_put_schd_name                     CONSTANT        VARCHAR2(15)    :=  'PUT_SCHEDULE';
    c_sink_schd_name                    CONSTANT        VARCHAR2(15)    :=  'SINK_SCHEDULE';
    c_multi_cpn_schd_name               CONSTANT        VARCHAR2(20)    :=  'MULTI_CPN_SCHEDULE';
    c_factor_schd_name                  CONSTANT        VARCHAR2(20)    :=  'FACTOR_SCHEDULE';
    c_loan_repay_schd_name              CONSTANT        VARCHAR2(25)    :=  'LOAN_REPAYMENT_SCHEDULE';
    c_mtg_factor                        CONSTANT        VARCHAR2(15)    :=  'MTG_FACTOR';
    c_hist_losses                       CONSTANT        VARCHAR2(15)    :=  'HIST_LOSSES';
    c_hist_principal_distributed        CONSTANT        VARCHAR2(30)    :=  'HIST_PRINCIPAL_DISTRIBUTED';
    c_bb_unique                         CONSTANT        VARCHAR2(15)    :=  'BB_UNIQUE';
    c_bb_ticker                         CONSTANT        VARCHAR2(15)    :=  'BB_TICKER';
    c_trade_description                 CONSTANT        VARCHAR2(15)    :=  'WMC_DESCRIPTION';  --TD6262
	c_jpm_cntry_clfsn_description       CONSTANT        VARCHAR2(50)    :=  'JPM_CNTRY_CLASSIFICATION';  --TD6720
    -- TD 1571 Deep 02-18-05 -----------------------------------------------------------
    --c_ticker                            CONSTANT        VARCHAR2(15)    :=  'TICKER';
    --c_yellow_key                        CONSTANT        VARCHAR2(15)    :=  'YELLOW_KEY';
    ------------------------------------------------------------------------------------
    c_bmk_request_src                   CONSTANT        VARCHAR2(10)    :=  'BMKGENERIC';
    c_bmk_lb_cusip                      CONSTANT        VARCHAR2(10)    :=  'LBBMKCUSIP';
    c_bmk_yb_cusip                      CONSTANT        VARCHAR2(10)    :=  'YBBMKCUSIP';
    c_bmk_cg_cusip                      CONSTANT        VARCHAR2(10)    :=  'CGBMKCUSIP';  -- HillD 09-29-2005 BMK rewrite phase 2
    c_bmk_ml_cusip                      CONSTANT        VARCHAR2(10)    :=  'MLBMKCUSIP';
    c_bb_scrub_cusip                    CONSTANT        VARCHAR2(15)    :=  'CUSIP';
    c_bb_cusip                          CONSTANT        VARCHAR2(5)     :=  'CUSIP';
    c_bb_sedol                          CONSTANT        VARCHAR2(5)     :=  'SEDOL';
    c_bb_isin                           CONSTANT        VARCHAR2(5)     :=  'ISIN';
    c_bb_global                         CONSTANT        VARCHAR2(10)    :=  'BB_GLOBAL';
    c_occ_id                            CONSTANT        VARCHAR2(10)    :=  'OCC_ID';
    c_opra_id                           CONSTANT        VARCHAR2(10)    :=  'OPRA_ID';
    c_loanx_id                          CONSTANT        VARCHAR2(10)    :=  'LOANX_ID';
    c_wso_id                            CONSTANT        VARCHAR2(10)    :=  'WSO_ID';
    c_csm_security                      CONSTANT        VARCHAR2(12)    :=  'CSM_SECURITY';
    c_csm_issuer                        CONSTANT        VARCHAR2(10)    :=  'CSM_ISSUER';
    c_setup_action                      CONSTANT        VARCHAR2(1)     :=  'N';
    c_ric                               CONSTANT        VARCHAR2(5)     :=  'RIC';
    c_tranche_id                        CONSTANT        VARCHAR2(15)    :=  'TRANCHE_ID';             --IgnatIV    TD2314    11/29/2005
    c_muni_erp_types                    CONSTANT        VARCHAR2(20)    :=  'MUNI_ERP_TYPES';         -- TD 2859 KampeTA 01/26/2007
    c_interval_dt_schd                  CONSTANT        VARCHAR2(20)    :=  'INTERVAL_DT_SCHD';       -- TD 2818 HillD 03/29/2007
    c_fix_to_float_reset_dt             CONSTANT        VARCHAR2(25)    :=  'FIX_TO_FLOAT_RESET_DT';  -- TD 3174 KampeTA 11/29/2007
    c_trade_desc                        CONSTANT        VARCHAR2(1000)  :=  'ID_BB_SEC_NUM_DES';      --TD6262
	c_jpm_cntry_classification          CONSTANT        VARCHAR2(1000)  :=  'WM_JPM_CNTRY_CLASS';      --TD6720
    --  Gap 07/01/2003 (SH)
    c_fixed_cpn_typ                     CONSTANT        VARCHAR2(10)    :=  'FIXED%';
    c_zero_cpn_typ                      CONSTANT        VARCHAR2(10)    :=  'ZERO%';
    c_fut_month_year                    CONSTANT        VARCHAR2(15)    :=  'FUT_MONTH_YR';
    c_id_cusip_id_num                   CONSTANT        VARCHAR2(15)    :=  'ID_CUSIP_ID_NUM';
    c_opt_put_call                      CONSTANT        VARCHAR2(15)    :=  'OPT_PUT_CALL';

    c_rec_side_rates_hst_nm             CONSTANT        VARCHAR2(30)    :=  'REC_SIDE_RATES_HIST';
    c_pay_side_rates_hst_nm             CONSTANT        VARCHAR2(30)    :=  'PAY_SIDE_RATES_HIST';
    c_sw_pay_cash_flow_nm               CONSTANT        VARCHAR2(30)    :=  'SW_PAY_CASH_FLOW';
    c_pay_cash_flow                     CONSTANT        VARCHAR2(30)    :=  'PAY_CASH_FLOW';
    c_sw_rec_cash_flow_nm               CONSTANT        VARCHAR2(30)    :=  'SW_REC_CASH_FLOW';
    c_rec_cash_flow                     CONSTANT        VARCHAR2(30)    :=  'REC_CASH_FLOW';

    c_quasi_relation_cd                 CONSTANT        CHAR(4)         :=  'QSOV';
    c_quasi_relation_pct                CONSTANT        PLS_INTEGER     :=  NULL;
    c_quasi_asset_type                  CONSTANT        VARCHAR2(20)    :=  'WMC_SOVG';
    c_if_type                           CONSTANT        VARCHAR2(20)    :=  'ISS_FAM';

    c_mtg_hist_fact                     CONSTANT        VARCHAR2(20)    :=  'MTG_HIST_FACT';
    c_mtg_hist_cpn                      CONSTANT        VARCHAR2(20)    :=  'MTG_HIST_CPN';

    c_type_float                        CONSTANT        PLS_INTEGER     :=  2;
    c_type_integer                      CONSTANT        PLS_INTEGER     :=  3;
    c_type_date                         CONSTANT        PLS_INTEGER     :=  5;

    c_multi_cpn_schd_id                 CONSTANT        VARCHAR2(20)    :=  'SC011';    -- TD 2251 and 1922    11/10/2005    IgnatIV
    c_mtg_hist_fact_id                  CONSTANT        VARCHAR2(20)    :=  'FP025';
    c_mtg_hist_cpn_id                   CONSTANT        VARCHAR2(20)    :=  'DS647';
    c_bmk_src                           CONSTANT        CHAR(3)         :=  'BMK';

    -- Bloomberg Data type Indicators in Bulk format fields
    CONST_PRCE_IND                      CONSTANT        CHAR(1)         :=  '2';
    CONST_REAL_IND                      CONSTANT        CHAR(1)         :=  '3';
    CONST_CHAR_IND                      CONSTANT        CHAR(1)         :=  '4';
    CONST_DATE_IND                      CONSTANT        CHAR(1)         :=  '5';

    CONST_COMDTY                        CONSTANT        VARCHAR2(6)     :=  'Comdty';


    c_zone_id                           CONSTANT        VARCHAR2(7)     :=  'ZONE_ID';         -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    c_zone_source_cd                    CONSTANT        VARCHAR2(14)    :=  'ZONE_SOURCE_CD';  -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    c_zone_vendor_product_id            CONSTANT        NUMBER(3)       := 156;                -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    c_lehman_vendor_product_id          CONSTANT        NUMBER(3)       := 161;                -- TD#3389 added 2008-FEB-18 Cognizant Technology Solutions

    --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:start
    c_bb_cntry_of_domicile               CONSTANT        VARCHAR2(30)    :='BB_CNTRY_OF_DOMICILE';
    c_bb_cntry_of_incorporation          CONSTANT        VARCHAR2(30)    :='BB_CNTRY_OF_INCORPORATION';
    --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:end
    c_ind_subgrp_num_catlg_id            CONSTANT        NUMBER          := 44;   -- #TD5304
    c_ind_grp_num_catlg_id               CONSTANT        NUMBER          := 533;   -- #TD5304
    c_ind_sector_num_catlg_id            CONSTANT        NUMBER          := 532;   -- #TD5304
    c_jpm_catlg_id                       CONSTANT        NUMBER          := 1020;
    c_tpx_catlg_id                       CONSTANT        NUMBER          := 401;
    c_wmc_jpm_catlg_id                   CONSTANT        NUMBER          := 1021;
    c_exch_cd_attr_id                    CONSTANT        NUMBER          := 24;
    c_boa_ml_catlg_id                    CONSTANT        NUMBER          := 1028; --TD5969 VartaV 09/25/2012
    c_wmc_boa_ml_catlg_id                CONSTANT        NUMBER          := 1029; --TD5969 VartaV 09/25/2012
    c_capital_contingent_attr_id         CONSTANT        NUMBER          := 1197; -- TD5410
    --
    --  Types and Globals
    --

    --
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --
    TYPE bb_sec_rec_type IS RECORD (
        sec_id                       security_tbl.sec_id%TYPE,
        asset_class                  sec_type.asset_class%TYPE,
        /* TD3423 GarciN 01/07/2008
        callable                     sec_fi_data_tbl.callable_flg%TYPE,
        sinkable                     sec_fi_data_tbl.sinkable_flg%TYPE,
        putable                      sec_fi_data_tbl.putable_flg%TYPE,*/
        rtg_moody                    csm.csm_sec_rating_tbl.rating%TYPE,
        rtg_sp                       csm.csm_sec_rating_tbl.rating%TYPE,
        rtg_fitch                    csm.csm_sec_rating_tbl.rating%TYPE,
        moody_vndr_srce_cd           csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE,
        sp_vndr_srce_cd              csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE,
        fitch_vndr_srce_cd           csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE,
        moody_eff_dt                 csm.csm_sec_rating_tbl.eff_dt%TYPE,
        sp_eff_dt                    csm.csm_sec_rating_tbl.eff_dt%TYPE,
        fitch_eff_dt                 csm.csm_sec_rating_tbl.eff_dt%TYPE,
        moody_rating_typ             csm.csm_sec_rating_tbl.rating_typ%TYPE,
        sp_rating_typ                csm.csm_sec_rating_tbl.rating_typ%TYPE,
        fitch_rating_typ             csm.csm_sec_rating_tbl.rating_typ%TYPE,
        --
        rtg_moody_undl               csm.csm_sec_rating_tbl.rating%TYPE,
        rtg_sp_undl                  csm.csm_sec_rating_tbl.rating%TYPE,
        rtg_fitch_undl               csm.csm_sec_rating_tbl.rating%TYPE,
        moody_vndr_srce_cd_undl      csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE,
        sp_vndr_srce_cd_undl         csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE,
        fitch_vndr_srce_cd_undl      csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE,
        moody_eff_dt_undl            csm.csm_sec_rating_tbl.eff_dt%TYPE,
        sp_eff_dt_undl               csm.csm_sec_rating_tbl.eff_dt%TYPE,
        fitch_eff_dt_undl            csm.csm_sec_rating_tbl.eff_dt%TYPE,
        moody_rating_typ_undl        csm.csm_sec_rating_tbl.rating_typ%TYPE,
        sp_rating_typ_undl           csm.csm_sec_rating_tbl.rating_typ%TYPE,
        fitch_rating_typ_undl        csm.csm_sec_rating_tbl.rating_typ%TYPE,

        --
        -- CLOB convert data length to max for varchar2  NallaN 07-25-2005
        call_schedule                VARCHAR2(32767),
        put_schedule                 VARCHAR2(32767),
        sink_schedule                VARCHAR2(32767),
        multi_cpn_schedule           VARCHAR2(32767),
        loan_repayment_schedule      VARCHAR2(32767),
        mtg_factor                   VARCHAR2(32767),
        hist_principal_distributed   VARCHAR2(32767),
        hist_losses                  VARCHAR2(32767),
        bb_unique                    sec_external_id.extern_id%TYPE,
        bb_ticker                    sec_external_id.extern_id%TYPE,
        bb_scrub_cusip               sec_external_id.extern_id%TYPE,
        bb_cusip                     sec_external_id.extern_id%TYPE,
        bb_isin                      sec_external_id.extern_id%TYPE,
        bb_sedol                     sec_external_id.extern_id%TYPE,
        bmk_yb_cusip                 sec_external_id.extern_id%TYPE,
        bmk_cg_cusip                 sec_external_id.extern_id%TYPE, -- HillD 09-29-2005 BMK rewrite phase 2
        bmk_lb_cusip                 sec_external_id.extern_id%TYPE,
        bmk_ml_cusip                 sec_external_id.extern_id%TYPE,
        bb_px_close                  sec_price.price%TYPE,
        bb_px_dt                     sec_price.price_dt%TYPE,
        bb_px_source                 sec_price.price_srce_cd%TYPE,
        bb_px_curcy                  sec_price.price_curcy_cd%TYPE,
        bb_px_close_mtd              sec_price.price%TYPE,
        bb_px_close_mtd_dt           sec_price.price_dt%TYPE,
        bb_px_close_mtd_source       sec_price.price_srce_cd%TYPE,
        bb_px_close_mtd_curcy        sec_price.price_curcy_cd%TYPE,
        bb_vendor_sec_ticker         vendor_sec_name.vendor_sec_ticker%TYPE,
        ric                          sec_external_id.extern_id%TYPE,
        -- CLOB changes  NallaN 07-25-2005
        rec_side_rates_hist          VARCHAR2(32767),
        pay_side_rates_hist          VARCHAR2(32767),
        sw_pay_cash_flow             VARCHAR2(32767),
        sw_rec_cash_flow             VARCHAR2(32767),
        wmc_isr_fam_id               VARCHAR2(1000),
        wm_quasi_sovg_flg            VARCHAR2(1000),
        bb_tranche_id                sec_external_id.extern_id%TYPE,  --IgnatIV    TD2314    11/29/2005
        fut_dlvrble_bnds_bb_unique   VARCHAR2(32767),
        wm_obligor_override          issuer_family.wmc_isr_fam_id%TYPE,
        muni_erp_types               VARCHAR2(32767),                      -- KampeTA TD2859 01/10/2007
        wm_interval_dt               VARCHAR2(32767),                      -- HillD   TD2818 03/19/2007
        wm_mat_dt                    VARCHAR2(32767),                      -- PitchV  TD3175 09/11/2007
        wm_mtg_wal                   VARCHAR2(32767),                      -- GarciN  TD3291 10/01/2007
        fix_to_float_reset_dt        security_attribute.Attr_Dt_Val%TYPE,   -- KampeTA TD3174 11/29/2007
        zone_id                      sec_zone.zone_id%TYPE,           -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        zone_source_cd               sec_zone.zone_source_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        zone_id_dsc                  process_zone.zone_nm%TYPE,       -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        zone_source_cd_dsc           ref_attr_value.short_dsc%TYPE,       -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        sec_typ_id                   security_tbl.sec_typ_id%TYPE,        -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        related_sec_id               security_tbl.sec_id%TYPE,            -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        exch_cd                      security_tbl.exch_cd%TYPE,           -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        crncy_cd                     security_tbl.trade_curcy_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions


        -- TD 1571 Deep 02-18-05 -----------------------------------------------------------
        --ticker                      sec_external_id.extern_id%TYPE,
        --yellow_key                  sec_external_id.extern_id%TYPE
        ------------------------------------------------------------------------------------
        WMC_LB_GLOBAL_CLASS           fi_lb_mthly.issrclscd%TYPE,           -- TD#3322 added 03/06/2008 Cognizant Technology Solutions
        WMC_LB_GLOBAL_CLASS_WMC       fi_lb_mthly.issrclscd%TYPE ,          -- TD#3322 added 03/06/2008 Cognizant Technology Solutions
        WM_379_CATLG_ITEM_ID          catlg_item.catlg_item_id%TYPE,        -- TD#3389 added 05/01/2008 Cognizant Technology Solutions
        WM_379_CATLG_DESC             VARCHAR2(100)  ,                      -- TD#3389 added 05/01/2008 Cognizant Technology Solutions
        WM_SEC_ID_DESC                VARCHAR2(10)   ,                      -- TD#3389 added 05/01/2008 Cognizant Technology Solutions
        IDX_RATIO                     sec_factor_schd_tbl.fctr%TYPE ,       -- TD#3644 added 06/17/2008 Cognizant Technology Solutions
        SETTLE_DT                     sec_factor_schd_tbl.eff_dt%TYPE,      -- TD#3644 added 07/08/2008 Cognizant Technology Solutions
        BB_GLOBAL                     sec_external_id.extern_id%TYPE,
        OCC_ID                        sec_external_id.extern_id%TYPE,
        OPRA_ID                       sec_external_id.extern_id%TYPE,
        LOANX_ID                      sec_external_id.extern_id%TYPE,
        WSO_ID                        sec_external_id.extern_id%TYPE,
       --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
        sp_outlook_eff_dt             sec_assessment.eff_dt%type,
        sp_outlook_vndr_srce_cd       sec_assessment.vndr_srce_cd%type,
        rtg_sp_outlook                sec_assessment.wmc_assmnt_cd%type,
        moody_outlook_eff_dt          sec_assessment.eff_dt%type,
        moody_outlook_vndr_srce_cd    sec_assessment.vndr_srce_cd%type,
        rtg_moody_outlook             sec_assessment.wmc_assmnt_cd%type,
        fitch_outlook_eff_dt          sec_assessment.eff_dt%type,
        fitch_outlook_vndr_srce_cd    sec_assessment.vndr_srce_cd%type,
        rtg_fitch_outlook             sec_assessment.wmc_assmnt_cd%type,
        sp_watch_eff_dt               sec_assessment.eff_dt%type,
        sp_watch_vndr_srce_cd         sec_assessment.vndr_srce_cd%type,
        rtg_sp_watch                  sec_assessment.wmc_assmnt_cd%type,
        moody_watch_eff_dt            sec_assessment.eff_dt%type,
        moody_watch_vndr_srce_cd      sec_assessment.vndr_srce_cd%type,
        rtg_moody_watch               sec_assessment.wmc_assmnt_cd%type,
        fitch_watch_eff_dt            sec_assessment.eff_dt%type,
        fitch_watch_vndr_srce_cd      sec_assessment.vndr_srce_cd%type,
        rtg_fitch_watch               sec_assessment.wmc_assmnt_cd%type,
       --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
       --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:start
       --TD4595:Modified datatyp for below two variables. Wadeks:10-NOV-2010.
        bb_cntry_of_domicile          vendor_req_messages.column_value%TYPE,
        bb_cntry_of_incorporation     vendor_req_messages.column_value%TYPE,
       --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:end
       --TD4861: DBRS ratings at the security level :WADEKS on 10-MAR-2011.
        dbrs_eff_dt                   csm.csm_sec_rating_tbl.eff_dt%TYPE,
        dbrs_vndr_srce_cd             csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE,
        rtg_dbrs                      csm.csm_sec_rating_tbl.rating%TYPE,
        dbrs_rating_typ               csm.csm_sec_rating_tbl.rating_typ%TYPE,
        dbrs_watch_eff_dt             sec_assessment.eff_dt%type,
        dbrs_watch_vndr_srce_cd       sec_assessment.vndr_srce_cd%type,
        rtg_dbrs_watch                sec_assessment.wmc_assmnt_cd%type,
        dbrs_outlook_eff_dt           sec_assessment.eff_dt%type,
        dbrs_outlook_vndr_srce_cd     sec_assessment.vndr_srce_cd%type,
        rtg_dbrs_outlook              sec_assessment.wmc_assmnt_cd%type,
       --TD4861: DBRS ratings at the security level :WADEKS on 10-MAR-2011.
        industry_subgroup_num         catlg_item.low_lv_cd_value%type, -- #TD5304
        industry_group_num            catlg_item.low_lv_cd_value%type, -- #TD5304
        industry_sector_num           catlg_item.low_lv_cd_value%type, -- #TD5304
        wm_jpm_ind_class              catlg_item.low_lv_cd_value%type,
        wm_topix_ind_class            catlg_item.low_lv_cd_value%type,
        unadjusted_pay_day            sec_fi_data_tbl.unadjusted_pay_day%TYPE,  -- #TD5442
        coupon_convention             sec_fi_data_tbl.coupon_convention%TYPE,   -- #TD5442
        exch_cd_raw                   VARCHAR2(1000),
        exch_cd_raw_srce              VARCHAR2(1000),
        --TD5899 08/17/2012 VARTAV
        data_srce_status_cd           security_tbl.data_srce_status_cd%TYPE,
        payment_rank                  sec_fi_data_tbl.payment_rank%TYPE,
        surplus_note_flg              sec_fi_data_tbl.surplus_note_flg%TYPE,
        tier_capital                  sec_fi_data_tbl.tier_capital%TYPE,
        mtg_pool_typ                  sec_fi_data_tbl.mtg_pool_typ%TYPE,
        collat_cntry_cd               sec_fi_data_tbl.collat_cntry_cd%TYPE,
        opt_var_margin_flg            sec_deriv_data_tbl.opt_var_margin_flg%TYPE,
        --TD5899 08/17/2012 VARTAV
        wm_boa_ml_ind_class           catlg_item.low_lv_cd_value%type, --TD5969 VartaV
        muni_issue_typ                sec_fi_data_tbl.muni_issue_typ%TYPE,    --TD6042 Vartav 11.12.2012
        cpn_recalc_method             sec_fi_data_tbl.cpn_recalc_method%TYPE,  --TD6066 Vartav 11.12.2012
        capital_contingent            sec_attr_list_tbl.code_value%TYPE, -- TD5410
        opt_undl_crncy                VARCHAR2(5), -- TD5974
        trade_description             sec_descriptor.descriptor%type,     --TD6262  
		jpm_cntry_classification      vendor_req_messages.column_value%TYPE  --TD6720
	   );

    --
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --  IF YOU ADD COLUMNS HERE YOU WILL NEED TO UPDATE THE get_bb_ext_vrq API!!!
    --
    TYPE bb_sec_fsc_rec_type IS RECORD(
        sec_id_flg                   vendor_req_messages.fix_status_cd%TYPE,
        asset_class_flg              vendor_req_messages.fix_status_cd%TYPE,
        /* TD3423 GarciN 01/07/2008
        callable_flg                 vendor_req_messages.fix_status_cd%TYPE,
        sinkable_flg                 vendor_req_messages.fix_status_cd%TYPE,
        putable_flg                  vendor_req_messages.fix_status_cd%TYPE,*/
        rtg_moody_flg                vendor_req_messages.fix_status_cd%TYPE,
        rtg_sp_flg                   vendor_req_messages.fix_status_cd%TYPE,
        rtg_fitch_flg                vendor_req_messages.fix_status_cd%TYPE,
        moody_vndr_srce_cd_flg       vendor_req_messages.fix_status_cd%TYPE,
        sp_vndr_srce_cd_flg          vendor_req_messages.fix_status_cd%TYPE,
        fitch_vndr_srce_cd_flg       vendor_req_messages.fix_status_cd%TYPE,
        moody_eff_dt_flg             vendor_req_messages.fix_status_cd%TYPE,
        sp_eff_dt_flg                vendor_req_messages.fix_status_cd%TYPE,
        fitch_eff_dt_flg             vendor_req_messages.fix_status_cd%TYPE,
        moody_rating_typ_flg         vendor_req_messages.fix_status_cd%TYPE,
        sp_rating_typ_flg            vendor_req_messages.fix_status_cd%TYPE,
        fitch_rating_flg             vendor_req_messages.fix_status_cd%TYPE,
--
        rtg_moody_undl_flg           vendor_req_messages.fix_status_cd%TYPE,
        rtg_sp_undl_flg              vendor_req_messages.fix_status_cd%TYPE,
        rtg_fitch_undl_flg           vendor_req_messages.fix_status_cd%TYPE,
        moody_vndr_srce_cd_undl_flg  vendor_req_messages.fix_status_cd%TYPE,
        sp_vndr_srce_cd_undl_flg     vendor_req_messages.fix_status_cd%TYPE,
        fitch_vndr_srce_cd_undl_flg  vendor_req_messages.fix_status_cd%TYPE,
        moody_eff_dt_undl_flg        vendor_req_messages.fix_status_cd%TYPE,
        sp_eff_dt_undl_flg           vendor_req_messages.fix_status_cd%TYPE,
        fitch_eff_dt_undl_flg        vendor_req_messages.fix_status_cd%TYPE,
        moody_rating_typ_undl_flg    vendor_req_messages.fix_status_cd%TYPE,
        sp_rating_typ_undl_flg       vendor_req_messages.fix_status_cd%TYPE,
        fitch_rating_typ_undl_flg    vendor_req_messages.fix_status_cd%TYPE,

--
        call_schedule_flg            vendor_req_messages.fix_status_cd%TYPE,
        put_schedule_flg             vendor_req_messages.fix_status_cd%TYPE,
        sink_schedule_flg            vendor_req_messages.fix_status_cd%TYPE,
        multi_cpn_schedule_flg       vendor_req_messages.fix_status_cd%TYPE,
        loan_repayment_schedule_flg  vendor_req_messages.fix_status_cd%TYPE,
        mtg_factor_flg               vendor_req_messages.fix_status_cd%TYPE,
        hist_principal_distributed_flg vendor_req_messages.fix_status_cd%TYPE,
        hist_losses_flg              vendor_req_messages.fix_status_cd%TYPE,
        bb_unique_flg                vendor_req_messages.fix_status_cd%TYPE,
        bb_ticker_flg                vendor_req_messages.fix_status_cd%TYPE,
        bb_scrub_cusip_flg           vendor_req_messages.fix_status_cd%TYPE,
        bb_cusip_flg                 vendor_req_messages.fix_status_cd%TYPE,
        bb_isin_flg                  vendor_req_messages.fix_status_cd%TYPE,
        bb_sedol_flg                 vendor_req_messages.fix_status_cd%TYPE,
        bmk_ml_cusip_flg             vendor_req_messages.fix_status_cd%TYPE,
        bmk_yb_cusip_flg             vendor_req_messages.fix_status_cd%TYPE,
        bmk_cg_cusip_flg             vendor_req_messages.fix_status_cd%TYPE, -- HillD 09-29-2005 BMK rewrite phase 2
        bmk_lb_cusip_flg             vendor_req_messages.fix_status_cd%TYPE,
        bb_px_close_flg              vendor_req_messages.fix_status_cd%TYPE,
        bb_px_dt_flg                 vendor_req_messages.fix_status_cd%TYPE,
        bb_px_source_flg             vendor_req_messages.fix_status_cd%TYPE,
        bb_px_curcy_flg              vendor_req_messages.fix_status_cd%TYPE,
        bb_px_close_mtd_flg          vendor_req_messages.fix_status_cd%TYPE,
        bb_px_close_mtd_dt_flg       vendor_req_messages.fix_status_cd%TYPE,
        bb_px_close_mtd_source_flg   vendor_req_messages.fix_status_cd%TYPE,
        bb_px_close_mtd_curcy_flg    vendor_req_messages.fix_status_cd%TYPE,
        bb_vendor_sec_ticker_flg     vendor_req_messages.fix_status_cd%TYPE,
        ric_flg                      vendor_req_messages.fix_status_cd%TYPE,
        rec_side_rates_hist_flg      vendor_req_messages.fix_status_cd%TYPE,
        pay_side_rates_hist_flg      vendor_req_messages.fix_status_cd%TYPE,
        sw_pay_cash_flow_flg         vendor_req_messages.fix_status_cd%TYPE,
        sw_rec_cash_flow_flg         vendor_req_messages.fix_status_cd%TYPE,
        -- TD 1571 Deep 02-18-05 -----------------------------------------------------------
        --ticker_flg                  vendor_req_messages.fix_status_cd%TYPE,
        --yellow_key_flg              vendor_req_messages.fix_status_cd%TYPE
        ------------------------------------------------------------------------------------
        wmc_isr_fam_id_flg            vendor_req_messages.fix_status_cd%TYPE,
        wm_quasi_sovg_flg_flg         vendor_req_messages.fix_status_cd%TYPE,
        bb_tranche_id_flg             vendor_req_messages.fix_status_cd%TYPE,    -- IgnatIV    TD2314    11/29/2005
        fut_dlvrble_bnds_bb_unique_flg vendor_req_messages.fix_status_cd%TYPE,
        wm_obligor_override_flg       vendor_req_messages.fix_status_cd%TYPE,
        muni_erp_types_flg            vendor_req_messages.fix_status_cd%TYPE,    -- KampeTA TD2859 01/10/2007
        wm_interval_dt_flg            vendor_req_messages.fix_status_cd%TYPE,    -- HillD   TD2818 03/18/2007
        wm_mat_dt_flg                 vendor_req_messages.fix_status_cd%TYPE,    -- PitchV  TD3175 09/11/2007
        wm_mtg_wal_flg                vendor_req_messages.fix_status_cd%TYPE,    -- GarciN  TD3291 10/01/2007
        fix_to_float_reset_dt_flg     vendor_req_messages.fix_status_cd%TYPE,    -- KampeTA TD3174 11/29/2007
        zone_id_flg                   vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        zone_source_cd_flg            vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        zone_id_dsc_flg               vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        zone_source_cd_dsc_flg        vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        sec_typ_id_flg                vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        related_sec_id_flg            vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        exch_cd_flg                   vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        crncy_cd_flg                  vendor_req_messages.fix_status_cd%TYPE,    -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
        LB_GLOBAL_CLASS_FLG           vendor_req_messages.fix_status_cd%TYPE,    -- TD#3322 added 03/06/2008 Cognizant Technology Solutions
        LB_GLOBAL_CLASS_WMC_FLG       vendor_req_messages.fix_status_cd%TYPE,    -- TD#3322 added 03/06/2008 Cognizant Technology Solutions
        CATLG_ITEM_ID_379_FLG         vendor_req_messages.fix_status_cd%TYPE,    -- TD#3389 added 04/01/2008 Cognizant Technology Solutions
        CATLG_DESC_379_FLG            vendor_req_messages.fix_status_cd%TYPE,     -- TD#3389 added 04/01/2008 Cognizant Technology Solutions
        IDX_RATIO_FLG                 vendor_req_messages.fix_status_cd%TYPE,     -- TD#3644 added 06/17/2008 Cognizant Technology Solutions
        SETTLE_DT_FLG                 vendor_req_messages.fix_status_cd%TYPE,     -- TD#3644 added 07/08/2008 Cognizant Technology Solutions
        BB_GLOBAL_FLG                 vendor_req_messages.fix_status_cd%TYPE,
        OCC_ID_FLG                    vendor_req_messages.fix_status_cd%TYPE,
        OPRA_ID_FLG                   vendor_req_messages.fix_status_cd%TYPE,
        LOANX_ID_FLG                  vendor_req_messages.fix_status_cd%TYPE,
        WSO_ID_FLG                    vendor_req_messages.fix_status_cd%TYPE,
       --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
        sp_outlook_eff_dt_flg             vendor_req_messages.fix_status_cd%TYPE,
        sp_outlook_vndr_srce_cd_flg       vendor_req_messages.fix_status_cd%TYPE,
        rtg_sp_outlook_flg                vendor_req_messages.fix_status_cd%TYPE,
        moody_outlook_eff_dt_flg          vendor_req_messages.fix_status_cd%TYPE,
        moody_outlook_vndr_srce_cd_flg    vendor_req_messages.fix_status_cd%TYPE,
        rtg_moody_outlook_flg             vendor_req_messages.fix_status_cd%TYPE,
        fitch_outlook_eff_dt_flg          vendor_req_messages.fix_status_cd%TYPE,
        fitch_outlook_vndr_srce_cd_flg    vendor_req_messages.fix_status_cd%TYPE,
        rtg_fitch_outlook_flg             vendor_req_messages.fix_status_cd%TYPE,
        sp_watch_eff_dt_flg               vendor_req_messages.fix_status_cd%TYPE,
        sp_watch_vndr_srce_cd_flg         vendor_req_messages.fix_status_cd%TYPE,
        rtg_sp_watch_flg                  vendor_req_messages.fix_status_cd%TYPE,
        moody_watch_eff_dt_flg            vendor_req_messages.fix_status_cd%TYPE,
        moody_watch_vndr_srce_cd_flg      vendor_req_messages.fix_status_cd%TYPE,
        rtg_moody_watch_flg               vendor_req_messages.fix_status_cd%TYPE,
        fitch_watch_eff_dt_flg            vendor_req_messages.fix_status_cd%TYPE,
        fitch_watch_vndr_srce_cd_flg      vendor_req_messages.fix_status_cd%TYPE,
        rtg_fitch_watch_flg               vendor_req_messages.fix_status_cd%TYPE,
      --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
      --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:start
        bb_cntry_of_domicile_flg          vendor_req_messages.fix_status_cd%TYPE,
        bb_cntry_of_incorporation_flg     vendor_req_messages.fix_status_cd%TYPE,
      --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:end
      --TD4861: DBRS ratings at the security level :WADEKS on 10-MAR-2011.
        dbrs_eff_dt_flg                   vendor_req_messages.fix_status_cd%TYPE,
        dbrs_vndr_srce_cd_flg             vendor_req_messages.fix_status_cd%TYPE,
        dbrs_rating_flg                   vendor_req_messages.fix_status_cd%TYPE,
        rtg_dbrs_flg                      vendor_req_messages.fix_status_cd%TYPE,
        dbrs_watch_eff_dt_flg             vendor_req_messages.fix_status_cd%TYPE,
        dbrs_watch_vndr_srce_cd_flg       vendor_req_messages.fix_status_cd%TYPE,
        rtg_dbrs_watch_flg                vendor_req_messages.fix_status_cd%TYPE,
        dbrs_outlook_eff_dt_flg           vendor_req_messages.fix_status_cd%TYPE,
        dbrs_outlook_vndr_srce_cd_flg     vendor_req_messages.fix_status_cd%TYPE,
        rtg_dbrs_outlook_flg              vendor_req_messages.fix_status_cd%TYPE,
      --TD4861: DBRS ratings at the security level :WADEKS on 10-MAR-2011.
        industry_subgroup_num_flg         vendor_req_messages.fix_status_cd%TYPE, -- #TD5304
        industry_group_num_flg            vendor_req_messages.fix_status_cd%TYPE, -- #TD5304
        industry_sector_num_flg           vendor_req_messages.fix_status_cd%TYPE, -- #TD5304
        wm_jpm_ind_class_flg              vendor_req_messages.fix_status_cd%TYPE,
        wm_topix_ind_class_flg              vendor_req_messages.fix_status_cd%TYPE, --TD6129
        unadjusted_pay_day_flg            vendor_req_messages.fix_status_cd%TYPE, -- #TD5442
        coupon_convention_flg             vendor_req_messages.fix_status_cd%TYPE,-- #TD5442
        exch_cd_raw_flg                   vendor_req_messages.fix_status_cd%TYPE,
        exch_cd_raw_srce_flg              vendor_req_messages.fix_status_cd%TYPE,
        --TD5899 08/17/2012 VartaV
        data_srce_status_cd_flg           vendor_req_messages.fix_status_cd%TYPE,
        payment_rank_flg                  vendor_req_messages.fix_status_cd%TYPE,
        surplus_note_flg_flg              vendor_req_messages.fix_status_cd%TYPE,
        tier_capital_flg                  vendor_req_messages.fix_status_cd%TYPE,
        mtg_pool_typ_flg                  vendor_req_messages.fix_status_cd%TYPE,
        collat_cntry_cd_flg               vendor_req_messages.fix_status_cd%TYPE,
        opt_var_margin_flg_flg            vendor_req_messages.fix_status_cd%TYPE,
        --TD5899 08/17/2012 VARTAV
        wm_boa_ml_ind_class_flg           vendor_req_messages.fix_status_cd%TYPE, --TD5969 VartaV
        muni_issue_typ_flg                vendor_req_messages.fix_status_cd%TYPE, --TD6042 Vartav 11.12.2012
        cpn_recalc_method_flg             vendor_req_messages.fix_status_cd%TYPE, --TD6066 Vartav 11.12.2012
        capital_contingent_flg            vendor_req_messages.fix_status_cd%TYPE,  -- TD5410
        opt_undl_crncy                    VARCHAR2(5), -- TD5974
        trade_description_flg             vendor_req_messages.fix_status_cd%TYPE,   --TD6262
		jpm_cntry_classification_flg      vendor_req_messages.fix_status_cd%TYPE    --TD6720
	 );
    -- TD#3389 added on 1 May 2008 Cognizant Technology Solutions
    -- Will store all the IDR values for the LB Scrub
    TYPE LEHMAN_REC_TYPE IS RECORD (
        sec_id                      security_tbl.sec_id%TYPE,
        sec_typ1                    sec_type.sec_typ1%TYPE,
        sec_typ2                    sec_type.sec_typ2%TYPE,
        sec_typ3                    sec_type.sec_typ3%TYPE,
        isr_id                      issuer.wmc_isr_id%TYPE,
        isr_fam_id                  issuer_family.wmc_isr_fam_id%TYPE,
        floater_flg                 sec_fi_data_tbl.floater_flg%TYPE,
        mortgage_class              sec_fi_data_tbl.mortgage_class%TYPE,
        financing_flg               sec_fi_data_tbl.financing_flg%TYPE,
        sp_rating                   csm.csm_sec_rating_tbl.rating%TYPE,
        sp_rat_eff_dt               csm.csm_sec_rating_tbl.eff_dt%TYPE,
        moody_rating                csm.csm_sec_rating_tbl.rating%TYPE,
        moody_rat_eff_dt            csm.csm_sec_rating_tbl.eff_dt%TYPE,
        fitch_rating                csm.csm_sec_rating_tbl.rating%TYPE,
        fitch_rat_eff_dt            csm.csm_sec_rating_tbl.eff_dt%TYPE,
        sp_rating_BBB               csm.csm_sec_rating_tbl.rating%TYPE,
        catlg_item_id_339           catlg_item.catlg_item_id%TYPE,
        catlg_item_id_339_desc      VARCHAR2(100),
        catlg_item_id_379           catlg_item.catlg_item_id%TYPE,
        catlg_item_id_379_desc      VARCHAR2(100),
        isr_sp_rating               csm.csm_sec_rating_tbl.rating%TYPE,
        isr_sp_rat_eff_dt           csm.csm_sec_rating_tbl.eff_dt%TYPE,
        isr_moody_rating            csm.csm_sec_rating_tbl.rating%TYPE,
        isr_moody_rat_eff_dt        csm.csm_sec_rating_tbl.eff_dt%TYPE
    );
    -- TD#3389 Changes End
    g_sec_data_rec          bb_sec_rec_type;
    g_sec_fsc_data_rec      bb_sec_fsc_rec_type;

    /**************************  display_message ***********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     20 Jun 2002
     ***  Type:             Public
     ***  Purpose:          This procedure display's message through dbms_output
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE display_message (
        p_message                   IN      VARCHAR2
    );

    /************************** get_sec_class **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     24 Jul 2002
     ***  Type:             Private
     ***  Purpose:          This function gets sec_class for existing
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     **************************************************************************/
    FUNCTION get_sec_class(
        p_vendor_id                 IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE
    )
    RETURN security_tbl.sec_class%TYPE;

    /************************** get_bb_ext_security *****************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     20 Jun 2002
     ***  Type:             Public
     ***  Purpose:          This overloaded function gets additional
     ***                        data for a security
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_bb_ext_security(
        p_inSec_id                  IN      security_tbl.sec_id%TYPE
    )
    RETURN bb_sec_rec_type;

    /************************** concat_bulk_data **********************************
     ***
     ***  Author:           HillD
     ***  Date Created:     15-nov-2012
     ***  Type:             Public
     ***  Purpose:          This procedure concatenates the schedule data into
     ***                    a Bloomberg compatable bulk data format.
     ***                    For format details see either of the following
     ***                      Bloomberg Data License - Per Security Product Manual
     ***                      Bloomberg Data License - Back Office Product Manual
     ***
     ***  will build a schedule with one date and one or two price/numeric columns
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION   concat_bulk_data (
        p_inSched_dt            IN      dbms_sql.date_table,
        p_inSched_rt_1          IN      dbms_sql.number_table,
        p_inSched_rt_2          IN      dbms_sql.number_table,
        p_inCol_cnt             IN      PLS_INTEGER,
        p_inBB_typ_1            IN      PLS_INTEGER,
        p_inBB_typ_2            IN      PLS_INTEGER,
        p_infmt_mask_1          IN      VARCHAR2,
        p_infmt_mask_2          IN      VARCHAR2
    )
    RETURN vendor_req_messages.wmc_column_value%TYPE;

    /************************** get_bulk_data **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     19 Apr 2005
     ***  Type:             Public
     ***  Purpose:          This function gets security data from schedules
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
   FUNCTION get_bulk_data (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inSchd_name               IN      vendor_req_messages.column_nm%TYPE
    )
    RETURN vendor_req_messages.wmc_column_value%TYPE;

    /************************** get_bb_ext_vrq **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     03 Jul 2002
     ***  Type:             Public
     ***  Purpose:          This function gets security data from VRQ
     ***                        along with fix status code flags
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_bb_ext_vrq (
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_sec_typ_id                IN      security_tbl.sec_typ_id%TYPE)
    RETURN BOOLEAN;

    /************************** bb_ext_fld_propagate ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  06/21/2002
     ***  Type:          Public
     ***  Purpose:       This function updates appropriate IDR tables
     ***                    other than CSM structure
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION bb_ext_fld_propagate(
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_sec_typ_id                IN      security_tbl.sec_typ_id%TYPE,
        p_inAction_cd               IN      vendor_request.action_cd%TYPE  := NULL
    )
    RETURN BOOLEAN;

    /************************** get_bb_vrq_data ***************************
     ***  Author:           MahadS
     ***  Date Created:     03 July 2002
     ***  Type:             Public
     ***  Purpose:          This procedure gets specified row from VRQ
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_bb_vrq_data (
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_column_nm                 IN      vendor_req_messages.column_nm%TYPE
    )
    RETURN vendor_req_messages.column_value%TYPE;

    /************************** scrub_validate_RIC *******************************
    ***
    ***  Author:        HillD
    ***  Date Created:  07/30/2008
    ***  Type:          Published
    ***  Purpose: TD#2602 RICs on Futures
    ***           Validate the RIC value for the future against the vendor_ric_xref_tbl
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    PROCEDURE scrub_validate_ric (
        p_inDatum               IN      sec_external_id.extern_id%TYPE,
        p_inCurcy_cd            IN      security_tbl.trade_curcy_cd%TYPE,
        p_inExpiration_dt       IN      sec_deriv_data_tbl.expiration_dt%TYPE,
        p_inFirst_notice_dt     IN      sec_deriv_data_tbl.first_notice_dt%TYPE,
        p_inSec_id              IN      security_tbl.sec_id%TYPE,
        p_outException_1        OUT     VARCHAR2,
        p_outException_2        OUT     VARCHAR2,
        p_outException_3        OUT     VARCHAR2
    );

     /************************** get_bb_vrq_data_clean ***************************
     ***  Author:           NNalla
     ***  Date Created:     12/06/2005
     ***  Type:             Public
     ***  Purpose:          This procedure gets specified row from VRQ
     ***
     ***  Changes:          Made as public
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_bb_vrq_data_clean (
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_column_nm                 IN      vendor_req_messages.column_nm%TYPE
    )
    RETURN vendor_req_messages.column_value%TYPE;


    /************************** transform_ratings ***************************
     ***  Author:           MahadS
     ***  Date Created:     05 July 2002
     ***  Type:             Public
     ***  Purpose:          This procedure transforms given ratings data
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION transform_ratings (
        p_column_value              IN      vendor_req_messages.column_value%TYPE,
        p_transformation_needed     IN      VARCHAR2                          DEFAULT    'Y',
        p_rating_srce_cd            IN      ref_rating.rating_srce_cd%TYPE    DEFAULT    NULL,
        p_request_id                IN      vendor_request.request_id%TYPE    DEFAULT    NULL
    )
    RETURN vendor_req_messages.column_value%TYPE;

    /************************** trim_factor_schd ******************************
     ***  Author:           MahadS
     ***  Date Created:     05 Oct 2004
     ***  Type:             Private
     ***  Purpose:          This procedure trims Bloomberg factor schedule
     ***                    to fit in 4K block
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION trim_factor_schd(
        p_inFactor_schd             IN      VARCHAR2,
        p_inColumn_order            IN      PLS_INTEGER  DEFAULT 0
    )
    RETURN vendor_req_messages.column_value%TYPE;

    /*****************************  rem_null_from_schd *************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  08/26/2004
     ***  Type:          Public
     ***  Purpose:       This function removes null rates and dates from schedule
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION rem_null_from_schd(
        p_inSchd_data        IN      vendor_req_messages.column_value%TYPE
    )
    RETURN vendor_req_messages.column_value%TYPE;

    /************************** modify_factor_schd ******************************
     ***  Author:           MahadS
     ***  Date Created:     20 July 2004
     ***  Type:             Private
     ***  Purpose:          This procedure modifies Bloomberg factor schedule
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION modify_factor_schd(
        p_inFactor_schd             IN      vendor_req_messages.column_value%TYPE,
        p_inMtg_factor_schd         IN      vendor_req_messages.column_value%TYPE,
        p_inCurr_factor             IN      vendor_req_messages.column_value%TYPE,
        p_inCurr_factor_dt          IN      vendor_req_messages.column_value%TYPE,
        p_inSec_id                  IN      vendor_req_messages.column_value%TYPE,
        p_inSec_typ_grp             IN      vendor_req_messages.column_value%TYPE
    )
    RETURN vendor_req_messages.column_value%TYPE;

    /************************** modify_multi_cpn_schd ***************************
     ***  Author:           MahadS
     ***  Date Created:     05 July 2002
     ***  Type:             Private
     ***  Purpose:          This procedure modifies Bloomberg Multi-CPN schedule
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION modify_multi_cpn_schd(
        p_cpn_schd                  IN      vendor_req_messages.column_value%TYPE,
        p_mtg_hist_cpn              IN      vendor_req_messages.column_value%TYPE,
        p_cpn_typ                   IN      vendor_req_messages.column_value%TYPE,
        p_stepup_dt                 IN      vendor_req_messages.column_value%TYPE,
        p_issue_dt                  IN      vendor_req_messages.column_value%TYPE,
        p_stepup_cpn                IN      vendor_req_messages.column_value%TYPE,
        p_flt_cpn_hist              IN      vendor_req_messages.column_value%TYPE,
        P_last_refix_dt             IN      vendor_req_messages.column_value%TYPE,
        p_cpn_rt                    IN      vendor_req_messages.column_value%TYPE,
        p_prev_cpn_dt               IN      vendor_req_messages.column_value%TYPE,
        p_mtg_pay_delay             IN      vendor_req_messages.column_value%TYPE,
        p_mat_dt                    IN      vendor_req_messages.column_value%TYPE,
        p_cpn_asof_dt               IN      vendor_req_messages.column_value%TYPE,
        p_mtg_prev_cpn              IN      vendor_req_messages.column_value%TYPE,
        p_sec_id                    IN      vendor_req_messages.column_value%TYPE)
    RETURN vendor_req_messages.column_value%TYPE;

    /************************** modify_sink_schd ***************************
     ***  Author:           MahadS
     ***  Date Created:     26 June 2002
     ***  Type:             Private
     ***  Purpose:          This procedure modifies Bloomberg sink schedule
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION modify_sink_schd (
        p_sink_schd                 IN      vendor_req_messages.column_value%TYPE,
        p_pct_sinker                IN      vendor_req_messages.column_value%TYPE,
        p_amt_issued                IN      vendor_req_messages.column_value%TYPE
    )
    RETURN  vendor_req_messages.column_value%TYPE;


    /************************** wrap_schedules ***********************************
     ***  Author:           NallaN
     ***  Date Created:     03-AUG-2005
     ***  Type:             Public
     ***  Purpose:          Wrapper function to call schedules
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION wrap_schedules(
        p_inMnemonic      IN      vendor_rules_map.mnemonic%TYPE, -- MNEMONIC
        p_inMnemonic1     IN      vendor_rules_map.mnemonic%TYPE,
        p_inMnemonic2     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic3     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic4     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic5     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic6     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic7     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic8     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic9     IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic10    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic11    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic12    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic13    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic14    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic15    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic16    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic17    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic18    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic19    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL,
        p_inMnemonic20    IN      vendor_rules_map.mnemonic%TYPE DEFAULT NULL

        )
    RETURN vendor_req_messages.column_value%TYPE;

    /*****************************  compare_bulk_fld ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  07/05/2002
     ***  Type:          Private
     ***  Purpose:       This function checks for the two bulk flds
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION compare_bulk_fld(
        p_column1                   IN      vendor_req_messages.column_trans_value%TYPE,
        p_column2                   IN      vendor_req_messages.wmc_column_value%TYPE,
        p_bb_data_type_ind          IN      PLS_INTEGER,
        p_schd_type                 IN      VARCHAR2  -- td 4918
    )
    RETURN BOOLEAN;

    /************************ check_bulk_fld *************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  07/05/2002
     ***  Type:          Public
     ***  Purpose:       This proc checks whether given field is bulk field or not
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION check_bulk_fld (
        p_column_nm                 IN      vendor_req_messages.column_nm%TYPE
    )
    RETURN BOOLEAN;

    /*****************************  chk_mcs_cpn_rt ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  08/07/2002
     ***  Type:          Public
     ***  Purpose:       This function check cpn_rt in multi cpn schedules
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION chk_mcs_cpn_rt (
        p_mcs_value                 IN      vendor_req_messages.column_value%TYPE,
        p_cpn_rt                    IN      NUMBER
    )
    RETURN BOOLEAN;

    /************************** ext_default_csm_security ***************************
     ***  Author:           MahadS
     ***  Date Created:     30 Aug 2002
     ***  Type:             Public
     ***  Purpose:          This procedure run extended CSM defaults
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE ext_default_csm_security (
        p_inVendor_product_id       IN      vendor_request.vendor_product_id%TYPE,
        p_inRequest_id              IN      vendor_request.request_id%TYPE,
        p_inSec_data                IN OUT  CSM_MAINTAIN_ENTITY.SECURITY_REC_TYPE,
        p_inAction_cd               IN      vendor_request.action_cd%TYPE
    );

    /********************** alt_validate_csm_security ***************************
     ***  Author:           MahadS
     ***  Date Created:     30 Aug 2002
     ***  Type:             Public
     ***  Purpose:          This procedure runs alternate validation rules
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE alt_validate_csm_security(
        p_inSec_data                IN      CSM_MAINTAIN_ENTITY.SECURITY_REC_TYPE,
        p_inEntity_id               IN OUT  csm_validation_exc.entity_id%TYPE,
        p_inEntity_typ              IN      csm_validation_exc.entity_typ%TYPE,
        p_inproduct_id              IN      vendor_request.vendor_product_id%TYPE,
        p_inrequest_id              IN      vendor_request.request_id%TYPE
    );

    /********************** ext_validate_csm_security ***************************
     ***  Author:           HillD
     ***  Date Created:     30 July 2008
     ***  Type:             Public
     ***  Purpose:          This procedure runs extended validation rules for
     ***                    non-csm_security columns for Scrub
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE ext_validate_csm_security(
        p_inSec_data                IN      CSM_MAINTAIN_ENTITY.SECURITY_REC_TYPE,
        p_inEntity_id               IN OUT  csm_validation_exc.entity_id%TYPE,
        p_inEntity_typ              IN      csm_validation_exc.entity_typ%TYPE,
        p_inproduct_id              IN      vendor_request.vendor_product_id%TYPE,
        p_inrequest_id              IN      vendor_request.request_id%TYPE
    );

    /********************** validate_sec_price ***************************
     ***  Author:           GarciN
     ***  Date Created:     3 September 2009
     ***  Type:             Public
     ***  Purpose:          This procedure runs extended validation rules for price
     *****************************************************************************/
    PROCEDURE validate_sec_price(
        p_inSec_data                IN      CSM_MAINTAIN_ENTITY.SECURITY_REC_TYPE,
        p_inEntity_id               IN OUT  csm_validation_exc.entity_id%TYPE,
        p_inEntity_typ              IN      csm_validation_exc.entity_typ%TYPE,
        p_inproduct_id              IN      vendor_request.vendor_product_id%TYPE,
        p_inrequest_id              IN      vendor_request.request_id%TYPE
    );

    /********************** get_def_invest_id *********************************
     ***  Author:           MahadS
     ***  Date Created:     05 Sep 2002
     ***  Type:             Public
     ***  Purpose:          This function derives default invest_id based on
     ***                                            issuer id
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_def_invest_id (
        p_wmc_isr_id                IN      issuer.wmc_isr_id%TYPE,
        p_isr_id                    IN      security_tbl.isr_id%TYPE,
        p_sec_typ1                  IN      sec_type.sec_typ1%TYPE)
    RETURN security_tbl.invest_id%TYPE;

    /************************** get_isid_cusip **********************************
     ***
     ***  Author:               MahadS
     ***  Date Created: 07 Oct 2002
     ***  Type:                 Public
     ***  Purpose:          This function gets isid-plus cusip
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_isid_cusip (
        p_sedol                     IN      security_tbl.sedol%TYPE,
        p_isin                      IN      security_tbl.isin%TYPE
    )
    RETURN security_tbl.cusip%TYPE;

    /********************** get_wmc_isr_id *********************************
     ***  Author:           MahadS
     ***  Date Created:     23 Sep 2002
     ***  Type:             Public
     ***  Purpose:          This function derives wmc_isr_id from isr_id
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_wmc_isr_id (
        p_vendor_product_id         IN      vendor_request.vendor_product_id%TYPE,
        p_related_request_id        IN      vendor_rel_request.related_request_id%TYPE,
        p_isr_id                    IN OUT  issuer.wmc_isr_id%TYPE,
        p_isr_nm                    OUT     issuer.isr_nm%TYPE,
        p_isr_long_nm               OUT     issuer.isr_long_nm%TYPE
    )
    RETURN issuer.wmc_isr_id%TYPE;

    /************************** maintain_exception_tbl ***************************
     ***  Author:           MahadS
     ***  Date Created:     30 Aug 2002
     ***  Type:             Private
     ***  Purpose:          This procedure writes exceptions to
     ***                                        csm_validation_exc table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE maintain_exception_tbl(
        p_inEntity_id               IN      csm_validation_exc.entity_id%TYPE,
        p_inEntity_typ              IN      csm_validation_exc.entity_typ%TYPE,
        p_inEntity_seq              IN      csm_validation_exc.err_seq%TYPE,
        p_inEntity_column_name      IN      csm_validation_exc.column_name%TYPE,
        p_inError_id                IN      csm_validation_exc.err_id%TYPE,
        p_inError_dsc               IN      csm_validation_exc.err_dsc%TYPE
    );

    /************************ get_sec_addn_info *************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  02/20/2003
     ***  Type:          Public
     ***  Purpose:       This proc gets additional info for security
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_sec_addn_info (
        p_inExt_id                  IN      vendor_request.ext_id%TYPE,
        p_inExt_id_typ_cd           IN      vendor_request.ext_id_typ_cd%TYPE,
        p_outSec_id                 OUT     vendor_request.sec_id%TYPE,
        p_outSec_typ_id             OUT     vendor_request.sec_typ_id%TYPE,
        p_outInvest_id              OUT     vendor_request.invest_id%TYPE,
        p_outIsr_id                 OUT     vendor_request.isr_id%TYPE,
        p_outWmc_isr_id             OUT     vendor_request.wmc_isr_id%TYPE
    );

    /********************** decrement_prefix *******************************
     ***  Author:           MahadS
     ***  Date Created:     05 Sep 2002
     ***  Type:             Private
     ***  Purpose:          This function decrements invest_id prefix
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION decrement_prefix (
        p_prefix                    IN      security_tbl.invest_id%TYPE
    )
    RETURN security_tbl.invest_id%TYPE;

    /************************ get_sec_typ_group *************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  02/20/2003
     ***  Type:          Public
     ***  Purpose:       This function returns sec type group for given sec_typ_id
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_sec_typ_group (
        p_inSec_typ_id              IN      sec_type.sec_typ_id%TYPE
    )
    RETURN sec_typ_groups.group_nm%TYPE;

    /************************ check_duplicate_security *************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  03/06/2003
     ***  Type:          Public
     ***  Purpose:       This function checks for duplicate securities
     ***                                        for a given request and returns duplicate security
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     ***************************************************************************/
    FUNCTION check_duplicate_security (
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE
    )
    RETURN security_tbl.sec_id%TYPE;

    /************************ get_sec_id_extern_data *************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  03/06/2003
     ***  Type:          Public
     ***  Purpose:       This function get sec_id for given external_id
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     ***************************************************************************/
    FUNCTION get_sec_id_extern_data (
        p_inExtern_id               IN      sec_external_id.extern_id%TYPE,
        p_inExtern_id_typ           IN      sec_external_id.extern_id_typ%TYPE
    )
    RETURN sec_external_id.sec_id%TYPE;

    /************************** is_if_quasi_sovg_flg ********************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  11/04/2005
     ***  Type:          Public
     ***  Purpose:       This function returns a flag for quasi sovg
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION   is_if_quasi_sovg_flg (
        p_inSecId                   IN      security_tbl.sec_id%TYPE
    )
    RETURN  issuer_family.all_quasi_sovg_flg%TYPE;

    /************************** is_if_quasi_sovg_flg_isr ********************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  08/09/2011
     ***  Type:          Public
     ***  Purpose:       This function returns a flag for quasi sovg
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION   is_if_quasi_sovg_flg_isr (
        p_inIsrId                   IN      security_tbl.isr_id%TYPE
    )
    RETURN  issuer_family.all_quasi_sovg_flg%TYPE;

    /************************** quasi_sovg_relationship ********************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  11/04/2005
     ***  Type:          Public
     ***  Purpose:       This proc maintains quasi soverign relationship
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE   quasi_sovg_relationship(
        p_inSecId                   IN      security_tbl.sec_id%TYPE,
        p_inWMCIsrFamId             IN      issuer_family.wmc_isr_fam_id%TYPE
    );


    /************************** get_sec_quasi_sovg_rel ********************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  11/04/2005
     ***  Type:          Public
     ***  Purpose:       This proc get quasi soverign relationship
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION   get_sec_quasi_sovg_rel(
        p_inSecId                   IN      security_tbl.sec_id%TYPE
    )
    RETURN issuer_family.wmc_isr_fam_id%TYPE;


   /************************** is_if_quasi_sovg ********************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  11/04/2005
     ***  Type:          Public
     ***  Purpose:       This function returns a flag for issuer
     ***                 family all quasi sovg flag
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION   is_if_quasi_sovg (
        p_inSecId                   IN      security_tbl.sec_id%TYPE
    )
    RETURN  issuer_family.all_quasi_sovg_flg%TYPE;

   /************************** is_if_quasi_sovg_isr ********************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  11/04/2005
     ***  Type:          Public
     ***  Purpose:       This function returns a flag for issuer
     ***                 family all quasi sovg flag
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION   is_if_quasi_sovg_isr (
        p_inIsrId                   IN      security_tbl.isr_id%TYPE
    )
    RETURN  issuer_family.all_quasi_sovg_flg%TYPE;


    /************************** verify_clob_data *********************************
     ***
     ***  Author:        IgnatIV
     ***  Date Created:  11/10/2005
     ***  Type:          Public
     ***  Purpose:       This proc removes rows from the clob data
     ***                 which could cause data map failure.
     ***                 TD 2251 and 1922.
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE verify_clob_data (
        p_inData CLOB,
        p_inCol  VARCHAR2
    );

    /************************** get_future_data *********************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Gets and parses the future deliverable bonds string
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_future_data (
        p_inProduct_id      IN    vendor_request.vendor_product_id%TYPE,
        p_inRequest_id      IN    vendor_request.request_id%TYPE
    )
    RETURN BOOLEAN;

    /**************************  setup_fut_chain_req  ***********************
    ***
    ***  Author:        HillD
    ***  Date Created:  05/03/2006
    ***  Type:          Public
    ***  Purpose:       request underlying security for setup and scrub
    ***                 Created for TD2566.
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION setup_fut_chain_req(
        p_inProduct_id    vendor_request.vendor_product_id%TYPE,
        p_inRequest_id    vendor_request.request_id%TYPE,
        p_inAction_cd     vendor_request.action_cd%TYPE,
        p_inSec_id        vendor_request.sec_id%TYPE
    )
    RETURN BOOLEAN;

   /************************** setup_future_chain *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       This procedure spawns an entity for futures, if it does not
    ***                 exists in IDR tables
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION setup_future_chain(
        p_inProduct_id   vendor_request.vendor_product_id%TYPE,
        p_inRequest_id   vendor_request.request_id%TYPE
    )
    RETURN BOOLEAN;

    /************************** get_future_chain *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       This procedure gets the future contracts from vrm
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION get_future_chain(
        p_inProduct_id   vendor_request.vendor_product_id%TYPE,
        p_inRequest_id   vendor_request.request_id%TYPE
    )
    RETURN DBMS_SQL.VARCHAR2_TABLE;         -- TD2566 6/10/2006 HillD

   /************************** get_bulk_column_value *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       get the mnemonic value from sys context
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION get_bulk_column_value(
        p_inMnemonic   vendor_req_messages.column_nm%TYPE
    )
    RETURN vendor_req_messages.column_trans_value%TYPE;

    /**************************  maintain_factor ***************************
    ***
    ***  Author:        NallaN
    ***  Date Created:  12/02/2005
    ***  Type:          Private
    ***  Purpose:       This proc maintains factor in cons_rel_stat
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    PROCEDURE maintain_factor(
        p_inProduct_id  vendor_request.vendor_product_id%TYPE,
        p_inRequest_id  vendor_request.request_id%TYPE,
        p_inSec_id      vendor_request.sec_id%TYPE
    );

    /************************** populate_dvbonds *********************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Parses the future deliverable bonds string
    ***                 and populates vrm in fut_dblvrble_bonds_bb_unique trans value
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION populate_dvbonds(
        p_inProduct_id      IN    vendor_request.vendor_product_id%TYPE,
        p_inRequest_id      IN    vendor_request.request_id%TYPE
    )
    RETURN VARCHAR2;

     /************************** get_idx_invest_id **********************************
     ***
     ***  Author:           KampeTA
     ***  Date Created:     13 January 2006
     ***  Type:             Public
     ***  Purpose:          Reutrn the invewst_id for the VENDOR_TICKER
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION   get_idx_invest_id (
        p_inVendor_Ticker           IN      security_tbl.vendor_ticker%TYPE
     )
    RETURN security_tbl.invest_id%TYPE;

    /************************** is_rating_valid *********************************
    ***
    ***  Author:        IgnatIV
    ***  Date Created:  04/12/2006
    ***  Type:          Public
    ***  Purpose:       returns true if the rating is valid for the given source cd
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION is_rating_valid (
        p_inRating          IN    ref_rating.rating%TYPE,
        p_inRating_srce_cd  IN    ref_rating.rating_srce_cd%TYPE
    )
    RETURN BOOLEAN;

    /*****************************  get_security_expire_dt ***************************
    ***
    ***  Author:        HillD
    ***  Date Created:  03/16/2006
    ***  Type:          Public
    ***  Purpose:       calculates the expire date of a future based on it's ticker.
    ***                 assumes that the tickers are all in the future.
    ***                 Created for 2566.
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION get_security_expire_dt(
        p_inTicker             VARCHAR2
    )
    RETURN DATE;

    /************************** is_duration_within_tolerance ********************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  03/22/2006
     ***  Type:          Public
     ***  Purpose:       This returns true/false for duration
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/

    FUNCTION is_duration_within_tolerance (
        p_sec_typ_id            IN NUMBER,
        p_col_value             IN NUMBER,
        p_db_value              IN NUMBER
    )
    RETURN NUMBER ;

    /************************** get_vndrmsg_hst_transval ********************
     ***
     ***  Author:        Venkata Pitchuka
     ***  Date Created:  10/26/2006
     ***  Type:          Published
     ***  Purpose:       This function returns historical translated value for a given
     ***                 vendor request id and column, check value.
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     **************************************************************************/
     FUNCTION get_vndrmsg_hst_transval(
        p_invendor_id     IN    vendor_req_messages_hst.vendor_product_id%TYPE DEFAULT 1,
        p_inreq_id        IN    vendor_req_messages_hst.request_id%TYPE,
        p_check_val       IN    VARCHAR2,
        p_column_nm       IN    vendor_req_messages_hst.column_nm%TYPE,
        p_incol_trans_seq IN    vendor_req_messages_hst.col_trans_seq%TYPE DEFAULT 0
    )
    RETURN  vendor_req_messages.column_trans_value%TYPE;

    /************************** maintain_sec_attr_list_tbl ***************************
     ***  Author:           KampeTA
     ***  Date Created:     10 Jan 2007
     ***  Type:             Private
     ***  Purpose:          This procedure maintians the sec_attr_list_tbl
     ***                    for a security based on a parsed string.
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE maintain_sec_attr_list_tbl(
        p_inSec_id               IN      sec_attr_list_tbl.sec_id%TYPE,
        p_inSrce_cd              IN      sec_attr_list_tbl.srce_cd%TYPE,
        p_inAttr_id              IN      sec_attr_list_tbl.attr_id%TYPE,
        p_inList_data            IN      vendor_req_messages.column_value%TYPE
    );

    /************************** get_code_value ***************************
     ***  Author:           KampeTA
     ***  Date Created:     10 Jan 2007
     ***  Type:             Private
     ***  Purpose:          This function returns the code_value based on a
     ***                    long or short description.
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_code_value(
        p_inSrce_cd              IN      ref_attr_value.srce_cd%TYPE,
        p_inAttr_id              IN      ref_attr_value.attr_id%TYPE,
        p_inDescr                IN      ref_attr_value.long_dsc%TYPE,
        p_inDescrType            IN      CHAR DEFAULT 'S'
    )
    RETURN  ref_attr_value.code_value%TYPE;

   /************************** check_blk_zero ***********************************
    ***  Author:           KampeTA
    ***  Date Created:     01-30-2007
    ***  Type:             Public
    ***  Purpose:          Function to check if bulk format has zero rows
    ***                    If zero rows are found, NUL is returned, otherwise value is unchanged
    ***                    Assumption that the string has 2 dimensions and is equal to
    ***                    current constant of ";2;0;"
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION check_blk_zero(
        p_inBB_Fld_Id      IN      bb_fields.field_id%TYPE
    )
    RETURN  vendor_req_messages.column_value%TYPE;

    /************************** wrap_erp_types ***********************************
    ***  Author:           KampeTA
    ***  Date Created:     01/30/2007
    ***  Type:             Public
    ***  Purpose:          Wrapper function for muni erp types
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION wrap_erp_types(
        p_inBB_Fld_Id             IN      bb_fields.field_id%TYPE
    )
    RETURN  vendor_req_messages.column_value%TYPE;

    /************************** wrap_interval_dt_schd ***********************************
    ***  Author:           HillD
    ***  Date Created:     04/30/2007
    ***  Type:             Public
    ***  Purpose:          Wrapper function for muni erp types
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION wrap_interval_dt_schd(
        p_inInterval_dt             IN      vendor_rules_map.mnemonic%TYPE,
        p_inNxt_cpn_dt              IN      vendor_rules_map.mnemonic%TYPE,
        p_inSec_id                  IN      vendor_rules_map.mnemonic%TYPE
    )
    RETURN  vendor_req_messages.column_value%TYPE;

    /************************** chk_sec_factor_schd ********************
     ***
     ***  Author:        Venkata Pitchuka
     ***  Date Created:  2/5/2007
     ***  Type:          Published
     ***  Purpose:       This function returns 0 if security factor in
     ***                 sec_factor_schd_tbl for MAX(eff_dt) else
     ***                 returns 1
     ***
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
    **************************************************************************/
    FUNCTION chk_sec_factor_schd(
        p_insec_id          IN    sec_factor_schd.sec_id%TYPE
    )
    RETURN NUMBER;

    /************************** order_erp_types ***********************************
    ***  Author:           KampeTA
    ***  Date Created:     02/20/2007
    ***  Type:             Public
    ***  Purpose:          This function will sort a bulk format value
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION order_erp_types(
        p_incolumn_Value           IN      vendor_req_messages.column_trans_value%TYPE
    )
    RETURN  vendor_req_messages.column_trans_value%TYPE;

    /************************** maintain_security_attribute ***********************************
    ***  Author:           KampeTA
    ***  Date Created:     11/29/2007
    ***  Type:             Public
    ***  Purpose:
    ***
    ***  Changes: TD3174 adding FIX_TO_FLOAT_RESET_DT attribute. this proc can be reused
    ***           for additional  attributes when they are added
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    PROCEDURE maintain_security_attribute(
                                          p_inSec_Id             IN  security_attribute.sec_id%TYPE,
                                          p_inAttr_Name          IN  security_attribute.name%TYPE,
                                          p_inAttr_Value         IN  VARCHAR2
    );

   /************************** get_security_attribute *******************************
    ***
    ***  Author:        KampeTA
    ***  Date Created:  11/30/2007
    ***  Type:          Public
    ***  Purpose:
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION get_security_attribute(
                  p_inSec_id security_attribute.sec_id%TYPE,
                  p_inAttrName   security_attribute.name%TYPE
    )
    RETURN VARCHAR2;



    /************************** maintain_sec_zone *******************************
    ***
    ***  Author: TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    ***  Date Created:  02/18/2008
    ***  Type:          Public
    ***  Purpose:
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    PROCEDURE maintain_sec_zone (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inZone_id                 IN      sec_zone.zone_id%TYPE,
        p_inZone_source_cd          IN      sec_zone.zone_source_cd%TYPE,
        p_inEffective_dt            IN      DATE DEFAULT SYSDATE
    );


   /************************** get_zone_id *******************************
    ***
    ***  Author:  TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    ***  Date Created:  02/18/2008
    ***  Type:          Public
    ***  Purpose:
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_zone_id(
        p_inSec_id sec_zone.sec_id%TYPE
    )
    RETURN sec_zone.zone_id%TYPE;

   /************************** get_zone_id_dsc *******************************
    ***
    ***  Author:   TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    ***  Date Created:  02/18/2008
    ***  Type:          Public
    ***  Purpose:
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_zone_id_dsc(
        p_inZone_id process_zone.zone_id%TYPE
    )
    RETURN process_zone.zone_nm%TYPE;

   /************************** get_zone_source_id *******************************
    ***
    ***  Author:  TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    ***  Date Created:  02/18/2008
    ***  Type:          Public
    ***  Purpose:
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_zone_source_cd(
        p_inSec_id sec_zone.sec_id%TYPE
    )
    RETURN sec_zone.zone_source_cd%TYPE;

   /************************** get_zone_source_cd_dsc ***************************
    ***
    ***  Author:  TD#3352 added 2008-FEB-18 Cognizant Technology Solutions
    ***  Date Created:  02/18/2008
    ***  Type:          Public
    ***  Purpose:
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_zone_source_cd_dsc(
        p_inZone_Src_Cd sec_zone.zone_source_cd%TYPE
    )
    RETURN ref_attr_value.short_dsc%TYPE;

    -- TD#3352  Changes End
    /************************** get_nss_lb_global_class_cd ********************
     ***
     ***  Author:        TD#3322 added 2008-APR-12 Cognizant Technology Solutions
     ***  Date Created:
     ***  Type:          Published
     ***  Purpose:       This function returns Global Lehman class code for a given security
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***  sec_typ1, sec_typ2, sec_typ3 are added in input param list
     ***
     *** Modified on 2008-JUN-17 for TD#3654 Cognizant Technology Solutions
     *** Include Mortgage class
     *** Modified on 2008-AUG-07 for TD#3728 Cognizant Technology Solutions
     *** Include Finance Flag
     *** Modified on 2008-SEP-08 for TD#3759 Cognizant Technology Solutions
     *** Include Trade Curr Code
     ***
     **************************************************************************/
    FUNCTION get_nss_lb_global_class_cd(
        p_inRequest_id           IN     vendor_request.request_id%TYPE,
        p_inIsr_id               IN     issuer.isr_id%TYPE,
        p_inSec_typ1             IN     security.sec_typ1%TYPE              DEFAULT CSM_COMMON.NA,
        p_inSec_typ2             IN     security.sec_typ2%TYPE              DEFAULT CSM_COMMON.NA,
        p_inSec_typ3             IN     security.sec_typ3%TYPE              DEFAULT CSM_COMMON.NA,
        p_inSec_typ4             IN     security.sec_typ4%TYPE              DEFAULT CSM_COMMON.NA,
        p_inMort_cls             IN     sec_fi_data_tbl.mortgage_class%TYPE DEFAULT CSM_COMMON.NA,
        p_infin_flg              IN     sec_fi_data_tbl.financing_flg%TYPE  DEFAULT NULL,
        p_inTd_cur               IN     security.trade_curcy_cd%TYPE        DEFAULT CSM_COMMON.NA
    )
    RETURN  fi_lb_mthly.issrclscd%TYPE;
    /************************** get_vndr_sec_class_cd ********************
     ***
     ***  Author:        TD#3322 Cognizant Technology Solutions
     ***  Date Created:  16/02/2008
     ***  Type:          Published
     ***  Purpose:       This function returns Lehman class code for a given security
     ***                 Source get_vndr_sec_class_cd
     ***  sec_typ1, sec_typ2, sec_typ3 are added in input param list
     ***
     *** Modified on 2008-JUN-17 for TD#3654 Cognizant Technology Solutions
     *** Include Mortgage Class
     *** Modified on 2008-AUG-07 for TD#3728 Cognizant Technology Solutions
     *** Include Finance Flag
     *** Modified on 2008-SEP-08 for TD#3759 Cognizant Technology Solutions
     *** Include Trade Curr Code and Isr Id
     ***
     ***
     **************************************************************************/

    FUNCTION get_vndr_sec_class_cd(
        p_inSec_id   IN          security.sec_id%TYPE,
        p_inIsr_id   IN          issuer.isr_id%TYPE                  DEFAULT NULL,
        p_inSec_typ1 IN          security.sec_typ1%TYPE              DEFAULT CSM_COMMON.NA,
        p_inSec_typ2 IN          security.sec_typ2%TYPE              DEFAULT CSM_COMMON.NA,
        p_inSec_typ3 IN          security.sec_typ3%TYPE              DEFAULT CSM_COMMON.NA,
        p_inSec_typ4 IN          security.sec_typ4%TYPE              DEFAULT CSM_COMMON.NA,
        p_inMort_cls IN          sec_fi_data_tbl.mortgage_class%TYPE DEFAULT CSM_COMMON.NA,
        p_infin_flg  IN          sec_fi_data_tbl.financing_flg%TYPE  DEFAULT NULL,
        p_inTd_cur   IN          security.trade_curcy_cd%TYPE        DEFAULT CSM_COMMON.NA
    )
    RETURN    fi_lb_mthly.issrclscd%TYPE;

    /************************** get_vndr_lb_class_cd ********************
     ***
     ***  Author:        TD#3591 Cognizant Technology Solutions
     ***  Date Created:  29/04/2008
     ***  Type:          Published
     ***  Purpose:       This function returns Lehman class code for a given security
     ***                 Source get_vndr_lb_class_cd
     **************************************************************************/
    FUNCTION get_vndr_lb_class_cd(
        p_inSec_id   IN          security.sec_id%TYPE
    )
    RETURN    fi_lb_mthly.lb_class_cd%TYPE;
    /************************** maintain_lehman_data *******************************
    ***
    ***  Author      :  TD#3389 Cognizant Technology Solutions
    ***  Date Created:  01/04/2008
    ***  Type        :  Public
    ***  Purpose     :
    ***
    ***  Changes     :  TD#3389
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    PROCEDURE maintain_lehman_data (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_incatlg_item_id           IN      catlg_item.catlg_item_id%TYPE,
        p_inCatlg_id                IN      catlg_item.catlg_id%TYPE
    );
    /************************** maintain_lehman_data *******************************
    ***
    ***  Author      :  TD#3389 Cognizant Technology Solutions
    ***  Date Created:  01/04/2008
    ***  Type        :  Public
    ***  Purpose     :
    ***
    ***  Changes     :  TD#3389
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION    get_lehman_data   (
        p_inSec_id                      IN      security_tbl.sec_id%TYPE,
        p_in_isr_id                     IN       security_tbl.isr_id%TYPE
    )
    RETURN  lehman_rec_type;

    /************************** maintain_lehman_sec_catlg *******************************
    ***
    ***  Author      : TD#3389 added by Cognizant Technology Solutions
    ***  Date Created:  05/26/2008
    ***  Type        :  Public
    ***  Purpose     :
    ***
    ***  Changes     :  TD#3389
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    *****************************************************************************/
    PROCEDURE maintain_lehman_sec_catlg (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_incatlg_item_id           IN      catlg_item.catlg_item_id%TYPE,
        p_inCatlg_id                IN      catlg_item.catlg_id%TYPE
    );
    --TD#3389 Changes End.

    /************************** maintain_sec_factor *******************************
    ***
    ***  Author: TD#3644  added 2008-Jun-17 Cognizant Technology Solutions
    ***  Date Created:  06/17/2008
    ***  Type:          Public
    ***  Purpose: Save the IPS security factor value in sec_factor_schd_tbl
    ***
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    PROCEDURE maintain_sec_factor (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE         ,
        p_infctr                    IN      sec_factor_schd_tbl.fctr%TYPE    ,
        p_inEffective_dt            IN      sec_factor_schd_tbl.eff_dt%TYPE  ,
        p_inFctrTyp                 IN      sec_factor_schd_tbl.fctr_typ%TYPE,
        p_inSrceCd                  IN      sec_factor_schd_tbl.srce_cd%TYPE
    );

    /************************** maintain_lockup_expiration_dt *******************************
    ***
    ***  Author       : khetrm:TD#5082
    ***  Date Created : 05/19/2011
    ***  Type         : Public
    ***  Purpose      : update the lockup expiration date from CSFB feed
    ***                 into security_attribute table.
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    PROCEDURE maintain_lockup_expiration_dt;

    /************************************************************************
    *
    *   maintain_sec_descriptor_table -- TD 5543
    *   KhetrM
    *   Add trade description to sec_descriptor table for attr_id 309
    *
    *   This description will be added only to the master leg.
    *   for IRS_VANILLA and INFLATION_SWAP
    *
    ***********************************************************************/
    PROCEDURE maintain_sec_descriptor_table (
             p_inSecId             IN    sec_descriptor.sec_id%TYPE,
             p_inSrceCd            IN    sec_descriptor.srce_cd%TYPE,
             p_inDescriptorTyp     IN    sec_descriptor.descriptor_typ%TYPE,
             p_inDescriptorAttrId  IN    sec_descriptor.descriptor_attr_id%TYPE,
             p_inDescriptor        IN    sec_descriptor.descriptor%TYPE,
             p_inLongDescriptor    IN    sec_descriptor.long_descriptor%TYPE
         );


  /************************************************************************-----------------------
   *  maintain_custom_cpn_schd : PUBLISHED
   *
   *  maintain custom_cpm_schd based on comparison to next_cpn_dt and prev_cpn_dt
   *
   *  @param  p_inSec_id                  security id
   *  @param  p_inPrev_cpn_dt             previous coupon date date
   *  @param  p_inNext_cpn_dt             nextcoupon date
   *
   ***********************************************************************/

    PROCEDURE   maintain_custom_cpn_schd   (
        p_inSec_id                   IN      security_tbl.sec_id%TYPE,
        p_inPrev_cpn_dt              IN      sec_period_data_tbl.prev_cpn_dt%TYPE,
        p_inNext_cpn_dt              IN      sec_period_data_tbl.next_cpn_dt%TYPE,
        p_inPmt_freq                 IN      param_tab.param_value%TYPE,
        p_inDelay_days               IN      sec_fi_data_tbl.delay_days%TYPE,
        p_inFirst_accrual_dt         IN      sec_fi_data_tbl.first_accrual_dt%TYPE
    );
    
    
    -------------------------------------------------------------------------
    --<B>
    --  derive_sec_descriptor : PUBLIC
    --
    --  TD6262. Security naming convention.
    --
    --  This Procedure is called as part of Manual Security Setup/Replicate security and shall
    --  derive the security description for Options.
    --   
    --
    --</B>
    --  @param  p_sec_id                  Sec_Id
    --          p_called_from             p_called_from . Called from forms or replicate entity.
	-------------------------------------------------------------------------
	
   PROCEDURE derive_sec_descriptor(p_sec_id      IN security_tbl.sec_id%TYPE,
	                                 p_called_from IN VARCHAR2
	);

END MAINTAIN_BB_SEC_PKG;
/
sho err
