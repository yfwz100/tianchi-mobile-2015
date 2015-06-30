
drop table if exists jun11_uicr_train_lb17_wz;
create table jun11_uicr_train_lb17_wz as
select

    a.user_id, a.item_id, a.item_category,
    -- hour clicks.
    hour00, hour01, hour02, hour03, hour04, hour05, hour06, hour07, hour08, 
    hour09, hour10, hour11, hour12, hour13, hour14, hour15, hour16, hour17, 
    hour18, hour19, hour20, hour21, hour22, hour23, 
    -- -------------------------------------------------------------------------
    -- new user/item problem.
    -- -------------------------------------------------------------------------
    -- last hour of behavior. - previous 1 day.
    last_browse_times ui_pre1_max_bws_cnt,
    last_collect_hour ui_pre1_max_clt_hr,
    last_cart_hour ui_pre1_max_crt_hr, 
    coalesce(c.ui_max_beh_hr, -1) ui_pre1_max_beh_hr,
    coalesce(c.ui_bws_span, -1) ui_pre1_bws_span,
    coalesce(c.ui_beh_span, -1) ui_pre1_beh_span,
    coalesce(c.ui_bws_cnt, -1) ui_pre1_beh_cnt,
    last_operate_weight_times ui_pre1_beh_wgt,
    coalesce(c.ui_beh_wgt_pow, 0) ui_pre1_beh_wgt_pow,
    coalesce(c.ui_min_beh_hr, -1) ui_pre1_min_beh_hr,
    coalesce(c.uc_max_beh_hr, -1) uc_pre1_max_beh_hr,
    coalesce(c.uc_min_beh_hr, -1) uc_pre1_min_beh_hr,
    coalesce(c.uc_beh_wgt_pow, 0) uc_pre1_beh_wgt_pow,
    coalesce(c.uc_beh_wgt, 0) uc_pre1_beh_wgt,
    
    -- last hour of behavior. - previous 2 day.
    last_2_click_times ui_pre2_bws_cnt,
    last_2_collect_hour ui_pre2_max_clt_hr,
    last_2_cart_hour ui_pre2_max_crt_hr, 
    coalesce(d.ui_max_buy_hr, -1) ui_pre2_max_buy_hr,
    coalesce(d.ui_max_beh_hr, -1) ui_pre2_max_beh_hr,
    coalesce(d.ui_bws_span, -1) ui_pre2_bws_span,
    coalesce(d.ui_beh_span, -1) ui_pre2_beh_span,
    last_2_operate_times ui_pre2_beh_cnt,
    coalesce(d.ui_beh_wgt, 0) ui_pre2_beh_wgt,
    coalesce(d.ui_beh_wgt_pow, -1) ui_pre2_beh_wgt_pow,
    coalesce(d.ui_min_beh_hr, -1) ui_pre2_min_beh_hr,
    coalesce(d.uc_max_beh_hr, -1) uc_pre2_max_beh_hr,
    coalesce(d.uc_min_beh_hr, -1) uc_pre2_min_beh_hr,
    coalesce(d.uc_beh_wgt_pow, 0) uc_pre2_beh_wgt_pow, 
    coalesce(d.uc_beh_wgt, 0) uc_pre2_beh_wgt,
    
    -- previous 3 day
    coalesce(e.ui_bws_cnt, 0) ui_pre3_bws_cnt,
    coalesce(e.ui_max_clt_hr, -1) ui_pre3_max_clt_hr,
    coalesce(e.ui_max_crt_hr, -1) ui_pre3_max_crt_hr,
    coalesce(e.ui_max_buy_hr, -1) ui_pre3_max_buy_hr,
    coalesce(e.ui_max_beh_hr, -1) ui_pre3_max_beh_hr,
    coalesce(e.ui_min_beh_hr, -1) ui_pre3_min_beh_hr,
    coalesce(e.ui_bws_span, -1) ui_pre3_bws_span,
    coalesce(e.ui_beh_span, -1) ui_pre3_beh_span,
    coalesce(e.ui_beh_cnt, 0) ui_pre3_beh_cnt,
    coalesce(e.ui_beh_wgt_pow, 0) ui_pre3_beh_wgt_pow,
    coalesce(e.ui_beh_wgt, 0) ui_pre3_beh_wgt,
    coalesce(e.uc_max_beh_hr, -1) uc_pre3_max_beh_hr,
    coalesce(e.uc_min_beh_hr, -1) uc_pre3_min_beh_hr,
    coalesce(e.uc_beh_wgt_pow, 0) uc_pre3_beh_wgt_pow, 
    coalesce(e.uc_beh_wgt, 0) uc_pre3_beh_wgt,
    
    -- previous 4 day
    coalesce(f.ui_bws_cnt, 0) ui_pre4_bws_cnt,
    coalesce(f.ui_max_clt_hr, -1) ui_pre4_max_clt_hr,
    coalesce(f.ui_max_crt_hr, -1) ui_pre4_max_crt_hr,
    coalesce(f.ui_max_buy_hr, -1) ui_pre4_max_buy_hr,
    coalesce(f.ui_max_beh_hr, -1) ui_pre4_max_beh_hr,
    coalesce(f.ui_min_beh_hr, -1) ui_pre4_min_beh_hr,
    coalesce(f.ui_bws_span, -1) ui_pre4_bws_span,
    coalesce(f.ui_beh_span, -1) ui_pre4_beh_span,
    coalesce(f.ui_beh_cnt, 0) ui_pre4_beh_cnt,
    coalesce(f.ui_beh_wgt_pow, 0) ui_pre4_beh_wgt_pow,
    coalesce(f.ui_beh_wgt, 0) ui_pre4_beh_wgt,
    coalesce(f.uc_max_beh_hr, -1) uc_pre4_max_beh_hr,
    coalesce(f.uc_min_beh_hr, -1) uc_pre4_min_beh_hr,
    coalesce(f.uc_beh_wgt_pow, 0) uc_pre4_beh_wgt_pow, 
    coalesce(f.uc_beh_wgt, 0) uc_pre4_beh_wgt,
    -- 
    pro1_user_beh4,pro1_user_beh3,pro1_user_beh2,pro1_user_beh1,udiff1,uavghour1,
    upro1_bws_to_buy,upro1_col_to_buy,upro1_crt_to_buy,pro1_item_beh4,
    pro1_item_beh3,pro1_item_beh2,pro1_item_beh1,idiff1,iavghour1,
    ipro1_bws_to_buy,ipro1_col_to_buy,ipro1_crt_to_buy,pro1_chr4_cnt,
    pro2_chr4_cnt,pro3_chr4_cnt,pro1_chr3_cnt,pro2_chr3_cnt,pro3_chr3_cnt,
    pro1_chr2_cnt,pro2_chr2_cnt,pro3_chr2_cnt,pro1_geo_range,pro2_geo_range,
    pro3_geo_range,item_carttobuyrate,item_collecttobuyrate,
    item_browsetobuyrate,item_in_category_buy_rate,item_in_category_cart_rate,
    item_in_category_collect_rate,item_in_category_browse_rate,
    category_in_categoryies_buys_rate,category_in_categoryies_cart_rate,
    category_in_categoryies_collect_rate,category_in_categoryies_browse_rate,
    item_browsetobuyrate1,item_browsetobuyrate2,item_browsetobuyrate3,
    item_collecttobuyrate1,item_collecttobuyrate2,item_collecttobuyrate3,
    item_carttobuyrate1,item_carttobuyrate2,item_carttobuyrate3,
    user_carttobuyrate,user_catg_carttobuyrate,user_collecttobuyrate,
    user_catg_collecttobuyrate,user_browsetobuyrate,user_catg_browsetobuyrate,
    ui_item_carttobuyrate_dense_rank,ui_item_carttobuyrate_percent_rank,
    ui_item_collecttobuyrate_dense_rank,ui_item_collecttobuyrate_percent_rank,
    ui_item_browsetobuyrate_dense_rank,ui_item_browsetobuyrate_percent_rank,
    ui_item_in_category_buy_rate_dense_rank,
    ui_item_in_category_buy_rate_percent_rank,
    ui_item_in_category_cart_rate_dense_rank,
    ui_item_in_category_cart_rate_percent_rank,
    ui_item_in_category_collect_rate_dense_rank,
    ui_item_in_category_collect_rate_percent_rank,
    ui_item_in_category_browse_rate_dense_rank,
    ui_item_in_category_browse_rate_percent_rank,
    ui_item_browsetobuyrate1_dense_rank,
    ui_item_browsetobuyrate1_percent_rank,
    ui_item_browsetobuyrate2_dense_rank,
    ui_item_browsetobuyrate2_percent_rank,
    ui_item_browsetobuyrate3_dense_rank,
    ui_item_browsetobuyrate3_percent_rank,
    ui_item_collecttobuyrate1_dense_rank,
    ui_item_collecttobuyrate1_percent_rank,
    ui_item_collecttobuyrate2_dense_rank,
    ui_item_collecttobuyrate2_percent_rank,
    ui_item_collecttobuyrate3_dense_rank,
    ui_item_collecttobuyrate3_percent_rank,
    ui_item_carttobuyrate1_dense_rank,
    ui_item_carttobuyrate1_percent_rank,
    ui_item_carttobuyrate2_dense_rank,
    ui_item_carttobuyrate2_percent_rank,
    ui_item_carttobuyrate3_dense_rank,
    ui_item_carttobuyrate3_percent_rank,
    uc1_dense_rank,uc1_percent_rank,
    ui1_dense_rank,ui1_percent_rank,
    uc2_dense_rank,uc2_percent_rank,
    ui2_dense_rank,ui2_percent_rank,
    uc_item_in_category_buy_rate_dense_rank,
    uc_item_in_category_buy_rate_percent_rank,
    uc_item_carttobuyrate_dense_rank,
    uc_item_carttobuyrate_percent_rank,
    user_next1daybuy_num,item_next1daybuy_num,last_all_score,
    item_buy_cnt,user_buy_cnt,geo_diff_rep,crt_buy_cnt,
    crt_nobuy_cnt,col_buy_cnt,col_nobuy_cnt,bws_buy_cnt,bws_nobuy_cnt,
    pro1_buyincate_cnt,pro1_crtincate_cnt,pro1_colincate_cnt,
    pro1_bwsincate_cnt,last_browse_score,last_collect_score,
    last_cart_score,u_last_category_browse_times,u_last_all_browse_times,
    u_last_category_collect_times,u_last_all_collect_times,
    u_last_category_cart_times,u_last_all_cart_times,
    ui_last_category_browse_times_rate,
    ui_last_all_browse_times_rate,ui_last_category_collect_times_rate,
    ui_last_all_collect_times_rate,ui_last_category_cart_times_rate,
    ui_last_all_cart_times_rate,ui_last_browse_score_dense_rank,
    ui_last_browse_score_percent_rank,ui_last_collect_score_dense_rank,
    ui_last_collect_score_percent_rank,ui_last_cart_score_dense_rank,
    ui_last_cart_score_percent_rank,ui_u_last_category_browse_times_dense_rank,
    ui_u_last_category_browse_times_percent_rank,
    ui_u_last_category_collect_times_dense_rank,
    ui_u_last_category_collect_times_percent_rank,
    ui_u_last_category_cart_times_dense_rank,
    ui_u_last_category_cart_times_percent_rank,
    ui_ui_last_category_browse_times_rate_dense_rank,
    ui_ui_last_category_browse_times_rate_percent_rank,
    ui_ui_last_all_browse_times_rate_dense_rank,
    ui_ui_last_all_browse_times_rate_percent_rank,
    ui_ui_last_category_collect_times_rate_dense_rank,
    ui_ui_last_category_collect_times_rate_percent_rank,
    ui_ui_last_category_cart_times_rate_dense_rank,
    ui_ui_last_category_cart_times_rate_percent_rank,
    ui_last_all_score_dense_rank,ui_last_all_score_percent_rank,
    uc_last_browse_score_dense_rank,uc_last_browse_score_percent_rank,
    uc_last_collect_score_dense_rank,uc_last_collect_score_percent_rank,
    uc_last_cart_score_dense_rank,uc_last_cart_score_percent_rank,
    uc_ui_last_category_browse_times_rate_dense_rank,
    uc_ui_last_category_browse_times_rate_percent_rank,
    uc_ui_last_all_browse_times_rate_dense_rank,
    uc_ui_last_all_browse_times_rate_percent_rank,
    uc_last_all_score_dense_rank,uc_last_all_score_percent_rank,
    uc_last_collect_hour_dense_rank,uc_last_collect_hour_percent_rank,
    uc_last_cart_hour_dense_rank,uc_last_cart_hour_percent_rank,
    uc_last_operate_weight_times_dense_rank,
    uc_last_operate_weight_times_percent_rank,
    uc_last_operate_time_dense_rank,
    uc_last_operate_time_percent_rank,
    uc_last_operate_time_combine_dense_rank,
    uc_last_operate_time_combine_percent_rank,
    pro2w_log_prob,pro3w_log_prob,pro4w_log_prob,
    pro2w_buy_prob,pro3w_buy_prob,pro4w_buy_prob,
    pro2w_buy_times,pro3w_buy_times,pro4w_buy_times,
    pro2w_log_prob_ui,pro3w_log_prob_ui,pro4w_log_prob_ui,
    pro2w_buy_prob_ui,pro3w_buy_prob_ui,pro4w_buy_prob_ui,
    pro2w_buy_times_i,pro3w_buy_times_i,pro4w_buy_times_i,
    pro1_beh_incate_drank,pro1_beh_incate_prank,beh_nobuy_drank,
    beh_nobuy_prank,pro1_buy_times,pro1_crt_times,pro1_col_times,
    pro11_buy_times,pro11_crt_times,pro11_col_times,pro11_bws_times,
    pro1_buy_times_h,pro1_crt_times_h,pro1_col_times_h,pro1_bws_times_h,
    pro17_buy_times,pro17_crt_times,pro17_col_times,pro17_bws_times,
    u_recent_2d_interact_buy_prob,u_recent_3d_interact_buy_prob,
    u_recent_4d_interact_buy_prob,u_recent_5d_interact_buy_prob,
    u_recent_7d_interact_buy_prob,u_recent_15d_interact_buy_prob,
    u_recent_26d_interact_buy_prob,i_recent_2d_interact_buy_prob,
    i_recent_3d_interact_buy_prob,i_recent_4d_interact_buy_prob,
    i_recent_5d_interact_buy_prob,i_recent_7d_interact_buy_prob,
    i_recent_15d_interact_buy_prob,i_recent_26d_interact_buy_prob,
    u_pro20_return_rate,i_pro20_return_rate,u_pro1_pureact_cnt,
    u_pro1_pureact_beh1_cnt,u_pro1_pureact_beh2_cnt,u_pro1_pureact_beh3_cnt,
    u_pro1_pureact_beh4_cnt,u_pro2w_log_prob_inall,u_pro3w_log_prob_inall,
    u_pro4w_log_prob_inall,u_buy_cnt_inall,pro2_item_beh4_fix,pro2_item_beh3_fix,
    pro2_item_beh2_fix,pro2_item_beh1_fix,idiff2_fix,iavghour2_fix,
    ipro2_bws_to_buy_fix,ipro2_col_to_buy_fix,ipro2_crt_to_buy_fix,
    pro2_buyincate_cnt_fix,pro2_crtincate_cnt_fix,pro2_colincate_cnt_fix,
    pro2_bwsincate_cnt_fix,user_buy_cnt2_fix,u_buy_cnt2_inall_fix,
    u_pro2_return_rate_fix,pro3_item_beh4_fix,pro3_item_beh3_fix,
    pro3_item_beh2_fix,pro3_item_beh1_fix,idiff3_fix,iavghour3_fix,
    ipro3_bws_to_buy_fix,ipro3_col_to_buy_fix,ipro3_crt_to_buy_fix,
    user_buy_cnt3_fix,u_buy_cnt3_inall_fix,u_pro5_return_rate_fix,
    pro2_user_beh4_fix,pro2_user_beh3_fix,pro2_user_beh2_fix,
    pro2_user_beh1_fix,udiff2_fix,uavghour2_fix,upro2_bws_to_buy_fix,
    upro2_col_to_buy_fix,upro2_crt_to_buy_fix,item_buy_cnt2_fix,
    i_pro2_return_rate_fix,pro3_user_beh4_fix,pro3_user_beh3_fix,
    pro3_user_beh2_fix,pro3_user_beh1_fix,udiff3_fix,uavghour3_fix,
    upro3_bws_to_buy_fix,upro3_col_to_buy_fix,upro3_crt_to_buy_fix,
    item_buy_cnt3_fix,i_pro5_return_rate_fix,pro3_buy_times_fix,
    pro3_crt_times_fix,pro3_col_times_fix,pro3_bws_times_fix,
    pro3_buy_times_h_fix,pro3_crt_times_h_fix,pro3_col_times_h_fix,
    pro3_bws_times_h_fix,pro7_buy_times_fix,pro7_crt_times_fix,
    pro7_col_times_fix,pro7_bws_times_fix,item_browsetobuyrate1_recent3d_fix,
    item_browsetobuyrate2_recent3d_fix,item_browsetobuyrate3_recent3d_fix,
    item_collecttobuyrate1_recent3d_fix,item_collecttobuyrate2_recent3d_fix,
    item_collecttobuyrate3_recent3d_fix,item_carttobuyrate1_recent3d_fix,
    item_carttobuyrate2_recent3d_fix,item_carttobuyrate3_recent3d_fix,
    item_carttobuyrate_recent3d_fix,item_collecttobuyrate_recent3d_fix,
    item_browsetobuyrate_recent3d_fix,item_in_category_buy_rate_recent3d_fix,
    item_in_category_cart_rate_recent3d_fix,
    item_in_category_collect_rate_recent3d_fix,
    item_in_category_browse_rate_recent3d_fix,
    ui_item_browsetobuyrate1_recent3d_dense_rank_fix,
    ui_item_browsetobuyrate2_recent3d_dense_rank_fix,
    ui_item_browsetobuyrate3_recent3d_dense_rank_fix,
    ui_item_collecttobuyrate1_recent3d_dense_rank_fix,
    ui_item_collecttobuyrate2_recent3d_dense_rank_fix,
    ui_item_collecttobuyrate3_recent3d_dense_rank_fix,
    ui_item_carttobuyrate1_recent3d_dense_rank_fix,
    ui_item_carttobuyrate2_recent3d_dense_rank_fix,
    ui_item_carttobuyrate3_recent3d_dense_rank_fix,
    ui_item_carttobuyrate_recent3d_dense_rank_fix,
    ui_item_collecttobuyrate_recent3d_dense_rank_fix,
    ui_item_browsetobuyrate_recent3d_dense_rank_fix,
    ui_item_in_category_buy_rate_recent3d_dense_rank_fix,
    ui_item_in_category_cart_rate_recent3d_dense_rank_fix,
    ui_item_in_category_collect_rate_recent3d_dense_rank_fix,
    ui_item_in_category_browse_rate_recent3d_dense_rank_fix,
    ui_item_browsetobuyrate1_recent3d_percent_rank_fix,
    ui_item_browsetobuyrate2_recent3d_percent_rank_fix,
    ui_item_browsetobuyrate3_recent3d_percent_rank_fix,
    ui_item_collecttobuyrate1_recent3d_percent_rank_fix,
    ui_item_collecttobuyrate2_recent3d_percent_rank_fix,
    ui_item_collecttobuyrate3_recent3d_percent_rank_fix,
    ui_item_carttobuyrate1_recent3d_percent_rank_fix,
    ui_item_carttobuyrate2_recent3d_percent_rank_fix,
    ui_item_carttobuyrate3_recent3d_percent_rank_fix,
    ui_item_carttobuyrate_recent3d_percent_rank_fix,
    ui_item_collecttobuyrate_recent3d_percent_rank_fix,
    ui_item_browsetobuyrate_recent3d_percent_rank_fix,
    ui_item_in_category_buy_rate_recent3d_percent_rank_fix,
    ui_item_in_category_cart_rate_recent3d_percent_rank_fix,
    ui_item_in_category_collect_rate_recent3d_percent_rank_fix,
    ui_item_in_category_browse_rate_recent3d_percent_rank_fix,
    crt_buy_cnt_incate_drank_fix,col_buy_cnt_incate_drank_fix,
    bws_buy_cnt_incate_drank_fix,buy_cnt_incate_drank_fix,
    pro2_beh_incate_drank_fix,crt_buy_cnt_incate_prank_fix,
    col_buy_cnt_incate_prank_fix,bws_buy_cnt_incate_prank_fix,
    buy_cnt_incate_prank_fix,pro2_beh_incate_prank_fix,
    u_all_fist_interact_interval_days,
    u_all_last_interact_interval_days,
    u_all_fist_buy_interval_days,
    u_all_last_buy_interval_days,
    u_fist_interact_interval_days,
    u_last_interact_interval_days,
    u_fist_buy_interval_days,
    u_last_buy_interval_days,
    i_fist_interact_interval_days,
    i_last_interact_interval_days,
    i_fist_buy_interval_days,
    i_last_buy_interval_days,
    c_fist_interact_interval_days,
    c_last_interact_interval_days,
    c_fist_buy_interval_days,
    c_last_buy_interval_days,
    uc_fist_interact_interval_days,
    uc_last_interact_interval_days,
    uc_fist_buy_interval_days,
    uc_last_buy_interval_days,
    ui_uc_last_difftime,
    ui_ucbuy_last_difftime,
    ui_uccrt_last_difftime,
    ui_uccol_last_difftime,
    u_pro1_cate_beh1_cnt,
    u_pro1_cate_beh2_cnt,
    u_pro1_cate_beh3_cnt,u_pro1_cate_beh4_cnt,u_pro2_cate_beh1_cnt_fix,
    u_pro2_cate_beh2_cnt_fix,u_pro2_cate_beh3_cnt_fix,u_pro2_cate_beh4_cnt_fix,
    u_pro3_cate_beh1_cnt_fix,u_pro3_cate_beh2_cnt_fix,u_pro3_cate_beh3_cnt_fix,
    u_pro3_cate_beh4_cnt_fix,u_pro7_span_cate_beh1_cnt_fix,
    u_pro7_span_cate_beh2_cnt_fix,u_pro7_span_cate_beh3_cnt_fix,
    u_pro7_span_cate_beh4_cnt_fix,u_pro26_span_cate_beh1_cnt,
    u_pro26_span_cate_beh2_cnt,u_pro26_span_cate_beh3_cnt,
    u_pro26_span_cate_beh4_cnt,u_pro3_span_notfrtbuy_cnt_fix,
    u_pro3_span_notfrt_rate_fix,u_pro10_span_notfrtbuy_cnt_fix,
    u_pro10_span_notfrt_rate_fix,u_pro26_span_notfrtbuy_cnt,
    u_pro26_span_notfrt_rate,u_pro3_span_act5_cnt_fix,
    u_pro10_span_act5_cnt_fix,u_pro26_span_act5_cnt,u_pro3_span_jum_rate_fix,
    u_pro10_span_jum_rate_fix,u_pro26_span_jum_rate,
    i_pro3_span_notfrtbuy_cnt_fix,i_pro3_span_notfrt_rate_fix,
    i_pro10_span_notfrtbuy_cnt_fix,i_pro10_span_notfrt_rate_fix,
    i_pro26_span_notfrtbuy_cnt,i_pro26_span_notfrt_rate,
    i_pro3_span_jum_rate_fix,i_pro10_span_jum_rate_fix,i_pro26_span_jum_rate,
    ui_uc_last_difftime_inuc_prank,ui_uc_last_difftime_inu_drank,
    ui_uc_last_difftime_inu_prank,ui_ucbuy_last_difftime_inu_drank,
    ui_ucbuy_last_difftime_inu_prank,ui_uccrt_last_difftime_inuc_drank,
    ui_uccrt_last_difftime_inuc_prank,ui_uccrt_last_difftime_inu_drank,
    ui_uccrt_last_difftime_inu_prank,ui_uccol_last_difftime_inuc_drank,
    ui_uccol_last_difftime_inuc_prank,ui_uccol_last_difftime_inu_drank,
    ui_uccol_last_difftime_inu_prank,
    -- -- item trend
    -- coalesce(i_pre1_bws_trnd, -1000) i_pre1_bws_trnd,
    -- coalesce(i_pre1_clt_trnd, -1000) i_pre1_clt_trnd,
    -- coalesce(i_pre1_crt_trnd, -1000) i_pre1_crt_trnd,
    -- coalesce(i_pre1_buy_trnd, -1000) i_pre1_buy_trnd,
    -- -- the pre-4-day trends of item.
    -- coalesce(i_pre4_bws_trnd, -1000) i_pre4_bws_trnd,
    -- coalesce(i_pre4_clt_trnd, -1000) i_pre4_clt_trnd,
    -- coalesce(i_pre4_crt_trnd, -1000) i_pre4_crt_trnd,
    -- coalesce(i_pre4_buy_trnd, -1000) i_pre4_buy_trnd,
    -- -- the pre-1-week trends of item.
    -- coalesce(i_pre7_bws_trnd, -1000) i_pre7_bws_trnd,
    -- coalesce(i_pre7_clt_trnd, -1000) i_pre7_clt_trnd,
    -- coalesce(i_pre7_crt_trnd, -1000) i_pre7_crt_trnd,
    -- coalesce(i_pre7_buy_trnd, -1000) i_pre7_buy_trnd,
    -- label
    a.label
from
    17day_combine_fix_new_u_i_rank__0606 a
    -- left outer join
    -- jun3_itr_train_16to17_wz b
    -- on a.item_id=b.item_id and a.user_id=b.user_id
    left outer join
    user_item_category_behavior_agg_2014_12_16 c
    on a.user_id=c.user_id and a.item_id=c.item_id
    left outer join
    user_item_category_behavior_agg_2014_12_15 d
    on a.user_id=d.user_id and a.item_id=d.item_id
    left outer join
    user_item_category_behavior_agg_2014_12_14 e
    on a.user_id=e.user_id and a.item_id=e.item_id
    left outer join
    user_item_category_behavior_agg_2014_12_13 f
    on a.user_id=f.user_id and a.item_id=f.item_id
;

show p;