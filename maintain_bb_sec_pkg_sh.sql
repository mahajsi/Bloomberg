PROMPT Creating body MAINTAIN_BB_SEC_PKG, please wait...

CREATE OR REPLACE PACKAGE BODY MAINTAIN_BB_SEC_PKG
IS
--
/* PACKAGE BODY PVCS $Revision: bloomberg_WIP_deonp/32 $ $Modtime:   Oct 07 2005 14:00:22  $ */
-----------------------------------------------------------------------------
--                                                                         --
-- Author    : Multiple                                                     --
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
   $Revision: bloomberg_WIP_deonp/32 $
   $Log: maintain_bb_sec_pkg_sh.sql $
   Revision bloomberg_WIP_deonp/32 2011/08/10 19:52:12 deonp
     TD 2739 - quasi sovg

   Revision bloomberg_WIP_deonp/31 2011/08/09 18:40:18 deonp
     TD 2739 to test

   Revision bloomberg_WIP_deonp/30 2011/07/21 15:30:11 deonp
     sec paydn fix

   Revision bloomberg_WIP_deonp/29 2011/07/21 15:07:51 deonp
     sec paydn fix

   Revision bloomberg_WIP_deonp/28 2011/07/21 14:10:37 deonp
     TD5248 - fix for scrub exceptions

   Revision bloomberg_WIP_deonp/27 2011/07/21 13:23:10 deonp
     TD5248 - fix for scrub exceptions

   Revision bloomberg_WIP_deonp/26 2011/07/20 20:53:46 deonp
     fix paydown loss - delete

   Revision bloomberg_WIP_deonp/25 2011/07/20 20:43:42 deonp
     fix paydown loss - delete

   Revision bloomberg_WIP_deonp/24 2011/07/14 19:29:48 deonp
     TD 5248 - fic long paydown schedules

   Revision bloomberg_khetrm/9 2011/06/09 10:47:07 khetrm
     merged

   Revision bloomberg_WIP_deonp/23 2011/06/08 21:31:03 deonp
     td 4981 - fixed field map rule

   Revision bloomberg_WIP_deonp/22 2011/06/08 20:34:36 deonp
     td 4981 - fixed field map rule

   Revision bloomberg_WIP_deonp/21 2011/06/08 19:13:26 deonp
     td 4981 - fixed field map rule

   Revision bloomberg_WIP_deonp/20 2011/06/08 18:25:18 deonp
     merged

   Revision bloomberg_khetrm/8 2011/06/08 12:02:50 khetrm
     TD5082:06/17:khetrm:Mail format updated.

   Revision bloomberg_khetrm/7 2011/06/08 11:31:37 khetrm
     TD5082:06/17:khetrm:Mail format updated.

   Revision bloomberg_khetrm/6 2011/06/08 11:03:07 khetrm
     TD5082:06/17:khetrm:Mail format updated.

   Revision bloomberg_khetrm/5 2011/06/08 10:00:48 khetrm
     merged

   Revision bloomberg_WIP_deonp/19 2011/06/06 16:45:47 deonp
     TD 4918 - fixed format of WD and TD Hist columns

   Revision bloomberg_khetrm/4 2011/06/06 11:37:10 khetrm
     TD5082:khetrm:0617:Promoted lock_up_expiration_dt to IBUS.

   Revision bloomberg_khetrm/3 2011/06/01 14:59:03 khetrm
     merged

   Revision bloomberg_WIP_deonp/18 2011/05/27 18:18:27 deonp
     td 4918 - put back lockout expiration

   Revision bloomberg_WIP_deonp/17 2011/05/27 18:09:57 deonp
     td 4918 - removed lockout expiration

   Revision bloomberg_WIP_deonp/16 2011/05/25 20:19:22 deonp
     td 4918 - fixed paydn

   Revision bloomberg_WIP_deonp/15 2011/05/25 12:46:14 deonp
     merged

   Revision bloomberg_wadeks/8 2011/05/25 09:53:18 wadeks
     TD4861: DBRS ratings at the security level : Crucible Comments.

   Revision bloomberg_khetrm/2 2011/05/23 08:08:33 khetrm
     5082:06/17:khetrm:Updated error messages in the script.

   Revision bloomberg_khetrm/1 2011/05/20 16:17:07 khetrm
     5082:06/17:khetrm:Added maintain_lockup_expiration_dt to load lockup expiration date from CSFB Feed.

   Revision bloomberg_WIP_deonp/13 2011/05/18 18:27:22 deonp
     TD 4918 - paydn loss changed column names

   Revision bloomberg_WIP_deonp/12 2011/05/17 20:04:23 deonp
     TD 4918 - paydn loss changed selection criteria for WD field

   Revision bloomberg_WIP_deonp/11 2011/05/17 20:02:27 deonp
     TD 4918 - paydn loss changed selection criteria for WD field

   Revision bloomberg_WIP_deonp/10 2011/05/17 18:49:45 deonp
     TD 4918 - paydn loss changed order of select

   Revision bloomberg_WIP_deonp/9 2011/05/12 19:42:23 deonp
     TD 4918 - paydn loss

   Revision bloomberg_WIP_deonp/8 2011/05/11 17:01:06 deonp
     TD 4918 - paydown loss changes

   Revision bloomberg_WIP_deonp/7 2011/05/11 14:55:33 deonp
     merged

   Revision bloomberg_WIP_deonp/6 2011/05/10 18:17:50 deonp
     TD 4918 - Paydown Loass

   Revision bloomberg_WIP_deonp/5 2011/05/09 20:15:42 deonp
     TD 4981 - Paydown Loass changes

   Revision blmbrg_dev1_hilld/3 2011/04/18 15:32:51 hilld
     merged

   Revision bloomberg_WIP_deonp/4 2011/04/05 19:56:08 deonp
     TD 5116 - FIXED CATLG SCRUB

   Revision bloomberg_WIP_deonp/3 2011/02/08 14:50:51 deonp
     5065 - changes

   Revision bloomberg_WIP_deonp/2 2011/02/03 20:41:18 deonp
     td 5065 LB Catalog defaults

   Revision bloomberg_WIP_deonp/1 2011/01/28 19:33:25 deonp
     td 5065 LB Defaults

   Revision bloomberg_wadeks/7 2011/03/31 08:56:23 wadeks
     TD4861: DBRS ratings at the security level


   Revision bloomberg_wadeks/5 2011/03/10 12:31:02 wadeks
     TD4861: DBRS ratings at the security level

   Revision bloomberg_WIP_deonp/3 2011/02/08 14:50:51 deonp
     5065 - changes

   Revision bloomberg_WIP_deonp/2 2011/02/03 20:41:18 deonp
     td 5065 LB Catalog defaults

   Revision bloomberg_WIP_deonp/1 2011/01/28 19:33:25 deonp
     td 5065 LB Defaults

   Revision bloomberg_wadeks/4 2010/10/18 08:43:00 wadeks
     TD4595:BuryeG:Move to test:Added code for 2 new fields requested from bloomberg.

   Revision bloomberg_20100305_WIP_buryeg/10 2010/10/12 15:07:14 buryeg
     TD4595:BuryeG:Code revert.Will put back code when data entered in attribute_definition table

   Revision bloomberg_20100305_WIP_buryeg/9 2010/10/12 06:02:20 buryeg
     TD4595:BuryeG:Move to test

   Revision bloomberg_20100305_WIP_buryeg/8 2010/10/12 05:35:59 buryeg
     TD4595:BuryeG:Move to test:Added code for 2 new fields requested from bloomberg.

   Revision bloomberg_wadeks/3 2010/07/28 10:13:30 wadeks
     TD4203 Create a Separate Sec Type Group for Bank Loans :WADEKS on 28-JUL-2010. Changed for Indentation only.

   Revision bloomberg_wadeks/2 2010/07/27 13:59:57 wadeks
     TD4203 Create a Separate Sec Type Group for Bank Loans :WADEKS on 02-JUL-2010.

   Revision bloomberg_20100305_WIP_buryeg/7 2010/07/20 09:46:53 buryeg
     No Comment Entered

   Revision bloomberg_20100305_WIP_buryeg/6 2010/07/20 09:18:32 buryeg
     TD4747 IPS and Factor Schedule:Buryeg:07/20/2010: Promoting to Stage

   Revision bloomberg_20100305_WIP_buryeg/5 2010/07/19 08:57:55 buryeg
     No Comment Entered

   Revision bloomberg_20100305_WIP_buryeg/4 2010/07/06 12:55:08 buryeg
     TD 4747:Buryeg:Req H2: Modified the modify_factor_schd to add CORP and GOVT as factor schedule is required for these 2.

   Revision bloomberg_wadeks/1 2010/06/30 08:36:51 wadeks
     TD4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 30-JUN-2010.

   Revision bloomberg_20100305_WIP_buryeg/3 2010/04/29 09:39:23 buryeg
     TD 4506 :BuryeG :Removing redundant code from alt_validate_csm_security procedure

   Revision bloomberg_20100305_WIP_buryeg/2 2010/04/01 10:28:04 buryeg
     TD4506 buryeg updated external identifier names.

   Revision bloomberg_20100305_WIP_buryeg/1 2010/03/22 07:08:08 buryeg
     Modified by buryeg;TD4506 NSS expiring existing ISIN because of duplicate sedol

   Revision bloomberg_WIP_garcin/17 2010/02/02 18:15:54 garcin
     TD4333 fix duplicate check for CUSIP, ISIN, and SEDOL for options

   Revision bloomberg_WIP_garcin/16 2010/01/28 14:49:47 garcin
     TD4333 check for duplicate ISIN

   Revision bloomberg_WIP_garcin/15 2010/01/08 22:19:49 garcin
     promote to 2/12 release

   Revision bloomberg_WIP_garcin/14 2010/01/08 16:12:36 garcin
     merged

   Revision bloomberg_WIP_garcin/13 2009/12/03 17:07:15 garcin
     merged

   Revision bloomberg_WIP_garcin/11 2009/11/19 20:10:11 garcin
     TD4333 set SYM to INVEST_ID for Stock Options

   Revision Bloomberg_WIP_hsus/5 2009/11/18 08:28:29 hsus
     TD4136 - changed wmc column data formatting for loan repayment schedule.

   Revision Bloomberg_WIP_hsus/4 2009/11/16 23:35:42 hsus
     TD4136- fix logic to retrive data from the schedule table

   Revision Bloomberg_WIP_hsus/3 2009/11/13 21:29:42 hsus
     TD4136 - Bank Loans - Add HYBL Repayment Schedule and Source from BBG

   Revision Bloomberg_WIP_hsus/2 2009/11/13 19:58:19 hsus
     merged

   Revision bloomberg_WIP_jadhas_jadhas/1 2009/11/12 09:18:55 jadhas
     TD4328: modified on 11/12

   Revision bloomberg_WIP_garcin/10 2009/10/22 15:00:56 garcin
     TD4330 new options symbology

   Revision bloomberg_WIP_garcin/9 2009/09/04 12:45:09 garcin
     merged

   Revision bloomberg_WIP_garcin/8 2009/09/04 12:33:13 garcin
     TD4237 fix sequence

   Revision bloomberg_WIP_garcin/7 2009/09/03 17:09:49 garcin
     TD4273 routine to validate price

   Revision bloomberg_WIP_garcin/6 2009/09/03 14:31:48 garcin
     TD4273 fix to check digit when finding duplicate securities

   Revision bloomberg_WIP_garcin/5 2009/05/22 16:22:55 garcin
     merged

   Revision bloomberg_WIP_garcin/4 2009/05/22 15:59:23 garcin
     TD4126 refer to csm_maintain_rating

   Revision bloomberg__WIP_Dibyendu_duttad/22 2009/04/21 14:52:37 duttad
     TD 4070 Reset the priority after publising issuer

   Revision bloomberg_WIP_garcin/3 2009/04/15 19:22:22 garcin
     TD4070 publish the issuer if we update the isr_fam_id

   Revision bloomberg__WIP_Dibyendu_duttad/21 2008/11/26 21:35:43 duttad
     merged

   Revision bloomberg_WIP_pdrive_hilld/23 2008/11/06 19:50:25 hilld
        TD 2602 RIC Futures

   Revision bloomberg_WIP_pdrive_hilld/22 2008/11/06 17:57:02 hilld
        TD 2602 RIC Futures

   Revision bloomberg_WIP_pdrive_hilld/21 2008/10/29 18:57:24 hilld
        TD 2602 RIC Futures

   Revision bloomberg_WIP_pdrive_hilld/20 2008/10/29 13:43:38 hilld
        merged

   Revision bloomberg__WIP_Dibyendu_duttad/20 2008/10/23 15:37:04 duttad
        TD3787

   Revision bloomberg_WIP_pdrive_hilld/19 2008/10/22 18:44:22 hilld
        td2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/18 2008/10/22 15:56:17 hilld
        td2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/17 2008/10/22 13:27:37 hilld
        td2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/16 2008/10/21 17:46:28 hilld
        TD 2602 RIC Futures

   Revision bloomberg_WIP_pdrive_hilld/15 2008/10/21 16:55:18 hilld
        merged

   Revision bloomber_sreeni_csr/17 2008/10/14 14:40:00 csr
        Modified del_future_rel procedure for TD3791.

   Revision bloomberg_WIP_pdrive_hilld/14 2008/10/21 15:47:33 hilld
        TD2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/13 2008/10/15 15:01:49 hilld
        TD 2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/12 2008/10/03 13:49:38 hilld
        merged

   Revision bloomberg__WIP_Dibyendu_duttad/18 2008/09/10 18:36:04 duttad
        TD 3759

   Revision bloomberg__WIP_Dibyendu_duttad/12 2008/08/13 22:04:24 duttad
        merged

   Revision bloomberg_WIP_pdrive_hilld/11 2008/08/13 15:29:52 hilld
        Reverting code for TD 2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/10 2008/08/11 21:12:31 hilld
        TD 2602 RIC futures

   Revision Bloomberg_singhvir_singhvir/6 2008/08/08 14:32:57 singhvir
        Modified For TD#3569

   Revision bloomberg__WIP_Dibyendu_duttad/11 2008/08/08 13:30:06 duttad
        3728

   Revision bloomberg__WIP_Dibyendu_duttad/10 2008/08/07 18:57:56 duttad
        TD3728

   Revision Bloomberg_singhvir_singhvir/4 2008/08/07 13:15:00 singhvir
        Modified For TD#3569

   Revision bloomberg_WIP_pdrive_hilld/9 2008/08/06 16:02:55 hilld
        td2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/8 2008/08/06 15:55:25 hilld
        promote for stage (td 2602)

   Revision bloomber_sreeni_csr/16 2008/08/05 19:41:49 csr
        Reapplied debi changes

   Revision bloomber_sreeni_csr/14 2008/08/05 19:34:27 csr
        Reappied debi changes

   Revision Bloomberg_singhvir_singhvir/3 2008/08/05 15:01:34 singhvir
        Modified for TD#3569

   Revision Bloomberg_singhvir_singhvir/2 2008/08/01 07:58:44 singhvir
        Modified for TD#3569

   Revision bloomberg_WIP_pdrive_hilld/4 2008/07/30 22:03:41 hilld
        td 2602 RIC futures

   Revision bloomberg_WIP_pdrive_hilld/2 2008/07/30 15:33:02 hilld
        merged

   Revision Bloomberg_singhvir_singhvir/1 2008/07/30 14:44:41 singhvir
        Modified for TD#3569

   Revision bloomber_sreeni_csr/13 2008/07/11 14:58:03 csr
        Promoting to test

   Revision bloomber_sreeni_csr/12 2008/07/10 15:55:08 csr
        TD#3654 changes

   Revision bloomberg__WIP_Dibyendu_duttad/8 2008/07/09 22:41:58 duttad
        TD3654

   Revision bloomberg__WIP_Dibyendu_duttad/7 2008/07/08 13:09:00 duttad
        merged

   Revision bloomber_sreeni_csr/11 2008/06/30 14:47:22 csr
        Promoting to Test.

   Revision bloomberg__WIP_Dibyendu_duttad/6 2008/06/27 14:35:23 duttad
        TD3654

   Revision bloomberg__WIP_Dibyendu_duttad/5 2008/06/26 22:12:33 duttad
        TD3654 and TD3644

   Revision bloomberg__WIP_Dibyendu_duttad/2 2008/06/19 21:48:34 duttad
        merged

   Revision bloomberg_Jun_6_WIP_agnihr/21 2008/06/03 14:56:35 agnihr
        Defect-113,114

   Revision bloomberg_Jun_6_WIP_agnihr/20 2008/06/02 15:47:58 agnihr
        TD3322 changes for 339 catalog

   Revision bloomberg_Jun_6_WIP_agnihr/19 2008/06/02 10:39:50 agnihr
    TD#3389 NSS

   Revision bloomberg_Jun_6_WIP_agnihr/18 2008/05/30 17:30:31 agnihr
    TD#3322 and TD#3389 NSS

   Revision bloomberg_Jun_6_WIP_agnihr/17 2008/05/29 14:01:14 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/16 2008/05/27 13:04:21 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/15 2008/05/27 04:07:16 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/14 2008/05/23 10:48:08 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/13 2008/05/22 12:12:48 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/11 2008/05/20 15:02:27 agnihr
    june release

   Revision bloomberg_Jun_6_WIP_agnihr/10 2008/05/19 14:12:56 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/9 2008/05/15 10:46:56 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/8 2008/05/14 14:48:01 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/7 2008/05/12 14:44:21 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/6 2008/05/12 14:35:19 agnihr
    June Release

   Revision bloomberg_Jun_6_WIP_agnihr/4 2008/05/09 12:43:00 agnihr
    June Release

   Revision bloomberg_8.04_WIP_meshrs/14 2008/04/14 15:23:38 meshrs
    Updated for TD 3352

   Revision bloomber_sreeni_csr/9 2008/04/13 17:53:09 csr
    04/25 Release changes

   Revision bloomberg_8.04_WIP_meshrs/13 2008/04/11 09:50:48 meshrs
    Updated for TD 3352

   Revision bloomber_sreeni_csr/8 2008/04/04 19:47:59 csr
    04/18 Release changes

   Revision bloomber_sreeni_csr/7 2008/04/03 19:00:29 csr
    04/01 Release changes

   Revision bloomberg_8.04_WIP_meshrs/11 2008/04/03 08:59:28 meshrs
    merged

   Revision bloomber_sreeni_csr/6 2008/04/02 13:53:24 csr
    04/18 Release changes

   Revision bloomberg_8.04_WIP_meshrs/10 2008/03/28 10:40:40 meshrs
    Updated for TD 3352

   Revision bloomber_sreeni_csr/3 2008/03/27 18:57:25 csr
    04/11 Release Changes

   Revision bloomber_sreeni_csr/1 2008/03/25 22:45:04 csr
    merged

   Revision bloomberg_8.04_WIP_meshrs/9 2008/03/18 14:57:49 meshrs
    Updated for TD 3322

   Revision bloomberg_8.04_WIP_meshrs/8 2008/03/14 16:07:39 meshrs
    Updated For TD 3468

   Revision bloomberg_8.04_WIP_meshrs/6 2008/03/12 13:44:08 meshrs
    March Release TDs

   Revision bloomberg_8.04_WIP_meshrs/5 2008/03/10 15:58:40 meshrs
    March Release TDs

   Revision bloomberg_8.04_WIP_meshrs/4 2008/03/10 13:53:06 meshrs
    March Release TDs

   Revision bloomberg_8.04_WIP_meshrs/2 2008/02/29 10:08:27 meshrs
    Updated for March TD Release

   Revision bloomberg_WIP_garcin/2 2008/01/07 17:30:58 garcin
    TD 3423 remove extended processing for callable, putable, and sinkable; these are now maintained in csm_security

   Revision bloomberg_WIP_P_kampeta/7 2007/12/06 20:18:53 kampeta
    REmoved WM_ prefix for fix_to_float to help confusion on analyst side.

   Revision bloomberg_WIP_P_kampeta/6 2007/12/06 18:04:14 kampeta
    TD 3174 modified to add WM_ prefix to fix_to_float_reset_dt

   Revision bloomberg_WIP_P_kampeta/5 2007/11/30 19:59:48 kampeta
    TD3174 - changes for handling date format on insert into security_Attribute

   Revision bloomberg_WIP_P_kampeta/4 2007/11/30 19:12:25 kampeta
    TD3174 - changes for handling date format

   Revision bloomberg_WIP_P_kampeta/3 2007/11/30 16:22:36 kampeta
    TD3174 - Had typo when decoding type in maintain_security_attribute

   Revision bloomberg_WIP_P_kampeta/2 2007/11/29 22:04:11 kampeta
    TD 3174 Adjusted size for constant and commented out call to maintain_security_Attribute until the row is created by DBA's

   Revision bloomberg_WIP_P_kampeta/1 2007/11/29 19:45:09 kampeta
    TD 3174 added FIX_TO_FLOAT_RESET_DT and maintain_security_attribue procedure

   Revision bloomberg_WIP_garcin/1 2007/10/08 19:06:31 garcin
    TD 3291 add WM_MTG_WAL

   Revision bloomberg_WIP_pitchv/5 2007/09/11 19:48:07 pitchv
    TD 3175 Changes

   Revision bloomberg_12_01_WIP_hilld/41 2007/05/04 14:22:51 hilld
    TD2818 Interval date

   Revision bloomberg_12_01_WIP_hilld/40 2007/04/11 20:11:25 hilld
    TD 2818 - Interval date

   Revision bloomberg_12_01_WIP_hilld/39 2007/04/11 14:21:49 hilld
    TD 2818 Interval date

   Revision bloomberg_12_01_WIP_hilld/38 2007/04/10 20:28:58 hilld
    TD 2818 Interval_dt

   Revision bloomberg_12_01_WIP_hilld/35 2007/04/05 15:49:57 hilld
    merged

   Revision bloomberg_WIP_parmam/1 2007/04/05 15:41:20 parmam
    Added coupon type changes.

   Revision bloomberg_12_01_WIP_hilld/33 2007/04/05 15:36:05 hilld
    TD 2818 Interval_dt

   Revision bloomberg_WIP_kampeta/17 2007/02/21 16:32:17 kampeta
    fixed wrap_erp_types procedure

   Revision bloomberg_WIP_kampeta/16 2007/02/20 22:26:15 kampeta
    Add order_erp_types and order by cluase in get_bulk_data for erp_types

   Revision bloomberg_WIP_pitchv/4 2007/02/06 23:55:35 pitchv
    TD-2956 changes added function chk_sec_factor_schd

   Revision bloomberg_WIP_kampeta/15 2007/01/30 19:40:00 kampeta
    Added functions to handle bulk field for muni erp types with zero rows.

   Revision bloomberg_WIP_kampeta/14 2007/01/29 14:49:52 kampeta
    Added muni_erp_types to get_bulk_data

   Revision bloomberg_WIP_kampeta/13 2007/01/26 22:09:17 kampeta
    Added muni_erp_types to get_bulk_data.

   Revision bloomberg_WIP_kampeta/12 2007/01/19 19:59:25 kampeta
    added get_code_value function. fixed maintain_sec_Attr_list_tbl

   Revision bloomberg_WIP_kampeta/11 2007/01/18 16:41:32 kampeta
    Modified maintain_sec_attr_list_tbl to use long_dsc when looking up code_value

   Revision bloomberg_WIP_kampeta/10 2007/01/18 13:08:14 kampeta
    modified compare_bulk_fld variable sizes

   Revision bloomberg_WIP_kampeta/9 2007/01/17 19:13:48 kampeta
    Modified logic to handle missing values for sec_Attr_list (MUNI_ERP_TYPES)

   Revision bloomberg_WIP_kampeta/8 2007/01/11 20:58:30 kampeta
    merged

   Revision bloomberg_12_01_WIP_deonpe/27 2007/01/11 19:26:21 deonpe
    merged

   Revision bloomberg_WIP_kampeta/7 2007/01/11 17:00:35 kampeta
    Added muni erp types

   Revision bloomberg_WIP_kampeta/6 2007/01/11 14:59:57 kampeta
    Added muni erp types

   Revision bloomberg_WIP_kampeta/5 2007/01/10 21:05:57 kampeta
    merged

   Revision bloomberg_12_01_WIP_deonpe/26 2007/01/10 20:29:14 deonpe
    td 2425 add obligor override

   Revision bloomberg_12_01_WIP_deonpe/24 2006/11/13 20:53:15 deonpe
    eq bmk security - fixed price validation

   Revision bloomberg_WIP_pitchv/3 2006/11/01 14:53:43 pitchv
    Function get_vndrmsg_hst_transval changes

   Revision bloomberg_WIP_pitchv/2 2006/10/27 20:14:19 pitchv
    TD_IDS #2791 and 2792 adjusted Maturity Date rules


   Revision bloomberg_WIP_pitchv/1 2006/10/27 15:44:47 pitchv
    TD_IDS #2791 and 2792 adjusted Maturity Date rules
    -- Added Function get_vndrmsg_hst_transval

   Revision bloomberg_WIP_kampeta/4 2006/10/02 20:35:27 kampeta
    Markit scrub - adding logic to scrub markit data for new issuer and security set ups.

   Revision bloomberg_12_01_WIP_deonpe/23 2006/07/11 18:29:27 deonpe
    fixed duration tolerance checks

   Revision bloomberg_12_01_WIP_deonpe/22 2006/07/11 14:35:46 deonpe
    td 2663 removed validation moved to forms

   Revision bloomberg_12_01_WIP_deonpe/21 2006/07/10 16:53:06 deonpe
    td 2663 added dep_recpt_cd validation - fixed syntax

   Revision bloomberg_12_01_WIP_deonpe/20 2006/07/10 16:46:33 deonpe
    td 2663 added dep_recpt_cd validation

   Revision bloomberg_12_01_WIP_deonpe/19 2006/07/10 15:38:33 deonpe
    td 2667 duration checks  function for tolerance

   Revision bloomberg_12_01_WIP_hilld/25 2006/07/07 17:38:27 hilld
    TD2605 - underlying WIP changes

   Revision bloomberg_WIP_ignativ/9 2006/07/06 19:09:02 ignativ
    TD 2582

   Revision bloomberg_WIP_ignativ/8 2006/07/06 18:15:10 ignativ
    TD 2582

   Revision bloomberg_12_01_WIP_hilld/24 2006/06/30 18:27:57 hilld
    TD2506 fixes

   Revision bloomberg_12_01_WIP_hilld/23 2006/06/28 21:16:52 hilld
    TD2605 - fix requests getting stuck in underlying_WIP status

   Revision bloomberg_12_01_WIP_deonpe/18 2006/06/15 18:12:58 deonpe
    performance fix




   Revision bloomberg_12_01_WIP_hilld/22 2006/05/23 18:51:43 hilld
    TD2603 - changes to modify_sink_schd

   Revision bloomberg_12_01_WIP_hilld/21 2006/05/22 19:10:47 hilld
    TD2603 - Mult_cpn_sched changes

   Revision bloomberg_12_01_WIP_hilld/20 2006/05/10 19:45:57 hilld
    TD2566 - get_fut_chain global table contained entries for prior requests because it was not being cleaned out - resulted in bogus vendor_rel_request records

   Revision bloomberg_12_01_WIP_hilld/19 2006/05/03 19:15:59 hilld
    merged

   Revision bloomberg_12_01_WIP_hilld/18 2006/05/03 19:09:36 hilld
    TD2566 prevent duplicate fut chain requests by moving setup to single threaded 800 queue

   Revision bloomberg_12_01_WIP_hilld/17 2006/05/03 17:35:22 hilld
    TD2566 prevent duplicate fut chain requests by moving setup to single threaded 800 queue

   Revision bloomberg_12_01_WIP_hilld/16 2006/05/03 14:34:39 hilld
    merged
   Revision bloomberg_WIP_ignativ/7 2006/05/03 16:15:32 ignativ
    TD 2490

   Revision bloomberg_12_01_WIP_hilld/8 2006/03/17 23:11:13 hilld
    TD2566 moving to 800 queue for setup
   Revision bloomberg_WIP_ignativ/6 2006/04/20 18:45:06 ignativ
    TD 2490

   Revision bloomberg_WIP_ignativ/5 2006/04/19 22:01:51 ignativ
    td 2490 - unknown values will be mapped to 'n/a' and shown as exception for SP, FITCH and MOODY. Also includes rule changes 652,1452,1436

   Revision bloomberg_WIP_ignativ/4 2006/04/12 21:53:13 ignativ
    TD 2490

   Revision bloomberg_WIP_ignativ/3 2006/04/12 17:52:45 ignativ
    TD 2490 - remove handling of  values 'PIF' and 'WD' for rating.

   Revision bloomberg_WIP_ignativ/2 2006/04/12 14:21:21 ignativ
    TD 2490 - handle values 'PIF' and 'WD' for rating.

   Revision bloomberg_12_01_WIP_hilld/10 2006/04/05 16:27:48 hilld
    TD2567 - reuse existing vendor requests for WIP securities

   Revision bloomberg_WIP_ignativ/1 2006/03/29 19:44:18 ignativ
    TD 2490

   Revision bloomberg_WIP_kampeta/3 2006/03/24 20:00:45 kampeta
    TD 2526 - modified wrap_multi_cpn_schd function to handle N.A. values for specific columns

   Revision bloomberg_12_01_WIP_hilld/7 2006/03/15 14:35:50 hilld
    merged

   Revision bloomberg_12_01_WIP_hilld/6 2006/03/15 14:34:40 hilld
    TD1674 performance fix
   Revision bloomberg_12_01_WIP_deonpe/17 2006/03/14 19:41:58 deonpe
    removed extra slash at end

   Revision bloomberg_12_01_WIP_hilld/5 2006/03/09 18:51:56 hilld
    TD FUT_CHAIN create NSS

   Revision bloomberg_12_01_WIP_hilld/4 2006/03/08 15:12:58 hilld
    TD1674 FUT_CHAIN create NSS

   Revision bloomberg_12_01_WIP_hilld/3 2006/03/06 22:38:15 hilld
    TD1674 FUT_CHAIN create NSS

   Revision bloomberg_12_01_WIP_hilld/2 2006/03/06 17:39:04 hilld
    TD1674 FUT_CHAIN create NSS

   Revision bloomberg_12_01_WIP_hilld/1 2006/02/28 19:43:51 hilld
    TD1674 FUT_CHAIN create NSS

   Revision WIP_NALLA_nallan/23 2006/02/06 14:33:48 nallan
    Added compare for Future DV Bonds

   Revision WIP_NALLA_nallan/21 2006/01/24 20:00:50 nallan
    No Comment Entered

   Revision WIP_NALLA_nallan/20 2006/01/24 14:36:44 nallan
    Added  check to look for active sec

   Revision WIP_NALLA_nallan/19 2006/01/23 21:34:37 nallan
    Added scrub_dt

   Revision WIP_NALLA_nallan/15 2006/01/20 16:33:49 nallan
    Added request_grp_nm

   Revision WIP_NALLA_nallan/14 2006/01/19 19:52:16 nallan
    If the future is not activated,Re submit with the requested user.

   Revision WIP_NALLA_nallan/13 2006/01/19 19:00:02 nallan
    If the future is not activated,Re submit with the requested user.

   Revision WIP_NALLA_nallan/12 2006/01/19 16:18:52 nallan
    Check if future is dormant then new request with request group nm

   Revision WIP_NALLA_nallan/11 2006/01/19 15:27:01 nallan
    Do not scrub the future if  request already exist

   Revision WIP_NALLA_nallan/10 2006/01/18 22:03:24 nallan
    Put back the code that was missing

   Revision bloomberg_WIP_kampeta/2 2006/01/17 21:00:08 kampeta
    missing slash at eof

   Revision bloomberg_12_01_WIP_kampeta/5 2006/01/13 21:00:47 kampeta
    TD2316 - Added function get_idx_invest_id for rule mapping

   Revision WIP_NALLA_nallan/5 2006/01/03 14:19:16 nallan
    merged

   Revision bloomberg_12_01_WIP_deonpe/16 2005/12/21 15:55:15 deonpe
    modified dummy invest id to base36 formula

   Revision bloomberg_12_01_WIP_deonpe/15 2005/12/21 15:48:33 deonpe
    modified dummy invest id to base36 formula

   Revision WIP_NALLA_nallan/4 2005/12/16 17:03:43 nallan
    Futures Changes

   Revision WIP_NALLA_nallan/2 2005/12/13 15:14:09 nallan
    merged

   Revision bloomberg_12_01_WIP_deonpe/14 2005/12/08 20:03:40 deonpe
    removed is_quasi_sovg_flg function
   Revision WIP_NALLA_nallan/1 2005/12/07 22:35:02 nallan
    Future Changes

   Revision bloomberg_12_01_WIP_samanj/1 2005/12/07 19:42:24 samanj
    JS: Made changes to the ext_default_csm_security in the call to get_def_csm_invest_id - Added an elseif to make sure that only 'generics' got the 99G invest id and regular benchmarks did not.

   Revision bloomberg_12_01_WIP_deonpe/13 2005/12/02 20:34:17 deonpe
    fixed quasi_sovgereign_rel

   Revision bloomberg_12_01_WIP_deonpe/12 2005/12/02 20:15:39 deonpe
    fixed quasi_sovgereign_rel

   Revision bloomberg_12_01_WIP_deonpe/11 2005/12/02 20:03:43 deonpe
    fixed generic dummy invest id

   Revision bloomberg_12_01_WIP_deonpe/10 2005/12/02 14:59:26 deonpe
    fixed quasi v functions

   Revision bloomberg_12_01_WIP_2314_ignativ/3 2005/11/29 18:42:31 ignativ
    Add External ID Types for HYBL - TD 2314

   Revision bloomberg_12_01_WIP_2314_ignativ/2 2005/11/28 18:41:29 ignativ
    merged

   Revision bloomberg_12_01_WIP_kampeta/4 2005/11/28 16:50:06 kampeta
    missed 3 changes

   Revision bloomberg_12_01_WIP_kampeta/3 2005/11/28 16:39:00 kampeta
    typo on slash

   Revision bloomberg_12_01_WIP_kampeta/2 2005/11/28 16:30:31 kampeta
    changed type references to not use security view
   Revision bloomberg_12_01_WIP_2314_ignativ/1 2005/11/28 15:09:36 ignativ
    TD 2314

   Revision bloomberg_12_01_WIP_deonpe/9 2005/11/18 19:24:13 deonpe
    fixed quasi sovg sec relationship


   Revision bloomberg_12_01_WIP_deonpe/8 2005/11/18 19:20:20 deonpe
    fixed quasi sovg sec relationship


   Revision bloomberg_12_01_WIP_deonpe/7 2005/11/17 19:48:28 deonpe
    added benchmark dummy invest id function

   Revision bloomberg_12_01_WIP_deonpe/6 2005/11/17 19:42:49 deonpe
    added benchmark dummy invest id function

   Revision bloomberg_12_01_WIP_deonpe/5 2005/11/17 13:39:32 deonpe
    fixed get_sec_quasi_sovg_rel

   Revision bloomberg_12_01_WIP_deonpe/4 2005/11/14 19:08:09 deonpe
    merged

   Revision bloomberg_12_01_WIP_td2251_ignativ/2 2005/11/14 15:56:12 ignativ
    TD 1922 and 2251

   Revision bloomberg_12_01_WIP_td2251_ignativ/1 2005/11/11 00:05:18 ignativ
    td 2251

   Revision bloomberg_12_01_WIP_nallan/1 2005/11/08 19:48:53 nallan
    merged

   Revision bloomberg_12_01_WIP_deonpe/3 2005/11/08 19:00:42 deonpe
    quasi sovg project

   Revision bloomberg_12_01_WIP_deonpe/2 2005/11/07 15:31:41 deonpe
    issuer family quasi sovereign

   Revision bloomberg_12_01_WIP_deonpe/1 2005/11/07 13:38:14 deonpe
    issuer family quasi sovereign

   Revision bloomberg_5.11.1_WIP_deonpe/5 2005/10/26 13:42:54 deonpe
    merged

   Revision bloomberg_5.11.1_WIP_deonpe/4 2005/10/26 13:38:57 deonpe
    merged

   Revision bloomberg_5.11.1_WIP_deonpe/3 2005/10/17 18:26:10 deonpe
    changes to remove wmc_isr_fam_id from csm_security view

   Revision bloomberg_5.11.1_WIP_deonpe/2 2005/10/17 17:42:25 deonpe
    No Comment Entered

   Revision bloomberg_5.11.1_WIP_deonpe/1 2005/10/17 17:30:38 deonpe
    No Comment Entered


   Rev 1.36   May 06 2005 16:40:52   deonpe
fixed the way cusip for external is stored for bmk generics

   Rev 1.32   18 Apr 2005 11:00:04   JainD
SWAP DERIVATIVES: Update_Sec_price added and some tweaks

   Rev 1.31   11 Apr 2005 16:33:12   SaranN
SWAP tweaks

   Rev 1.30   06 Apr 2005 14:36:44   MahadS
Added more changes for factors

   Rev 1.29   06 Apr 2005 13:52:12   SaranN
SWAPs changes First cut

   Rev 1.28   16 Mar 2005 14:49:20   SaranN
SWAPs change -- WIP

   Rev 1.27   14 Mar 2005 09:43:54   JainD
TD 1571 commented TD 1804 included, erased Jaya's changes

   Rev 1.24   04 Mar 2005 13:25:16   MahadS
Correction for TD 715

   Rev 1.23   03 Mar 2005 13:56:58   JainD
TD 1571 BB Ticker enhancement.

   Rev 1.22   23 Feb 2005 16:38:54   MahadS
TD 725- Factor changes

   Rev 1.20   28 Oct 2004 12:27:30   MahadS
Removed TD 715

   Rev 1.19   18 Oct 2004 09:56:46   MahadS
Corrected factors logic as per Laura

   Rev 1.18   13 Oct 2004 17:11:36   SaranN
TD 1488 Changes for RIC and SYM scrub

   Rev 1.17   11 Oct 2004 13:59:36   MahadS
Mored changes for factor schedules

   Rev 1.16   01 Oct 2004 08:41:54   MahadS
Corrections

   Rev 1.15   20 Sep 2004 16:02:30   SaranN
TD 1488  RIC mainrenance added

   Rev 1.14   01 Sep 2004 09:08:02   MahadS
Factor changes rolled in with floating coupon changes

   Rev 1.12   26 Aug 2004 16:03:36   MahadS
Added floating coupon changes

   Rev 1.11   25 Aug 2004 13:33:12   MahadS
More changes for Factor Schedule

   Rev 1.10   06 Aug 2004 09:52:34   MahadS
Factor sourcing - TD715

   Rev 1.9   11 Mar 2004 09:22:36   MahadS
Modifed MLT CPN schedule derived off MTG_HIST_CPN

   Rev 1.8   08 Mar 2004 11:27:34   MahadS
Adjusted PREV_CPN_DT to delay_days in MTG_CPN_HIST

   Rev 1.7   26 Feb 2004 14:08:10   MahadS
Modified MLT_CPN_SCHEDULE as per the new specs

   Rev 1.6   24 Feb 2004 10:51:16   MahadS
Initial changes for Q1 2004 release

   Rev 1.5   18 Nov 2003 14:03:22   MahadS
Added ID scrubbing and sec_descriptor table logic

   Rev 1.4   05 Nov 2003 09:44:26   MahadS
Bloomberg Q42003 changes - first cut

   Rev 1.3   02 Sep 2003 12:16:38   MahadS
Fixed problems foung in regression testing

   Rev 1.2   08 Aug 2003 11:42:08   MahadS
Modified to sync with current production version

   Rev 1.1   04 Aug 2003 11:21:06   HunteS
code cleanup - productization and removal redundant code

   Rev 1.0   01 Aug 2003 13:26:18   HunteS
Initial revision.

*/


    ---------------
    --  GLOBALS  --
    ---------------

    --
    --  Cached dictionary object
    --
    g_csm_dict_cache                TYP_BBG_CSM_DICTIONARY_CACHE
                                        :=  TYP_BBG_CSM_DICTIONARY_CACHE();
    g_tab_bond                      TYP_BOND_FCTR       := TYP_BOND_FCTR();
    --g_tab_chain                     DBMS_SQL.VARCHAR2_TABLE;              -- TD2566 6/10/2006 HillD

    c_n                          CHAR(1)         := 'N';
    c_y                          CHAR(1)         := 'Y';
    c_sep                        CHAR(1)         := ';';
    c_col_prefix                 CHAR(5)         := ';2;0;';
    c_pkg_name                   VARCHAR2(32)    := 'MAINTAIN_BB_SEC_PKG';  --TD3787 10/21/2008 DuttaD

    /************************** update_issuer_family ***************************
     ***
     ***  Author:        Paul D'Eon
     ***  Date Created:  10/17/2005
     ***  Type:          Private
     ***  Purpose:       This proc updates Issuer family
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE update_issuer_family
    IS

        v_isr_id      security_tbl.isr_id%TYPE;
        v_curr_pri    PLS_INTEGER;

    BEGIN

        BEGIN

            SELECT isr_id
              INTO v_isr_id
              FROM security_tbl
             WHERE sec_id = g_sec_data_rec.sec_id;

        EXCEPTION
            WHEN OTHERS THEN
                v_isr_id := NULL;
        END;

        IF (v_isr_id IS NOT NULL) THEN

            UPDATE issuer
               SET isr_fam_id = (SELECT isr_fam_id
                                   FROM issuer_family f
                                  WHERE wmc_isr_fam_id =
                                        g_sec_data_rec.wmc_isr_fam_id)
             WHERE isr_id = v_isr_id;

            -- TD4070 propagate the issuer since we have changed it

            v_curr_pri  :=  CSM_PROPAGATION.get_propagation_priority;

            CSM_PROPAGATION.set_batch_priority;
            CSM_PROPAGATION.enqueue_with_checks(
                CSM_COMMON.CONST_TYPE_ISSUER,
                to_char(v_isr_id),
                'UPDATE'
            );

           IF  v_curr_pri  =  CSM_PROPAGATION.CONST_PRIORITY_NORMAL  THEN

               CSM_PROPAGATION.set_normal_priority;

           END IF;

        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('update_issuer_family: Unhandled exception');
            RAISE_APPLICATION_ERROR(
                -20090,
                'Update_issuer_family : '||SQLERRM
            );

    END update_issuer_family;

    /************************** maintain_sec_attr_list_data ***************************
     ***
     ***  Author:        Deon
     ***  Date Created:  8/1/2012
     ***  Type:          Private
     ***  Purpose:       inserts/updates sec_attr_list_tbl for bloomberg exchanegs codes
     ***                 Created for TD 5912
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE   maintain_sec_attr_list_data   (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inCode_value              IN      sec_attr_list_tbl.code_value%TYPE,
        p_inSrce_cd                 IN      sec_attr_list_tbl.srce_cd%TYPE,
        p_inAttr_id                 IN      sec_attr_list_tbl.attr_id%TYPE
    )
    IS
        v_old               sec_attr_list_tbl.code_value%TYPE;
        v_old_srce          sec_attr_list_tbl.srce_cd%TYPE;
        v_entity_typ        csm_validation_exc.entity_typ%TYPE;
        v_reason            csm_validation_exc.err_dsc%TYPE;
        v_found             PLS_INTEGER;

    BEGIN


            IF  p_inCode_value IS NULL THEN

                DELETE FROM
                    sec_attr_list_tbl
                WHERE
                    sec_id      =   p_inSec_id                       AND
                    attr_id     =   p_inAttr_id                      AND
                    srce_cd     IN  ('BBGBOND','BBGCOMP','BBGFUT','BLMBRG');

            ELSE


               -- See if combination exists
               -- write exception if not

               SELECT
                   COUNT(*)
               INTO
                   v_found
               FROM
                   ref_attr_value
               WHERE
                   attr_id        =    p_inAttr_id      AND
                   code_value     =    p_inCode_value   AND
                   srce_cd        =    p_inSrce_cd;


               IF v_found  > 0 THEN

                   BEGIN

                       SELECT
                           code_value,
                           srce_cd
                       INTO
                           v_old,
                           v_old_srce
                        FROM
                            sec_attr_list_tbl
                        WHERE
                            sec_id    =   p_inSec_id    AND
                            attr_id   =   p_inAttr_id   AND
                            srce_cd  IN ('BBGBOND','BBGCOMP','BBGFUT','BLMBRG');

                   EXCEPTION

                       WHEN NO_DATA_FOUND THEN

                           v_old   :=  NULL;

                   END;

                   IF v_old  IS NULL  THEN


                       INSERT INTO sec_attr_list_tbl (
                          sec_id,
                          srce_cd,
                          attr_id,
                          code_value
                       ) VALUES (
                         p_inSec_id,
                         p_inSrce_cd,
                         p_inAttr_id,
                         p_inCode_value
                       );

                   ELSE

                      IF v_old      <>  p_inCode_value OR
                         v_old_srce <>  p_inSrce_cd  THEN

                        UPDATE
                            sec_attr_list_tbl
                        SET
                             srce_cd    =     p_inSrce_cd,
                             code_value =     p_inCode_value
                        WHERE
                             sec_id    =   p_inSec_id  AND
                             attr_id   =   p_inAttr_id AND
                             srce_cd  IN ('BBGBOND','BBGCOMP','BBGFUT','BLMBRG');

                   END IF;

                 END IF;

               ELSE

                   v_entity_typ := c_login_name||'_'||TO_CHAR(SYSDATE,'YYYYMMDD');
                   v_reason     := 'Sec_Attr_list_tbl Exch Code Value ' || p_inCode_value ||' Srce Cd ' || p_inSrce_cd ||
                                   ' is missing for attr id ' || p_inAttr_id;

                   BEGIN

                      INSERT INTO csm_validation_exc
                        (entity_typ,
                         entity_id,
                         err_seq,
                         column_name,
                         err_id,
                         err_dsc,
                         ins_ts,
                         ins_login)
                     VALUES
                        (v_entity_typ,
                         p_inSec_id,
                         1,
                         'EXCH_CODE',
                         -20001,
                         v_reason,
                         SYSDATE,
                         USER);
                   EXCEPTION
                       WHEN DUP_VAL_ON_INDEX THEN

                         UPDATE csm_validation_exc
                         SET column_name = 'EXCH_CODE',
                             err_id      = -20001,
                             err_dsc     = v_reason,
                             ins_ts      = SYSDATE,
                             ins_login   = USER
                         WHERE entity_typ  = v_entity_typ AND
                               entity_id   = p_inSec_id   AND
                               err_seq     = 1;

                   END;

               END IF;
           END IF;

    EXCEPTION
        WHEN    DUP_VAL_ON_INDEX THEN

                   NULL;

        WHEN    TOO_MANY_ROWS THEN

                   v_entity_typ := c_login_name||'_'||TO_CHAR(SYSDATE,'YYYYMMDD');
                   v_reason     := 'Security has more than one BLMBRG exchange code defined in sec_attr_list_tbl.';

                   BEGIN

                      INSERT INTO csm_validation_exc
                        (entity_typ,
                         entity_id,
                         err_seq,
                         column_name,
                         err_id,
                         err_dsc,
                         ins_ts,
                         ins_login)
                     VALUES
                        (v_entity_typ,
                         p_inSec_id,
                         1,
                         'EXCH_CODE',
                         -20001,
                         v_reason,
                         SYSDATE,
                         USER);
                   EXCEPTION
                       WHEN DUP_VAL_ON_INDEX THEN

                         UPDATE csm_validation_exc
                         SET column_name = 'EXCH_CODE',
                             err_id      = -20001,
                             err_dsc     = v_reason,
                             ins_ts      = SYSDATE,
                             ins_login   = USER
                         WHERE entity_typ  = v_entity_typ AND
                               entity_id   = p_inSec_id   AND
                               err_seq     = 1;

                   END;


    END maintain_sec_attr_list_data;

    /************************** get_sec_attr_list ***************************
     ***
     ***  Author:        Deon
     ***  Date Created:  8/1/2012
     ***  Type:          Private
     ***  Purpose:       retrieves sec attr list code value
     ***                 Created for TD 5912
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_sec_attr_list (
        p_inSec_id                       IN      security_tbl.sec_id%TYPE,
        p_inAttr_id                      IN      PLS_INTEGER
    )
    RETURN sec_attr_list_tbl.code_value%TYPE
    IS

    v_ret  sec_attr_list_tbl.code_value%TYPE;

    BEGIN

      SELECT
          code_value
      INTO
          v_ret
      FROM
          sec_attr_list_tbl
      WHERE
          sec_id   =  p_inSec_id    AND
          attr_id  =  p_inAttr_id   AND
          srce_cd  IN ('BBGBOND','BBGCOMP','BBGFUT','BLMBRG');

        RETURN v_ret;

    EXCEPTION
        WHEN OTHERS THEN

            RETURN NULL;

    END get_sec_attr_list;

    /************************** get_sec_attr_list ***************************
     ***
     ***  Author:        SinghGu
     ***  Date Created:  10/10/2013
     ***  Type:          Private
     ***  Purpose:       retrieves sec attr list code value
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_sec_attr_list (
        p_inSec_id                       IN      security_tbl.sec_id%TYPE,
        p_inAttr_id                      IN      PLS_INTEGER,
        p_inSrc_cd                       IN      VARCHAR2
    )
    RETURN sec_attr_list_tbl.code_value%TYPE
    IS

    v_ret  sec_attr_list_tbl.code_value%TYPE;

    BEGIN

      SELECT
          code_value
      INTO
          v_ret
      FROM
          sec_attr_list_tbl
      WHERE
          sec_id   =  p_inSec_id    AND
          attr_id  =  p_inAttr_id   AND
          srce_cd  =  p_inSrc_cd;

        RETURN v_ret;

    EXCEPTION
        WHEN OTHERS THEN

            RETURN NULL;

    END get_sec_attr_list;

    /************************** get_sec_attr_list_srce ***************************
     ***
     ***  Author:        Deon
     ***  Date Created:  8/1/2012
     ***  Type:          Private
     ***  Purpose:       retrieves sec attr list srce cd
     ***                 Created for TD 5912
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_sec_attr_list_srce (
        p_inSec_id                       IN      security_tbl.sec_id%TYPE,
        p_inAttr_id                      IN      PLS_INTEGER
    )
    RETURN sec_attr_list_tbl.srce_cd%TYPE
    IS

    v_ret  sec_attr_list_tbl.srce_cd%TYPE;

    BEGIN

      SELECT
          srce_cd
      INTO
          v_ret
      FROM
          sec_attr_list_tbl
      WHERE
          sec_id   =  p_inSec_id    AND
          attr_id  =  p_inAttr_id   AND
          srce_cd  IN ('BBGBOND','BBGCOMP','BBGFUT','BLMBRG');

        RETURN v_ret;

    EXCEPTION
        WHEN OTHERS THEN

            RETURN NULL;

    END get_sec_attr_list_srce;

    /************************** test_data_type ***************************
     ***
     ***  Author:        IgnatIV
     ***  Date Created:  11/09/2005
     ***  Type:          Private
     ***  Purpose:       This function checks whether the data is of the specified data type.
     ***                 Created for TDs 1922 and 2251.
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION test_data_type (
        p_inData                    IN      VARCHAR2,
        p_inType                    IN      PLS_INTEGER
    )
    RETURN BOOLEAN
    IS

        v_int   PLS_INTEGER;
        v_date  DATE;

    BEGIN

        IF ( p_inType = c_type_integer )  THEN

            v_int := TO_NUMBER(p_inData);
            RETURN TRUE;
        ELSIF ( p_inType = c_type_float ) THEN

            v_int := TO_NUMBER(p_inData);
            RETURN TRUE;
        ELSIF ( p_inType = c_type_date )  THEN

            v_date := TO_DATE(p_inData,'YYYYMMDD');
            RETURN TRUE;
        END IF;

        RETURN TRUE;

    EXCEPTION
        WHEN OTHERS THEN

            RETURN FALSE;

    END test_data_type;

    /************************** verify_clob_data *********************************
     ***
     ***  Author:        IgnatIV
     ***  Date Created:  11/08/2005
     ***  Type:          Private
     ***  Purpose:       This proc removes rows from the clob data
     ***                 which could cause data map failure
     ***                 Created for TDs 1922 and 2251.
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
    )
    IS
        v_rows                 VARCHAR2(20);
        v_cols                 VARCHAR2(20);
        v_start                INTEGER;
        v_end                  INTEGER;
        v_row_data             CLOB;
        v_new_value            CLOB         := '';
        v_new_rows             INTEGER;
        v_flag                 BOOLEAN;
        v_start_pos            INTEGER;
        v_end_pos              INTEGER;
        v_type                 INTEGER;
        v_data                 VARCHAR2(1000);

        c_req_id               VARCHAR2(6)                           := 'REQ_ID';
        c_sep                  VARCHAR2(2)                           := ';';
        v_req_id               vendor_req_messages.request_id%TYPE   := VENDOR_MAP_PKG.my_sys_context(c_req_id);

    BEGIN
        -- Return if the data is null
        IF p_inData IS NULL THEN
            RETURN;
        END IF;

        v_start := INSTR(p_inData,c_sep,1,2);
        v_end   := INSTR(p_inData,c_sep,1,3);

        -- v_rows will contain the number of rows in the bulk format data
        -- v_new_rows will contains the number of rows in the data that will be updated to vendor_req_messages
        v_rows  := SUBSTR(p_inData,v_start+1,v_end - v_start -1);
        v_new_rows := v_rows;

        v_start := INSTR(p_inData,c_sep,1,3);
        v_end   := INSTR(p_inData,c_sep,1,4);
        v_cols  := SUBSTR(p_inData,v_start+1,v_end - v_start -1);

        v_start := INSTR(p_inData,c_sep,1,4);
        v_end   := INSTR(p_inData,c_sep,v_start+1, v_cols * 2);

        FOR i in 1 .. v_rows LOOP

            v_row_data   := '';
            v_row_data   :=  SUBSTR(p_inData,v_start+1,v_end - v_start -1);
            v_row_data   :=  v_row_data || c_sep;

            -- check for validity
            v_flag       := TRUE;
            v_start_pos  := 1;
            v_end_pos    := DBMS_LOB.getlength(v_row_data);

                -- v_flag will be set to false if the data is invalid
                WHILE ( v_flag  AND v_start_pos < v_end_pos )
                LOOP
                    v_type      := TO_NUMBER(
                                       SUBSTR(
                                           v_row_data,
                                           v_start_pos,
                                           INSTR(v_row_data,c_sep,v_start_pos,1)-v_start_pos
                                       )
                                   );

                    v_start_pos := INSTR(
                                       v_row_data,
                                       c_sep,
                                       v_start_pos,
                                       1
                                   ) + 1;

                    v_data      := SUBSTR(
                                       v_row_data,
                                       v_start_pos,
                                       INSTR(
                                           v_row_data,
                                           c_sep,
                                           v_start_pos,
                                           1
                                       )-v_start_pos);

                    v_start_pos := INSTR(
                                       v_row_data,
                                       c_sep,
                                       v_start_pos,
                                       1
                                   ) + 1;

                    v_flag      := test_data_type(
                                       v_data,
                                       v_type
                                   );
                END LOOP;

                IF (v_flag) THEN

                    v_new_value := v_new_value || v_row_data;
                ELSE
                    v_new_rows := v_new_rows - 1;
                END IF;

            v_start := v_end;
            v_end   := INSTR(
                           p_inData,
                           c_sep,
                           v_start + 1,
                           v_cols * 2
                       );

            IF v_end = 0 THEN

                v_end := DBMS_LOB.getlength(p_inData) + 1;
            END IF;

        END LOOP;

        -- Contruct the new data
        v_start     := 1;
        v_end       := 0;
        v_new_value := SUBSTR(
                           p_inData,
                           1,
                           INSTR(p_inData,
                               c_sep,
                               1,
                               2
                           )
                       )
                       || v_new_rows
                       || SUBSTR(
                              p_inData,
                              INSTR(p_inData,c_sep,1,3),
                              INSTR(p_inData,c_sep,1,4)-INSTR(p_inData,c_sep,1,3)
                          )
                       || c_sep
                       || v_new_value;

        IF  ( v_new_rows < v_rows ) THEN
            UPDATE /*+ index(a,vendor_req_messages_ix1) */
                vendor_req_messages a
            SET
                column_value = v_new_value
            WHERE
                request_id = v_req_id AND
                column_nm  = p_inCol;
        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('Verify clob data: Unhandled exception');
            RAISE_APPLICATION_ERROR(
                -200100,
                'Verify clob data : '||SQLERRM
            );

    END verify_clob_data;

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
        p_inSec_id              IN      security_tbl.sec_id%TYPE,  -- if this is null then it is NSS
        p_outException_1        OUT     VARCHAR2,
        p_outException_2        OUT     VARCHAR2,
        p_outException_3        OUT     VARCHAR2
    )
    IS
        v_dummy                         NUMBER;
        v_invest_id                     security_tbl.invest_id%TYPE;
        v_ric_exists                    VARCHAR2(1);
        v_reuters_exp_dt                vendor_ric_xref_tbl.exp_dt%TYPE;
        v_reuters_exp_mmyyyy            VARCHAR2(6);
        v_bb_exp_mmyyyy                 VARCHAR2(6);
        v_bb_exp_diff                   NUMBER;
        v_bb_first_notice_mmyyyy        VARCHAR2(6);
        v_bb_first_notice_diff          NUMBER;
        v_reuters_curcy_cd              vendor_ric_xref_tbl.curcy_cd%TYPE;
        v_exception_text                VARCHAR2(256);
        c_date_tolerance       CONSTANT PLS_INTEGER      :=  7;  -- DAYS
        c_ric_exist_err_text   CONSTANT VARCHAR2(256)    :=  'Derived RIC value does not exist in the VENDOR_RIC_XREF_TBL table';

    BEGIN

        -- Validate RIC exists in vendor_ric_xref_tbl
        BEGIN

            SELECT
                'Y',
                x.exp_dt,
                TO_CHAR(exp_dt,'MMYYYY'),
                TO_CHAR(p_inExpiration_dt,'MMYYYY'),
                ABS(exp_dt - p_inExpiration_dt),
                TO_CHAR(p_inFirst_notice_dt,'MMYYYY'),
                ABS(exp_dt - p_inFirst_notice_dt),
                x.curcy_cd
            INTO
                v_ric_exists,
                v_reuters_exp_dt,
                v_reuters_exp_mmyyyy,
                v_bb_exp_mmyyyy,
                v_bb_exp_diff,
                v_bb_first_notice_mmyyyy,
                v_bb_first_notice_diff,
                v_reuters_curcy_cd
            FROM
                vendor_ric_xref_tbl x
            WHERE
                ric          =   p_inDatum;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN

                v_ric_exists     := 'N';
                p_outException_1 := c_ric_exist_err_text;

        END;

        IF v_ric_exists = 'Y' THEN

            -- validate that the currency code matches
            IF v_reuters_curcy_cd <> p_inCurcy_cd THEN

                BEGIN
                    -- check minor vs. major curcy cd (example USc vs. USD)
                    SELECT
                        1
                    INTO
                        v_dummy
                    FROM
                        ref_code_struct r
                    WHERE
                        r.higher_attr_id    = 5                    AND
                        r.higher_srce_cd    = 'REUTERS'            AND
                        r.higher_code_value = v_reuters_curcy_cd   AND
                        r.lower_attr_id     = 5                    AND
                        r.lower_srce_cd     = 'ISO'                AND
                        r.lower_code_value  = p_inCurcy_cd;

                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                    p_outException_1 := 'Reuters RIC currency, '|| v_reuters_curcy_cd ||
                                        ', and Blmbg Currency, '|| p_inCurcy_cd || ', do not match';

                END;

            END IF; -- Curcy_cd

            -- check that either bb expiration_dt or first_notice_date is within a certain tolearance and
            -- same month and year as the reuters expiration date
            IF NOT (v_reuters_exp_mmyyyy = v_bb_exp_mmyyyy AND v_bb_exp_diff <= c_date_tolerance) AND
               NOT (v_reuters_exp_mmyyyy = v_bb_first_notice_mmyyyy AND v_bb_first_notice_diff <= c_date_tolerance) THEN

                v_exception_text := 'Reuters RIC expire date, '|| v_reuters_exp_dt ||
                                    ' not within tolerance of either Blmbg expire date, '|| p_inExpiration_dt ||
                                    ', or Blmbg first notice dt, '|| p_inFirst_notice_dt;

                IF p_outException_1 IS NULL THEN

                    p_outException_1 := v_exception_text;

                ELSE

                    p_outException_2 := v_exception_text;

                END IF;

            END IF; -- date tolerance

            -- check if the RIC exists on another security
            BEGIN
                SELECT
                    invest_id
                INTO
                    v_invest_id
                FROM
                    sec_external_id x,
                    security_tbl s
                WHERE
                    s.sec_id          =  x.sec_id                 AND
                    x.extern_id       =  p_inDatum                AND
                    x.extern_id_typ   =  'RIC'                    AND
                    x.sec_id          <> nvl(p_inSec_id,-123456)  AND
                    x.eff_dt          <= sysdate                  AND
                    x.exp_dt          >  sysdate;
            EXCEPTION
                WHEN TOO_MANY_ROWS    THEN
                    v_invest_id := 'Multiple found';  -- this condition is not expected
                WHEN NO_DATA_FOUND    THEN
                    v_invest_id := NULL;
                WHEN OTHERS THEN
                    v_invest_id := NULL;
            END;

            IF v_invest_id IS NOT NULL THEN

                v_exception_text := 'Derived RIC already exists on invest ID '|| v_invest_id;

                IF p_outException_1 IS NULL THEN

                    p_outException_1 := v_exception_text;

                ELSIF p_outException_2 IS NULL THEN

                    p_outException_2 := v_exception_text;

                ELSE

                    p_outException_3 := v_exception_text;

                END IF;

            END IF; -- v_invest_id

        END IF;  -- v_ric_exists

    END scrub_validate_ric;

    /************************** get_bb_vrq_data_clean ***************************
     ***  Author:           Nagesh Sarangapani
     ***  Date Created:     07 July 2005
     ***  Type:             Public
     ***  Purpose:          This procedure gets specified row from VRQ
     ***                    returns null if Bloomberg supplies an "N.A."
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION SIDDADD (
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_column_nm                 IN      vendor_req_messages.column_nm%TYPE
    )
    RETURN vendor_req_messages.column_value%TYPE
    IS

        v_column_value      vendor_req_messages.column_value%TYPE := NULL;

    BEGIN

        v_column_value  :=  get_bb_vrq_data(
                                p_product_id,
                                p_request_id,
                                p_column_nm
                            );

        IF  v_column_value  =  'N.A.'   THEN

            v_column_value  :=  NULL;

        END IF;

        RETURN v_column_value;

    EXCEPTION

        WHEN OTHERS THEN

            RAISE_APPLICATION_ERROR(-20080,'get_bb_vrq_data_xNA : '||SQLERRM);

    END get_bb_vrq_data_clean;

    /**************************  display_message ***********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     20 Jun 2002
     ***  Type:             Public
     ***  Purpose:          This procedure display's message through DBMS_OUTPUT
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
    )
    IS

    BEGIN

        IF (g_debug_flg) THEN

            DBMS_OUTPUT.put_line(
                TO_CHAR(SYSDATE,'MM/DD HH24:MI:SS')||' '||
                SUBSTR(p_message,1,240)
            );

        END IF;

    END display_message;

    /************************** get_vendor_nm_data **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     28 Oct 2003
     ***  Type:             Private
     ***  Purpose:          This procedure gets vendor_name data
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_vendor_nm_data (
        p_inSec_id          IN      security_tbl.sec_id%TYPE
    )
    IS

        v_vendor_sec_ticker      vendor_sec_name.vendor_sec_ticker%TYPE   :=  NULL;

    BEGIN

        display_message('get_vendor_nm_data:Sec Id '||p_inSec_id);

        SELECT
            vendor_sec_ticker
        INTO
            v_vendor_sec_ticker
        FROM
            vendor_sec_name
        WHERE
            sec_id  =   p_inSec_id;

        g_sec_data_rec.bb_vendor_sec_ticker :=  v_vendor_sec_ticker;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            NULL;
        WHEN OTHERS THEN

            display_message('get_vendor_nm_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_vendor_nm_data : '||SQLERRM);

    END get_vendor_nm_data;

    /************************** get_sec_fi_data **********************************
     ***
     ***  Author:               MahadS
     ***  Date Created: 20 Jun 2002
     ***  Type:                 Private
     ***  Purpose:          This procedure gets addtn. sec fi data
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    /* TD3423 GarciN 01/07/2008

    PROCEDURE get_sec_fi_data (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE
    )
    IS

        v_callable          sec_fi_data_tbl.callable_flg%TYPE   :=  NULL;
        v_putable           sec_fi_data_tbl.putable_flg%TYPE    :=  NULL;
        v_sinkable          sec_fi_data_tbl.sinkable_flg%TYPE   :=  NULL;

    BEGIN

        display_message('get_sec_fi_data:Sec Id '||p_inSec_id);

        SELECT
            callable_flg,
            putable_flg,
            sinkable_flg
        INTO
            v_callable,
            v_putable,
            v_sinkable
        FROM
            sec_fi_data_tbl
        WHERE
            sec_id  =   p_inSec_id;

        g_sec_data_rec.callable :=  v_callable;
        g_sec_data_rec.putable  :=  v_putable;
        g_sec_data_rec.sinkable :=  v_sinkable;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
        WHEN OTHERS THEN
            display_message('get_sec_fi_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_sec_fi_data : '||SQLERRM);

    END get_sec_fi_data;*/

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
    RETURN security_tbl.cusip%TYPE
    IS

        v_isip_id       isip_issue.isip_id%TYPE :=  NULL;

    BEGIN

        display_message('get_isid_cusip ');

        BEGIN

            SELECT
                SUBSTR(isip_id,1,8)
            INTO
                v_isip_id
            FROM
                isip_issue
            WHERE
                (
                    isip_sedol  =   NVL(p_sedol,'ZZZ')  OR
                    isip_isin   =   NVL(p_isin,'ZZZ')
                );

        EXCEPTION
            WHEN TOO_MANY_ROWS THEN

                SELECT
                    SUBSTR(isip_id,1,8)
                INTO
                    v_isip_id
                FROM
                    isip_issue
                WHERE
                    (
                        isip_sedol  =   NVL(p_sedol,'ZZZ')  AND
                        isip_isin   =   NVL(p_isin,'ZZZ')
                    );

        END;

        RETURN  v_isip_id;

    EXCEPTION
        WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN

            RETURN NULL;

        WHEN OTHERS THEN

            display_message('get_isid_cusip: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_isid_cusip : '||SQLERRM);

    END get_isid_cusip;

    /************************** get_asset_class **********************************
     ***
     ***  Author:               MahadS
     ***  Date Created: 22 Aug 2002
     ***  Type:                 Private
     ***  Purpose:          This function gets asset_class
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_asset_class (
        p_sec_typ_id                IN      security_tbl.sec_typ_id%TYPE
    )
    RETURN sec_type.asset_class%TYPE
    IS

        v_asset_class       sec_type.asset_class%TYPE   :=  NULL;

    BEGIN

        display_message('get_asset_class ');

        SELECT
            DECODE(
                asset_class,
                'E', 'F',
                asset_class
            )
        INTO
            v_asset_class
        FROM
            sec_type
        WHERE
            sec_typ_id  =   p_sec_typ_id;

        RETURN v_asset_class;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_asset_class;

        WHEN OTHERS THEN

            display_message('get_asset_class: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_asset_class : '||SQLERRM);

    END get_asset_class;

     /************************** invest_id_exists **********************************
     ***
     ***  Author:               IgnatIV
     ***  Date Created:         30 Sep 2005
     ***  Type:                 Private
     ***  Purpose:              This function returns true if the invest id exists in security table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION invest_id_exists (
        p_invest_id                IN      security_tbl.invest_id%TYPE
    )
    RETURN BOOLEAN
    IS

        v_count    PLS_INTEGER   :=  0;

    BEGIN

        SELECT
            COUNT(*)
        INTO
            v_count
        FROM
            security_tbl
        WHERE
            invest_id  =   TRIM(p_invest_id);

        IF v_count > 0
        THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;

    END invest_id_exists;


    /************************** get_sec_info **********************************
     ***
     ***  Author:               MahadS
     ***  Date Created: 22 Aug 2002
     ***  Type:                 Private
     ***  Purpose:          This procedure gets addtn. security info
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_sec_info (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE
    )
    IS

        v_asset_class               sec_type.asset_class%TYPE;
        v_data_srce_status_cd       security_tbl.data_srce_status_cd%TYPE;

    BEGIN

        display_message('get_sec_info:Sec Id '||p_inSec_id);

        SELECT
            DECODE(
                t.asset_class,
                'E', 'F',
                t.asset_class
            ) , data_srce_status_cd
        INTO
            v_asset_class , v_data_srce_status_cd
        FROM
            security_tbl    s,
            sec_type        t
        WHERE
            sec_id          =   p_inSec_id      AND
            t.sec_typ_id    =   s.sec_typ_id;

        g_sec_data_rec.asset_class            :=  v_asset_class;
        g_sec_data_rec.data_srce_status_cd    :=  v_data_srce_status_cd;


    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            NULL;

        WHEN OTHERS THEN

            display_message('get_sec_info: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_sec_info : '||SQLERRM);

    END get_sec_info;

    /************************** get_sec_catlg_item_id ****************************
     ***
     ***  Author:               ShahbYa
     ***  Date Created: 09 Jan 2012
     ***  Type:                 Private
     ***  Purpose:          This procedure gets addtn. security info
     ***
     ***  Changes: Initial for #TD5304
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_sec_catlg_item_id (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inCatlg_id                IN      sec_catlg_tbl.catlg_id%TYPE
    )
    RETURN sec_catlg_tbl.catlg_item_id%TYPE
    IS

        v_catlg_item_id     sec_catlg_tbl.catlg_item_id%TYPE;

    BEGIN

        display_message('get_sec_catlg_item_id: Sec Id '||p_inSec_id || ' and catlg id ' || p_inCatlg_id);

        SELECT
            catlg_item_id
        INTO
            v_catlg_item_id
        FROM
            sec_catlg_tbl
        WHERE
            sec_id          =   p_inSec_id      AND
            catlg_id        =   p_inCatlg_id;

        RETURN v_catlg_item_id;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN NULL;

        WHEN OTHERS THEN

            display_message('get_sec_catlg_item_id: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_sec_catlg_item_id : '||SQLERRM);

    END get_sec_catlg_item_id;

    /************************** get_sec_fi_data ****************************
     ***
     ***  Author:               KhetrM
     ***  Date Created: 12 Jan 2012
     ***  Type:                 Private
     ***  Purpose:          This procedure gets sec_fi_data infor
     ***
     ***  Changes: Initial for #TD5442
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_sec_fi_data (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE
    )
    IS

        v_unadjusted_pay_day     sec_fi_data_tbl.unadjusted_pay_day%TYPE;
        v_coupon_convention      sec_fi_data_tbl.coupon_convention%TYPE;
        v_payment_rank           sec_fi_data_tbl.payment_rank%TYPE;
        v_surplus_note_flg       sec_fi_data_tbl.surplus_note_flg%TYPE;
        v_tier_capital           sec_fi_data_tbl.tier_capital%TYPE;
        v_mtg_pool_typ           sec_fi_data_tbl.mtg_pool_typ%TYPE;
        v_collat_cntry_cd        sec_fi_data_tbl.collat_cntry_cd%TYPE;
        v_muni_issue_typ         sec_fi_data_tbl.muni_issue_typ%TYPE;    --TD6042 VartaV 11.15.2012
        v_cpn_recalc_method      sec_fi_data_tbl.cpn_recalc_method%TYPE; --TD6066 VartaV 11.15.2012
    BEGIN

        display_message('get_sec_fi_data info: Sec Id '||p_inSec_id);

        SELECT
            sf.unadjusted_pay_day,
            sf.coupon_convention,
            sf.payment_rank,
            sf.surplus_note_flg,
            sf.tier_capital,
            sf.mtg_pool_typ,
            sf.collat_cntry_cd,
            sf.muni_issue_typ,     --TD6042 VartaV 11.15.2012
            sf.cpn_recalc_method   --TD6066 VartaV 11.15.2012
        INTO
            v_unadjusted_pay_day,
            v_coupon_convention,
            v_payment_rank,
            v_surplus_note_flg,
            v_tier_capital,
            v_mtg_pool_typ,
            v_collat_cntry_cd,
            v_muni_issue_typ,      --TD6042 VartaV 11.15.2012
            v_cpn_recalc_method    --TD6066 VartaV 11.15.2012
        FROM
            sec_fi_data_tbl sf
        WHERE
            sf.sec_id   =   p_inSec_id;

        g_sec_data_rec.unadjusted_pay_day := v_unadjusted_pay_day;
        g_sec_data_rec.coupon_convention  := v_coupon_convention;
        g_sec_data_rec.payment_rank := v_payment_rank;
        g_sec_data_rec.surplus_note_flg := v_surplus_note_flg;
        g_sec_data_rec.tier_capital := v_tier_capital;
        g_sec_data_rec.mtg_pool_typ := v_mtg_pool_typ;
        g_sec_data_rec.collat_cntry_cd := v_collat_cntry_cd;
        g_sec_data_rec.muni_issue_typ  := v_muni_issue_typ;       --TD6042 VartaV 11.15.2012
        g_sec_data_rec.cpn_recalc_method := v_cpn_recalc_method;  --TD6066 VartaV 11.15.2012
    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            NULL;

        WHEN OTHERS THEN

            display_message('get_sec_fi_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_sec_fi_data : '||SQLERRM);

    END get_sec_fi_data;

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
    RETURN security_tbl.sec_class%TYPE
    IS

        v_sec_class     security_tbl.sec_class%TYPE;

    BEGIN

        display_message('get_sec_class:request ID '||p_request_id);

        SELECT
            sec_class
        INTO
            v_sec_class
        FROM
            security_tbl
        WHERE
            sec_id  =   (
                            SELECT
                                sec_id
                            FROM
                                vendor_request
                            WHERE
                                vendor_product_id   =   p_vendor_id AND
                                request_id          =   p_request_id
                        );

        RETURN v_sec_class;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN NULL;

        WHEN OTHERS THEN

            display_message('get_sec_class: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_sec_class : '||SQLERRM);

    END get_sec_class;

    /************************** get_sec_descriptor_data **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     18 Nov 2003
     ***  Type:             Private
     ***  Purpose:          This procedure gets sec descriptor data for given sec id
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_sec_descriptor_data (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inDescriptor_typ          IN      sec_descriptor.descriptor_typ%TYPE
    )
    IS

        v_extern_id         sec_descriptor.descriptor%TYPE:=NULL;

    BEGIN

        display_message('get_sec_descriptor_data:Sec Id '||p_inSec_id);

        SELECT
              descriptor
        INTO
              v_extern_id
        FROM
              sec_descriptor
        WHERE
              sec_id          =  p_inSec_id           AND
              srce_cd         =  'WMC'                AND
              descriptor_typ  =  p_inDescriptor_typ;

        IF (p_inDescriptor_typ = c_bb_ticker) THEN
            g_sec_data_rec.bb_ticker  :=  v_extern_id;
        END IF;

        --TD6262
        IF (p_inDescriptor_typ = c_trade_description) THEN
            g_sec_data_rec.trade_description  :=  v_extern_id;
        END IF;


        -- TD 1571 Deep 02-18-05 -----------------------------------------------------------

        /****************
        IF (p_inDescriptor_typ = c_ticker) THEN
            g_sec_data_rec.ticker  :=  v_extern_id;
        END IF;

        IF (p_inDescriptor_typ = c_yellow_key) THEN
            g_sec_data_rec.yellow_key  :=  v_extern_id;
        END IF;

        ****************/
        ------------------------------------------------------------------------------------

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            NULL;

      WHEN OTHERS THEN

            display_message('get_sec_descriptor_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_sec_descriptor_data : '||SQLERRM);
    END get_sec_descriptor_data;

    /************************** get_extern_data **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     25 Jun 2002
     ***  Type:             Private
     ***  Purpose:          This procedure gets extern id data
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_extern_data (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_extern_id_typ             IN      sec_external_id.extern_id_typ%TYPE
    )
    IS

        v_extern_id         sec_external_id.extern_id%TYPE:=NULL;

    BEGIN

        display_message('get_extern_data:Sec Id '||p_inSec_id);
        display_message('get_extern_data:type '||p_extern_id_typ);

        SELECT
            s1.extern_id
        INTO
            v_extern_id
        FROM
            sec_external_id s1
        WHERE
            s1.sec_id           =   p_inSec_id      AND
            s1.extern_id_typ    =   p_extern_id_typ AND
            s1.eff_dt           =   (
                                        SELECT
                                            MAX(s2.eff_dt)
                                        FROM
                                            sec_external_id s2
                                        WHERE
                                            s2.sec_id           =   s1.sec_id           AND
                                            s2.extern_id_typ    =   s1.extern_id_typ    AND
                                            s2.eff_dt           <=  SYSDATE             AND
                                            s2.exp_dt           >   SYSDATE
                                    );

        IF (p_extern_id_typ = c_bb_unique) THEN

            g_sec_data_rec.bb_unique       :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bb_isin ) THEN

            g_sec_data_rec.bb_isin         :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bb_sedol ) THEN

            g_sec_data_rec.bb_sedol        :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bmk_lb_cusip ) THEN

            g_sec_data_rec.bmk_lb_cusip         :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bmk_yb_cusip ) THEN

            g_sec_data_rec.bmk_yb_cusip         :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bmk_cg_cusip ) THEN -- HillD 09-29-2005 BMK rewrite phase 2

            g_sec_data_rec.bmk_cg_cusip         :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bmk_ml_cusip ) THEN

            g_sec_data_rec.bmk_ml_cusip         :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bb_scrub_cusip ) THEN

            g_sec_data_rec.bb_scrub_cusip  :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_bb_ticker) THEN

            g_sec_data_rec.bb_ticker       :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_ric) THEN

            g_sec_data_rec.ric             :=  v_extern_id;

        --IgnatIV    TD2314    11/29/2005
        ELSIF (p_extern_id_typ = c_tranche_id) THEN

            g_sec_data_rec.bb_tranche_id   :=  v_extern_id;

        -- TD 1571 Deep 02-18-05 -----------------------------------------------------------

        /***********
        ELSIF (p_extern_id_typ = c_ticker) THEN

            g_sec_data_rec.ticker          :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_yellow_key) THEN

            g_sec_data_rec.yellow_key      :=  v_extern_id;
        ***************/

        -- TD4330 OSI - Bloomberg changes
        ELSIF (p_extern_id_typ = c_bb_global) THEN

            g_sec_data_rec.bb_global   :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_occ_id) THEN

            g_sec_data_rec.occ_id   :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_opra_id) THEN

            g_sec_data_rec.opra_id   :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_loanx_id) THEN

            g_sec_data_rec.loanx_id   :=  v_extern_id;

        ELSIF (p_extern_id_typ = c_wso_id) THEN

            g_sec_data_rec.wso_id   :=  v_extern_id;


        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            NULL;

      WHEN OTHERS THEN

            display_message('get_extern_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_extern_data : '||SQLERRM);

    END get_extern_data;

    /************************** get_rating_data **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     20 Jun 2002
     ***  Type:             Private
     ***  Purpose:          This procedure gets ratings data for issue/issuer
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_rating_data(
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_rating_srce_cd            IN      csm.csm_sec_rating_tbl.rating_srce_cd%TYPE,
        p_rating_typ                IN      csm.csm_sec_rating_tbl.rating_typ%TYPE
    )
    IS

        v_rating            csm.csm_sec_rating_tbl.rating%TYPE:=NULL;
        v_rating_dt         csm.csm_sec_rating_tbl.eff_dt%TYPE:=NULL;
        v_vndr_srce_cd      csm.csm_sec_rating_tbl.vndr_srce_cd%TYPE:=NULL;

    BEGIN

        display_message('get_rating_data:Sec Id '||p_inSec_id);

        SELECT
            rating,
            eff_dt,
            vndr_srce_cd
        INTO
            v_rating,
            v_rating_dt,
            v_vndr_srce_cd
        FROM
            csm.csm_sec_rating_tbl s1
        WHERE
            s1.sec_id           =   p_inSec_id                  AND
            s1.rating_srce_cd   =   p_rating_srce_cd            AND
            s1.asset_class      =   g_sec_data_rec.asset_class  AND
            s1.rating_typ       =   p_rating_typ                AND
            s1.eff_dt   =   (
                                SELECT
                                    MAX(s2.eff_dt)
                                FROM
                                    csm.csm_sec_rating_tbl s2
                                WHERE
                                    s1.sec_id           =   s2.sec_id           AND
                                    s1.rating_srce_cd   =   s2.rating_srce_cd   AND
                                    s1.rating_typ       =   s2.rating_typ       AND
                                    s1.asset_class      =   s2.asset_class
                            );

        IF p_rating_typ = CSM_COMMON.CONST_RATING_TYPE_CREDIT THEN

            IF      (p_rating_srce_cd=c_rating_sp) THEN

               g_sec_data_rec.rtg_sp               :=  v_rating;
               g_sec_data_rec.sp_eff_dt            :=  v_rating_dt;
               g_sec_data_rec.sp_vndr_srce_cd      :=  v_vndr_srce_cd;

            ELSIF   (p_rating_srce_cd=c_rating_moody) THEN

               g_sec_data_rec.rtg_moody            :=  v_rating;
               g_sec_data_rec.moody_eff_dt         :=  v_rating_dt;
               g_sec_data_rec.moody_vndr_srce_cd   :=  v_vndr_srce_cd;

            ELSIF   (p_rating_srce_cd=c_rating_fitch) THEN                  --  Gap 07/01/2003 (SH)

               g_sec_data_rec.rtg_fitch            :=  v_rating;
               g_sec_data_rec.fitch_eff_dt         :=  v_rating_dt;
               g_sec_data_rec.fitch_vndr_srce_cd   :=  v_vndr_srce_cd;

            ELSIF   (p_rating_srce_cd=c_rating_dbrs) THEN --TD4861: DBRS ratings at the security level

               g_sec_data_rec.rtg_dbrs            :=  v_rating;
               g_sec_data_rec.dbrs_eff_dt         :=  v_rating_dt;
               g_sec_data_rec.dbrs_vndr_srce_cd   :=  v_vndr_srce_cd;

           END IF;

       ELSE

            IF      (p_rating_srce_cd=c_rating_sp) THEN

               g_sec_data_rec.rtg_sp_undl               :=  v_rating;
               g_sec_data_rec.sp_eff_dt_undl            :=  v_rating_dt;
               g_sec_data_rec.sp_vndr_srce_cd_undl      :=  v_vndr_srce_cd;

            ELSIF   (p_rating_srce_cd=c_rating_moody) THEN

               g_sec_data_rec.rtg_moody_undl            :=  v_rating;
               g_sec_data_rec.moody_eff_dt_undl         :=  v_rating_dt;
               g_sec_data_rec.moody_vndr_srce_cd_undl   :=  v_vndr_srce_cd;

            ELSIF   (p_rating_srce_cd=c_rating_fitch) THEN                  --  Gap 07/01/2003 (SH)

               g_sec_data_rec.rtg_fitch_undl            :=  v_rating;
               g_sec_data_rec.fitch_eff_dt_undl         :=  v_rating_dt;
               g_sec_data_rec.fitch_vndr_srce_cd_undl   :=  v_vndr_srce_cd;

           END IF;

       END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            NULL;

        WHEN OTHERS THEN

            display_message('get_rating_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_rating_data : '||SQLERRM);

    END get_rating_data;

  /************************** get_sec_assessment_data **********************************
     ***
     ***  Author:           Subhash Wadekar
     ***  Date Created:     24 Jun 2010
     ***  Type:             Private
     ***  Purpose:          This procedure gets sec_assessment data for security
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE get_sec_assessment_data(
        p_inSec_id                  IN security_tbl.sec_id%TYPE,
        p_inAssmnt_srce_cd          IN sec_assessment.assmnt_srce_cd%TYPE,
        p_inAssmnt_typ              IN sec_assessment.assmnt_typ%TYPE
    )
    IS

        v_wmc_assmnt_cd            sec_assessment.wmc_assmnt_cd%TYPE:=NULL;
        v_eff_dt                   sec_assessment.eff_dt%TYPE:=NULL;
        v_vndr_srce_cd             sec_assessment.vndr_srce_cd%TYPE:=NULL;

    BEGIN

        display_message('get_sec_assessment_data:Sec Id '||p_inSec_id);

        SELECT
            wmc_assmnt_cd,
            eff_dt,
            vndr_srce_cd
        INTO
            v_wmc_assmnt_cd,
            v_eff_dt,
            v_vndr_srce_cd
        FROM
            sec_assessment s1
        WHERE
            s1.sec_id           =   p_inSec_id                    AND
            s1.assmnt_srce_cd   =   p_inAssmnt_srce_cd            AND
            s1.assmnt_typ       =   p_inAssmnt_typ                AND
            s1.eff_dt   =   (
                                SELECT
                                    MAX(s2.eff_dt)
                                FROM
                                    sec_assessment s2
                                WHERE
                                    s2.sec_id           =   s1.sec_id           AND
                                    s2.assmnt_srce_cd   =   s1.assmnt_srce_cd   AND
                                    s2.assmnt_typ       =   s1.assmnt_typ
                            );


     ----SP OUTLOOK
        IF ( p_inAssmnt_srce_cd = c_rating_sp AND p_inAssmnt_typ = c_outlook ) THEN

            g_sec_data_rec.rtg_sp_outlook               :=  v_wmc_assmnt_cd;
            g_sec_data_rec.sp_outlook_eff_dt            :=  v_eff_dt;
            g_sec_data_rec.sp_outlook_vndr_srce_cd      :=  v_vndr_srce_cd;

     ----SP WATCHLIST
         ELSIF  ( p_inAssmnt_srce_cd = c_rating_sp AND p_inAssmnt_typ = c_watchlist ) THEN

            g_sec_data_rec.rtg_sp_watch               :=  v_wmc_assmnt_cd;
            g_sec_data_rec.sp_watch_eff_dt            :=  v_eff_dt;
            g_sec_data_rec.sp_watch_vndr_srce_cd      :=  v_vndr_srce_cd;

     ----MOODY OUTLOOK
          ELSIF  ( p_inAssmnt_srce_cd = c_rating_moody AND p_inAssmnt_typ = c_outlook ) THEN

            g_sec_data_rec.rtg_moody_outlook               :=  v_wmc_assmnt_cd;
            g_sec_data_rec.moody_outlook_eff_dt            :=  v_eff_dt;
            g_sec_data_rec.moody_outlook_vndr_srce_cd      :=  v_vndr_srce_cd;

     ----MOODY WATCHLIST
          ELSIF  ( p_inAssmnt_srce_cd = c_rating_moody AND p_inAssmnt_typ = c_watchlist ) THEN

            g_sec_data_rec.rtg_moody_watch               :=  v_wmc_assmnt_cd;
            g_sec_data_rec.moody_watch_eff_dt            :=  v_eff_dt;
            g_sec_data_rec.moody_watch_vndr_srce_cd      :=  v_vndr_srce_cd;

     ----FITCH OUTLOOK
          ELSIF  ( p_inAssmnt_srce_cd = c_rating_fitch AND p_inAssmnt_typ = c_outlook ) THEN

            g_sec_data_rec.rtg_fitch_outlook               :=  v_wmc_assmnt_cd;
            g_sec_data_rec.fitch_outlook_eff_dt            :=  v_eff_dt;
            g_sec_data_rec.fitch_outlook_vndr_srce_cd      :=  v_vndr_srce_cd;

     ----FITCH WATCHLIST
          ELSIF  ( p_inAssmnt_srce_cd = c_rating_fitch AND p_inAssmnt_typ = c_watchlist ) THEN

            g_sec_data_rec.rtg_fitch_watch               :=  v_wmc_assmnt_cd;
            g_sec_data_rec.fitch_watch_eff_dt            :=  v_eff_dt;
            g_sec_data_rec.fitch_watch_vndr_srce_cd      :=  v_vndr_srce_cd;
     ----DBRS OUTLOOK --TD4861: DBRS ratings at the security level
          ELSIF  ( p_inAssmnt_srce_cd = c_rating_dbrs AND p_inAssmnt_typ = c_outlook ) THEN

            g_sec_data_rec.rtg_dbrs_outlook              :=  v_wmc_assmnt_cd;
            g_sec_data_rec.dbrs_outlook_eff_dt           :=  v_eff_dt;
            g_sec_data_rec.dbrs_outlook_vndr_srce_cd     :=  v_vndr_srce_cd;

     ----DBRS WATCHLIST --TD4861: DBRS ratings at the security level
          ELSIF  ( p_inAssmnt_srce_cd = c_rating_dbrs AND p_inAssmnt_typ = c_watchlist ) THEN

            g_sec_data_rec.rtg_dbrs_watch               :=  v_wmc_assmnt_cd;
            g_sec_data_rec.dbrs_watch_eff_dt            :=  v_eff_dt;
            g_sec_data_rec.dbrs_watch_vndr_srce_cd      :=  v_vndr_srce_cd;


         END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            NULL;

        WHEN OTHERS THEN

            display_message('get_sec_assessment_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_sec_assessment_data : '||SQLERRM);

    END get_sec_assessment_data;

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

    RETURN vendor_req_messages.wmc_column_value%TYPE
    IS
        c_bb_date_typ           CONSTANT NUMBER := 5;
        v_row_count             PLS_INTEGER;
        v_idr_bulk_data         vendor_req_messages.wmc_column_value%TYPE  :=  NULL;
        v_number_col            VARCHAR2(30);
        v_date_col              VARCHAR2(10);

    BEGIN

        v_row_count    :=  p_inSched_dt.count;

        FOR i IN 1..v_row_count LOOP

           -- mask the number columns
           IF p_infmt_mask_1 IS NULL then
               v_number_col := LTRIM(TO_CHAR(p_inSched_rt_1(i)));
           ELSE
               v_number_col := LTRIM(TO_CHAR(p_inSched_rt_1(i),p_infmt_mask_1));
           END IF;

           -- mask the date column
           v_date_col := TO_CHAR(p_inSched_dt(i),c_blmbg_date_format);

           --append the date value and the first number value
           v_idr_bulk_data     :=
               v_idr_bulk_data||
               c_bb_date_typ||c_def_bulk_sep||
               v_date_col||c_def_bulk_sep||
               p_inBB_typ_1||c_def_bulk_sep||
               v_number_col||c_def_bulk_sep;

            IF (p_inCol_cnt = 3) THEN
                --append the 2nd number value
                v_number_col := LTRIM(TO_CHAR(p_inSched_rt_2(i),p_infmt_mask_2));

                v_idr_bulk_data :=
                    v_idr_bulk_data||
                    p_inBB_typ_2||c_def_bulk_sep||
                    v_number_col||c_def_bulk_sep;

            END IF;

        END LOOP;

        IF  v_idr_bulk_data IS NOT NULL
        THEN
            -- Pre-pend the bulk definition
            v_idr_bulk_data :=
                c_def_bulk_sep
                ||2||c_def_bulk_sep|| -- two dimensional
                v_row_count||c_def_bulk_sep|| -- number of rows
                p_inCol_cnt||c_def_bulk_sep|| -- number of columns for each row
                v_idr_bulk_data;
        END IF;

        display_message('v_idr_bulk_data = '||SUBSTR(v_idr_bulk_data,1,200));
        display_message(SUBSTR(v_idr_bulk_data,201,250));

        RETURN v_idr_bulk_data;

    END concat_bulk_data;

    /************************** get_bulk_data **********************************
     ***
     ***  Author:           MahadS
     ***  Date Created:     21 Jun 2002
     ***  Type:             Public
     ***  Purpose:          This procedure gets bulk data and formats it
     ***
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
    RETURN vendor_req_messages.wmc_column_value%TYPE
    IS

        v_idr_bulk_data             vendor_req_messages.wmc_column_value%TYPE  :=  NULL;
        bb_schd_not_defined         EXCEPTION;
        v_ctr                       PLS_INTEGER := 0;
        v_num_col                   PLS_INTEGER := 0;
        v_bb_typ_1                  PLS_INTEGER := NULL;
        v_bb_typ_2                  PLS_INTEGER := NULL;
        v_infmt_mask_1              VARCHAR2(30) := NULL;
        v_infmt_mask_2              VARCHAR2(30) := NULL;
        v_inSched_dt_tbl            dbms_sql.date_table;
        v_inSched_rt_1_tbl          dbms_sql.number_table;
        v_inSched_rt_2_tbl          dbms_sql.number_table;


    BEGIN

        display_message (
            'get_bulk_data: Sec Id and schd name'||
            p_inSec_id||' '||p_inSchd_name
        );

        IF  (p_inSchd_name  IN  (
                                    c_call_schd_name,
                                    c_put_schd_name
                                )
            )
        THEN

            SELECT
                redemp_dt,
                redemp_price
            BULK COLLECT INTO
                v_inSched_dt_tbl,
                v_inSched_rt_1_tbl
            FROM
                sec_redemp_schd_tbl
            WHERE
                sec_id      =   p_inSec_id    AND
                redemp_typ  =   SUBSTR(p_inSchd_name,1,1)
            ORDER BY
                redemp_dt;

            v_inSched_rt_2_tbl.delete;
            v_num_col := 2;
            v_bb_typ_1 := 3; -- Price
            v_bb_typ_2 := NULL;
            v_infmt_mask_1 := '999999999999.0000';
            v_infmt_mask_2 := NULL;

        ELSIF   (p_inSchd_name  =   c_sink_schd_name) THEN

            SELECT
                sink_dt,
                sink_price,
                sink_sch_amt
            BULK COLLECT INTO
                v_inSched_dt_tbl,
                v_inSched_rt_1_tbl,
                v_inSched_rt_2_tbl
            FROM
                sec_sink_fd_schd_tbl
            WHERE
                sec_id      =   p_inSec_id
            ORDER BY
                sink_dt;

            v_num_col := 3;
            v_bb_typ_1 := 3; -- Price
            v_bb_typ_2 := 2; -- Numeric
            v_infmt_mask_1 := '999999999999.0000';
            v_infmt_mask_2 := '99999999999999.00';

        --
        --  SWAPs NSS    Nagesh S   03-12-2005
        --  Four rates schedules were added
        --  Also bb_data_typ_ind was added as value for rate schedules is 2 and
        --  rest should be 3
        --
        ELSIF   (p_inSchd_name  IN (
                                    c_multi_cpn_schd_name,
                                    c_rec_side_rates_hst_nm,
                                    c_pay_side_rates_hst_nm
                                   )
                )
        THEN

            SELECT
                cpn_dt,
                cpn_rt
            BULK COLLECT INTO
                v_inSched_dt_tbl,
                v_inSched_rt_1_tbl
            FROM
                sec_coupon_schd_tbl
            WHERE
                sec_id      =   p_inSec_id
            ORDER BY
                cpn_dt;

            v_inSched_rt_2_tbl.delete;
            v_num_col := 2;
            IF p_inSchd_name = c_multi_cpn_schd_name THEN
                v_bb_typ_1 := 3; -- Price
            ELSE
                v_bb_typ_1 := 2; -- Numeric
            END IF;
            v_bb_typ_2 := NULL;
            v_infmt_mask_1 := '999999999999.0000';
            v_infmt_mask_2 := NULL;

        ELSIF   ( p_inSchd_name  IN  (
                                         c_sw_pay_cash_flow_nm,
                                         c_sw_rec_cash_flow_nm
                                     )
                )
        THEN
            SELECT
                eff_dt,
                amount
            BULK COLLECT INTO
                v_inSched_dt_tbl,
                v_inSched_rt_1_tbl
            FROM
                sec_cash_flow_schd
            WHERE
                sec_id         =  p_inSec_id              AND
                cash_flow_typ  =  SUBSTR(p_inSchd_name,4)
            ORDER BY
                eff_dt;

            v_inSched_rt_2_tbl.delete;
            v_num_col := 2;
            v_bb_typ_1 := 2; -- Numeric
            v_bb_typ_2 := NULL;
            v_infmt_mask_1 := NULL;
            v_infmt_mask_2 := NULL;

        ELSIF   (p_inSchd_name  =   c_factor_schd_name) THEN
            --Added 'BANKLOAN' in below condition for TD4203:WADEKS on 27-JUL-2010.
            IF   blmbrg_common_pkg.get_sec_typ_group(p_inSec_id) IN  (
                                                                       'CORP',
                                                                       'BANKLOAN',
                                                                       'GOVT',
                                                                       'PFSTK',
                                                                       'AB',
                                                                       'CMO'
                                                                     )
            THEN
                 SELECT
                     eff_dt,
                     fctr
                 BULK COLLECT INTO
                     v_inSched_dt_tbl,
                     v_inSched_rt_1_tbl
                 FROM
                     sec_factor_schd_tbl
                 WHERE
                     sec_id      =   p_inSec_id         AND
                     fctr_typ    =   c_factor_typ
                 ORDER BY
                     eff_dt;

                  v_inSched_rt_2_tbl.delete;
                  v_num_col := 2;
                  v_bb_typ_1 := 3; -- Price
                  v_bb_typ_2 := NULL;
                  v_infmt_mask_1 := '999999999999.000000000';
                  v_infmt_mask_2 := NULL;

            ELSE
                 SELECT
                     eff_dt,
                     fctr
                 BULK COLLECT INTO
                     v_inSched_dt_tbl,
                     v_inSched_rt_1_tbl
                 FROM
                     sec_factor_schd_tbl
                 WHERE
                     sec_id      =   p_inSec_id         AND
                     fctr_typ    =   c_factor_typ       AND
                     eff_dt      >=  ( SELECT
                                               MAX(eff_dt)
                                       FROM
                                               sec_factor_schd_tbl
                                       WHERE   sec_id      =   p_inSec_id         AND
                                               fctr_typ    =   c_factor_typ
                                     );

                  v_inSched_rt_2_tbl.delete;
                  v_num_col := 2;
                  v_bb_typ_1 := 3; -- Price
                  v_bb_typ_2 := NULL;
                  v_infmt_mask_1 := '999999999999.000000000';
                  v_infmt_mask_2 := NULL;

            END IF;
        ELSIF   ( p_inSchd_name  = c_muni_erp_types )
        THEN

            FOR v_data  IN  (
                                SELECT
                                    UPPER(rav.long_dsc) long_dsc
                                FROM
                                    ref_attr_value rav,
                                    sec_attr_list_tbl s
                                WHERE
                                    rav.code_value = s.code_value  AND
                                    rav.attr_id    = s.Attr_Id     AND
                                    rav.srce_cd    = s.srce_cd     AND
                                    s.attr_id      = 609           AND
                                    s.srce_cd      = 'WMC'         AND
                                    s.sec_id       =  p_inSec_id
                                ORDER BY UPPER(rav.long_dsc)

                            )
            LOOP
                v_ctr           :=  v_ctr + 1;
                v_num_col       :=  1;
                v_idr_bulk_data := v_idr_bulk_data||1||c_def_bulk_sep||v_data.long_dsc||c_def_bulk_sep;

            END LOOP;

            IF  v_idr_bulk_data IS NOT NULL
            THEN
                v_idr_bulk_data :=
                    c_def_bulk_sep
                    ||2||c_def_bulk_sep|| -- two dimensional
                    v_ctr||c_def_bulk_sep|| -- number of rows
                    v_num_col||c_def_bulk_sep|| -- number of columns for each row
                    v_idr_bulk_data;
            END IF;

        ELSIF   ( p_inSchd_name  = c_interval_dt_schd )
        THEN

            FOR v_data  IN  (
                                SELECT
                                    interval_dt
                                FROM
                                    interval_dt_schd_stage i
                                WHERE
                                    nvl(i.invalid_flg, 'N') = 'N'   AND
                                    i.sec_id       =  p_inSec_id
                                ORDER BY i.interval_dt

                            )
            LOOP
                v_ctr           :=  v_ctr + 1;
                v_num_col       :=  1;
                v_idr_bulk_data := v_idr_bulk_data||5||c_def_bulk_sep||
                                    TO_CHAR(v_data.interval_dt,c_blmbg_date_format)||c_def_bulk_sep;

            END LOOP;

            IF  v_idr_bulk_data IS NOT NULL
            THEN
                v_idr_bulk_data :=
                    c_def_bulk_sep
                    ||2||c_def_bulk_sep|| -- two dimensional
                    v_ctr||c_def_bulk_sep|| -- number of rows
                    v_num_col||c_def_bulk_sep|| -- number of columns for each row
                    v_idr_bulk_data;
            END IF;

        ELSIF  (p_inSchd_name  =  c_loan_repay_schd_name )
        THEN
            SELECT
                repayment_dt,
                repayment_amt
            BULK COLLECT INTO
                v_inSched_dt_tbl,
                v_inSched_rt_1_tbl
            FROM
                sec_ln_repay_schd_tbl
            WHERE
                sec_id      =   p_inSec_id
            ORDER BY
                repayment_dt asc;

            v_inSched_rt_2_tbl.delete;
            v_num_col := 2;
            v_bb_typ_1 := 2; -- Numeric
            v_bb_typ_2 := NULL;
            v_infmt_mask_1 := NULL;
            v_infmt_mask_2 := NULL;

        ELSIF  (p_inSchd_name  =  c_hist_losses )
        THEN
            SELECT
                eff_dt,
                paydown_loss
            BULK COLLECT INTO
                v_inSched_dt_tbl,
                v_inSched_rt_1_tbl
            FROM
                sec_paydn_loss_schd
            WHERE
                sec_id          =   p_inSec_id  AND
                paydown_loss    IS NOT NULL
            ORDER BY
                eff_dt;

            v_inSched_rt_2_tbl.delete;
            v_num_col := 2;
            v_bb_typ_1 := 2; -- Numeric
            v_bb_typ_2 := NULL;
            v_infmt_mask_1 := '999999999990.00';
            v_infmt_mask_2 := NULL;

        ELSIF  (p_inSchd_name  =  c_hist_principal_distributed )
        THEN
            SELECT
                eff_dt,
                principal_dist
            BULK COLLECT INTO
                v_inSched_dt_tbl,
                v_inSched_rt_1_tbl
            FROM
                sec_paydn_loss_schd
            WHERE
                sec_id            =   p_inSec_id  AND
                principal_dist    IS NOT NULL
            ORDER BY
                eff_dt;

            v_inSched_rt_2_tbl.delete;
            v_num_col := 2;
            v_bb_typ_1 := 2; -- Numeric
            v_bb_typ_2 := NULL;
            v_infmt_mask_1 := '999999999990.00';
            v_infmt_mask_2 := NULL;

        ELSE

            RAISE bb_schd_not_defined;

        END IF;

        IF v_num_col <> 1 THEN  -- single column bulk data is built in-line

            v_idr_bulk_data :=  concat_bulk_data (
                                    p_inSched_dt    =>  v_inSched_dt_tbl,
                                    p_inSched_rt_1  =>  v_inSched_rt_1_tbl,
                                    p_inSched_rt_2  =>  v_inSched_rt_2_tbl,
                                    p_inCol_cnt     =>  v_num_col,
                                    p_inBB_typ_1    =>  v_bb_typ_1,
                                    p_inBB_typ_2    =>  v_bb_typ_2,
                                    p_infmt_mask_1  =>  v_infmt_mask_1,
                                    p_infmt_mask_2  =>  v_infmt_mask_2
                                );

        END IF;

        RETURN v_idr_bulk_data;


    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN NULL;

        WHEN bb_schd_not_defined THEN

            display_message('get_bulk_data: Bloomberg schd not def exception');
            RAISE_APPLICATION_ERROR(
                -20090,
                'get_bulk_data(bb_schd_not_defined) : '||SQLERRM
            );

        WHEN OTHERS THEN

            display_message('get_bulk_data: '|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(
                -20090,'get_bulk_data : '||SQLERRM
            );

    END get_bulk_data;

    /************************** get_future_struct *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Builds the future structure
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_future_struct(p_inSec_id vendor_request.sec_id%TYPE)
    RETURN VARCHAR2
    AS

        v_str        VARCHAR2(32767) := c_def_bulk_sep;
        c_del        CHAR(1) := ';';
        v_bulk_data  VARCHAR2(32767)  := NULL;
        v_count      PLS_INTEGER := 0;
        v_no_dims    CHAR(1)     := CONST_PRCE_IND;

    BEGIN

        -- Prepate the String before the data fields
        v_str  :=  v_str||v_no_dims||c_def_bulk_sep;
        -- ;2;3;2;4;val;2;val
        -- Get the bond's bb_unique from sec_external_id or from vendor_request
        FOR v_data IN (
            SELECT
                sei.extern_id,
                crs.conv_factor
            FROM
                sec_external_id sei,
                cons_rel_stat crs
            WHERE
                sei.sec_id         =  crs.related_sec_id   AND
                crs.sec_id         =  p_inSec_id           AND
                sei.extern_id_typ  =  BLMBRG_COMMON_PKG.CONST_BB_UNIQUE
            ORDER BY sei.extern_id
            )

        LOOP

           v_bulk_data :=  v_bulk_data||c_def_bulk_sep||CONST_CHAR_IND||c_def_bulk_sep||
                           v_data.extern_id||c_def_bulk_sep||CONST_PRCE_IND||
                           c_def_bulk_sep||v_data.conv_factor;

           v_count  := v_count + 1;


        END LOOP;

        IF v_count = 0 THEN

           RETURN NULL;

        ELSE

            v_bulk_data :=  v_str||v_count||c_def_bulk_sep||CONST_PRCE_IND||
                        v_bulk_data||c_def_bulk_sep;


            RETURN v_bulk_data;

        END IF;

    END get_future_struct;


    /************************** maintain_interval_dt_schd ********************
     ***  Author:           HillD
     ***  Date Created:     03/23/2007
     ***  Type:             Private
     ***  Purpose:          This procedure maintians the interval_dt_schd_stage table
     ***                    for a security .
     ***
     ***  Changes:  TD 2818
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE maintain_interval_dt_schd(
        p_inSec_id               IN      security_tbl.sec_id%TYPE,
        p_inInterval_dt_schd     IN      vendor_req_messages.column_value%TYPE
    )
    IS
        v_cur_val                   VARCHAR2(32767);
        v_bulk_sep                  CHAR(1);
        v_no_dim                    PLS_INTEGER;
        v_no_rows                   PLS_INTEGER;
        v_no_cols                   PLS_INTEGER;
        v_row_data                  VARCHAR2(200);
        v_cur_row                   PLS_INTEGER                         :=  0;
        v_interval_dt               DATE;
        v_code_val                  sec_attr_list_tbl.code_value%TYPE;
        v_interval_dt_t             interval_dt_type                    := interval_dt_type();
        v_nls_date_format           VARCHAR2(100)
                                        :=  VENDOR_MAP_PKG.get_nls_date_format;
        bb_bulk_data_exception      EXCEPTION;
        v_maint_ts                  DATE        :=  SYSDATE;
        c_proc_func_name            VARCHAR2(32)    := 'maintain_interval_dt_schd';  --TD3787 10/21/2008 DuttaD
        c_proc_loc                  VARCHAR2(50)    := NULL;                         --TD3787 10/21/2008 DuttaD

    BEGIN
        display_message('maintain_interval_dt_schd : sec_id = ['||p_inSec_id||']');

        IF  DBMS_LOB.GETLENGTH(p_inInterval_dt_schd) = 0 THEN

            v_cur_val := null;

        ELSE

            v_cur_val := p_inInterval_dt_schd;

        END IF;

        IF (v_cur_val IS NULL) THEN

            -- SET invalid_flg for all rows.
            UPDATE
                interval_dt_schd_stage i
            SET
                invalid_flg = 'Y'
            WHERE
                i.sec_id = p_inSec_id  AND
                nvl(i.invalid_flg,'N') = 'N';

            RETURN;

        END IF;

        v_bulk_sep  :=  SUBSTR(v_cur_val,1,1);
        v_cur_val   :=  SUBSTR(v_cur_val,2);

        --
        -- this will strip of the number of dim, rows, cols from the string
        --
        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        display_message('Curr data value is: '||v_cur_val);
        display_message(
            'No. of rows: '||v_no_rows||
            ', No. of cols:' ||v_no_cols||
            ', No. of dim:'||v_no_dim
        );

        -- Loop through each value passed and find the
        -- correspoding row in REF_ATTR_VALUE. that is
        -- what is inserted into sec_Attr_list_Tbl
        LOOP
            v_row_data  :=  SUBSTR(
                                v_cur_val,
                                1,INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)
                            );

            v_cur_val   :=  SUBSTR(
                                v_cur_val,
                                INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                            );

            v_interval_dt    :=  TO_DATE(
                                    SUBSTR(
                                        v_row_data,
                                        INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                        INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                            INSTR(v_row_data,v_bulk_sep,1,1)
                                    ),c_blmbg_date_format
                                 );

            display_message('Row data is: '||v_row_data);
            display_message('Interval date is:'||v_interval_dt);

            IF (v_interval_dt IS NOT NULL) THEN

                v_interval_dt_t.extend;
                v_interval_dt_t(v_interval_dt_t.last) := interval_dt_obj(v_interval_dt);

            END IF;

            v_cur_row   :=  v_cur_row + 1;
            EXIT WHEN TRIM(v_cur_val) IS NULL;

        END LOOP;

        IF (v_no_rows <> v_cur_row) THEN

            c_proc_loc := 'bb_bulk_data_exception';                              --TD3787 10/21/2008 DuttaD
            RAISE bb_bulk_data_exception;

        END IF;

        UPDATE
            interval_dt_schd_stage i
        SET
            invalid_flg = 'Y'
        WHERE
            i.interval_dt NOT IN
                 (  SELECT
                        x.interval_dt
                    FROM
                        TABLE(cast(v_interval_dt_t AS interval_dt_type)) x
                 )                                  AND
            i.sec_id = p_inSec_id                   AND
            nvl(i.invalid_flg,'N') = 'N';

        UPDATE
            interval_dt_schd_stage i
        SET
            invalid_flg = 'N'
        WHERE
            i.interval_dt IN
                 (  SELECT
                        x.interval_dt
                    FROM
                        TABLE(cast(v_interval_dt_t AS interval_dt_type)) x
                 )                                  AND
            i.sec_id = p_inSec_id                   AND
            nvl(i.invalid_flg,'N') = 'Y';

        INSERT INTO interval_dt_schd_stage i (
            sec_id,
            interval_dt,
            invalid_flg
        )
        SELECT
            p_inSec_id,
            x.interval_dt,
            'N'
        FROM
            TABLE(cast(v_interval_dt_t AS interval_dt_type)) x
        WHERE NOT EXISTS (  SELECT 1
                            FROM interval_dt_schd_stage s
                            WHERE
                                s.sec_id        =   p_inSec_id          AND
                                s.interval_dt   =   x.interval_dt
                         )
         ;

    EXCEPTION

        WHEN bb_bulk_data_exception THEN

            display_message('maintain_interval_dt_schd: Bulk data exception:'||SQLERRM);
            RAISE_APPLICATION_ERROR(
                -20090,
                ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM
            );                                                                                 --TD3787 10/21/2008 DuttaD

        WHEN OTHERS THEN

            display_message('maintain_interval_dt_schd: Unhandled exception: '||SQLERRM);
            RAISE_APPLICATION_ERROR(
                -20090,
                ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM ||SQLERRM
            );                                                                                   --TD3787 10/21/2008 DuttaD

    END maintain_interval_dt_schd;

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
    RETURN BOOLEAN
    IS

        v_nls_date_format           VARCHAR2(100)
                                        :=  VENDOR_MAP_PKG.get_nls_date_format;
        v_ret_flag                  BOOLEAN := FALSE;
        v_strlob                    VARCHAR2(32767);

        v_strike_px_fix_status_cd vendor_req_messages.fix_status_cd%TYPE;

       PROCEDURE set_datum_and_flag (
            p_inFlag_column         OUT     VARCHAR2,
            p_inDatum               OUT     VARCHAR2,
            p_inColumn_value        IN      VARCHAR2
        )
        IS

        BEGIN

            p_inFlag_column :=  'U';

            BEGIN

                p_inDatum       :=  p_inColumn_value;

            EXCEPTION
                WHEN VALUE_ERROR THEN

                    NULL;

            END;

        END set_datum_and_flag;

        PROCEDURE set_datum_and_flag (
            p_inFlag_column         OUT     VARCHAR2,
            p_inDatum               OUT     NUMBER,
            p_inColumn_value        IN      VARCHAR2
        )
        IS

        BEGIN

            p_inFlag_column :=  'U';

            BEGIN

                p_inDatum       :=  p_inColumn_value;

            EXCEPTION
                WHEN VALUE_ERROR THEN

                    NULL;

            END;

        END set_datum_and_flag;

        PROCEDURE set_date_datum_and_flag (
            p_inFlag_column         OUT     VARCHAR2,
            p_inDatum               OUT     DATE,
            p_inColumn_value        IN      VARCHAR2
        )
        IS

        BEGIN

            p_inFlag_column :=  'U';

            BEGIN

                p_inDatum   :=  TO_DATE(
                                    p_inColumn_value,
                                    v_nls_date_format
                                );

            EXCEPTION
                WHEN VALUE_ERROR THEN

                    NULL;

            END;

        END set_date_datum_and_flag;

    BEGIN

        display_message('get_bb_ext_vrq: Request Id: '||p_request_id);

        g_sec_data_rec              :=  NULL;
        g_sec_fsc_data_rec          :=  NULL;
        g_sec_data_rec.sec_id       :=  p_inSec_id;
        g_sec_data_rec.asset_class  :=  NVL(get_asset_class(p_sec_typ_id),'F');

        VENDOR_MAP_PKG.cache_csm_dictionary (
            g_csm_dict_cache
        );
        FOR v_data  IN  (
                            SELECT /*+ index(a,vendor_req_messages_pk) */
                                wmc_column_nm       column_name,
                                column_trans_value        column_value
                            FROM
                                vendor_req_messages a
                            WHERE
                                vendor_product_id   =   p_product_id    AND
                                request_id          =   p_request_id    AND
                                wmc_column_nm       IS NOT NULL         AND
                                NOT EXISTS          (
                                                        SELECT
                                                            'x'
                                                        FROM
                                                            TABLE(CAST(
                                                                g_csm_dict_cache AS TYP_BBG_CSM_DICTIONARY_CACHE
                                                            ))  t
                                                        WHERE
                                                            t.table_name    =   c_csm_security  AND
                                                            t.column_name   =   wmc_column_nm
                                                    )                   AND
                                fix_status_cd       =   'U'
                            UNION ALL  -- added because need both values for insert update into sec_sttr_list_tbl and Linking won't work
                            SELECT /*+ index(a,vendor_req_messages_pk) */
                                wmc_column_nm             column_name,
                                column_trans_value        column_value
                            FROM
                                vendor_req_messages a
                            WHERE
                                vendor_product_id   =   p_product_id             AND
                                request_id          =   p_request_id             AND
                                wmc_column_nm       IN  ('EXCH_CD_RAW','EXCH_CD_RAW_SRCE')  AND
                                exists
                                   (
                                       SELECT
                                            1
                                       FROM
                                            vendor_req_messages b
                                       WHERE
                                            vendor_product_id   =   p_product_id                                AND
                                            request_id          =   p_request_id                                AND
                                            b.wmc_column_nm     IN  ('EXCH_CD_RAW','EXCH_CD_RAW_SRCE')          AND
                                            b.fix_status_cd     =   'U')
                            UNION ALL
                            SELECT /*+ index(a,vendor_req_messages_pk) */
                                column_nm                 column_name,
                                SUBSTR(column_value,1,8)  column_value
                            FROM
                                vendor_req_messages a
                            WHERE
                                vendor_product_id   =   p_product_id    AND
                                request_id          =   p_request_id    AND
                                --column_nm IN ('WM_BMK_YB_CUSIP','WM_BMK_LB_CUSIP', 'WM_BMK_ML_CUSIP') AND -- HillD 09-29-2005 BMK rewrite phase 2
                                column_nm IN ('WM_BMK_YB_CUSIP','WM_BMK_CG_CUSIP','WM_BMK_LB_CUSIP', 'WM_BMK_ML_CUSIP') AND
                                LENGTH(column_value) = 9
                            )
        LOOP

            -- CLOB changes NallaN
            -- CLOB column is converted to varchar2 string
            --
            v_strlob    :=  DBMS_LOB.SUBSTR(v_data.column_value,DBMS_LOB.GETLENGTH(v_data.column_value),1);

            IF  v_data.column_name = 'SEC_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sec_id_flg,
                    g_sec_data_rec.sec_id,
                    v_strlob
                );
            ELSIF v_data.column_name = 'ASSET_CLASS' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.asset_class_flg,
                    g_sec_data_rec.asset_class,
                    v_strlob
                );

            /* TD3423 GarciN 01/07/2008

            ELSIF v_data.column_name = 'CALLABLE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.callable_flg,
                    g_sec_data_rec.callable,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SINKABLE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sinkable_flg,
                    g_sec_data_rec.sinkable,
                    v_strlob
                );

            ELSIF v_data.column_name = 'PUTABLE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.putable_flg,
                    g_sec_data_rec.putable,
                    v_strlob
                );*/

            ELSIF v_data.column_name = 'RTG_MOODY'   THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_moody_flg,
                    g_sec_data_rec.rtg_moody,
                    v_strlob
                );

            ELSIF v_data.column_name = 'RTG_SP'    THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_sp_flg,
                    g_sec_data_rec.rtg_sp,
                    v_strlob
                );

            ELSIF v_data.column_name = 'RTG_FITCH'  THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_fitch_flg,
                    g_sec_data_rec.rtg_fitch,
                    v_strlob
                );


            ELSIF v_data.column_name = 'RTG_MOODY_UNDL'   THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_moody_undl_flg,
                    g_sec_data_rec.rtg_moody_undl,
                    v_strlob
                );

            ELSIF v_data.column_name = 'RTG_SP_UNDL'    THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_sp_undl_flg,
                    g_sec_data_rec.rtg_sp_undl,
                    v_strlob
                );

            ELSIF v_data.column_name = 'RTG_FITCH_UNDL'  THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_fitch_undl_flg,
                    g_sec_data_rec.rtg_fitch_undl,
                    v_strlob
                );




            ELSIF v_data.column_name = 'MOODY_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.moody_vndr_srce_cd_flg,
                    g_sec_data_rec.moody_vndr_srce_cd,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SP_VNDR_SRCE_CD'   THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sp_vndr_srce_cd_flg,
                    g_sec_data_rec.sp_vndr_srce_cd,
                    v_strlob
                );

            ELSIF v_data.column_name = 'FITCH_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_vndr_srce_cd_flg,
                    g_sec_data_rec.fitch_vndr_srce_cd,
                    v_strlob
                );

            ELSIF v_data.column_name = 'MOODY_VNDR_SRCE_CD_UNDL' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.moody_vndr_srce_cd_undl_flg,
                    g_sec_data_rec.moody_vndr_srce_cd_undl,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SP_VNDR_SRCE_CD_UNDL'   THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sp_vndr_srce_cd_undl_flg,
                    g_sec_data_rec.sp_vndr_srce_cd_undl,
                    v_strlob
                );

            ELSIF v_data.column_name = 'FITCH_VNDR_SRCE_CD_UNDL' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_vndr_srce_cd_undl_flg,
                    g_sec_data_rec.fitch_vndr_srce_cd_undl,
                    v_strlob
                );



            ELSIF v_data.column_name = 'MOODY_EFF_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.moody_eff_dt_flg,
                    g_sec_data_rec.moody_eff_dt,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SP_EFF_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.sp_eff_dt_flg,
                    g_sec_data_rec.sp_eff_dt,
                    v_strlob
                );

            ELSIF v_data.column_name = 'FITCH_EFF_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_eff_dt_flg,
                    g_sec_data_rec.fitch_eff_dt,
                    v_strlob
                );


            ELSIF v_data.column_name = 'MOODY_EFF_DT_UNDL' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.moody_eff_dt_undl_flg,
                    g_sec_data_rec.moody_eff_dt_undl,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SP_EFF_DT_UNDL' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.sp_eff_dt_undl_flg,
                    g_sec_data_rec.sp_eff_dt_undl,
                    v_strlob
                );

            ELSIF v_data.column_name = 'FITCH_EFF_DT_UNDL' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_eff_dt_undl_flg,
                    g_sec_data_rec.fitch_eff_dt_undl,
                    v_strlob
                );



            ELSIF v_data.column_name = 'CALL_SCHEDULE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.call_schedule_flg,
                    g_sec_data_rec.call_schedule,
                    v_strlob
                );

           ELSIF v_data.column_name = 'WMC_ISR_FAM_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wmc_isr_fam_id_flg,
                    g_sec_data_rec.wmc_isr_fam_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'PUT_SCHEDULE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.put_schedule_flg,
                    g_sec_data_rec.put_schedule,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SINK_SCHEDULE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sink_schedule_flg,
                    g_sec_data_rec.sink_schedule,
                    v_strlob
                );

            ELSIF v_data.column_name = 'MULTI_CPN_SCHEDULE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.multi_cpn_schedule_flg,
                    g_sec_data_rec.multi_cpn_schedule,
                    v_strlob
                );

            ELSIF v_data.column_name = 'LOAN_REPAYMENT_SCHEDULE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.loan_repayment_schedule_flg,
                    g_sec_data_rec.loan_repayment_schedule,
                    v_strlob
                );

            ELSIF v_data.column_name = 'MTG_FACTOR' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.mtg_factor_flg,
                    g_sec_data_rec.mtg_factor,
                    v_strlob
                );

            ELSIF v_data.column_name = 'HIST_LOSSES' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.hist_losses_flg,
                    g_sec_data_rec.hist_losses,
                    v_strlob
                );

            ELSIF v_data.column_name = 'HIST_PRINCIPAL_DISTRIBUTED' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.hist_principal_distributed_flg,
                    g_sec_data_rec.hist_principal_distributed,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_UNIQUE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_unique_flg,
                    g_sec_data_rec.bb_unique,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_TICKER' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_ticker_flg,
                    g_sec_data_rec.bb_ticker,
                    v_strlob
                );

              -- TD 1571 Deep 02-18-05 -----------------------------------------------------------/

      /***********
            ELSIF v_data.column_name = 'TICKER' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.ticker_flg,
                    g_sec_data_rec.ticker,
                    v_data.column_value
                );

            ELSIF v_data.column_name = 'YELLOW_KEY' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.yellow_key_flg,
                    g_sec_data_rec.yellow_key,
                    v_data.column_value
                );

          ******************/
            ------------------------------------------------------------------------------------

            ELSIF v_data.column_name = 'CUSIP_SCRUB' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_scrub_cusip_flg,
                    g_sec_data_rec.bb_scrub_cusip,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_CUSIP' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_cusip_flg,
                    g_sec_data_rec.bb_cusip,
                    v_strlob
                );
            ELSIF v_data.column_name = 'WM_BMK_LB_CUSIP' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bmk_lb_cusip_flg,
                    g_sec_data_rec.bmk_lb_cusip,
                    v_strlob
                );
            ELSIF v_data.column_name = 'WM_OBLIGOR_OVERRIDE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_obligor_override_flg,
                    g_sec_data_rec.wm_obligor_override,
                    v_strlob
                );

            ELSIF v_data.column_name = 'WM_BMK_YB_CUSIP' THEN
                set_datum_and_flag (
                    g_sec_fsc_data_rec.bmk_yb_cusip_flg,
                    g_sec_data_rec.bmk_yb_cusip,
                    v_strlob
                );

            ELSIF v_data.column_name = 'WM_BMK_CG_CUSIP' THEN -- HillD 09-29-2005 BMK rewrite phase 2
                set_datum_and_flag (
                    g_sec_fsc_data_rec.bmk_cg_cusip_flg,
                    g_sec_data_rec.bmk_cg_cusip,
                    v_strlob
                );

            ELSIF v_data.column_name = 'WM_BMK_ML_CUSIP' THEN
                set_datum_and_flag (
                    g_sec_fsc_data_rec.bmk_ml_cusip_flg,
                    g_sec_data_rec.bmk_ml_cusip,
                    v_strlob
                );


            ELSIF v_data.column_name = 'BB_ISIN' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_isin_flg,
                    g_sec_data_rec.bb_isin,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_SEDOL' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_sedol_flg,
                    g_sec_data_rec.bb_sedol,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_GLOBAL' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_global_flg,
                    g_sec_data_rec.bb_global,
                    v_strlob
                );

            ELSIF v_data.column_name = 'OCC_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.occ_id_flg,
                    g_sec_data_rec.occ_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'OPRA_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.opra_id_flg,
                    g_sec_data_rec.opra_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'LOANX_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.loanx_id_flg,
                    g_sec_data_rec.loanx_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'WSO_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wso_id_flg,
                    g_sec_data_rec.wso_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_CLOSE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_close_flg,
                    g_sec_data_rec.bb_px_close,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_dt_flg,
                    g_sec_data_rec.bb_px_dt,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_SOURCE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_source_flg,
                    g_sec_data_rec.bb_px_source,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_CURCY' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_curcy_flg,
                    g_sec_data_rec.bb_px_curcy,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_CLOSE_MTD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_close_mtd_flg,
                    g_sec_data_rec.bb_px_close_mtd,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_CLOSE_MTD_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_close_mtd_dt_flg,
                    g_sec_data_rec.bb_px_close_mtd_dt,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_CLOSE_MTD_SOURCE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_close_mtd_source_flg,
                    g_sec_data_rec.bb_px_close_mtd_source,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_PX_CLOSE_MTD_CURCY' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_px_close_mtd_curcy_flg,
                    g_sec_data_rec.bb_px_close_mtd_curcy,
                    v_strlob
                );

            ELSIF v_data.column_name = 'BB_VENDOR_SEC_TICKER' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_vendor_sec_ticker_flg,
                    g_sec_data_rec.bb_vendor_sec_ticker,
                    v_strlob
                );

            ELSIF v_data.column_name = 'RIC' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.ric_flg,
                    g_sec_data_rec.ric,
                    v_strlob
                );

            --IgnatIV    TD2314    11/29/2005
            ELSIF v_data.column_name = 'TRANCHE_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_tranche_id_flg,
                    g_sec_data_rec.bb_tranche_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'REC_SIDE_RATES_HIST' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rec_side_rates_hist_flg,
                    g_sec_data_rec.rec_side_rates_hist,
                    v_strlob
                );

            ELSIF v_data.column_name = 'PAY_SIDE_RATES_HIST' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.pay_side_rates_hist_flg,
                    g_sec_data_rec.pay_side_rates_hist,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SW_PAY_CASH_FLOW' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sw_pay_cash_flow_flg,
                    g_sec_data_rec.sw_pay_cash_flow,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SW_REC_CASH_FLOW' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sw_rec_cash_flow_flg,
                    g_sec_data_rec.sw_rec_cash_flow,
                    v_strlob
                );
           ELSIF v_data.column_name = 'WM_QUASI_SOVG_FLG' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_quasi_sovg_flg_flg,
                    g_sec_data_rec.wm_quasi_sovg_flg,
                    v_strlob
                );

            ELSIF v_data.column_name = 'FUT_DLVRBLE_BNDS_BB_UNIQUE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fut_dlvrble_bnds_bb_unique_flg,
                    g_sec_data_rec.fut_dlvrble_bnds_bb_unique,
                    v_strlob
                );

            --
            -- KampeTA TD2859 01/10/2007
            --
            ELSIF v_data.column_name = 'MUNI_ERP_TYPES' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.muni_erp_types_flg,
                    g_sec_data_rec.muni_erp_types,
                    v_strlob
                );

            --
            -- Deon TD5912 08/01/2012
            --
            ELSIF v_data.column_name = 'EXCH_CD_RAW'       THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.exch_cd_raw_flg,
                    g_sec_data_rec.exch_cd_raw,
                    v_strlob
                );
            ELSIF  v_data.column_name = 'EXCH_CD_RAW_SRCE'  THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.exch_cd_raw_srce_flg,
                    g_sec_data_rec.exch_cd_raw_srce,
                    v_strlob
                );


            --
            -- HillD TD2818 03/18/2007
            --
            ELSIF v_data.column_name = 'WM_INTERVAL_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_interval_dt_flg,
                    g_sec_data_rec.wm_interval_dt,
                    v_strlob
                );

            --
            -- PitchV TD3175 09/11/2007
            --
            ELSIF v_data.column_name = 'WM_MAT_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_mat_dt_flg,
                    g_sec_data_rec.wm_mat_dt,
                    v_strlob
                );

            --
            -- GarciN TD3291 10/01/2007
            --
            ELSIF v_data.column_name = 'WM_MTG_WAL' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_mtg_wal_flg,
                    g_sec_data_rec.wm_mtg_wal,
                    v_strlob
                );

            --
            -- KampeTA TD3174 11/29/2007
            --
            ELSIF v_data.column_name = 'FIX_TO_FLOAT_RESET_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fix_to_float_reset_dt_flg,
                    g_sec_data_rec.fix_to_float_reset_dt,
                    v_strlob
                );

            -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions

            ELSIF v_data.column_name = 'ZONE_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.zone_id_flg,
                    g_sec_data_rec.zone_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'ZONE_SOURCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.zone_source_cd_flg,
                    g_sec_data_rec.zone_source_cd,
                    v_strlob
                );

            ELSIF v_data.column_name = 'ZONE_ID_DSC' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.zone_id_dsc_flg,
                    g_sec_data_rec.zone_id_dsc,
                    v_strlob
                );

            ELSIF v_data.column_name = 'ZONE_SOURCE_CD_DSC' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.zone_source_cd_dsc_flg,
                    g_sec_data_rec.zone_source_cd_dsc,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SEC_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sec_id_flg,
                    g_sec_data_rec.sec_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'RELATED_SEC_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.related_sec_id_flg,
                    g_sec_data_rec.related_sec_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'SEC_TYP_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sec_typ_id_flg,
                    g_sec_data_rec.sec_typ_id,
                    v_strlob
                );

            ELSIF v_data.column_name = 'EXCH_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.exch_cd_flg,
                    g_sec_data_rec.exch_cd,
                    v_strlob
                );

            ELSIF v_data.column_name = 'CRNCY_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.crncy_cd_flg,
                    g_sec_data_rec.crncy_cd,
                    v_strlob
                );

            -- TD#3352 CHANGES END

            --TD#3322 added 06-Mar-2008 Cognizant Technology Solutions.

            ELSIF  v_data.column_name = 'CLASS_LB_GLOBAL' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.lb_global_class_flg,
                    g_sec_data_rec.wmc_lb_global_class,
                    TO_CHAR(v_data.column_value)
                );

            ELSIF  v_data.column_name = 'CLASS_WMC_LB_GLOBAL' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.lb_global_class_wmc_flg,
                    g_sec_data_rec.wmc_lb_global_class_wmc,
                    TO_CHAR(v_data.column_value)
                );
            --TD#3322 Changes End.

            --TD#3389 added 01-May-2008 Cognizant Technology Solutions.

            ELSIF  v_data.column_name = '379_CATLG_ITEM_ID' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.CATLG_ITEM_ID_379_flg,
                    g_sec_data_rec.wm_379_catlg_item_id,
                    v_strlob
                );

            ELSIF  v_data.column_name = '379_CATLG_DESC' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.CATLG_ITEM_ID_379_flg,
                    g_sec_data_rec.wm_379_catlg_desc,
                    v_strlob
                );
            ELSIF  v_data.column_name = 'SEC_ID_LB' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.CATLG_ITEM_ID_379_flg,
                    g_sec_data_rec.WM_SEC_ID_DESC,
                    v_strlob
                );

            --TD#3389 Changes End.

            --TD#3644 added 17-Jun-2008 Cognizant Technology Solutions.


            ELSIF  v_data.column_name = 'IDX_RATIO' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.IDX_RATIO_flg,
                    g_sec_data_rec.IDX_RATIO,
                    v_strlob
                );

            -- added 08-Jul-2008 Cognizant Technology Solutions.

            ELSIF  v_data.column_name = 'SETTLE_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.SETTLE_DT_flg,
                    g_sec_data_rec.SETTLE_DT,
                    v_strlob
                );
           --TD#3644 Changes End.
           --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
            ELSIF v_data.column_name = 'SP_OUTLOOK_EFF_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sp_outlook_eff_dt_flg,
                    g_sec_data_rec.sp_outlook_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'SP_OUTLOOK_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sp_outlook_vndr_srce_cd_flg,
                    g_sec_data_rec.sp_outlook_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_SP_OUTLOOK' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_sp_outlook_flg,
                    g_sec_data_rec.rtg_sp_outlook,
                    v_strlob
                );
            ELSIF v_data.column_name = 'MOODY_OUTLOOK_EFF_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.moody_outlook_eff_dt_flg,
                    g_sec_data_rec.moody_outlook_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'MOODY_OUTLOOK_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.moody_outlook_vndr_srce_cd_flg,
                    g_sec_data_rec.moody_outlook_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_MOODY_OUTLOOK' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_moody_outlook_flg,
                    g_sec_data_rec.rtg_moody_outlook,
                    v_strlob
                );
            ELSIF v_data.column_name = 'FITCH_OUTLOOK_EFF_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_outlook_eff_dt_flg,
                    g_sec_data_rec.fitch_outlook_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'FITCH_OUTLOOK_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_outlook_vndr_srce_cd_flg,
                    g_sec_data_rec.fitch_outlook_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_FITCH_OUTLOOK' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_fitch_outlook_flg,
                    g_sec_data_rec.rtg_fitch_outlook,
                    v_strlob
                );
            ELSIF v_data.column_name = 'SP_WATCH_EFF_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sp_watch_eff_dt_flg,
                    g_sec_data_rec.sp_watch_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'SP_WATCH_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.sp_watch_vndr_srce_cd_flg,
                    g_sec_data_rec.sp_watch_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_SP_WATCH' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_sp_watch_flg,
                    g_sec_data_rec.rtg_sp_watch,
                    v_strlob
                );
            ELSIF v_data.column_name = 'MOODY_WATCH_EFF_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.moody_watch_eff_dt_flg,
                    g_sec_data_rec.moody_watch_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'MOODY_WATCH_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.moody_watch_vndr_srce_cd_flg,
                    g_sec_data_rec.moody_watch_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_MOODY_WATCH' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_moody_watch_flg,
                    g_sec_data_rec.rtg_moody_watch,
                    v_strlob
                );
            ELSIF v_data.column_name = 'FITCH_WATCH_EFF_DT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_watch_eff_dt_flg,
                    g_sec_data_rec.fitch_watch_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'FITCH_WATCH_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.fitch_watch_vndr_srce_cd_flg,
                    g_sec_data_rec.fitch_watch_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_FITCH_WATCH' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_fitch_watch_flg,
                    g_sec_data_rec.rtg_fitch_watch,
                    v_strlob
                );
           --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
           --TD:4861: DBRS ratings at the security level :WADEKS on 25-MAY-2011.
            ELSIF v_data.column_name = 'DBRS_EFF_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.dbrs_eff_dt_flg,
                    g_sec_data_rec.dbrs_eff_dt,
                    v_strlob
                );

            ELSIF v_data.column_name = 'DBRS_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.dbrs_vndr_srce_cd_flg,
                    g_sec_data_rec.dbrs_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_DBRS'  THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_dbrs_flg,
                    g_sec_data_rec.rtg_dbrs,
                    v_strlob
                );
            ELSIF v_data.column_name = 'DBRS_WATCH_EFF_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.dbrs_watch_eff_dt_flg,
                    g_sec_data_rec.dbrs_watch_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'DBRS_WATCH_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.dbrs_watch_vndr_srce_cd_flg,
                    g_sec_data_rec.dbrs_watch_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_DBRS_WATCH' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_dbrs_watch_flg,
                    g_sec_data_rec.rtg_dbrs_watch,
                    v_strlob
                );

            ELSIF v_data.column_name = 'DBRS_OUTLOOK_EFF_DT' THEN

                set_date_datum_and_flag (
                    g_sec_fsc_data_rec.dbrs_outlook_eff_dt_flg,
                    g_sec_data_rec.dbrs_outlook_eff_dt,
                    v_strlob
                );
            ELSIF v_data.column_name = 'DBRS_OUTLOOK_VNDR_SRCE_CD' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.dbrs_outlook_vndr_srce_cd_flg,
                    g_sec_data_rec.dbrs_outlook_vndr_srce_cd,
                    v_strlob
                );
            ELSIF v_data.column_name = 'RTG_DBRS_OUTLOOK' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.rtg_dbrs_outlook_flg,
                    g_sec_data_rec.rtg_dbrs_outlook,
                    v_strlob
                );
           --TD:4861: DBRS ratings at the security level :WADEKS on 25-MAY-2011.
           --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:start
            ELSIF v_data.column_name = 'BB_CNTRY_OF_DOMICILE' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_cntry_of_domicile_flg,
                    g_sec_data_rec.bb_cntry_of_domicile,
                    v_strlob
                );
            ELSIF v_data.column_name = 'BB_CNTRY_OF_INCORPORATION' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.bb_cntry_of_incorporation_flg,
                    g_sec_data_rec.bb_cntry_of_incorporation,
                    v_strlob
                );
           --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:end

            -- #TD5304 set datum and flag start
            ELSIF v_data.column_name = 'INDUSTRY_SUBGROUP_NUM' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.industry_subgroup_num_flg,
                    g_sec_data_rec.industry_subgroup_num,
                    v_strlob
                );
            ELSIF v_data.column_name = 'INDUSTRY_GROUP_NUM' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.industry_group_num_flg,
                    g_sec_data_rec.industry_group_num,
                    v_strlob
                );
             ELSIF v_data.column_name = 'INDUSTRY_SECTOR_NUM' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.industry_sector_num_flg,
                     g_sec_data_rec.industry_sector_num,
                     v_strlob
                 );-- #TD5304 set datum and flag end
            ELSIF v_data.column_name = 'WM_JPM_IND_CLASS' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_jpm_ind_class_flg,
                    g_sec_data_rec.wm_jpm_ind_class,
                    v_strlob
                );
             ELSIF v_data.column_name = 'WM_TOPIX_IND_CLASS' THEN --TD6129 Raiteav

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_topix_ind_class_flg,
                    g_sec_data_rec.wm_topix_ind_class,
                    v_strlob
                );
             ELSIF v_data.column_name = 'UNADJUSTED_PAY_DAY' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.unadjusted_pay_day_flg,
                     g_sec_data_rec.unadjusted_pay_day,
                     v_strlob
                 );-- #TD5442 set datum and flag end
             ELSIF v_data.column_name = 'COUPON_CONVENTION' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.coupon_convention_flg,
                     g_sec_data_rec.coupon_convention,
                     v_strlob
                 );-- #TD5442 set datum and flag end
             ELSIF v_data.column_name = 'DATA_SRCE_STATUS_CD' THEN --TD5899 08/14/2012 VartaV START

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.data_srce_status_cd_flg,
                     g_sec_data_rec.data_srce_status_cd,
                     v_strlob
                 );
            ELSIF v_data.column_name = 'PAYMENT_RANK' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.payment_rank_flg,
                     g_sec_data_rec.payment_rank,
                     v_strlob
                 );
            ELSIF v_data.column_name = 'SURPLUS_NOTE_FLG' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.surplus_note_flg_flg,
                     g_sec_data_rec.surplus_note_flg,
                     v_strlob
                 );
            ELSIF v_data.column_name = 'TIER_CAPITAL' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.tier_capital_flg,
                     g_sec_data_rec.tier_capital,
                     v_strlob
                 );
            ELSIF v_data.column_name = 'MTG_POOL_TYP' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.mtg_pool_typ_flg,
                     g_sec_data_rec.mtg_pool_typ,
                     v_strlob
                 );
            ELSIF v_data.column_name = 'COLLAT_CNTRY_CD' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.collat_cntry_cd_flg,
                     g_sec_data_rec.collat_cntry_cd,
                     v_strlob
                 );
            ELSIF v_data.column_name = 'OPT_VAR_MARGIN_FLG' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.opt_var_margin_flg_flg,
                     g_sec_data_rec.opt_var_margin_flg,
                     v_strlob
                 );
            --TD5899 08/14/2012 VARTAV END
            ELSIF v_data.column_name = 'WM_BOA_ML_IND_CLASS' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.wm_boa_ml_ind_class_flg,
                    g_sec_data_rec.wm_boa_ml_ind_class,
                    v_strlob
                );--TD5969 Vartav
            ELSIF v_data.column_name = 'MUNI_ISSUE_TYP' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.muni_issue_typ_flg,
                     g_sec_data_rec.muni_issue_typ,
                     v_strlob
                 ); --TD6042 Vartav 11.12.2012
            ELSIF v_data.column_name = 'INVERSE_FLT_BOND_TYP' THEN

                 set_datum_and_flag (
                     g_sec_fsc_data_rec.cpn_recalc_method_flg,
                     g_sec_data_rec.cpn_recalc_method,
                     v_strlob
                 ); --TD6066 Vartav 11.12.2012
            -- TD5410
            ELSIF v_data.column_name = 'CAPITAL_CONTINGENT' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.capital_contingent_flg,
                    g_sec_data_rec.capital_contingent,
                    v_strlob
                );
                ---TD6262
            ELSIF  v_data.column_name = 'TRADE_DESC' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.trade_description_flg,
                    g_sec_data_rec.trade_description,
                    v_strlob
                );
			--TD6720
            ELSIF  v_data.column_name = 'JPM_CNTRY_CLASS' THEN

                set_datum_and_flag (
                    g_sec_fsc_data_rec.jpm_cntry_classification_flg,
                    g_sec_data_rec.jpm_cntry_classification,
                    v_strlob
                );
            ELSE

                RAISE_APPLICATION_ERROR(
                    -20099,
                    'Unknown column encountered in _SEC_.get_bb_ext_vrq '||v_data.column_name
                );

            END IF;

            v_ret_flag  :=  TRUE;

        END LOOP;

        RETURN v_ret_flag;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('get_bb_ext_vrq:'||SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20090,'get_bb_ext_req : '||SQLERRM);
            RETURN  FALSE;  --  Never get here

    END get_bb_ext_vrq;

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
    RETURN bb_sec_rec_type
    IS

       v_isr_id                      issuer.isr_id%TYPE;
       v_wmc_isr_fam_id              issuer_family.wmc_isr_fam_id%TYPE;

    BEGIN


        display_message('get_bb_ext_security: Sec Id: '||p_inSec_id);

        g_sec_data_rec  :=  NULL;

        IF  (p_inSec_id IS NOT NULL) THEN

            g_sec_data_rec.sec_id   :=  p_inSec_id;

            get_sec_info(p_inSec_id);

            SELECT
                isr_id
            INTO
                v_isr_id
            FROM
                security_tbl
            WHERE
                sec_id  =  p_inSec_id;

            v_wmc_isr_fam_id    :=  MAINTAIN_BB_ISR_FAM_PKG.get_wmc_isr_fam_id(
                                        v_isr_id
                                    );

            g_sec_data_rec.wmc_isr_fam_id       :=  v_wmc_isr_fam_id;

            g_sec_data_rec.call_schedule        :=  get_bulk_data(
                                                        p_inSec_id,
                                                        c_call_schd_name
                                                    );
            g_sec_data_rec.put_schedule         :=  get_bulk_data(
                                                        p_inSec_id,
                                                        c_put_schd_name
                                                    );
            g_sec_data_rec.sink_schedule        :=  get_bulk_data(
                                                        p_inSec_id,
                                                        c_sink_schd_name
                                                    );
            g_sec_data_rec.multi_cpn_schedule   :=  get_bulk_data(
                                                        p_inSec_id,
                                                        c_multi_cpn_schd_name
                                                    );
            g_sec_data_rec.mtg_factor           :=  get_bulk_data(
                                                        p_inSec_id,
                                                        c_factor_schd_name
                                                    );
            g_sec_data_rec.hist_losses           :=  get_bulk_data(
                                                        p_inSec_id,
                                                        c_hist_losses
                                                    );
            g_sec_data_rec.hist_principal_distributed  :=  get_bulk_data(
                                                        p_inSec_id,
                                                        c_hist_principal_distributed
                                                    );
            g_sec_data_rec.loan_repayment_schedule  :=  get_bulk_data(
                                                            p_inSec_id,
                                                            c_loan_repay_schd_name
                                                        );
            display_message('Received schedule data');

            get_rating_data(p_inSec_id,c_rating_moody,CSM_COMMON.CONST_RATING_TYPE_CREDIT);
            get_rating_data(p_inSec_id,c_rating_fitch,CSM_COMMON.CONST_RATING_TYPE_CREDIT);         --  Gap 07/01/2003  (SH)
            get_rating_data(p_inSec_id,c_rating_sp,CSM_COMMON.CONST_RATING_TYPE_CREDIT);
            get_rating_data(p_inSec_id,c_rating_dbrs,CSM_COMMON.CONST_RATING_TYPE_CREDIT);   --TD:4861: DBRS ratings at the security level :WADEKS

            get_rating_data(p_inSec_id,c_rating_moody,CSM_COMMON.CONST_RATING_TYPE_UNDER);
            get_rating_data(p_inSec_id,c_rating_fitch,CSM_COMMON.CONST_RATING_TYPE_UNDER);
            get_rating_data(p_inSec_id,c_rating_sp,CSM_COMMON.CONST_RATING_TYPE_UNDER);


            display_message('Received rating data');
  --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
  ----SP OUTLOOK
            get_sec_assessment_data(p_inSec_id, c_rating_sp , c_outlook);

  ----SP WATCHLIST
            get_sec_assessment_data(p_inSec_id, c_rating_sp , c_watchlist);

  ----MOODY OUTLOOK
            get_sec_assessment_data(p_inSec_id, c_rating_moody , c_outlook);

  ----MOODY WATCHLIST
            get_sec_assessment_data(p_inSec_id, c_rating_moody , c_watchlist);

  ----FITCH OUTLOOK
            get_sec_assessment_data(p_inSec_id, c_rating_fitch , c_outlook);

  ----FITCH WATCHLIST
            get_sec_assessment_data(p_inSec_id, c_rating_fitch , c_watchlist);
  --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
  --TD:4861: DBRS ratings at the security level :WADEKS on 10-MAR-2011.
  ----DBRS OUTLOOK
            get_sec_assessment_data(p_inSec_id, c_rating_dbrs , c_outlook);

  ----DBRS WATCHLIST
            get_sec_assessment_data(p_inSec_id, c_rating_dbrs , c_watchlist);
  --TD:4861: DBRS ratings at the security level :WADEKS on 10-MAR-2011.

            display_message('Received sec_assessment data');

            get_vendor_nm_data(p_inSec_id);
            display_message('Received vendor name data');

            --get_sec_fi_data(p_inSec_id);  TD3423 GarciN 01/07/2008
            display_message('Received sec_fi data');

            get_extern_data(p_inSec_id,c_bb_unique);
            --get_extern_data(p_inSec_id,c_bb_ticker);
            --moved bb_ticker to sec_descriptor table
            get_sec_descriptor_data(p_inSec_id,c_bb_ticker);
            -- TD 1571 Deep 02-18-05 -----------------------------------------------------------
            /*********
            get_sec_descriptor_data(p_inSec_id,c_ticker);
            get_sec_descriptor_data(p_inSec_id,c_yellow_key);
            ***********/
            ------------------------------------------------------------------------------------

            get_extern_data(p_inSec_id,c_bb_scrub_cusip);
            get_extern_data(p_inSec_id,c_bmk_lb_cusip);
            get_extern_data(p_inSec_id,c_bmk_yb_cusip);
            get_extern_data(p_inSec_id,c_bmk_cg_cusip); -- HillD 09-29-2005 BMK rewrite phase 2
            get_extern_data(p_inSec_id,c_bmk_ml_cusip);
            get_extern_data(p_inSec_id,c_bb_isin);
            get_extern_data(p_inSec_id,c_bb_sedol);
            get_extern_data(p_inSec_id,c_ric);
            get_extern_data(p_inSec_id,c_tranche_id);   --IgnatIV    TD2314    11/29/2005
            get_extern_data(p_inSec_id,c_bb_global);
            get_extern_data(p_inSec_id,c_occ_id);
            get_extern_data(p_inSec_id,c_opra_id);
            get_extern_data(p_inSec_id,c_loanx_id);
            get_extern_data(p_inSec_id,c_wso_id);

            g_sec_data_rec.rec_side_rates_hist       :=  get_bulk_data(
                                                             p_inSec_id,
                                                             c_rec_side_rates_hst_nm
                                                         );
            g_sec_data_rec.pay_side_rates_hist       :=  get_bulk_data(
                                                             p_inSec_id,
                                                             c_pay_side_rates_hst_nm
                                                         );
            g_sec_data_rec.sw_pay_cash_flow          :=  get_bulk_data(
                                                             p_inSec_id,
                                                             c_sw_pay_cash_flow_nm
                                                         );
            g_sec_data_rec.sw_rec_cash_flow          :=  get_bulk_data(
                                                             p_inSec_id,
                                                             c_sw_rec_cash_flow_nm
                                                         );
            g_sec_data_rec.wm_quasi_sovg_flg         :=  get_sec_quasi_sovg_rel(
                                                            p_inSec_id
                                                         );
            g_sec_data_rec.fut_dlvrble_bnds_bb_unique := get_future_struct(
                                                             p_inSec_id
                                                         );
            g_sec_data_rec.wm_obligor_override       :=  maintain_bb_isr_fam_pkg.get_obligor_by_sec (
                                                             p_inSec_id
                                                         );
            g_sec_data_rec.muni_erp_types            :=  get_bulk_data(
                                                              p_inSec_id,
                                                              c_muni_erp_types
                                                         );
            g_sec_data_rec.wm_interval_dt            :=  get_bulk_data(           --  HillD TD2818 03/18/2007
                                                              p_inSec_id,
                                                              c_interval_dt_schd
                                                          );

            --TD 3174 KampeTA 11/29/2007
            g_sec_data_rec.fix_to_float_reset_dt   :=  TO_DATE(get_security_attribute (
                                                                     p_inSec_id,
                                                                     c_fix_to_float_reset_dt
                                                                     ), 'MM-DD-YYYY');

            -- TD#3352 added 2008-Feb-18 Cognizant Technology Solutions

            g_sec_data_rec.zone_id                   :=  get_zone_id(
                                                              p_inSec_id
                                                         );
            g_sec_data_rec.zone_source_cd            :=  get_zone_source_cd(
                                                              p_inSec_id
                                                         );
            g_sec_data_rec.zone_id_dsc               :=  get_zone_id_dsc(
                                                              g_sec_data_rec.zone_id
                                                         );
            g_sec_data_rec.zone_source_cd_dsc        :=  get_zone_source_cd_dsc(
                                                              g_sec_data_rec.zone_source_cd
                                                         );

            -- TD#3352 Changes End

            -- TD#3389 added 2 May 2008 Cognizant Technology Solutions

            g_sec_data_rec.wm_379_catlg_item_id      :=  blmbrg_rules_pkg.get_379catlg_item_id(
                                                               p_inSec_id
                                                         );
            g_sec_data_rec.wm_379_catlg_desc         :=  blmbrg_rules_pkg.get_379catlg_item_id_desc(
                                                               g_sec_data_rec.wm_379_catlg_item_id
                                                         );
            --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:start

            g_sec_data_rec.bb_cntry_of_domicile         :=  get_security_attribute (
                                                                     p_inSec_id,
                                                                     c_bb_cntry_of_domicile
                                                                     );
            g_sec_data_rec.bb_cntry_of_incorporation    :=  get_security_attribute (
                                                                     p_inSec_id,
                                                                     c_bb_cntry_of_incorporation
                                                                     );


            --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:end
            -- #TD5304 get bb ext sec start
            g_sec_data_rec.industry_subgroup_num        := maintain_markit_curves_pkg.get_catlg_item_low_cd(get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_ind_subgrp_num_catlg_id));
            g_sec_data_rec.industry_group_num           := maintain_markit_curves_pkg.get_catlg_item_low_cd(get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_ind_grp_num_catlg_id));
            g_sec_data_rec.industry_sector_num          := maintain_markit_curves_pkg.get_catlg_item_low_cd(get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_ind_sector_num_catlg_id));
            g_sec_data_rec.wm_jpm_ind_class             := maintain_markit_curves_pkg.get_catlg_item_low_cd(NVL(get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_jpm_catlg_id),
                                                               get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_wmc_jpm_catlg_id)));
            -- TD6129 Raiteav 05-JUN-2013
            g_sec_data_rec.wm_topix_ind_class             := maintain_markit_curves_pkg.get_catlg_item_low_cd(get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_tpx_catlg_id)
                                                              );
            --
            -- TD5912 Deon 8/1/2012
            --
            g_sec_data_rec.exch_cd_raw                  := get_sec_attr_list (
                                                                     p_inSec_id,
                                                                     c_exch_cd_attr_id);

            --
            -- TD5912 Deon 8/1/2012
            --
            g_sec_data_rec.exch_cd_raw_srce              := get_sec_attr_list_srce (
                                                                     p_inSec_id,
                                                                     c_exch_cd_attr_id);

            -- #TD5304 get bb ext sec end

            --TD#3389 Changes End.
            g_sec_data_rec.wm_boa_ml_ind_class             := maintain_markit_curves_pkg.get_catlg_item_low_cd(NVL(get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_boa_ml_catlg_id),
                                                                     get_sec_catlg_item_id (
                                                                     p_inSec_id,
                                                                     c_wmc_boa_ml_catlg_id)));  --TD5969 VartaV
            get_sec_fi_data(p_inSec_id); --TD#5442:Khetr: Get unadjusted pay day

            -- TD5410
            g_sec_data_rec.capital_contingent                  := get_sec_attr_list (
                                                                     p_inSec_id,
                                                                     c_capital_contingent_attr_id,
                                                                     'CSM');

            --TD6262
            get_sec_descriptor_data(p_inSec_id ,c_trade_description );

			--TD6720
            g_sec_data_rec.jpm_cntry_classification            :=  get_security_attribute (
                                                                     p_inSec_id,
                                                                     c_jpm_cntry_clfsn_description
                                                                     );

            display_message('Received extern data');

        END IF;

        RETURN g_sec_data_rec;

    END get_bb_ext_security;

    /************************** maintain_sec_struct *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Private
    ***  Purpose:       Insert/update/delete rows from sec_struct table
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    PROCEDURE maintain_sec_struct(
       p_inSec_id         security_tbl.sec_id%TYPE,
       p_inRelated_sec_id security_tbl.sec_id%TYPE,
       p_inAction         VARCHAR2  DEFAULT NULL
    )
    AS
       c_proc_func_name    VARCHAR2(32)    := 'maintain_sec_struct';     --TD3787 10/21/2008 DuttaD
       c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        CSM_MAINTAIN_ENTITY.maintain_sec_struct(
                                p_inSec_id,
                                p_inRelated_sec_id,
                                p_inAction
                            );

    EXCEPTION
        WHEN OTHERS THEN

           display_message('insert sec struct: '||SQLERRM);
           RAISE_APPLICATION_ERROR(20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);              --TD3787 10/21/2008 DuttaD
    END maintain_sec_struct;

    /************************** maintain_cons_rel_stat ************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Maintain cons_rel_stat table
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    ***************************************************************************/

    PROCEDURE maintain_cons_rel_stat(
        p_inSec_id         security_tbl.sec_id%TYPE,
        p_inRelated_sec_id security_tbl.sec_id%TYPE,
        p_inConv_factor    cons_rel_stat.conv_factor%TYPE
        )

    AS
       c_proc_func_name    VARCHAR2(32)    := 'maintain_cons_rel_stat';  --TD3787 10/21/2008 DuttaD
       c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        --
        -- Maintain sec_struct
        --
        maintain_sec_struct(
            p_inSec_id,
            p_inRelated_sec_id);


        UPDATE
            cons_rel_stat
        SET
            conv_factor = p_inConv_factor
        WHERE
            sec_id           = p_inSec_id           AND
            related_sec_id   = p_inRelated_sec_id   AND
            relationship_typ = BLMBRG_COMMON_PKG.CONST_DV;

        IF SQL%ROWCOUNT = 0 THEN

            display_message('Insert crs: '||p_inSec_id||' '||p_inRelated_sec_id|| ' '||p_inConv_factor);

            INSERT INTO cons_rel_stat (
                sec_id,
                related_sec_id,
                relationship_typ,
                conv_factor,
                eff_dt
            )
            VALUES (
                p_inSec_id,
                p_inRelated_sec_id,
                BLMBRG_COMMON_PKG.CONST_DV,
                p_inConv_factor,
                TRUNC(SYSDATE)
            );

       END IF;

    EXCEPTION                                   --TD3787 10/21/2008 Exception Added By DuttaD

        WHEN OTHERS
        THEN
             RAISE_APPLICATION_ERROR(20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);

    END maintain_cons_rel_stat;


    /************************** del_future_rel *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Deletes relation from sec_struct and cons_rel_stat
    ***                 for the future
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    PROCEDURE del_future_rel(
        p_inSec_id         vendor_request.sec_id%TYPE,
        p_inRelated_sec_id vendor_request.sec_id%TYPE,
        p_inRequest_id     vendor_request.request_id%TYPE,
        p_inProduct_id     vendor_request.vendor_product_id%TYPE
        )
    AS
       v_Request_Grp_Nm  vendor_request.Request_Grp_Nm%TYPE;
       c_proc_func_name    VARCHAR2(32)    := 'del_future_rel';          --TD3787 10/21/2008 DuttaD
       c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        -- Delete the relation if the bond is missing in future link
        display_message('Start del_future_rel [req_id] :'||p_inRequest_id||' [sec_id]:' || p_inSec_id);

        DELETE FROM cons_rel_stat
        WHERE
            sec_id           = p_inSec_id             AND
            related_sec_id   = p_inRelated_sec_id     AND
            relationship_typ = BLMBRG_COMMON_PKG.CONST_DV;

        display_message('del_future_rel()delete sec_struct: '||p_inSec_id);

        maintain_sec_struct(
            p_inSec_id,
            p_inRelated_sec_id,
            'D'
        );

        display_message('del_future_rel()delete vrr: '||p_inRelated_sec_id);

        c_proc_loc := 'vendor_request';                                  --TD3787 10/21/2008 DuttaD
        SELECT Request_Grp_nm INTO v_Request_Grp_Nm
        FROM Vendor_Request
        WHERE Request_Id = p_inRequest_id;

        display_message('del_future_rel()select vr: '||p_inRequest_id);
        display_message('del_future_rel()Request GrpNm : '||v_Request_Grp_Nm);

        UPDATE
            vendor_rel_request
        SET
            active_flg  = BLMBRG_COMMON_PKG.CONST_N,
            upd_ts      = SYSDATE,
            upd_login   = USER
        WHERE
            active_flg          = BLMBRG_COMMON_PKG.CONST_Y AND -- TD2605 HillD 06/27/2006
            request_id          = p_inRequest_id            AND
            related_request_id  = (
                                   SELECT
                                       request_id
                                   FROM
                                       vendor_request
                                   WHERE sec_id            = p_inRelated_sec_id
                                   AND   Request_Grp_Nm    = v_Request_Grp_Nm
                                   AND   Vendor_Product_Id = vendor_product_id
                                  );

        display_message('End del_future_rel [req_id] :'||p_inRequest_id||' [sec_id]:' || p_inSec_id);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

              display_message('Missing Bond/Future Link :'||p_inSec_id||'  '||p_inRelated_sec_id);
              RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);    --TD3787 10/21/2008 DuttaD
        WHEN OTHERS THEN

             -- RAISE;                                                 --TD3787 10/21/2008 Remove Raise and introduce Raise App Error DuttaD
             RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);    --TD3787 10/21/2008 DuttaD
    END del_future_rel;

    /************************** diff_future_struct *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Compares the future bond relationship between bloomberg
    ***                 and IDR.
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    PROCEDURE diff_future_struct(
        p_inProduct_id  vendor_request.vendor_product_id%TYPE,
        p_inRequest_id  vendor_request.request_id%TYPE,
        p_inSec_id     vendor_request.sec_id%TYPE
        )
    AS
        c_proc_func_name    VARCHAR2(32)    := 'diff_future_struct';      --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        display_message('Start diff_future_struct [sec_id]:' || p_inSec_id);

        c_proc_loc := 'cons_rel_stat';
        FOR v_data IN (
            SELECT
                sec_id,
                related_sec_id
            FROM
                cons_rel_stat
            WHERE
                sec_id           = p_inSec_id                 AND
                relationship_typ = BLMBRG_COMMON_PKG.CONST_DV
            MINUS
            SELECT
                a.fut_sec_id,
                a.bond_sec_id
            FROM
                TABLE(CAST(g_tab_bond AS TYP_BOND_FCTR))  a
            )
        LOOP

             -- Check only when deliverable bonds exists
             -- Delete the records from sec_struct and cons_rel_stat
             --

             display_message('Diff: '||v_data.sec_id|| 'RL:'||v_data.related_sec_id);
             del_future_rel(
                 v_data.sec_id,
                 v_data.related_sec_id,
                 p_inRequest_id,
                 p_inProduct_id
                 );

         END LOOP;

         display_message('End diff_future_struct [sec_id]:' || p_inSec_id);


    EXCEPTION
        WHEN OTHERS THEN

            display_message('diff future struct: '||SQLERRM);
             -- RAISE;                                                 --TD3787 10/21/2008 Remove Raise and introduce Raise App Error DuttaD
             RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);    --TD3787 10/21/2008 DuttaD

    END diff_future_struct;

   /************************** get_sec_request_id *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  12/02/2005
    ***  Type:          Public
    ***  Purpose:       Gets the sec request_id from vendor_request.
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION get_sec_request_id(
        p_inSec_id vendor_request.sec_id%TYPE
        )
    RETURN vendor_request.request_id%TYPE
    AS
        v_request_id    vendor_request.request_id%TYPE := NULL;

    BEGIN

        SELECT
            MAX(request_id)
        INTO
            v_request_id
        FROM
            vendor_request
        WHERE
            sec_id  = p_inSec_id  AND
            request_grp_nm = BLMBRG_REQUEST_PKG.c_security_scrub;

        RETURN v_request_id;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_request_id;
    END get_sec_request_id;


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
        )
    AS
        v_index   PLS_INTEGER;
        c_proc_func_name    VARCHAR2(32)    := 'maintain_factor';         --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        IF get_future_data(p_inProduct_id,p_inRequest_id) THEN

            FOR v_index IN g_tab_bond.FIRST..g_tab_bond.LAST  LOOP

            display_message('Loop: '||v_index||' BB:' || g_tab_bond(v_index).bond_sec_id||' '||
                             g_tab_bond(v_index).conv_factor);
                maintain_cons_rel_stat(
                    g_tab_bond(v_index).fut_sec_id,
                    g_tab_bond(v_index).bond_sec_id,
                    g_tab_bond(v_index).conv_factor
                );

            END LOOP;


            display_message('Before diff:'||p_inRequest_id);
            -- diff the struct and delete the relation
            diff_future_struct(
                p_inProduct_id,
                p_inRequest_id,
                p_inSec_id
                );
        ELSE

            display_message('No future data found: '||p_inRequest_id);

        END IF;


    EXCEPTION
        WHEN OTHERS THEN

            display_message('maintain_factor()[sec_id]:'||p_inSec_id||' '||SQLERRM);
             RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);    --TD3787 10/21/2008 DuttaD
    END maintain_factor;

    /************************** update_vendor_nm_table ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  10/28/2003
     ***  Type:          Private
     ***  Purpose:       This proc updates WMCVNDR vendor_sec_nm table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE update_vendor_nm_table
    IS
        c_proc_func_name    VARCHAR2(32)    := 'update_vendor_nm_table';  --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        IF (g_sec_fsc_data_rec.bb_vendor_sec_ticker_flg = 'U')
        THEN

            display_message('update_vendor_nm_table : sec_id = '||g_sec_data_rec.sec_id);

            UPDATE vendor_sec_name
            SET
                vendor_sec_ticker  =  g_sec_data_rec.bb_vendor_sec_ticker
            WHERE
                sec_id  =   g_sec_data_rec.sec_id;

            display_message('Vendor_sec_nm table updated for Sec_id:'||g_sec_data_rec.sec_id);
        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('update_vendor_nm_table: Unhandled exception');
            RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);       --TD3787 10/21/2008 DuttaD

    END update_vendor_nm_table;

    /************************** maintain_sec_descriptor_table ***************************
     ***
     ***  Author:        Deep Jain
     ***  Date Created:  02/18/2005
     ***  Type:          Private
     ***  Purpose:       This proc updates IDR sec_descriptor table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***                      TD 1571
     ***
     *****************************************************************************/
    PROCEDURE maintain_sec_descriptor_table(
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inDescriptor              IN      sec_descriptor.descriptor%TYPE,
        p_inDescriptor_typ          IN      sec_descriptor.descriptor_typ%TYPE)
    IS
        c_proc_func_name    VARCHAR2(32)    := 'maintain_sec_descriptor_table';  --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                           --TD3787 10/21/2008 DuttaD

    BEGIN


        UPDATE
               sec_descriptor
        SET
               descriptor      =  p_inDescriptor,
               long_descriptor =  p_inDescriptor
        WHERE   sec_id          =  p_inSec_id       AND
                srce_cd         =  'WMC'            AND
                descriptor_typ  =  p_inDescriptor_typ;

        IF SQL%NOTFOUND THEN

              INSERT INTO sec_descriptor
                       ( sec_id,
                         srce_cd,
                         descriptor_typ,
                         descriptor_attr_id,
                         descriptor,
                         long_descriptor,
                         ins_ts,
                         upd_ts
                       )
                VALUES
                       ( p_inSec_id,
                         'WMC',
                         p_inDescriptor_typ,
                         309,
                         p_inDescriptor,
                         p_inDescriptor,
                         SYSDATE,
                         SYSDATE
                       );


        END IF;

    EXCEPTION                                                               -- EXCEPTION ADDED in TD3787 10/21/2008 DuttaD
        WHEN OTHERS THEN

            RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);     --TD3787 10/21/2008 DuttaD

    END maintain_sec_descriptor_table;



    /************************************************************************
    *
    *   maintain_sec_descriptor_table -- TD 5543
    *
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
         )
         IS

             v_cnt           PLS_INTEGER;
             v_sec_id        security_tbl.sec_id%TYPE;
    BEGIN

        BEGIN

            SELECT sec_id
              INTO v_sec_id
              FROM sec_descriptor sd
             WHERE sd.sec_id          = p_inSecId
               AND sd.srce_cd         = p_inSrceCd
               AND sd.descriptor_typ  = p_inDescriptorTyp
               AND sd.descriptor      = p_inDescriptor
               AND sd.long_descriptor = p_inLongDescriptor;

            -- Since the trade descriptor already exist in sec_descriptor return.
            RETURN;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
        END;

        IF p_inLongDescriptor IS NULL THEN
        -- delete the sec_descriptor row for the master
        -- when the trading description tag in calypso's FpML is empty/null
            DELETE sec_descriptor sd
             WHERE sd.sec_id              = p_inSecId
               AND sd.srce_cd             = p_inSrceCd
               AND sd.descriptor_typ      = p_inDescriptorTyp
               AND sd.descriptor_attr_id  = p_inDescriptorAttrId;

            RETURN;

        END IF;

        UPDATE sec_descriptor sd
           SET sd.long_descriptor     = p_inLongDescriptor,
               sd.descriptor          = p_inDescriptor
         WHERE sd.sec_id              = p_inSecId
           AND sd.srce_cd             = p_inSrceCd
           AND sd.descriptor_typ      = p_inDescriptorTyp
           AND sd.descriptor_attr_id  = p_inDescriptorAttrId;

        v_cnt := SQL%ROWCOUNT;

        IF (v_cnt = 0) THEN
            INSERT INTO sec_descriptor(
                                        sec_id,
                                        srce_cd,
                                        descriptor_typ,
                                        descriptor_attr_id,
                                        descriptor,
                                        long_descriptor,
                                        ins_ts,
                                        upd_ts
                                      )
                VALUES
                                      ( p_inSecId,
                                        p_inSrceCd,
                                        p_inDescriptorTyp,
                                        p_inDescriptorAttrId,
                                        p_inDescriptor,
                                        p_inLongDescriptor,
                                        SYSDATE,
                                        SYSDATE
                                      );
        END IF;
    EXCEPTION
        WHEN OTHERS THEN

            RAISE_APPLICATION_ERROR(-20090,': Insert to sec_descriptor table failed. - ' ||'-'||SQLERRM);
    END maintain_sec_descriptor_table;

    /************************** update_extern_table ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  06/25/2002
     ***  Type:          Private
     ***  Purpose:       This proc updates IDR extern id table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE update_extern_table
    IS

        v_eff_dt            DATE := TRUNC(SYSDATE);
        v_exp_dt            DATE := TO_DATE('31DEC9999','DDMONYYYY');
        v_ric               vendor_ric_xref_tbl.ric%TYPE  :=  NULL;
        v_request_src       vendor_request.request_src%type;
        c_proc_func_name    VARCHAR2(32)    := 'update_extern_table';     --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD


    BEGIN


        select nvl(request_src,'UNK')
        into v_request_src
        from vendor_request
        where sec_id = g_sec_data_rec.sec_id
        and rownum < 2;

        display_message('update_extern_table : sec_id='||g_sec_data_rec.sec_id);

        IF  (g_sec_fsc_data_rec.bb_ticker_flg = 'U') THEN

             c_proc_loc := 'bb_ticker';                              --TD3787 10/21/2008 DuttaD
            display_message('Updating BB Ticker ');

            -- TD 1571 Deep 02-18-2005 moved DML as separate function --------------

            maintain_sec_descriptor_table(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_ticker,
                c_bb_ticker
            );

            ------------------------------------------------------------------------

        END IF;

        -- TD 1571 Deep 02-18-2005 moved DML as separate function --------------
        /***********************
        IF  (g_sec_fsc_data_rec.ticker_flg = 'U') THEN

            display_message('Updating Ticker ');

            maintain_sec_descriptor_table(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.ticker,
                c_ticker
            );

        END IF;

        IF  (g_sec_fsc_data_rec.yellow_key_flg = 'U') THEN

            display_message('Updating Yellow_Key ');

            maintain_sec_descriptor_table(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.yellow_key,
                c_yellow_key
            );

        END IF;
        *****************************/
        --------------------------------------------------------------------------


        IF  (g_sec_fsc_data_rec.bb_unique_flg = 'U') THEN

            c_proc_loc := 'bb_unique';                              --TD3787 10/21/2008 DuttaD
            display_message('Updating BB Unique ');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_unique,
                c_bb_unique,
                v_eff_dt,
                v_exp_dt,
                c_false
            );

        END IF;


        IF (v_request_src != c_bmk_request_src) then

            IF (g_sec_fsc_data_rec.bb_cusip_flg = 'U') THEN

                c_proc_loc := 'bb_cusip';                              --TD3787 10/21/2008 DuttaD
                display_message('Updating Cusip in extern table');
                CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_cusip,
                c_bb_cusip,
                v_eff_dt,
                v_exp_dt,
                c_true
                );
            END IF;
        ELSE
            IF (g_sec_fsc_data_rec.bmk_yb_cusip_flg = 'U') THEN
                c_proc_loc := 'bmk_yb_cusip';                              --TD3787 10/21/2008 DuttaD
                display_message('Updating BMK YB Cusip in extern table');
                CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bmk_yb_cusip,
                c_bmk_yb_cusip,
                v_eff_dt,
                v_exp_dt,
                c_true
               );
            END IF;

            IF (g_sec_fsc_data_rec.bmk_cg_cusip_flg = 'U') THEN -- HillD 09-29-2005 BMK rewrite phase 2
                c_proc_loc := 'bmk_cg_cusip';                              --TD3787 10/21/2008 DuttaD
                display_message('Updating BMK CG Cusip in extern table');
                CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bmk_cg_cusip,
                c_bmk_cg_cusip,
                v_eff_dt,
                v_exp_dt,
                c_true
               );
            END IF;


            IF (g_sec_fsc_data_rec.bmk_Lb_cusip_flg = 'U') THEN
                c_proc_loc := 'bmk_lb_cusip';                              --TD3787 10/21/2008 DuttaD
                display_message('Updating BMK LB Cusip in extern table');
                CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bmk_lb_cusip,
                c_bmk_lb_cusip,
                v_eff_dt,
                v_exp_dt,
                c_true
              );

            END IF;

            IF (g_sec_fsc_data_rec.bmk_ml_cusip_flg = 'U') THEN
                c_proc_loc := 'bmk_ml_cusip';                              --TD3787 10/21/2008 DuttaD
                display_message('Updating BMK ML Cusip in extern table');
                CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bmk_ml_cusip,
                c_bmk_ml_cusip,
                v_eff_dt,
                v_exp_dt,
                c_true
              );

            END IF;
        END IF;



        IF (g_sec_fsc_data_rec.bb_sedol_flg = 'U') THEN
             c_proc_loc := 'bb_sedol';                              --TD3787 10/21/2008 DuttaD
            display_message('Updating Sedol in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_sedol,
                c_bb_sedol,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        IF (g_sec_fsc_data_rec.bb_isin_flg = 'U') THEN
            c_proc_loc := 'bb_isin';                              --TD3787 10/21/2008 DuttaD
            display_message('Updating Isin in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_isin,
                c_bb_isin,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        IF (g_sec_fsc_data_rec.ric_flg = 'U') THEN
            c_proc_loc := 'ric';                              --TD3787 10/21/2008 DuttaD
            display_message('Updating RIC in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.ric,
                c_ric,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        --IgnatIV    TD2314    11/29/2005
        IF (g_sec_fsc_data_rec.bb_tranche_id_flg = 'U') THEN
             c_proc_loc := 'bb_tranche_id';                              --TD3787 10/21/2008 DuttaD
            display_message('Updating Tranche ID in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_tranche_id,
                c_tranche_id,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        --TD4330 OSI - Bloomberg Changes
        IF (g_sec_fsc_data_rec.bb_global_flg = 'U') THEN
            c_proc_loc := 'bb_global';
            display_message('Updating BB_GLOBAL in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_global,
                c_bb_global,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        IF (g_sec_fsc_data_rec.occ_id_flg = 'U') THEN
            c_proc_loc := 'occ_id';
            display_message('Updating OCC_ID in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.occ_id,
                c_occ_id,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        IF (g_sec_fsc_data_rec.opra_id_flg = 'U') THEN
            c_proc_loc := 'opra_id';
            display_message('Updating OPRA_ID in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.opra_id,
                c_opra_id,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        IF (g_sec_fsc_data_rec.loanx_id_flg = 'U') THEN
            c_proc_loc := 'loanx_id';
            display_message('Updating LOANX_ID in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.loanx_id,
                c_loanx_id,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

        IF (g_sec_fsc_data_rec.wso_id_flg = 'U') THEN
            c_proc_loc := 'wso_id';
            display_message('Updating WSO_ID in extern table');
            CSM_EXTERN_ID.maintain_extern_id(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.wso_id,
                c_wso_id,
                v_eff_dt,
                v_exp_dt,
                c_true
            );

        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('update_extern_table: Unhandled exception');
            RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);     --TD3787 10/21/2008 DuttaD

    END update_extern_table;

    /************************** update_sec_price ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  06/21/2002
     ***  Type:          Private
     ***  Purpose:       This proc updates IDR sec price
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE update_sec_price (
        p_inProduct_id              IN      vendor_request.vendor_product_id%TYPE,
        p_inRequest_id              IN      vendor_request.request_id%TYPE,
        p_inSec_typ_id              IN      vendor_request.sec_typ_id%TYPE
    )
    IS

        v_px_dt          sec_price.price_dt%TYPE;
        v_action_cd      CHAR(1);
        v_scrub_dt       DATE;
        v_trade_curcy_cd security_tbl.trade_curcy_cd%TYPE;
        c_proc_func_name VARCHAR2(32)    := 'update_sec_price';  --TD3787 10/21/2008 DuttaD
        c_proc_loc       VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        c_proc_loc := 'bb_px_close';                              --TD3787 10/21/2008 DuttaD
        IF  (g_sec_fsc_data_rec.bb_px_close_flg = 'U') THEN

            v_px_dt :=  TRUNC(NVL(g_sec_data_rec.bb_px_dt,SYSDATE-1));

            display_message(
                'update_sec_price(CLOSE):sec_id = '||
                g_sec_data_rec.sec_id
            );  --  Gap 07/01/2003 (SH)

            display_message(
                'Price is:'||g_sec_data_rec.bb_px_close||
                ' price date is:'||v_px_dt || 'Curncy is: '||g_sec_data_rec.bb_px_curcy
            );

            CSM_MAINTAIN_ENTITY.maintain_sec_price (
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_px_curcy,
                g_sec_data_rec.bb_px_close,
                TRUNC(v_px_dt),
                'WMCVNDR',
                g_sec_data_rec.bb_px_source,
                c_false,
                c_false
            );

        END IF;

        --  Gap 07/01/2003 (SH)
        c_proc_loc := 'bb_px_close_mtd';                              --TD3787 10/21/2008 DuttaD
        IF (g_sec_fsc_data_rec.bb_px_close_mtd_flg = 'U') THEN

            display_message(
                'update_sec_price(MTD):sec_id = '||
                g_sec_data_rec.sec_id
            );

            display_message(
                'Price is:'||g_sec_data_rec.bb_px_close_mtd||
                ' price date is:'|| TRUNC(g_sec_data_rec.bb_px_close_mtd_dt)
            );

            CSM_MAINTAIN_ENTITY.maintain_sec_price (
                g_sec_data_rec.sec_id,
                g_sec_data_rec.bb_px_curcy,
                g_sec_data_rec.bb_px_close_mtd,
                TRUNC(g_sec_data_rec.bb_px_close_mtd_dt),
                'WMCVNDR',
                g_sec_data_rec.bb_px_close_mtd_source,
                c_false,
                c_false
            );

        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('update_sec_price: Unhandled exception');
            RAISE_APPLICATION_ERROR(
                -20090,
                 ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM
            );                                                                                --TD3787 10/21/2008 DuttaD

    END update_sec_price;

    /************************** update_rating_table ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  06/21/2002
     ***  Type:          Private
     ***  Purpose:       This proc updates IDR ratings table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE update_rating_table (p_inAction_Cd IN vendor_request.action_cd%TYPE)
    IS
         c_proc_func_name    VARCHAR2(32)    := 'update_rating_table';     --TD3787 10/21/2008 DuttaD
         c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

        PROCEDURE   update_rating_with_checks (
            p_inUpd_flg             IN      VARCHAR2,
            p_inRating_typ          IN      sec_rating_tbl.rating_srce_cd%TYPE,
            p_inRating              IN      sec_rating_tbl.rating%TYPE,
            p_inRate_typ            IN      csm.csm_sec_rating_tbl.rating_typ%TYPE,
            p_inRating_dt           IN      sec_rating_tbl.eff_dt%TYPE,
            p_inVndr_srce_cd        IN      sec_rating_tbl.vndr_srce_cd%TYPE,
            p_inAction_Code         IN      vendor_request.action_cd%TYPE
        )
        IS
          v_isNewSetup BOOLEAN;
        BEGIN

            IF NVL(p_inAction_Code, '#') = 'N' THEN
              v_isNewSetup := TRUE;
            ELSE
              v_isNewSetup := FALSE;
            END IF;

            IF  (p_inUpd_flg = 'U') THEN

                display_message(
                    'update_rating_table('||p_inRating_typ||
                    '): sec_id = '||g_sec_data_rec.sec_id
                );

                display_message(
                    'Rating is:'||p_inRating||
                    ' rating date is: '||p_inRating_dt||
                    ' asset_class is: '||g_sec_data_rec.asset_class
                );

                CSM_MAINTAIN_RATING.maintain_sec_rating(
                    g_sec_data_rec.sec_id,
                    p_inRating_typ,
                    g_sec_data_rec.asset_class,
                    p_inRating,
                    p_inRate_typ,
                    p_inRating_dt,
                    p_inVndr_srce_cd,
                    c_false,
                    c_false,
                    v_isNewSetup
                );

            END IF;

        END update_rating_with_checks;

    BEGIN


          c_proc_loc := 'moody';                              --TD3787 10/21/2008 DuttaD
          update_rating_with_checks (
            g_sec_fsc_data_rec.rtg_moody_flg,
            c_rating_moody,
            g_sec_data_rec.rtg_moody,
            CSM_COMMON.CONST_RATING_TYPE_CREDIT,
            g_sec_data_rec.moody_eff_dt,
            g_sec_data_rec.moody_vndr_srce_cd,
            p_inAction_Cd
          );

          --  Gap 07/01/2003 (SH)
          c_proc_loc := 'fitch';                              --TD3787 10/21/2008 DuttaD
          update_rating_with_checks (
            g_sec_fsc_data_rec.rtg_fitch_flg,
            c_rating_fitch,
            g_sec_data_rec.rtg_fitch,
            CSM_COMMON.CONST_RATING_TYPE_CREDIT,
            g_sec_data_rec.fitch_eff_dt,
            g_sec_data_rec.fitch_vndr_srce_cd,
            p_inAction_Cd
          );
          c_proc_loc := 'sp';                              --TD3787 10/21/2008 DuttaD
          update_rating_with_checks (
            g_sec_fsc_data_rec.rtg_sp_flg,
            c_rating_sp,
            g_sec_data_rec.rtg_sp,
            CSM_COMMON.CONST_RATING_TYPE_CREDIT,
            g_sec_data_rec.sp_eff_dt,
            g_sec_data_rec.sp_vndr_srce_cd,
            p_inAction_Cd
          );

          c_proc_loc := 'dbrs';     --TD4861: DBRS ratings at the security level:WadekS
          update_rating_with_checks (
            g_sec_fsc_data_rec.rtg_dbrs_flg,
            c_rating_dbrs,
            g_sec_data_rec.rtg_dbrs,
            CSM_COMMON.CONST_RATING_TYPE_CREDIT,
            g_sec_data_rec.dbrs_eff_dt,
            g_sec_data_rec.dbrs_vndr_srce_cd,
            p_inAction_Cd
          );


              c_proc_loc := 'moody';
              update_rating_with_checks (
              g_sec_fsc_data_rec.rtg_moody_undl_flg,
              c_rating_moody,
              g_sec_data_rec.rtg_moody_undl,
              CSM_COMMON.CONST_RATING_TYPE_UNDER,
              g_sec_data_rec.moody_eff_dt_undl,
              g_sec_data_rec.moody_vndr_srce_cd_undl,
              p_inAction_Cd
            );

            c_proc_loc := 'fitch';
            update_rating_with_checks (
              g_sec_fsc_data_rec.rtg_fitch_undl_flg,
              c_rating_fitch,
              g_sec_data_rec.rtg_fitch_undl,
              CSM_COMMON.CONST_RATING_TYPE_UNDER,
              g_sec_data_rec.fitch_eff_dt_undl,
              g_sec_data_rec.fitch_vndr_srce_cd_undl,
              p_inAction_Cd
            );



            c_proc_loc := 'sp';
            update_rating_with_checks (
              g_sec_fsc_data_rec.rtg_sp_undl_flg,
              c_rating_sp,
              g_sec_data_rec.rtg_sp_undl,
              CSM_COMMON.CONST_RATING_TYPE_UNDER,
              g_sec_data_rec.sp_eff_dt_undl,
              g_sec_data_rec.sp_vndr_srce_cd_undl,
              p_inAction_Cd
            );


    EXCEPTION
        WHEN OTHERS THEN

            display_message('update_rating_table: Unhandled exception');
             RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);   --TD3787 10/21/2008 DuttaD

    END update_rating_table;

    /************************** update_sec_assessment_table ***************************
     ***
     ***  Author:        Subhash Wadekar : wadeks
     ***  Date Created:  06/17/2010
     ***  Type:          Private
     ***  Purpose:       This proc updates IDR sec_assessment table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/

    PROCEDURE update_sec_assessment_table IS
      c_proc_func_name VARCHAR2(32) := 'update_sec_assessment_table';
      c_proc_loc       VARCHAR2(50) := NULL;
      v_upd_flg        VARCHAR2(1);

      PROCEDURE update_sec_assessment_checks(
        p_inUpd_flg        IN VARCHAR2,
        p_inEff_dt         IN sec_assessment.eff_dt%TYPE,
        p_inAssmnt_srce_cd IN sec_assessment.assmnt_srce_cd%TYPE,
        p_inAssmnt_typ     IN sec_assessment.assmnt_typ%TYPE,
        p_inWmc_assmnt_cd  IN sec_assessment.wmc_assmnt_cd%TYPE,
        p_inVndr_srce_cd   IN sec_assessment.vndr_srce_cd%TYPE) IS
      BEGIN

        IF (p_inUpd_flg = 'U') THEN

          display_message('update_sec_assessment_table(' || p_inWmc_assmnt_cd ||
                          '): sec_id = ' || g_sec_data_rec.sec_id);

          display_message('Wmc_assmnt_cd is:' || p_inWmc_assmnt_cd || ' effective date is: ' ||
                          p_inEff_dt || ' Vndr_srce_cd: ' ||
                          p_inVndr_srce_cd);

        CSM_MAINTAIN_RATING.maintain_sec_assessment(
         g_sec_data_rec.sec_id,
         p_inEff_dt,
         p_inAssmnt_srce_cd,
         p_inAssmnt_typ,
         p_inWmc_assmnt_cd,
         p_inVndr_srce_cd,
         c_false,
         c_false);


        END IF;

      END update_sec_assessment_checks;

    BEGIN
      ----SP OUTLOOK
      IF (g_sec_fsc_data_rec.sp_outlook_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.sp_outlook_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_sp_outlook_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.sp_outlook_eff_dt,
       c_rating_sp,
       c_outlook,
       g_sec_data_rec.rtg_sp_outlook,
       g_sec_data_rec.sp_outlook_vndr_srce_cd);

      ------SP WATCHLIST
      IF (g_sec_fsc_data_rec.sp_watch_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.sp_watch_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_sp_watch_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.sp_watch_eff_dt,
       c_rating_sp,
       c_watchlist,
       g_sec_data_rec.rtg_sp_watch,
       g_sec_data_rec.sp_watch_vndr_srce_cd);

      ------MOODY OUTLOOK
      IF (g_sec_fsc_data_rec.moody_outlook_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.moody_outlook_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_moody_outlook_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.moody_outlook_eff_dt,
       c_rating_moody,
       c_outlook,
       g_sec_data_rec.rtg_moody_outlook,
       g_sec_data_rec.moody_outlook_vndr_srce_cd);

      ------MOODY WATCHLIST
      IF (g_sec_fsc_data_rec.moody_watch_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.moody_watch_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_moody_watch_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.moody_watch_eff_dt,
       c_rating_moody,
       c_watchlist,
       g_sec_data_rec.rtg_moody_watch,
       g_sec_data_rec.moody_watch_vndr_srce_cd);

      ------FITCH OUTLOOK

      IF (g_sec_fsc_data_rec.fitch_outlook_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.fitch_outlook_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_fitch_outlook_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.fitch_outlook_eff_dt,
       c_rating_fitch,
       c_outlook,
       g_sec_data_rec.rtg_fitch_outlook,
       g_sec_data_rec.fitch_outlook_vndr_srce_cd);

      ------FITCH WATCHLIST

      IF (g_sec_fsc_data_rec.fitch_watch_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.fitch_watch_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_fitch_watch_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.fitch_watch_eff_dt,
       c_rating_fitch,
       c_watchlist,
       g_sec_data_rec.rtg_fitch_watch,
       g_sec_data_rec.fitch_watch_vndr_srce_cd);

      --TD4861: DBRS ratings at the security level: WadekS
      ------DBRS OUTLOOK

      IF (g_sec_fsc_data_rec.dbrs_outlook_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.dbrs_outlook_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_dbrs_outlook_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.dbrs_outlook_eff_dt,
       c_rating_dbrs,
       c_outlook,
       g_sec_data_rec.rtg_dbrs_outlook,
       g_sec_data_rec.dbrs_outlook_vndr_srce_cd);

      ------DBRS WATCHLIST

      IF (g_sec_fsc_data_rec.dbrs_watch_eff_dt_flg = 'U'       OR
          g_sec_fsc_data_rec.dbrs_watch_vndr_srce_cd_flg = 'U' OR
          g_sec_fsc_data_rec.rtg_dbrs_watch_flg = 'U')
      THEN
        v_upd_flg := 'U';
      ELSE
        v_upd_flg := 'N';
      END IF;

      update_sec_assessment_checks(
       v_upd_flg,
       g_sec_data_rec.dbrs_watch_eff_dt,
       c_rating_dbrs,
       c_watchlist,
       g_sec_data_rec.rtg_dbrs_watch,
       g_sec_data_rec.dbrs_watch_vndr_srce_cd);

    EXCEPTION
      WHEN OTHERS THEN
        display_message('update_sec_assessment_table: Unhandled exception');
        RAISE_APPLICATION_ERROR(-20090,
                                ':' || c_pkg_name || '-' || c_proc_func_name || '-' ||
                                c_proc_loc || '-' || SQLERRM);

    END update_sec_assessment_table;

    /************************** update_sec_fi_data ***************************
     ***
     ***  Author:        KhetrM
     ***  Date Created:  01/12/2012
     ***  Type:          Private
     ***  Purpose:       This proc updates sec_fi_data_tbl
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/

    PROCEDURE update_sec_fi_data IS
      c_proc_func_name VARCHAR2(32) := 'update_sec_fi_data';

    BEGIN
        IF (g_sec_fsc_data_rec.unadjusted_pay_day_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET unadjusted_pay_day = g_sec_data_rec.unadjusted_pay_day
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;

        IF (g_sec_fsc_data_rec.coupon_convention_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET coupon_convention = g_sec_data_rec.coupon_convention
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;

        IF (g_sec_fsc_data_rec.payment_rank_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET payment_rank = g_sec_data_rec.payment_rank
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;
        IF (g_sec_fsc_data_rec.surplus_note_flg_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET surplus_note_flg = g_sec_data_rec.surplus_note_flg
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;
        IF (g_sec_fsc_data_rec.tier_capital_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET tier_capital = g_sec_data_rec.tier_capital
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;
        IF (g_sec_fsc_data_rec.mtg_pool_typ_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET mtg_pool_typ = g_sec_data_rec.mtg_pool_typ
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;
        IF (g_sec_fsc_data_rec.collat_cntry_cd_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET collat_cntry_cd = g_sec_data_rec.collat_cntry_cd
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;
        IF (g_sec_fsc_data_rec.muni_issue_typ_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET muni_issue_typ = g_sec_data_rec.muni_issue_typ
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;   --TD6042 VartaV 11.15.2012
        IF (g_sec_fsc_data_rec.cpn_recalc_method_flg = 'U') THEN
            UPDATE sec_fi_data_tbl
               SET cpn_recalc_method = g_sec_data_rec.cpn_recalc_method
             WHERE sec_id = g_sec_data_rec.sec_id;
        END IF;  --TD6066 VartaV 11.15.2012

    EXCEPTION
      WHEN OTHERS THEN
        display_message('update_sec_fi_data: Unhandled exception');
        RAISE_APPLICATION_ERROR(-20090,
                                ':' || c_pkg_name || '-' || c_proc_func_name || '-' ||
                                SQLERRM);

    END update_sec_fi_data;

    /************************** update_schedule_tables ***************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  06/21/2002
     ***  Type:          Private
     ***  Purpose:       This proc updates appropriate IDR schedule table
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE update_schedule_tables (
        p_inProduct_id              IN      vendor_request.vendor_product_id%TYPE,
        p_inRequest_id              IN      vendor_request.request_id%TYPE,
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inSchd_name               IN      vendor_req_messages.column_nm%TYPE,
        p_inSchd_data               IN      vendor_req_messages.column_value%TYPE
    )
    IS

        v_cur_val           VARCHAR2(32767);
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(200);
        v_cur_row           PLS_INTEGER :=  0;
        v_dt_val            DATE;
        v_price_val         NUMBER      :=  0;
        v_amt_val           NUMBER      :=  0;
        v_cash_rate         sec_coupon_schd_tbl.cash_rate%TYPE;
        v_pik_rate          sec_coupon_schd_tbl.pik_rate%TYPE;
        v_sink_voluntary    NUMBER      :=  NULL;
        v_calc_typ          vendor_req_messages.column_trans_value%TYPE :=  NULL;
        c_proc_func_name    VARCHAR2(32)    := 'update_schedule_tables';  --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;      --TD3787 10/21/2008 DuttaD
        v_hist_loss         PLS_INTEGER  := 0;
        v_prin_dist         PLS_INTEGER  := 0;

        bb_bulk_data_exception  EXCEPTION;
        bb_bulk_fld_not_defined EXCEPTION;

        v_maint_ts          DATE        :=  SYSDATE;

    BEGIN

        display_message('update_schedule_tables : sec_id = '||p_inSec_id||' '||p_inSchd_name);

        -- 08-08-2005 NallaN  CLOB changes

        IF  DBMS_LOB.GETLENGTH(p_inSchd_data) = 0 THEN

            v_cur_val := null;

        ELSE

            v_cur_val := p_inSchd_data;

        END IF;
        --
        --  Delete data for this particular sec id
        --  Make sure only updates are issued
        --
        IF  (p_inSchd_name  IN  (
                                    c_call_schd_name,
                                    c_put_schd_name
                                )
            )
        THEN

            DELETE FROM
                sec_redemp_schd_tbl
            WHERE
                sec_id      =   p_inSec_id    AND
                redemp_typ  =   SUBSTR(p_inSchd_name,1,1);

        ELSIF   (p_inSchd_name  =   c_sink_schd_name) THEN

            DELETE FROM
                sec_sink_fd_schd_tbl
            WHERE
                sec_id      =   p_inSec_id;

        ELSIF   (p_inSchd_name  =   c_multi_cpn_schd_name) THEN

            DELETE FROM
                sec_coupon_schd_tbl
            WHERE
                sec_id      =   p_inSec_id;

        ELSIF   (p_inSchd_name  =   c_loan_repay_schd_name) THEN

            DELETE FROM
                sec_ln_repay_schd_tbl
            WHERE
                sec_id      =   p_inSec_id;

        ELSIF   (p_inSchd_name  =   c_factor_schd_name) THEN
         --Added 'BANKLOAN' in below condition for TD4203:WADEKS on 27-JUL-2010.
            IF   blmbrg_common_pkg.get_sec_typ_group(p_inSec_id) IN  (
                                                                    'CORP',
                                                                    'BANKLOAN',
                                                                    'PFSTK',
                                                                    'GOVT',
                                                                    'AB',
                                                                    'CMO'
                                                                 )
            THEN

                 DELETE FROM
                        sec_factor_schd_tbl
                 WHERE
                        sec_id      =   p_inSec_id           AND
                        fctr_typ    =   c_factor_typ;
            END IF;

        ELSIF   (p_inSchd_name  IN (
                                       c_rec_side_rates_hst_nm,
                                       c_pay_side_rates_hst_nm,
                                       c_sw_pay_cash_flow_nm,
                                       c_sw_rec_cash_flow_nm
                                   )
                )
        THEN

           --
           --  Do Not Delete the schedule for SWAPs
           --
           NULL;

        ELSIF   (p_inSchd_name  IN (
                                       c_hist_losses
                                   )
                )
        THEN


           UPDATE sec_paydn_loss_schd
           SET
              paydown_loss    =  NULL,
              upd_ts          =  SYSDATE,
              upd_login       =  USER
           WHERE
              sec_id           =   p_inSec_id;



           DELETE FROM
              sec_paydn_loss_schd p
           WHERE
              sec_id           =   p_inSec_id   AND
              principal_dist   IS NULL          AND
              paydown_loss     IS NULL;



        ELSIF   (p_inSchd_name  IN (
                                       c_hist_principal_distributed
                                   )
                )
        THEN



           UPDATE sec_paydn_loss_schd
           SET
               principal_dist  =  NULL,
               upd_ts          =  SYSDATE,
               upd_login       =  USER
           WHERE
              sec_id           =   p_inSec_id;


           DELETE FROM
                sec_paydn_loss_schd p
           WHERE
                sec_id           =   p_inSec_id   AND
                principal_dist   IS NULL          AND
                paydown_loss     IS NULL;



        ELSE
            c_proc_loc := 'bb_bulk_fld_not_defined';                              --TD3787 10/21/2008 DuttaD
            RAISE bb_bulk_fld_not_defined;

        END IF;

        IF (p_inSchd_data IS NULL) THEN

            RETURN;

        END IF;

        v_bulk_sep  :=  SUBSTR(v_cur_val,1,1);
        v_cur_val   :=  SUBSTR(v_cur_val,2);

        -- Added TO_NUMBER conversion for CLOB NallaN
        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        display_message('Curr data value is: '||v_cur_val);
        display_message(
            'No. of rows: '||v_no_rows||
            ', No. of cols:' ||v_no_cols||
            ', No. of dim:'||v_no_dim
        );

        LOOP

            v_row_data  :=  SUBSTR(
                                v_cur_val,
                                1,INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)
                            );

            v_cur_val   :=  SUBSTR(
                                v_cur_val,
                                INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                            );

            v_dt_val    :=  TO_DATE(
                                SUBSTR(
                                    v_row_data,
                                    INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                    INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,1)
                                ),
                                'YYYYMMDD'
                            );

            -- Added TO_NUMBER conversion for CLOB NallaN

            v_price_val :=  TO_NUMBER(
                                TRIM(
                                    SUBSTR(
                                        v_row_data,
                                        INSTR(v_row_data,v_bulk_sep,1,3)+1,
                                        INSTR(v_row_data,v_bulk_sep,1,4)-1-
                                            INSTR(v_row_data,v_bulk_sep,1,3)
                                    )
                                )
                            );

            IF (v_no_cols > 2) THEN

                v_amt_val   :=  TO_NUMBER(
                                    TRIM(
                                        SUBSTR(
                                            v_row_data,
                                            INSTR(v_row_data,v_bulk_sep,1,5)+1,
                                            INSTR(v_row_data,v_bulk_sep,1,6)-1-
                                                INSTR(v_row_data,v_bulk_sep,1,5)
                                        )
                                    )
                                );

            ELSE

                v_amt_val   :=  NULL;

            END IF;

            display_message('Row data is: '||v_row_data);
            display_message(
                'date value is:'||v_dt_val||
                'Price is: '||v_price_val||
                'Amt is: '||v_amt_val
            );

            IF (v_dt_val IS NULL OR v_price_val IS NULL) THEN
                c_proc_loc := 'bb_bulk_data_exception';                              --TD3787 10/21/2008 DuttaD
                RAISE bb_bulk_data_exception;

            END IF;

            IF (p_inSchd_name IN (c_call_schd_name,c_put_schd_name)) THEN

                INSERT INTO sec_redemp_schd_tbl (
                    sec_id,
                    redemp_dt,
                    redemp_typ,
                    redemp_price,
                    redemp_pct,
                    upd_ts,
                    ins_ts,
                    ins_login,
                    upd_login
                ) VALUES (
                    p_inSec_id,
                    v_dt_val,
                    SUBSTR(p_inSchd_name,1,1),
                    v_price_val,
                    NULL,
                    v_maint_ts,
                    v_maint_ts,
                    c_login_name,
                    c_login_name
                );

                display_message('Inserted data for '||p_inSchd_name);

            ELSIF (p_inSchd_name = c_sink_schd_name) THEN


                -- NallaN  CLOB Changes
                v_sink_voluntary    := TO_NUMBER(get_bb_vrq_data(
                                            p_inProduct_id,
                                            p_inRequest_id,
                                            'SINK_VOLUNTARY'
                                        ));

                INSERT INTO sec_sink_fd_schd_tbl (
                    sec_id,
                    sink_dt,
                    sink_price,
                    sink_sch_amt,
                    sink_amt_unit,
                    sink_opt_pct,
                    upd_ts,
                    ins_ts,
                    ins_login,
                    upd_login
                ) VALUES (
                    p_inSec_id,
                    v_dt_val,
                    v_price_val,
                    v_amt_val,
                    'F',
                    NVL(v_sink_voluntary,'0') * 100,
                    v_maint_ts,
                    v_maint_ts,
                    c_login_name,
                    c_login_name
                );

                display_message('Inserted data for '||p_inSchd_name);

            ELSIF (p_inSchd_name = c_factor_schd_name) THEN
                IF   blmbrg_common_pkg.get_sec_typ_group(p_inSec_id) IN  (
                                                                           'MB'
                                                                         )
                THEN
                     DELETE
                     FROM     sec_factor_schd_tbl
                     WHERE    sec_id                      =  p_inSec_id                   AND
                              TO_CHAR(eff_dt,'YYYYMM')    =  TO_CHAR(v_dt_val,'YYYYMM')   AND
                              fctr_typ                    =  c_factor_typ;
                END IF;

                UPDATE   sec_factor_schd_tbl
                SET      fctr      =  v_price_val,
                         srce_cd   =  c_factor_source,
                         upd_ts    =  v_maint_ts,
                         upd_login =  c_login_name
                WHERE    sec_id    =  p_inSec_id     AND
                         eff_dt    =  v_dt_val       AND
                         fctr_typ  =  c_factor_typ;

                IF   SQL%NOTFOUND
                THEN
                     INSERT INTO sec_factor_schd_tbl (
                         sec_id,
                         eff_dt,
                         fctr,
                         fctr_typ,
                         srce_cd,
                         upd_ts,
                         ins_ts,
                         ins_login,
                         upd_login
                     ) VALUES (
                         p_inSec_id,
                         v_dt_val,
                         v_price_val,
                         c_factor_typ,
                         c_factor_source,
                         v_maint_ts,
                         v_maint_ts,
                         c_login_name,
                         c_login_name
                     );
                END IF;

                display_message('Inserted data for '||p_inSchd_name);

            ELSIF (p_inSchd_name = c_multi_cpn_schd_name) THEN

                v_calc_typ  :=  get_bb_vrq_data (
                                    p_inProduct_id,
                                    p_inRequest_id,
                                    'CALC_TYP'
                                );
                IF (v_calc_typ LIKE 'PIK%' ) THEN

                    v_cash_rate := 0;
                    v_pik_rate := v_price_val;

                ELSE

                    v_pik_rate := 0;
                    v_cash_rate := v_price_val;

                END IF;

                INSERT INTO sec_coupon_schd_tbl (
                    sec_id,
                    cpn_dt,
                    cpn_rt,
                    cash_rate,
                    pik_rate,
                    upd_ts,
                    ins_ts,
                    ins_login,
                    upd_login
                ) VALUES (
                    p_inSec_id,
                    v_dt_val,
                    v_price_val,
                    v_cash_rate,
                    v_pik_rate,
                    v_maint_ts,
                    v_maint_ts,
                    c_login_name,
                    c_login_name
                );

                display_message('Inserted data for '||p_inSchd_name);

            ELSIF   (p_inSchd_name  IN (
                                       c_rec_side_rates_hst_nm,
                                       c_pay_side_rates_hst_nm
                                   )
                    )
            THEN

                UPDATE
                    sec_coupon_schd_tbl
                SET
                    cpn_rt     =  v_price_val
                WHERE
                    sec_id     =  p_inSec_id     AND
                    cpn_dt     =  v_dt_val;

                IF   SQL%NOTFOUND
                THEN

                    INSERT INTO sec_coupon_schd_tbl (
                        sec_id,
                        cpn_dt,
                        cpn_rt,
                        upd_ts,
                        ins_ts,
                        ins_login,
                        upd_login
                    ) VALUES (
                        p_inSec_id,
                        v_dt_val,
                        v_price_val,
                        v_maint_ts,
                        v_maint_ts,
                        c_login_name,
                        c_login_name
                    );

                END IF;

                display_message('Maintained data for '||p_inSchd_name);

            ELSIF   (p_inSchd_name  IN (
                                       c_hist_losses
                                   )
                    )
            THEN

                UPDATE
                    SEC_PAYDN_LOSS_SCHD
                SET
                    paydown_loss     =  v_price_val,
                    upd_ts              =  SYSDATE,
                    upd_login           =  USER,
                    srce_cd             =  c_factor_source
                WHERE
                    sec_id                       =  p_inSec_id     AND
                    eff_dt                       =  v_dt_val       AND
                    NVL(paydown_loss,-12345) <>  NVL(v_price_val,-12345);


                INSERT INTO SEC_PAYDN_LOSS_SCHD (
                    sec_id,
                    eff_dt,
                    paydown_loss,
                    upd_ts,
                    ins_ts,
                    ins_login,
                    upd_login,
                    srce_cd)
                SELECT
                    p_inSec_id,
                    v_dt_val,
                    v_price_val,
                    v_maint_ts,
                    v_maint_ts,
                    c_login_name,
                    c_login_name,
                    c_factor_source
               FROM DUAL
               WHERE
                   NOT EXISTS
                   (
                        SELECT
                           1
                        FROM
                            SEC_PAYDN_LOSS_SCHD
                        WHERE
                            sec_id     =   p_inSec_id  AND
                            eff_dt     =   v_dt_val
                  );


                display_message('Maintained data for '||p_inSchd_name);

            ELSIF   (p_inSchd_name  IN (
                                       c_hist_principal_distributed
                                   )
                    )
            THEN

                UPDATE
                    SEC_PAYDN_LOSS_SCHD
                SET
                    principal_dist     =  v_price_val,
                    upd_ts                =  SYSDATE,
                    upd_login             =  USER,
                    srce_cd               =  c_factor_source
                WHERE
                    sec_id                         =  p_inSec_id     AND
                    eff_dt                         =  v_dt_val       AND
                    NVL(principal_dist,-12345) <>  NVL(v_price_val,-12345);

                INSERT INTO SEC_PAYDN_LOSS_SCHD (
                    sec_id,
                    eff_dt,
                    principal_dist,
                    upd_ts,
                    ins_ts,
                    ins_login,
                    upd_login,
                    srce_cd)
                SELECT
                    p_inSec_id,
                    v_dt_val,
                    v_price_val,
                    v_maint_ts,
                    v_maint_ts,
                    c_login_name,
                    c_login_name,
                    c_factor_source
               FROM DUAL
               WHERE
                   NOT EXISTS
                   (
                        SELECT
                           1
                        FROM
                            SEC_PAYDN_LOSS_SCHD
                        WHERE
                            sec_id     =   p_inSec_id  AND
                            eff_dt     =   v_dt_val
                  );

                display_message('Maintained data for '||p_inSchd_name);

            ELSIF   (p_inSchd_name  IN  (
                                            c_sw_pay_cash_flow_nm,
                                            c_sw_rec_cash_flow_nm
                                        )
                    )
            THEN

                UPDATE
                    sec_cash_flow_schd
                SET
                    amount     =  v_price_val
                WHERE
                    sec_id         =  p_inSec_id                AND
                    eff_dt         =  v_dt_val                  AND
                    cash_flow_typ  =  SUBSTR(p_inSchd_name,4);

                IF   SQL%NOTFOUND
                THEN

                    INSERT INTO sec_cash_flow_schd (
                        sec_id,
                        eff_dt,
                        amount,
                        cash_flow_typ,
                        upd_ts,
                        ins_ts,
                        ins_login,
                        upd_login
                    ) VALUES (
                        p_inSec_id,
                        v_dt_val,
                        v_price_val,
                        SUBSTR(p_inSchd_name,4),
                        v_maint_ts,
                        v_maint_ts,
                        c_login_name,
                        c_login_name
                    );

                END IF;

                display_message('Maintained data for '||p_inSchd_name);

            ELSIF   (p_inSchd_name  =  c_loan_repay_schd_name )
            THEN

                UPDATE
                    sec_ln_repay_schd_tbl
                SET
                    repayment_amt    =  v_price_val
                WHERE
                    sec_id           =  p_inSec_id              AND
                    repayment_dt     =  v_dt_val;

                IF   SQL%NOTFOUND
                THEN

                    INSERT INTO sec_ln_repay_schd_tbl (
                        sec_id,
                        repayment_dt,
                        repayment_amt,
                        ins_ts,
                        upd_ts,
                        ins_login,
                        upd_login
                    ) VALUES (
                        p_inSec_id,
                        v_dt_val,
                        v_price_val,
                        v_maint_ts,
                        v_maint_ts,
                        c_login_name,
                        c_login_name
                    );

                END IF;

                display_message('Maintained data for '||p_inSchd_name);

            END IF;

            v_cur_row   :=  v_cur_row + 1;

            EXIT WHEN TRIM(v_cur_val) IS NULL;

        END LOOP;

        display_message('Number of rows updated for schedule: '||v_cur_row);
        IF (v_no_rows <> v_cur_row) THEN
            c_proc_loc := 'bb_bulk_data_exception';                              --TD3787 10/21/2008 DuttaD
            RAISE bb_bulk_data_exception;

        END IF;

    EXCEPTION
        WHEN bb_bulk_data_exception THEN
            display_message('update_schdule_tables: Bulk data exception');
            RAISE_APPLICATION_ERROR(
                -20090,
                ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM
            );                                                                                  --TD3787 10/21/2008 DuttaD

        WHEN bb_bulk_fld_not_defined THEN
            display_message('update_schd_table:Bulk field not defined exception');
            RAISE_APPLICATION_ERROR(
                -20090,
                ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM
            );                                                                                  --TD3787 10/21/2008 DuttaD

        WHEN OTHERS THEN
            display_message('update_schd_table: Unhandled exception');
            RAISE_APPLICATION_ERROR(
                -20090,
              ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM
            );                                                                                  --TD3787 10/21/2008 DuttaD

    END update_schedule_tables;

    /************************** maintain_sec_attr_list_common ***************************
     ***  Author:           SinghGu
     ***  Date Created:     Oct 15 2013
     ***  Type:             Private
     ***  Purpose:          This procedure maintians the sec_attr_list_tbl
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE maintain_sec_attr_list_common(
        p_inSec_id               IN      sec_attr_list_tbl.sec_id%TYPE,
        p_inSrce_cd              IN      sec_attr_list_tbl.srce_cd%TYPE,
        p_inAttr_id              IN      sec_attr_list_tbl.attr_id%TYPE,
        p_inList_data            IN      sec_attr_list_tbl.code_value%TYPE
    )
    IS
        v_cur_val           VARCHAR2(32767);
        c_proc_func_name    VARCHAR2(32)    := 'maintain_sec_attr_list_common';
        v_code_val          NUMBER;

    BEGIN
        display_message('maintain_sec_attr_list_common : sec_id = ['||p_inSec_id||'], Attr_id ['||p_inAttr_id || ']');

        IF(TRIM(p_inList_data) IS NULL) THEN

          DELETE
          FROM
              sec_attr_list_tbl
          WHERE
              sec_id  = p_inSec_id  AND
              srce_cd = p_inSrce_cd AND
              attr_id = p_inAttr_id;

          RETURN; -- nothing to insert/update, just return after clearing out old rows

        END IF;

        BEGIN
          -- Check if the attribute exists in sec_attr_list_tbl
          SELECT
              1
          INTO
              v_code_val
          FROM
              sec_attr_list_tbl salt
          WHERE
              salt.sec_id = p_inSec_id AND
              salt.srce_cd = p_inSrce_cd AND
              salt.attr_id = p_inAttr_id;

          -- Reached here, that means the record exists, so update it with incoming value
          UPDATE sec_attr_list_tbl
          SET code_value = TRIM(p_inList_data)
          WHERE sec_id = p_inSec_id AND
                srce_cd = p_inSrce_cd AND
                attr_id = p_inAttr_id;

          display_message('Updated data for sec_id = ['||p_inSec_id||'],
                                    Attr_id ['||p_inAttr_id || '], code_val [' || TRIM(p_inList_data) ||'].');

        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            -- Record doesn't exist, so insert the record
            INSERT INTO sec_attr_list_tbl (
                sec_id,
                srce_cd,
                attr_id,
                code_value
            )
             VALUES
                (p_inSec_id,
                p_inSrce_cd,
                p_inAttr_id,
                TRIM(p_inList_data));

            display_message('Inserted data for sec_id = ['||p_inSec_id||'],
                            Attr_id ['||p_inAttr_id || '], code_val [' || TRIM(p_inList_data) ||'].');
        END;

    EXCEPTION

        WHEN OTHERS THEN

            display_message('maintain_sec_attr_list_common: Unhandled exception');
            RAISE_APPLICATION_ERROR(
                -20090,
               ':'||c_pkg_name||'-'||c_proc_func_name||'-'||SQLERRM
            );

    END maintain_sec_attr_list_common;

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
        p_inAction_cd               IN      vendor_request.action_cd%TYPE  DEFAULT NULL
     )
     RETURN BOOLEAN
     IS

        v_ext_propagated    BOOLEAN;
        v_catlg_item_id     catlg_item.catlg_item_id%TYPE :=NULL; --TD#3322 added on 16-FEB-2008 Cognizant Technology Solutions
        v_isin              sec_external_id.extern_id%TYPE;
        v_jpm_vndr_data_exists NUMBER := 0;
        v_topix_vndr_data_exists NUMBER := 0;  --TD6129 Raiteav
        v_jpm_short_dsc     ref_attr_value.short_dsc%TYPE;
        c_jpm_srce          CONSTANT VARCHAR2(3) := 'JPM';
        c_attr_id           CONSTANT NUMBER      := 29;
        --TD5969 VartaV Start
        c_boa_ml_srce             CONSTANT VARCHAR2(3) := 'BOA';
        c_attr_id_boa_ml          CONSTANT NUMBER      := 29;
        v_boa_ml_vndr_data_exists NUMBER := 0;
        v_boa_ml_short_dsc        ref_attr_value.short_dsc%TYPE;
        v_cusip                   sec_external_id.extern_id%TYPE;
        v_code_value_lv1          catlg_item.code_value_lv1%TYPE;
        v_code_value_lv2          catlg_item.code_value_lv2%TYPE;
        v_code_value_lv3          catlg_item.code_value_lv3%TYPE;
        v_code_value_lv4          catlg_item.code_value_lv4%TYPE;

        --TD5969 VartaV End

     BEGIN

        display_message(
            'bb_ext_fld_propagation : request_id = '||p_request_id
        );

        v_ext_propagated    :=  get_bb_ext_vrq (
                                    p_product_id,
                                    p_request_id,
                                    p_inSec_id,
                                    p_sec_typ_id
                                );


        --
        -- All schedules data coming in as VARCHAR was converted to LOB
        IF  (g_sec_fsc_data_rec.call_schedule_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_call_schd_name,
                TO_CLOB(g_sec_data_rec.call_schedule)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.put_schedule_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_put_schd_name,
                TO_CLOB(g_sec_data_rec.put_schedule)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.sink_schedule_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_sink_schd_name,
                TO_CLOB(g_sec_data_rec.sink_schedule)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.multi_cpn_schedule_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_multi_cpn_schd_name,
                TO_CLOB(g_sec_data_rec.multi_cpn_schedule)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.loan_repayment_schedule_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_loan_repay_schd_name,
                TO_CLOB(g_sec_data_rec.loan_repayment_schedule)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.mtg_factor_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_factor_schd_name,
               TO_CLOB(g_sec_data_rec.mtg_factor)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.hist_losses_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_hist_losses,
               TO_CLOB(g_sec_data_rec.hist_losses)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.hist_principal_distributed_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_hist_principal_distributed,
               TO_CLOB(g_sec_data_rec.hist_principal_distributed)
            );

        END IF;


        IF  (g_sec_fsc_data_rec.rec_side_rates_hist_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_rec_side_rates_hst_nm,
                TO_CLOB(g_sec_data_rec.rec_side_rates_hist)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.pay_side_rates_hist_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_pay_side_rates_hst_nm,
               TO_CLOB(g_sec_data_rec.pay_side_rates_hist)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.sw_pay_cash_flow_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_sw_pay_cash_flow_nm ,
                TO_CLOB(g_sec_data_rec.sw_pay_cash_flow)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.sw_rec_cash_flow_flg = 'U') THEN

            update_schedule_tables(
                p_product_id,
                p_request_id,
                g_sec_data_rec.sec_id,
                c_sw_rec_cash_flow_nm ,
                TO_CLOB(g_sec_data_rec.sw_rec_cash_flow)
            );

        END IF;

        IF  (g_sec_fsc_data_rec.wmc_isr_fam_id_flg = 'U') THEN

            update_issuer_family;

        END IF;

        IF  (g_sec_fsc_data_rec.wm_quasi_sovg_flg_flg = 'U') THEN

            quasi_sovg_relationship(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.wm_quasi_sovg_flg
            );

        END IF;

        IF  (g_sec_fsc_data_rec.wm_obligor_override_flg = 'U') THEN

            maintain_bb_isr_fam_pkg.update_obligor_by_sec(
                g_sec_data_rec.sec_id,
                g_sec_data_rec.wm_obligor_override
            );

        END IF;

        IF ( g_sec_fsc_data_rec.fut_dlvrble_bnds_bb_unique_flg = 'U' ) THEN

            maintain_factor(p_product_id,p_request_id,g_sec_data_rec.sec_id);

        END IF;

        --
        -- KampeTA TD 2859 01/10/2007
        --
        IF  (g_sec_fsc_data_rec.muni_erp_types_flg = 'U') THEN

            maintain_sec_attr_list_tbl(
                g_sec_data_rec.sec_id,
                'WMC',
                609,
                TO_CLOB(g_sec_data_rec.muni_erp_types)
            );

        END IF;

        --
        -- Deon TD5912 -- need both values to maintain data in sec_attr_list_tbl
        --                incase one or the other has changed
        --


        IF  (g_sec_fsc_data_rec.exch_cd_raw_flg = 'U') OR
            (g_sec_fsc_data_rec.exch_cd_raw_srce_flg = 'U')    THEN


            display_message('Updating exch codes');
            maintain_sec_attr_list_data(
                g_sec_data_rec.sec_id,
                TO_CLOB(g_sec_data_rec.exch_cd_raw),
                g_sec_data_rec.exch_cd_raw_srce,
                c_exch_cd_attr_id
            );
            display_message('Done Updating exch codes');

        END IF;

        --
        -- HillD TD 2818 03/23/2007
        --
        IF  (g_sec_fsc_data_rec.wm_interval_dt_flg = 'U') THEN

            maintain_interval_dt_schd(
                g_sec_data_rec.sec_id,
                TO_CLOB(g_sec_data_rec.wm_interval_dt)
            );

        END IF;

        --
        -- KampeTA TD 3174 11/29/2007
        --
        IF  (g_sec_fsc_data_rec.fix_to_float_reset_dt_flg = 'U') THEN

            maintain_security_attribute(
                g_sec_data_rec.sec_id,
                c_fix_to_float_reset_dt,
                g_sec_data_rec.fix_to_float_reset_dt
            );
        END IF;

       -- TD#3352 added 2008-FEB-18 Cognizant Technology Solutions

        IF  (   g_sec_fsc_data_rec.zone_id_flg = 'U' OR
                g_sec_fsc_data_rec.zone_source_cd_flg = 'U'
            )
        THEN

            maintain_sec_zone(
                g_sec_data_rec.sec_id,
                NVL(g_sec_data_rec.zone_id,blmbrg_rules_pkg.get_zone_id(p_sec_typ_id,p_inSec_id)),
                NVL(g_sec_data_rec.zone_source_cd,blmbrg_rules_pkg.get_zone_srce_cd(p_sec_typ_id,p_inSec_id))
            );

        END IF;

        --TD#3352 Changes End.

        -- DERIVATIVE SWAPS Deep

        --
        --  commented out 10/19/2005 PDeon moved to check_setup_completion in
        --  blmbrg_request_pkg
        --
        --update_bb_swap_analytics_tbl(
        --    p_product_id,
        --    p_request_id
        --);

        --
        -- 10/02/2006 - KampeTA - Adding call to scrub the markit data for security setup
        --
        markit_scrub_pkg.maintain_markit_data(p_product_id,p_request_id);

        update_rating_table(p_inAction_cd);

    --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.
        update_sec_assessment_table;
        --TD:4612 Assessment data for Municipal Securities (Watchlist and Outlook) :WADEKS on 22-JUN-2010.

        update_sec_price(
            p_product_id,         -- Added arguments for SWAP DERIVATIVES Deep 04-11-2005
            p_request_id,
            p_sec_typ_id
        );

        -- TD5442
        update_sec_fi_data;

    -- TD#3644 added 2008-JUN-17 Cognizant Technology Solutions

        IF   g_sec_fsc_data_rec.IDX_RATIO_flg = 'U'  AND
             g_sec_fsc_data_rec.SETTLE_DT_flg = 'U'  AND
             g_sec_data_rec.IDX_RATIO IS NOT NULL
        THEN

            maintain_sec_factor(
                g_sec_data_rec.sec_id    ,
                g_sec_data_rec.IDX_RATIO ,
                g_sec_data_rec.SETTLE_DT ,
                CSM_COMMON.IPS           ,
                NULL
            );

        END IF;

        --TD#3644 Changes End.
       --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:start
       IF  (g_sec_fsc_data_rec.bb_cntry_of_domicile_flg = 'U') THEN

            maintain_security_attribute(
                g_sec_data_rec.sec_id,
                c_bb_cntry_of_domicile,
                g_sec_data_rec.bb_cntry_of_domicile
            );
       END IF;

       IF  (g_sec_fsc_data_rec.bb_cntry_of_incorporation_flg = 'U') THEN

            maintain_security_attribute(
                g_sec_data_rec.sec_id,
                c_bb_cntry_of_incorporation,
                g_sec_data_rec.bb_cntry_of_incorporation
            );
       END IF;

       --TD4595:BuryeG:10/12/10:2 new fields requested from bloomberg:end
        --update_sec_fi_table;  TD3423 GarciN 01/07/2008
        update_vendor_nm_table;
        update_extern_table;

  -- TD 5116  - put back scrub exceptions


        IF(g_sec_fsc_data_rec.lb_global_class_flg = 'U') THEN

            v_catlg_item_id := maintain_bb_isr_pkg.get_catlg_item_id(
                                   g_sec_data_rec.WMC_LB_GLOBAL_CLASS,
                                   CSM_COMMON.CONST_CLASS_GLB
                               );

            csm_maintain_entity.maintain_sec_catlg(
                NULL,
                v_catlg_item_id,
                'NULL',
                'NULL',
                p_insec_id,
                CSM_COMMON.CONST_CLASS_GLB
            );

        END IF;

        IF (g_sec_fsc_data_rec.LB_GLOBAL_CLASS_WMC_FLG = 'U') THEN

            v_catlg_item_id := maintain_bb_isr_pkg.get_catlg_item_id(
                                   g_sec_data_rec.WMC_LB_GLOBAL_CLASS_WMC,
                                   CSM_COMMON.CONST_CLASS_GLB
                               );

            csm_maintain_entity.maintain_sec_catlg(
                NULL,
                v_catlg_item_id,
                'NULL',
                'NULL',
                p_insec_id,
                CSM_COMMON.CONST_CLASS_WMC_GLB
            );

            v_catlg_item_id := blmbrg_rules_pkg.get_379catlg_item_id(
                               p_insec_id
                              );

            csm_maintain_entity.maintain_sec_catlg(
                NULL,
                v_catlg_item_id,
                'NULL',
                'NULL',
                p_insec_id,
                CSM_COMMON.CONST_CLASS_SEC_LB
            );

        END IF;


        IF (g_sec_fsc_data_rec.CATLG_ITEM_ID_379_FLG = 'U'         AND
            p_product_id = BLMBRG_REQUEST_PKG.c_lb_vendor_prod_id)
        THEN


            IF g_sec_data_rec.wm_379_catlg_item_id IS NULL THEN

                v_catlg_item_id := blmbrg_rules_pkg.get_379catlg_item_id(
                                       p_insec_id
                                   );
            ELSE

                v_catlg_item_id := g_sec_data_rec.wm_379_catlg_item_id;

            END IF;

            csm_maintain_entity.maintain_sec_catlg(
                NULL,
                v_catlg_item_id,
                'NULL',
                'NULL',
                p_insec_id,
                CSM_COMMON.CONST_CLASS_SEC_LB
            );

        END IF;

        IF (g_sec_fsc_data_rec.industry_subgroup_num_flg = 'U') THEN
          csm_maintain_entity.maintain_sec_catlg(
              NULL,
              maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.industry_subgroup_num, c_ind_subgrp_num_catlg_id),
              NULL,
              NULL,
              p_inSec_id,
              c_ind_subgrp_num_catlg_id);
        END IF;

        IF (g_sec_fsc_data_rec.industry_group_num_flg = 'U') THEN
          csm_maintain_entity.maintain_sec_catlg(
              NULL,
              maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.industry_group_num, c_ind_grp_num_catlg_id),
              NULL,
              NULL,
              p_inSec_id,
              c_ind_grp_num_catlg_id);
        END IF;

        IF (g_sec_fsc_data_rec.industry_sector_num_flg = 'U') THEN
          csm_maintain_entity.maintain_sec_catlg(
              NULL,
              maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.industry_sector_num, c_ind_sector_num_catlg_id),
              NULL,
              NULL,
              p_inSec_id,
              c_ind_sector_num_catlg_id);
        END IF;

        IF (g_sec_fsc_data_rec.wm_jpm_ind_class_flg = 'U') THEN

        v_isin := blmbrg_common_pkg.get_sec_external_id (p_inSec_id, 'ISIN');

        BEGIN

            SELECT short_dsc
              INTO v_jpm_short_dsc
              FROM ref_attr_value
             WHERE code_value = g_sec_data_rec.wm_jpm_ind_class
               AND srce_cd    = c_jpm_srce
               AND attr_id    = c_attr_id;

          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              v_jpm_short_dsc := NULL;
          END;

          BEGIN
          SELECT 1
            INTO v_jpm_vndr_data_exists  -- Check whether security is covered by vendor
            FROM jpm_ind_classification
             WHERE substr(isin, 1, 11) = substr(v_isin, 1, 11)
               AND exp_dt IS NULL
               AND blmbrg_common_pkg.get_lower_cd_val(c_jpm_srce, c_attr_id, TRIM(sector), c_jpm_srce, c_attr_id)
                   = v_jpm_short_dsc;
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            v_jpm_vndr_data_exists := 0;
        END;

          IF v_jpm_vndr_data_exists = 1 THEN  -- If security is found in vendor data, write vendor classification
            csm_maintain_entity.maintain_sec_catlg(
                NULL,
                maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.wm_jpm_ind_class, c_jpm_catlg_id),
                NULL,
                NULL,
                p_inSec_id,
                c_jpm_catlg_id);
          END IF;

          -- Now write WMC derived classification unconditionally

          csm_maintain_entity.maintain_sec_catlg(
              NULL,
              maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.wm_jpm_ind_class, c_jpm_catlg_id),
              NULL,
              NULL,
              p_inSec_id,
              c_wmc_jpm_catlg_id);

        END IF;

       IF (g_sec_fsc_data_rec.wm_topix_ind_class_flg = 'U') THEN --TD6129 RAITEAV

        v_isin := blmbrg_common_pkg.get_sec_external_id_for_topix (p_inSec_id, 'ISIN');

        BEGIN

        SELECT 1
        INTO v_topix_vndr_data_exists
        FROM tpx_ind_classification
        WHERE substr(isin, 1, 11) = substr (v_isin, 1, 11)
        AND exp_dt IS NULL;

        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            v_topix_vndr_data_exists := 0;
        END;

          IF v_topix_vndr_data_exists = 1 THEN  -- If security is found in vendor data, write vendor classification
            csm_maintain_entity.maintain_sec_catlg(
                NULL,
                maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.wm_topix_ind_class, c_tpx_catlg_id),
                NULL,
                NULL,
                p_inSec_id,
                c_tpx_catlg_id);


              /*   for variant in (SELECT
                               sec_id
                                FROM
                                    security_tbl
                                WHERE
                                    mast_sec_id = p_inSec_id AND
                                    sec_class = 'V' )
                 loop
                              csm_maintain_entity.maintain_sec_catlg(
                              NULL,
                              maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.wm_topix_ind_class, c_tpx_catlg_id),
                              NULL,
                              NULL,
                              variant.sec_id,
                              c_tpx_catlg_id);

                 end loop; */
        END IF ;

        END IF;

  -- TD 5116 END
        --TD5969 Vartav 09/25/2012 Start
        IF (g_sec_fsc_data_rec.wm_boa_ml_ind_class_flg = 'U') THEN
            v_isin := blmbrg_common_pkg.get_sec_external_id (p_inSec_id, 'ISIN');
            v_cusip := blmbrg_common_pkg.get_sec_external_id (p_inSec_id, 'CUSIP');

            BEGIN

               SELECT code_value_lv1, code_value_lv2, code_value_lv3, code_value_lv4
                 INTO v_code_value_lv1, v_code_value_lv2, v_code_value_lv3, v_code_value_lv4
                 FROM catlg_item
                WHERE low_lv_cd_value = g_sec_data_rec.wm_boa_ml_ind_class
                  AND catlg_id    = c_boa_ml_catlg_id ;

            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                     v_code_value_lv1 := NULL;
                     v_code_value_lv2 := NULL;
                     v_code_value_lv3 := NULL;
                     v_code_value_lv4 := NULL;

            END;

            BEGIN
                SELECT 1
                  INTO v_boa_ml_vndr_data_exists  -- Check whether security is covered by vendor
                  FROM boa_ml_ind_class
                 WHERE ( substr(isin, 1, 11) = substr(v_isin, 1, 11) OR substr(cusip, 1, 8) = substr(v_cusip, 1, 8) )
                   AND exp_dt IS NULL
                   AND ml_ind_lvl1_cd = v_code_value_lv1
                   AND ml_ind_lvl2_cd = v_code_value_lv2
                   AND ml_ind_lvl3_cd = v_code_value_lv3
                   AND ml_ind_lvl4_cd = v_code_value_lv4 ;

            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                 v_boa_ml_vndr_data_exists := 0;
            END;

            IF v_boa_ml_vndr_data_exists = 1 THEN  -- If security is found in vendor data, write vendor classification
               csm_maintain_entity.maintain_sec_catlg(
                NULL,
                maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.wm_boa_ml_ind_class, c_boa_ml_catlg_id),
                NULL,
                NULL,
                p_inSec_id,
                c_boa_ml_catlg_id);
            END IF;

            -- Now write WMC derived classification unconditionally

            csm_maintain_entity.maintain_sec_catlg(
              NULL,
              maintain_markit_curves_pkg.get_catlg_item_id_cd(g_sec_data_rec.wm_boa_ml_ind_class, c_boa_ml_catlg_id),
              NULL,
              NULL,
              p_inSec_id,
              c_wmc_boa_ml_catlg_id);

        END IF;
        --TD5969 VartaV 09/25/2012 End

        -- TD5410
        IF  (g_sec_fsc_data_rec.capital_contingent_flg = 'U') THEN

            maintain_sec_attr_list_common(
                g_sec_data_rec.sec_id,
                'CSM',
                c_capital_contingent_attr_id,
                g_sec_data_rec.capital_contingent
            );

        END IF;

        --TD6262
         IF  (g_sec_fsc_data_rec.trade_description_flg = 'U') THEN

              maintain_sec_descriptor_table(
                           g_sec_data_rec.sec_id,
						   'WMC',
						   'WMC_DESCRIPTION',
						   309,
                           TO_CLOB(g_sec_data_rec.trade_description),
						   TO_CLOB(g_sec_data_rec.trade_description)
                           );
         END IF;

		 --TD6720
         IF  (g_sec_fsc_data_rec.jpm_cntry_classification_flg = 'U') THEN

            maintain_security_attribute(
                g_sec_data_rec.sec_id,
                c_jpm_cntry_clfsn_description,
                g_sec_data_rec.jpm_cntry_classification
            );
          END IF;  

        -- TD #5065 - need external table set before defaults are set

        csm_common.maintain_catalog_defaults(p_insec_id);

        -- TD#5065  End.

        RETURN v_ext_propagated;

    END bb_ext_fld_propagate;

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
    RETURN vendor_req_messages.column_value%TYPE
    IS

        v_column_value      vendor_req_messages.column_value%TYPE := NULL;

    BEGIN
        SELECT /*+ index(a,vendor_req_messages_pk) */
            TRIM(column_value)
        INTO
            v_column_value
        FROM
            vendor_req_messages a
        WHERE
            vendor_product_id   =   p_product_id    AND
            request_id          =   p_request_id    AND
            column_nm           =   p_column_nm     AND
            ROWNUM              <   2;
        RETURN v_column_value;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN v_column_value;

        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20080,'get_bb_vrq_data : '||SQLERRM);

    END get_bb_vrq_data;

    /************************** get_bb_vrq_trans_data ***************************
     ***  Author:           HillD
     ***  Date Created:     07 July 2008
     ***  Type:             private
     ***  Purpose:          This procedure gets specified translate date from VRQ
     ***                    for TD 2602
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_bb_vrq_trans_data (
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_wmc_column_nm             IN      vendor_req_messages.column_nm%TYPE
    )
    RETURN vendor_req_messages.column_trans_value%TYPE
    IS

        v_column_value      vendor_req_messages.column_trans_value%TYPE := NULL;

    BEGIN
        SELECT /*+ index(a,vendor_req_messages_pk) */
            TRIM(column_trans_value)
        INTO
            v_column_value
        FROM
            vendor_req_messages a
        WHERE
            vendor_product_id   =   p_product_id    AND
            request_id          =   p_request_id    AND
            wmc_column_nm       =   p_wmc_column_nm AND
            ROWNUM              <   2;
        RETURN v_column_value;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN v_column_value;

        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20080,'get_bb_vrq_data : '||SQLERRM);

    END get_bb_vrq_trans_data;

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
    )
    IS
    BEGIN

        display_message('maintain_exception_tbl : sec_id = '||p_inEntity_id);
        INSERT INTO csm.csm_validation_exc (
            entity_typ,
            entity_id,
            err_seq,
            column_name,
            err_id,
            err_dsc,
            ins_ts,
            ins_login
        ) VALUES (
            p_inEntity_typ,
            p_inEntity_id,
            p_inEntity_seq,
            p_inEntity_column_name,
            p_inError_id,
            p_inError_dsc,
            SYSDATE,
            c_login_name
        );

    EXCEPTION
        WHEN OTHERS THEN
            display_message('maintain_exception_tbl : sec_id = '||p_inEntity_id);
            RAISE_APPLICATION_ERROR(-20090,'maintain_exception_tbl : '||SQLERRM);

    END maintain_exception_tbl;

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
    FUNCTION decrement_prefix(
        p_prefix                    IN      security_tbl.invest_id%TYPE
    )
    RETURN security_tbl.invest_id%TYPE
    IS

        v_return_cd         security_tbl.invest_id%TYPE;
        v_lchar             security_tbl.invest_id%TYPE
                                :=  SUBSTR(p_prefix,LENGTH(p_prefix)-2+1);
        v_fchar             security_tbl.invest_id%TYPE
                                :=  SUBSTR(p_prefix,1,LENGTH(p_prefix)-2);
        v_digit             PLS_INTEGER
                                :=  ASCII(SUBSTR(v_lchar,2,1))-1;

    BEGIN

        display_message('decrement_prefix : prefix = '||p_prefix);

        IF  (v_digit    <   65) THEN

            v_digit :=  ASCII(SUBSTR(v_lchar,1,1))-1;

            IF  (v_digit < 65)  THEN

                IF (TRIM(v_fchar) IS NOT NULL) THEN

                    v_digit := TO_NUMBER(v_fchar) - 1;

                    IF (v_digit < 0) THEN

                        v_return_cd :=  NULL;

                    ELSE

                        v_return_cd :=  TO_CHAR(v_digit)||'ZZ';

                    END IF;

                ELSE

                    v_return_cd := NULL;

                END IF;

            ELSE

                v_return_cd :=  SUBSTR(p_prefix,1,LENGTH(p_prefix)-2)||CHR(v_digit)||'Z';

            END IF;

        ELSE

            v_return_cd :=  SUBSTR(p_prefix,1,LENGTH(p_prefix)-1)||CHR(v_digit);

        END IF;

        display_message('decrement_prefix : return_cd = '||v_return_cd);
        RETURN v_return_cd;

    EXCEPTION
        WHEN OTHERS THEN

            RETURN NULL;

    END decrement_prefix;

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
    RETURN issuer.wmc_isr_id%TYPE
    IS

        v_wmc_isr_id            issuer.wmc_isr_id%TYPE := NULL;
        v_isr_nm                    issuer.isr_nm%TYPE := NULL;
        v_isr_long_nm           issuer.isr_long_nm%TYPE := NULL;

    BEGIN

        display_message('get_isr_id : isr_id = '||p_isr_id);

        IF  (p_isr_id IS NOT NULL) THEN

            SELECT
                wmc_isr_id,
                isr_nm,
                isr_long_nm
            INTO
                v_wmc_isr_id,
                v_isr_nm,
                v_isr_long_nm
            FROM
                issuer
            WHERE
                isr_id  =   p_isr_id;

        ELSIF   (p_related_request_id IS NOT NULL) THEN

            SELECT
                wmc_isr_id,
                isr_nm,
                isr_long_nm,
                isr_id
            INTO
                v_wmc_isr_id,
                v_isr_nm,
                v_isr_long_nm,
                p_isr_id
            FROM
                issuer
            WHERE
                isr_id  =   (
                                SELECT
                                    isr_id
                                FROM
                                    vendor_request
                                WHERE
                                    vendor_product_id   =   p_vendor_product_id AND
                                    request_id          =   p_related_request_id
                            );

        END IF;

        p_isr_nm        :=  v_isr_nm;
        p_isr_long_nm   :=  v_isr_long_nm;

        RETURN v_wmc_isr_id;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('get_wmc_isr_id:' || SUBSTR(SQLERRM,1,200));
            p_isr_nm        :=  NULL;
            p_isr_long_nm   :=  NULL;
            RETURN v_wmc_isr_id;

    END get_wmc_isr_id;

    /********************** get_def_csm_invest_id *******************************
     ***  Author:           MahadS
     ***  Date Created:     12 Feb 2004
     ***  Type:             Public
     ***  Purpose:          This function derives default invest_id based on
     ***                                  csm logic
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_def_csm_invest_id (
        p_sec_typ1                  IN      sec_type.sec_typ1%TYPE,
        p_sec_typ2                  IN      sec_type.sec_typ2%TYPE,
        p_id_cusip_id_num           IN      vendor_req_messages.column_value%TYPE,
        p_opt_typ                   IN      vendor_req_messages.column_value%TYPE)
    RETURN security_tbl.invest_id%TYPE
    IS

    v_dummy              security_tbl.invest_id%TYPE   := NULL;
    v_loop               BOOLEAN                       := TRUE;
    v_next_invest_id     security_tbl.invest_id%TYPE   := NULL;

    BEGIN

        display_message('get_def_csm_invest_id : ');

        WHILE    v_loop
        LOOP

                     v_next_invest_id := csm_common.get_dummy_invest_id();

                 BEGIN
                      SELECT
                             invest_id
                      INTO
                             v_dummy
                      FROM
                             security_tbl
                      WHERE
                             invest_id = v_next_invest_id;

                 EXCEPTION
                      WHEN NO_DATA_FOUND THEN

                             v_loop := FALSE;
                 END;

        END LOOP;

        IF (  p_sec_typ1  =   'OPT'  )
        THEN
           IF ( p_sec_typ2 = 'STKOPT'            AND
                p_id_cusip_id_num IS NOT NULL    AND
                NOT invest_id_exists(SUBSTR(p_id_cusip_id_num,1,8))        -- Added as part of TD 1822    IgnatIV    Sep 30 2005
              )
           THEN
                    v_next_invest_id := SUBSTR(p_id_cusip_id_num,1,8);
           ELSE
                    v_next_invest_id := SUBSTR(v_next_invest_id,1,2)    ||
                                        UPPER(SUBSTR(p_opt_typ,1,1))    ||
                                        SUBSTR(v_next_invest_id,4);
           END IF;
        END IF;


        RETURN   v_next_invest_id;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('get_def_csm_invest_id:' || SUBSTR(SQLERRM,1,200));
            RETURN NULL;

    END get_def_csm_invest_id;

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
    RETURN security_tbl.invest_id%TYPE
    IS

        CURSOR  cur_eqy_security (
                    p_start_pos     IN      PLS_INTEGER,
                    p_no_pos        IN      PLS_INTEGER
                )
        IS
            SELECT
                TRIM(
                    SUBSTR(
                        s.invest_id,
                        p_start_pos,
                        p_no_pos
                    )
                )   eqy_seq
            FROM
                security_tbl    s,
                sec_type        t
            WHERE
                t.sec_typ1          IN  (
                                            'CMSTK',
                                            'PFSTK',
                                            'RIGHT'
                                        )               AND
                s.sec_typ_id        =   t.sec_typ_id    AND
                s.isr_id            =   p_isr_id        AND
                LENGTH(invest_id)   =   8
            ORDER BY
                1 DESC;

        CURSOR  cur_fi_security(
                    p_start_pos     IN      PLS_INTEGER,
                    p_no_pos        IN      PLS_INTEGER
                )
        IS
            SELECT
                TRIM(
                    SUBSTR(
                        invest_id,
                        p_start_pos,
                        p_no_pos
                    )
                )   eqy_seq
            FROM
                security_tbl    s,
                sec_type        t
            WHERE
                t.sec_typ1          NOT IN  (
                                                'CMSTK',
                                                'PFSTK',
                                                'RIGHT'
                                            )           AND
                s.sec_typ_id        =   t.sec_typ_id    AND
                s.isr_id            =   p_isr_id        AND
                LENGTH(invest_id)   =   8
            ORDER BY
                1 DESC;

        v_suffix            VARCHAR2(10); --issuer.wmc_isr_id%TYPE;
        v_derived_cd        VARCHAR2(5) :=  NULL;
        v_eqy_cnt           PLS_INTEGER;
        v_fi_cnt            VARCHAR2(5);

    BEGIN

        display_message('get_def_invest_id : isr_id = '||p_isr_id);

        IF (p_sec_typ1 IS NULL) THEN

            display_message('get_def_invest_id: sec typ1 is null ');
            RETURN NULL;

        END IF;

        IF  (p_sec_typ1 IN  ('CMSTK','PFSTK','RIGHT')) THEN

            v_eqy_cnt       :=  99;
            v_derived_cd    :=  TO_CHAR(v_eqy_cnt);

            FOR rec_eqy_security    IN  cur_eqy_security(7,2) LOOP

                IF (TO_NUMBER(rec_eqy_security.eqy_seq) <> v_eqy_cnt) THEN

                    v_derived_cd := TO_CHAR(v_eqy_cnt);
                    EXIT;

                END IF;

                v_eqy_cnt := v_eqy_cnt - 1;

                EXIT WHEN (v_eqy_cnt < 20);

            END LOOP;

        ELSE

            v_fi_cnt        :=  'ZZ';
            v_derived_cd    :=  v_fi_cnt;
            v_suffix        :=  NULL;

            <<l_outer>>
            FOR     v_out_cnt IN REVERSE 5..7 LOOP

                FOR rec_eqy_security    IN  cur_fi_security(
                                                v_out_cnt,
                                                9-v_out_cnt
                                            )
                LOOP

                    IF (rec_eqy_security.eqy_seq <> v_fi_cnt) THEN

                        v_derived_cd := v_fi_cnt;
                        EXIT l_outer;

                    END IF;

                    v_fi_cnt := decrement_prefix(v_fi_cnt);
                    EXIT l_outer WHEN (v_fi_cnt IS NULL);
                    EXIT WHEN (v_fi_cnt < v_suffix||'XA');

                END LOOP;

                v_fi_cnt := '9'||v_fi_cnt;
                v_suffix := '9'||v_suffix;

            END LOOP l_outer;

        END IF;

        IF (v_derived_cd IS NULL) THEN

            RETURN NULL;

        ELSE

            RETURN (SUBSTR(p_wmc_isr_id,1,8-LENGTH(v_derived_cd))||v_derived_cd);

        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('get_def_invest_id:' || SUBSTR(SQLERRM,1,200));
            RETURN NULL;

    END get_def_invest_id;

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
    )
    IS

        v_err_seq           PLS_INTEGER     :=  0;
        v_error_cd          PLS_INTEGER     :=  -20001;
        v_dummy             VARCHAR2(100);
        v_def_err_text      VARCHAR2(35)    :=  ' is mandatory field and is required';
        v_ext_err_txt       VARCHAR2(31)    :=  ' or length is less than 8 char.';
        v_dup_err_text      VARCHAR2(29)    :=  ' is duplicate in the database';
        v_next_err_text     VARCHAR2(32)    :=  ' does not exist in the database';
        v_rating_err_text   VARCHAR2(47)    :=  ' rating does not exist in the REF_RATING table';
        v_ext_validate      BOOLEAN;

        PROCEDURE   wrap_exception_write (
            p_inDatum               IN      VARCHAR2,
            p_inColumn_name         IN      user_tab_columns.column_name%TYPE,
            p_inErr_txt             IN      VARCHAR2
        )
        IS

        BEGIN

            v_err_seq   :=  v_err_seq + 1;

            IF      (
                        (p_inErr_txt=v_def_err_text)    AND
                        (TRIM(p_inDatum) IS NULL)
                    )
            THEN

                maintain_exception_tbl (
                    p_inEntity_id,
                    p_inEntity_typ,
                    v_err_seq,
                    p_inColumn_name,
                    v_error_cd,
                    p_inColumn_name||p_inErr_txt
                );

            ELSIF   (
                        (p_inErr_txt=v_def_err_text||v_ext_err_txt) AND
                        (
                            (TRIM(p_inDatum)    IS NULL)            OR
                            (LENGTH(p_inDatum)  <   8)
                        )
                    )
            THEN

                maintain_exception_tbl (
                    p_inEntity_id,
                    p_inEntity_typ,
                    v_err_seq,
                    p_inColumn_name,
                    v_error_cd,
                    p_inColumn_name||p_inErr_txt
                );

            ELSIF   p_inErr_txt    IN  (
                                            v_dup_err_text,
                                            v_next_err_text,
                                            v_rating_err_text
                                        )
            THEN

                maintain_exception_tbl (
                    p_inEntity_id,
                    p_inEntity_typ,
                    v_err_seq,
                    p_inColumn_name,
                    v_error_cd,
                    p_inColumn_name||p_inErr_txt
                );

            END IF;

        END wrap_exception_write;

        PROCEDURE wrap_ext_exception_write (
            p_inExtern_id           IN      sec_external_id.extern_id%TYPE,
            p_inExtern_id_typ       IN      sec_external_id.extern_id_typ%TYPE
        )
        IS

        BEGIN

            IF  (p_inExtern_id IS NOT NULL) THEN

                SELECT
                    '1'
                INTO
                    v_dummy
                FROM
                    dual
                WHERE
                    EXISTS  (
                                SELECT
                                    extern_id
                                FROM
                                    sec_external_id
                                WHERE
                                    extern_id_typ   =   p_inExtern_id_typ   AND
                                    extern_id       =   p_inExtern_id       AND
                                    exp_dt          >   SYSDATE
                            );

                wrap_exception_write (
                    p_inExtern_id,
                    p_inExtern_id_typ,
                    v_dup_err_text
                );

            END IF;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN

                NULL;

        END wrap_ext_exception_write;

        PROCEDURE wrap_rtg_exception_write (
            p_inDatum               IN      ref_rating.rating%TYPE,
            p_inColumn_name         IN      user_tab_columns.column_name%TYPE,
            p_inRating_srce_cd      IN      ref_rating.rating_srce_cd%TYPE
        )
        IS

        BEGIN

            IF  (p_inDatum IS NOT NULL) THEN

                SELECT
                    '1'
                INTO
                    v_dummy
                FROM
                    dual
                WHERE
                    NOT EXISTS  (
                                    SELECT
                                        rating
                                    FROM
                                        ref_rating
                                    WHERE
                                        rating_srce_cd  =   p_inRating_srce_cd          AND
                                        asset_class     =   g_sec_data_rec.asset_class  AND
                                        rating          =   p_inDatum
                            );

                wrap_exception_write (
                    p_inDatum,
                    p_inColumn_name,
                    v_rating_err_text
                );

            END IF;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN

                NULL;

        END wrap_rtg_exception_write;

    BEGIN

        display_message (
            'alt_validate_csm_security : sec_id = '||
            p_inSec_data.sec_id
        );

        p_inEntity_id   :=  p_inSec_data.sec_id;

        --
        --  Purge entries for this entity
        --
        DELETE FROM
            csm.csm_validation_exc
        WHERE
            entity_typ  =   p_inEntity_typ  AND
            entity_id   =   p_inEntity_id;

        --
        --  Following fields are all required
        --

        wrap_exception_write (
            p_inSec_data.sec_id,
            'SEC_ID',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.sec_typ_id,
            'SEC_TYP_ID',
            v_def_err_text
        );
        wrap_exception_write (
            p_inSec_data.sec_typ1,
            'SEC_TYP1',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.sec_typ2,
            'SEC_TYP2',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.isr_id,
            'ISR_ID',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.sec_nm,
            'SEC_NM',
            v_def_err_text
        );



        IF (p_inSec_data.sec_long_nm IS NULL) THEN

            BEGIN

                SELECT
                    '1'
                INTO
                    v_dummy
                FROM
                    dual
                WHERE
                    NOT EXISTS  (
                                    SELECT
                                        sec_typ_id
                                    FROM
                                        sec_typ_groups
                                    WHERE
                                        group_nm    IN  (
                                                            'AB',
                                                            'CMO'
                                                        )   AND
                                        sec_typ_id  =   p_inSec_data.sec_typ_id
                                );

                wrap_exception_write (
                    p_inSec_data.sec_long_nm,
                    'SEC_LONG_NM',
                    v_def_err_text
                );

            EXCEPTION
                WHEN NO_DATA_FOUND THEN

                    NULL;
            END;

        END IF;

        /**********************************
        -- Added in support of TD 1804 Deep 03/11/2005
        IF  p_inSec_data.sec_typ1 = 'BOND' OR p_inSec_data.sec_typ_id IN (61,62,63,64,123,194)
        THEN
            wrap_exception_write (
                p_inSec_data.dur_mod_eff_usbe,
                'DUR_MOD_EFF_USBE',
                v_def_err_text
            );
        END IF;
        **********************************/


        -- Added in support of TD 1656 Shashi 02/16/2005
        -- IF  p_inSec_data.sec_typ_id IN (471, 472) OR p_inSec_data.sec_typ1 = 'FUT' --FUT added for TD1804 Deep
        IF  p_inSec_data.sec_typ_id IN (471, 472) THEN
            wrap_exception_write (
                p_inSec_data.deriv_duration,
                'DERIV_DURATION',
                v_def_err_text
            );

            wrap_exception_write (
                p_inSec_data.delta,
                'DELTA',
                v_def_err_text
            );
        END IF;
        -- Added in support of TD 1656 Shashi 02/16/2005

        wrap_exception_write (
            p_inSec_data.sym,
            'SYM',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.trade_curcy_cd,
            'TRADE_CURCY_CD',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.sec_status_cd,
            'SEC_STATUS_CD',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.maint_status_cd,
            'MAINT_STATUS_CD',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.sec_class,
            'SEC_CLASS',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.mast_sec_id,
            'MAST_SEC_ID',
            v_def_err_text
        );

        wrap_exception_write (
            p_inSec_data.invest_id,
            'INVEST_ID',
            v_def_err_text||v_ext_err_txt
        );

        --
        --  Following are the duplicates checks
        --

        IF  (p_inSec_data.invest_id IS NOT NULL) THEN

            BEGIN

                SELECT
                    '1'
                INTO
                    v_dummy
                FROM
                    dual
                WHERE
                    EXISTS  (
                                SELECT
                                    invest_id
                                FROM
                                    security_tbl
                                WHERE
                                    invest_id   =   p_inSec_data.invest_id
                            );

                wrap_exception_write (
                    p_inSec_data.invest_id,
                    'INVEST_ID',
                    v_dup_err_text
                );

            EXCEPTION
                WHEN NO_DATA_FOUND THEN

                    NULL;

            END;

        END IF;

        IF  (p_inSec_data.sym IS NOT NULL) THEN

            BEGIN

                SELECT
                    '1'
                INTO
                    v_dummy
                FROM
                    dual
                WHERE
                    EXISTS  (
                                SELECT
                                    sym
                                FROM
                                    security_tbl
                                WHERE
                                    sym =   p_inSec_data.sym
                            );

                wrap_exception_write (
                    p_inSec_data.sym,
                    'SYM',
                    v_dup_err_text
                );

            EXCEPTION
                WHEN NO_DATA_FOUND THEN

                    NULL;

            END;

        END IF;

        --
        --  Following are the non existance checks
        --

        IF  (p_inSec_data.isr_id IS NOT NULL) THEN

            BEGIN

                SELECT
                    '1'
                INTO
                    v_dummy
                FROM
                    dual
                WHERE
                    EXISTS  (
                                SELECT
                                    isr_id
                                FROM
                                    issuer
                                WHERE
                                    isr_id  =   p_inSec_data.isr_id
                            );

            EXCEPTION
                WHEN NO_DATA_FOUND THEN

                    wrap_exception_write (
                        p_inSec_data.isr_id,
                        'ISR_ID',
                        v_next_err_text
                );

            END;

        END IF;

        --
        --  Following checks are for the one to many data fields
        --

        v_ext_validate  :=  get_bb_ext_vrq (
                                p_inproduct_id,
                                p_inrequest_id,
                                p_insec_data.sec_id,
                                p_insec_data.sec_typ_id
                            );

        --
        --  Check for the ratings
        --

        wrap_rtg_exception_write (
            g_sec_data_rec.rtg_moody,
            'RTG_MOODY',
            c_rating_moody
        );

        wrap_rtg_exception_write (
            g_sec_data_rec.rtg_sp,
            'RTG_SP',
            c_rating_sp
        );

        wrap_rtg_exception_write (
            g_sec_data_rec.rtg_fitch,
            'RTG_FITCH',
            c_rating_fitch
        );

        --
        --  Check for the external ids
        --  TD4333 this check does not work as the extern_id_typ is passed in and the below are not valid
        --  TD 4506 changed BB_CUSIP, BB_SEDOL, BB_ISIN to CUSIP, SEDOL and ISIN respectively by buryeg

        wrap_ext_exception_write (
            g_sec_data_rec.bb_cusip,
            'CUSIP'
        );

        wrap_ext_exception_write (
            g_sec_data_rec.bb_sedol,
            'SEDOL'
        );

        wrap_ext_exception_write (
            g_sec_data_rec.bb_isin,
            'ISIN'
        );



        -- Commented on 01/27 now BB_TICKER need not be unique for across securities
        --wrap_ext_exception_write (
        --    g_sec_data_rec.bb_ticker,
        --    'BB_TICKER'
        --);

        wrap_ext_exception_write (
            g_sec_data_rec.bb_unique,
            'BB_UNIQUE'
        );

        wrap_ext_exception_write (
            g_sec_data_rec.bb_global,
            'BB_GLOBAL'
        );

        wrap_ext_exception_write (
            g_sec_data_rec.occ_id,
            'OCC_ID'
        );

        wrap_ext_exception_write (
            g_sec_data_rec.opra_id,
            'OPRA_ID'
        );

        wrap_ext_exception_write (
            g_sec_data_rec.loanx_id,
            'LOANX_ID'
        );

        wrap_ext_exception_write (
            g_sec_data_rec.wso_id,
            'WSO_ID'
        );

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'alt_validate_csm_security : sec_id = '||
                p_inSec_data.sec_id
            );
        RAISE_APPLICATION_ERROR(-20090,'alt_validate_csm_security : '||SQLERRM);

    END alt_validate_csm_security;

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
    )
    IS


        v_err_seq               PLS_INTEGER     :=  0;
        v_error_cd              PLS_INTEGER     :=  -20001;
        v_ext_validate          BOOLEAN;
        v_exception_1           VARCHAR2(256);
        v_exception_2           VARCHAR2(256);
        v_exception_3           VARCHAR2(256);
        v_column_nm             vendor_req_messages.column_nm%TYPE;
        v_column_trans_val      vendor_req_messages.column_trans_value%TYPE;
        v_clob_len              NUMBER  :=  0;

        PROCEDURE   wrap_exception_write (
            p_inColumn_name         IN      user_tab_columns.column_name%TYPE,
            p_inErr_txt             IN      VARCHAR2
        )
        IS

        BEGIN

            v_err_seq   :=  v_err_seq + 1;

            maintain_exception_tbl (
                p_inEntity_id,
                p_inEntity_typ,
                v_err_seq,
                p_inColumn_name,
                v_error_cd,
                p_inErr_txt
            );

        END wrap_exception_write;

    BEGIN

        display_message (
            'ext_validate_csm_security : sec_id = '||
            p_inSec_data.sec_id
        );

        p_inEntity_id   :=  p_inSec_data.sec_id;

        BEGIN

            SELECT
                NVL(MAX(v.err_seq),0)
            INTO
                v_err_seq
            FROM
                csm_validation_exc v
            WHERE
                entity_typ  =   p_inEntity_typ AND
                entity_id   =   p_inEntity_id;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_err_seq := 0;
        END;

        -- validate RIC value
        IF p_inSec_data.sec_typ1 = 'FUT' THEN

          v_column_nm := 'RIC';
          v_column_trans_val := get_bb_vrq_trans_data(
                                    p_inproduct_id,
                                    p_inrequest_id,
                                    v_column_nm
                                );
          v_clob_len   :=  DBMS_LOB.GETLENGTH(v_column_trans_val);

          IF v_clob_len <> 0 THEN

              display_message (
                'ext_validate_csm_security : ' || v_column_nm || ' trans_val = '|| v_column_trans_val
              );
              scrub_validate_RIC(
                  v_column_trans_val,
                  p_inSec_data.trade_curcy_cd,
                  p_inSec_data.expiration_dt,
                  p_inSec_data.first_notice_dt,
                  p_inSec_data.sec_id,
                  v_exception_1,
                  v_exception_2,
                  v_exception_3
              );

              IF  (v_exception_1 IS NOT NULL) THEN

                  wrap_exception_write (
                      v_column_nm,
                      v_exception_1
                  );

                  IF  (v_exception_2 IS NOT NULL) THEN

                      wrap_exception_write (
                          v_column_nm,
                          v_exception_2
                      );

                      IF  (v_exception_3 IS NOT NULL) THEN

                          wrap_exception_write (
                              v_column_nm,
                              v_exception_3
                          );

                      END IF;

                  END IF;

              END IF;

          END IF; --v_column_trans_val IS NOT NULL

      END IF; --p_inSec_data.sec_typ1 = 'FUT'

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'ext_validate_csm_security : sec_id = '||
                p_inSec_data.sec_id
            );
        RAISE_APPLICATION_ERROR(-20090,'ext_validate_csm_security : '||SQLERRM);

    END ext_validate_csm_security;

    /********************** validate_sec_price ***************************
     ***  Author:           GarciN
     ***  Date Created:     3 September 2009
     ***  Type:             Private
     ***  Purpose:          This procedure writes an exception
     *****************************************************************************/
    PROCEDURE   wrap_exception_write (
        p_inEntity_id           IN OUT  csm_validation_exc.entity_id%TYPE,
        p_inEntity_typ          IN      csm_validation_exc.entity_typ%TYPE,
        p_inColumn_name         IN      user_tab_columns.column_name%TYPE,
        p_inErr_cd              IN      PLS_INTEGER DEFAULT -20001,
        p_inErr_txt             IN      VARCHAR2
    )
    IS
        v_err_seq               PLS_INTEGER     :=  0;
    BEGIN

        BEGIN

            SELECT
                NVL(MAX(err_seq),0)
            INTO
                v_err_seq
            FROM
                csm_validation_exc v
            WHERE
                entity_typ  =   p_inEntity_typ AND
                entity_id   =   p_inEntity_id;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_err_seq := 0;
        END;

        v_err_seq   :=  v_err_seq + 1;

        maintain_exception_tbl (
            p_inEntity_id,
            p_inEntity_typ,
            v_err_seq,
            p_inColumn_name,
            p_inErr_cd,
            p_inErr_txt
        );

    END wrap_exception_write;

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
    )
    IS

        v_column_nm             vendor_req_messages.column_nm%TYPE;
        v_column_trans_val      vendor_req_messages.column_trans_value%TYPE;
        v_clob_len              NUMBER  :=  0;

    BEGIN

        display_message (
            'validate_sec_price : sec_id = '||
            p_inSec_data.sec_id
        );

        p_inEntity_id   :=  p_inSec_data.sec_id;

        -- validate sec_price
        v_column_nm := 'BB_PX_CLOSE';
        v_column_trans_val := get_bb_vrq_trans_data(
                                p_inproduct_id,
                                p_inrequest_id,
                                v_column_nm
                            );
        v_clob_len   :=  DBMS_LOB.GETLENGTH(v_column_trans_val);

        IF nvl(v_clob_len,0) = 0 THEN

            v_column_nm := 'BB_PX_CLOSE_MTD';
            v_column_trans_val := get_bb_vrq_trans_data(
                                    p_inproduct_id,
                                    p_inrequest_id,
                                    v_column_nm
                                );
            v_clob_len   :=  DBMS_LOB.GETLENGTH(v_column_trans_val);

            IF nvl(v_clob_len,0) = 0 THEN

                wrap_exception_write (
                    p_inEntity_id     => p_inEntity_id,
                    p_inEntity_typ    => p_inEntity_typ,
                    p_inColumn_name   => 'PRICE',
                    p_inErr_cd        => -20092,
                    p_inErr_txt       => 'PRICE is required'
                );

            END IF;

        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'validate_sec_price : sec_id = '||
                p_inSec_data.sec_id
            );
        RAISE_APPLICATION_ERROR(-20091,'validate_sec_price : '||SQLERRM);

    END validate_sec_price;

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
    )
    IS

        v_cusip                   VARCHAR2(8);
        v_cusip_based             BOOLEAN;
        v_dummy                   CHAR(1);
        v_request_src             vendor_request.request_src%TYPE;

        v_sec_typ_grp             VARCHAR2(15);
        v_sec_typ_id              PLS_INTEGER;
        v_ticker                  VARCHAR2(15);
        v_offset                  PLS_INTEGER  := NULL;

    BEGIN

        display_message('ext_default_csm_security:sec_id= '||p_inSec_data.sec_id);

        IF (p_inAction_cd = c_setup_action) THEN

            v_cusip         :=  TRIM(SUBSTR(p_inSec_data.cusip,1,8));
            v_cusip_based   :=  FALSE;



            IF (p_inSec_data.invest_id IS NULL) THEN

                IF  (p_inSec_data.sec_typ1 = 'FUT') THEN

                    -- TD#3569  commented and added 2008-Aug-01 Cognizant Technology Solutions
                    -- invest id for Futures now will be dummy

                    v_cusip := csm_common.get_dummy_invest_id;

                    /*

                    v_fut_month_year := blmbrg_common_pkg.get_bb_vrq_data(p_inVendor_product_id,
                                                                           p_inRequest_id,
                                                                           c_fut_month_year);

                    IF (v_fut_month_year IS NULL) THEN
                       RAISE e_fut_month_year_unknown;
                    END IF;

                    SELECT
                          SUBSTR(wmc_isr_id, 1, 6)  ||
                          DECODE( SUBSTR(v_fut_month_year,1,3),
                                  'JAN','A',
                                  'FEB','B',
                                  'MAR','C',
                                  'APR','D',
                                  'MAY','E',
                                  'JUN','F',
                                  'JUL','G',
                                  'AUG','H',
                                  'SEP','I',
                                  'OCT','J',
                                  'NOV','K',
                                  'DEC','L')      ||
                          SUBSTR(v_fut_month_year,length(v_fut_month_year))
                    INTO
                          v_cusip
                    FROM
                          issuer
                    WHERE
                          isr_id = p_inSec_data.isr_id;
                    */

                    -- TD#3569  Changes end

                    p_inSec_data.invest_id      :=  v_cusip;
                    p_inSec_data.invest_id_typ  :=  'D';

                ELSE
                    SELECT nvl(request_src,'UNK')
                    into v_request_src
                    from vendor_request
                    where request_id = p_inRequest_id;

                    IF  (v_cusip IS NOT NULL AND LENGTH(v_cusip) > 6) THEN

                        BEGIN

                            SELECT '1'
                              INTO v_dummy
                              FROM dual
                             WHERE EXISTS (SELECT invest_id
                                      FROM security_tbl
                                     WHERE invest_id = v_cusip
                                       AND sec_id <> p_inSec_data.sec_id);

                        EXCEPTION
                            WHEN NO_DATA_FOUND THEN

                                v_cusip_based := TRUE;

                        END;

                    END IF;

                    IF  (v_cusip_based and v_request_src != c_bmk_request_src) THEN

                        p_inSec_data.invest_id      :=  v_cusip;
                        p_inSec_data.invest_id_typ  :=  'C';

                    ELSIF (v_request_src = c_bmk_request_src) THEN
                        display_message('BMK Generic Dummy Invest Id');
                        p_inSec_data.invest_id      :=  get_def_csm_invest_id(
                                                            p_inSec_data.sec_typ1,
                                                            p_inSec_data.sec_typ2,
                                                            blmbrg_common_pkg.get_bb_vrq_data(p_inVendor_product_id,
                                                                                              p_inRequest_id,
                                                                                              c_id_cusip_id_num),
                                                            blmbrg_common_pkg.get_bb_vrq_data(p_inVendor_product_id,
                                                                                              p_inRequest_id,
                                                                                              c_opt_put_call)
                                                        );
                        p_inSec_data.invest_id_typ  :=  'D';
                     ELSE
                     display_message('BMK Dummy Invest Id');
                        p_inSec_data.invest_id      :=  get_def_csm_invest_id(
                                                            p_inSec_data.sec_typ1,
                                                            p_inSec_data.sec_typ2,
                                                            blmbrg_common_pkg.get_bb_vrq_data(p_inVendor_product_id,
                                                                                              p_inRequest_id,
                                                                                              c_id_cusip_id_num),
                                                            blmbrg_common_pkg.get_bb_vrq_data(p_inVendor_product_id,
                                                                                              p_inRequest_id,
                                                                                              c_opt_put_call)
                                                        );
                        p_inSec_data.invest_id_typ  :=  'D';

                    END IF;

                END IF;

            END IF;

            IF  (
                    p_inSec_data.sec_typ1               =  CSM_COMMON.BOND        AND
                    p_inSec_data.sec_typ2               =  CSM_COMMON.SWPI        AND
                    SUBSTR(p_inSec_data.invest_id,1,2)  =  'SL'                          -- Indiacates IRS
                )
            THEN

                p_inSec_data.invest_id_typ  :=  'D';

            END IF;

            --
            --  Nagesh S  03/15/2005 SWAPs NSS implementation
            --  Originally when a sec_TYP1 is NOT IN ( 'CMSTK', 'FUT', 'OPT')
            --  then SYM is made equal to Invest_id
            --  For Interest Rate Swaps we should not make it equal and use
            --  what is supplied by CSM defOts_sym. And hence IRS is excluded from the logic
            --
            --  PDeon  07/07/2005 TD1532 Part 1  Added FUND to not default to invest id
            --  GarciN 11/19/2009 TD4333 OPT, STKOPT, IDXOPT will default SYM to Invest ID
            --
            IF  (   p_inSec_data.sec_typ1 = 'OPT' AND  p_inSec_data.sec_typ2 in ('STKOPT','IDXOPT')) OR
                NOT (
                        (   p_inSec_data.sec_typ1 IN ( 'CMSTK', 'FUT', 'OPT','SWAP' )   )        OR
                        (   p_inSec_data.sec_typ1 = 'FUND' AND  p_inSec_data.sec_typ2 in ('CMSTK','BOND')) OR
                        (
                            p_inSec_data.sec_typ1               =  CSM_COMMON.BOND               AND
                            p_inSec_data.sec_typ2               =  CSM_COMMON.SWPI               AND
                            SUBSTR(p_inSec_data.invest_id,1,2)  =  'SL'
                        )
                    )
            THEN
                p_inSec_data.sym    :=  p_inSec_data.invest_id;

            END IF;

            IF  (p_inSec_data.sec_status_cd IS NULL) THEN

                p_inSec_data.sec_status_cd      :=  ' ';

            END IF;

            IF  (TRIM(p_inSec_data.maint_status_cd) IS NULL) THEN

                p_inSec_data.maint_status_cd    :=  'S';

            END IF;

            IF (p_inSec_data.mast_sec_id IS NULL) THEN

                p_inSec_data.mast_sec_id        :=  p_inSec_data.sec_id;

            END IF;

            IF (p_inSec_data.sec_class IS NULL) THEN

                p_inSec_data.sec_class          :=  'M';

            END IF;

        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('ext_default_csm_security:sec_id = '||p_inSec_data.sec_id);
            RAISE_APPLICATION_ERROR(-20090,'ext_default_csm_security : '||SQLERRM);

    END ext_default_csm_security;

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
    RETURN vendor_req_messages.column_value%TYPE
    IS

        v_column_value      vendor_req_messages.column_value%TYPE := NULL;
        v_sec_typ_id        vendor_request.sec_typ_id%TYPE        := NULL;
        v_asset_class       ref_rating.asset_class%TYPE           := NULL;
        v_flag              NUMBER                                := 0;

    BEGIN

        v_column_value  :=  p_column_value;

        IF (INSTR(p_column_value,'/',1,1) > 0) THEN

            v_column_value  :=  TRIM(SUBSTR(p_column_value,1,
                                    INSTR(p_column_value,'/',1,1)-1)
                                );
        END IF;

        --TD 2490    IgnatIV    03/29/2006
        IF
            (p_transformation_needed = 'Y') AND
            (
            (v_column_value = 'NA')   OR (v_column_value = 'N.A.') OR (v_column_value IS NULL)
            )
        THEN

            v_column_value  :=  'n/a';

        END IF;

        IF (INSTR(v_column_value,'(',1,1) > 0) THEN

            v_column_value  :=  TRIM(SUBSTR(v_column_value,1,
                                    INSTR(v_column_value,'(',1,1)-1)
                                );

        END IF;


        --TD  2582    IgnatIV    07/06/06
        --Translate invalid ratings to 'n/a'
        IF p_rating_srce_cd IS NOT NULL THEN
            BEGIN

                SELECT
                    sec_typ_id
                INTO
                    v_sec_typ_id
                FROM
                    vendor_request
                WHERE
                    request_id = p_request_id;

                v_asset_class := get_asset_class(v_sec_typ_id);

                SELECT
                    1
                INTO
                    v_flag
                FROM
                    dual
                WHERE EXISTS
                    (
                     SELECT
                         *
                     FROM
                         ref_rating
                     WHERE
                         rating_srce_cd = p_rating_srce_cd     AND
                         asset_class    = v_asset_class        AND
                         rating         = TO_CHAR(v_column_value)
                    );

                IF v_flag <> 1 THEN

                    v_column_value  :=  'n/a';

                END IF;

            EXCEPTION

                WHEN NO_DATA_FOUND THEN

                    v_column_value  :=  'n/a';
                    RETURN v_column_value;

                WHEN OTHERS THEN

                    RETURN v_column_value;

            END;

        END IF;

        RETURN v_column_value;

    END transform_ratings;


    /************************** wrap_sink_schd***********************************
    ***  Author:           NallaN
    ***  Date Created:     03-AUG-2005
    ***  Type:             Private
    ***  Purpose:          Wrapper function to call modify_sink_schd
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_sink_schd (
        p_inSink_schd               IN      vendor_rules_map.mnemonic%TYPE,
        p_inPct_sinker              IN      vendor_rules_map.mnemonic%TYPE,
        p_inAmt_issued              IN      vendor_rules_map.mnemonic%TYPE
    )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

    BEGIN

        display_message('In Wrap_sink_schd');

        RETURN(
            modify_sink_schd(
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_inSink_schd),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_inPct_sinker),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_inAmt_issued)
                )
            );

    END;

    /************************** wrap_factor_schd***********************************
    ***  Author:           NallaN
    ***  Date Created:     03-AUG-2005
    ***  Type:             Private
    ***  Purpose:          Wrapper function to call modify_factor_schd
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_factor_schd(
        p_inFactor_schd             IN      vendor_rules_map.mnemonic%TYPE,
        p_inMTG_factor_schd         IN      vendor_rules_map.mnemonic%TYPE,
        p_inCurr_factor             IN      vendor_rules_map.mnemonic%TYPE,
        p_inCurr_factor_dt          IN      vendor_rules_map.mnemonic%TYPE,
        p_inSec_id                  IN      vendor_rules_map.mnemonic%TYPE,
        p_inSec_typ_grp             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

        v_outstr  vendor_req_messages.column_value%TYPE := NULL;

        v_factor_schd      vendor_req_messages.column_value%TYPE :=
                               BLMBRG_COMMON_PKG.get_vrm_column_value(p_inFactor_schd);
        v_mtg_factor_schd  vendor_req_messages.column_value%TYPE :=
                               BLMBRG_COMMON_PKG.get_vrm_column_value(p_inMTG_factor_schd);

        c_pattern_match    VARCHAR2(7)     := ';2;0;2;';

    BEGIN

        display_message('In Wrap_factor_schd');
        -- Apply decode logic in rule

        IF DBMS_LOB.SUBSTR(v_factor_schd,7,1)  = c_pattern_match   THEN

           v_factor_schd := NULL;

        END IF;


        IF DBMS_LOB.SUBSTR(v_mtg_factor_schd,7,1)  = c_pattern_match   THEN

           v_mtg_factor_schd := NULL;

        END IF;


        RETURN(
            modify_factor_schd(
                v_factor_schd,
                v_mtg_factor_schd,
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_inCurr_factor),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_inCurr_factor_dt),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_inSec_id),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_inSec_typ_grp)
                )
            );

    END wrap_factor_schd;

    /************************** wrap_mulit_cpn_schd *****************************
    ***  Author:           NallaN
    ***  Date Created:     03-AUG-2005
    ***  Type:             Private
    ***  Purpose:          Wrapper function to call multi_cpn_schd
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_multi_cpn_schd (
        p_cpn_schd                  IN      vendor_rules_map.mnemonic%TYPE,
        p_mtg_hist_cpn              IN      vendor_rules_map.mnemonic%TYPE,
        p_cpn_typ                   IN      vendor_rules_map.mnemonic%TYPE,
        p_stepup_dt                 IN      vendor_rules_map.mnemonic%TYPE,
        p_issue_dt                  IN      vendor_rules_map.mnemonic%TYPE,
        p_stepup_cpn                IN      vendor_rules_map.mnemonic%TYPE,
        p_flt_cpn_hist              IN      vendor_rules_map.mnemonic%TYPE,
        p_last_refix_dt             IN      vendor_rules_map.mnemonic%TYPE,
        p_cpn_rt                    IN      vendor_rules_map.mnemonic%TYPE,
        p_prev_cpn_dt               IN      vendor_rules_map.mnemonic%TYPE,
        p_mtg_pay_delay             IN      vendor_rules_map.mnemonic%TYPE,
        p_mat_dt                    IN      vendor_rules_map.mnemonic%TYPE,
        p_cpn_asof_dt               IN      vendor_rules_map.mnemonic%TYPE,
        p_mtg_prev_cpn              IN      vendor_rules_map.mnemonic%TYPE,
        p_sec_id                    IN      vendor_rules_map.mnemonic%TYPE,
        p_int_acc_dt                IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN vendor_req_messages.column_value%TYPE
    AS
        --
        -- TD 2526 KampeTA added to handle N.A.
        --
        v_issue_dt       vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_issue_dt);
        v_last_refix_dt  vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_last_refix_dt);
        v_stepup_dt      vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_stepup_dt);
        v_cpn_rt         vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_cpn_rt);
        v_prev_cpn_dt    vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_prev_cpn_dt);
        v_mat_dt         vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_mat_dt);
        v_cpn_asof_dt    vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_cpn_asof_dt);
        v_mtg_prev_cpn   vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_mtg_prev_cpn);
        v_int_acc_dt     vendor_req_messages.column_value%TYPE := BLMBRG_COMMON_PKG.get_vrm_column_value(p_int_acc_dt);


        --
        -- TD 2526 KampeTA - this function was added to handle the N.A. values for multi_cpn_schd
        --
        FUNCTION check_for_NA (
            p_in_column_value       IN     vendor_req_messages.column_value%TYPE
        )
        RETURN vendor_req_messages.column_value%TYPE
        IS

        BEGIN
            IF  nvl(p_in_column_value, 'N.A.') = 'N.A.'  THEN

                RETURN NULL;

            ELSE

                RETURN p_in_column_value;

            END IF;


        END check_for_NA;

    BEGIN

        display_message('In Wrap_multi_cpn_schd');

        --
        -- TD 2526 - KampeTA - Commented out the old logic for issue_dt.
        -- New logic is performed in the call to modify_multi_cpn_schd below
        --
        /*
        -- Apply rule logic here
        IF  v_issue_dt IS NULL  THEN

            v_issue_dt := BLMBRG_COMMON_PKG.get_vrm_column_value(p_int_acc_dt);

        END IF;
        */

        --
        -- TD 2526 - KampeTA - this will check the VRM value for N.A.
        --
        v_issue_dt   := check_for_NA(v_issue_dt);
        v_int_acc_dt := check_for_NA(v_int_acc_dt);

        RETURN(
            modify_multi_cpn_schd(
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_cpn_schd),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_mtg_hist_cpn),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_cpn_typ),
                check_for_NA(v_stepup_dt),                                -- TD 2526 KampeTA added to handle N.A.
                nvl(v_issue_dt, v_int_acc_dt),                            -- TD 2526 KampeTA added to handle N.A.
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_stepup_cpn),
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_flt_cpn_hist),
                check_for_NA(v_last_refix_dt),                            -- TD 2526 KampeTA added to handle N.A.
                check_for_NA(v_cpn_rt),                                   -- TD 2526 KampeTA added to handle N.A.
                check_for_NA(v_prev_cpn_dt),                              -- TD 2526 KampeTA added to handle N.A.
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_mtg_pay_delay),
                check_for_NA(v_mat_dt),                                   -- TD 2526 KampeTA added to handle N.A.
                check_for_NA(v_cpn_asof_dt),                              -- TD 2526 KampeTA added to handle N.A.
                check_for_NA(v_mtg_prev_cpn),                             -- TD 2526 KampeTA added to handle N.A.
                BLMBRG_COMMON_PKG.get_vrm_column_value(p_sec_id)
                )
            );

    END wrap_multi_cpn_schd;


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
        p_sink_schd                 IN   vendor_req_messages.column_value%TYPE,
        p_pct_sinker                IN   vendor_req_messages.column_value%TYPE,
        p_amt_issued                IN   vendor_req_messages.column_value%TYPE
    )
    RETURN  vendor_req_messages.column_value%TYPE
    IS

        v_sink_schd         vendor_req_messages.column_trans_value%TYPE := NULL;

        v_cur_val           VARCHAR2(32767) := NULL;
        v_bulk_sep          CHAR(1);
        v_no_rows           PLS_INTEGER :=  0;
        v_no_dim            PLS_INTEGER :=  0;
        v_no_cols           PLS_INTEGER :=  0;
        v_price_val         NUMBER      :=  0;
        v_amt_val           NUMBER      :=  0;
        v_no_rows_new       PLS_INTEGER :=  0;                                  -- TD2603 HillD 5/23/2006

    BEGIN

        display_message('modify_sink_schd:');
        display_message('Original Sink-SCHD: '||SUBSTR(p_sink_schd,1,200));
        display_message('Sink-SCHD (Addtn): '||SUBSTR(p_sink_schd,201,200));

        v_cur_val   :=  p_sink_schd;

        v_bulk_sep  :=  NVL(SUBSTR(v_cur_val,1,1),c_def_bulk_sep);
        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,2,1));
        v_no_rows   :=  TO_NUMBER(
                            SUBSTR(
                            v_cur_val,
                            INSTR(v_cur_val,v_bulk_sep,1,2)+1,
                            INSTR(v_cur_val,v_bulk_sep,1,3)-
                                INSTR(v_cur_val,v_bulk_sep,1,2)-1
                        ));

        v_no_cols   :=  TO_NUMBER(SUBSTR(
                            v_cur_val,
                            INSTR(v_cur_val,v_bulk_sep,1,3)+1,
                            INSTR(v_cur_val,v_bulk_sep,1,4)-
                                INSTR(v_cur_val,v_bulk_sep,1,3)-1
                        ));

        display_message(
            'No. of rows: '||v_no_rows||
            '  No. of columns: '||v_no_cols);

        IF (v_no_rows = 0) THEN

            RETURN(NULL);

        END IF;

        IF  (v_cur_val IS NOT NULL AND v_no_rows > 0) THEN

            /*v_sink_schd :=  SUBSTR(
                                v_cur_val,
                                1,INSTR(v_cur_val,v_bulk_sep,1,3)
                            )||'3'||
                            v_bulk_sep;*/                               -- TD2603 HillD 5/23/2006

            v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,4));

            display_message('PCT Sinker is : '||p_pct_sinker);
            display_message('Amount issued is : '||p_amt_issued);

            LOOP

                IF (v_no_cols = 2) THEN

                    v_price_val :=  100;
                    v_amt_val   :=  TO_NUMBER(
                                        TRIM(
                                            SUBSTR(
                                                v_cur_val,
                                                INSTR(v_cur_val,v_bulk_sep,1,4)+1,
                                                INSTR(v_cur_val,v_bulk_sep,1,5)-
                                                INSTR(v_cur_val,v_bulk_sep,1,4)-1
                                            )
                                        )
                                    );

                ELSE

                    v_price_val :=  TO_NUMBER(
                                        TRIM(
                                            SUBSTR(
                                                v_cur_val,
                                                INSTR(v_cur_val,v_bulk_sep,1,4)+1,
                                                INSTR(v_cur_val,v_bulk_sep,1,5)-
                                                INSTR(v_cur_val,v_bulk_sep,1,4)-1
                                            )
                                        )
                                    );

                    v_amt_val   :=  TO_NUMBER(
                                        TRIM(
                                            SUBSTR(
                                                v_cur_val,
                                                INSTR(v_cur_val,v_bulk_sep,1,6)+1,
                                                INSTR(v_cur_val,v_bulk_sep,1,7)-
                                                INSTR(v_cur_val,v_bulk_sep,1,6)-1
                                            )
                                        )
                                    );

                END IF;

                IF (p_pct_sinker = 'Y') THEN

                    v_amt_val   :=  (v_amt_val/100)*TO_NUMBER(p_amt_issued);

                END IF;

                IF (nvl(v_amt_val,0) > 0) THEN                              -- TD2603 HillD 5/23/2006

                    -- only include non-zero rates
                    v_sink_schd     :=  v_sink_schd||
                                        SUBSTR(
                                            v_cur_val,
                                            2,
                                            INSTR(v_cur_val,v_bulk_sep,1,3)-1
                                        )||'3'||v_bulk_sep||
                                        LTRIM(TO_CHAR(v_price_val,'999999999999.0000'))||
                                        v_bulk_sep||'2'||v_bulk_sep||
                                        LTRIM(TO_CHAR(v_amt_val,'99999999999999.00'))||v_bulk_sep;

                    v_no_rows_new   :=  v_no_rows_new + 1;                  -- TD2603 HillD 5/23/2006

                END IF;

                v_cur_val       :=  SUBSTR(
                                        v_cur_val,
                                        INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols+1)
                                    );

                display_message('Current val is '||SUBSTR(v_cur_val,1,200));
                display_message('Cur val (addn.) is '||SUBSTR(v_sink_schd,1,200));

                EXIT WHEN (TRIM(v_cur_val) IS NULL OR TRIM(v_cur_val) = c_sep);

            END LOOP;

            IF (v_no_rows_new > 0) THEN                                     -- TD2603 HillD 5/23/2006

                -- prepend the header information
                v_sink_schd :=  v_bulk_sep||v_no_dim||v_bulk_sep||v_no_rows_new||
                                v_bulk_sep||TO_CHAR(3)||v_bulk_sep||v_sink_schd;

            ELSE

                v_sink_schd :=  NULL;

            END IF;

        END IF;

        display_message('Modified data sink-SCHD:'||SUBSTR(v_sink_schd,1,200));
        display_message('Sink-SCHD (addn. data):'||SUBSTR(v_sink_schd,201,200));

        RETURN(v_sink_schd);

    EXCEPTION
        WHEN OTHERS THEN

            display_message('modify_sink_schd:'|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20080,'modify_sink_schd:'||SQLERRM);

    END modify_sink_schd;

    /************************** get_dt_mtg_pay_delay ***************************
     ***  Author:           MahadS
     ***  Date Created:     02 May 2003
     ***  Type:             Public
     ***  Purpose:          This functions gets date adjusted to mtg_pay_delay
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_dt_mtg_pay_delay (
        p_inDate                    IN      vendor_req_messages.column_value%TYPE,
        p_inMtg_pay_delay           IN      PLS_INTEGER
    )
    RETURN VARCHAR2
    IS

        v_dt    VARCHAR2(12)    :=  NULL;

    BEGIN

        display_message('Begin: get_dt_mtg_pay_delay ');

        IF (p_inMtg_pay_delay > 30) THEN

            v_dt    :=  TO_CHAR(
                            TO_DATE(p_inDate,'YYYYMMDD') -
                                (
                                    LAST_DAY(ADD_MONTHS(LAST_DAY(SYSDATE)+1,-2)
                                ) -
                                ADD_MONTHS(LAST_DAY(SYSDATE)+1,-2)+1
                            ) -
                            p_inMtg_pay_delay+30,
                            'YYYYMMDD'
                        );

        ELSE

            v_dt    :=  TO_CHAR(TO_DATE(p_inDate,'YYYYMMDD')-p_inMtg_pay_delay,'YYYYMMDD');

        END IF;

        display_message('End: get_dt_mtg_pay_delay ');

        RETURN  v_dt;

    END get_dt_mtg_pay_delay;

    /************************** reverse_schedule ********************************
     ***  Author:           MahadS
     ***  Date Created:     26 Jan 2005
     ***  Type:             Public
     ***  Purpose:          This functions reverses rows in a schedule
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION reverse_schedule(
        p_inSchd                    IN      vendor_req_messages.column_value%TYPE,
        p_inBBind                   IN      VARCHAR2
    )
    RETURN  VARCHAR2 -- CLOB Changes NallaN
    IS

        v_schd              vendor_req_messages.column_value%TYPE   :=  NULL;
        v_cur_val           VARCHAR2(32767)   :=  NULL;
        v_bulk_sep          VARCHAR2(1);

    BEGIN

        display_message('reverse_schedule(): Trying to reverse the schedule ');
        v_bulk_sep  :=  NVL(SUBSTR(p_inSchd,1,1),c_def_bulk_sep);

        IF (p_inSchd IS NOT NULL) THEN

             v_cur_val   :=  p_inSchd;

             v_schd      :=  SUBSTR(
                                     v_cur_val, 1,
                                     INSTR(v_cur_val, v_bulk_sep, 1, 4)
                                   );

             v_cur_val      :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,5));

             LOOP


                 v_schd      :=  v_schd||
                                     SUBSTR(
                                         p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,4)+1,
                                         2
                                     )||
                                     SUBSTR(
                                        v_cur_val,INSTR(v_cur_val,v_bulk_sep,-1,4)+1,
                                        INSTR(v_cur_val,v_bulk_sep,-1,3)-
                                            INSTR(v_cur_val,v_bulk_sep,-1,4)-1
                                     )||';'||p_inBBind||';'||
                                     SUBSTR(
                                         v_cur_val,INSTR(v_cur_val,v_bulk_sep,-1,2)+1,
                                         INSTR(v_cur_val,v_bulk_sep,-1,1)-
                                             INSTR(v_cur_val,v_bulk_sep,-1,2)
                                     );

                 v_cur_val   :=  SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,-1,5)+1);

                 display_message('Current val is '||SUBSTR(v_cur_val,1,200));
                 display_message('Schedule is '||SUBSTR(v_schd,1,200));

                 EXIT WHEN (TRIM(v_cur_val) IS NULL OR TRIM(v_cur_val) = ';');

             END LOOP;

        END IF;

        RETURN v_schd;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'reverse_schedule:'||
                SUBSTR(SQLERRM,1,200)
            );
            RAISE_APPLICATION_ERROR(
                -20080,
                'reverse_schedule: '||SQLERRM
            );

    END reverse_schedule;

    /************************** reshuffle_rows_mcs ***************************
     ***  Author:           MahadS
     ***  Date Created:     24 Feb 2003
     ***  Type:             Public
     ***  Purpose:          This functions reshuffles rows in the MCS
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION reshuffle_rows_mcs(
        p_inSchd                    IN      vendor_req_messages.column_value%TYPE,
        p_inDated_dt                IN      vendor_req_messages.column_value%TYPE,
        p_inMtg_pay_delay           IN      PLS_INTEGER,
        p_inCpn_rt                  IN      vendor_req_messages.column_value%TYPE,
        p_inMat_dt                  IN      vendor_req_messages.column_value%TYPE,
        p_inOrder                   IN      PLS_INTEGER,
        p_inCpn_asof_dt             IN      vendor_req_messages.column_value%TYPE,
        p_inMtg_prev_cpn            IN      vendor_req_messages.column_value%TYPE,
        p_inPrev_cpn_dt             IN      vendor_req_messages.column_value%TYPE,
        p_inSec_id                  IN      security_tbl.sec_id%TYPE
    )
    RETURN vendor_req_messages.column_value%TYPE
    IS

        v_cpn_schd          vendor_req_messages.column_value%TYPE   :=  NULL;
        v_cur_val           VARCHAR2(32767)   :=  NULL;
        v_bulk_sep          VARCHAR2(1);
        v_dt                VARCHAR2(20);
        v_cpn_rt            VARCHAR2(20);
        v_cnt               PLS_INTEGER :=  0;

        v_idr_cpn_schd      vendor_req_messages.column_value%TYPE   :=  NULL;
        v_idr_last_cpn_rt   vendor_req_messages.column_value%TYPE   :=  NULL;
        v_idr_last_cpn_dt   vendor_req_messages.column_value%TYPE   :=  NULL;
        v_max_cpn_dt        vendor_req_messages.column_value%TYPE   :=  NULL;
        v_mtg_prev_cpn      vendor_req_messages.column_value%TYPE   :=  NULL;
        v_pv_cpn_dt         vendor_req_messages.column_value%TYPE   :=  NULL;

    BEGIN

        display_message('reshuffle_rows_mcs(): Trying to resuffle multi-cpn-schedule ');
        v_bulk_sep  :=  NVL(SUBSTR(p_inSchd,1,1),c_def_bulk_sep);

        IF (p_inSchd IS NOT NULL) THEN

            IF (p_inOrder = 1) THEN --  multi_cpn_schd

                v_cur_val   :=  p_inSchd;
                v_cpn_schd  :=  SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,4));

                v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,4));
                v_dt        :=  p_inDated_dt;

                LOOP

                    v_cpn_schd  :=  v_cpn_schd||
                                        SUBSTR(
                                            v_cur_val,2,
                                            INSTR(v_cur_val,v_bulk_sep,1,2)-1
                                        )||v_dt||
                                        SUBSTR(
                                            v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,3),
                                            INSTR(v_cur_val,v_bulk_sep,1,5)-
                                                INSTR(v_cur_val,v_bulk_sep,1,3)+1
                                        );

                    v_dt        :=  SUBSTR(
                                        v_cur_val,
                                        INSTR(v_cur_val,v_bulk_sep,1,2)+1,
                                        INSTR(v_cur_val,v_bulk_sep,1,3)-
                                            INSTR(v_cur_val,v_bulk_sep,1,2)-1
                                    );

                    v_cpn_rt    :=  SUBSTR(
                                        v_cur_val,
                                        INSTR(v_cur_val,v_bulk_sep,1,4)+1,
                                        INSTR(v_cur_val,v_bulk_sep,1,5)-
                                            INSTR(v_cur_val,v_bulk_sep,1,4)-1
                                    );

                    v_cpn_rt    :=  LTRIM(
                                        TO_CHAR(TO_NUMBER(v_cpn_rt),'999999999999.0000')
                                    );

                    v_dt        :=  get_dt_mtg_pay_delay(v_dt, p_inMtg_pay_delay);

                    display_message('Date is '||v_dt);

                    v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,5));

                    display_message('Current val is '||SUBSTR(v_cur_val,1,200));
                    display_message('MLTSCHD is '||SUBSTR(v_cpn_schd,1,200));

                    EXIT WHEN (TRIM(v_cur_val) IS NULL OR TRIM(v_cur_val) = ';');

                END LOOP;

                IF (v_dt != p_inMat_dt) THEN

                    IF ( p_inCpn_rt IS NOT NULL     AND
                         TO_NUMBER(v_cpn_rt) != LTRIM(TO_CHAR(TO_NUMBER(p_inCpn_rt),'999999999999.0000'))
                       )
                    THEN

                        v_cpn_schd  :=  v_cpn_schd||
                                            SUBSTR(
                                                p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,4)+1,
                                                INSTR(p_inSchd,v_bulk_sep,1,5)-
                                                    INSTR(p_inSchd,v_bulk_sep,1,4)
                                            )||v_dt||
                                            SUBSTR(
                                                p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,6),
                                                INSTR(p_inSchd,v_bulk_sep,1,7)-
                                                    INSTR(p_inSchd,v_bulk_sep,1,6)+1
                                            )||
                                            LTRIM(
                                                TO_CHAR(TO_NUMBER(p_inCpn_rt),'999999999999.0000')
                                            )||v_bulk_sep;

                    END IF;

                END IF;

                display_message('Final MLTSCHD is '||SUBSTR(v_cpn_schd,1,200));

          ELSIF (p_inOrder = 0) THEN -- MTG_HIST_CPN

                v_cur_val   :=  p_inSchd;

                v_cnt       :=  TO_NUMBER(
                                    SUBSTR(
                                        v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,2)+1,
                                        INSTR(v_cur_val,v_bulk_sep,1,3)-
                                            INSTR(v_cur_val,v_bulk_sep,1,2)-1
                                    )
                                );

                v_max_cpn_dt := SUBSTR(
                                        v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,5)+1,
                                        INSTR(v_cur_val,v_bulk_sep,1,6)-
                                            INSTR(v_cur_val,v_bulk_sep,1,5)-1
                                );

                display_message('Count is: '||v_cnt);

                v_cur_val      :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,5));
                v_cpn_rt       :=  LTRIM(TO_CHAR(TO_NUMBER(p_inCpn_rt),'999999999999.0000'));
                v_mtg_prev_cpn :=  LTRIM(TO_CHAR(TO_NUMBER(p_inMtg_prev_cpn),'999999999999.0000'));
                v_dt           :=  p_inDated_dt;

                LOOP

                    v_cpn_schd  :=  v_cpn_schd||
                                        SUBSTR(
                                            p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,4)+1,
                                            2
                                        )||v_dt||';3;'||
                                        SUBSTR(
                                            v_cur_val,INSTR(v_cur_val,v_bulk_sep,-1,2)+1,
                                            INSTR(v_cur_val,v_bulk_sep,-1,1)-
                                                INSTR(v_cur_val,v_bulk_sep,-1,2)
                                        );

                    v_dt        :=  SUBSTR(
                                        v_cur_val,INSTR(v_cur_val,v_bulk_sep,-1,4)+1,
                                        INSTR(v_cur_val,v_bulk_sep,-1,3)-
                                            INSTR(v_cur_val,v_bulk_sep,-1,4)-1
                                    );

                    v_dt        :=  get_dt_mtg_pay_delay(v_dt, p_inMtg_pay_delay);

                    display_message('Date is '||v_dt);

                    v_cur_val   :=  SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,-1,5)+1);

                    display_message('Current val is '||SUBSTR(v_cur_val,1,200));
                    display_message('MLTSCHD is '||SUBSTR(v_cpn_schd,1,200));

                    EXIT WHEN (TRIM(v_cur_val) IS NULL OR TRIM(v_cur_val) = ';');

                END LOOP;

                IF    (
                        p_inCpn_asof_dt = v_max_cpn_dt
                      )
                THEN
                      v_cpn_schd  :=  v_cpn_schd||
                                           SUBSTR(
                                               p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,4)+1,
                                               INSTR(p_inSchd,v_bulk_sep,1,5)-
                                                   INSTR(p_inSchd,v_bulk_sep,1,4)
                                           )||v_dt||';3;'||v_cpn_rt||v_bulk_sep;
                      v_cnt       :=  v_cnt + 1;

                ELSIF (p_inCpn_asof_dt > v_max_cpn_dt) THEN
                      v_cpn_schd  :=  v_cpn_schd||
                                           SUBSTR(
                                               p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,4)+1,
                                               INSTR(p_inSchd,v_bulk_sep,1,5)-
                                                   INSTR(p_inSchd,v_bulk_sep,1,4)
                                           )||v_dt||';3;'||v_mtg_prev_cpn||v_bulk_sep;
                      v_cnt       :=  v_cnt + 1;

                      v_pv_cpn_dt :=  get_dt_mtg_pay_delay(p_inPrev_cpn_dt, p_inMtg_pay_delay);
                      v_cpn_schd  :=  v_cpn_schd||
                                           SUBSTR(
                                               p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,4)+1,
                                               INSTR(p_inSchd,v_bulk_sep,1,5)-
                                                   INSTR(p_inSchd,v_bulk_sep,1,4)
                                           )||v_pv_cpn_dt||';3;'||v_cpn_rt||v_bulk_sep;
                      v_cnt       :=  v_cnt + 1;

                ELSIF (p_inCpn_asof_dt < v_max_cpn_dt) THEN

                      IF   (TO_NUMBER(v_max_cpn_dt) - TO_NUMBER(p_inCpn_asof_dt) <= 4)
                      THEN
                            v_cpn_schd  :=  v_cpn_schd||
                                                 SUBSTR(
                                                     p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,4)+1,
                                                     INSTR(p_inSchd,v_bulk_sep,1,5)-
                                                         INSTR(p_inSchd,v_bulk_sep,1,4)
                                                 )||v_dt||';3;'||v_cpn_rt||v_bulk_sep;
                            v_cnt       :=  v_cnt + 1;

                      END IF;

                END IF;

                v_cpn_schd  :=  SUBSTR(p_inSchd,1, INSTR(p_inSchd,v_bulk_sep,1,2))||
                                v_cnt||
                                SUBSTR(
                                       p_inSchd,INSTR(p_inSchd,v_bulk_sep,1,3),
                                           INSTR(p_inSchd,v_bulk_sep,1,2)
                                )||v_cpn_schd;

                display_message('Final MLTSCHD is '||SUBSTR(v_cpn_schd,1,200));

            END IF;

        END IF;

        RETURN v_cpn_schd;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'reshuffle_rows_mcs:'||
                SUBSTR(SQLERRM,1,200)
            );
            RAISE_APPLICATION_ERROR(
                -20080,
                'reshuffle_rows_mcs: '||SQLERRM
            );

    END reshuffle_rows_mcs;

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
        P_inColumn_order            IN      PLS_INTEGER  DEFAULT 0
    )

    RETURN vendor_req_messages.column_value%TYPE
    IS
        v_fact_schd                 VARCHAR2(32767)                       := NULL;
        v_bulk_sep                  VARCHAR2(1);
        v_no_rows                   PLS_INTEGER                           := 0;
        v_cur_val                   VARCHAR2(32767)                       := NULL;
        v_next_set                  VARCHAR2(32767)                       := NULL;
        v_dt                        VARCHAR2(32767)                       := NULL;

    BEGIN

        display_message('trim_factor_schd:');

        v_bulk_sep  :=  NVL(SUBSTR(p_inFactor_schd,1,1),c_def_bulk_sep);

        IF    LENGTH(p_inFactor_schd) <= 3900
        THEN
              return p_inFactor_schd;
        END IF;

        IF p_inFactor_schd IS NOT NULL
        THEN
            v_cur_val  :=  SUBSTR(
                                   p_inFactor_schd,INSTR(p_inFactor_schd,v_bulk_sep,1,4)+1
                                 );

            LOOP
                  IF    p_inColumn_order = 1
                  THEN

                        v_next_set   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,-1,5)+1,
                                              length(v_cur_val)- INSTR(v_cur_val,v_bulk_sep,-1,5)
                                         );

                        v_cur_val    :=  SUBSTR(v_cur_val,
                                             1,INSTR(v_cur_val,v_bulk_sep,-1,5)
                                         );
                  ELSE

                        v_next_set   :=  SUBSTR(v_cur_val,1,
                                              INSTR(v_cur_val,v_bulk_sep,1,4)
                                         );

                        v_cur_val    :=  SUBSTR(v_cur_val,
                                             INSTR(v_cur_val,v_bulk_sep,1,4)+1
                                         );
                  END IF;

                  v_dt         :=  SUBSTR(v_next_set, INSTR(v_next_set,v_bulk_sep,1,1)+1,
                                              INSTR(v_next_set,v_bulk_sep,1,2)-
                                              INSTR(v_next_set,v_bulk_sep,1,1)-1
                                         );


                  EXIT WHEN (
                                SUBSTR(v_dt,1,6) > TO_CHAR(SYSDATE,'YYYYMM')
                            );

                  IF   p_inColumn_order = 0
                  THEN

                       v_fact_schd   :=  v_fact_schd||v_next_set;
                  ELSE

                       v_fact_schd   :=  v_next_set||v_fact_schd;
                  END IF;

                  v_no_rows     :=  v_no_rows + 1;

                  IF   v_no_rows > 12
                  THEN
                       IF   p_inColumn_order = 0
                       THEN
                            v_fact_schd  :=  SUBSTR(
                                                    v_fact_schd,INSTR(v_fact_schd,v_bulk_sep,1,4)+1
                                                   );

                       ELSE
                            v_fact_schd  :=  SUBSTR(
                                                    v_fact_schd,1,INSTR(v_fact_schd,v_bulk_sep,-1,5)
                                                   );

                       END IF;
                       v_no_rows    :=  v_no_rows - 1;
                  END IF;

                  EXIT WHEN (
                               TRIM(v_cur_val) IS NULL       OR
                               TRIM(v_cur_val) = ';'
                            );

            END LOOP;

        END IF;

        IF  v_fact_schd IS NOT NULL
        THEN
            v_fact_schd  :=  v_bulk_sep||'2'||v_bulk_sep||v_no_rows||v_bulk_sep||
                             '2'||v_bulk_sep||v_fact_schd;
        END IF;

        display_message('Final factor schd:'||SUBSTR(v_fact_schd,1,200));
        display_message('Final factor schd (addn. data):'||SUBSTR(v_fact_schd,201,200));

        RETURN    v_fact_schd;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'trim_factor_schd:'|| SUBSTR(SQLERRM,1,200)
            );
            RAISE_APPLICATION_ERROR(
                -20080,
                'trim_factor_schd:'||SQLERRM
            );

    END trim_factor_schd;

    /************************** get_rows_in_schedule ***************************
     ***  Author:           MahadS
     ***  Date Created:     24 Feb 2003
     ***  Type:             Public
     ***  Purpose:          This functions determines no. of rows in the schedule
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_rows_in_schedule (
        p_inSchd                    IN      vendor_req_messages.column_value%TYPE
    )
    RETURN PLS_INTEGER
    IS

        v_no_rows           PLS_INTEGER     :=  0;

    BEGIN

        IF (p_inSchd IS NOT NULL) THEN

            v_no_rows   :=  NVL(
                                TO_NUMBER(
                                    SUBSTR(
                                        p_inSchd, INSTR(p_inSchd, c_def_bulk_sep, 1, 2)+1,(
                                            INSTR(p_inSchd, c_def_bulk_sep, 1, 3)-(
                                                INSTR(p_inSchd, c_def_bulk_sep, 1, 2)+1
                                                )
                                            )
                                        )
                                    ),
                                '0'
                            );
        END IF;

        RETURN v_no_rows;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'get_rows_in_schedule:'||
                SUBSTR(SQLERRM,1,200)
            );
            RAISE_APPLICATION_ERROR(
                -20080,
                'get_rows_in_schedule:'||SQLERRM
            );

    END get_rows_in_schedule;

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
    RETURN BOOLEAN
    IS

        v_cur_val           VARCHAR2(32767);
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(200);
        v_price_val         NUMBER  :=  0;
        v_return_val        BOOLEAN :=  FALSE;

    BEGIN

        display_message('chk_mcs_cpn_rt:');
        IF (p_mcs_value IS NULL) THEN

            RETURN v_return_val;

        END IF;

        v_cur_val   :=  p_mcs_value;
        v_bulk_sep  :=  SUBSTR(v_cur_val,1,1);
        v_cur_val   :=  SUBSTR(v_cur_val,2);

        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        display_message('Curr data value is: '||v_cur_val);
        display_message(
            'No. of rows: '||v_no_rows||
            ', No. of cols:' ||v_no_cols||
            ', No. of dim:'||v_no_dim
        );

        LOOP

            v_row_data  :=  SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols));
            v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1);

            v_price_val :=  TO_NUMBER(
                                TRIM(
                                    SUBSTR(
                                        v_row_data,
                                        INSTR(v_row_data,v_bulk_sep,1,3)+1,
                                        INSTR(v_row_data,v_bulk_sep,1,4)-1-
                                            INSTR(v_row_data,v_bulk_sep,1,3)
                                    )
                                )
                            );

            IF  (v_price_val > p_cpn_rt) THEN

                RETURN TRUE;

            END IF;

            display_message('Row data is: '||v_row_data);
            EXIT WHEN (TRIM(v_cur_val) IS NULL);

        END LOOP;

        RETURN v_return_val;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('chk_mcs_cpn_rt:'|| SUBSTR(SQLERRM,1,200));
            RAISE_APPLICATION_ERROR(-20080,'chk_mcs_cpn_rt:'||SQLERRM);

    END chk_mcs_cpn_rt;

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
    RETURN vendor_req_messages.column_value%TYPE
    IS

        v_cur_val           VARCHAR2(32767);
        v_ret_val           VARCHAR2(32767) := NULL;
        v_bulk_sep          CHAR(1);
        v_curr_set          VARCHAR2(200);
        v_no_rows           PLS_INTEGER := 0;

    BEGIN
        display_message('rem_null_from_schd:');
        v_bulk_sep  :=  NVL(SUBSTR(p_inSchd_data,1,1),c_def_bulk_sep);

        IF p_inSchd_data IS NOT NULL
        THEN
           v_ret_val  :=  SUBSTR(
                                 p_inSchd_data ,INSTR(p_inSchd_data, v_bulk_sep,1,1),
                                 INSTR(p_inSchd_data,v_bulk_sep,1,4)
                                );

           v_cur_val  :=  SUBSTR(
                                 p_inSchd_data,INSTR(p_inSchd_data,v_bulk_sep,1,4)+1
                                );

           LOOP
                v_curr_set  :=  SUBSTR(v_cur_val,1,
                                        INSTR(v_cur_val,v_bulk_sep,1,4)
                                       );

                IF   TRIM(SUBSTR(v_curr_set, INSTR(v_curr_set,v_bulk_sep,1,1)+1,
                          INSTR(v_curr_set,v_bulk_sep,1,2)-INSTR(v_curr_set,v_bulk_sep,1,1)-1)) IS NOT NULL AND
                     TRIM(SUBSTR(v_curr_set, INSTR(v_curr_set,v_bulk_sep,1,3)+1,
                          INSTR(v_curr_set,v_bulk_sep,1,4)-INSTR(v_curr_set,v_bulk_sep,1,3)-1)) IS NOT NULL
                THEN
                     v_no_rows := v_no_rows + 1;
                     v_ret_val := v_ret_val || v_curr_set;
                END IF;
                v_cur_val      := SUBSTR(v_cur_val,
                                         INSTR(v_cur_val,v_bulk_sep,1,4)+1
                                        );
                EXIT WHEN (TRIM(v_cur_val) IS NULL OR TRIM(v_cur_val) = ';');
           END LOOP;
           IF (v_no_rows = 0) THEN
              v_ret_val := NULL;
           ELSE
              v_ret_val := SUBSTR(v_ret_val,1,3)||v_no_rows||
                           SUBSTR(v_ret_val, INSTR(v_ret_val,v_bulk_sep,1,3));
           END IF;
        END IF;

        display_message('Final schd data:'||SUBSTR(v_ret_val,1,200));
        display_message('Final schd addn. data:'||SUBSTR(v_ret_val,201,200));

        RETURN  v_ret_val;
    EXCEPTION
        WHEN OTHERS THEN
            display_message(
                'rem_null_from_schd:'|| SUBSTR(SQLERRM,1,200)
            );
            RAISE_APPLICATION_ERROR(
                -20080,
                'rem_null_from_schd:'||SQLERRM
            );
    END rem_null_from_schd;

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
        p_sec_id                    IN      vendor_req_messages.column_value%TYPE
    )
    RETURN vendor_req_messages.column_value%TYPE
    IS

        v_cpn_schd                  vendor_req_messages.column_value%TYPE := NULL;
        v_new_cpn_dt                vendor_req_messages.column_value%TYPE := NULL;  -- TD2603 HillD 5/22/2006
        v_new_cpn_schd              vendor_req_messages.column_value%TYPE := NULL;
        v_idr_cpn_schd              vendor_req_messages.column_value%TYPE := NULL;
        v_dated_dt                  vendor_req_messages.column_value%TYPE := NULL;
        v_idr_last_cpn_rt           vendor_req_messages.column_value%TYPE := NULL;
        v_idr_last_cpn_dt           vendor_req_messages.column_value%TYPE := NULL;
        v_mtg_pay_delay             PLS_INTEGER;

        v_ctr                       PLS_INTEGER := 0;
        v_no_rows                   PLS_INTEGER := 0;
        v_bulk_sep                  VARCHAR2(1);
        v_dt                        VARCHAR2(20);

    BEGIN

        display_message('modify_multi_cpn_schd:');

        display_message('Cpn_typ is : '||p_cpn_typ);
        display_message('Mtg. Pay delay is :'||p_mtg_pay_delay);

        v_mtg_pay_delay :=  TO_NUMBER(NVL(TRIM(REPLACE(p_mtg_pay_delay,'DAYS',NULL)),'0'));

        v_dated_dt := p_issue_dt;

        display_message('Dated_dt is: '||v_dated_dt);
        display_message('CPN_RT is: '||p_cpn_rt);

        -- Get /change CPY_TYPE from DES_NOTES - Ross B. to provide info
        -- MTG_PAY_DELAY is applied to all except FLOATING and STEPUP CPN

        -- Add this check after confirming with Ross
        --IF (p_cpn_typ LIKE c_fixed_cpn_typ OR p_cpn_typ LIKE c_zero_cpn_typ) THEN
            --RETURN v_cpn_schd; -- NULL MCS
        --END IF;

        v_bulk_sep  :=  NVL(SUBSTR(p_cpn_schd,1,1),c_def_bulk_sep);

        IF (get_rows_in_schedule(p_flt_cpn_hist) > 0) THEN

            display_message(
                'Original FLT-CPN-HIST: '||SUBSTR(p_flt_cpn_hist,1,200)
            );

            v_cpn_schd  :=  rem_null_from_schd(p_flt_cpn_hist);

        ELSIF (get_rows_in_schedule(p_mtg_hist_cpn) > 0) THEN

            display_message(
                'Original MTG-HIST-CPN: '||
                SUBSTR(p_mtg_hist_cpn,1,200)
            );

            v_cpn_schd  :=  reshuffle_rows_mcs(
                                p_mtg_hist_cpn,
                                v_dated_dt,
                                v_mtg_pay_delay,
                                p_cpn_rt,
                                p_mat_dt,
                                0,
                                p_cpn_asof_dt,
                                p_mtg_prev_cpn,
                                p_prev_cpn_dt,
                                TO_NUMBER(p_sec_id)
                            );

        ELSIF (get_rows_in_schedule(p_cpn_schd) > 0) THEN

            display_message(
                'Original MLT-CPN-SCHD: '||
                SUBSTR(p_cpn_schd,1,200)
            );

            v_cpn_schd  :=  reshuffle_rows_mcs(
                                p_cpn_schd,
                                v_dated_dt,
                                v_mtg_pay_delay,
                                p_cpn_rt,
                                p_mat_dt,
                                1,
                                p_cpn_asof_dt,
                                p_mtg_prev_cpn,
                                p_prev_cpn_dt,
                                TO_NUMBER(p_sec_id)
                            );

        END IF;

        IF (get_rows_in_schedule(v_cpn_schd) <= 0 OR chk_mcs_cpn_rt(v_cpn_schd, 200)) THEN

            IF (p_cpn_typ LIKE '%STEP CPN%'  OR  p_cpn_typ LIKE '%INTER. APPRECIATION%') THEN   --Changes added by Manisha 04/05/07

                v_ctr   :=  0;
                display_message('Stepup Dt is : '||p_stepup_dt);
                display_message('Stepup Cpn is : '||p_stepup_cpn);

                IF (p_stepup_dt IS NOT NULL AND p_stepup_cpn IS NOT NULL) THEN

                    IF (TO_DATE(p_stepup_dt,'YYYYMMDD') > SYSDATE) THEN

                        IF (v_dated_dt IS NOT NULL) THEN

                            v_cpn_schd  :=  '5;'||v_dated_dt||';3;'||p_cpn_rt||';';
                            v_ctr       :=  v_ctr + 1;

                        END IF;

                        v_cpn_schd  :=  v_cpn_schd||'5;'||p_stepup_dt||';3;'||p_stepup_cpn||';';
                        v_ctr       :=  v_ctr + 1;

                    ELSE

                        IF (v_dated_dt IS NOT NULL) THEN

                            v_cpn_schd  :=  '5;'||v_dated_dt||';3;0.0000;';
                            v_ctr       :=  v_ctr + 1;

                        END IF;

                        v_cpn_schd  :=  v_cpn_schd||'5;'||p_stepup_dt||';3;'||p_cpn_rt||';';
                        v_ctr       :=  v_ctr + 1;

                    END IF;

                END IF;

                IF (v_ctr > 0) THEN

                    v_cpn_schd  :=  ';2;'||v_ctr||';2;'||v_cpn_schd;

                END IF;

            END IF;

        END IF;

        display_message('Modified data MCpn-SCHD:'||SUBSTR(v_cpn_schd,1,200));
        display_message('MCpn-SCHD (addn. data):'||SUBSTR(v_cpn_schd,201,200));

        IF (get_rows_in_schedule(v_cpn_schd) <= 0 OR chk_mcs_cpn_rt(v_cpn_schd, 200)) THEN

            v_dt    :=  NULL;
            display_message('Sec_id is :'||p_sec_id);

            v_idr_cpn_schd      :=  get_bulk_data(TO_NUMBER(p_sec_id), c_multi_cpn_schd_name);
            v_idr_last_cpn_rt   :=  SUBSTR(
                                        v_idr_cpn_schd,INSTR(v_idr_cpn_schd,v_bulk_sep,-1,2)+1,
                                        (
                                            INSTR(v_idr_cpn_schd,v_bulk_sep,-1,1)-
                                                INSTR(v_idr_cpn_schd,v_bulk_sep,-1,2)-1
                                        )
                                    );

            v_idr_last_cpn_dt   :=  SUBSTR(
                                        v_idr_cpn_schd,INSTR(v_idr_cpn_schd,v_bulk_sep,-1,4)+1,
                                        (
                                            INSTR(v_idr_cpn_schd,v_bulk_sep,-1,3)-
                                                INSTR(v_idr_cpn_schd,v_bulk_sep,-1,4)-1
                                        )
                                    );

            display_message('Coupon rate is :'||p_cpn_rt);

            -- if new rate then determine the rate date.
            IF (p_cpn_rt IS NOT NULL AND
                LTRIM(TO_CHAR(TO_NUMBER(p_cpn_rt),'999999999999.0000')) <>
                LTRIM(TO_CHAR(NVL(TO_NUMBER(v_idr_last_cpn_rt),100000000),'999999999999.0000')))
            THEN
            display_message('Last refix date is :'||p_last_refix_dt);

                IF ( p_last_refix_dt   IS NOT NULL  AND
                     p_last_refix_dt > NVL(v_idr_last_cpn_dt,'19000101'))
                THEN
                    v_dt:=get_dt_mtg_pay_delay(p_last_refix_dt, 0);
                ELSE
                    display_message('Prev. coupon date is :'||p_prev_cpn_dt);
                    IF ( p_prev_cpn_dt IS NOT NULL AND
                        p_prev_cpn_dt > NVL(v_idr_last_cpn_dt,'19000101'))
                    THEN
                        v_dt:=get_dt_mtg_pay_delay(p_prev_cpn_dt, v_mtg_pay_delay);
                    ELSE
                        IF ( TO_CHAR(SYSDATE,'YYYYMMDD') > NVL(v_idr_last_cpn_dt,'19000101') )
                        THEN
                            v_dt:=get_dt_mtg_pay_delay(TO_CHAR(SYSDATE,'YYYYMMDD'), 0);
                        END IF;
                    END IF;
                END IF;
            END IF;

            IF (v_dt IS NOT NULL AND p_cpn_rt IS NOT NULL) THEN

                v_new_cpn_dt    :=  TO_CHAR(5)||v_bulk_sep||v_dt||v_bulk_sep;                       -- TD2603 HillD 5/22/2006
                v_new_cpn_schd  :=  v_new_cpn_dt||TO_CHAR(3)||v_bulk_sep||                          -- TD2603 HillD 5/22/2006
                                        LTRIM(TO_CHAR(TO_NUMBER(p_cpn_rt),'999999999999.0000'))||
                                        v_bulk_sep;

                display_message('New Schd. is :'||v_new_cpn_schd);

                IF (NVL(INSTR(v_idr_cpn_schd,v_new_cpn_schd,1,1),0) < 1) THEN

                    IF (v_idr_cpn_schd IS NOT NULL) THEN

                        v_no_rows   :=  NVL(
                                           TO_NUMBER(SUBSTR(
                                                v_idr_cpn_schd,INSTR(v_idr_cpn_schd,v_bulk_sep,1,2)+1,
                                                (
                                                    INSTR(v_idr_cpn_schd,v_bulk_sep,1,3)-
                                                        (INSTR(v_idr_cpn_schd,v_bulk_sep,1,2)+1)
                                                )
                                            )
                                            ),
                                            '0'
                                        );

                        IF (NVL(INSTR(v_idr_cpn_schd,v_new_cpn_dt,1,1),0) > 1) THEN
                            -- rate change for the same date; replace the last rate and date with the new rate and date
                            v_cpn_schd  :=  SUBSTR(
                                                    v_idr_cpn_schd,1,INSTR(v_idr_cpn_schd,v_bulk_sep,-1,5)
                                            )||v_new_cpn_schd;

                        ELSE
                            -- append new rate and date to the existing schedule
                            v_cpn_schd  :=  v_bulk_sep||TO_CHAR(2)||v_bulk_sep||
                                                TO_CHAR(v_no_rows+1)||v_bulk_sep||
                                                TO_CHAR(2)||v_bulk_sep||
                                                SUBSTR(
                                                    v_idr_cpn_schd,INSTR(v_idr_cpn_schd,v_bulk_sep,1,4)+1
                                                )||v_new_cpn_schd;

                        END IF;

                    ELSE
                        -- no existing schedule; use new rate and date
                        v_cpn_schd  :=  v_bulk_sep||TO_CHAR(2)||v_bulk_sep||TO_CHAR(1)||
                                            v_bulk_sep||TO_CHAR(2)||v_bulk_sep||
                                            v_new_cpn_schd;

                    END IF;

                END IF;

            ELSE

                v_cpn_schd := v_idr_cpn_schd;

            END IF;

        END IF;

        display_message('Final MCPn-SCHD:'||SUBSTR(v_cpn_schd,1,200));
        display_message('Final MCPn-SCHD (addn. data):'||SUBSTR(v_cpn_schd,201,200));

        RETURN    v_cpn_schd;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'modify_multi_cpn_schd:'||
                SUBSTR(SQLERRM,1,200)
            );
            RAISE_APPLICATION_ERROR(
                -20080,
                'modify_multi_cpn_schd:'||SQLERRM
            );

    END modify_multi_cpn_schd;

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
        p_inMTG_factor_schd         IN      vendor_req_messages.column_value%TYPE,
        p_inCurr_factor             IN      vendor_req_messages.column_value%TYPE,
        p_inCurr_factor_dt          IN      vendor_req_messages.column_value%TYPE,
        p_inSec_id                  IN      vendor_req_messages.column_value%TYPE,
        p_inSec_typ_grp             IN      vendor_req_messages.column_value%TYPE
    )
    RETURN  vendor_req_messages.column_value%TYPE
    IS
        v_fact_schd                 vendor_req_messages.column_value%TYPE := NULL;
        v_new_factor                vendor_req_messages.column_value%TYPE := NULL;
        v_bulk_sep                  VARCHAR2(1);
        v_cntr                      PLS_INTEGER                           := 0;
        -- v_cur_val changed to VARCHAR instead of CLOB.
        v_cur_val                   VARCHAR2(32767)                       := NULL;
        v_last_set                  vendor_req_messages.column_value%TYPE := NULL;
        v_prev_set                  vendor_req_messages.column_value%TYPE := NULL;
        v_dt                        vendor_req_messages.column_value%TYPE := NULL;
        v_inFactor_schd             vendor_req_messages.column_value%TYPE := TO_CHAR(p_inFactor_schd);
    BEGIN

        display_message('modify_factor_schd:');

        v_bulk_sep  :=  NVL(SUBSTR(v_inFactor_schd,1,1),c_def_bulk_sep);

        IF
                p_inSec_typ_grp  IN  ( 'MB')
        THEN

                IF
                     p_inCurr_factor    IS NOT NULL     AND
                     p_inCurr_factor_dt IS NOT NULL
                THEN
                     v_fact_schd :=  '5'||v_bulk_sep||p_inCurr_factor_dt||v_bulk_sep||
                                     '3'||v_bulk_sep||
                                     LTRIM(TO_CHAR(TO_NUMBER(p_inCurr_factor),'999999999999.000000000'))||v_bulk_sep;
                ELSE
                     IF p_inFactor_schd IS NOT NULL
                     THEN
                          v_cur_val  :=  SUBSTR(
                                                 p_inFactor_schd,INSTR(p_inFactor_schd,v_bulk_sep,1,4)+1
                                               );

                          LOOP
                              v_last_set   :=  SUBSTR(v_cur_val,1,
                                                      INSTR(v_cur_val,v_bulk_sep,1,4)
                                                     );

                              v_last_set   :=  REPLACE(
                                               SUBSTR(v_last_set,1,INSTR(v_last_set,v_bulk_sep,1,3))||
                                               LTRIM(
                                                 TO_CHAR(
                                                   TO_NUMBER(
                                                      SUBSTR(v_last_set,INSTR(v_last_set,v_bulk_sep,-1,2)+1,
                                                                INSTR(v_last_set,v_bulk_sep,-1,1)-1-
                                                                INSTR(v_last_set,v_bulk_sep,-1,2)
                                                            )
                                                   ),'999999999999.000000000'
                                                  )
                                               )||v_bulk_sep,
                                               v_bulk_sep||'2'||v_bulk_sep,
                                               v_bulk_sep||'3'||v_bulk_sep
                                               );

                              v_dt         :=  SUBSTR(v_last_set, INSTR(v_last_set,v_bulk_sep,1,1)+1,
                                                           INSTR(v_last_set,v_bulk_sep,1,2)-
                                                           INSTR(v_last_set,v_bulk_sep,1,1)-1
                                                     );

                              v_cur_val    :=  SUBSTR(v_cur_val,
                                                INSTR(v_cur_val,v_bulk_sep,1,4)+1
                                               );

                              EXIT WHEN (
                                            TRIM(v_cur_val) IS NULL                        OR
                                            TRIM(v_cur_val) = ';'                          OR
                                            SUBSTR(v_dt,1,6) > TO_CHAR(SYSDATE,'YYYYMM')
                                        );

                              v_prev_set   :=  v_last_set;
                          END LOOP;

                          IF  SUBSTR(v_dt,1,6) > TO_CHAR(SYSDATE,'YYYYMM')
                          THEN
                              v_fact_schd  :=  v_prev_set;
                          ELSE
                              v_fact_schd  :=  v_last_set;
                          END IF;

                     END IF;
                END IF;

                IF  v_fact_schd IS NOT NULL
                THEN
                    v_fact_schd  :=  v_bulk_sep||'2'||v_bulk_sep||'1'||v_bulk_sep||
                                     '2'||v_bulk_sep||v_fact_schd;
                END IF;
        ELSIF
    --Added 'BANKLOAN' in below two conditions for TD4203:WADEKS on 27-JUL-2010.
                p_inSec_typ_grp IN ('AB','CMO','CORP','BANKLOAN','PFSTK','GOVT')
        THEN
                IF p_inSec_typ_grp IN ('AB','CMO','GOVT','CORP','BANKLOAN')
                --TD4747:BuryeG:Added Corp ang Govt to populate Factor Schedule for MTGE securities for these types
                THEN
                      v_new_factor := NVL(reverse_schedule(p_inMTG_factor_schd,CONST_REAL_IND), p_inFactor_schd);
                ELSE
                      v_new_factor := p_inFactor_schd;
                END IF;

                IF v_new_factor IS NOT NULL
                THEN
                    -- Need to format date in the schedule
                    v_fact_schd    :=  SUBSTR(
                                               v_new_factor,INSTR(v_new_factor,v_bulk_sep,1,1),
                                               INSTR(v_new_factor,v_bulk_sep,1,4)
                                             );

                    v_cur_val      :=  SUBSTR(
                                               v_new_factor,INSTR(v_new_factor,v_bulk_sep,1,4)+1
                                             );

                    LOOP
                        v_last_set   :=  SUBSTR(v_cur_val,1,
                                                INSTR(v_cur_val,v_bulk_sep,1,4)
                                               );

                        v_last_set   :=  SUBSTR(v_last_set,1,INSTR(v_last_set,v_bulk_sep,1,3))||
                                         LTRIM(
                                           TO_CHAR(
                                             TO_NUMBER(
                                                SUBSTR(v_last_set,INSTR(v_last_set,v_bulk_sep,-1,2)+1,
                                                          INSTR(v_last_set,v_bulk_sep,-1,1)-1-
                                                          INSTR(v_last_set,v_bulk_sep,-1,2)
                                                      )
                                             ),'999999999999.000000000'
                                           )
                                         )||v_bulk_sep;

                        v_fact_schd  :=  v_fact_schd || REPLACE(v_last_set,
                                                                v_bulk_sep||'2'||v_bulk_sep,
                                                                v_bulk_sep||'3'||v_bulk_sep
                                                               );

                        v_cur_val    :=  SUBSTR(v_cur_val,
                                                INSTR(v_cur_val,v_bulk_sep,1,4)+1
                                               );
                        EXIT WHEN (TRIM(v_cur_val) IS NULL OR TRIM(v_cur_val) = ';');
                    END LOOP;
                END IF;
        END IF;

        display_message('Final factor schd:'||SUBSTR(v_fact_schd,1,200));
        display_message('Final factor schd (addn. data):'||SUBSTR(v_fact_schd,201,200));

        RETURN    v_fact_schd;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(
                'modify_factor_schd:'|| SUBSTR(SQLERRM,1,200)
            );
            RAISE_APPLICATION_ERROR(
                -20080,
                'modify_factor_schd:'||SQLERRM
            );

    END modify_factor_schd;

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
        p_schd_type                  IN      VARCHAR2
    )
    RETURN BOOLEAN
    IS

        v_cur_val           VARCHAR2(32767);
        v_converted_data    vendor_req_messages.column_trans_value%TYPE;
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(2000); -- 1/18/2007 - KampeTA - modified size from 200
        v_dt_val            DATE;
        v_price_val         NUMBER  :=  0;
        v_amt_val           NUMBER  :=  0;
        v_bb_data_typ_ind   PLS_INTEGER    :=  NVL(p_bb_data_type_ind,3);

        v_str_val           VARCHAR2(2000); -- 1/18/2007 - KampeTA - modified size from 30
        v_str_ind           BOOLEAN  :=  FALSE;

    BEGIN

        IF  (p_column1 IS NULL AND p_column2 IS NOT NULL) OR
            (p_column1 IS NOT NULL AND p_column2 IS NULL)
        THEN

            RETURN FALSE;

        END IF;

        --CLOB Changes 08-08-2005
        v_cur_val   :=  DBMS_LOB.SUBSTR(p_column1, DBMS_LOB.GETLENGTH(p_column1),1);
        v_bulk_sep  :=  SUBSTR(v_cur_val,1,1);
        v_cur_val   :=  SUBSTR(v_cur_val,2);

        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        display_message('Curr data value is: ['||v_cur_val || ']');
        display_message(
            'No. of rows: '||v_no_rows||
            ', No. of cols:' ||v_no_cols||', No. of dim:'||v_no_dim
        );

       display_message('Either Date value or String value will be available and NOT BOTH');

        v_converted_data        :=  v_bulk_sep||2||v_bulk_sep||
                                    v_no_rows||v_bulk_sep||TO_CHAR(v_no_cols)||
                                    v_bulk_sep;

        LOOP

            v_row_data          :=  SUBSTR(
                                        v_cur_val,1,
                                        INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)
                                    );

            v_cur_val           :=  SUBSTR(
                                        v_cur_val,
                                        INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                                    );
            display_message('v_row_data: '||v_row_data);
            BEGIN

                v_dt_val            :=  TO_DATE(
                                            SUBSTR(
                                                v_row_data,
                                                INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                                INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                                    INSTR(v_row_data,v_bulk_sep,1,1)
                                            ),'YYYYMMDD'
                                        );

            EXCEPTION
                WHEN OTHERS THEN

                    IF  SQLCODE != -1841  THEN

                        display_message(SUBSTR(SQLERRM,1,255));
                        RAISE;

                    ELSE

                        v_str_val            :=  TO_CHAR(
                                                    SUBSTR(
                                                        v_row_data,
                                                        INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                                        INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                                        INSTR(v_row_data,v_bulk_sep,1,1)
                                                    )
                                                 );

                        v_str_ind          :=  TRUE;
                        v_bb_data_typ_ind  :=  2;

                    END IF;

            END;

            IF  v_str_ind  THEN      -- TD2818 HillD modified to handle interval_dt bulk data

                    v_converted_data    :=  v_converted_data||4||v_bulk_sep||
                                            v_str_val|| v_bulk_sep;
            ELSE

                    v_converted_data    :=  v_converted_data||5||v_bulk_sep||
                                               TO_CHAR(v_dt_val,'YYYYMMDD')|| v_bulk_sep;


            END IF;

            IF (v_no_cols > 1) THEN

                v_price_val         :=  TO_NUMBER(
                                            TRIM(
                                                SUBSTR(
                                                    v_row_data,
                                                    INSTR(v_row_data,v_bulk_sep,1,3)+1,
                                                    INSTR(v_row_data,v_bulk_sep,1,4)-1-
                                                        INSTR(v_row_data,v_bulk_sep,1,3)
                                                )
                                            )
                                        );


                IF  v_str_ind  THEN

                    v_converted_data    :=  v_converted_data||v_bb_data_typ_ind||v_bulk_sep||       -- TD2818 HillD modified to handle interval_dt bulk data
                                            v_price_val||
                                            v_bulk_sep;
                ELSE


                    IF (p_schd_type IN (c_hist_principal_distributed,
                                       c_hist_losses))
                    THEN
                        v_converted_data    :=  v_converted_data||v_bb_data_typ_ind||v_bulk_sep||       -- TD4918 DEonP
                                                LTRIM(TO_CHAR(v_price_val,'999999999999.00'))||
                                                v_bulk_sep;

                    ELSE
                        v_converted_data    :=  v_converted_data||v_bb_data_typ_ind||v_bulk_sep||       -- TD2818 HillD modified to handle interval_dt bulk data
                                                LTRIM(TO_CHAR(v_price_val,'999999999999.0000'))||
                                                v_bulk_sep;
                    END IF;

                END IF;

            END IF;

            IF (v_no_cols > 2) THEN

                v_amt_val   :=  TO_NUMBER(
                                    TRIM(
                                        SUBSTR(
                                            v_row_data,
                                            INSTR(v_row_data,v_bulk_sep,1,5)+1,
                                            INSTR(v_row_data,v_bulk_sep,1,6)-1-
                                                INSTR(v_row_data,v_bulk_sep,1,5)
                                        )
                                    )
                                );

                v_converted_data    :=  v_converted_data||2||v_bulk_sep||
                                        LTRIM(TO_CHAR(v_amt_val,'99999999999999.00'))||
                                        v_bulk_sep;

            END IF;

            display_message('Row data is: ['||v_row_data|| ']');
            display_message(
                'date value is:['||v_dt_val||'], String val is ['||v_str_val||
                '], Price is: ['||v_price_val||'], Amt is: ['||v_amt_val || ']'
            );

            EXIT WHEN (TRIM(v_cur_val) IS NULL);

        END LOOP;

        display_message('Converted bulk Value is: '||SUBSTR(v_converted_data,1,200));
        display_message('WMC bulk Value is: '||SUBSTR(p_column2,1,200));
        display_message('COnverted bulk value is: '||SUBSTR(v_converted_data,201,200));
        display_message('WMC bulk Value is: '||SUBSTR(p_column2,201,200));

        RETURN  (v_converted_data = p_column2);

    EXCEPTION
        WHEN OTHERS THEN
            display_message('compare_bulk_fld: Unhandled exception');
            RAISE_APPLICATION_ERROR(-20090,'compare_bulk_fld : '||SQLERRM);

    END compare_bulk_fld;

    /************************ GET_LINK_STATUS_CD *************************
     ***
     ***  Author:        Shashi Mahadik
     ***  Date Created:  07/05/2002
     ***  Type:          Private
     ***  Purpose:       This proc gets top status code for linked group
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    FUNCTION get_link_status_cd(
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_mnemonic                  IN      vendor_rules_map.mnemonic%TYPE
    )
    RETURN vendor_req_messages.fix_status_cd%TYPE
    IS

        v_fix_status_cd     vendor_req_messages.fix_status_cd%TYPE:=NULL;

    BEGIN

        SELECT /*+ index(vrq,vendor_req_messages_pk) */
            DECODE(
                MIN(
                    DECODE(
                        vrq.fix_status_cd,
                        'N',1,
                        'I',2,
                        'U',3,
                        'M',4,
                        5
                    )
                ),
                1,'N',
                2,'I',
                3,'U',
                4,'M',
                'N'
            )
        INTO
            v_fix_status_cd
        FROM
            vendor_req_messages vrq
        WHERE
            vrq.vendor_product_id   =   p_product_id    AND
            vrq.request_id          =   p_request_id    AND
            EXISTS  (
                        SELECT
                            mnemonic
                        FROM
                            vendor_rules_map vrm
                        WHERE
                            vendor_product_id   =   vrq.vendor_product_id   AND
                            vrm.map_typ         =   'L'                     AND
                            vrm.mnemonic        =   p_mnemonic              AND
                            vrm.map_value       =   vrq.column_nm
                    );

        display_message('Linked status code is: '||v_fix_status_cd);

        RETURN v_fix_status_cd;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_fix_status_cd;

    END get_link_status_cd;

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
    )
    IS

        unknown_ext_id_typ  EXCEPTION;

    BEGIN

        display_message('get_sec_addn_info : Begin ');

        p_outSec_id     :=  NULL;
        p_outSec_typ_id :=  NULL;
        p_outInvest_id  :=  NULL;
        p_outIsr_id     :=  NULL;
        p_outWmc_isr_id :=  NULL;

        IF  (p_inExt_id_typ_cd  NOT IN  ('B','T','S','I','C'))   THEN

            RAISE unknown_ext_id_typ;

        END IF;

        SELECT
            sec_id,
            sec_typ_id,
            invest_id,
            isr_id
        INTO
            p_outSec_id,
            p_outSec_typ_id,
            p_outInvest_id,
            p_outIsr_id
        FROM
            security_tbl    s
        WHERE
            sec_id = DECODE(p_inExt_id_typ_cd,
                            'B', blmbrg_common_pkg.get_external_id_from_sec_id(p_inExt_id, c_bb_unique),
                            'S', blmbrg_common_pkg.get_external_id_from_sec_id(p_inExt_id, c_bb_sedol),
                            'C', blmbrg_common_pkg.get_external_id_from_sec_id(p_inExt_id, c_bb_cusip),
                            'I', blmbrg_common_pkg.get_external_id_from_sec_id(p_inExt_id, c_bb_isin),
                            'T', blmbrg_common_pkg.get_external_id_from_sec_id(p_inExt_id, c_bb_ticker),
                            NULL)         AND
            ROWNUM <= 2;

        BEGIN

            SELECT
                wmc_isr_id
            INTO
                p_outWmc_isr_id
            FROM
                issuer
            WHERE
                isr_id  =   p_outIsr_id;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN

                p_outWmc_isr_id := NULL;

        END;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            display_message('get_sec_addn_info: Security does not exists in IDR');
            RAISE_APPLICATION_ERROR(
                -20090,
                'get_sec_addn_info : Security does not exists in IDR'
            );

        WHEN unknown_ext_id_typ THEN

            display_message('get_sec_addn_info: Unknown ext_id_typ_cd ');
            RAISE_APPLICATION_ERROR(
                -20090,
                'get_sec_addn_info : '||SQLERRM
            );

        WHEN OTHERS THEN

            display_message('get_sec_addn_info: '||SQLERRM);
            RAISE_APPLICATION_ERROR(
                -20090,
                'get_sec_addn_info : '||SQLERRM
            );

    END get_sec_addn_info;

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
    RETURN sec_external_id.sec_id%TYPE
    IS

    v_sec_id            security_tbl.sec_id%TYPE := NULL;
    BEGIN

        display_message('get_sec_id_extern_data extern_id:'||p_inExtern_id);

        SELECT
            sec_id
        INTO
            v_sec_id
        FROM
            sec_external_id
        WHERE
            extern_id       =   p_inExtern_id       AND
            extern_id_typ   =   p_inExtern_id_typ   AND
             exp_dt         >   SYSDATE;

        display_message('get_sec_id_extern_data Found sec_id:'||v_sec_id);

        RETURN v_sec_id;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            v_sec_id := NULL;
            RETURN v_sec_id;

    END get_sec_id_extern_data;

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
    RETURN security_tbl.sec_id%TYPE
    IS

        v_sec_id            security_tbl.sec_id%TYPE := NULL;
        v_extern_id         sec_external_id.extern_id%TYPE;

    BEGIN

        display_message('check_duplicate_security Request_id:'||p_request_id);

        v_extern_id     :=  get_bb_vrq_data(p_product_id,p_request_id,'ID_CUSIP');
        v_extern_id     :=  substr(v_extern_id,1,8);

        IF (v_extern_id IS NOT NULL) THEN

            v_sec_id    :=  get_sec_id_extern_data(v_extern_id, c_bb_cusip);

        END IF;

        IF (v_sec_id IS NULL) THEN

            v_extern_id     :=  get_bb_vrq_data(p_product_id,p_request_id,'ID_BB_UNIQUE');

            IF (v_extern_id IS NOT NULL) THEN

                v_sec_id    :=  get_sec_id_extern_data(v_extern_id, c_bb_unique);

            END IF;

        END IF;

        IF (v_sec_id IS NULL) THEN

            v_extern_id     :=  get_bb_vrq_data(p_product_id,p_request_id,'ID_SEDOL1');
            v_extern_id     :=  substr(v_extern_id,1,6);

            IF (v_extern_id IS NOT NULL) THEN

                v_sec_id    :=  get_sec_id_extern_data(v_extern_id, c_bb_sedol);

            END IF;

        END IF;

        IF (v_sec_id IS NULL) THEN

            v_extern_id     :=  get_bb_vrq_data(p_product_id,p_request_id,'ID_ISIN');
            v_extern_id     :=  substr(v_extern_id,1,12);       -- Changed substr length from 11 to 12 for TD 4506 by buryeg

            IF (v_extern_id IS NOT NULL) THEN

                v_sec_id    :=  get_sec_id_extern_data(v_extern_id, c_bb_isin);

            END IF;

        END IF;

        display_message('check_duplicate_security Found sec_id:'||v_sec_id);

        RETURN v_sec_id;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('check_duplicate_security: '||SQLERRM);
            RAISE_APPLICATION_ERROR(-20090,'check_duplicate_security:'||SQLERRM);

    END check_duplicate_security;

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
    RETURN sec_typ_groups.group_nm%TYPE
    IS

        v_group_nm      sec_typ_groups.group_nm%TYPE := NULL;

    BEGIN

        SELECT
            group_nm
        INTO
            v_group_nm
        FROM
            sec_typ_groups
        WHERE
            sec_typ_id  =   p_inSec_typ_id;

        RETURN v_group_nm;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_group_nm;

    END get_sec_typ_group;

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
    RETURN BOOLEAN
    IS

        v_dummy     CHAR(1);

    BEGIN

        SELECT
            'X'
        INTO
            v_dummy
        FROM
            bb_fields
        WHERE
            field_mnemonic  =   p_column_nm AND
            field_type      =   'Bulk Format';

        RETURN c_true;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN c_false;

    END check_bulk_fld;

    /************************** wrap_fctr_schd ***********************************
    ***  Author:           NallaN
    ***  Date Created:     03-AUG-2005
    ***  Type:             Public
    ***  Purpose:          Wrapper function to factor schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_fctr_schd(
        p_inFactor_schd             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

       v_column_value               VARCHAR2(32767);
       v_out_value                  CHAR(1)         := NULL;

    BEGIN

       -- Data Map for Factor Schedule Mnemonic

       v_column_value := TRIM(VENDOR_MAP_PKG.my_sys_context(p_inFactor_schd));

       v_out_value    := (CASE
                              WHEN
                               ( CASE
                                     WHEN NVL(SUBSTR(v_column_value,
                                            INSTR(v_column_value, c_sep , 1, 2) + 1,
                                            INSTR(v_column_value, c_sep , 1, 3) - INSTR(v_column_value, c_sep , 1, 2) + 1 )
                                         ,'0') = '0'
                               THEN
                                           c_n
                           ELSE
                                           c_y
                                   END)  = c_y
                              THEN
                                   c_y
                              ELSE
                                  c_n
                         END);

    RETURN v_out_value;

    END wrap_fctr_schd;

    /************************** get_call_put_schd ***********************************
    ***  Author:           NallaN
    ***  Date Created:     11-08-2005
    ***  Type:             Public
    ***  Purpose:          Function to get call/put schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_call_put_schd(
        p_inSchd_type             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

       v_column_value               VARCHAR2(32767) := NULL;

    BEGIN

        v_column_value := TRIM(VENDOR_MAP_PKG.my_sys_context(p_inSchd_type));

       v_column_value := ( CASE
                               WHEN
                                   SUBSTR(v_column_value,1,5) = c_col_prefix
                                   THEN
                                       NULL
                                   ELSE
                                       v_column_value
                           END
                          );

    RETURN v_column_value;

    END get_call_put_schd;


    /************************** wrap_call_schd ***********************************
    ***  Author:           NallaN
    ***  Date Created:     03-AUG-2005
    ***  Type:             Private
    ***  Purpose:          Wrapper function to call schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_call_schd(
        p_inCall_schd             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

    BEGIN

        -- Data Map for Call Schedule Mnemonic SC001

        RETURN(
            get_call_put_schd(
                p_inCall_schd
                )
        );

    END wrap_call_schd;


    /************************** wrap_hist_losses ***********************************
    ***  Author:           DeonP
    ***  Date Created:     05-MAY-2011
    ***  Type:             Private
    ***  Purpose:          Wrapper function to hist losses schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_hist_losses(
        p_inHist_losses             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS
         v_column_value               VARCHAR2(32767) := NULL;
    BEGIN

       v_column_value := BLMBRG_COMMON_PKG.get_vrm_column_value(p_inHist_losses);

       v_column_value := ( CASE
                               WHEN
                                   SUBSTR(v_column_value,1,5) = c_col_prefix
                                   THEN
                                       NULL
                                   ELSE
                                       v_column_value
                           END
                          );

    RETURN v_column_value;

    END wrap_hist_losses;

    /************************** wrap_hist_principal_distributed ***********************************
    ***  Author:           DeonP
    ***  Date Created:     05-MAY-2011
    ***  Type:             Private
    ***  Purpose:          Wrapper function to hist_principal_distributed schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_hist_principal_dist(
        p_inHist_principal_distributed             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS
         v_column_value               VARCHAR2(32767) := NULL;
    BEGIN

       v_column_value := BLMBRG_COMMON_PKG.get_vrm_column_value(p_inHist_principal_distributed);

       v_column_value := ( CASE
                               WHEN
                                   SUBSTR(v_column_value,1,5) = c_col_prefix
                                   THEN
                                       NULL
                                   ELSE
                                       v_column_value
                           END
                          );

    RETURN v_column_value;

    END wrap_hist_principal_dist;


    /************************** wrap_put_schd ***********************************
    ***  Author:           NallaN
    ***  Date Created:     03-AUG-2005
    ***  Type:             Public
    ***  Purpose:          Wrapper function to put schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_put_schd(
        p_inPut_schd             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

    BEGIN

       -- Data Map for Call Schedule Mnemonic SC002

        RETURN(
            get_call_put_schd(
                p_inPut_schd
                )
                         );

    END wrap_put_schd;

    /************************** get_loan_repay_schd ***********************************
    ***  Author:           HsuS
    ***  Date Created:     06-NOV-2009
    ***  Type:             Public
    ***  Purpose:          Function to get loan repayment schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION get_loan_repay_schd(
        p_inRepay_schd             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

       v_column_value               VARCHAR2(32767) := NULL;

    BEGIN

        v_column_value := TRIM(VENDOR_MAP_PKG.my_sys_context(p_inRepay_schd));

        v_column_value := ( CASE
                               WHEN
                                   SUBSTR(v_column_value,1,5) = c_col_prefix
                                   THEN
                                       NULL
                                   ELSE
                                       v_column_value
                           END
                          );

    RETURN v_column_value;

    END get_loan_repay_schd;

    /************************** wrap_loan_repay_schd ****************************
    ***  Author:           HsuS
    ***  Date Created:     06-NOV-2009
    ***  Type:             Public
    ***  Purpose:          Wrapper function to loan repayment schedules
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION wrap_loan_repay_schd(
        p_inRepay_schd             IN      vendor_rules_map.mnemonic%TYPE
        )
    RETURN  vendor_req_messages.column_value%TYPE
    AS

    BEGIN

       -- Data Map for Loan Repayment Schedule Mnemonic LN023

        RETURN(
            get_loan_repay_schd(
                p_inRepay_schd
                )
                         );

    END wrap_loan_repay_schd;


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
    RETURN vendor_req_messages.column_value%TYPE
    IS

        v_out_trans_value    vendor_req_messages.column_value%TYPE := NULL;
        v_data               vendor_req_messages.column_value%TYPE := NULL;
        v_date_1             VARCHAR2(10);
        v_date_2             VARCHAR2(10);


    BEGIN

        -- Apply Logic based on the mnemonic and
        -- add any case, decode ,nvl and other sql functions in individual wrapper functions


        IF  p_inMnemonic  = c_multi_cpn_schd_name  THEN

            v_out_trans_value := wrap_multi_cpn_schd(
                p_cpn_schd                  =>      p_inMnemonic1,   -- SC011
                p_mtg_hist_cpn              =>      p_inMnemonic2,   -- DS647
                p_cpn_typ                   =>      p_inMnemonic3,   -- DS086
                p_stepup_dt                 =>      p_inMnemonic4,   -- DS142
                p_issue_dt                  =>      p_inMnemonic5,   -- DS137
                p_stepup_cpn                =>      p_inMnemonic6,   -- DS141
                p_flt_cpn_hist              =>      p_inMnemonic7,   -- FL050
                p_last_refix_dt             =>      p_inMnemonic8,   -- DS126
                p_cpn_rt                    =>      p_inMnemonic9,   -- DS033
                p_prev_cpn_dt               =>      p_inMnemonic10,  -- DS041
                p_mtg_pay_delay             =>      p_inMnemonic11,  -- FP007
                p_mat_dt                    =>      p_inMnemonic12,  -- DS035
                p_cpn_asof_dt               =>      p_inMnemonic13,  -- DS340
                p_mtg_prev_cpn              =>      p_inMnemonic14,  -- DS746
                p_sec_id                    =>      p_inMnemonic15,  -- WM005
                p_int_acc_dt                =>      p_inMnemonic16   -- DS031
                );

        ELSIF p_inMnemonic = c_mtg_factor          THEN

            v_out_trans_value := wrap_factor_schd(
                p_inFactor_schd             =>      p_inMnemonic1,  -- SC021
                p_inMtg_factor_schd         =>      p_inMnemonic2,  -- FP025
                p_inCurr_factor             =>      p_inMnemonic3,  -- FP001
                p_inCurr_factor_dt          =>      p_inMnemonic4,  -- FP012
                p_inSec_id                  =>      p_inMnemonic5,  -- WM005
                p_inSec_typ_grp             =>      p_inMnemonic6   -- WM001
                );

        ELSIF p_inMnemonic = c_sink_schd_name      THEN

            v_out_trans_value := wrap_sink_schd(
                p_inSink_schd               =>      p_inMnemonic1, -- SC003
                p_inPct_sinker              =>      p_inMnemonic2, -- DS216
                p_inAmt_issued              =>      p_inMnemonic3  -- DS218
                );

        ELSIF p_inMnemonic = c_factor_schd_name    THEN

            v_out_trans_value := wrap_fctr_schd(
                p_inFactor_schd             =>      p_inMnemonic1   -- SC021
                );

        ELSIF p_inMnemonic = c_hist_losses    THEN

            v_out_trans_value := wrap_hist_losses(
                p_inHist_losses             =>      p_inMnemonic1   -- DY126
                );



            v_date_1 := SUBSTR(v_out_trans_value, INSTR(v_out_trans_value,';',1,5) + 1,8);
            v_date_2 := SUBSTR(v_out_trans_value, INSTR(v_out_trans_value,';',1,9) + 1,8);

             IF (SUBSTR(v_date_2,1,1) <> ';') AND
                TO_DATE(v_date_1, 'YYYYMMDD') > TO_DATE(v_date_2, 'YYYYMMDD') THEN

                 v_out_trans_value := reverse_schedule(v_out_trans_value, CONST_PRCE_IND);

            END IF;



        ELSIF p_inMnemonic = c_hist_principal_distributed    THEN

            v_out_trans_value := wrap_hist_principal_dist(
                p_inHist_principal_distributed   =>      p_inMnemonic1   -- DY122
                );

            v_date_1 := SUBSTR(v_out_trans_value, INSTR(v_out_trans_value,';',1,5) + 1,8);
            v_date_2 := SUBSTR(v_out_trans_value, INSTR(v_out_trans_value,';',1,9) + 1,8);

            IF (SUBSTR(v_date_2,1,1) <> ';') AND
                TO_DATE(v_date_1, 'YYYYMMDD') > TO_DATE(v_date_2, 'YYYYMMDD') THEN

                 v_out_trans_value := reverse_schedule(v_out_trans_value, CONST_PRCE_IND);

            END IF;


        ELSIF p_inMnemonic = c_call_schd_name      THEN

            v_out_trans_value := wrap_call_schd(
                p_inCall_schd               =>      p_inMnemonic1   -- SC001
                );

        ELSIF p_inMnemonic  = c_put_schd_name      THEN

            v_out_trans_value := wrap_put_schd(
                p_inPut_schd                =>      p_inMnemonic1   -- SC002
                );

        ELSIF p_inMnemonic  = c_interval_dt_schd   THEN  -- TD 2818  HillD  03/30/2007 Interval date

            v_out_trans_value := wrap_interval_dt_schd (
                p_inInterval_dt             =>      p_inMnemonic1,   -- DS269 GILTS_EX_DVD_DT
                p_inNxt_cpn_dt              =>      p_inMnemonic2,  -- DS040 NXT_CPN_DT
                p_inSec_id                  =>      p_inMnemonic3   -- WM005 SEC_ID
                );

        ELSIF p_inMnemonic  = c_loan_repay_schd_name    THEN

            v_out_trans_value := wrap_loan_repay_schd (
                p_inRepay_schd              =>      p_inMnemonic1    -- LN023
                );

        ELSE

           display_message('Program not found for schedule :'|| p_inMnemonic);

        END IF;

        RETURN v_out_trans_value;

    END wrap_schedules;

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
    RETURN issuer_family.all_quasi_sovg_flg%TYPE
    IS
        v_ret_flag               issuer_family.all_quasi_sovg_flg%TYPE;
    BEGIN

        SELECT
            DECODE(COUNT(*),0,'N','Y')
        INTO
            v_ret_flag
        FROM
            issuer_family if,
            issuer        i,
            security_tbl  s
        WHERE
            EXISTS
                (
                 SELECT
                     1
                 FROM
                     party_struct ps,
                     party        p
                 WHERE
                     ps.relation_cd   =  c_quasi_relation_cd  AND
                     ps.member_id      =  p.party_id           AND
                     p.subtyp_id_num  =  if.isr_fam_id
                )                                         AND
            if.isr_fam_id   =  i.isr_fam_id         AND
            i.isr_id        =  s.isr_id             AND
            s.sec_id        =  p_inSecId;

        RETURN v_ret_flag;


    END is_if_quasi_sovg_flg;

    /************************** is_if_quasi_sovg_flg_isr ********************
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
    FUNCTION   is_if_quasi_sovg_flg_isr (
        p_inisrId                   IN      security_tbl.Isr_id%TYPE
    )
    RETURN issuer_family.all_quasi_sovg_flg%TYPE
    IS
        v_ret_flag               issuer_family.all_quasi_sovg_flg%TYPE;
    BEGIN

        SELECT
            DECODE(COUNT(*),0,'N','Y')
        INTO
            v_ret_flag
        FROM
            issuer_family if,
            issuer        i
        WHERE
            EXISTS
                (
                 SELECT
                     1
                 FROM
                     party_struct ps,
                     party        p
                 WHERE
                     ps.relation_cd   =  c_quasi_relation_cd  AND
                     ps.member_id      =  p.party_id           AND
                     p.subtyp_id_num  =  if.isr_fam_id
                )                                         AND
            if.isr_fam_id   =  i.isr_fam_id         AND
            i.isr_id        =  p_inIsrId;

        RETURN v_ret_flag;


    END is_if_quasi_sovg_flg_isr;


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
    )
    IS
       c_proc_func_name    VARCHAR2(32)    := 'quasi_sovg_relationship';  --TD3787 10/21/2008 DuttaD
       c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        IF (p_inWMCIsrFamId IS NULL) THEN

            DELETE FROM sec_party
            WHERE
                sec_id       =   p_inSecID      AND
                relation_cd  =   c_quasi_relation_cd;

        ELSE
            c_proc_loc := 'party-issuer_family' ;                              --TD3787 10/21/2008 DuttaD
            DELETE FROM sec_party
            WHERE
                sec_id       =   p_inSecID      AND
                relation_cd  =   c_quasi_relation_cd;

            INSERT INTO SEC_PARTY
                (ins_ts,
                 ins_login,
                 upd_ts,
                 upd_login,
                 sec_id,
                 party_id,
                 relation_cd,
                 eff_dt,
                 relation_pct)
           SELECT
               sysdate,
               user,
               sysdate,
               user,
               p_inSecId,
               p.party_id,
               c_quasi_relation_cd,
               TRUNC(sysdate),
               c_quasi_relation_pct
           FROM
               party         p,
               issuer_family if
           WHERE
               p.party_typ         =  c_if_type             AND
               p.subtyp_id_num     =  if.isr_fam_id         AND
               if.wmc_isr_fam_id   =  p_inWMCIsrFamId;


        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('quasi_sovg_relationship: '||SQLERRM);
            RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);   --TD3787 10/21/2008 DuttaD


    END quasi_sovg_relationship;


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
    ) RETURN issuer_family.wmc_isr_fam_id%TYPE
    IS

        v_wmc_isr_fam_id    issuer_family.wmc_isr_fam_id%TYPE;

    BEGIN

        BEGIN
            SELECT
                wmc_isr_fam_id
            INTO
                v_wmc_isr_fam_id
            FROM
                issuer_family if,
                party         p,
                sec_party     sp
            WHERE
                if.isr_fam_id         =  p.subtyp_id_num      AND
                p.party_typ           =  c_if_type            AND
                p.party_id            =  sp.party_id          AND
                sp.relation_cd        =  c_quasi_relation_cd  AND
                sp.sec_id             =  p_inSecId;
        EXCEPTION
             WHEN NO_DATA_FOUND THEN

                 RETURN NULL;
        END;

        RETURN  v_wmc_isr_fam_id;


    END get_sec_quasi_sovg_rel;

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
    RETURN issuer_family.all_quasi_sovg_flg%TYPE
    IS

        v_ret_flg   issuer_family.all_quasi_sovg_flg%TYPE;

    BEGIN

        BEGIN
            SELECT
                if.all_quasi_sovg_flg
            INTO
                v_ret_flg
            FROM
                issuer_family if,
                issuer        i,
                security_tbl  s
            WHERE
                if.isr_fam_id        =  i.isr_fam_id   AND
                i.isr_id             =  s.isr_id       AND
                s.sec_id             =  p_inSecId;
        EXCEPTION
             WHEN NO_DATA_FOUND THEN

                 v_ret_flg :=  'N';
        END;

        RETURN  v_ret_flg;



    END is_if_quasi_sovg;

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
    RETURN issuer_family.all_quasi_sovg_flg%TYPE
    IS

        v_ret_flg   issuer_family.all_quasi_sovg_flg%TYPE;

    BEGIN

        BEGIN
            SELECT
                if.all_quasi_sovg_flg
            INTO
                v_ret_flg
            FROM
                issuer_family if,
                issuer        i
            WHERE
                if.isr_fam_id        =  i.isr_fam_id   AND
                i.isr_id             =  p_inIsrId;
        EXCEPTION
             WHEN NO_DATA_FOUND THEN

                 v_ret_flg :=  'N';
        END;

        RETURN  v_ret_flg;



    END is_if_quasi_sovg_isr;

    /************************** get_bulk_column_value ****************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/29/2005
    ***  Type:          Public
    ***  Purpose:       This function returns a column value
    ***                 for future bonds and future chain
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION  get_bulk_column_value(
        p_inMnemonic vendor_req_messages.column_nm%TYPE
    )
    RETURN vendor_req_messages.column_trans_value%TYPE
    IS
        v_out_val  vendor_req_messages.column_trans_value%TYPE := NULL;

    BEGIN

        RETURN(

        vendor_map_pkg.my_sys_context(
            p_inMnemonic
        )
    );

    END get_bulk_column_value;

    /************************** check_undly_exists *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Checks underlying data exists in vrm for mnemonic
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION check_undly_exists(
        p_inProduct_id vendor_request.vendor_product_id%TYPE,
        p_inRequest_id vendor_request.request_id%TYPE,
        p_inMnemonic   vendor_req_messages.column_nm%TYPE := NULL
    )
    RETURN BOOLEAN
    AS
        v_column_value  vendor_req_messages.column_value%TYPE;

    BEGIN

        v_column_value := get_bb_vrq_data(
                               p_inProduct_id,
                               p_inRequest_id,
                               BLMBRG_COMMON_PKG.CONST_FUT_DLVRBLE_BNDS_UNIQUE
                              );

        IF v_column_value IS NOT NULL THEN

             RETURN TRUE;

        ELSE

             RETURN FALSE;

        END IF;

    END check_undly_exists;

    /************************** is_bond_exist *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Check whether future dv bond exists in IDR.
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION is_bond_exist(
        p_inExtern_id sec_external_id.extern_id%TYPE
    )
    RETURN VARCHAR2
    AS
        v_count  PLS_INTEGER := 0;
        v_exist  VARCHAR2(1) := 'N';

    BEGIN

        SELECT
            COUNT(1)
        INTO
            v_count
        FROM
            sec_external_id
        WHERE
            extern_id_typ  =  BLMBRG_COMMON_PKG.CONST_BB_UNIQUE  AND
            extern_id      =  p_inExtern_id                      AND
            exp_dt         >  SYSDATE;

        IF  v_count  >  0  THEN

            v_exist  :=  'Y';

        END IF;

        RETURN  v_exist;

    END is_bond_exist;


    /************************** is_dormant *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Check the security maint status
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/
    FUNCTION is_dormant(
        p_inExtern_id  vendor_request.ext_id%TYPE
    )
    RETURN VARCHAR2
    AS

        v_count    PLS_INTEGER := 0;
        v_exist    VARCHAR2(1) := 'N';
        v_sec_id   vendor_request.sec_id%TYPE := NULL;

    BEGIN

        SELECT
            sec_id
        INTO
            v_sec_id
        FROM
            sec_external_id
        WHERE
            extern_id_typ  =  BLMBRG_COMMON_PKG.CONST_BB_UNIQUE  AND
            extern_id      =  p_inExtern_id                      AND
            exp_dt         >  SYSDATE;

        IF v_sec_id IS NOT NULL THEN

            SELECT
                COUNT(1)
            INTO
                v_count
            FROM
                security_tbl
            WHERE
                sec_id          =  v_sec_id  AND
                maint_status_cd = 'D';

            IF  v_count = 1 THEN

            v_exist := 'Y';

            END IF;

        END IF;

        RETURN v_exist;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN

           RETURN 'Y';
    END is_dormant;

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
    RETURN VARCHAR2
    AS

        v_bb_unique         sec_external_id.extern_id%TYPE;
        v_conv_fctr         cons_rel_stat.conv_factor%TYPE;
        v_cur_val           VARCHAR2(32767);
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER := NULL;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(200);
        v_index             PLS_INTEGER := 0;
        v_bond_sec_id       vendor_request.sec_id%TYPE;
        v_request_id        vendor_request.request_id%TYPE        := p_inRequest_id;
        v_product_id        vendor_request.vendor_product_id%TYPE := p_inProduct_id;
        v_str_del           VARCHAR2(20);
        v_str               VARCHAR2(32767);

    BEGIN
        g_tab_bond.delete;

        display_message('populate_dvbonds[Request_id]:'||v_request_id);

        FOR v_data IN
            (
            SELECT /*+ index(vrm,vendor_req_messages_pk) */
                vrm.column_value str
            FROM
                vendor_req_messages vrm
            WHERE
                vrm.column_nm         =  BLMBRG_COMMON_PKG.CONST_FUT_DLVRBLE_BNDS_UNIQUE AND
                vrm.request_id        =  v_request_id                                    AND
                vrm.vendor_product_id =  v_product_id

            )
        LOOP


            v_cur_val   :=  DBMS_LOB.SUBSTR(v_data.str, 32767, 1);
            v_bulk_sep  :=  SUBSTR(v_cur_val, 1, 1);
            v_cur_val   :=  SUBSTR(v_cur_val, 2);

            v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
            v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

            v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
            v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

            v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
            v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

            display_message('get_future_data[Request_id]:'||v_request_id||' No Rows: '||v_no_rows||' No. Cols: '||v_no_cols);

            IF v_no_rows = 0 OR v_no_rows IS NULL THEN

                RETURN NULL;

            END IF;

            LOOP
                g_tab_bond.EXTEND;
                v_row_data  :=  SUBSTR(
                                    v_cur_val,
                                    1 , INSTR(v_cur_val, v_bulk_sep, 1, v_no_dim * v_no_cols)
                                );


                v_cur_val   :=  SUBSTR(
                                v_cur_val,
                                INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                            );

                v_bb_unique :=  SUBSTR(
                                    v_row_data,
                                    INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                    INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,1)
                                );

                v_conv_fctr :=  SUBSTR(
                                    v_row_data,
                                    INSTR(v_row_data,v_bulk_sep,1,3)+1,
                                    INSTR(v_row_data,v_bulk_sep,1,4)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,3)
                                );

                g_tab_bond(
                    g_tab_bond.LAST
                )                    :=  obj_bondfctr(
                                             extern_id    =>  NULL,
                                             invest_id    =>  NULL,
                                             dv_bond_id   =>  v_bb_unique,
                                             fut_sec_id   =>  NULL,
                                             conv_factor  =>  v_conv_fctr,
                                             bond_exist   =>  NULL,
                                             request_id   =>  NULL,
                                             bond_sec_id  =>  NULL,
                                             is_dormant   =>  NULL
                                         );


           EXIT WHEN TRIM(v_cur_val) IS NULL;
           END LOOP;

       END LOOP;

       v_str_del := v_bulk_sep||CONST_PRCE_IND||v_bulk_sep||v_no_rows||v_bulk_sep||v_no_cols||v_bulk_sep;

       FOR v_data IN (
           SELECT
               CONST_CHAR_IND||v_bulk_sep||t.dv_bond_id||v_bulk_sep  bond_id,
               CONST_PRCE_IND||v_bulk_sep||t.conv_factor||v_bulk_sep conv_factor
           FROM
               TABLE(CAST(g_tab_bond AS typ_bond_fctr)) t
           ORDER BY t.dv_bond_id
           )
       LOOP

           v_str := v_str||v_data.bond_id||v_data.conv_factor;

       END LOOP;


       RETURN v_str_del||v_str;

    EXCEPTION
        WHEN others THEN

            RAISE_APPLICATION_ERROR(-20080,'populate_dvbonds() : ' || SQLERRM);

    END populate_dvbonds;


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
    RETURN BOOLEAN
    AS

        v_bb_unique         sec_external_id.extern_id%TYPE;
        v_conv_fctr         cons_rel_stat.conv_factor%TYPE;
        v_cur_val           VARCHAR2(32767);
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER := NULL;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(200);
        v_index             PLS_INTEGER := 0;
        v_bond_sec_id       vendor_request.sec_id%TYPE;
        v_request_id        vendor_request.request_id%TYPE        := p_inRequest_id;
        v_product_id        vendor_request.vendor_product_id%TYPE := p_inProduct_id;
        c_proc_func_name    VARCHAR2(32)    := 'get_future_data';         --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD


    BEGIN
        g_tab_bond.delete;

        display_message('get_future_data[Request_id]:'||v_request_id);
        c_proc_loc := 'vendor_req_messages-vendor_request';                              --TD3787 10/21/2008 DuttaD

        FOR v_data IN
            (
            SELECT /*+ index(vrm,vendor_req_messages_ix1) */
                vr.ext_id           extern_id,
                vr.sec_id           fut_sec_id,
                vr.invest_id        invest_id,
                vrm.column_value    str
            FROM
                vendor_req_messages vrm,
                vendor_request      vr

            WHERE
                vrm.column_nm        = BLMBRG_COMMON_PKG.CONST_FUT_DLVRBLE_BNDS_UNIQUE AND
                vrm.request_id       = v_request_id                                AND
                vrm.request_id       = vr.request_id                               AND
                vr.vendor_product_id = v_product_id

            )
        LOOP


            v_cur_val   :=  DBMS_LOB.SUBSTR(v_data.str, 32767, 1);
            v_bulk_sep  :=  SUBSTR(v_cur_val, 1, 1);
            v_cur_val   :=  SUBSTR(v_cur_val, 2);

            v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
            v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

            v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
            v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

            v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
            v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

            display_message('get_future_data[Request_id]:'||v_request_id||' No Rows: '||v_no_rows||' No. Cols: '||v_no_cols);

            IF v_no_rows = 0 OR v_no_rows IS NULL THEN

                RETURN FALSE;

            END IF;

            LOOP
                g_tab_bond.EXTEND;
                v_row_data  :=  SUBSTR(
                                    v_cur_val,
                                    1 , INSTR(v_cur_val, v_bulk_sep, 1, v_no_dim * v_no_cols)
                                );


                v_cur_val   :=  SUBSTR(
                                v_cur_val,
                                INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                            );

                v_bb_unique :=  SUBSTR(
                                    v_row_data,
                                    INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                    INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,1)
                                );

                v_conv_fctr :=  SUBSTR(
                                    v_row_data,
                                    INSTR(v_row_data,v_bulk_sep,1,3)+1,
                                    INSTR(v_row_data,v_bulk_sep,1,4)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,3)
                                );

                v_bond_sec_id :=   get_sec_id_extern_data(
                                       v_bb_unique,
                                       BLMBRG_COMMON_PKG.CONST_BB_UNIQUE
                                       );

                display_message('get_future_data:cv '||v_conv_fctr);
                g_tab_bond(
                    g_tab_bond.LAST
                )                   :=  obj_bondfctr(
                                            extern_id    =>  v_data.extern_id,
                                            invest_id    =>  v_data.invest_id,
                                            dv_bond_id   =>  v_bb_unique,
                                            fut_sec_id   =>  v_data.fut_sec_id,
                                            conv_factor  =>  v_conv_fctr,
                                            bond_exist   =>  is_bond_exist(v_bb_unique),
                                            request_id   =>  get_sec_request_id(v_bond_sec_id),
                                            bond_sec_id  =>  v_bond_sec_id,
                                            is_dormant   =>  is_dormant(v_bb_unique)
                                        );
                display_message(' bondsec : '||v_bond_sec_id||' req_id: '||get_sec_request_id(v_bond_sec_id)||
                ' Dor: '||is_dormant(v_bb_unique)||' Be: '||is_bond_exist(v_bb_unique)||' bbu: '||
                v_data.fut_sec_id);

           EXIT WHEN TRIM(v_cur_val) IS NULL;
           END LOOP;

       END LOOP;


       IF g_tab_bond.EXISTS(1) THEN

       display_message('get_future_data-Data exists-[Request_id]:'||v_request_id);
           blmbrg_request_pkg.g_tab_bond := g_tab_bond;
           RETURN true;

       ELSE

           display_message('get_future_data-No Data exists-[Request_id]:'||v_request_id);
           RETURN false;

       END IF;

    EXCEPTION
        WHEN value_error THEN

            display_message('get_future_data: '||v_request_id);
            RETURN FALSE;

        WHEN others THEN

            RAISE_APPLICATION_ERROR(-20080,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'|| SQLERRM);     --TD3787 10/21/2008 DuttaD
    END get_future_data;

    /************************** insert_vendor_request ****************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Private
    ***  Purpose:       Procedure to insert a row into vendor_request
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

    FUNCTION insert_vendor_request(
        p_inProduct_id         vendor_request.vendor_product_id%TYPE,
        p_inRequest_id         vendor_request.request_id%TYPE,
        p_inExt_id             vendor_request.ext_id%TYPE,
        p_inRequest_grp_nm     vendor_request.request_grp_nm%TYPE,
        p_inRequest_person_id  vendor_request.request_person_id%TYPE,
        p_inExt_id_typ_cd      vendor_request.ext_id_typ_cd%TYPE

    )
    RETURN vendor_request.request_id%TYPE
    AS

        v_request_id         vendor_request.request_id%TYPE;

    BEGIN
            --
            -- Insert a new into vrm
            --

            INSERT INTO vendor_request (
                vendor_product_id,
                request_id,
                request_grp_nm,
                ext_id_typ_cd,
                ext_id,
                action_cd,
                entity_cd,
                request_status_cd,
                forced_scrub_flg,
                request_person_id,
                scrub_dt,
                ins_login,
                ins_ts
            ) VALUES (
                p_inProduct_id,
                vendor_request_seq.NEXTVAL,
                p_inRequest_grp_nm,
                p_inExt_id_typ_cd,
                p_inExt_id,
                BLMBRG_REQUEST_PKG.c_setup_action,
                BLMBRG_REQUEST_PKG.c_security_entity,
                BLMBRG_REQUEST_PKG.c_new_state,
                BLMBRG_REQUEST_PKG.c_forced_scrub,
                p_inRequest_person_id,
                SYSDATE,
                USER,
                SYSDATE
            )
            RETURNING
                request_id
            INTO
                v_request_id;

            RETURN v_request_id;

    EXCEPTION
        WHEN others THEN

            display_message('insert_vendor_request(others): '||p_inRequest_id);
            RAISE_APPLICATION_ERROR(-20010,'insert_vendor_request : '||SQLERRM);
    END insert_vendor_request;

     /**************************  insert_vendor_request ************************
     ***
     ***  Author:        Deon
     ***  Date Created:  01/22/2006
     ***  Type:          Private
     ***  Purpose:       Inserts new record into vendor_rel_request table
     ***
     ***  Changes:       Copied from blmbrg_request_pkg on 4/4/2006 HillD
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *************************************************************************/
    PROCEDURE insert_vendor_rel_request(
        p_inRequest_id          vendor_request.request_id%TYPE,
        p_inRelated_request_id  vendor_request.request_id%TYPE,
        p_inActive_flg          vendor_rel_request.active_flg%TYPE default BLMBRG_COMMON_PKG.CONST_Y
    )
    AS

        v_count      PLS_INTEGER := 0;

    BEGIN

        SELECT
            COUNT(*)
        INTO
            v_count
        FROM
            vendor_rel_request
        WHERE
            request_id          =  p_inRequest_id         AND
            related_request_id  =  p_inRelated_request_id;

        IF v_count = 0 THEN

            INSERT INTO vendor_rel_request(
                request_id,
                related_request_id,
                active_flg,
                ins_ts,
                ins_login
            ) VALUES (
                p_inRequest_id,
                p_inRelated_request_id,
                p_inActive_flg,             -- TD2605 HillD 6/29/2006 some processes just track relationship but do not wait
                SYSDATE,
                USER
            );

        ELSE

            UPDATE
                vendor_rel_request
            SET
                active_flg          = p_inActive_flg,   -- TD2605 HillD 6/29/2006 some processes just track relationship but do not wait
                upd_ts              = SYSDATE,
                upd_login           = USER
            WHERE
                request_id          = p_inRequest_id  AND
                related_request_id  = p_inRelated_request_id;
       END IF;

    EXCEPTION
        WHEN OTHERS THEN

            display_message(' insert_vendor_rel_request ERROR '||SQLERRM);
            RAISE_APPLICATION_ERROR(-20010,'insert_vendor_rel_request : '||SQLERRM);

    END insert_vendor_rel_request;

    /**************************  update_vendor_request **************************
     ***
     ***  Author:        NatarS
     ***  Date Created:  11/06/2001
     ***  Type:          Local
     ***  Purpose:       update the vendor_request table for the status on the
     ***                 request.
     ***
     ***  Changes:       Copied from blmbrg_request_pkg on 4/4/2006 HillD
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
    PROCEDURE update_vendor_request(
        p_product_id                IN      vendor_request.vendor_product_id%TYPE,
        p_request_id                IN      vendor_request.request_id%TYPE,
        p_request_status_cd         IN      vendor_request.request_status_cd%TYPE,
        p_errmsg                    IN      VARCHAR2                            DEFAULT NULL,
        p_invest_id                 IN      security_tbl.invest_id%TYPE         DEFAULT NULL,
        p_wmc_isr_id                IN      issuer.wmc_isr_id%TYPE              DEFAULT NULL,
        p_ext_id                    IN      vendor_request.ext_id%TYPE          DEFAULT NULL,
        p_ext_id_typ_cd             IN      vendor_request.ext_id_typ_cd%TYPE   DEFAULT NULL,
        p_inRelated_request_id      IN      vendor_request.request_id%TYPE      DEFAULT NULL
    )
    IS

    BEGIN

        /*
            08/22/2002 Shashi : Scrub date is updated here to SYSDATE only at end of 500
            for all other steps it is not changed.
            Scrub date should not be changed anywhere else
        */

        UPDATE  vendor_request SET
            vendor_errmsg       =   NVL(SUBSTR(p_errmsg,1,255),vendor_errmsg),
            forced_scrub_flg    =   DECODE(
                                        p_request_status_cd,
                                        600,NULL,
                                        forced_scrub_flg
                                    ),
            scrub_dt            =   DECODE(p_request_status_cd,600,SYSDATE,scrub_dt),
            invest_id           =   NVL(p_invest_id,invest_id),
            wmc_isr_id          =   NVL(p_wmc_isr_id,wmc_isr_id),
            request_status_cd   =   p_request_status_cd,
            ext_id              =   NVL(p_ext_id,ext_id),
            ext_id_typ_cd       =   NVL(p_ext_id_typ_cd,ext_id_typ_cd),
            upd_ts              =   SYSDATE,
            upd_login           =   c_login_name
        WHERE
            request_id          =   p_request_id    AND
            vendor_product_id   =   p_product_id;

        -- TD2605 HillD 06/28/2006 added the update statement below
        -- When reusing a request id we start fresh with related requests
        IF p_request_status_cd = BLMBRG_REQUEST_PKG.c_new_state THEN

            UPDATE vendor_rel_request
            SET active_flg  = 'N',
                upd_ts      = SYSDATE,
                upd_login   = USER
            WHERE
                request_id = p_request_id  AND
                active_flg = 'Y';

        END IF;

    EXCEPTION
        WHEN OTHERS THEN

            RAISE_APPLICATION_ERROR(-20010,'update_vendor_request : '||SQLERRM);

    END update_vendor_request;

    /************************** get_future_chain *******************************
    ***
    ***  Author:        Naveen Nalla
    ***  Date Created:  11/11/2005
    ***  Type:          Public
    ***  Purpose:       Function to get the future chain
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
    RETURN DBMS_SQL.VARCHAR2_TABLE          -- TD2566 6/10/2006 HillD
    AS

        v_id_unique         sec_external_id.extern_id%TYPE;
        v_fctr              cons_rel_stat.conv_factor%TYPE;
        v_cur_val           VARCHAR2(32767);
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(200);
        i                   PLS_INTEGER := 0;
        v_request_id        vendor_request.request_id%TYPE        := p_inRequest_id;
        v_product_id        vendor_request.vendor_product_id%TYPE := p_inProduct_id;
        v_tab_chain         DBMS_SQL.VARCHAR2_TABLE;                -- TD2566 5/10/2006 HillD

    BEGIN

        display_message('get_future_chain: '||p_inRequest_id);

        v_cur_val  := blmbrg_common_pkg.get_bb_vrq_data(
                            p_inProduct_id,
                            p_inRequest_id,
                            BLMBRG_COMMON_PKG.CONST_FUT_CHAIN
                            );

        IF  v_cur_val IS NOT NULL
        THEN

           -- Parse the string

            FOR v_data IN
                (
                 SELECT /*+ index(vrm,vendor_req_messages_ix1) */
                     vrm.column_value str
                 FROM
                     vendor_req_messages  vrm
                 WHERE
                     vrm.column_nm =  BLMBRG_COMMON_PKG.CONST_FUT_CHAIN    AND
                     vrm.request_id = p_inRequest_id
                 )
            LOOP


                v_cur_val   :=  DBMS_LOB.SUBSTR(v_data.str, 30000, 1);
                v_bulk_sep  :=  SUBSTR(v_cur_val, 1, 1);
                v_cur_val   :=  SUBSTR(v_cur_val, 2);

                v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
                v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

                v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
                v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);

                v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val, 1, INSTR(v_cur_val, v_bulk_sep, 1, 1)-1));
                v_cur_val   :=  SUBSTR(v_cur_val, INSTR(v_cur_val, v_bulk_sep, 1, 1) +1);



                display_message('V: '||v_cur_val ||' dims: '||v_no_dim||' rows:  '||v_no_rows);
                LOOP
                    i           :=  i + 1;
                    v_row_data  :=  SUBSTR(
                                        v_cur_val,
                                        1 , INSTR(v_cur_val, v_bulk_sep, 1, v_no_dim * v_no_cols)
                                    );


                    v_cur_val   :=  SUBSTR(
                                        v_cur_val,
                                        INSTR(v_cur_val, v_bulk_sep, 1, v_no_dim * v_no_cols)+1
                                    );

                    v_tab_chain(i)  :=  SUBSTR(
                                        v_row_data,
                                        INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                        INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,1)
                                    );

                    display_message('get_future_chain: '||p_inRequest_id ||' ext_id: '|| v_tab_chain(i));

                EXIT WHEN TRIM(v_cur_val) IS NULL;
                END LOOP;

            END LOOP;

        END IF;

        RETURN v_tab_chain;         -- TD2566 6/10/2006 HillD

    END get_future_chain;

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
    RETURN BOOLEAN
    AS

    v_request_id        vendor_request.request_id%TYPE        := p_inRequest_id;
    v_product_id        vendor_request.vendor_product_id%TYPE := p_inProduct_id;
    v_sec_id            vendor_request.sec_id%TYPE            := NULL;
    v_sec_request_id    vendor_request.request_id%TYPE        := NULL;
    v_new_request_id    vendor_request.request_id%TYPE        := NULL;
    v_request_grp_nm    vendor_request.request_grp_nm%TYPE    := NULL;
    v_ext_id_typ_cd     vendor_request.ext_id_typ_cd%TYPE     := NULL;
    v_request_person_id vendor_request.request_person_id%TYPE := NULL;
    v_action_cd         vendor_request.action_cd%TYPE;
    v_cur_val           VARCHAR2(20);
    v_maint_status_cd   CHAR(1) := NULL;
    v_check             PLS_INTEGER;
    v_cur_fut           VARCHAR2(20);
    v_expire_month      VARCHAR2(2);
    v_expire_year       VARCHAR2(4);
    v_ret_status        BOOLEAN;
    v_tab_chain         DBMS_SQL.VARCHAR2_TABLE;            -- TD2566 6/10/2006 HillD

    BEGIN

        display_message('setup_fut_chain_req:' ||p_inRequest_id);
        v_cur_fut :=    blmbrg_common_pkg.get_bb_vrq_data(
                            p_inProduct_id,
                            p_inRequest_id,
                            'TICKER'
                        ) ||
                        blmbrg_common_pkg.get_bb_vrq_data(
                            p_inProduct_id,
                            p_inRequest_id,
                            'MARKET_SECTOR_DES'
                        );
        --
        -- Get the future chain
        --
        v_tab_chain := maintain_bb_sec_pkg.get_future_chain(v_product_id, v_request_id);    -- TD2566 6/10/2006 HillD

        IF v_tab_chain.EXISTS(1) THEN           -- TD2566 6/10/2006 HillD
            -- Check for existing futures in DB.
            FOR i IN v_tab_chain.FIRST .. v_tab_chain.LAST LOOP
                display_message('setup_fut_chain_req: ' || v_tab_chain(i));
                IF v_cur_fut != v_tab_chain(i) THEN

                    BEGIN

                        SELECT sec_id, maint_status_cd
                          INTO v_sec_id, v_maint_status_cd
                          FROM security_tbl
                         WHERE sym = SUBSTR(TRIM(v_tab_chain(i)),1,INSTR(TRIM(v_tab_chain(i)),' ',-1)-1);  -- remove asset type from end of string

                    EXCEPTION
                        WHEN NO_DATA_FOUND THEN

                            v_sec_id            := NULL;
                            v_maint_status_cd   := NULL;
                    END;
                    display_message('setup_fut_chain_req[sec_id]: ' || v_sec_id || ' ' || v_tab_chain(i));

                    IF v_sec_id IS NULL THEN

                        -- TD#3569  commented and added 2008-Aug-01 Cognizant Technology Solutions
                        -- removed limitation of 24 months and any Future expiration Date

                        -- IF get_security_expire_dt(v_tab_chain(i)) > TRUNC(SYSDATE,'Month') THEN
                        -- BETWEEN TRUNC(SYSDATE,'Month') AND ADD_MONTHS(TRUNC(SYSDATE,'Month'),24)  THEN

                        -- TD#3569  Changes end

                            -- if the expiration date is prior to 2 years from now then Setup the entity.
                            display_message('Related Setup:' ||p_inRequest_id);
                            -- enque 800 step (no need to set current request to WIP state as it is not dependent)
                            BLMBRG_COMMON_PKG.enqueue_request(
                                p_inProduct_id,
                                p_inRequest_id,
                                blmbrg_request_pkg.c_setup_action,
                                blmbrg_request_pkg.c_related_entity_setup_state
                            );
                            EXIT;  -- only need to enque 800 step once regardless of how many in chain will be setup.

                         -- END IF; -- Commented for TD#3569

                    END IF; --v_sec_id IS NULL

                END IF; --v_cur_fut != v_tab_chain(i)

            END LOOP; --for i

        END IF; --get_future_chain

        RETURN TRUE;

    EXCEPTION
        WHEN OTHERS THEN

            display_message('setup_fut_chain_req(): '||p_inRequest_id||' sec_id: '||p_inSec_id||SQLERRM);
            RAISE_APPLICATION_ERROR(-20090,'setup_fut_chain_req: '||SQLERRM);
            RETURN FALSE;

    END setup_fut_chain_req;

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
    ***  03/03/2005 HillD   implementation completed TD1674
    ***
    *****************************************************************************/

    FUNCTION   setup_future_chain(
                    p_inProduct_id vendor_request.vendor_product_id%TYPE,
                    p_inRequest_id vendor_request.request_id%TYPE
                )
    RETURN BOOLEAN
    AS

    v_request_id        vendor_request.request_id%TYPE        := p_inRequest_id;
    v_product_id        vendor_request.vendor_product_id%TYPE := p_inProduct_id;
    v_sec_id            vendor_request.sec_id%TYPE            := NULL;
    v_sec_request_id    vendor_request.request_id%TYPE        := NULL;
    v_new_request_id    vendor_request.request_id%TYPE        := NULL;
    v_request_grp_nm    vendor_request.request_grp_nm%TYPE    := NULL;
    v_ext_id_typ_cd     vendor_request.ext_id_typ_cd%TYPE     := NULL;
    v_request_person_id vendor_request.request_person_id%TYPE := NULL;
    v_action_cd         vendor_request.action_cd%TYPE;
    v_req_status_cd     vendor_request.request_status_cd%TYPE;
    v_cur_val           VARCHAR2(20);
    v_maint_status_cd   CHAR(1) := NULL;
    v_check             PLS_INTEGER;
    v_cur_fut           VARCHAR2(20);
    v_expire_month      VARCHAR2(2);
    v_expire_year       VARCHAR2(4);
    v_upd_ts            vendor_request.upd_ts%TYPE := NULL;
    v_tab_chain         DBMS_SQL.VARCHAR2_TABLE;                    -- TD2566 6/10/2006 HillD

    BEGIN

        display_message('setup_future_chain[request_id]: ' || v_request_id);

        -- Get the request group name from vrm
        SELECT request_grp_nm, ext_id_typ_cd, request_person_id, action_cd
          INTO v_request_grp_nm,
               v_ext_id_typ_cd,
               v_request_person_id,
               v_action_cd
          FROM vendor_request
         WHERE request_id = p_inRequest_id
           AND vendor_product_id = p_inProduct_id;

        v_cur_fut :=    blmbrg_common_pkg.get_bb_vrq_data(
                            p_inProduct_id,
                            p_inRequest_id,
                            'TICKER'
                        ) || ' ' ||                     -- TD2567 HillD 4/4/2006
                        blmbrg_common_pkg.get_bb_vrq_data(
                            p_inProduct_id,
                            p_inRequest_id,
                            'MARKET_SECTOR_DES'
                        );
        --
        -- Get the future chain
        --
        v_tab_chain := maintain_bb_sec_pkg.get_future_chain(v_product_id, v_request_id);    -- TD2566 6/10/2006 HillD

        IF v_tab_chain.EXISTS(1) THEN               -- TD2566 6/10/2006 HillD
            -- Check for existing futures in DB.
            FOR i IN v_tab_chain.FIRST .. v_tab_chain.LAST LOOP
                display_message('setup_future_chain[sec_id]: ' || v_tab_chain(i));
                IF v_cur_fut != v_tab_chain(i) THEN

                    display_message('setup_future_chain[sec_id]: ' || v_sec_id || ' ' ||
                            v_tab_chain(i));
                    BEGIN

                        SELECT sec_id, maint_status_cd
                          INTO v_sec_id, v_maint_status_cd
                          FROM security_tbl
                         WHERE sym = SUBSTR(TRIM(v_tab_chain(i)),1,INSTR(TRIM(v_tab_chain(i)),' ',-1)-1);  -- remove asset type from end of string

                    EXCEPTION
                        WHEN NO_DATA_FOUND THEN

                            v_sec_id            := NULL;
                            v_maint_status_cd   := NULL;
                    END;

                    IF v_sec_id IS NULL THEN

                        -- TD#3569  commented and added 2008-Aug-01 Cognizant Technology Solutions
                        -- removed limitation of 24 months and any Future expiration Date

                        -- IF get_security_expire_dt(v_tab_chain(i)) > TRUNC(SYSDATE,'Month') THEN
                        -- BETWEEN TRUNC(SYSDATE,'Month') AND ADD_MONTHS(TRUNC(SYSDATE,'Month'),24)  THEN

                        -- TD#3569  Changes end

                            -- Check if vendor_request exists for the current date
                            -- begin TD2567 HillD 4/4/2006 modifications
                            IF v_request_grp_nm IN (BLMBRG_COMMON_PKG.CONST_SEC_SCRUB,
                                                    BLMBRG_COMMON_PKG.CONST_BMK_SCRUB
                                                   )                                     THEN

                                v_request_grp_nm := BLMBRG_COMMON_PKG.CONST_SCRUB_SETUP;

                            END IF;

                            BEGIN
                            SELECT
                                    request_id, request_status_cd, upd_ts
                            INTO
                                    v_sec_request_id, v_req_status_cd, v_upd_ts
                            FROM
                                    vendor_request vr
                            WHERE
                                vendor_product_id   = v_product_id                          AND
                                    request_grp_nm      = v_request_grp_nm                      AND
                                    ext_id_typ_cd       = 'T'                                   AND
                                ext_id              = v_tab_chain(i)                        AND
                                action_cd           = BLMBRG_REQUEST_PKG.c_setup_action     AND
                                entity_cd           = BLMBRG_REQUEST_PKG.c_security_entity  AND
                                    request_id          = (select MAX(request_id)
                                                             FROM vendor_request vrx
                                                             WHERE
                                                                vr.vendor_product_id     = vrx.vendor_product_id    AND
                                                                vr.request_grp_nm        = vrx.request_grp_nm       AND
                                                                vr.entity_cd             = vrx.entity_cd            AND
                                                                vr.action_cd             = vrx.action_cd            AND
                                                                vr.ext_id_typ_cd         = vrx.ext_id_typ_cd        AND
                                                                vr.ext_id                = vrx.ext_id
                                                            );
                            EXCEPTION
                                WHEN NO_DATA_FOUND THEN

                                    v_sec_request_id    := NULL;
                                    v_req_status_cd     := NULL;
                                    v_upd_ts            := NULL;

                            END;
                            -- vendor_rel_request is used but there is not WIP dependency for fut_chain
                            IF v_sec_request_id IS NULL THEN
                                v_new_request_id    :=  blmbrg_request_pkg.insert_vendor_request(
                                                            v_product_id,
                                                            v_request_id,
                                                            v_request_grp_nm,
                                                            'T',
                                                            v_tab_chain(i),
                                                            BLMBRG_REQUEST_PKG.c_security_entity,
                                                            BLMBRG_REQUEST_PKG.c_setup_action,
                                                            v_request_person_id,
                                                            BLMBRG_REQUEST_PKG.c_new_state,
                                                            BLMBRG_REQUEST_PKG.c_forced_scrub,
                                                            NULL,
                                                            NULL,
                                                            NULL,
                                                            NULL,
                                                            NULL,
                                                            NULL,
                                                            BLMBRG_COMMON_PKG.CONST_N   --TD2605 HillD 06/07/2006 related request should be inactive
                                                        );

                                display_message('New Future request_id: ' || v_new_request_id || ' bb_unique: ' ||
                                                v_tab_chain(i));
                            ELSE -- request_id already exists

                                display_message('Security NSS already requested with request_id: ' ||
                                          v_sec_request_id);

                                insert_vendor_rel_request(v_request_id,v_sec_request_id,BLMBRG_COMMON_PKG.CONST_N);   -- create the relationship if it does not already exist

                                IF v_upd_ts < TRUNC(SYSDATE) THEN -- if the request not created today

                                    update_vendor_request(
                                        v_product_id,
                                        v_sec_request_id,
                                        BLMBRG_REQUEST_PKG.c_new_state
                                    );

                                END IF;

                            END IF;
                            -- end TD2567 HillD 4/4/2006 modifications

                        --  END IF; -- Commented for TD#3569

                    END IF; --v_sec_id IS NULL

                END IF; --v_cur_fut != v_tab_chain(i)

            END LOOP; --for i

        END IF; --get_future_chain

        RETURN TRUE;

    EXCEPTION
        WHEN others THEN
            display_message('setup future chain: ' || SQLERRM);
            RAISE_APPLICATION_ERROR(-20080, 'setup_future_chain : ' || SQLERRM);
            RETURN FALSE;
    END setup_future_chain;

    /************************** get_idx_invest_id **********************************
     ***
     ***  Author:           KampeTA
     ***  Date Created:     13 January 2006
     ***  Type:             Public
     ***  Purpose:          Reutrn the invewst_id for the VENDOR_TICKER
     ***                    Added for TD2316
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
    RETURN security_tbl.invest_id%TYPE
    IS

        v_invest_id        security_tbl.invest_id%TYPE   :=  NULL;

    BEGIN
        SELECT
            invest_id
        INTO
            v_invest_id
        FROM
            security_tbl s
        WHERE
            s.sec_status_cd    = 'A'     AND
            s.ticker_asset_typ = 'INDEX' AND
            s.vendor_ticker    = p_inVendor_Ticker
        ;

    RETURN v_invest_id;

    EXCEPTION
        WHEN TOO_MANY_ROWS THEN

             RETURN NULL;

    END get_idx_invest_id;

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
    RETURN BOOLEAN
    AS
        v_exists            VARCHAR2(1)     := NULL;
    BEGIN

        SELECT
            'Y'
        INTO
            v_exists
        FROM
            DUAL
        WHERE EXISTS
            (
            SELECT
                1
            FROM
                ref_rating
            WHERE
                rating          =  p_inRating        AND
                rating_srce_cd  =  p_inRating_srce_cd
             );

        IF v_exists = 'Y' THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;

    EXCEPTION

        WHEN NO_DATA_FOUND THEN

            RETURN FALSE;

    END is_rating_valid;

    /*****************************  get_security_expire_dt ***************************
     ***
     ***  Author:        HillD
     ***  Date Created:  03/16/2006
     ***  Type:          Public
     ***  Purpose:       calculates the expire date of a future based on it's ticker.
     ***                 assumes that the tickers are all in the future.
     ***
     ***  Changes:
     ***
     ***  When     Who        What
     ***  ----     ---        ----
     ***
     ***
     *****************************************************************************/
   FUNCTION get_security_expire_dt (
       p_inTicker             IN  VARCHAR2
   )
   RETURN DATE
   IS

        v_expire_month      VARCHAR2(2);
        v_expire_year       VARCHAR2(4);

   BEGIN

        display_message('get_security_expire_dt:' ||p_inTicker);
        -- industry standard ticker for futures
        -- char 1-2 = base, char 3 = expire month, char 4 = expire year
        -- recycled every 10 years.
        CASE
            WHEN SUBSTR(p_inTicker,3,1) = 'F'    THEN
                v_expire_month := '01';
            WHEN SUBSTR(p_inTicker,3,1) = 'G'    THEN
                v_expire_month := '02';
            WHEN SUBSTR(p_inTicker,3,1) = 'H'    THEN
                v_expire_month := '03';
            WHEN SUBSTR(p_inTicker,3,1) = 'J'    THEN
                v_expire_month := '04';
            WHEN SUBSTR(p_inTicker,3,1) = 'K'    THEN
                v_expire_month := '05';
            WHEN SUBSTR(p_inTicker,3,1) = 'M'    THEN
                v_expire_month := '06';
            WHEN SUBSTR(p_inTicker,3,1) = 'N'    THEN
                v_expire_month := '07';
            WHEN SUBSTR(p_inTicker,3,1) = 'Q'    THEN
                v_expire_month := '08';
            WHEN SUBSTR(p_inTicker,3,1) = 'U'    THEN
                v_expire_month := '09';
            WHEN SUBSTR(p_inTicker,3,1) = 'V'    THEN
                v_expire_month := '10';
            WHEN SUBSTR(p_inTicker,3,1) = 'X'    THEN
                v_expire_month := '11';
            WHEN SUBSTR(p_inTicker,3,1) = 'Z'    THEN
                v_expire_month := '12';
        END CASE;
        -- Determine which year the last character corresponds to
        -- Assumes that futures are at most 2 years in the past
        CASE
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(SYSDATE, 'yyyy'), 4, 1)                        THEN
                v_expire_year := TO_CHAR(SYSDATE, 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 1 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 1 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 2 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 2 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 3 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 3 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 4 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 4 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 5 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 5 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 6 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 6 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 7 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 7 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 8 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 8 * 12), 'yyyy');
            WHEN SUBSTR(p_inTicker,4,1) = SUBSTR(TO_CHAR(add_months(SYSDATE, 9 * 12), 'yyyy'), 4, 1)    THEN
                v_expire_year := TO_CHAR(add_months(SYSDATE, 9 * 12), 'yyyy');
        END CASE;

        RETURN TO_DATE(v_expire_month||v_expire_year,'mmyyyy');

   END get_security_expire_dt;

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
    RETURN NUMBER
    AS
       v_sec_typ1  VARCHAR2(20);
       v_sec_typ2  VARCHAR2(20);
       v_sec_typ3  VARCHAR2(20);
       v_sec_typ4  VARCHAR2(20);

    BEGIN

         SELECT
             sec_typ1,
             sec_typ2,
             sec_typ3,
             sec_typ4
         INTO
             v_sec_typ1,
             v_sec_typ2,
             v_sec_typ3,
             v_sec_typ4
         FROM
             sec_type st
         WHERE
             st.sec_typ_id  =  p_sec_typ_id;


         IF (v_sec_typ1  =  'BOND' AND
             v_sec_typ2  =  'SWPI' AND
             p_db_value  != 0      AND
             (ABS(ABS(p_db_value - p_col_value) / p_db_value)) * 100 < 5 ) THEN


             RETURN 0;

         END IF;


         IF (v_sec_typ1  =  'FUT' AND
             p_db_value  != 0      AND
             (ABS(ABS(p_db_value - p_col_value) / p_db_value)) * 100 < .03 ) THEN


             RETURN 0;

         END IF;


         IF (v_sec_typ1  =  'OPT' AND
             p_db_value  != 0      AND
             (ABS(ABS(p_db_value - p_col_value) / p_db_value)) * 100 < 2.5 ) THEN


             RETURN 0;

         END IF;

         IF (((v_sec_typ1  =  'BOND' AND
             v_sec_typ2  NOT IN ('MB','OTHER') OR
             (v_sec_typ1 = 'CVBND')) AND
             p_db_value  != 0        AND
             (ABS(ABS(p_db_value - p_col_value) / p_db_value)) * 100 < 5 )) THEN


             RETURN 0;

         END IF;


         IF (v_sec_typ1  =  'BOND' AND
             v_sec_typ2   =  'MB'  AND
             p_db_value  != 0      AND
             (ABS(ABS(p_db_value - p_col_value) / p_db_value)) * 100 < .25 ) THEN


             RETURN 0;

         END IF;


         IF (v_sec_typ1  =  'BOND'    AND
             v_sec_typ2   =  'OTHER'  AND
             p_db_value  != 0         AND
             (ABS(p_db_value - p_col_value) / p_db_value) * 100 < 2.5 ) THEN


             RETURN 0;

         END IF;

         RETURN 1;
    END;

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
    RETURN  vendor_req_messages.column_trans_value%TYPE
    IS
        v_return                   CLOB;
        v_column_val               vendor_req_messages_hst.column_value%TYPE;
        v_column_nm                vendor_req_messages_hst.column_nm%TYPE;
        v_column_trans_val         vendor_req_messages_hst.column_trans_value%TYPE;

    BEGIN

        SELECT
            vh.COLUMN_NM,
            vh.COLUMN_VALUE,
            vh.COLUMN_TRANS_VALUE
        INTO
            v_column_nm,
            v_column_val,
            v_column_trans_val
        FROM
            (SELECT
                 H.COLUMN_NM COLUMN_NM,
                 TO_CHAR(H.COLUMN_VALUE) COLUMN_VALUE,
                 H.COLUMN_TRANS_VALUE COLUMN_TRANS_VALUE,
                 RANK() OVER (PARTITION BY COLUMN_NM ORDER BY EFF_DT DESC ) RANK
             FROM
                 VENDOR_REQ_MESSAGES_HST H
             WHERE
                 H.VENDOR_PRODUCT_ID = p_invendor_id AND
                 H.REQUEST_ID        = TO_NUMBER(TRIM(p_inreq_id)) AND
                 H.COLUMN_NM         = p_column_nm  AND
                 H.COL_TRANS_SEQ     = p_incol_trans_seq
            ) vh
        WHERE
            vh.RANK = 1 ;

        IF ( (p_check_val = TO_CHAR(v_column_val)) AND TO_CHAR(v_column_trans_val) IS NOT NULL ) THEN

             v_return := v_column_trans_val;

        ELSE

            v_return := TO_CLOB(TRUNC((p_check_val*365.25)+TRUNC(SYSDATE)));

        END IF;

        RETURN v_return;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

                RETURN NULL;

        WHEN OTHERS THEN

                display_message('get_vndrmsg_hst_transval(): '||SQLERRM );
            RAISE_APPLICATION_ERROR(-20090,'get_vndrmsg_hst_transval():'||SQLERRM);

  END get_vndrmsg_hst_transval;

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
    )
    IS
        v_cur_val           VARCHAR2(32767);
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(200);
        v_cur_row           PLS_INTEGER :=  0;
        v_list_val          VARCHAR2(400);
        v_code_val          sec_attr_list_tbl.code_value%TYPE;
        c_proc_func_name    VARCHAR2(32)    := 'maintain_sec_attr_list_tbl';  --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                          --TD3787 10/21/2008 DuttaD

        bb_bulk_data_exception  EXCEPTION;

        v_maint_ts          DATE        :=  SYSDATE;

    BEGIN
        display_message('maintain_sec_attr_list_tbl : sec_id = ['||p_inSec_id||'], Attr_id ['||p_inAttr_id || ']');

        IF  DBMS_LOB.GETLENGTH(p_inList_data) = 0 THEN

            v_cur_val := null;

        ELSE

            v_cur_val := p_inList_data;

        END IF;
        --
        -- First clear out any existing entries in sec_sttr_list_tbl
        --
        DELETE
        FROM
            sec_attr_list_tbl
        WHERE
            sec_id  = p_inSec_id  AND
            srce_cd = p_inSrce_cd AND
            attr_id = p_inAttr_id
        ;

        IF (v_cur_val IS NULL) THEN

            RETURN; -- nothing to insert, just return after clearing out old rows

        END IF;

        v_bulk_sep  :=  SUBSTR(v_cur_val,1,1);
        v_cur_val   :=  SUBSTR(v_cur_val,2);

        --
        -- this will strip of the number of dim, rows, cols from the string
        --
        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        display_message('Curr data value is: '||v_cur_val);
        display_message(
            'No. of rows: '||v_no_rows||
            ', No. of cols:' ||v_no_cols||
            ', No. of dim:'||v_no_dim
        );

        -- Loop through each value passed and find the
        -- correspoding row in REF_ATTR_VALUE. that is
        -- what is inserted into sec_Attr_list_Tbl
        c_proc_loc := 'ref_attr_value';                                   --TD3787 10/21/2008 DuttaD
        LOOP
            v_row_data  :=  SUBSTR(
                                v_cur_val,
                                1,INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)
                            );

            v_cur_val   :=  SUBSTR(
                                v_cur_val,
                                INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                            );

            v_list_val    :=  SUBSTR(
                                    v_row_data,
                                    INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                    INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,1)
                                );

            display_message('Row data is: '||v_row_data);
            display_message('List value is:'||v_list_val);

            IF (v_list_val IS NOT NULL) THEN
            --
            -- Only attempt to look up and insert if value is not null
            -- 1/18/2007 - KampeTA - modified to look up
            -- based on long dsc instead of short dsc
            --
                SELECT
                    rav.code_value
                INTO
                    v_code_val
                FROM
                    ref_attr_value rav
                WHERE
                    rav.srce_cd = p_inSrce_cd AND
                    rav.attr_id = p_inAttr_id AND
                    UPPER(rav.long_dsc) = UPPER(v_list_val)
                ;

             --
             -- 1/19/2007 KampeTA - modifed to use select and check if row exists or not
             -- Bloomberg is sending duplicates in the same list of values for MUNI_ERP_TYPES
             --
                INSERT INTO sec_attr_list_tbl (
                    sec_id,
                    srce_cd,
                    attr_id,
                    code_value,
                    ins_ts,
                    upd_ts,
                    ins_login,
                    upd_login
                )
                 SELECT
                    p_inSec_id,
                    p_inSrce_cd,
                    p_inAttr_id,
                    v_code_val,
                    SYSDATE,
                    SYSDATE,
                    USER,
                    USER
                  FROM dual
                  WHERE NOT EXISTS (SELECT 1
                                    FROM sec_attr_list_tbl s
                                    WHERE
                                        s.sec_id = p_inSec_id     AND
                                        s.srce_cd = p_inSrce_cd   AND
                                        s.attr_id = p_inAttr_id   AND
                                        s.code_value = v_code_val)
                 ;

                display_message('Inserted data for sec_id = ['||p_inSec_id||'], Attr_id ['||p_inAttr_id || '], code_val [' || v_code_val ||'].');

                v_cur_row   :=  v_cur_row + 1;

            END IF;

            EXIT WHEN TRIM(v_cur_val) IS NULL;

        END LOOP;
        display_message('Number of rows inserted: '||v_cur_row);
        display_message('Maintained data for sec_id = ['||p_inSec_id||'], Attr_id ['||p_inAttr_id || ']');

        IF (v_no_rows <> v_cur_row) THEN
            c_proc_loc := 'bb_bulk_data_exception';
            RAISE bb_bulk_data_exception;

        END IF;

    EXCEPTION
        WHEN no_data_found THEN

           display_message('maintain_sec_attr_list_tbl: No ref_attr_value row found');
            RAISE_APPLICATION_ERROR(
                -20090,
                ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM              --TD3787 10/21/2008 DuttaD
            );

        WHEN bb_bulk_data_exception THEN
            display_message('maintain_sec_attr_list_tbl: Bulk data exception');
            RAISE_APPLICATION_ERROR(
                -20090,
               ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM              --TD3787 10/21/2008 DuttaD
            );

        WHEN OTHERS THEN

            display_message('maintain_sec_attr_list_tbl: Unhandled exception');
            RAISE_APPLICATION_ERROR(
                -20090,
               ':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM              --TD3787 10/21/2008 DuttaD
            );

    END maintain_sec_attr_list_tbl;

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
    RETURN  ref_attr_value.code_value%TYPE
    IS
        v_code_val ref_attr_value.code_value%TYPE;
    BEGIN

        IF p_inDescrType = 'S' THEN
            SELECT
                rav.code_value
            INTO
                v_code_val
            FROM
                ref_attr_value rav
            WHERE
                rav.srce_cd          = p_inSrce_cd AND
                rav.attr_id          = p_inAttr_id AND
                UPPER(rav.short_dsc) = UPPER(p_inDescr)
            ;
        ELSE
            SELECT
                rav.code_value
            INTO
                v_code_val
            FROM
                ref_attr_value rav
            WHERE
                rav.srce_cd         = p_inSrce_cd AND
                rav.attr_id         = p_inAttr_id AND
                UPPER(rav.long_dsc) = UPPER(p_inDescr)
            ;
        END IF;

        RETURN v_code_val;

        EXCEPTION
            WHEN no_data_found THEN

               RETURN NULL;

    END;

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
    RETURN  vendor_req_messages.column_value%TYPE
    AS

       v_column_value      VARCHAR2(32767) := NULL;

    BEGIN

       v_column_value := TRIM(VENDOR_MAP_PKG.my_sys_context(p_inBB_Fld_Id));

       v_column_value := ( CASE
                               WHEN
                                   SUBSTR(v_column_value,1,5) = c_col_prefix
                                   THEN
                                       NULL
                                   ELSE
                                       v_column_value
                           END
                          );

    RETURN v_column_value;

    END check_blk_zero;

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
    RETURN  vendor_req_messages.column_value%TYPE
    AS
        v_column_value     vendor_req_messages.COLUMN_VALUE%TYPE;

    BEGIN

       -- Data Map for MUNI_ERP_TYPES Mnemonic DX007
       v_column_value := check_blk_zero(p_inBB_Fld_Id);

       IF v_column_value IS NOT NULL THEN

           v_column_value := order_erp_types(v_column_value);

       END IF;

        RETURN v_column_value;

    END wrap_erp_types;

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
    RETURN  vendor_req_messages.column_value%TYPE
    AS
        v_nls_date_format           VARCHAR2(100)
                                        :=  VENDOR_MAP_PKG.get_nls_date_format;
        v_bb_interval_dt    interval_dt_schd_stage.interval_dt%TYPE       :=
                    TO_DATE(BLMBRG_COMMON_PKG.get_vrm_column_value(p_inInterval_dt), c_blmbg_date_format);
        v_bb_nxt_cpn_dt     sec_period_data_tbl.next_cpn_dt%TYPE       :=
                    TO_DATE(BLMBRG_COMMON_PKG.get_vrm_column_value(p_inNxt_cpn_dt), c_blmbg_date_format);
        v_sec_id            security_tbl.sec_id%TYPE       :=
                    TO_NUMBER(BLMBRG_COMMON_PKG.get_vrm_column_value(p_inSec_id));
        v_out_trans_value   vendor_req_messages.column_value%TYPE       := NULL;
        v_data              vendor_req_messages.column_value%TYPE       := NULL;
        v_curr_interval_dt  interval_dt_schd_stage.interval_dt%TYPE     := NULL;
        v_idr_nxt_cpn_dt    sec_period_data_tbl.next_cpn_dt%TYPE        := NULL;
        v_bulk_sep          VARCHAR2(1);
        v_ctr               PLS_INTEGER                                 := 0;
        v_no_cols           PLS_INTEGER                                 := 0;
        v_no_dim            PLS_INTEGER                                 := 0;
        v_no_rows           PLS_INTEGER                                 := 0;
        v_cur_val           VARCHAR2(32767)                             := NULL;
        v_orig_val          VARCHAR2(32767);
        v_bulk_data         vendor_req_messages.wmc_column_value%TYPE   := NULL;
        v_append            BOOLEAN                                     := FALSE;
        v_update            BOOLEAN                                     := FALSE;


    BEGIN

        -- get the next_cpn_dt stored in the IDR database
        BEGIN
            SELECT
                s.next_cpn_dt
            INTO
                v_idr_nxt_cpn_dt
            FROM
                sec_period_data_tbl s  -- sec_period_data s (this view includes variants)
            WHERE
                s.sec_id = v_sec_id;
        EXCEPTION
            WHEN no_data_found THEN

                v_idr_nxt_cpn_dt := NULL;
        END;

        -- get the interval_dt stored in the IDR dabase that is in the range of coupon dates

        IF v_bb_interval_dt > v_bb_nxt_cpn_dt THEN

            BEGIN
                SELECT
                    i.interval_dt
                INTO
                    v_curr_interval_dt
                FROM
                    interval_dt_schd_stage i
                WHERE
                    interval_dt > v_bb_nxt_cpn_dt               AND
                    nvl(i.invalid_flg,'N')  = 'N'               AND
                    i.sec_id                =  v_sec_id;
            EXCEPTION
                WHEN no_data_found THEN

                    v_curr_interval_dt := NULL;
            END;

        ELSE  -- v_bb_interval_dt <= v_bb_nxt_cpn_dt

            BEGIN
                SELECT
                    i.interval_dt
                INTO
                    v_curr_interval_dt
                FROM
                    interval_dt_schd_stage i
                WHERE
                    (   (   nvl(v_idr_nxt_cpn_dt,v_bb_nxt_cpn_dt) = v_bb_nxt_cpn_dt    AND
                            interval_dt = ( select  max(interval_dt)
                                            from    interval_dt_schd_stage
                                            where   interval_dt <= v_bb_nxt_cpn_dt  AND
                                                    sec_id = v_sec_id               AND
                                                    nvl(invalid_flg,'N')  = 'N')
                        )                                                               OR
                        (   interval_dt > v_idr_nxt_cpn_dt                              AND
                            interval_dt <= v_bb_nxt_cpn_dt
                        )
                    )                                                                       AND
                    nvl(i.invalid_flg,'N')  = 'N'                                           AND
                    i.sec_id                =  v_sec_id;
            EXCEPTION
                WHEN no_data_found THEN

                    v_curr_interval_dt := NULL;
            END;

        END IF;
        -- Get existing schedule
        v_orig_val  :=  get_bulk_data(
                            v_sec_id,
                            c_interval_dt_schd
                        );
        v_bulk_sep  :=  SUBSTR(v_orig_val,1,1);
        v_cur_val   :=  SUBSTR(v_orig_val,2);
        --
        -- this will strip of the number of dim, rows, cols from the string
        --
        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        display_message('Curr data value is: '||v_cur_val);
        display_message(
            'No. of rows: '||v_no_rows||
            ', No. of cols:' ||v_no_cols||
            ', No. of dim:'||v_no_dim
        );
        display_message('v_curr_interval_dt is: '||v_curr_interval_dt);
        display_message('v_idr_nxt_cpn_dt is: '||v_idr_nxt_cpn_dt);
        display_message('v_bb_interval_dt is: '||v_bb_interval_dt);
        display_message('v_bb_nxt_cpn_dt is: '||v_bb_nxt_cpn_dt);

        -- no change in data
        IF v_bb_interval_dt IS NOT NULL AND v_curr_interval_dt IS NULL THEN

            IF v_cur_val IS NULL THEN

                v_ctr               :=  v_ctr + 1;
                v_no_cols           :=  1;
                v_bulk_data         :=  '5'||c_def_bulk_sep||
                                        TO_CHAR(v_bb_interval_dt,c_blmbg_date_format)||c_def_bulk_sep;  -- create the new entry
                v_bulk_data         :=  c_def_bulk_sep||'2'||c_def_bulk_sep||v_ctr||c_def_bulk_sep||v_no_cols||c_def_bulk_sep|| -- add the header
                                        v_bulk_data;
                RETURN v_bulk_data;

            ELSE

                v_append := TRUE;

            END IF;

        END IF;

        IF v_curr_interval_dt = v_bb_interval_dt THEN

            RETURN v_orig_val;  -- return existing data

        END IF;

        IF v_idr_nxt_cpn_dt < v_bb_nxt_cpn_dt THEN

            IF    (   v_curr_interval_dt > v_idr_nxt_cpn_dt   AND
                        v_curr_interval_dt <=  v_bb_nxt_cpn_dt )    THEN

                v_update := TRUE;

            ELSE

                v_append := TRUE;

            END IF;

        ELSIF ( v_idr_nxt_cpn_dt = v_bb_nxt_cpn_dt OR v_idr_nxt_cpn_dt IS NULL ) AND
                v_bb_interval_dt > v_bb_nxt_cpn_dt                                  THEN

            IF v_curr_interval_dt > v_bb_nxt_cpn_dt                 THEN

                v_update := TRUE;

            ELSE

                v_append := TRUE;

            END IF;

        ELSIF ( v_idr_nxt_cpn_dt = v_bb_nxt_cpn_dt OR v_idr_nxt_cpn_dt IS NULL ) AND
                v_bb_interval_dt <= v_bb_nxt_cpn_dt                                 THEN

            IF v_curr_interval_dt <= v_bb_nxt_cpn_dt                THEN

                v_update := TRUE;

            ELSE

                v_append := TRUE;

            END IF;

        END IF;

        IF v_update      THEN

            v_bulk_data     :=  replace(
                                    v_cur_val,
                                    TO_CHAR(v_curr_interval_dt,c_blmbg_date_format),
                                    TO_CHAR(v_bb_interval_dt,c_blmbg_date_format)
                                );
             v_bulk_data    :=  v_bulk_sep||2||v_bulk_sep||v_no_rows||v_bulk_sep||v_no_cols||v_bulk_sep|| -- add the header
                                    v_bulk_data;

        ELSIF v_append   THEN

            v_no_rows           :=  v_no_rows + 1;
            v_bulk_data         :=  v_cur_val||5||v_bulk_sep||
                                    TO_CHAR(v_bb_interval_dt,c_blmbg_date_format)||v_bulk_sep;  -- add the new entry
            v_bulk_data         :=  v_bulk_sep||2||v_bulk_sep||v_no_rows||v_bulk_sep||v_no_cols||v_bulk_sep|| -- add the header
                                    v_bulk_data;

        ELSIF ( ( NOT v_update ) AND ( NOT v_append ) ) THEN

            v_bulk_data         :=  v_orig_val; -- all checks failed, current idr schedule

        END IF;

        RETURN v_bulk_data;

    END wrap_interval_dt_schd;

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
    RETURN NUMBER
    IS
        v_return             NUMBER :=1;
        v_factor             sec_factor_schd.fctr%TYPE;

    BEGIN

        SELECT
            fctr
        INTO
            v_factor
        FROM
            sec_factor_schd_tbl
        WHERE
            sec_id = TRIM(p_insec_id) AND
            eff_dt = (SELECT
                          MAX(eff_dt)
                      FROM
                          sec_factor_schd_tbl
                      WHERE
                          sec_id = TRIM(p_insec_id)

                     );

        IF v_factor = 0 THEN
            v_return := 0;

        ELSE
            v_return := 1;

        END IF;

        RETURN v_return;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

                RETURN v_return;

        WHEN OTHERS THEN

                display_message('chk_sec_factor_schd(): '||SQLERRM );
            RAISE_APPLICATION_ERROR(-20090,'chk_sec_factor_schd():'||SQLERRM);
            RETURN v_return;

  END chk_sec_factor_schd;

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
    RETURN  vendor_req_messages.column_trans_value%TYPE
    AS
        v_cur_val           VARCHAR2(32767);
        v_new_cur_val       VARCHAR2(32767);
        v_orig_val          VARCHAR2(32767);
        v_new_val           VARCHAR2(32767);
        v_next_new_val      VARCHAR2(32767);
        v_bulk_sep          CHAR(1);
        v_no_dim            PLS_INTEGER;
        v_no_rows           PLS_INTEGER;
        v_no_cols           PLS_INTEGER;
        v_row_data          VARCHAR2(200);
        v_cur_row           PLS_INTEGER :=  0;
        v_list_val          VARCHAR2(400);
        v_new_row_data      VARCHAR2(200);
        v_new_cur_row       PLS_INTEGER :=  0;
        v_new_list_val      VARCHAR2(400);
        v_found             PLS_INTEGER;


    BEGIN
        -- sample of string ;2;3;1;1;CONDEMNATION;1;DAMAGE/DESTRUCTION;1;EXCESS FUNDS;

        v_orig_val := p_incolumn_Value;

        v_bulk_sep  :=  SUBSTR(v_orig_val,1,1);
        v_cur_val   :=  SUBSTR(v_orig_val,2);

        --
        -- this will strip off the number of dim, rows, cols from the string
        --
        v_no_dim    :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_rows   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        v_no_cols   :=  TO_NUMBER(SUBSTR(v_cur_val,1,INSTR(v_cur_val,v_bulk_sep,1,1)-1));
        v_cur_val   :=  SUBSTR(v_cur_val,INSTR(v_cur_val,v_bulk_sep,1,1)+1);

        DBMS_OUTPUT.put_line(
            'No. of dim: '||v_no_dim||
            ', No. of rows:'||v_no_rows ||
            ', No. of cols:' ||v_no_cols
            );

        LOOP
            v_row_data  :=  SUBSTR(
                                v_cur_val,
                                1,INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)
                            );

            v_cur_val   :=  SUBSTR(
                                v_cur_val,
                                INSTR(v_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                            );

            v_list_val    :=  SUBSTR(
                                    v_row_data,
                                    INSTR(v_row_data,v_bulk_sep,1,1)+1,
                                    INSTR(v_row_data,v_bulk_sep,1,2)-1-
                                        INSTR(v_row_data,v_bulk_sep,1,1)
                                );

            DBMS_OUTPUT.put_line('    Row data is  :'||v_row_data);
            DBMS_OUTPUT.put_line('    List value is:'||v_list_val);

            IF (v_list_val IS NOT NULL) THEN
                v_cur_row   :=  v_cur_row + 1;
                IF v_cur_row = 1 THEN
                    v_new_val := v_row_data; --v_no_cols || v_bulk_sep || v_list_val || v_bulk_sep;
                ELSE
                    --Loop through each item in new_val to see where to place next item
                    v_found := 0;
                    v_new_cur_val := v_new_val;
                    v_next_new_val := NULL;
                    LOOP
                          v_new_row_data  :=  SUBSTR(
                                              v_new_cur_val,
                                              1,INSTR(v_new_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)
                                          );

                          v_new_cur_val   :=  SUBSTR(
                                              v_new_cur_val,
                                              INSTR(v_new_cur_val,v_bulk_sep,1,v_no_dim*v_no_cols)+1
                                          );

                          v_new_list_val    :=  SUBSTR(
                                                  v_new_row_data,
                                                  INSTR(v_new_row_data,v_bulk_sep,1,1)+1,
                                                  INSTR(v_new_row_data,v_bulk_sep,1,2)-1-
                                                      INSTR(v_new_row_data,v_bulk_sep,1,1)
                                              );

                        IF v_new_list_val IS NOT NULL THEN
                            IF (upper(v_list_val) < upper(v_new_list_val)) AND v_found = 0 THEN
                                v_found := 1;
                                -- prepend the next value to the string
                                v_next_new_val := v_next_new_val || v_row_data || v_new_row_data;
                            ELSE
                                v_next_new_val := v_next_new_val || v_new_row_data;
                            END IF;
                        END IF;

                        DBMS_OUTPUT.put_line('        v_row_data is    : '||v_row_data);
                        DBMS_OUTPUT.put_line('        v_new_row_data is: '||v_new_row_data);
                        DBMS_OUTPUT.put_line('        next_new_val is  : '||v_next_new_val);

                        EXIT WHEN TRIM(v_new_cur_val) IS NULL;
                    END LOOP;

                    IF v_found = 0 THEN
                        v_next_new_val := v_next_new_val || v_row_data;
                    END IF;
                    v_new_val := v_next_new_val;

                END IF;
            END IF;

            DBMS_OUTPUT.put_line('        v_new_val is  : '||v_new_val);


            EXIT WHEN TRIM(v_cur_val) IS NULL;

        END LOOP;
        v_new_val := v_bulk_sep || v_no_dim || v_bulk_sep || v_no_rows || v_bulk_sep || v_no_cols || v_bulk_sep || v_new_val;

        DBMS_OUTPUT.put_line('Orig data value is: '||v_orig_val);
        DBMS_OUTPUT.put_line('New  data value is: '||v_new_val);

        RETURN v_new_val;

    END order_erp_types;

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
                                         )
    IS
        v_dt_val       security_attribute.attr_dt_val%TYPE      := NULL;
        v_num_val      security_attribute.attr_num_val%TYPE     := NULL;
        v_char_val     security_attribute.attr_char_val%TYPE    := NULL;
        v_bool_val     security_attribute.attr_bool_val%TYPE    := NULL;
        c_proc_func_name    VARCHAR2(32)    := 'maintain_security_attribute';  --TD3787 10/21/2008 DuttaD
        c_proc_loc          VARCHAR2(50)    := NULL;                           --TD3787 10/21/2008 DuttaD

    BEGIN
        c_proc_loc := 'attribute_definition';                                  --TD3787 10/21/2008 DuttaD
        SELECT
            decode(ad.type, 'DATE',    TO_DATE(p_inAttr_Value, 'MM-DD-YYYY'), NULL),
            decode(ad.type, 'NUMBER',  TO_NUMBER(p_inAttr_Value), NULL),
            decode(ad.type, 'CHAR',    p_inAttr_Value, NULL),
            decode(ad.type, 'BOOLEAN', p_inAttr_Value, NULL)
        INTO
            v_dt_val,
            v_num_val,
            v_char_val,
            v_bool_val
        FROM
            wmc.attribute_definition ad
        WHERE
            ad.NAME = p_inAttr_Name
        ;
        c_proc_loc := NULL;                                                    --TD3787 10/21/2008 DuttaD
        IF v_dt_val IS NULL AND v_num_val IS NULL AND v_char_val IS NULL AND v_bool_val IS NULL
        THEN
            -- Remove exisiting row if there is no longer a value
            DELETE FROM
                security_Attribute sa
            WHERE
                sa.sec_id = p_inSec_Id AND
                sa.NAME   = p_inAttr_Name
            ;

        ELSE
            -- Update or Insert based on if row already exists.
            UPDATE
                security_attribute sa
            SET
                sa.attr_dt_val   = v_dt_val,
                sa.attr_num_val  = v_num_val,
                sa.attr_char_val = v_char_val,
                sa.attr_bool_val = v_bool_val,
                sa.upd_ts        = SYSDATE,
                sa.upd_login     = USER
            WHERE
                sa.sec_id = p_inSec_Id      AND
                sa.NAME   = p_inAttr_Name
            ;

            IF SQL%NOTFOUND THEN
                INSERT INTO
                    security_Attribute
                (
                    Name,
                    Sec_Id,
                    Attr_Dt_Val,
                    Attr_Num_Val,
                    Attr_Char_Val,
                    Attr_Bool_Val,
                    Comments,
                    Ins_Ts,
                    Upd_Ts,
                    Ins_Login,
                    Upd_Login,
                    App_User
                )
                VALUES
                (
                   p_inAttr_Name,
                   p_inSec_id,
                   v_dt_val,
                   v_num_val,
                   v_char_val,
                   v_bool_val,
                   NULL,
                   SYSDATE,
                   SYSDATE,
                   USER,
                   USER,
                   'CSM'
                )
               ;
            END IF;
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            display_message('maintain_security_attribute(): The following attribute does not exist in attribute_definition: [' || p_inAttr_Name || ']');
            RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||'The following attribute does not exist in attribute_definition: [' || p_inAttr_Name || ']');     --TD3787 10/21/2008 DuttaD

        WHEN OTHERS THEN

            display_message('ERROR in maintain_security_attribute(' || p_inSec_id || ', ' || p_inAttr_Name || ', ' || p_inAttr_Value || ')');
            display_message('ERROR in maintain_security_attribute SQLERRM :'||SQLERRM );
             RAISE_APPLICATION_ERROR(-20090,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);     --TD3787 10/21/2008 DuttaD


    END maintain_security_attribute;

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
    RETURN VARCHAR2
    AS
        v_return   VARCHAR2(255) := NULL;

    BEGIN

        SELECT
            decode(ad.type, 'DATE',    TO_CHAR(sa.attr_dt_val, 'MM-DD-YYYY'),
                            'NUMBER',  TO_CHAR(sa.attr_num_val),
                            'CHAR',    sa.attr_char_val,
                            'BOOLEAN', sa.attr_bool_val,
                    NULL)
        INTO
            v_return
        FROM
            security_Attribute sa,
            wmc.attribute_definition ad
        WHERE
            sa.sec_id = p_inSec_id    AND
            sa.NAME   = ad.NAME       AND
            ad.NAME   = p_inAttrName
        ;

        RETURN v_return;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_return;

    END get_security_attribute;


 /************************** get_sov_rating_num_equiv *******************************
    ***
    ***  Author: TD#3759  added 2008-Sep-04 Cognizant Technology Solutions
    ***  Date Created:  09/06/2008
    ***  Type:          Private
    ***  Purpose: Get Soverign Issuer Rating Numeric Equivalent
    ***
    ***  Changes:
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ***
    *****************************************************************************/

FUNCTION get_sov_rating_num_equiv (
          p_inIsr_id           IN          issuer.isr_id%TYPE,
          p_inrat_srce_cd      IN          ref_rating.rating_srce_cd%TYPE,
          p_inlocl_foreign_cd  IN          isr_rating.locl_foreign_cd%TYPE,
          p_inasset_cls        IN          ref_rating.asset_class%TYPE
          )
    RETURN NUMBER
    AS

            v_rating               ref_rating.rating_num_equiv%TYPE := 0;

    BEGIN

           SELECT
                   r.rating_num_equiv
           INTO
                   v_rating
           FROM
                   ref_rating r
           WHERE
                   r.rating_srce_cd = p_inrat_srce_cd
           AND     r.asset_class = p_inasset_cls
           AND     r.rating  = (SELECT
                                       get_sov_isr_rating(i.domicile_cntry,Null,p_inrat_srce_cd,p_inlocl_foreign_cd,p_inasset_cls) sov_rat
                                FROM
                                       issuer i
                                WHERE  i.isr_id = p_inIsr_id
                                )
           AND      r.rating_num_equiv >=0 ;

           RETURN nvl(v_rating,0);

    EXCEPTION

             WHEN NO_DATA_FOUND THEN
             v_rating :=0;
             RETURN v_rating;

    END get_sov_rating_num_equiv;



     /************************** get_vndr_sec_class_cd ********************
     ***
     ***  Author:        TD#3322 Cognizant Technology Solutions
     ***  Date Created:  16/02/2008
     ***  Type:          Published
     ***  Purpose:       This function returns Lehman class code for a given security
     ***                 Source get_vndr_sec_class_cd
     ***
     ***
     *** Modified on 2008-JUN-17 for TD#3654   Cognizant Technology Solutions
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
        p_infin_flg  IN          sec_fi_data_tbl.financing_flg%TYPE  DEFAULT NULL,           -- TD#3728 added on 07-AUG-2008 by Cognizant Technology Solutions
        p_inTd_cur   IN          security.trade_curcy_cd%TYPE        DEFAULT CSM_COMMON.NA   -- TD#3759 added on 08-SEP-2008 by Cognizant Technology Solutions
    )
    RETURN    fi_lb_mthly.issrclscd%TYPE
    IS

        v_secclscd             fi_lb_mthly.issrclscd%TYPE  :=  NULL;
        v_trade_flag           BOOLEAN := FALSE;
        v_isrclass             catlg_item.low_lv_cd_value%TYPE;
        v_incorp_curr_cd       country.perf_curcy_cd%TYPE  :=  NULL;
        v_rate_num_equiv_f     NUMBER := 0;
        v_pay_chg_freq         sec_fi_data.pay_chg_freq%TYPE := NULL;   --TD4328:jadhas:11/12

    BEGIN

        --
        --  Get the CUSIP/ISIN of securities and
        --  find applicable Lehman sector based on IDs
        --
        BEGIN

            SELECT
                *
            INTO
                v_secclscd
            FROM(
                SELECT  DISTINCT
                    MAINTAIN_BB_isr_PKG.get_lb_isr_class_cd(
                        NVL(NVL(cusip1,LBBMKCUSIP1), MAINTAIN_BB_SEC_PKG.get_isid_cusip(sedol1, isin1)),
                        ISIN1
                    ) class_lb
                FROM(
                    SELECT
                        sx.sec_id,
                        MAX(DECODE(extern_id_typ,'CUSIP', extern_id))  cusip1,
                        MAX(DECODE(extern_id_typ,'LBBMKCUSIP', extern_id))  LBBMKCUSIP1,
                        MAX(DECODE(extern_id_typ,'SEDOL', extern_id))  sedol1,
                        MAX(DECODE(extern_id_typ,'ISIN', extern_id))   isin1
                    FROM
                        sec_external_id sx,
                        security_tbl s
                    WHERE
                        sx.sec_id = p_inSec_id                         AND
                        sx.sec_id = s.sec_id                           AND
                        (s.sec_status_cd ='A' OR s.bmk_flg ='Y')       AND
                        sx.extern_id_typ IN ('CUSIP', 'SEDOL', 'ISIN','LBBMKCUSIP') AND
                        sx.exp_dt        >  SYSDATE
                    GROUP BY
                        sx.sec_id
                    ) external_ids
                ) lb_class_cd
            WHERE
                class_lb IS NOT NULL;

        EXCEPTION
            WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN

            v_secclscd := NULL;

        END;

        IF (p_inSec_typ1 <> 'NA' OR p_inSec_typ2 <> 'NA' OR p_inSec_typ3 <> 'NA')
        THEN

             IF v_secclscd IS NULL
             THEN
                    -- TD#3759 added on 05-SEP-2008 by Cognizant Technology Solutions

                    BEGIN

                          SELECT
                                  ci.low_lv_cd_value
                          INTO
                                  v_isrclass
                          FROM
                                  isr_catlg ci
                          WHERE
                                  ci.isr_id   = p_inIsr_id AND
                                  ci.catlg_id = CSM_COMMON.CONST_CLASS_WMC_GLB;

                    EXCEPTION
                           WHEN NO_DATA_FOUND THEN
                                  v_secclscd := NULL;
                    END;

                    -- TD#3759 End
                    -- TD#3728 added on 07-AUG-2008 by Cognizant Technology Solutions

                    IF (    (p_inSec_typ1 = 'BOND' AND p_inSec_typ2 = 'OTHER')                          OR
                            (p_inSec_typ1 = 'SWAP' AND p_inSec_typ2 = 'SWAPCD')                         OR
                            (p_inSec_typ1 = 'BOND' AND p_inSec_typ2 = 'SWPI' AND p_inSec_typ3 = 'TRS')
                          )
                    THEN

                          IF p_infin_flg = 'Y'
                          THEN

                                v_secclscd := 'X';

                          END IF;


                    ELSIF ( (p_inSec_typ1 = 'OPT'  AND p_inSec_typ2  = 'CURR' )                         OR
                            (p_inSec_typ1 = 'FUT'  AND p_inSec_typ2  = 'CURR' )                         OR
                            (p_inSec_typ1 = 'FWD'  AND p_inSec_typ2  = 'CURR' )                         OR
                            (p_inSec_typ1 = 'OFFSET')                                                   OR
                            (p_inSec_typ2 = 'OFFSET')                                                   OR
                            (p_inSec_typ1 = 'CASH' )
                          )
                    THEN

                            v_secclscd := 'X';

                    -- TD#3728 End

                    -- TD#3759 added on 02-SEP-2008 by Cognizant Technology Solutions

                    ELSIF (p_inSec_typ1 = 'BOND' AND p_inSec_typ2 = 'SWPI' AND p_inSec_typ3 = 'IRS')
                    THEN

                            v_trade_flag := TRUE;
                            v_secclscd := NULL;

                    ELSIF ( (p_inSec_typ3 = 'TIPS')            OR
                            (p_inSec_typ4 = 'TIPS')            OR
                            (p_inSec_typ2 = 'UST')
                          )
                    THEN

                            v_secclscd := 'A';

                    ELSIF  v_isrclass = 'LB1_BC'
                    THEN

                            v_trade_flag := TRUE;
                            v_secclscd := NULL;

                    ELSIF   (p_inSec_typ2 = 'CMO' AND p_inSec_typ3  = 'CMBS')
                    THEN

                            v_secclscd := 'DC';

                    -- TD4328 start:jadhas:11/12: BEGIN Modification to Sec Catalog 339 Mortgage representation

                    ELSIF   (p_inSec_typ2 = 'MB')
                    THEN

                        BEGIN
                            SELECT
                                  sf.pay_chg_freq
                            INTO
                                  v_pay_chg_freq
                            FROM
                                  sec_fi_data sf
                            WHERE
                                  sf.sec_id   = p_inSec_id;
                        EXCEPTION
                            WHEN NO_DATA_FOUND THEN
                                v_pay_chg_freq := NULL;
                        END;

                        -- start mortgage representation

                        IF (p_inMort_cls like '%DUS%')
                        THEN
                            v_secclscd := 'DAA';

                        ELSIF   (p_inSec_typ3 IN ('G1','G2C','G2M') AND (p_inMort_cls = 'SFAM30'))
                        THEN

                            v_secclscd := 'DAAA';

                        ELSIF   (p_inSec_typ3 IN ('G1','G2C','G2M') AND (p_inMort_cls IN ('SFAM10','SFAM15')))
                        THEN

                            v_secclscd := 'DAAB';

                        ELSIF   (p_inSec_typ3 IN ('FHLG','FHLM','FNMA') AND (p_inMort_cls IN ('CONV30','FHAVA30')))
                        THEN

                            v_secclscd := 'DAAC';

                        ELSIF   (p_inMort_cls ='CONV20')
                        THEN

                            v_secclscd := 'DAAD';

                        ELSIF   (p_inMort_cls IN ('CONV10','CONV15','FHAVA15'))
                        THEN

                            v_secclscd := 'DAAE';

                        ELSIF   (p_inMort_cls IN ('BALL530','BALL715','BALL730','BALLOON'))
                        THEN

                            v_secclscd := 'DAAF';

                        -- end mortgage representation

                        -- start HYBRID representation

                        ELSIF   (v_pay_chg_freq = 'HYB  3/1')
                        THEN

                            v_secclscd := 'DACA';

                        ELSIF   (v_pay_chg_freq = 'HYB  5/1')
                        THEN

                            v_secclscd := 'DACB';

                        ELSIF   (v_pay_chg_freq = 'HYB  7/1')
                        THEN

                            v_secclscd := 'DACC';

                        ELSIF   (v_pay_chg_freq = 'HYB 10/1')
                        THEN

                            v_secclscd := 'DACD';

                        ELSIF   (v_pay_chg_freq = 'HYB UNK')
                        THEN

                            v_secclscd := 'DAC';

                        -- end HYBRID representation

                        ELSIF   (p_inMort_cls = 'ARM' AND NVL(to_char(v_pay_chg_freq),'NULL') NOT LIKE '%HYB%')
                        THEN

                            v_secclscd := 'DAC';

                        ELSE

                            v_secclscd := 'DAA';

                        END IF;

                    -- TD4328 end:jadhas:11/12:

                    -- TD4328 start:jadhas:11/12: BEGIN CORP, MUNI, CDO and CLOAN Sec Catalog 339 Mortgage representation

                    ELSIF   ((p_inSec_typ2 = 'CORP') AND (p_inMort_cls='EURO'))
                    THEN

                            v_secclscd := 'DDA';

                    ELSIF   (p_inSec_typ2 = 'MUNI')
                    THEN

                            v_secclscd := 'BB';

                    ELSIF   ((p_inSec_typ3 IN ('CDO','CLOAN')) OR (p_inSec_typ4 = 'CLOAN'))
                    THEN

                            v_secclscd := 'DDZ';

                    -- TD4328 end:jadhas:11/12:

                    -- TD4328:jadhas:11/12: commneted below code as it is taken care in above condition
                    /*
                    ELSIF   p_inMort_cls like '%DUS%'
                    THEN

                            v_secclscd := 'DAA';

                    ELSIF ( (p_inSec_typ3 = 'CDO')                      OR
                            (p_inSec_typ3 = 'CLOAN' OR p_inSec_typ4 = 'CLOAN')
                          )
                    THEN

                            v_secclscd := 'CCZ';

                    */

                    -- TD#3842 added on 24 Nov 2008 Cognizant Technology Solutions

                    ELSIF  p_inSec_typ3 = 'RMBS'
                    THEN
                          v_secclscd := 'DBG';

                    ELSIF  p_inSec_typ2 = 'CMO' AND p_inSec_typ3 NOT IN('RMBS','CMBS')
                    THEN

                          v_secclscd := 'DE';

                    ELSIF  p_inSec_typ3 = 'CC'
                    THEN

                          v_secclscd := 'DBA';

                    ELSIF  p_inSec_typ3 = 'AU'
                    THEN

                          v_secclscd := 'DBB';

                    ELSIF  p_inSec_typ3 = 'HE'
                    THEN

                          v_secclscd := 'DBC';

                    ELSIF  p_inSec_typ3 = 'MH'
                    THEN

                          v_secclscd := 'DBD';

                    ELSIF  p_inSec_typ3 IN('RRB' ,'SCU')
                    THEN

                          v_secclscd := 'DBE';

                    ELSIF  p_inSec_typ3 IN ('WB', 'LN', 'SB')   -- TD4328:jadhas:11/12: added 'LN' and 'SB' in this condition
                    THEN

                          v_secclscd := 'DBF';

                    ELSIF  p_inSec_typ3 = 'MB'
                    THEN

                          v_secclscd := 'DBG';

                    ELSIF  p_inSec_typ3 = 'SL'
                    THEN

                          v_secclscd := 'DBH';

                    --TD4328:jadhas:11/12: LN/SB Sec Type3 are added and RMBS/CMBS Sec Type3 are removed in the below condition

                    --ELSIF  (p_inSec_typ2 = 'AB' AND p_inSec_typ3 NOT IN ('RMBS','CMBS','AU','HE','CC','MH','RRB','WB','MB','SL','SCU'))
                    ELSIF  (p_inSec_typ2 = 'AB' AND p_inSec_typ3 NOT IN ('AU','HE','CC','MH','RRB','WB','MB','SL','SCU','LN','SB'))
                    THEN

                          v_secclscd := 'DBZ';   --TD4328:jadhas:11/12: changes value from 'DB' to 'DBZ'

                    END IF;

                    -- TD#3842 ended

                END IF;

                    -- TD#3759 added on 02-SEP-2008 by Cognizant Technology Solutions

                IF v_trade_flag = TRUE  AND  v_secclscd IS NULL
                THEN

                    BEGIN

                          SELECT
                                  c.perf_curcy_cd
                          INTO
                                  v_incorp_curr_cd
                          FROM
                                  issuer i,
                                  country c
                          WHERE
                                  isr_id   = p_inIsr_id
                           AND    NVL(i.incorp_cntry_cd,'##') = c.cntry_cd
                           AND    c.inactive_dt is NULL ;

                    EXCEPTION

                          WHEN NO_DATA_FOUND THEN
                                 v_secclscd := NULL;
                                 v_incorp_curr_cd  := NULL;
                    END;

                    IF  NVL(v_incorp_curr_cd,'##') = NVL(p_inTd_cur,'**')
                    THEN

                          ---

                          v_rate_num_equiv_f := get_sov_rating_num_equiv(p_inIsr_id,'MOODY','F','F');

                          IF  (v_rate_num_equiv_f > 0 and v_rate_num_equiv_f <= 3.67)
                          THEN

                                v_secclscd := 'A';

                           ELSE
                                v_rate_num_equiv_f := get_sov_rating_num_equiv(p_inIsr_id,'SP','F','F');

                                IF  (v_rate_num_equiv_f > 0 and v_rate_num_equiv_f <= 3.67)
                                THEN

                                        v_secclscd := 'A';

                                ELSE
                                        v_secclscd := 'BC';

                                END IF;

                           END IF;

                    ELSE

                          v_secclscd := 'BC';

                    END IF;


                END IF;
                 -- TD#3759  Ended

         END IF;

        --sec_typ1, sec_typ2, sec_typ3 are added in input param list

        --sec_typ1, sec_typ2, sec_typ3 are added in input param list

        RETURN v_secclscd;

    EXCEPTION
        WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN

            v_secclscd := NULL;
            RETURN v_secclscd;

        WHEN OTHERS THEN

            display_message('get_vndr_sec_class_cd(): '||SQLERRM );
            RAISE_APPLICATION_ERROR(-20090,'get_vndr_sec_class_cd():'||SQLERRM);

    END get_vndr_sec_class_cd;

   /************************** maintain_sec_zone *******************************
    ***
    ***  Author: TD#3352  added 2008-Feb-18 Cognizant Technology Solutions
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
	--TD6390:Sec Zone Decommissioning: Not commented to keep DSS working.


	PROCEDURE maintain_sec_zone (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_inZone_id                 IN      sec_zone.zone_id%TYPE,
        p_inZone_source_cd          IN      sec_zone.zone_source_cd%TYPE,
        p_inEffective_dt            IN      DATE DEFAULT SYSDATE
    )
    IS

        c_zone_typ_cd          CONSTANT        varchar2(3) := 'PPZ';
        v_sec_id               security_tbl.sec_id%TYPE    :=  p_inSec_id;
        v_date                 DATE ;
        c_proc_func_name       VARCHAR2(32)    := 'maintain_sec_zone';       --TD3787 10/21/2008 DuttaD
        c_proc_loc             VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN

        v_date := TRUNC(NVL(p_inEffective_dt,SYSDATE));

        INSERT INTO sec_zone(
            sec_id,
            zone_typ,
            zone_id,
            zone_source_cd,
            eff_dt
        )
        VALUES(
            p_inSec_id,
            c_zone_typ_cd,
            p_inZone_id,
            p_inZone_source_cd,
            v_date
        );

    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN

            UPDATE
                sec_zone a
            SET
                zone_id        =p_inZone_id,
                zone_source_cd = p_inZone_source_cd
            WHERE
                TRUNC(eff_dt)    =  v_date            AND
                sec_id           =  p_inSec_id        AND
                zone_typ         =  c_zone_typ_cd;

        WHEN OTHERS THEN

            RAISE_APPLICATION_ERROR(-20042,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);   --TD3787 10/21/2008 DuttaD

  END maintain_sec_zone;

        --TD6390:Sec Zone Decommissioning: END

   /************************** get_zone_id *******************************
    ***
    ***  Author: TD#3352  added 2008-Feb-18 Cognizant Technology Solutions
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
    RETURN sec_zone.zone_id%TYPE
    AS
        v_return   sec_zone.zone_id%TYPE :=0;

    BEGIN

        SELECT
            z.zone_id
        INTO
            v_return
        FROM
            sec_zone_vw z
        WHERE
            z.sec_id = p_inSec_id    AND
            z.zone_typ   = 'PPZ';

        RETURN v_return;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_return;

    END get_zone_id;

   /************************** get_zone_id_dsc *******************************
    ***
    ***  Author: TD#3352  added 2008-Feb-18 Cognizant Technology Solutions
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
    RETURN process_zone.zone_nm%TYPE
    AS
        v_return   process_zone.zone_nm%TYPE ;

    BEGIN

        SELECT
            zone_nm
        INTO
            v_return
        FROM
            process_zone
        WHERE
            zone_id = p_inZone_id;

        RETURN v_return;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_return;

    END get_zone_id_dsc;

   /************************** get_zone_source_id *******************************
    ***
    ***  Author: TD#3352  added 2008-Feb-18 Cognizant Technology Solutions
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
    RETURN sec_zone.zone_source_cd%TYPE
    AS
        v_return   sec_zone.zone_source_cd%TYPE :='R';

    BEGIN

        SELECT
            z.zone_source_cd
        INTO
            v_return
        FROM
            sec_zone z
        WHERE
            z.sec_id     = p_inSec_id    AND
            z.zone_typ   = 'PPZ'         AND
            eff_dt       = (
                            SELECT
                                MAX(eff_dt)
                            FROM
                                sec_zone
                            WHERE
                                sec_id = p_inSec_id AND
                                zone_typ='PPZ'
                            ) ;

        RETURN v_return;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN v_return;

        WHEN TOO_MANY_ROWS THEN

            RETURN v_return;

    END get_zone_source_cd;
   -- TD#3352  Changes End

   /************************** get_zone_source_cd_dsc ***************************
    ***
    ***  Author: TD#3352  added 2008-Feb-18 Cognizant Technology Solutions
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
    RETURN ref_attr_value.short_dsc%TYPE
    AS
        v_return   ref_attr_value.short_dsc%TYPE ;

    BEGIN

        SELECT
            short_dsc
        INTO
            v_return
        FROM
            ref_attr_value
        WHERE
            attr_id    = 723              AND
            code_value = p_inZone_Src_Cd ;

        RETURN v_return;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            RETURN NULL;

    END get_zone_source_cd_dsc;

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
     ***
     *** Modified on 2008-JUN-17 for TD#3654 Cognizant Technology Solutions
     *** Include Mortgage class
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
        p_infin_flg              IN     sec_fi_data_tbl.financing_flg%TYPE  DEFAULT NULL,            -- TD#3728 added on 07-AUG-2008 by Cognizant Technology Solutions
        p_inTd_cur               IN     security.trade_curcy_cd%TYPE        DEFAULT CSM_COMMON.NA    -- TD#3759 added on 08-SEP-2008 by Cognizant Technology Solutions
    )
    RETURN  fi_lb_mthly.issrclscd%TYPE
    IS

        v_secclscd           fi_lb_mthly.issrclscd%TYPE       := NULL    ;
        v_low_lv_cd_value    catlg_item.low_lv_cd_value%TYPE  := NULL    ;
        v_vend_prd_id        vendor_request.vendor_product_id%TYPE  := 1 ;
        v_request_src        vendor_request.request_src%TYPE             ;
        v_ext_id             vendor_request.ext_id%TYPE                  ;
        v_ext_id_typ         vendor_request.ext_id_typ_cd%TYPE           ;
        v_bmk_cusip          vendor_request.ext_id%TYPE                  ;
        v_trade_flag         BOOLEAN := FALSE;
        v_isrclass           catlg_item.low_lv_cd_value%TYPE;
        v_incorp_curr_cd     country.perf_curcy_cd%TYPE       := NULL    ;
        v_rate_num_equiv_f   NUMBER := 0;
        v_pay_chg_freq       sec_fi_data.pay_chg_freq%TYPE := NULL;


    BEGIN

        --
        --  Get the CUSIP/ISIN of securities issued by the concered issuer and
        --  find applical Lehman sector based on IDs
        --

        SELECT
              vendor_product_id
         INTO
              v_vend_prd_id
         FROM
              vendor_request
         WHERE
             request_id =  p_inRequest_id;

        BEGIN

            SELECT
                *
            INTO
                v_secclscd
            FROM
            (
                SELECT  DISTINCT
                       'LB1_'||MAINTAIN_BB_ISR_PKG.get_lb_isr_class_cd(
                                   NVL(cusip1, MAINTAIN_BB_SEC_PKG.get_isid_cusip(sedol1, isin1)),
                                   ISIN1
                               ) class_lb
                FROM
                (
                    SELECT /*+ index(vrm,vendor_req_messages_pk) */
                        request_id,
                        MAX(DECODE(column_nm,'ID_CUSIP_REAL',TO_CHAR(column_value)))  cusip1,
                        MAX(DECODE(column_nm,'ID_SEDOL1', TO_CHAR(column_value)))  sedol1,
                        MAX(DECODE(column_nm,'ID_ISIN', TO_CHAR(column_value)))   isin1
                    FROM
                        vendor_req_messages vrm
                    WHERE
                        request_id in
                        (
                            SELECT
                                request_id
                            FROM
                                vendor_request
                            WHERE
                                request_id          =  p_inRequest_id                  AND
                                request_status_cd   BETWEEN 450  AND 999
                        )                                                              AND
                        column_nm      IN ('ID_CUSIP_REAL', 'ID_SEDOL1', 'ID_ISIN')    AND
                        col_trans_seq  =  0
                    GROUP BY
                        request_id
                ) external_ids
            ) lb_class_cd
            WHERE
                class_lb IS NOT NULL;

        EXCEPTION
            WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN


                v_secclscd := NULL;

        END;

        IF  (v_secclscd= 'LB1_' OR v_secclscd IS NULL)  THEN

            BEGIN

                SELECT
                    vendor_product_id,
                    request_src,
                    ext_id,
                    ext_id_typ_cd
                INTO
                    v_vend_prd_id,
                    v_request_src,
                    v_ext_id,
                    v_ext_id_typ
                FROM
                    vendor_request
                WHERE
                    request_id =  p_inRequest_id;

                IF  v_request_src  =  MAINTAIN_BMK_SCRUB_PKG.CONST_BMKGENERIC_REQUEST_SRC  AND
                    v_vend_prd_id  =  MAINTAIN_BMK_SCRUB_PKG.CONST_BMKGENERIC_PRODUCT_ID
                THEN

                    IF   v_ext_id_typ  =  MAINTAIN_BMK_SCRUB_PKG.CONST_CUSIP_CD  THEN

                        v_bmk_cusip  :=  v_ext_id ;

                    ELSIF v_ext_id_typ  =  MAINTAIN_BMK_SCRUB_PKG.CONST_ISIN_CD  THEN

                        BEGIN

                            SELECT
                                bmk_cusip
                            INTO
                                v_bmk_cusip
                            FROM
                                bmk_security
                            WHERE
                                isin  =  v_ext_id
                            AND  bmk_srce_cd = 'LB';

                        EXCEPTION
                            WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN

                                v_bmk_cusip  :=  NULL;
                        END;

                    ELSIF v_ext_id_typ  =  MAINTAIN_BMK_SCRUB_PKG.CONST_SEDOL_CD  THEN

                        BEGIN

                            SELECT
                               bmk_cusip
                            INTO
                                v_bmk_cusip
                            FROM
                               bmk_security
                            WHERE
                               sedol  =  v_ext_id
                            AND  bmk_srce_cd = 'LB';

                        EXCEPTION
                            WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN

                                v_bmk_cusip  :=  NULL;
                        END;

                    END IF;

                IF v_bmk_cusip  IS NOT NULL THEN

                    v_secclscd  := 'LB1_'||MAINTAIN_BB_ISR_PKG.get_lb_isr_class_cd( v_bmk_cusip,NULL );

                END IF;

            END IF;
          END;

        END IF;






 --sec_typ1, sec_typ2, sec_typ3 are added in input param list
 -- Add Mortgage Class -TD 3654

           IF (p_inSec_typ1 <> 'NA' OR p_inSec_typ2 <> 'NA' OR p_inSec_typ3 <> 'NA')
           THEN

             -- TD#3728 added on 07-AUG-2008 by Cognizant Technology Solutions

             IF  v_secclscd= 'LB1_' OR v_secclscd IS NULL
             THEN

                    BEGIN

                          SELECT
                                 ci.low_lv_cd_value
                          INTO
                                 v_isrclass
                          FROM
                                 isr_catlg ci
                          WHERE
                                 ci.isr_id   = p_inIsr_id AND
                                 ci.catlg_id = CSM_COMMON.CONST_CLASS_WMC_GLB;

                    EXCEPTION
                             WHEN NO_DATA_FOUND THEN
                                 NULL;
                    END;

                    IF (    (p_inSec_typ1 = 'BOND' AND p_inSec_typ2 = 'OTHER')                          OR
                            (p_inSec_typ1 = 'SWAP' AND p_inSec_typ2 = 'SWAPCD')                         OR
                            (p_inSec_typ1 = 'BOND' AND p_inSec_typ2 = 'SWPI' AND p_inSec_typ3 = 'TRS')
                        )
                    THEN

                          IF p_infin_flg = 'Y'
                          THEN

                               v_secclscd := 'LB1_X';

                          END IF;

                    ELSIF ( (p_inSec_typ1 = 'OPT'  AND p_inSec_typ2  = 'CURR' )                         OR
                            (p_inSec_typ1 = 'FUT'  AND p_inSec_typ2  = 'CURR' )                         OR
                            (p_inSec_typ1 = 'FWD'  AND p_inSec_typ2  = 'CURR' )                         OR
                            (p_inSec_typ1 = 'OFFSET')                                                   OR
                            (p_inSec_typ2 = 'OFFSET')                                                   OR
                            (p_inSec_typ1 = 'CASH' )
                          )
                    THEN

                            v_secclscd := 'LB1_X';

                     -- TD#3728 End

                     -- TD#3759 added on 02-SEP-2008 by Cognizant Technology Solutions

                    ELSIF (p_inSec_typ1 = 'BOND' AND p_inSec_typ2 = 'SWPI' AND p_inSec_typ3 = 'IRS')
                    THEN

                            v_trade_flag := TRUE;
                            v_secclscd := NULL;

                    ELSIF ( (p_inSec_typ3 = 'TIPS')            OR
                            (p_inSec_typ4 = 'TIPS')            OR
                            (p_inSec_typ2 = 'UST')
                          )
                    THEN

                            v_secclscd := 'LB1_A';

                    ELSIF v_isrclass = 'LB1_BC'
                    THEN
                            v_trade_flag := TRUE;
                            v_secclscd := NULL;

                    ELSIF   (p_inSec_typ2 = 'CMO' AND p_inSec_typ3  = 'CMBS')
                    THEN

                            v_secclscd := 'LB1_DC';

                    --TD4328 start:jadhas:11/12: BEGIN Modification to Sec Catalog 339 Mortgage representation

                    ELSIF   (p_inSec_typ2 = 'MB')
                    THEN
                            BEGIN

                                SELECT /*+ index(vrm,vendor_req_messages_pk) */
                                       DECODE(column_nm,'MTG_PAY_CHG_FREQ', TO_CHAR(column_value))
                                INTO   v_pay_chg_freq
                                FROM   vendor_req_messages vrm
                                WHERE  vrm.request_id IN
                                       (
                                       SELECT request_id
                                       FROM   vendor_request
                                       WHERE  request_id             =    p_inRequest_id     AND
                                              request_status_cd   BETWEEN 450  AND 999
                                       )   AND
                                       column_nm = 'MTG_PAY_CHG_FREQ';

                            EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                    v_pay_chg_freq := NULL;
                            END;

                            -- stat mortgage classification
                            IF       (p_inMort_cls like '%DUS%')
                            THEN

                                      v_secclscd := 'LB1_DAA';

                            ELSIF    (p_inSec_typ3 IN ('G1','G2C','G2M') AND (p_inMort_cls = 'SFAM30'))
                            THEN

                                      v_secclscd := 'LB1_DAAA';

                             ELSIF   (p_inSec_typ3 IN ('G1','G2C','G2M') AND (p_inMort_cls IN ('SFAM10','SFAM15')))
                             THEN

                                      v_secclscd := 'LB1_DAAB';

                             ELSIF   (p_inSec_typ3 IN ('FHLG','FHLM','FNMA') AND (p_inMort_cls IN ('CONV30','FHAVA30')))
                             THEN

                                      v_secclscd := 'LB1_DAAC';

                             ELSIF   (p_inMort_cls ='CONV20')
                             THEN

                                      v_secclscd := 'LB1_DAAD';

                             ELSIF   (p_inMort_cls IN ('CONV10','CONV15','FHAVA15'))
                             THEN

                                      v_secclscd := 'LB1_DAAE';

                             ELSIF   (p_inMort_cls IN ('BALL530','BALL715','BALL730','BALLOON'))
                             THEN

                                      v_secclscd := 'LB1_DAAF';

                             -- end mortgage classification

                             -- start HYBRID classification

                             ELSIF   (v_pay_chg_freq = 'HYB  3/1')
                             THEN

                                      v_secclscd := 'LB1_DACA';

                             ELSIF   (v_pay_chg_freq = 'HYB  5/1')
                             THEN

                                      v_secclscd := 'LB1_DACB';

                             ELSIF   (v_pay_chg_freq = 'HYB  7/1')
                             THEN

                                      v_secclscd := 'LB1_DACC';

                             ELSIF   (v_pay_chg_freq = 'HYB 10/1')
                             THEN

                                      v_secclscd := 'LB1_DACD';

                             ELSIF   (v_pay_chg_freq = 'HYB UNK')
                             THEN

                                      v_secclscd := 'LB1_DAC';

                             -- end HYBRID classification

                             ELSIF   (p_inMort_cls = 'ARM' AND NVL(to_char(v_pay_chg_freq),'NULL') NOT LIKE '%HYB%')
                             THEN

                                      v_secclscd := 'LB1_DAC';

                             ELSE

                                      v_secclscd := 'LB1_DAA';

                             END IF;

                    --TD4328 end:jadhas:11/12:

                    --TD4328:jadhas:11/12: BEGIN CORP, MUNI, CDO and CLOAN Sec Catalog 339 Mortgage representation

                    ELSIF   ((p_inSec_typ2 = 'CORP') AND (p_inMort_cls='EURO'))
                    THEN

                            v_secclscd := 'LB1_DDA';

                    ELSIF   (p_inSec_typ2 = 'MUNI')
                    THEN

                            v_secclscd := 'LB1_BB';

                    ELSIF   ((p_inSec_typ3 IN ('CDO','CLOAN')) OR (p_inSec_typ4 = 'CLOAN'))
                    THEN

                            v_secclscd := 'LB1_DDZ';

                    --TD4328:jadhas:11/12:

                    --TD4328:jadhas:11/12: commnted below code as it is added in above condition
                    /*
                    ELSIF   p_inMort_cls like '%DUS%'
                    THEN

                            v_secclscd := 'LB1_DAA';

                    ELSIF ( (p_inSec_typ3 = 'CDO')                      OR
                            (p_inSec_typ3 = 'CLOAN' OR p_inSec_typ4 = 'CLOAN')
                          )
                    THEN

                            v_secclscd := 'LB1_CCZ';
                    */

                    -- TD#3842 added on 24 Nov 2008 Cognizant Technology Solutions

                    ELSIF  p_inSec_typ3 = 'RMBS'
                    THEN
                          v_secclscd := 'LB1_DBG';

                    ELSIF  p_inSec_typ2 = 'CMO' AND p_inSec_typ3 NOT IN('RMBS','CMBS')
                    THEN

                          v_secclscd := 'LB1_DE';

                    ELSIF  p_inSec_typ3 = 'CC'
                    THEN

                          v_secclscd := 'LB1_DBA';

                    ELSIF  p_inSec_typ3 = 'AU'
                    THEN

                          v_secclscd := 'LB1_DBB';

                    ELSIF  p_inSec_typ3 = 'HE'
                    THEN

                          v_secclscd := 'LB1_DBC';

                    ELSIF  p_inSec_typ3 = 'MH'
                    THEN

                          v_secclscd := 'LB1_DBD';

                    ELSIF  p_inSec_typ3 IN('RRB' ,'SCU')
                    THEN

                          v_secclscd := 'LB1_DBE';

                    ELSIF  p_inSec_typ3 IN ('WB', 'LN', 'SB')     --TD4328:jadhas:11/12: added 'LN and 'SB' in hte condition
                    THEN

                          v_secclscd := 'LB1_DBF';

                    ELSIF  p_inSec_typ3 = 'MB'
                    THEN

                          v_secclscd := 'LB1_DBG';

                    ELSIF  p_inSec_typ3 = 'SL'
                    THEN

                          v_secclscd := 'LB1_DBH';

                    --TD4328:jadhas:11/12: LN/SB Sec Type3 are added and RMBS/CMBS Sec Type3 are removed in the below condition

                    --ELSIF  (p_inSec_typ2 = 'AB' AND p_inSec_typ3 NOT IN ('RMBS','CMBS','AU','HE','CC','MH','RRB','WB','MB','SL','SCU'))
                    ELSIF  (p_inSec_typ2 = 'AB' AND p_inSec_typ3 NOT IN ('AU','HE','CC','MH','RRB','WB','MB','SL','SCU','LN','SB'))
                    THEN

                          v_secclscd := 'LB1_DBZ';   --TD4328:jadhas:11/12 value changes from 'LB1_DB' to 'LB1_DBZ'

                    -- TD#3842 ended

                    END IF;

                     -- TD#3759 added on 02-SEP-2008 by Cognizant Technology Solutions

                    IF v_trade_flag = TRUE  AND  v_secclscd IS NULL
                    THEN

                         BEGIN

                             SELECT
                                    c.perf_curcy_cd
                             INTO
                                    v_incorp_curr_cd
                             FROM
                                    issuer i,
                                    country c
                             WHERE
                                    isr_id   = p_inIsr_id
                              AND    NVL(i.incorp_cntry_cd,'##') = c.cntry_cd
                              AND    c.inactive_dt is NULL ;

                         EXCEPTION

                              WHEN NO_DATA_FOUND THEN
                                     v_secclscd := NULL;
                                     v_incorp_curr_cd := NULL;

                         END;

                        IF  NVL(v_incorp_curr_cd,'##') = NVL(p_inTd_cur,'**')
                        THEN

                          v_rate_num_equiv_f := get_sov_rating_num_equiv(p_inIsr_id,'MOODY','F','F');

                          IF  (v_rate_num_equiv_f > 0 and v_rate_num_equiv_f <= 3.67)
                          THEN

                                v_secclscd := 'LB1_A';

                           ELSE

                                v_rate_num_equiv_f := get_sov_rating_num_equiv(p_inIsr_id,'SP','F','F');

                                IF  (v_rate_num_equiv_f > 0 and v_rate_num_equiv_f <= 3.67)
                                THEN

                                        v_secclscd := 'LB1_A';

                                ELSE
                                        v_secclscd := 'LB1_BC';

                                END IF;

                           END IF;

                        ELSE

                             v_secclscd := 'LB1_BC';

                        END IF;

                     END IF;

                     -- TD#3759  Ended

                    -- TD#3728 added on 07-AUG-2008 by Cognizant Technology Solutions



                    IF  v_secclscd= 'LB1_' OR v_secclscd IS NULL
                    THEN
                           BEGIN

                                  SELECT
                                         low_lv_cd_value
                                  INTO
                                         v_secclscd
                                  FROM
                                         isr_catlg
                                  WHERE
                                         isr_id   = p_inIsr_id AND
                                         catlg_id = CSM_COMMON.CONST_CLASS_WMC_GLB;

                            EXCEPTION
                                     WHEN NO_DATA_FOUND THEN
                                     v_secclscd := 'LB1_Z';


                                     WHEN OTHERS THEN
                                     NULL;
                            END;

                    END IF;
                   -- TD#3728 End
             END IF;

        END IF;



 --sec_typ1, sec_typ2, sec_typ3 are added in input param list



            IF v_secclscd= 'LB1_'
            THEN

                 v_secclscd := NULL;

            END IF;

                RETURN v_secclscd;



    EXCEPTION
        WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN

            v_secclscd := NULL;
            RETURN v_secclscd;

        WHEN OTHERS THEN
            display_message('get_nss_lb_global_class_cd(): '||SQLERRM );
            RAISE_APPLICATION_ERROR(-20090,'get_nss_lb_global_class_cd():'||SQLERRM);

    END get_nss_lb_global_class_cd;

    /************************** maintain_lehman_data *******************************
    ***
    ***  Author      : TD#3389 added by Cognizant Technology Solutions
    ***  Date Created:  02/05/2008
    ***  Type        :  Public
    ***  Purpose     :
    ***
    ***  Changes     :  TD#3389
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    *****************************************************************************/
    PROCEDURE maintain_lehman_data (
        p_inSec_id                  IN      security_tbl.sec_id%TYPE,
        p_incatlg_item_id           IN      catlg_item.catlg_item_id%TYPE,
        p_inCatlg_id                IN      catlg_item.catlg_id%TYPE
    )
    IS

        v_srce_catlg_id      sec_catlg_tbl.srce_catlg_id%TYPE := NULL;


    BEGIN

        v_srce_catlg_id := csm_maintain_entity.get_srce_catlg_id(p_inCatlg_id);

        IF p_incatlg_item_id >0 OR p_incatlg_item_id IS NOT NULL THEN

        UPDATE
            SEC_CATLG_TBL
        SET
            CATLG_ITEM_ID = p_incatlg_item_id
        WHERE
            SEC_ID   = p_inSec_id        AND
            CATLG_ID = p_inCatlg_id;

        IF SQL%ROWCOUNT =0  THEN

        INSERT INTO SEC_CATLG_TBL (
            SEC_ID,
            CATLG_ID,
            CATLG_ITEM_ID,
            SRCE_CATLG_ID,
            INS_LOGIN,
            UPD_LOGIN,
            INS_TS,
            UPD_TS
        )
        VALUES(
            p_inSec_id,
            p_inCatlg_id,
            p_incatlg_item_id,
            v_srce_catlg_id,
            USER,
            USER,
            SYSDATE,
            SYSDATE
        );

        END IF;

    END IF;

    EXCEPTION
        WHEN    DUP_VAL_ON_INDEX THEN

            NULL;

    END maintain_lehman_data;
    /************************** get_lehman_data *******************************
    ***
    ***  Author      : TD#3389 added by Cognizant Technology Solutions
    ***  Date Created:  02/05/2008
    ***  Type        :  Public
    ***  Purpose     :  Will get latest idr values for LB Scrub
    ***
    ***  Changes     :  TD#3389
    ***
    ***  When     Who        What
    ***  ----     ---        ----
    ***
    ****************************************************************************/
    FUNCTION    get_lehman_data   (
        p_inSec_id  IN      security_tbl.sec_id%TYPE,
        p_in_isr_id  IN       security_tbl.isr_id%TYPE
    )

    RETURN  lehman_rec_type

    IS

    CURSOR  c_get_rating_data (p_rating_srce_cd IN csm.csm_sec_rating_tbl.rating_srce_cd%TYPE)
    IS
        SELECT
            rat.rating,
            rat.eff_dt
        FROM
            ( SELECT  s.sec_id,
                      s.rating,
                      s.eff_dt,
                      s.rating_srce_cd,
                      rank() over (partition by s.rating_srce_cd
                                   order by s.eff_dt desc
                                   ) rat
              FROM   csm.csm_sec_rating_tbl s
              WHERE  s.rating_srce_cd = p_rating_srce_cd                     AND
                     s.rating_typ     = CSM_COMMON.CONST_RATING_TYPE_CREDIT  AND
                     s.sec_id = p_inSec_id
            ) rat,
            ref_rating r
        WHERE
            rat.rating_srce_cd = r.rating_srce_cd AND
            rat.rating         = r.rating AND
            rat.rat            = 1
        GROUP BY rat.rating,rat.eff_dt;

     CURSOR  c_isr_get_rating_data (p_rating_srce_cd IN isr_rating.rating_srce_cd%TYPE,
                                    p_isr_id IN isr_rating.isr_id%TYPE
                                    )
         IS
             SELECT
                 rat.rating,
                 rat.eff_dt
             FROM
                 ( SELECT  isr.isr_id,
                           isr.rating,
                           isr.eff_dt,
                           isr.rating_srce_cd,
                           rank() over (partition by isr.rating_srce_cd
                                        order by isr.eff_dt desc
                                        ) rat
                   FROM   isr_rating isr
                   WHERE  isr.rating_srce_cd = p_rating_srce_cd AND
                          isr.isr_id = p_isr_id
                 ) rat,
                 ref_rating r
             WHERE
                 rat.rating_srce_cd = r.rating_srce_cd AND
                 rat.rating         = r.rating AND
                 rat.rat            = 1
        GROUP BY rat.rating,rat.eff_dt;

     CURSOR  c_catlg_data (p_catlg_id IN sec_catlg_tbl.catlg_id%TYPE)
     IS
        SELECT
              catlg_item_id ,
              NVL(sc.code_value_lv1,'')||'-'||
              NVL(sc.code_value_lv2,'')||'-'||
              NVL(sc.code_value_lv3,'')||'-'||
              NVL(sc.code_value_lv4,'')||'-'||
              NVL(sc.code_value_lv5,'') catlg_item_id_desc
        FROM
              sec_catlg sc
        WHERE
              sc.sec_id= TRIM(p_inSec_id) AND
              sc.catlg_id = TRIM(p_catlg_id);

    v_lehman_data          lehman_rec_type;
    v_isr_id                      isr_rating.isr_id%TYPE;
    BEGIN
        IF p_in_isr_id IS NULL THEN
           SELECT
              st.isr_id
           INTO
              v_isr_id
           FROM
              security_tbl st
           WHERE
              st.sec_id       =  p_inSec_id    ;
        ELSE
           v_isr_id :=p_in_isr_id;
        END IF;
        SELECT
            s.sec_id sec_id ,
            s.sec_typ1 sec_typ1,
            s.sec_typ2 sec_typ2,
            s.sec_typ3 sec_typ3,
            isr.wmc_isr_id isr_id,
            isrf.wmc_isr_fam_id isr_fam_id,
            sfd.floater_flg floater_flg ,
            sfd.mortgage_class mortgage_class,
            sfd.financing_flg financing_flg,
            NULL sp_rating  ,
            NULL sp_rat_eff_dt ,
            NULL moody_rating ,
            NULL moody_rat_eff_dt,
            NULL fitch_rating ,
            NULL fitch_rat_eff_dt ,
            NULL sp_rating_BBB,
            0 catlg_item_id_379  ,
            NULL catlg_item_id_379_desc,
            0 catlg_item_id_339    ,
            NULL catlg_item_id_339_desc,
            NULL isr_sp_rating  ,
            NULL isr_sp_rat_eff_dt ,
            NULL isr_moody_rating ,
            NULL isr_moody_rat_eff_dt
        INTO
            v_lehman_data
        FROM
            issuer isr,
            security s ,
            issuer_family isrf,
            sec_fi_data_tbl sfd

        WHERE
            s.sec_id       =  p_inSec_id      AND
            s.isr_id       =  isr.isr_id      AND
            isr.isr_fam_id =  isrf.isr_fam_id AND
            s.sec_id       =  sfd.sec_id(+)   AND
            ROWNUM  <   2;


        BEGIN
            SELECT
                rf.rating
            INTO
                v_lehman_data.sp_rating_BBB
            FROM
                ref_rating rf
            WHERE
                rf.rating_srce_cd =  'SP' AND
                rf.rating         =  'BBB-';
        EXCEPTION

            WHEN OTHERS THEN
                v_lehman_data.sp_rating_BBB := 0;
        END;

        OPEN    c_get_rating_data('SP');
        FETCH   c_get_rating_data
        INTO    v_lehman_data.sp_rating ,
                v_lehman_data.sp_rat_eff_dt;
        CLOSE   c_get_rating_data;

        OPEN    c_get_rating_data('MOODY');
        FETCH   c_get_rating_data
        INTO    v_lehman_data.moody_rating ,
                v_lehman_data.moody_rat_eff_dt;
        CLOSE   c_get_rating_data;

        OPEN    c_get_rating_data('FITCH');
        FETCH   c_get_rating_data
        INTO    v_lehman_data.fitch_rating ,
                v_lehman_data.fitch_rat_eff_dt;
        CLOSE   c_get_rating_data;

        OPEN    c_catlg_data(339);
        FETCH   c_catlg_data
        INTO    v_lehman_data.catlg_item_id_339 ,
                v_lehman_data.catlg_item_id_339_desc;
        CLOSE   c_catlg_data;

        OPEN    c_catlg_data(379);
        FETCH   c_catlg_data
        INTO    v_lehman_data.catlg_item_id_379 ,
                v_lehman_data.catlg_item_id_379_desc;
        CLOSE   c_catlg_data;

        OPEN    c_isr_get_rating_data('SP',v_isr_id);
        FETCH   c_isr_get_rating_data
        INTO    v_lehman_data.isr_sp_rating ,
                v_lehman_data.isr_sp_rat_eff_dt;
        CLOSE   c_isr_get_rating_data;

        OPEN    c_isr_get_rating_data('MOODY',v_isr_id);
        FETCH   c_isr_get_rating_data
        INTO    v_lehman_data.isr_moody_rating ,
                v_lehman_data.isr_moody_rat_eff_dt;
        CLOSE   c_isr_get_rating_data;

    RETURN  v_lehman_data;

    END get_lehman_data;
    -- TD 3389 Changes End.
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
    RETURN    fi_lb_mthly.lb_class_cd%TYPE
    IS

        v_lb_class_cd   fi_lb_mthly.lb_class_cd%TYPE  :=  NULL;

    BEGIN

        --
        --  Get the CUSIP/ISIN of securities and
        --  find applicable Lehman sector based on IDs
        --

        SELECT
            *
        INTO
            v_lb_class_cd
        FROM(
            SELECT  DISTINCT
                    MAINTAIN_BB_isr_PKG.get_lb_class_cd(
                    NVL(cusip1, MAINTAIN_BB_SEC_PKG.get_isid_cusip(sedol1, isin1)),
                    ISIN1
            ) class_lb
            FROM(
                SELECT
                    sx.sec_id,
                    MAX(DECODE(extern_id_typ,'CUSIP', extern_id))  cusip1,
                    MAX(DECODE(extern_id_typ,'SEDOL', extern_id))  sedol1,
                    MAX(DECODE(extern_id_typ,'ISIN', extern_id))   isin1
                FROM
                    sec_external_id sx,
                    security_tbl s
                WHERE
                    sx.sec_id = p_inSec_id                         AND
                    sx.sec_id = s.sec_id                           AND
                    s.sec_status_cd ='A'                           AND
                    sx.extern_id_typ IN ('CUSIP', 'SEDOL', 'ISIN') AND
                    sx.exp_dt        >  SYSDATE
                GROUP BY
                    sx.sec_id
                ) external_ids
            ) lb_class_cd
        WHERE
            class_lb IS NOT NULL;

        RETURN v_lb_class_cd;

    EXCEPTION
        WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN

            v_lb_class_cd := NULL;
            RETURN v_lb_class_cd;

        WHEN OTHERS THEN

            display_message('get_vndr_lb_class_cd(): '||SQLERRM );
            RAISE_APPLICATION_ERROR(-20090,'get_vndr_lb_class_cd():'||SQLERRM);

    END get_vndr_lb_class_cd;

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
    )
    IS
        v_srce_catlg_id      sec_catlg_tbl.srce_catlg_id%TYPE := NULL;

    BEGIN

        v_srce_catlg_id := csm_maintain_entity.get_srce_catlg_id(p_inCatlg_id);

        IF p_incatlg_item_id >0 OR p_incatlg_item_id IS NOT NULL THEN

        INSERT INTO SEC_CATLG_TBL (
            SEC_ID,
            CATLG_ID,
            CATLG_ITEM_ID,
            SRCE_CATLG_ID,
            INS_LOGIN,
            UPD_LOGIN,
            INS_TS,
            UPD_TS
        )
        VALUES(
            p_inSec_id,
            p_inCatlg_id,
            p_incatlg_item_id,
            v_srce_catlg_id,
            USER,
            USER,
            SYSDATE,
            SYSDATE
        );

        END IF;

    EXCEPTION
        WHEN    DUP_VAL_ON_INDEX THEN

            NULL;

        WHEN OTHERS THEN

         RAISE_APPLICATION_ERROR(-20042,'maintain_lehman_sec_catlg():'||SQLERRM);

    END maintain_lehman_sec_catlg;

    /************************** maintain_sec_factor *******************************
    ***
    ***  Author: TD#3644  added 2008-Jun-17 Cognizant Technology Solutions
    ***  Date Created:  06/17/2008
    ***  Type:          Public
    ***  Purpose: Save the IPS security factor value in sec_factor_schd_tbl
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

    )
    IS


        v_sec_id               security_tbl.sec_id%TYPE          :=  p_inSec_id;
        v_fctr                 sec_factor_schd_tbl.fctr%TYPE     :=  p_infctr  ;
        v_date                 DATE                              :=  TRUNC(NVL(p_inEffective_dt,SYSDATE));
        v_fctr_typ             sec_factor_schd_tbl.fctr_typ%TYPE :=  p_inFctrTyp;
        v_srce_cd              sec_factor_schd_tbl.srce_cd%TYPE  :=  p_inSrceCd ;
        c_proc_func_name       VARCHAR2(32)    := 'maintain_sec_factor';     --TD3787 10/21/2008 DuttaD
        c_proc_loc             VARCHAR2(50)    := NULL;                      --TD3787 10/21/2008 DuttaD

    BEGIN


        INSERT INTO sec_factor_schd_tbl(
            sec_id   ,
            eff_dt   ,
            fctr_typ ,
            fctr     ,
            srce_cd
        )
        VALUES(
            v_sec_id  ,
            v_date    ,
            v_fctr_typ,
            v_fctr    ,
            v_srce_cd
        );

    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN

            UPDATE
                sec_factor_schd_tbl a
            SET
                a.fctr             = v_fctr
            WHERE
                a.eff_dt           =  v_date          AND
                a.sec_id           =  v_sec_id        AND
                a.fctr_typ         =  v_fctr_typ;

        WHEN OTHERS THEN

             RAISE_APPLICATION_ERROR(-20042,':'||c_pkg_name||'-'||c_proc_func_name||'-'||c_proc_loc||'-'||SQLERRM);   --TD3787 10/21/2008 DuttaD

  END maintain_sec_factor;


  /************************** maintain_lockup_expiration_dt ********************
  ***
  ***  Author       : khetrm:TD#5082
  ***  Date Created : 05/19/2011
  ***  Type         : Public
  ***  Purpose      : update the lockup expiration date from CSFB feed
  ***                 into security_attribute table.
  ***
  ***  Changes      :
  ***
  ***  When     Who        What
  ***  ----     ---        ----
  *****************************************************************************/

  PROCEDURE maintain_lockup_expiration_dt IS

    v_sec_id                 security_attribute.sec_id%TYPE;
    v_sym                    security_tbl.sym%TYPE;
    v_lockup_exp_dt          security_attribute.attr_dt_val%TYPE;
    c_attr_name     CONSTANT security_attribute.name%TYPE := 'LOCKUP_EXPIRATION_DT';
    c_proc_name     CONSTANT VARCHAR2(30) := 'maintain_lockup_expiration_dt';

    v_max_duplicate_cnt      NUMBER := 0;
    c_duplicate_hdr CONSTANT VARCHAR2(30) := '|LOCKUP DATE|  ';

    v_error_sec_id           VARCHAR2(32767) := 'Sec_id not found in IDR for following SYM: ' ||
                                                CHR(10) || CHR(10) ||
                                                '|SYMBOL|       '  || CHR(9) || c_duplicate_hdr || CHR(10);
    v_duplicates             VARCHAR2(32767) := 'Multiple records in the CSFB feed for the following SYM: ' || CHR(10) ||
                                                'Note: Lockup expiration date with greatest effective date was ' ||
                                                'loaded to security_attribute' || CHR(10) ||
                                                CHR(10) || '|SYMBOL|       ';
    v_deletes                VARCHAR2(32767) := 'Following sec_id are deleted from security_attribute table ' ||
                                                'that are not present in Feed and ' ||
                                                'have lock up expiration date in future: ' ||
                                                CHR(10) || CHR(10) ||
                                                '|SYMBOL|       ' || CHR(9) || c_duplicate_hdr || CHR(10);

    v_mail_content           CLOB          := 'Data load completed successfully for CSFB lockup expiration date feed. '
                                              || CHR(10) || CHR(10);
    c_mail_subject  CONSTANT VARCHAR2(100) := ' CSFB Lockup Date Feed Results' ;
    v_sender                 VARCHAR2(400);
    v_recipient              VARCHAR2(400);

    c_program_id    CONSTANT VARCHAR2(30) := 'CSFB_LOAD';
    c_sender        CONSTANT VARCHAR2(30) := 'SENDER';
    c_recipient     CONSTANT VARCHAR2(30) := 'RECIPIENT';
    c_date_format   CONSTANT VARCHAR2(30) := 'MM-DD-YYYY';

  BEGIN

    SELECT param_value
      INTO v_sender
      FROM param_tab
     WHERE program_id = c_program_id
       AND param_key  = c_sender;

    SELECT param_value
      INTO v_recipient
      FROM param_tab
     WHERE program_id = c_program_id
       AND param_key  = c_recipient;

    SELECT MAX(COUNT(ticker)) cnt
      INTO v_max_duplicate_cnt
      FROM csfb_lockup_exp_dt_load csfb
     GROUP BY ticker;

    IF (v_max_duplicate_cnt > 1) THEN -- Find the maximum number of duplicates in the feed.
       FOR i IN 1..v_max_duplicate_cnt LOOP
           v_duplicates := v_duplicates || CHR(9) || c_duplicate_hdr; -- set the header of duplicates.
       END LOOP;
       v_duplicates := v_duplicates || CHR(10);
    END IF;

    FOR v_data IN (SELECT ticker, MAX(lockup_expiration_dt) lockup_expiration_dt, COUNT(ticker) cnt
                  FROM csfb_lockup_exp_dt_load csfb
                  GROUP BY ticker)
    LOOP

      v_sec_id        := csm_common.get_sec_id_from_sym(v_data.ticker); -- get sec_id of the SYM.
      v_lockup_exp_dt := v_data.lockup_expiration_dt;

      IF (v_sec_id IS NOT NULL) THEN
        maintain_security_attribute(v_sec_id,
                                    c_attr_name,
                                    TO_CHAR(v_lockup_exp_dt,
                                            c_date_format));

        csm_propagation.propagate_sec_id(v_sec_id);

        DBMS_OUTPUT.PUT_LINE('Processed SYM - ' || v_data.ticker ||
                             ' having sec_id ' || v_sec_id ||
                             ' and lockup expiration date - ' ||
                             v_lockup_exp_dt);
      ELSE
        v_error_sec_id := v_error_sec_id || RPAD(v_data.ticker, 15) || CHR(9) || RPAD(v_data.lockup_expiration_dt, 15) || CHR(10);
      END IF;

      -- Check for duplicates
      IF (v_data.cnt > 1) THEN
         v_duplicates := v_duplicates || RPAD(v_data.ticker, 15);

         FOR v_dups IN (SELECT lockup_expiration_dt
                          FROM csfb_lockup_exp_dt_load csfb
                         WHERE csfb.ticker = v_data.ticker
                         ORDER BY lockup_expiration_dt
                        )
         LOOP
           v_duplicates    := v_duplicates || CHR(9) || RPAD(TO_CHAR(v_dups.lockup_expiration_dt, c_date_format), 15);
         END LOOP;

         v_duplicates := v_duplicates || CHR(10);

      END IF;

    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CHR(10) || v_error_sec_id);
    FOR v_data IN (SELECT sa.sec_id sec_id, sa.attr_dt_val attr_dt_val
                     FROM security_Attribute sa
                    WHERE sa.name = c_attr_name
                   MINUS
                   SELECT csm_common.get_sec_id_from_sym(csfb.ticker) sec_id,
                          csfb.lockup_expiration_dt attr_dt_val
                     FROM csfb_lockup_exp_dt_load csfb) LOOP

      IF (v_data.attr_dt_val > TRUNC(SYSDATE)) THEN

        maintain_security_attribute(v_data.sec_id,
                                    c_attr_name,
                                    NULL);

        csm_propagation.propagate_sec_id(v_data.sec_id);

        DBMS_OUTPUT.PUT_LINE('deleted attribute for - ' || v_data.sec_id ||
                             ' having lock up expiration date ' ||
                             v_data.attr_dt_val);

        SELECT sym
          INTO v_sym
          FROM security_tbl
         WHERE sec_id = v_data.sec_id;

        v_deletes    := v_deletes || RPAD(v_sym, 15) || CHR(9)
                                  || RPAD(TO_CHAR(v_data.attr_dt_val, c_date_format), 15) || CHR(10);

      END IF;

    END LOOP;

    v_mail_content := v_mail_content || CHR(10) || v_error_sec_id || CHR(10)
                                     || v_duplicates || CHR(10)
                                     || v_deletes || CHR(10);

    CSM_eMBS_MAINTAIN.email_errors (c_mail_subject, v_mail_content, v_Sender, v_Recipient);

  EXCEPTION

    WHEN OTHERS THEN

      RAISE_APPLICATION_ERROR(-20042,
                              ':' || c_pkg_name || '-' || c_proc_name || '-' ||
                              SQLERRM);

  END maintain_lockup_expiration_dt;

  /************************************************************************-----------------------
   *  maintain_custom_cpn_schd : PUBLISHED
   *
   *  maintain custom_cpm_schd based on  next_cpn_dt and prev_cpn_dt
   *
   *  @param  p_inSec_id                  security id
   *  @param  p_inPrev_cpn_dt             previous coupon date date
   *  @param  p_inNext_cpn_dt             nextcoupon date
   *
   ***********************************************************************/

    PROCEDURE   maintain_custom_cpn_schd   (
        p_inSec_id                     IN      security_tbl.sec_id%TYPE,
        p_inPrev_cpn_dt                IN      sec_period_data_tbl.prev_cpn_dt%TYPE,
        p_inNext_cpn_dt                IN      sec_period_data_tbl.next_cpn_dt%TYPE,
        p_inPmt_freq                   IN      param_tab.param_value%TYPE,
        p_inDelay_days                 IN      sec_fi_data_tbl.delay_days%TYPE,
        p_inFirst_accrual_dt           IN      sec_fi_data_tbl.first_accrual_dt%TYPE

    )
    IS

        v_max_dt                    sec_period_data_tbl.next_cpn_dt%TYPE;
        v_days                      PLS_INTEGER;

        v_Prev_cpn_dt               sec_period_data_tbl.prev_cpn_dt%TYPE;
        v_Next_cpn_dt               sec_period_data_tbl.next_cpn_dt%TYPE;


    BEGIN


        v_Prev_cpn_dt  :=  p_inPrev_cpn_dt - p_inDelay_days;
        v_Next_cpn_dt  :=  p_inNext_cpn_dt - p_inDelay_days;


        v_days  :=  CSM_COMMON.get_param_tab_value('CUSTOM_CPN',p_inPmt_freq);

        BEGIN
            SELECT
                MAX(cpn_dt)
            INTO
                v_max_dt
            FROM
                CUSTOM_CPN_SCHD
            WHERE
                sec_id     =   p_inSec_id    AND
                schd_typ   =   'NEXT_CPN_DT';
        EXCEPTION
            WHEN NO_DATA_FOUND THEN

                v_max_dt                :=  NULL;
        END;

        IF p_inFirst_accrual_dt IS NOT NULL THEN

                 UPDATE
                     CUSTOM_CPN_SCHD
                 SET
                     cpn_dt  =   p_inFirst_accrual_dt
                 WHERE
                     sec_id    =   p_inSec_id         AND
                     schd_typ  =   'NEXT_CPN_DT'      AND
                     cpn_dt    =  (
                        SELECT
                            MIN(cpn_dt)
                        FROM
                            CUSTOM_CPN_SCHD
                        WHERE
                             sec_id    =   p_inSec_id         AND
                             schd_typ  =   'NEXT_CPN_DT');

                 IF SQL%NOTFOUND THEN



                     INSERT INTO CUSTOM_CPN_SCHD
                     (
                         sec_id,
                         schd_typ,
                         cpn_dt,
                         ins_ts,
                         ins_login,
                         upd_ts,
                         upd_login
                     )
                     SELECT
                          p_inSec_id,
                         'NEXT_CPN_DT',
                          p_inFirst_accrual_dt,
                          SYSDATE,
                          USER,
                          SYSDATE,
                          USER
                     FROM
                         dual
                     WHERE
                          NOT EXISTS
                          (
                             SELECT 1
                             FROM
                                custom_cpn_schd
                             WHERE
                                 sec_id     =  p_inSec_id           AND
                                 schd_typ   =  'NEXT_CPN_DT'        AND
                                 cpn_dt     =  p_inFirst_accrual_dt
                          );
                 END IF;

        END IF;


        IF   v_max_dt  IS NULL THEN

             IF   v_Prev_cpn_dt IS NOT NULL   AND
                  v_Prev_cpn_dt >  p_inFirst_accrual_dt   THEN

                 BEGIN

                    INSERT INTO CUSTOM_CPN_SCHD
                    (
                     sec_id,
                     schd_typ,
                     cpn_dt,
                     ins_ts,
                     ins_login,
                     upd_ts,
                     upd_login
                    )
                    VALUES
                    (
                      p_inSec_id,
                      'NEXT_CPN_DT',
                      v_Prev_cpn_dt,
                      SYSDATE,
                      USER,
                      SYSDATE,
                      USER
                    );
                EXCEPTION
                    WHEN OTHERS THEN
                       NULL;
                END;

             END IF;

             IF  v_Next_cpn_dt IS NOT NULL  THEN

                 BEGIN
                    INSERT INTO CUSTOM_CPN_SCHD
                    (
                     sec_id,
                     schd_typ,
                     cpn_dt,
                     ins_ts,
                     ins_login,
                     upd_ts,
                     upd_login
                    )
                    VALUES
                    (
                      p_inSec_id,
                      'NEXT_CPN_DT',
                      v_Next_cpn_dt,
                      SYSDATE,
                      USER,
                      SYSDATE,
                      USER
                    );
                   EXCEPTION
                    WHEN OTHERS THEN
                       NULL;
                END;
            END IF;

        ELSE

            IF v_Next_cpn_dt   <>    v_max_dt   THEN

              IF v_Next_cpn_dt  BETWEEN v_max_dt - v_days and v_max_dt + v_days THEN

                  UPDATE
                      CUSTOM_CPN_SCHD s
                  SET
                      CPN_DT   =   v_Next_cpn_dt
                  WHERE
                      sec_id     =   p_inSec_id     AND
                      schd_typ   =   'NEXT_CPN_DT'  AND
                      cpn_dt     =   (
                                          SELECT
                                                 MAX(cpn_dt)
                                          FROM
                                                 CUSTOM_CPN_SCHD c
                                          WHERE
                                                 c.sec_id    =   s.sec_id    AND
                                                 c.schd_typ  =   s.schd_typ);

              ELSE

                       INSERT INTO CUSTOM_CPN_SCHD
                       (
                           sec_id,
                           schd_typ,
                           cpn_dt,
                           ins_ts,
                           ins_login,
                           upd_ts,
                           upd_login
                       )
                       VALUES
                       (
                            p_inSec_id,
                            'NEXT_CPN_DT',
                            v_Next_cpn_dt,
                            SYSDATE,
                            USER,
                            SYSDATE,
                            USER
                       );

                  END IF;


              END IF;

            END IF;


    EXCEPTION

         WHEN OTHERS THEN

             NULL;


    END maintain_custom_cpn_schd;

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
                                  p_called_from IN VARCHAR2)

   IS

    v_trade_desc       sec_descriptor.long_descriptor%TYPE;
    v_sec_typ1         sec_type.sec_typ1%TYPE;
    v_sec_typ2         sec_type.sec_typ2%TYPE;
    v_sec_typ3         sec_type.sec_typ3%TYPE;
    v_sec_name         security_tbl.sec_nm%TYPE;
    v_expiration_date  sec_deriv_data_tbl.expiration_dt%TYPE;
    v_strike_price     sec_deriv_data_tbl.strike_price%TYPE;
    v_ticker           security_tbl.vendor_ticker%TYPE;
    v_undrlyn_vndr_tkr security_tbl.vendor_ticker%TYPE;
    v_undrlyn_invst_id csm_security.UNDERLYING_INVEST_ID%TYPE;
    v_sec_id           security_tbl.sec_id%TYPE := p_sec_id;
    v_exist            NUMBER := 0;
    v_del_flag         VARCHAR2(1) := 'N';

  BEGIN

    IF p_called_from = 'FORMS' THEN
      BEGIN

        SELECT count(*)
          INTO v_exist
          FROM sec_external_id se
         WHERE se.sec_id = v_sec_id
           AND se.extern_id_typ IN ('CALYPSO_ID', 'BB_UNIQUE')
           AND se.eff_dt =
               (SELECT MAX(s.eff_dt)
                  FROM sec_external_id s
                 WHERE s.sec_id = v_sec_id
                   AND s.extern_id_typ = se.extern_id_typ)
           AND se.exp_dt > TRUNC(SYSDATE)
           AND se.eff_dt <= TRUNC(SYSDATE);

      EXCEPTION
        WHEN OTHERS THEN

          v_exist := 0;

      END;

      /* If record exists for Cylapso or Bloomberg unique ID then don't update the sec description. Controller will update the trade description on NSS/DSS */
      IF v_exist > 0 THEN
        RETURN;
      END IF;

    END IF;

    BEGIN

      SELECT UPPER(TRIM(vendor_ticker)),
             sec_typ1,
             sec_typ2,
             sec_typ3,
             UPPER(sec_nm),
             expiration_dt,
             quoted_strike_prc,
             UNDERLYING_INVEST_ID
        INTO v_ticker,
             v_sec_typ1,
             v_sec_typ2,
             v_sec_typ3,
             v_sec_name,
             v_expiration_date,
             v_strike_price,
             v_undrlyn_invst_id
        FROM csm_security
       WHERE sec_id = v_sec_id;

    EXCEPTION
      WHEN OTHERS THEN

        v_ticker := NULL;

    END;

    BEGIN

      SELECT UPPER(TRIM(vendor_ticker))
        INTO v_undrlyn_vndr_tkr
        FROM csm_security
       WHERE INVEST_ID = v_undrlyn_invst_id;

    EXCEPTION
      WHEN OTHERS THEN

        v_undrlyn_vndr_tkr := NULL;

    END;

    /* Remove the country code/exchange code etc from Vendor ticker . We only use ticker part*/
    IF v_undrlyn_vndr_tkr IS NOT NULL AND
       INSTR(v_undrlyn_vndr_tkr, ' ', 1, 1) > 0 THEN

      v_undrlyn_vndr_tkr := substr(v_undrlyn_vndr_tkr,
                                   1,
                                   instr(v_undrlyn_vndr_tkr, ' ', 1, 1) - 1);

    END IF;

    /* Remove the country code/exchange code etc from Vendor ticker . We only use ticker part*/
    IF v_ticker IS NOT NULL AND INSTR(v_ticker, ' ', 1, 1) > 0 THEN

      v_ticker := substr(v_ticker, 1, instr(v_ticker, ' ', 1, 1) - 1);

    END IF;

    /* Following code will derive the value of trade description depending on various conditions*/
    /* In case any data point is null , insertion in sec_descriptor is Deferred */
    CASE
      WHEN v_sec_typ1 IN ('OPT') AND v_sec_typ2 IN ('IDXOPT', 'STKOPT') AND
           INSTR(v_sec_name, 'FLEX') = 0 THEN
        CASE
          WHEN v_undrlyn_vndr_tkr IS NULL OR v_expiration_date IS NULL OR
               v_sec_typ3 IS NULL OR v_sec_typ3 = 'NA' OR
               v_strike_price IS NULL THEN
            v_trade_desc := NULL;
          ELSE
            v_trade_desc := v_undrlyn_vndr_tkr || ' ' ||
                            to_char(v_expiration_date, 'MM/DD/YY') || ' ' ||
                            CASE v_sec_typ3
                              WHEN 'CALL' THEN
                               'C'
                              WHEN 'PUT' THEN
                               'P'
                            END || TRUNC(v_strike_price, 4);
        END CASE;

      WHEN v_sec_typ1 IN ('OPT') AND v_sec_typ2 IN ('CMDYFUTO') THEN
        CASE
          WHEN v_ticker IS NULL OR v_expiration_date IS NULL OR
               v_strike_price IS NULL THEN
            v_trade_desc := NULL;
          ELSE
            v_trade_desc := v_ticker || ' ' || TRUNC(v_strike_price, 4) || ' ' ||
                            TO_CHAR(v_expiration_date, 'MON') || ' ' ||
                            TO_CHAR(v_expiration_date, 'YY');
        END CASE;

      WHEN INSTR(v_sec_name, 'FLEX') > 0 THEN
        CASE
          WHEN v_undrlyn_vndr_tkr IS NULL OR v_expiration_date IS NULL OR
               v_sec_typ3 IS NULL OR v_sec_typ3 = 'NA' OR
               v_strike_price IS NULL THEN
            v_trade_desc := NULL;
          ELSE
            v_trade_desc := 'FLEX' || ' ' || v_undrlyn_vndr_tkr || ' ' ||
                            to_char(v_expiration_date, 'MM/DD/YY') || ' ' ||
                            CASE v_sec_typ3
                              WHEN 'CALL' THEN
                               'C'
                              WHEN 'PUT' THEN
                               'P'
                            END || TRUNC(v_strike_price, 4);
        END CASE;

    END CASE;

    /* Maintain sec descriptor table */

    maintain_sec_descriptor_table(v_sec_id,
                                  'WMC',
                                  'WMC_DESCRIPTION',
                                  309,
                                  v_trade_desc,
                                  v_trade_desc);

  END derive_sec_descriptor;

END MAINTAIN_BB_SEC_PKG;
/
sho err
