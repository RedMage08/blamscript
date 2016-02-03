(global bool reached_alt_music false)

(global bool player_regrouped false)

(global short randomglobal 0)

(global bool clean_up_left false)

(global bool clean_up_right false)

(global bool loop_waving_marine false)

(global bool cheat_to_d false)

(global bool player_in_peli_right false)

(global bool enc_c_normalhog false)

(global bool enc_c_rockethog false)

(global bool c_ended false)

(global bool wave2_passed false)

(global bool retreat1 false)

(global bool retreat2 false)

(global bool player_d_rhog false)

(global bool player_d_creep false)

(script static unit player0
(begin
(unit
(list_get
(players) 0))))

(script dormant void teleport_if_needed2
(begin
(sleep_until
(volume_test_objects maneuver_odst_a
(players)))
(sleep 60)
(ai_migrate enc_a_human_odst enc_a_human_odst2/b)
(sleep 10)
(ai_force_active enc_a_human_odst true)
(ai_force_active enc_a_human_odst2 true)
(ai_teleport_to_starting_location_if_unsupported enc_a_human_odst2)))

(script startup void beeps
(begin
(sleep_until
(volume_test_object beep_trig beeps))
(sound_impulse_start tm\sounds\sfx\beeps none 1.00)))

(script startup void allegiance_ambience
(begin
(ai_place a_creatures)
(ai_allegiance human player)
(ai_allegiance human flood)
(ai_allegiance player flood)
(ai_allegiance flood covenant)))

(script dormant void mop_up_beach
(begin
(sleep_until
(or clean_up_left clean_up_right player_regrouped))
(if
(or clean_up_left player_regrouped)
(begin
(ai_kill enc_a_covenant/left_a)
(ai_kill enc_a_covenant/left_0)
(ai_kill enc_a_covenant/left_1)
(ai_kill enc_a_covenant/left_2)
(ai_kill enc_a_covenant/left_3)
(ai_kill enc_a_covenant/left_4)
(ai_kill enc_a_covenant/left_5)
(ai_kill enc_a_covenant/left_6)
(ai_kill enc_a_covenant/left_7_frgrunts)
(ai_kill enc_a_covenant/left_8)
(ai_maneuver enc_a_human_left)
(sleep 60)
(ai_teleport_to_starting_location enc_a_human_left/i)))
(if
(or clean_up_right player_regrouped)
(begin
(ai_kill enc_a_covenant/right_1)
(ai_kill enc_a_covenant/right_2)
(ai_kill enc_a_covenant/right_3)
(ai_kill enc_a_covenant/right_4)
(ai_kill enc_a_covenant/right_5)
(ai_kill enc_a_covenant/right_6)
(ai_kill enc_a_covenant/right_7_ghost)
(ai_kill enc_a_covenant/right_8)
(object_set_permutation beach_ghost  ~damaged)
(unit_set_enterable_by_player beach_ghost false)
(ai_maneuver enc_a_human_right)
(sleep 60)
(ai_teleport_to_starting_location enc_a_human_right/g)))))

(script continuous void check_mop_up
(begin
(if
(volume_test_object mop_up_left check_mop_up)
(set clean_up_left true))
(if
(volume_test_object mop_up_right check_mop_up)
(set clean_up_right true))))

(script dormant void enc_a_human_moniter
(begin
(sleep_until
(or
(volume_test_object enc_a_mid_cov2 enc_a_human_moniter)
(volume_test_object enc_a_mid_cov enc_a_human_moniter)))
(ai_place enc_a_covenant/right_5)
(ai_place enc_a_covenant/left_4)
(ai_place enc_a_covenant/left_5)
(ai_place enc_a_covenant/left_6)
(sleep_until reached_alt_music)
(ai_place enc_a_covenant/right_6)
(ai_place enc_a_covenant/right_7_ghost)
(ai_place enc_a_covenant/right_8)
(ai_place enc_a_covenant/left_7_frgrunts)
(ai_magically_see_players enc_a_covenant/left_7_frgrunts)
(ai_place enc_a_covenant/left_8)
(sleep_until
(or
(volume_test_object regrouped enc_a_human_moniter)
(volume_test_object regrouped2 enc_a_human_moniter)))
(game_save_no_timeout)
(ai_braindead enc_a_covenant/top_1 false)
(ai_braindead enc_a_covenant/top_2 false)
(ai_disregard
(ai_actors enc_a_covenant/top_1) false)
(ai_disregard
(ai_actors enc_a_covenant/top_2) false)))

(script dormant void enc_a_human_left_manager
(begin
(sleep 60)
(sleep_until
(and
(<=
(ai_living_count enc_a_covenant/left_1) 2)
(<=
(ai_living_count enc_a_covenant/left_0) 0)))
(sleep 60)
(ai_maneuver enc_a_human_left/a)
(sleep_until
(<=
(ai_living_count enc_a_covenant/right_2) 2))
(sleep 60)
(ai_maneuver enc_a_human_left/b)
(sleep_until
(and reached_alt_music
(<=
(ai_living_count enc_a_covenant/right_2) 0)))
(sleep 60)
(ai_maneuver enc_a_human_left/c)
(sleep_until
(<=
(ai_living_count enc_a_covenant/right_4) 0))
(ai_maneuver enc_a_human_left/d)
(sleep_until
(<=
(ai_living_count enc_a_covenant/right_5) 0))
(ai_maneuver enc_a_human_left/e)
(sleep_until
(and
(<=
(ai_living_count enc_a_covenant/right_6) 0)
(<=
(ai_living_count enc_a_covenant/left_7_frgrunts) 1)))
(sleep 60)
(ai_maneuver enc_a_human_left/f)
(sleep_until
(<=
(ai_living_count enc_a_covenant/left_7_frgrunts) 0))
(ai_maneuver enc_a_human_left/g)))

(script dormant void enc_a_human_right_manager
(begin
(sleep 60)
(sleep_until
(<=
(ai_living_count enc_a_covenant/right_1) 3))
(sleep 60)
(ai_maneuver enc_a_human_right/a)
(sleep_until
(and
(<=
(ai_living_count enc_a_covenant/right_2) 1)
(<=
(ai_living_count enc_a_covenant/right_1) 0)))
(sleep 60)
(ai_maneuver enc_a_human_right/b)
(sleep_until
(and
(<=
(ai_living_count enc_a_covenant/right_3) 0)
(<=
(ai_living_count enc_a_covenant/right_4) 1)))
(sleep 60)
(ai_maneuver enc_a_human_right/c)
(sleep_until
(<=
(ai_living_count enc_a_covenant/right_4) 0))
(sleep 240)
(ai_maneuver enc_a_human_right/d)
(sleep_until
(and reached_alt_music
(<=
(ai_living_count enc_a_covenant/right_5) 1)
(<=
(ai_living_count enc_a_covenant/right_6) 0)))
(sleep 180)
(ai_maneuver enc_a_human_right/e)
(sleep_until
(<=
(ai_living_count enc_a_covenant/right_7_ghost) 0))
(ai_maneuver enc_a_human_right/f)))

(script dormant void sniper_manager
(begin
(sleep_until
(<=
(ai_living_count enc_a_covenant/right_2) 1))
(ai_command_list_advance enc_a_human_right/sniper)
(sleep 300)
(ai_command_list_advance enc_a_human_right)
(ai_command_list_advance enc_a_human_right)
(sleep 120)
(ai_command_list_advance enc_a_human_right)
(ai_maneuver enc_a_human_right/sniper)))

(script dormant void manage_top_marines
(begin
(sleep_until
(<=
(ai_living_count enc_a_covenant/top_1) 0))
(ai_command_list_advance_by_unit brandon)
(sleep_until
(<=
(ai_living_count enc_a_covenant/aa_wraith) 0))
(sleep 120)
(ai_command_list_advance_by_unit brandon)
(ai_command_list_advance_by_unit inv_marine_left)
(ai_command_list_advance_by_unit inv_marine_right)))

(script continuous void wave_marine
(begin
(sleep_until loop_waving_marine)
(custom_animation inv_marine_left tm\levels\tmc_b\anim\check_out_door loop_off_center true)))

(script dormant void obj2
(begin
(hud_set_objective_text obj2)
(show_hud_help_text true)
(hud_set_help_text obj2)
(sleep 300)
(show_hud_help_text false)))

(script dormant void end_peli_middlezorro
(begin
(sleep_until
(<=
(unit_get_custom_animation_time peli_middle) 1))
(object_destroy peli_middle)))

(script dormant void end_beach
(begin
(sleep 60)
(ai_magically_see_players enc_a_covenant)
(ai_try_to_fight_player enc_a_covenant/aa_wraith)
(sleep_until player_regrouped)
(sleep 30)
(ai_command_list_by_unit inv_marine_left inv_left_cover)
(ai_command_list_by_unit inv_marine_right inv_right_cover)
(ai_command_list_by_unit brandon brandon_top)
(wake manage_top_marines)
(sleep_until
(and player_regrouped
(<=
(ai_living_count enc_a_covenant/aa_wraith) 0)))
(deactivate_nav_point_flag end_beach obj1_regroup)
(deactivate_nav_point_object end_beach aa_wraith_obj1)
(sound_looping_stop levels\b30\music\b30_01)
(ai_conversation enc_a_brnd)
(sleep 240)
(object_create_anew peli_middle)
(object_create_anew odst1)
(object_create_anew odst2)
(ai_attach odst1 enc_a_human_odst/a)
(ai_attach odst2 enc_a_human_odst/a)
(ai_place pilots_bsp_a/1)
(ai_place pilots_bsp_a/1co)
(vehicle_load_magic peli_middle driver
(ai_actors pilots_bsp_a/1))
(vehicle_load_magic peli_middle co-driver
(ai_actors pilots_bsp_a/1co))
(vehicle_load_magic peli_middle rider
(ai_actors enc_a_human_odst/a))
(custom_animation peli_middle tm\levels\tmc_b\anim\pelicans\beach_pelicans beach_4_scarecrow_new true)
(unit_set_enterable_by_player peli_middle false)
(sleep_until
(<=
(unit_get_custom_animation_time peli_middle) 1623))
(vehicle_unload peli_middle rider)
(ai_conversation peli_a_end)
(wake obj2)
(unit_custom_animation_at_frame peli_middle tm\levels\tmc_b\anim\pelicans\beach_pelicans beach_4_scarecrow_new true 1200)
(wake end_peli_middlezorro)
(sleep 120)
(sleep 480)
(device_set_power first_door 1.00)
(device_set_position first_door 1.00)
(custom_animation inv_marine_left tm\levels\tmc_b\anim\check_out_door in true)
(ai_attach brandon enc_a_human_odst/a)
(sleep 60)
(device_set_power first_door 0.00)
(sleep 60)
(custom_animation inv_marine_left tm\levels\tmc_b\anim\check_out_door loop_off_center true)
(set loop_waving_marine true)
(ai_maneuver enc_a_human_odst/a)
(sleep 60)
(ai_place enc_a_sentinel)
(object_create_anew constr1)
(object_create_anew constr2)
(object_create_anew constr3)
(ai_attach constr1 sent_constructors_a/sent_con_a)
(ai_attach constr2 sent_constructors_a/sent_con_a)
(ai_attach constr3 sent_constructors_a/sent_con_a)
(sound_looping_start tm\sounds\sfx\gongs none 1.00)
(wake teleport_if_needed2)
(sleep 150)
(ai_erase enc_a_sentinel)))

(script dormant void hev_anim
(begin
(sleep 60)
(sleep_until
(<=
(ai_living_count enc_a_covenant/aa_wraith) 0))
(sleep 10)
(game_save_totally_unsafe)
(sleep 60)
(object_create hev1)
(object_create hev2)
(object_create hev3)
(object_create hev4)
(object_create hev5)
(sleep 60)
(scenery_animation_start hev1 tm\levels\tmc_b\anim\hev\hev hev1)
(scenery_animation_start hev2 tm\levels\tmc_b\anim\hev\hev hev2)
(scenery_animation_start hev3 tm\levels\tmc_b\anim\hev\hev hev3)
(sleep 120)
(sound_looping_start tm\sounds\music\glue\nolow1\nolow1 none 1.00)
(scenery_animation_start hev4 tm\levels\tmc_b\anim\hev\hev hev2)
(scenery_animation_start hev5 tm\levels\tmc_b\anim\hev\hev hev3)
(sleep_until
(<=
(ai_living_count enc_a_covenant/aa_wraith) 0))))

(script dormant void unload_pelicans
(begin
(vehicle_unload peli_right p-riderlf)
(vehicle_unload peli_right p-riderrf)
(vehicle_unload peli_left p-riderlf)
(vehicle_unload peli_left p-riderrf)
(sleep 60)
(vehicle_unload peli_right p-riderlm)
(vehicle_unload peli_right p-riderrm)
(vehicle_unload peli_left p-riderlm)
(vehicle_unload peli_left p-riderrm)
(ai_braindead enc_a_human_right false)
(ai_braindead enc_a_human_left false)
(sleep 60)
(vehicle_unload peli_right rider)
(vehicle_unload peli_left rider)
(sleep 60)
(vehicle_unload peli_right p-riderlf)
(vehicle_unload peli_right p-riderrf)
(vehicle_unload peli_left p-riderlf)
(vehicle_unload peli_left p-riderrf)))

(script dormant void a_pelicans
(begin
(sleep 441)
(object_destroy peli_middle)
(sleep 1558)
(object_destroy peli_left)
(object_destroy peli_right)))

(script dormant void obj1
(begin
(hud_set_objective_text obj1)
(show_hud_help_text true)
(hud_set_help_text obj1)
(sleep 300)
(show_hud_help_text false)))

(script dormant void cheat_to_dd
(begin
(object_create_anew enc_d_hog)
(object_create_anew enc_d_rhog)
(object_create_anew enc_d_creep)
(switch_bsp 3)
(vehicle_load_magic enc_d_hog w-driver cheat_to_dd)
(object_create_anew brandon)
(object_cannot_take_damage brandon)
(ai_place enc_d_human/gunner)
(ai_attach brandon enc_d_human/brandon)
(vehicle_load_magic enc_d_hog gunner
(ai_actors enc_d_human/gunner))
(vehicle_load_magic enc_d_hog passenger
(ai_actors enc_d_human/brandon))))

(script static bool cinematic_skip_start
(begin
(cinematic_skip_start_internal)
(game_save_totally_unsafe)
(sleep_until
(not
(game_saving)) 1)
(not
(game_reverted))))

(script static void cinematic_skip_stop
(begin
(cinematic_skip_stop_internal)))

(script dormant void beach_head
(begin
(object_destroy cine_c_peli_1)
(object_destroy cine_c_peli_2)
(object_destroy cine_c_peli_3)
(object_destroy cine_c_peli_4)
(object_destroy peli_crash)
(sound_looping_start levels\b30\music\b30_01 none 1.00)
(object_teleport beach_head plyer_beach)
(ai_place a_creatures)
(object_create_anew brandon)
(object_cannot_take_damage brandon)
(fade_out 0.00 0.00 0.00 0)
(cinematic_start)
(camera_control true)
(fade_out 0.00 0.00 0.00 0)
(sleep 30)
(object_create_anew peli_left)
(object_create_anew peli_right)
(ai_erase_all)
(object_destroy cine_sniper)
(object_destroy peli_crash)
(unit_set_enterable_by_player peli_left false)
(unit_set_enterable_by_player peli_right false)
(vehicle_hover peli_left true)
(vehicle_hover peli_right true)
(show_hud false)
(ai_allegiance human player)
(ai_allegiance player flood)
(ai_allegiance flood covenant)
(wake hev_anim)
(ai_place enc_a_covenant/turrets)
(ai_place enc_a_covenant/aa_wraith)
(vehicle_load_magic aa_wraith_obj1 driver
(ai_actors enc_a_covenant/aa_wraith))
(ai_disregard
(ai_actors enc_a_covenant/aa_wraith) true)
(ai_place enc_a_covenant/right_1)
(ai_place enc_a_covenant/right_2)
(ai_place enc_a_covenant/right_3)
(ai_place enc_a_covenant/right_4)
(ai_place enc_a_covenant/left_a)
(ai_place enc_a_covenant/left_0)
(ai_place enc_a_covenant/left_1)
(ai_place enc_a_covenant/left_2)
(ai_place enc_a_covenant/left_3)
(ai_place enc_a_covenant/top_1)
(ai_place enc_a_covenant/top_2)
(ai_braindead enc_a_covenant/top_1 true)
(ai_braindead enc_a_covenant/top_2 true)
(ai_disregard
(ai_actors enc_a_covenant/top_1) true)
(ai_disregard
(ai_actors enc_a_covenant/top_2) true)
(activate_nav_point_flag default beach_head obj1_regroup 0.00)
(activate_nav_point_object default beach_head aa_wraith_obj1 0.00)
(ai_place enc_a_human_right/a)
(ai_place enc_a_human_left)
(sleep 60)
(object_create_anew peli_right)
(object_create_anew peli_left)
(begin_random
(begin
(unit_enter_vehicle beach_head peli_right p-riderrf)
(ai_detach brandon)
(ai_attach brandon enc_a_human_left/a)
(set player_in_peli_right true))
(begin
(unit_enter_vehicle beach_head peli_left p-riderlf)
(ai_detach brandon)
(ai_attach brandon enc_a_human_right/a)
(set player_in_peli_right false)))
(ai_erase enc_a_covenant/randomiser1)
(ai_erase enc_a_human_right/randomiser2)
(ai_attach inv_marine_left enc_a_human_left/a)
(ai_attach inv_marine_right enc_a_human_right/a)
(ai_place pilots_bsp_a/1)
(ai_place pilots_bsp_a/2)
(ai_place pilots_bsp_a/1co)
(ai_place pilots_bsp_a/2co)
(vehicle_load_magic peli_right driver
(ai_actors pilots_bsp_a/1))
(vehicle_load_magic peli_left driver
(ai_actors pilots_bsp_a/2))
(vehicle_load_magic peli_right co-driver
(ai_actors pilots_bsp_a/1co))
(vehicle_load_magic peli_left co-driver
(ai_actors pilots_bsp_a/2co))
(vehicle_load_magic peli_right rider
(ai_actors enc_a_human_right/a))
(vehicle_load_magic peli_left rider
(ai_actors enc_a_human_left/a))
(if player_in_peli_right
(ai_braindead enc_a_human_right true)
(ai_braindead enc_a_human_left true))
(custom_animation peli_left tm\levels\tmc_b\anim\pelicans\beach_pelicans beach_1_new true)
(custom_animation peli_right tm\levels\tmc_b\anim\pelicans\beach_pelicans beach_2_new true)
(wake a_pelicans)
(fade_in 0.00 0.00 0.00 15)
(camera_set cine_a_pelicans_2.1 0)
(sleep 70)
(camera_control false)
(sleep 360)
(ai_conversation peli_a_lz)
(cinematic_set_title blitz)
(sleep 70)
(sleep 12)
(ai_place enc_a_human_right/sniper)
(game_save_totally_unsafe)
(cinematic_stop)
(wake unload_pelicans)
(unit_set_enterable_by_player peli_right false)
(unit_set_enterable_by_player peli_left false)
(wake end_beach)
(wake enc_a_human_left_manager)
(wake enc_a_human_right_manager)
(wake sniper_manager)
(show_hud true)
(sleep 60)
(ai_conversation marine_lz)
(wake obj1)
(wake enc_a_human_moniter)
(sleep_until
(volume_test_object enc_a_alt_music beach_head))
(sound_looping_set_alternate sound\music\perilous journey\perilous journey true)
(set reached_alt_music true)
(wake mop_up_beach)
(sleep_until
(or
(volume_test_object regrouped beach_head)
(volume_test_object regrouped2 beach_head)))
(set player_regrouped true)
(deactivate_nav_point_flag beach_head obj1_regroup)))

(script dormant void cine_b_lines
(begin
(sound_impulse_start tm\sounds\dialouge\sci2\line1_a scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_a))
(sound_impulse_start tm\sounds\dialouge\sci2\line1_b scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_b))
(sound_impulse_start tm\sounds\dialouge\sci2\line1_c scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_c))
(sound_impulse_start tm\sounds\dialouge\sci2\line1_d scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_d))
(sound_impulse_start tm\sounds\dialouge\sci2\line1_e scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_e))
(sound_impulse_start tm\sounds\dialouge\sci2\line1_f scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_f))
(sound_impulse_start tm\sounds\dialouge\sci2\line1_g scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_g))
(sound_impulse_start tm\sounds\dialouge\sci2\line1_h scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line1_h))
(sound_impulse_start tm\sounds\dialouge\brandon3\cine_b_brandon_1 none 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\brandon3\cine_b_brandon_1))
(sound_impulse_start tm\sounds\dialouge\sci2\line2 scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line2))
(sound_impulse_start tm\sounds\dialouge\brandon3\cine_b_brandon_2 none 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\brandon3\cine_b_brandon_2))
(sound_impulse_start tm\sounds\dialouge\may2\cine_b_may_1 may_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\may2\cine_b_may_1))
(sound_impulse_start tm\sounds\dialouge\sci2\line3 scientist_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\sci2\line3))
(sleep 420)
(sound_impulse_start tm\sounds\dialouge\captain\cut_1 captain_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\captain\cut_1))
(sleep 30)
(sound_impulse_start tm\sounds\dialouge\captain\cut_2 captain_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\captain\cut_2))
(sleep 70)
(sound_impulse_start tm\sounds\dialouge\captain\cut_3 captain_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\captain\cut_3))
(sound_impulse_start tm\sounds\dialouge\may2\cine_b_may_2 may_1 1.00)
(sleep
(sound_impulse_time tm\sounds\dialouge\may2\cine_b_may_2))))

(script dormant void cine_c_peli_bg_1
(begin
(object_create_anew cine_c_peli_4)
(object_teleport cine_c_peli_4 mainflight_1)
(custom_animation cine_c_peli_4 tm\levels\tmc_b\anim\pelicans\cine_c_d pelican_bg_1 true)
(sleep 499)
(object_destroy cine_c_peli_4)))

(script static void cine_b
(begin
(sleep 30)
(sound_looping_start sound\sinomatixx\x10_music01 none 0.50)
(switch_bsp 4)
(object_teleport cine_b plyer_bsp4)
(camera_set cine_b_a_1 0)
(object_create_anew scientist_1)
(object_create_anew scarecrow_1)
(object_create_anew brandon_1)
(object_create_anew captain_1)
(ai_attach scientist_1 cine_human)
(ai_attach scarecrow_1 cine_human)
(ai_attach brandon_1 cine_human)
(ai_attach captain_1 cine_human)
(unit_set_seat scientist_1 alert)
(unit_set_seat brandon_1 alert)
(unit_set_seat captain_1 stand)
(unit_set_seat scarecrow_1 alert)
(object_teleport brandon_1 cine_b_a_brandon)
(fade_in 0.00 0.00 0.00 100)
(sleep 100)
(camera_set cine_b_a_2 200)
(sleep 100)
(wake cine_b_lines)
(camera_set cine_b_a_3 150)
(sleep 25)
(sleep 50)
(camera_set cine_b_a_4 150)
(sleep 50)
(object_create_anew may_1)
(object_teleport may_1 cine_b_a_may)
(ai_attach may_1 cine_human)
(unit_set_seat may_1 alert)
(recording_play may_1 cine_b_a_may)
(sleep 25)
(camera_set cine_b_a_5 150)
(sleep 50)
(unit_set_seat brandon_1 alert)
(recording_play brandon_1 cine_b_a_brandon)
(sleep 25)
(camera_set cine_b_a_6 150)
(sleep 300)
(camera_set cine_b_b_1 0)
(camera_set cine_b_b_2 500)
(sleep 150)
(ai_command_list_by_unit scientist_1 cine_b_b_scientist)
(object_teleport brandon_1 cine_b_e_brandon)
(recording_kill may_1)
(object_destroy may_1)
(sleep 75)
(object_create_anew may_1)
(object_teleport may_1 cine_b_e_may)
(ai_attach may_1 cine_human)
(unit_set_seat may_1 alert)
(sleep 200)
(recording_play may_1 cine_b_e_may)
(sleep 30)
(camera_set cine_b_d_1 0)
(camera_set cine_b_d_2 200)
(sleep 200)
(camera_set cine_b_c_1 0)
(camera_set cine_b_c_2 250)
(sleep 150)
(object_create_anew marine_bg1)
(object_create_anew marine_bg2)
(ai_attach marine_bg1 cine_human)
(ai_attach marine_bg2 cine_human)
(ai_command_list_by_unit marine_bg1 cine_a_a_marinebg)
(ai_command_list_by_unit marine_bg2 cine_a_a_marinebg)
(sleep 150)
(camera_set cine_b_e_1 0)
(camera_set cine_b_e_2 250)
(sleep 250)
(camera_set cine_b_f_1 0)
(sleep 50)
(camera_set cine_b_f_2 200)
(sleep 200)
(camera_set cine_b_g_1 0)
(sleep 50)
(camera_set cine_b_g_2 200)
(sleep 200)
(camera_set cine_b_i_1 0)
(sleep 177)
(custom_animation may_1 tm\levels\tmc_b\anim\may\may a true)
(sleep 3)
(camera_set cine_b_h_1 0)
(sleep 510)
(camera_set cine_b_j_1 0)
(camera_set cine_b_j_2 300)
(sleep 200)
(camera_set cine_b_k_1 0)
(camera_set cine_b_k_2 360)
(sleep 360)
(camera_set cine_b_l_1 0)
(object_destroy marine_bg1)
(object_destroy marine_bg2)
(sleep 125)
(camera_set cine_b_l_2 125)
(sleep 220)
(object_create_anew marine_bg1)
(object_teleport marine_bg1 cine_b_marine)
(ai_attach marine_bg1 cine_human)
(recording_play marine_bg1 cine_b_marine)
(sleep 5)
(camera_set cine_b_q_1 0)
(sleep 64)
(camera_set cine_b_s_1 0)
(sleep 20)
(object_create_anew al_1)
(object_create_anew al_2)
(sound_looping_stop sound\sinomatixx\x10_music01)
(sound_looping_start tm\sounds\music\bat1\bat1 none 0.40)
(sound_impulse_start tm\sounds\dialouge\marines\b_cine_b marine_bg1 1.00)
(sleep 90)
(camera_set cine_b_t_1 0)
(camera_set cine_b_t_2 200)
(recording_play scientist_1 cine_b_t_scientist)
(recording_play captain_1 cine_b_t_captain)
(sleep 160)
(recording_kill scientist_1)
(camera_set cine_b_m_2 0)
(recording_play scientist_1 cine_b_m_scientist)
(sleep 25)
(recording_play captain_1 cine_b_m_captain)
(sleep 50)
(camera_set cine_b_q_2 0)
(camera_set cine_b_q_1 300)
(sleep 150)
(camera_set cine_b_o_4 300)
(sleep 250)
(camera_set cine_b_u_1 0)
(sleep 100)
(camera_set cine_b_r_1 0)
(sleep 50)
(recording_play scarecrow_1 cine_b_r_scarecrow)
(sleep 50)
(camera_set cine_b_o_4 0)
(sleep 200)
(recording_play may_1 cine_b_exit1)
(recording_play brandon_1 cine_b_exit3)
(sleep 220)
(camera_set cine_b_p_1 0)
(object_destroy marine_bg1)
(object_destroy scarecrow_1)
(recording_kill may_1)
(recording_kill brandon_1)
(object_teleport may_1 cine_b_p_may)
(object_teleport brandon_1 cine_b_p_brandon)
(recording_play may_1 cine_b_exit2)
(recording_play brandon_1 cine_b_exit4)
(camera_set cine_b_p_2 200)
(sleep 100)
(camera_set cine_b_p_3 200)
(sleep 100)
(camera_set cine_b_p_4 100)
(sleep 100)
(switch_bsp 5)
(object_teleport cine_b plyer_bsp5)
(object_create_anew cine_c_peli_1)
(object_create_anew cine_c_peli_2)
(object_teleport cine_c_peli_1 mainflight_1)
(object_teleport cine_c_peli_2 mainflight_1)
(object_create_anew cine_c_a_may)
(object_create_anew cine_c_a_brandon)
(object_create_anew cine_c_a_pilot)
(object_teleport cine_c_a_may cine_c_may_1)
(object_teleport cine_c_a_brandon cine_c_brandon_1)
(object_teleport cine_c_a_pilot cine_c_pilot_1)
(unit_set_seat cine_c_a_pilot alert)
(unit_set_seat cine_c_a_may alert)
(unit_set_seat cine_c_a_brandon alert)
(recording_play cine_c_a_may cine_c_a_may)
(recording_play cine_c_a_brandon cine_c_a_brandon)
(recording_play cine_c_a_pilot cine_c_a_pilot)
(camera_set cine_c_a_1 0)
(camera_set cine_c_a_2 200)
(scenery_animation_start longsword_cine_c tm\levels\tmc_b\anim\longsword2\longsword_cine fighterbomb_c)
(sleep 225)
(object_create_anew cine_c_marine_2)
(object_teleport cine_c_marine_2 cine_c_watchview_1)
(ai_place cine_c_marines)
(custom_animation cine_c_marine_5 cinematics\animations\marines\x10\x10 sitting_prep1 true)
(custom_animation cine_c_marine_6 cinematics\animations\marines\x10\x10 sitting_prep2 true)
(custom_animation cine_c_marine_7 cinematics\animations\marines\x10\x10 standing_prep2 true)
(custom_animation cine_c_marine_3 cinematics\animations\marines\x10\x10 standing_prep2 true)
(custom_animation cine_c_marine_4 cinematics\animations\marines\x10\x10 standing_prep2 true)
(custom_animation cine_c_marine_8 cinematics\animations\marines\x10\x10 standing_prep1 true)
(custom_animation cine_c_marine_15 cinematics\animations\marines\x10\x10 standing_prep2 true)
(custom_animation cine_c_marine_16 cinematics\animations\marines\x10\x10 standing_prep1 true)
(custom_animation cine_c_marine_17 cinematics\animations\marines\x10\x10 sitting_prep2 true)
(custom_animation cine_c_marine_18 cinematics\animations\marines\x10\x10 standing_prep2 true)
(custom_animation cine_c_marine_19 cinematics\animations\marines\x10\x10 standing_prep1 true)
(custom_animation cine_c_odst_gun cinematics\animations\marines\x10\x10 standing_prep2 true)
(custom_animation cine_c_odst_gun_2 cinematics\animations\marines\x10\x10 standing_prep2 true)
(custom_animation cine_c_marine_20 cinematics\animations\marines\x10\x10 standing_prep2 true)
(object_create_anew cine_c_f_may)
(unit_enter_vehicle cine_c_f_may cine_c_peli_1 p-riderlf)
(object_destroy cine_c_a_pilot)
(camera_set cine_c_b_1 0)
(sleep 150)
(camera_set cine_c_b_2 200)
(sleep 100)
(camera_set cine_c_b_3 200)
(sleep 100)
(object_create_anew cine_c_marine_9)
(objects_attach cine_c_marine_9 right hand baton_3_r right hand baton)
(objects_attach cine_c_marine_9 left hand baton_3_l left hand baton)
(object_teleport cine_c_marine_9 marine_baton_3)
(custom_animation cine_c_marine_9 cinematics\animations\marines\x10_normal\x10_normal x10groundcrew true)
(object_create_anew cine_c_marine_1)
(unit_enter_vehicle cine_c_marine_1 cine_c_tank_1 g-driver)
(camera_set cine_c_b_4 200)
(sleep 50)
(object_create_anew cine_c_hog1)
(object_create_anew cine_c_hogdriver1)
(unit_enter_vehicle cine_c_hogdriver1 cine_c_hog1 w-driver)
(object_teleport cine_c_hog1 cine_c_hog1)
(sleep 40)
(recording_play cine_c_hogdriver1 cine_c_hog1)
(sleep 10)
(camera_set cine_c_b_5 200)
(object_destroy cine_c_peli_3)
(object_destroy cine_c_a_brandon)
(object_create_anew cine_c_f_brandon)
(unit_enter_vehicle cine_c_f_brandon cine_c_peli_1 p-riderrf)
(object_destroy cine_c_a_may)
(sleep 100)
(camera_set cine_c_b_6 200)
(wake cine_c_peli_bg_1)
(recording_play cine_c_marine_1 cine_c_tank1)
(sleep 100)
(camera_set cine_c_b_7 200)
(sleep 100)
(camera_set cine_c_b_8 200)
(sleep 40)
(object_destroy cine_c_hog1)
(sleep 60)
(camera_set cine_c_b_9 200)
(object_destroy cine_c_marine_1)
(object_destroy cine_c_tank_1)
(object_create_anew cine_c_marine_1)
(object_create_anew cine_c_hog1)
(object_create_anew cine_c_hogdriver1)
(unit_enter_vehicle cine_c_hogdriver1 cine_c_hog1 w-driver)
(unit_enter_vehicle cine_c_marine_1 cine_c_hog1 w-gunner)
(sleep 75)
(custom_animation cine_c_peli_1 tm\levels\tmc_b\anim\pelicans\cine_c_d mainflight_1 true)
(custom_animation cine_c_peli_2 tm\levels\tmc_b\anim\pelicans\cine_c_d mainflight_2 true)
(sleep 25)
(camera_set cine_c_b_10 200)
(sleep 100)
(object_teleport cine_c_hog1 cine_c_hog2)
(recording_play cine_c_hogdriver1 cine_c_hog1)
(camera_set cine_c_d_1 0)
(camera_set cine_c_d_2 200)
(sleep 150)
(object_destroy cine_c_marine_1)
(object_create_anew cine_c_marine_1)
(objects_attach cine_c_marine_1 right hand baton_1_r right hand baton)
(objects_attach cine_c_marine_1 left hand baton_1_l left hand baton)
(object_teleport cine_c_marine_1 marine_baton_1)
(custom_animation cine_c_marine_1 cinematics\animations\marines\x10_normal\x10_normal x10groundcrew true)
(object_destroy cine_c_marine_2)
(object_create_anew cine_c_marine_2)
(objects_attach cine_c_marine_2 right hand baton_2_r right hand baton)
(objects_attach cine_c_marine_2 left hand baton_2_l left hand baton)
(object_teleport cine_c_marine_2 marine_baton_2)
(camera_set cine_c_e_1 0)
(object_destroy cine_c_hog1)
(camera_set cine_c_e_2 300)
(custom_animation cine_c_marine_2 cinematics\animations\marines\x10_normal\x10_normal x10groundcrew true)
(sleep 200)
(camera_set cine_c_e_3 200)
(sleep 200)
(object_teleport cine_c_tank_2 cine_c_hog3)
(camera_set cine_c_f_1 0)
(object_create_anew cine_c_marine_14)
(object_create_anew cine_c_marine_13)
(object_create_anew cine_c_marine_12)
(object_create_anew cine_c_marine_11)
(object_create_anew cine_c_marine_10)
(ai_attach cine_c_marine_10 cine_human)
(ai_attach cine_c_marine_11 cine_human)
(ai_attach cine_c_marine_12 cine_human)
(ai_attach cine_c_marine_13 cine_human)
(ai_attach cine_c_marine_14 cine_human)
(unit_stop_custom_animation cine_c_marine_1)
(unit_stop_custom_animation cine_c_marine_2)
(unit_exit_vehicle cine_c_f_brandon)
(unit_set_seat cine_c_f_brandon stand)
(sleep 15)
(recording_play cine_c_f_brandon cine_c_f_brandon)
(sleep 35)
(camera_set cine_c_f_2 200)
(sleep 100)
(ai_command_list_by_unit cine_c_marine_10 cine_c_f_marines)
(ai_command_list_by_unit cine_c_marine_11 cine_c_f_marines)
(ai_command_list_by_unit cine_c_marine_12 cine_c_f_marines)
(ai_command_list_by_unit cine_c_marine_13 cine_c_f_marines)
(ai_command_list_by_unit cine_c_marine_14 cine_c_f_marines)
(camera_set cine_c_f_3 200)
(sleep 100)
(object_destroy cine_c_f_brandon)
(camera_set cine_c_f_4 200)
(sleep 100)
(ai_place cine_c_f_marines)
(camera_set cine_c_f_5 200)
(sleep 40)
(unit_enter_vehicle cine_c_marine_10 cine_c_peli_2 p-riderrb01)
(sleep 12)
(unit_enter_vehicle cine_c_marine_11 cine_c_peli_2 p-riderlb01)
(sleep 12)
(unit_enter_vehicle cine_c_marine_12 cine_c_peli_2 p-riderrm)
(sleep 12)
(unit_enter_vehicle cine_c_marine_13 cine_c_peli_2 p-riderlb)
(sleep 12)
(unit_enter_vehicle cine_c_marine_14 cine_c_peli_2 p-riderlm)
(object_create_anew cine_c_f_brandon)
(sleep 120)
(vehicle_load_magic cine_c_peli_1 rider
(ai_actors cine_c_f_marines))
(ai_attach cine_c_f_brandon cine_human)
(ai_command_list_by_unit cine_c_f_brandon cine_c_f_brandon)
(sleep 5)
(camera_set cine_c_ff_1 0)
(camera_set cine_c_ff_2 200)
(sleep 170)
(unit_enter_vehicle cine_c_f_brandon cine_c_peli_2 p-riderrf)
(sleep 25)
(object_create_anew cine_c_peli_4)
(object_teleport cine_c_peli_4 mainflight_1)
(custom_animation cine_c_peli_4 tm\levels\tmc_b\anim\pelicans\cine_c_d pelican_bg_2 true)
(object_create_anew cine_c_hog1)
(unit_enter_vehicle cine_c_hog1 cine_c_peli_4 cargo)
(object_destroy cine_c_tank_2)
(sleep 5)
(camera_set cine_c_h_1 0)
(camera_set cine_c_h_2 250)
(sleep 50)
(sleep 125)
(sleep 125)
(ai_place cine_c_marines_armored_running)
(camera_set cine_c_i_1 0)
(unit_stop_custom_animation cine_c_peli_1)
(unit_stop_custom_animation cine_c_peli_2)
(sleep 60)
(camera_set cine_c_i_2 150)
(sleep 60)
(object_create_anew cine_c_hog1)
(object_teleport cine_c_hog1 cine_c_tankhog)
(object_create_anew cine_c_tankhog_marine)
(object_create_anew cine_c_tankhog_marine_2)
(sleep 2)
(unit_enter_vehicle cine_c_tankhog_marine cine_c_hog1 w-driver)
(unit_enter_vehicle cine_c_tankhog_marine_2 cine_c_hog1 w-passenger)
(sleep 5)
(recording_play cine_c_tankhog_marine cine_c_tankhog_marine)
(sleep 145)
(custom_animation cine_c_peli_1 tm\levels\tmc_b\anim\pelicans\cine_c_d mainflight_1_end true)
(sleep 35)
(custom_animation cine_c_peli_2 tm\levels\tmc_b\anim\pelicans\cine_c_d mainflight_2_end true)
(sleep 5)
(camera_set cine_c_g_1 0)
(object_destroy cine_c_peli_4)
(sleep 50)
(camera_set cine_c_g_2 200)
(sleep 100)
(camera_set cine_c_g_3 200)
(sound_looping_stop tm\sounds\music\bat1\bat1)
(sleep 100)
(fade_out 0.00 0.00 0.00 100)
(sleep 100)
(switch_bsp 0)))

(script static void initial_cutscene
(begin
(object_create_anew cine_a_elite2)
(object_create_anew cine_a_elite1)
(object_create_anew peli_middle)
(sleep 60)
(camera_set cine_a_elite_1 0)
(ai_attach cine_a_elite1 cine_covenant)
(ai_attach cine_a_elite2 cine_covenant)
(object_destroy peli_middle)
(unit_set_seat cine_a_elite1 alert)
(unit_set_seat cine_a_elite2 alert)
(ai_command_list_by_unit cine_a_elite1 cine_a_elite1)
(ai_command_list_by_unit cine_a_elite2 cine_a_elite2)
(fade_in 0.00 0.00 0.00 100)
(sound_looping_start sound\sinomatixx_music\b30_ledge_music none 1.00)
(camera_set cine_a_elite_2 225)
(sleep 125)
(camera_set cine_a_elite_3 225)
(sleep 125)
(camera_set cine_a_elite_4 225)
(sleep 125)
(camera_set cine_a_elite_5 225)
(sleep 181)
(camera_set cine_a_elite_6.1 0)
(camera_set cine_a_elite_6.2 200)
(sleep 25)
(ai_command_list_advance_by_unit cine_a_elite2)
(sleep 98)
(ai_command_list_advance_by_unit cine_a_elite2)
(camera_set cine_a_elite_8.1 0)
(sleep 0)
(camera_set cine_a_elite_8.2 200)
(sleep 100)
(ai_command_list_advance_by_unit cine_a_elite1)
(camera_set cine_a_elite_8.3 200)
(sleep 200)
(camera_set cine_a_elite_9.1 0)
(camera_set cine_a_elite_9.2 200)
(sleep 30)
(sound_impulse_start sound\dialog\elite\conditional\combat2\exclamations\berserk none 1.00)
(sleep 7)
(unit_set_seat cine_a_elite1 stand)
(unit_set_seat cine_a_elite2 stand)
(ai_command_list_advance_by_unit cine_a_elite1)
(ai_command_list_advance_by_unit cine_a_elite2)
(object_create_anew cine_a_elite3)
(sleep 40)
(object_destroy cine_a_elite2)
(object_destroy cine_a_elite1)
(recording_play cine_a_elite3 cine_a_wraith)
(camera_set cine_a_elite_13.1 0)
(camera_set cine_a_elite_13.2 200)
(sleep 107)
(unit_enter_vehicle cine_a_elite3 aa_wraith_obj1 wraith-driver)
(sleep 108)
(ai_attach cine_sniper cine_human)
(object_teleport cine_sniper cine_sniper_b)
(recording_play cine_sniper cine_a_b_sniper)
(sleep 5)
(camera_set cine_a_b_1 0)
(camera_set cine_a_b_1.2 270)
(sleep 10)
(sleep 165)
(object_create_anew peli_left)
(custom_animation peli_left tm\levels\tmc_b\anim\pelicans\beach_crash crash_part1 true)
(sleep 100)
(object_create_anew invisible)
(camera_set cine_a_b_1.3 100)
(sleep 50)
(sleep 40)
(camera_set cine_a_b_1.4 100)
(object_create_anew peli_crash)
(object_teleport peli_crash peli_crash)
(sleep 28)
(custom_animation peli_crash tm\levels\tmc_b\anim\pelicans\beach_crash crash_part2 true)
(effect_new effects\explosions\large explosion peli_crash_explosion)
(sleep 5)
(effect_new effects\explosions\large explosion peli_crash_explosion2)
(object_destroy peli_left)
(sleep 17)
(ai_erase enc_a_covenant)
(camera_set cine_a_b_1.5 100)
(object_destroy invisible)
(sleep 50)
(camera_set cine_a_b_1.6 200)
(fade_out 0.00 0.00 0.00 200)
(sleep 100)
(sleep 50)
(object_destroy peli_crash)
(sleep 100)
(object_destroy cine_a_elite2)
(object_destroy cine_a_elite1)
(object_destroy cine_a_elite3)))

(script startup void gamestart
(begin
(fade_out 0.00 0.00 0.00 0)
(object_teleport gamestart plyer_beach)
(camera_control true)
(cinematic_start)
(if gamestart
(begin gamestart gamestart)) gamestart
(wake beach_head)))

(script static void attach_bipeds_to_zero
(begin
(ai_detach brandon)
(ai_detach odst1)
(ai_detach odst2)
(ai_attach brandon enc_a_human_odst/b)
(ai_attach odst1 enc_a_human_odst/b)
(ai_attach odst2 enc_a_human_odst/b)
(ai_detach constr1)
(ai_detach constr2)
(ai_detach constr3)
(ai_attach constr1 sent_constructors_a/sent_con_a)
(ai_attach constr2 sent_constructors_a/sent_con_a)
(ai_attach constr3 sent_constructors_a/sent_con_a)))

(script static void attach_bipeds_to_one
(begin
(ai_detach brandon)
(ai_detach odst1)
(ai_detach odst2)
(ai_attach brandon enc_a_human_odst2/b)
(ai_attach odst1 enc_a_human_odst2/b)
(ai_attach odst2 enc_a_human_odst2/b)
(ai_detach constr1)
(ai_detach constr2)
(ai_detach constr3)
(ai_attach constr1 sent_constructors_b/sent_con_a)
(ai_attach constr2 sent_constructors_b/sent_con_a)
(ai_attach constr3 sent_constructors_b/sent_con_a)))

(script static void attach_bipeds_to_two
(begin
(ai_detach brandon)
(ai_detach odst1)
(ai_detach odst2)
(ai_detach b_odst1)
(ai_detach b_odst2)
(ai_detach hog_1_driver)
(ai_detach hog_r_driver)
(ai_detach hog_1_gunner)
(ai_detach hog_r_gunner)
(ai_attach brandon enc_c_human/a)
(ai_attach odst1 enc_c_human/a)
(ai_attach odst2 enc_c_human/a)
(ai_attach b_odst1 enc_c_human/a)
(ai_attach b_odst2 enc_c_human/a)
(ai_attach hog_1_driver enc_c_human/a)
(ai_attach hog_r_driver enc_c_human/a)
(ai_attach hog_1_gunner enc_c_human/a)
(ai_attach hog_r_gunner enc_c_human/a)))

(script continuous void bsp_switching_0_1
(begin
(sleep_until
(volume_test_objects beep_trig
(players)))
(switch_bsp 0)
(object_destroy cruiser_d)
(object_destroy tmc_b_human_rack) bsp_switching_0_1
(sleep_until
(volume_test_objects switcha_b
(players)))
(switch_bsp 1)
(object_destroy cruiser_d)
(object_destroy tmc_b_human_rack) bsp_switching_0_1))

(script continuous void bsp_switching_1_2
(begin
(sleep_until
(volume_test_objects switchc_b
(players)))
(switch_bsp 1)
(object_destroy cruiser_d)
(object_destroy tmc_b_human_rack)
(sleep_until
(volume_test_objects switchb_c
(players)))
(switch_bsp 2)
(object_destroy cruiser_d)
(object_destroy tmc_b_human_rack)))

(script continuous void bsp_switching_2_3
(begin
(sleep_until
(volume_test_objects switchd_c
(players)))
(switch_bsp 2)
(object_destroy eh_c)
(object_destroy cruiser_d)
(sleep_until
(volume_test_objects switchc_d
(players)))
(switch_bsp 3)
(object_destroy cruiser_d)))

(script static void player_effect_rumble
(begin
(player_effect_set_max_translation 0.01 0.00 0.02)
(player_effect_set_max_rotation 0.10 0.10 0.20)
(player_effect_set_max_rumble 0.50 0.30)
(player_effect_start
(real_random_range 0.70 0.90) 0.50)))

(script dormant void door_controller
(begin
(sleep 360)
(device_set_power enc_b_tunnel_door 0.00)))

(script dormant void load_shadow_gunner_bc
(begin
(sleep 10)
(sleep_until
(=
(ai_command_list_status
(ai_actors enc_bc_covenant/enc_bc_shadow)) 2))
(vehicle_load_magic enc_bc_shadow gunner
(ai_actors enc_bc_covenant/enc_bc_shadow))
(sleep 1)
(ai_command_list_advance enc_bc_covenant/enc_bc_shadow)))

(script dormant void enc_bc
(begin
(sleep_until
(volume_test_object enc_bc enc_bc))
(ai_place enc_bc_covenant)
(wake load_shadow_gunner_bc)
(vehicle_load_magic enc_bc_turret gunner
(ai_actors enc_bc_covenant/enc_bc_turret))
(sleep 900)))

(script dormant void marines_b_to_peli
(begin
(sleep 200)
(sleep 350)
(ai_go_to_vehicle enc_b_human/odst enc_b_extraction p-rider)
(ai_go_to_vehicle enc_b_human/hog_1_driver enc_b_extraction p-rider)
(ai_go_to_vehicle enc_b_human/hog_r_driver enc_b_extraction p-rider)
(ai_go_to_vehicle enc_b_human/hog_r_passenger enc_b_extraction p-rider)
(ai_go_to_vehicle enc_b_human/hog_1_passenger enc_b_extraction p-rider)
(ai_go_to_vehicle enc_b_human/hog_1_gunner enc_b_extraction p-rider)
(ai_go_to_vehicle enc_b_human/hog_r_gunner enc_b_extraction p-rider)
(if
(>
(ai_living_count enc_b_human) 5)
(begin
(sleep 120)
(ai_go_to_vehicle enc_b_human enc_b_extraction2 p-rider)))
(sleep_until
(and
(not
(unit_is_playing_custom_animation enc_b_extraction))
(not
(unit_is_playing_custom_animation enc_b_extraction2))))
(object_destroy_containing enc_b_extraction)))

(script dormant void odst2_manager
(begin
(sleep 60)
(sleep_until
(and
(<=
(ai_living_count enc_b_covenant/left_creep_infantry) 0)
(<=
(ai_living_count enc_b_covenant/left_creep_driver) 0)
(<=
(ai_living_count enc_b_covenant/left_creep_gunner) 0)
(<=
(ai_living_count enc_b_covenant/left_ghost_1) 0)
(<=
(ai_living_count enc_b_covenant/left_ghost_2) 0)))
(ai_maneuver enc_a_human_odst2/d)))

(script dormant void hog_manager
(begin
(object_create_anew hog_1_driver)
(ai_attach hog_1_driver enc_b_human/hog_1_driver)
(ai_command_list_by_unit hog_1_driver hog_1_driver)
(vehicle_load_magic hog_1 driver
(ai_actors enc_b_human/hog_1_driver))
(sleep 180)
(object_create_anew hog_r_driver)
(ai_attach hog_r_driver enc_b_human/hog_r_driver)
(ai_command_list_by_unit hog_r_driver hog_r_driver)
(vehicle_load_magic hog_r driver
(ai_actors enc_b_human/hog_r_driver))
(unit_impervious hog_r true)
(sleep 120)
(sleep_until
(<=
(ai_living_count enc_b_covenant/wraith_driver) 0))
(sleep 240)
(ai_command_list_advance enc_b_human/hog_r_driver)
(sleep 60)
(wake odst2_manager)
(ai_command_list_advance enc_b_human/hog_1_driver)
(sleep 60)
(vehicle_unload hog_2 )
(sleep 300)
(sleep_until
(<=
(ai_living_count enc_b_covenant) 0))
(sound_looping_stop tm\sounds\music\tide\tide)
(wake enc_bc)
(sleep 120)
(vehicle_unload hog_1 )
(vehicle_unload hog_2 )
(vehicle_unload hog_r )
(ai_command_list_advance enc_b_human)
(ai_maneuver enc_a_human_odst2/f)
(game_save)
(sleep 5)
(ai_conversation peli_b_end)
(ai_place enc_b_tanks)
(object_create_anew tank1)
(object_create_anew tank2)
(vehicle_load_magic tank1 driver
(ai_actors enc_b_tanks/tank_1))
(vehicle_load_magic tank2 driver
(ai_actors enc_b_tanks/tank_2))
(unit_impervious hog_1 false)
(unit_impervious hog_2 false)
(unit_impervious hog_r false)
(object_create_anew enc_b_extraction)
(object_teleport enc_b_extraction b_extraction1)
(object_create_anew enc_b_extraction2)
(object_teleport enc_b_extraction2 b_extraction2)
(unit_set_enterable_by_player enc_b_extraction false)
(unit_set_enterable_by_player enc_b_extraction2 false)
(ai_place pilots_bsp_a)
(vehicle_load_magic enc_b_extraction driver
(ai_actors pilots_bsp_a/1))
(vehicle_load_magic enc_b_extraction2 driver
(ai_actors pilots_bsp_a/2))
(vehicle_load_magic enc_b_extraction co-driver
(ai_actors pilots_bsp_a/1co))
(vehicle_load_magic enc_b_extraction2 co-driver
(ai_actors pilots_bsp_a/2co))
(custom_animation enc_b_extraction tm\levels\tmc_b\anim\canyonpelicans enforce_5 true)
(custom_animation enc_b_extraction2 tm\levels\tmc_b\anim\canyonpelicans enforce_6 true)
(wake marines_b_to_peli)
(sleep 200)
(ai_conversation peli_b_end2)
(device_set_power enc_b_tunnel_exit 1.00)
(device_set_position enc_b_tunnel_exit 1.00)
(sleep 420)
(device_set_power enc_b_tunnel_exit 0.00)
(object_destroy enc_b_tunnel_exit)))

(script static void set_impervious_vehicles
(begin
(unit_impervious enc_b_left_creep true)
(unit_impervious enc_b_shadow true)
(unit_impervious enc_b_wraith true)
(unit_impervious enc_b_ghost_left true)
(unit_impervious enc_b_ghost_right true)
(unit_impervious enc_b_ghost_left_2 true)
(unit_impervious enc_b_ghost_right_2 true)
(unit_impervious hog_1 true)
(unit_impervious hog_2 true)
(unit_impervious hog_r true)))

(script dormant void enc_b_convoy_attack
(begin
(object_destroy wraith_bomb_1)
(object_destroy wraith_bomb_2)
(object_destroy wraith_bomb_3)
(sleep 300)
(object_create_anew enc_b_creep)
(object_create_anew enc_b_shadow)
(object_create_anew enc_b_wraith)
(object_create_anew enc_b_ghost_left)
(object_create_anew enc_b_ghost_right)
(object_create_anew enc_b_ghost_left_2)
(object_create_anew enc_b_ghost_right_2)
(unit_set_enterable_by_player enc_b_creep false)
(sound_looping_set_alternate sound\music\battle1\brothers_in_arms true)
(object_can_take_damage enc_b_rocket_odst)
(ai_place enc_b_covenant/creep_infantry)
(ai_place enc_b_covenant/creep_driver)
(ai_place enc_b_covenant/creep_gunner)
(ai_place enc_b_covenant/shadow_driver)
(ai_place enc_b_covenant/shadow_gunner)
(ai_place enc_b_covenant/wraith_driver)
(ai_place enc_b_covenant/ghost_left_driver)
(ai_place enc_b_covenant/ghost_right_driver)
(ai_place enc_b_covenant/ghost_left_driver_2)
(ai_place enc_b_covenant/ghost_right_driver_2)
(vehicle_load_magic enc_b_creep passenger
(ai_actors enc_b_covenant/creep_infantry))
(vehicle_load_magic enc_b_creep driver
(ai_actors enc_b_covenant/creep_driver))
(vehicle_load_magic enc_b_creep gunner
(ai_actors enc_b_covenant/creep_gunner))
(vehicle_load_magic enc_b_shadow driver
(ai_actors enc_b_covenant/shadow_driver))
(vehicle_load_magic enc_b_shadow gunner
(ai_actors enc_b_covenant/shadow_gunner))
(vehicle_load_magic enc_b_wraith driver
(ai_actors enc_b_covenant/wraith_driver))
(vehicle_load_magic enc_b_ghost_left driver
(ai_actors enc_b_covenant/ghost_left_driver))
(vehicle_load_magic enc_b_ghost_right driver
(ai_actors enc_b_covenant/ghost_right_driver))
(vehicle_load_magic enc_b_ghost_left_2 driver
(ai_actors enc_b_covenant/ghost_left_driver_2))
(vehicle_load_magic enc_b_ghost_right_2 driver
(ai_actors enc_b_covenant/ghost_right_driver_2))
(device_set_power enc_b_tunnel_door 1.00)
(device_set_position enc_b_tunnel_door 1.00)
(ai_place enc_b_human/hog_1_passenger)
(ai_place enc_b_human/hog_r_passenger)
(object_create_anew hog_1_gunner)
(ai_attach hog_1_gunner enc_b_human/hog_1_gunner)
(object_create_anew hog_r_gunner)
(ai_attach hog_r_gunner enc_b_human/hog_r_gunner)
(vehicle_load_magic hog_1 passenger
(ai_actors enc_b_human/hog_1_passenger))
(vehicle_load_magic hog_r passenger
(ai_actors enc_b_human/hog_r_passenger))
(vehicle_load_magic hog_1 gunner
(ai_actors enc_b_human/hog_1_gunner))
(vehicle_load_magic hog_r gunner
(ai_actors enc_b_human/hog_r_gunner))
(wake hog_manager)
(wake door_controller)
(sound_looping_start sound\sfx\impulse\doors\b40_garage none 1.00)
(ai_command_list_advance enc_b_human/odst)
(sleep 300)
(sound_looping_stop sound\sfx\impulse\doors\b40_garage)
(sleep 180)
(ai_magically_see_encounter enc_b_human enc_b_covenant/wraith_driver)
(sleep 420)
(vehicle_unload enc_b_creep passenger)
(sleep 180)
(ai_command_list_advance enc_b_covenant/wraith_driver)
(ai_command_list_advance enc_b_covenant/shadow_driver)
(ai_command_list_advance enc_b_covenant/ghost_left_driver)
(ai_command_list_advance enc_b_covenant/ghost_right_driver)
(ai_command_list_advance enc_b_human/odst)))

(script dormant void doorcontroller2
(begin
(sleep_until
(volume_test_object door2 doorcontroller2))
(device_set_position door2 1.00)
(sleep 60)
(device_set_power door2 0.00)
(sleep 1200)
(device_set_power door1 1.00)
(device_set_power door2 1.00)))

(script dormant void doorcontroller
(begin
(device_set_position door1 1.00)
(wake doorcontroller2)
(sleep 60)
(device_set_power door1 0.00)))

(script dormant void destroy_longsword
(begin
(device_set_power enc_b_tunnel_door 1.00)
(device_set_position enc_b_tunnel_door 0.00)
(sleep 300)
(object_destroy longsword)
(device_set_power enc_b_tunnel_door 0.00)))

(script dormant void drop_bomb
(begin
(sleep 154)
(object_create_anew longsword_bomb)
(scenery_animation_start longsword_bomb tm\levels\tmc_b\anim\bomb\bomb bomb)))

(script static void longsword_bombing
(begin
(sleep 70)
(ai_conversation marine_as)
(ai_command_list_advance_by_unit enc_b_rocket_odst)
(object_create_anew wraith_bomb_1)
(object_create_anew wraith_bomb_2)
(object_create_anew wraith_bomb_3)
(object_create_anew longsword)
(ai_place enc_b_covenant/wraith_bomb_1)
(ai_place enc_b_covenant/wraith_bomb_2)
(ai_place enc_b_covenant/wraith_bomb_3)
(vehicle_load_magic wraith_bomb_1 driver
(ai_actors enc_b_covenant/wraith_bomb_1))
(vehicle_load_magic wraith_bomb_2 driver
(ai_actors enc_b_covenant/wraith_bomb_2))
(vehicle_load_magic wraith_bomb_3 driver
(ai_actors enc_b_covenant/wraith_bomb_3))
(sleep 20)
(sleep 580)
(device_set_position enc_b_tunnel_door 1.00)
(sound_looping_start sound\sfx\impulse\doors\b40_garage none 1.00)
(sleep 300)
(sound_looping_stop sound\sfx\impulse\doors\b40_garage)
(sleep 60)
(device_set_power enc_b_tunnel_door 0.00)
(ai_command_list_advance enc_b_covenant/wraith_bomb_1)
(ai_command_list_advance enc_b_covenant/wraith_bomb_2)
(ai_command_list_advance enc_b_covenant/wraith_bomb_3)
(sleep 350)
(sound_impulse_start tm\levels\test\anim\longsword\sounds\in none 1.00)
(sleep 50)
(sound_looping_stop tm\sounds\music\glue\nolow1\nolow1)
(ai_conversation enc_b_foxtrot)
(scenery_animation_start longsword tm\levels\tmc_b\anim\bomb_drop bomb_drop)
(wake drop_bomb)
(sleep 100)
(sleep 60)
(sleep 30)
(sleep 50)
(effect_new vehicles\scorpion\shell explosion longsword_bomb)
(effect_new vehicles\scorpion\shell explosion longsword_bomb1)
(effect_new vehicles\scorpion\shell explosion longsword_bomb2)
(effect_new vehicles\scorpion\shell explosion longsword_bomb3)
(effect_new vehicles\scorpion\shell explosion longsword_bomb4)
(effect_new vehicles\scorpion\shell explosion longsword_bomb5)
(effect_new vehicles\scorpion\shell explosion longsword_bomb6)
(effect_new vehicles\scorpion\shell explosion longsword_bomb7)
(effect_new vehicles\scorpion\shell explosion longsword_bomb8)
(effect_new vehicles\scorpion\shell explosion longsword_bomb9)
(effect_new vehicles\scorpion\shell explosion longsword_bomb10)
(effect_new vehicles\scorpion\shell explosion longsword_bomb11)
(sound_impulse_start sound\sfx\impulse\impacts\large_explosion none 1.00)
(object_set_permutation wraith_bomb_1  ~damaged)
(object_set_permutation wraith_bomb_2  ~damaged)
(object_set_permutation wraith_bomb_3  ~damaged)
(ai_kill enc_b_covenant/wraith_bomb_1)
(ai_kill enc_b_covenant/wraith_bomb_2)
(ai_kill enc_b_covenant/wraith_bomb_3)
(sound_impulse_start sound\sfx\ambience\a10\pillarhits none
(real_random_range 0.40 0.70)) longsword_bombing
(player_effect_start
(real_random_range 0.85 1.05) 1.00)
(sleep 30)
(player_effect_stop
(real_random_range 1.50 2.50))
(game_speed 1.00)
(wake destroy_longsword)
(sound_looping_start tm\sounds\music\tide\tide none 1.00)
(sleep 30)
(ai_conversation enc_b_brnd)
(sleep 10)
(game_save)))

(script dormant void maneuverodstzz
(begin
(sleep 90)
(ai_maneuver enc_a_human_odst2/b)))

(script startup void enc_b
(begin
(sleep_until
(volume_test_object maneuver_odst_a enc_b))
(ai_erase a_creatures)
(wake maneuverodstzz)
(sleep_until
(volume_test_object spawn_enc_b enc_b))
(game_save_totally_unsafe)
(sound_looping_stop tm\sounds\sfx\gongs)
(wake doorcontroller)
(ai_place b_creatures)
(object_create_anew b_odst1)
(object_create_anew b_odst2)
(ai_attach b_odst1 enc_b_human/odst)
(ai_attach b_odst2 enc_b_human/odst)
(ai_command_list_by_unit b_odst1 crouch_wait)
(ai_command_list_by_unit b_odst2 crouch_wait)
(object_create_anew enc_b_rocket_odst)
(object_cannot_take_damage enc_b_rocket_odst)
(sleep_until
(volume_test_object start_ambush enc_b))
(ai_attach enc_b_rocket_odst enc_b_human/odst)
(ai_command_list_by_unit enc_b_rocket_odst enc_b_odst_rocket) enc_b
(ai_set_blind enc_b_human/odst false)
(object_create_anew enc_b_left_creep)
(object_create_anew enc_b_left_ghost_1)
(object_create_anew enc_b_left_ghost_2)
(unit_set_enterable_by_player enc_b_left_creep false)
(ai_place enc_b_covenant/left_ghost_1)
(ai_place enc_b_covenant/left_ghost_2)
(ai_place enc_b_covenant/left_creep_driver)
(ai_place enc_b_covenant/left_creep_infantry)
(ai_place enc_b_covenant/left_creep_gunner)
(vehicle_load_magic enc_b_left_creep passenger
(ai_actors enc_b_covenant/left_creep_infantry))
(vehicle_load_magic enc_b_left_creep driver
(ai_actors enc_b_covenant/left_creep_driver))
(vehicle_load_magic enc_b_left_creep gunner
(ai_actors enc_b_covenant/left_creep_gunner))
(vehicle_load_magic enc_b_left_ghost_1 driver
(ai_actors enc_b_covenant/left_ghost_1))
(vehicle_load_magic enc_b_left_ghost_2 driver
(ai_actors enc_b_covenant/left_ghost_2))
(ai_magically_see_encounter enc_a_human_odst2 enc_b_covenant)
(sleep 120)
(ai_command_list_advance enc_b_covenant/left_creep_driver)
(ai_command_list_advance enc_b_covenant/left_ghost_1)
(ai_command_list_advance enc_b_covenant/left_ghost_2)
(sleep 240)
(vehicle_unload enc_b_left_ghost_1 driver)
(vehicle_unload enc_b_left_ghost_2 driver)
(ai_maneuver enc_a_human_odst2/c)
(ai_conversation enc_b_b_brnd)
(sleep 120)
(vehicle_unload enc_b_left_creep passenger)
(wake enc_b_convoy_attack)))

(script static void check_player_c_ghost
(begin
(if
(vehicle_test_seat_list enc_c_ghost g-driver check_player_c_ghost)
(begin
(player_enable_input false)
(player_action_test_reset)
(sleep_until
(player_action_test_action))
(player_enable_input true)
(vehicle_unload enc_c_ghost )
(unit_set_enterable_by_player enc_c_ghost false)
(sleep 60)
(player_action_test_reset)))
(if
(vehicle_test_seat_list cdrop_1_ghost g-driver check_player_c_ghost)
(begin
(player_enable_input false)
(player_action_test_reset)
(sleep_until
(player_action_test_action))
(player_enable_input true)
(vehicle_unload cdrop_1_ghost )
(unit_set_enterable_by_player cdrop_1_ghost false)
(sleep 60)
(player_action_test_reset)))
(if
(vehicle_test_seat_list enc_bc_shadow g-driver check_player_c_ghost)
(begin
(player_enable_input false)
(player_action_test_reset)
(sleep_until
(player_action_test_action))
(player_enable_input true)
(vehicle_unload enc_bc_shadow )
(unit_set_enterable_by_player enc_bc_shadow false)
(sleep 60)
(player_action_test_reset)))
(if
(vehicle_test_seat_list enc_b_shadow g-driver check_player_c_ghost)
(begin
(player_enable_input false)
(player_action_test_reset)
(sleep_until
(player_action_test_action))
(player_enable_input true)
(vehicle_unload enc_b_shadow )
(unit_set_enterable_by_player enc_bc_shadow false)
(sleep 60)
(player_action_test_reset)))
(if
(vehicle_test_seat_list enc_bc_ghost1 g-driver check_player_c_ghost)
(begin
(player_enable_input false)
(player_action_test_reset)
(sleep_until
(player_action_test_action))
(player_enable_input true)
(vehicle_unload enc_bc_ghost1 )
(unit_set_enterable_by_player enc_bc_ghost1 false)
(sleep 60)
(player_action_test_reset)))
(if
(vehicle_test_seat_list enc_bc_ghost2 g-driver check_player_c_ghost)
(begin
(player_enable_input false)
(player_action_test_reset)
(sleep_until
(player_action_test_action))
(player_enable_input true)
(vehicle_unload enc_bc_ghost2 )
(unit_set_enterable_by_player enc_bc_ghost2 false)
(sleep 60)
(player_action_test_reset)))))

(script continuous void regulate_em
(begin
(if
(= c_ended false)
(if
(or
(volume_test_object em_field regulate_em)
(volume_test_object em_field4 regulate_em)
(volume_test_object em_field3 regulate_em)) regulate_em))))

(script dormant void blind_banshee
(begin
(sleep 180)
(sleep 300)
(vehicle_load_magic enc_c_banshee b-driver
(ai_actors enc_c_covenant_banshee/banshee_pilot))
(sleep_until
(vehicle_test_seat_list enc_c_banshee b-driver
(ai_actors enc_c_covenant_banshee/banshee_pilot)))
(ai_set_blind enc_c_covenant_banshee/banshee_pilot true)
(sleep 240)
(ai_set_blind enc_c_covenant_banshee/banshee_pilot false)))

(script startup void pulse_trig
(begin
(sleep_until
(volume_test_object pulse_trig pulse_trig))
(sound_looping_start sound\halo2\music\pulse_drums\pulse_drums none 1.00)
(object_create eh_c)
(scenery_animation_start_at_frame eh_c tm\levels\tmc_b\anim\frigate\frigate frigate 240)
(activate_nav_point_flag default pulse_trig enc_c_panels 0.00)
(sleep 30)
(game_save)
(sleep_until
(=
(device_get_position unlock_basement) 1.00))
(deactivate_nav_point_flag pulse_trig enc_c_panels)
(sleep_until
(volume_test_object pulse_stop pulse_trig))
(sound_looping_stop sound\halo2\music\pulse_drums\pulse_drums)))

(script dormant void enc_c_hog_manager
(begin
(sleep 240)
(vehicle_unload enc_c_warthog driver)
(vehicle_unload enc_c_warthog passenger)
(vehicle_unload enc_c_rhog driver)
(vehicle_unload enc_c_rhog passenger)
(ai_command_list_advance enc_c_human2/warthog_driver)
(sleep_until
(<=
(ai_living_count enc_c_covenant/left1) 0))
(vehicle_unload enc_c_warthog gunner)
(vehicle_unload enc_c_rhog gunner)
(ai_maneuver enc_c_human2/warthog_driver)
(ai_maneuver enc_c_human2/warthog_passenger)
(ai_maneuver enc_c_human2/warthog_gunner)
(sleep_until
(<=
(ai_living_count enc_c_covenant/left4) 1))
(ai_maneuver enc_c_human2/warthog_advance_c)
(ai_command_list_advance enc_c_covenant/behind_spire)
(sleep 240)
(sleep_until
(and
(<=
(ai_living_count enc_c_human2/warthog_driver) 0)
(<=
(ai_living_count enc_c_human2/warthog_passenger) 0)
(<=
(ai_living_count enc_c_human2/warthog_gunner) 0)))
(ai_maneuver enc_c_covenant/behind_spire)))

(script dormant void enc_c_infantry_manager
(begin
(sleep_until
(<=
(ai_living_count enc_c_covenant/right1) 0))
(ai_maneuver enc_c_human2/infantry_right)
(sleep 360)
(ai_maneuver enc_c_human2/infantry_right_z)
(sleep_until
(and wave2_passed
(<=
(ai_living_count enc_c_covenant/right2) 1)))
(ai_maneuver enc_c_human2/infantry_right_y)))

(script dormant void enc_c_sniper_manager
(begin
(sleep_until
(=
(ai_living_count enc_c_covenant/right1) 0))
(ai_maneuver enc_c_sniper/infantry_right)
(sleep 360)
(ai_maneuver enc_c_sniper/infantry_right_z)
(sleep_until
(and wave2_passed
(<=
(ai_living_count enc_c_covenant/right2) 1)))
(ai_maneuver enc_c_sniper/infantry_right_y)
(sleep_until
(<=
(ai_living_count enc_c_covenant/right3) 0))
(ai_maneuver enc_c_sniper/infantry_right_x)))

(script dormant void game_lost_script
(begin
(sleep_until
(<=
(unit_get_health brandon) 0.00) 1)
(game_save_cancel)
(sound_looping_start levels\a50\music\a50_10 none 1.00)
(cinematic_show_letterbox true)
(player_enable_input false)
(camera_control true)
(camera_set_dead brandon)
(sleep 120)
(game_lost)))

(script dormant void end_enc_c
(begin
(unit_set_enterable_by_player hog_1 true)
(unit_set_enterable_by_player hog_r true)
(unit_set_enterable_by_player r_hog_c true)
(unit_set_enterable_by_player hog_c true)
(unit_set_enterable_by_player enc_c_warthog true)
(unit_set_enterable_by_player enc_c_rhog true)
(unit_set_enterable_by_player enc_b_left_creep true)
(unit_set_enterable_by_player enc_b_left_ghost_2 true)
(unit_set_enterable_by_player enc_b_left_ghost_1 true)
(unit_set_enterable_by_player enc_b_shadow true)
(unit_set_enterable_by_player enc_b_creep true)
(unit_set_enterable_by_player enc_b_ghost_left true)
(unit_set_enterable_by_player enc_b_ghost_right true)
(unit_set_enterable_by_player enc_b_ghost_left_2 true)
(unit_set_enterable_by_player enc_b_ghost_right_2 true)
(unit_set_enterable_by_player cdrop_1_ghost true)
(unit_set_enterable_by_player enc_c_ghost true)
(unit_set_enterable_by_player enc_bc_shadow true)
(unit_set_enterable_by_player enc_bc_ghost1 true)
(unit_set_enterable_by_player enc_bc_ghost2 true)
(set c_ended true)
(device_set_power enc_c_tunnel_exit 1.00)
(device_set_position enc_c_tunnel_exit 1.00)
(ai_maneuver enc_c_human2/structure_k)
(ai_migrate enc_c_sniper enc_c_human2/structure_k)
(ai_renew enc_c_human2)
(ai_renew enc_c_human)
(ai_renew enc_c_sniper)
(sleep 310)
(sleep_until
(and
(<=
(unit_get_health enc_c_hunter1) 0.00)
(<=
(unit_get_health enc_c_hunter2) 0.00)))
(sleep 60)
(ai_conversation enc_c_brnd_4)
(sleep 110)
(device_set_power enc_c_tunnel_exit 0.00)))

(script dormant void c_drop_hunters
(begin
(ai_command_list_advance_by_unit brandon)
(object_cannot_take_damage brandon)
(sleep 300)
(object_create_anew enc_c_hunter1)
(object_create_anew enc_c_hunter2)
(object_create_anew c_drop4)
(object_teleport c_drop4 c_drop4)
(objects_attach c_drop4 cargo_ghost01 enc_c_hunter1 )
(objects_attach c_drop4 cargo_ghost02 enc_c_hunter2 )
(ai_attach enc_c_hunter1 enc_c_covenant_dropships/drop4)
(ai_attach enc_c_hunter2 enc_c_covenant_dropships/drop4)
(sleep 10)
(ai_braindead enc_c_covenant_dropships/drop4 true)
(ai_magically_see_players enc_c_covenant_dropships/drop4)
(ai_magically_see_encounter enc_c_covenant_dropships/drop4 enc_c_human)
(ai_magically_see_encounter enc_c_covenant_dropships/drop4 enc_c_human2)
(custom_animation c_drop4 tm\levels\tmc_b\anim\cdrops drop_3 true)
(sleep 220)
(ai_command_list_advance_by_unit brandon)
(sleep 230)
(objects_detach c_drop4 enc_c_hunter1)
(sleep 5)
(objects_detach c_drop4 enc_c_hunter2)
(sleep 5)
(game_save)
(ai_braindead enc_c_covenant_dropships/drop4 false)
(ai_braindead enc_c_covenant_dropships false)
(sleep 10)
(ai_braindead enc_c_covenant_dropships false)
(sleep 110)
(unit_custom_animation_at_frame c_drop4 tm\levels\tmc_b\anim\cdrops drop_3 true 1500)
(sleep_until
(and
(<=
(unit_get_health enc_c_hunter1) 0.00)
(<=
(unit_get_health enc_c_hunter2) 0.00)))
(sleep 30)
(sound_looping_stop levels\a50\music\a50_10)
(sound_looping_stop levels\c40\music\c40_051)
(wake end_enc_c)))

(script dormant void c_drop2
(begin
(object_create_anew c_drop2)
(object_teleport c_drop2 c_drop3)
(ai_place enc_c_covenant_dropships/drop2_left)
(ai_place enc_c_covenant_dropships/drop2_right)
(vehicle_load_magic c_drop2 passengerr
(ai_actors enc_c_covenant_dropships/drop2_left))
(vehicle_load_magic c_drop2 passengerl
(ai_actors enc_c_covenant_dropships/drop2_right))
(ai_magically_see_players enc_c_covenant_dropships/drop2_left)
(ai_magically_see_encounter enc_c_covenant_dropships/drop2_left enc_c_human)
(ai_magically_see_encounter enc_c_covenant_dropships/drop2_left enc_c_human2)
(ai_magically_see_players enc_c_covenant_dropships/drop2_right)
(ai_magically_see_encounter enc_c_covenant_dropships/drop2_right enc_c_human)
(ai_magically_see_encounter enc_c_covenant_dropships/drop2_right enc_c_human2)
(custom_animation c_drop2 tm\levels\tmc_b\anim\cdrops drop_2 true)
(sleep 300)
(vehicle_unload c_drop2 cd-passengerr)
(sleep 5)
(sleep 450)
(vehicle_unload c_drop2 cd-passengerl)
(sleep 5)
(wake c_drop_hunters)))

(script dormant void c_drop3
(begin
(object_create_anew c_drop3)
(object_teleport c_drop3 c_drop3)
(ai_place enc_c_covenant_dropships/drop3)
(vehicle_load_magic c_drop3 passenger
(ai_actors enc_c_covenant_dropships/drop3))
(sleep 10)
(ai_magically_see_players enc_c_covenant_dropships/drop3)
(ai_magically_see_encounter enc_c_covenant_dropships/drop3 enc_c_human)
(ai_magically_see_encounter enc_c_covenant_dropships/drop3 enc_c_human2)
(custom_animation c_drop3 tm\levels\tmc_b\anim\cdrops drop_3 true)
(sleep 450)
(vehicle_unload c_drop3 cd-passengerr)
(sleep 5)
(vehicle_unload c_drop3 cd-passengerl)
(sleep 5)
(sleep 300)
(unit_custom_animation_at_frame c_drop3 tm\levels\tmc_b\anim\cdrops drop_3 true 1500)
(sleep_until
(<=
(ai_living_count enc_c_covenant_dropships/drop3) 4))
(wake c_drop2)))

(script dormant void enc_c_dropships
(begin
(ai_vehicle_enterable_team enc_c_turret covenant)
(sound_looping_start levels\c40\music\c40_051 none 1.00)
(object_create_anew c_drop1)
(object_teleport c_drop1 c_drop1)
(object_create_anew cdrop_1_ghost)
(ai_place enc_c_covenant_dropships/drop_1_ghost)
(vehicle_load_magic cdrop_1_ghost driver
(ai_actors enc_c_covenant_dropships/drop_1_ghost))
(vehicle_load_magic c_drop1 cargo_ghost01 cdrop_1_ghost)
(ai_place enc_c_covenant_dropships/drop1)
(vehicle_load_magic c_drop1 passenger
(ai_actors enc_c_covenant_dropships/drop1))
(ai_magically_see_players enc_c_covenant_dropships/drop1)
(ai_magically_see_encounter enc_c_covenant_dropships/drop1 enc_c_human)
(ai_magically_see_encounter enc_c_covenant_dropships/drop1 enc_c_human2)
(ai_magically_see_players enc_c_covenant_dropships/drop_1_ghost)
(ai_magically_see_encounter enc_c_covenant_dropships/drop_1_ghost enc_c_human)
(custom_animation c_drop1 tm\levels\tmc_b\anim\cdrops drop_1 true)
(sleep 280)
(vehicle_unload c_drop1 cargo_ghost01)
(sleep 60)
(begin_random
(begin
(vehicle_unload c_drop1 cd-passengerl)
(sleep 5))
(begin
(vehicle_unload c_drop1 cd-passengerr)
(sleep 5)))
(sleep 350)
(unit_custom_animation_at_frame c_drop1 tm\levels\tmc_b\anim\cdrops drop_1 true 1600)
(sleep_until
(<=
(ai_living_count enc_c_covenant_dropships/drop1) 3))
(ai_conversation marine_c3)
(sleep 10)
(game_save_no_timeout)
(wake c_drop3)))

(script dormant void fall_back_c
(begin
(sleep_until
(<=
(ai_strength enc_c_human2/warthog_advance_d) 0.40))
(ai_maneuver enc_c_human2/warthog_advance_d)
(set retreat1 true)))

(script dormant void fall_back_c2
(begin
(sleep_until
(<=
(ai_strength enc_c_human2/infantry_right_x) 0.40))
(ai_maneuver enc_c_human2/infantry_right_x)
(set retreat2 true)))

(script dormant void cov_regroup_c
(begin
(sleep_until
(and retreat1 retreat2))
(sleep 10)
(sleep_until
(<=
(ai_living_count enc_c_covenant_dropships/drop1) 3))
(ai_maneuver enc_c_covenant_dropships)))

(script dormant void brandon_terminal_c
(begin
(ai_conversation enc_c_brnd_2)
(ai_conversation peli_c_bt1)
(sleep 450)
(ai_conversation enc_c_brnd_3)
(sleep 220)
(wake enc_c_dropships)
(wake fall_back_c)
(wake fall_back_c2)
(wake cov_regroup_c)))

(script dormant void load_c_hog
(begin
(object_create_anew enc_c_warthog)
(unit_set_enterable_by_player enc_c_warthog false)
(vehicle_load_magic enc_c_warthog driver
(ai_actors enc_c_human2/warthog_driver))
(ai_place enc_c_human2/warthog_passenger)
(vehicle_load_magic enc_c_warthog passenger
(ai_actors enc_c_human2/warthog_passenger))
(ai_place enc_c_human2/warthog_gunner)
(vehicle_load_magic enc_c_warthog gunner
(ai_actors enc_c_human2/warthog_gunner))))

(script dormant void load_c_rhog
(begin
(object_create_anew enc_c_rhog)
(unit_set_enterable_by_player enc_c_rhog false)
(vehicle_load_magic enc_c_rhog driver
(ai_actors enc_c_human2/warthog_driver))
(ai_place enc_c_human2/warthog_passenger)
(vehicle_load_magic enc_c_rhog passenger
(ai_actors enc_c_human2/warthog_passenger))
(ai_place enc_c_human2/warthog_gunner)
(vehicle_load_magic enc_c_rhog gunner
(ai_actors enc_c_human2/warthog_gunner))))

(script dormant void delete_enforce7
(begin
(sleep 10)
(sleep_until
(<=
(unit_get_custom_animation_time enforce_7) 0))
(object_destroy enforce_7)))

(script dormant void obj3
(begin
(hud_set_objective_text obj3)
(show_hud_help_text true)
(hud_set_help_text obj3)
(sleep 300)
(show_hud_help_text false)))

(script dormant void enc_c_covenant
(begin
(sleep_until
(=
(device_get_position enc_c_opendoor) 1.00))
(object_create_anew enforce_7)
(object_teleport enforce_7 c_drop1)
(ai_place pilots_bsp_a/1)
(ai_place pilots_bsp_a/1co)
(vehicle_load_magic enforce_7 driver
(ai_actors pilots_bsp_a/1))
(vehicle_load_magic enforce_7 co-driver
(ai_actors pilots_bsp_a/1co))
(unit_custom_animation_at_frame enforce_7 tm\levels\tmc_b\anim\towerpelican tower_7_dropoff true 1400)
(wake delete_enforce7)
(sound_looping_start tm\sounds\music\winds\windsnoloop none 1.00)
(ai_place enc_c_covenant/turret_elite)
(vehicle_load_magic enc_c_turret gunner
(ai_actors enc_c_covenant/turret_elite))
(ai_place enc_c_covenant/behind_spire)
(ai_place enc_c_covenant/left2)
(ai_place enc_c_covenant/left4)
(ai_place enc_c_covenant/left1)
(ai_place enc_c_covenant/right1)
(ai_place enc_c_covenant/spire)
(ai_place enc_c_human2/infantry_right)
(ai_place enc_c_sniper/infantry_right)
(ai_place enc_c_human2/warthog_driver)
(wake load_c_hog)
(unit_set_enterable_by_player enc_c_warthog false)
(unit_set_enterable_by_player enc_c_rhog false)
(ai_magically_see_encounter enc_c_human2 enc_c_covenant)
(ai_magically_see_encounter enc_c_covenant enc_c_human2)
(ai_magically_see_encounter enc_c_sniper enc_c_covenant)
(ai_magically_see_encounter enc_c_covenant enc_c_sniper)
(wake enc_c_hog_manager)
(wake enc_c_infantry_manager)
(wake enc_c_sniper_manager)
(sleep_until
(volume_test_object marine_wtp enc_c_covenant))
(ai_conversation marine_wtp)
(wake obj3)
(sleep_until
(volume_test_object spawn_banshee enc_c_covenant))
(ai_command_list_advance enc_c_covenant/left3)
(ai_place enc_c_covenant_banshee/banshee_pilot)
(ai_place enc_c_covenant/left_ghost)
(wake blind_banshee)
(sleep_until
(volume_test_object spawn_wave2 enc_c_covenant))
(set wave2_passed true)
(ai_place enc_c_covenant/turret_elite2)
(ai_command_list_advance enc_c_covenant/spire)
(ai_place enc_c_covenant/right2)
(ai_place enc_c_covenant/right3)
(sleep_until
(=
(device_get_position unlock_basement) 1.00))
(object_destroy basement1)
(object_destroy basement2)
(ai_place enc_c_covenant/stealth)
(ai_conversation marine_c4)
(sleep_until
(=
(ai_living_count enc_c_covenant/stealth) 0))
(game_save)
(sleep 10)
(ai_command_list_by_unit brandon brandon_terminal_c)
(sleep 100)
(wake brandon_terminal_c)))

(script continuous void kill_off_c
(begin
(if
(volume_test_object kill_volume_c
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 0)))
(unit_kill
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 0))))
(if
(volume_test_object kill_volume_c
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 1)))
(unit_kill
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 1))))
(if
(volume_test_object kill_volume_c
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 2)))
(unit_kill
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 2))))
(if
(volume_test_object kill_volume_c
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 3)))
(unit_kill
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 3))))
(if
(volume_test_object kill_volume_c
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 4)))
(unit_kill
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 4))))
(if
(volume_test_object kill_volume_c
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 5)))
(unit_kill
(unit
(list_get
(ai_actors enc_c_covenant/stealth) 5))))))

(script dormant void brandon_rockethog
(begin
(sleep 10)
(object_create_anew r_hog_c)
(vehicle_load_magic r_hog_c driver brandon)
(ai_command_list_by_unit brandon hog_c)
(sleep 240)
(vehicle_unload r_hog_c )
(unit_set_enterable_by_player r_hog_c false)
(set enc_c_normalhog true)))

(script dormant void brandon_hog
(begin
(sleep 10)
(object_create_anew hog_c)
(vehicle_load_magic hog_c driver brandon)
(ai_command_list_by_unit brandon hog_c)
(sleep 240)
(vehicle_unload hog_c )
(unit_set_enterable_by_player hog_c false)
(set enc_c_normalhog true)))

(script dormant void getbrandonhere
(begin
(if
(=
(volume_test_object em_field2 brandon) false)
(begin
(if
(vehicle_test_seat_list hog_1 w-driver getbrandonhere)
(wake brandon_rockethog)
(wake brandon_hog))))))

(script static bool player_in_vehicle
(begin
(or
(vehicle_test_seat_list hog_1 w-driver player_in_vehicle)
(vehicle_test_seat_list hog_r w-driver player_in_vehicle)
(vehicle_test_seat_list r_hog_c w-driver player_in_vehicle)
(vehicle_test_seat_list hog_c w-driver player_in_vehicle)
(vehicle_test_seat_list enc_d_hog w-driver player_in_vehicle)
(vehicle_test_seat_list enc_d_rhog w-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_left_creep g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_left_ghost_2 g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_left_ghost_1 g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_shadow g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_creep g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_ghost_left g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_ghost_right g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_ghost_left_2 g-driver player_in_vehicle)
(vehicle_test_seat_list enc_b_ghost_right_2 g-driver player_in_vehicle)
(vehicle_test_seat_list enc_bc_shadow g-driver player_in_vehicle)
(vehicle_test_seat_list enc_bc_ghost1 g-driver player_in_vehicle)
(vehicle_test_seat_list enc_bc_ghost2 g-driver player_in_vehicle))))

(script startup void enc_c
(begin
(sleep_until
(volume_test_object em_field enc_c))
(game_save_totally_unsafe)
(ai_erase a_creatures)
(ai_place c_creatures)
(wake enc_c_covenant)
(if enc_c
(begin
(player_enable_input false)
(player_action_test_reset)
(sleep_until
(player_action_test_action))
(player_enable_input true)))
(ai_conversation enc_c_brnd)
(vehicle_unload hog_1 )
(vehicle_unload hog_r )
(vehicle_unload r_hog_c )
(vehicle_unload hog_c )
(vehicle_unload enc_d_hog )
(vehicle_unload enc_d_rhog )
(vehicle_unload enc_b_left_creep )
(vehicle_unload enc_b_left_ghost_2 )
(vehicle_unload enc_b_left_ghost_1 )
(vehicle_unload enc_b_shadow )
(vehicle_unload enc_b_creep )
(vehicle_unload enc_b_ghost_left )
(vehicle_unload enc_b_ghost_right )
(vehicle_unload enc_b_ghost_left_2 )
(vehicle_unload enc_b_ghost_right_2 )
(vehicle_unload enc_bc_shadow )
(vehicle_unload enc_bc_ghost1 )
(vehicle_unload enc_bc_ghost2 )
(unit_set_enterable_by_player hog_1 false)
(unit_set_enterable_by_player hog_r false)
(unit_set_enterable_by_player r_hog_c false)
(unit_set_enterable_by_player hog_c false)
(unit_set_enterable_by_player enc_c_warthog false)
(unit_set_enterable_by_player enc_c_rhog false)
(unit_set_enterable_by_player enc_b_left_creep false)
(unit_set_enterable_by_player enc_b_left_ghost_2 false)
(unit_set_enterable_by_player enc_b_left_ghost_1 false)
(unit_set_enterable_by_player enc_b_shadow false)
(unit_set_enterable_by_player enc_b_creep false)
(unit_set_enterable_by_player enc_b_ghost_left false)
(unit_set_enterable_by_player enc_b_ghost_right false)
(unit_set_enterable_by_player enc_b_ghost_left_2 false)
(unit_set_enterable_by_player enc_b_ghost_right_2 false)
(unit_set_enterable_by_player enc_bc_shadow false)
(unit_set_enterable_by_player enc_bc_ghost1 false)
(unit_set_enterable_by_player enc_bc_ghost2 false)
(sleep 10) enc_c
(wake getbrandonhere)
(game_save)
(sleep 60)
(vehicle_unload hog_1 )
(vehicle_unload hog_r )
(player_action_test_reset)
(sleep 90)
(device_set_power enc_b_tunnel_exit 1.00)
(device_set_position enc_b_tunnel_exit 0.00)
(ai_follow_target_players enc_c_human)
(ai_renew enc_c_human)
(sleep 300)
(device_set_power enc_b_tunnel_exit 0.00)))

(script dormant void migrate_encounters_c_d
(begin
(if
(vehicle_test_seat_list enc_c_warthog w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_c_warthog))
(ai_attach
(vehicle_gunner enc_c_warthog) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_c_warthog) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_c_warthog) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_c_warthog) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_c_warthog) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_c_warthog) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_c_warthog) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list hog_1 w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner hog_1))
(ai_attach
(vehicle_gunner hog_1) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_1) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_1) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_1) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_1) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_1) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_1) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list hog_r w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner hog_r))
(ai_attach
(vehicle_gunner hog_r) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_r) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_r) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_r) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_r) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_r) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_r) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list r_hog_c w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner r_hog_c))
(ai_attach
(vehicle_gunner r_hog_c) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders r_hog_c) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders r_hog_c) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders r_hog_c) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders r_hog_c) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders r_hog_c) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders r_hog_c) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list hog_c w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner hog_c))
(ai_attach
(vehicle_gunner hog_c) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_c) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_c) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_c) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_c) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders hog_c) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders hog_c) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list enc_c_rhog w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_c_rhog))
(ai_attach
(vehicle_gunner enc_c_rhog) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_c_rhog) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_c_rhog) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_c_rhog) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_c_rhog) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_c_rhog) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_c_rhog) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list enc_d_rhog w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_d_rhog))
(ai_attach
(vehicle_gunner enc_d_rhog) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_rhog) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_rhog) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_rhog) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_rhog) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_rhog) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_rhog) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list enc_d_rhog w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_d_rhog))
(ai_attach
(vehicle_gunner enc_d_rhog) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_rhog) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_rhog) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_rhog) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_rhog) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_rhog) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_rhog) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list enc_d_hog w-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_d_hog))
(ai_attach
(vehicle_gunner enc_d_hog) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_hog) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_hog) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_hog) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_hog) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_hog) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_hog) 2)) enc_d_human/a)))
(if
(vehicle_test_seat_list enc_b_shadow g-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_b_shadow))
(ai_attach
(vehicle_gunner enc_b_shadow) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_b_shadow) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_b_shadow) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_b_shadow) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_b_shadow) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_b_shadow) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_b_shadow) 2)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_b_shadow) 3)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_b_shadow) 3)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_b_shadow) 4)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_b_shadow) 4)) enc_d_human/a)))
(if
(vehicle_test_seat_list enc_bc_shadow g-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_bc_shadow))
(ai_attach
(vehicle_gunner enc_bc_shadow) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 2)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 3)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 3)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 4)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_bc_shadow) 4)) enc_d_human/a)))
(if
(vehicle_test_seat_list enc_d_shadow g-driver migrate_encounters_c_d)
(begin
(ai_detach
(vehicle_gunner enc_d_shadow))
(ai_attach
(vehicle_gunner enc_d_shadow) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_shadow) 0)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_shadow) 0)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_shadow) 1)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_shadow) 1)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_shadow) 2)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_shadow) 2)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_shadow) 3)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_shadow) 3)) enc_d_human/a)
(ai_detach
(unit
(list_get
(vehicle_riders enc_d_shadow) 4)))
(ai_attach
(unit
(list_get
(vehicle_riders enc_d_shadow) 4)) enc_d_human/a)))
(ai_follow_target_players enc_d_human)
(ai_detach migrate_encounters_c_d)))

(script dormant void obj4
(begin
(hud_set_objective_text obj4)
(show_hud_help_text true)
(hud_set_help_text obj4)
(sleep 300)
(show_hud_help_text false)))

(script dormant void second_layer_top
(begin
(sleep_until
(volume_test_object second_floor_2 second_layer_top))
(ai_place enc_d_covenant/crossfire_left2)
(ai_place enc_d_covenant/crossfire_right2)
(sleep 120)
(ai_place enc_d_covenant/top_fireteam1)))

(script dormant void get_grunt_in_turret
(begin
(sleep 180)
(ai_go_to_vehicle enc_d_covenant/turret4 enc_d_turret4 gunner)))

(script dormant void alpha_foxtrot
(begin
(ai_conversation enc_d_foxtrot)
(sleep 400)
(object_create_anew enc_d_bomber_1)
(object_create_anew enc_d_foxtrot)
(scenery_animation_start enc_d_bomber_1 tm\levels\tmc_b\anim\longsword2\longsword2 enc_d_1)
(sleep 15)
(scenery_animation_start enc_d_foxtrot tm\levels\tmc_b\anim\longsword2\longsword2 enc_d_2)
(sleep 100)
(sound_impulse_start tm\sounds\sfx\longsword2 none 1.00) alpha_foxtrot
(player_effect_start
(real_random_range 0.85 1.05) 1.00)
(sleep 30)
(player_effect_stop
(real_random_range 1.50 2.50))))

(script dormant void covenant_cruiser_d_flyby
(begin
(object_create cruiser_d)
(scenery_animation_start cruiser_d tm\levels\tmc_b\anim\cruiser\cruiser cruiser_d)
(sleep 120)
(sound_impulse_start tm\sounds\sfx\cruiser\flyby none 1.00)
(sleep 60)
(ai_conversation enc_d_brnd_2) covenant_cruiser_d_flyby
(player_effect_start
(real_random_range 0.85 1.05) 1.00)
(sleep 90)
(player_effect_stop
(real_random_range 1.50 2.50))
(sleep 110)
(sleep 110)
(object_destroy cruiser_d)
(wake alpha_foxtrot)
(sleep 110)
(activate_nav_point_flag default covenant_cruiser_d_flyby d_autoturret 0.00)))

(script dormant void getbrandonhere2
(begin
(if
(=
(volume_test_object brandon_check_d brandon) false)
(begin
(sleep 10)
(object_create_anew brandon)
(ai_attach brandon enc_d_human/a)
(object_create_anew brandon_d_ghost)
(object_cannot_take_damage brandon_d_ghost)
(unit_set_maximum_vitality brandon_d_ghost 1.#J 1.#J)
(vehicle_load_magic brandon_d_ghost driver brandon)
(ai_follow_target_players enc_d_human)))))

(script dormant void sage_cine
(begin
(sound_impulse_start tm\sounds\dialouge\sage\cine_d_v3 none 1.00)
(sleep 37)
(object_create_anew sage_hologram_alt)
(object_destroy sage_hologram)
(sleep 5)
(object_destroy sage_hologram_alt)
(object_create_anew sage_hologram)
(sleep 40)
(object_create_anew sage_hologram_alt)
(sleep 6)
(object_destroy sage_hologram_alt)
(object_destroy sage_hologram)
(sleep 4)
(object_create_anew sage_hologram)
(sleep 20)
(object_destroy sage_hologram)
(object_create_anew sage_hologram_alt)
(sleep 8)
(object_create_anew sage_hologram)
(sleep 7)
(object_destroy sage_hologram)
(sleep 30)
(object_destroy sage_hologram_alt)
(sleep 3)
(object_create_anew sage_hologram_alt)
(sleep 30)
(object_destroy sage_hologram_alt)
(object_create_anew sage_hologram)
(sleep 40)
(object_destroy sage_hologram)
(object_create_anew sage_hologram_alt)
(sleep 7)
(object_destroy sage_hologram_alt)
(object_create_anew sage_hologram)
(sleep 50)
(object_destroy sage_hologram)
(sleep 5)
(object_create_anew sage_hologram)
(sleep 45)
(object_destroy sage_hologram)
(object_create_anew sage_hologram_alt)
(sleep 60)
(object_destroy sage_hologram_alt)
(object_create_anew sage_hologram)
(sleep 3)
(object_destroy sage_hologram)
(sleep 4)
(object_create_anew sage_hologram_alt)
(sleep 30)
(object_destroy sage_hologram_alt)
(object_create_anew sage_hologram)
(sleep 60)
(object_destroy sage_hologram)
(sleep 4)
(object_create_anew sage_hologram)
(sleep 50)
(object_create_anew sage_hologram_alt)
(sleep 5)
(object_destroy sage_hologram_alt)
(sleep 5)
(object_create_anew sage_hologram_alt)
(sleep 5)
(object_destroy sage_hologram_alt)
(sleep 5)
(object_create_anew sage_hologram_alt)
(sleep 5)
(object_destroy sage_hologram_alt)
(sleep 25)
(object_destroy sage_hologram)
(object_create_anew sage_hologram_alt)
(sleep 90)
(object_destroy sage_hologram_alt)
(object_create_anew sage_hologram)
(sleep 8)
(object_destroy sage_hologram)
(object_create_anew sage_hologram_alt)
(sleep 4)
(object_destroy sage_hologram_alt)
(object_create_anew sage_hologram)
(sleep 50)
(object_create_anew sage_hologram_alt)
(sleep 6)
(object_destroy sage_hologram)
(sleep 4)
(object_create_anew sage_hologram)
(object_destroy sage_hologram_alt)
(sleep 86)
(object_destroy sage_hologram)
(sleep 4)
(object_create_anew sage_hologram_alt)
(sleep 50)
(object_destroy sage_hologram_alt)
(sleep 3)
(object_create_anew sage_hologram)
(sleep 3)
(object_destroy sage_hologram)
(object_create_anew sage_hologram_alt)
(sleep 50)
(object_create_anew sage_hologram)
(sleep 6)
(object_destroy sage_hologram)
(object_destroy sage_hologram_alt)
(sleep 2)
(object_create_anew sage_hologram)
(sleep 7)
(object_create_anew sage_hologram_alt)
(sleep 1)
(object_destroy sage_hologram)
(sleep 6)
(object_destroy sage_hologram_alt)))

(script dormant void approach_sage
(begin
(sleep_until
(=
(device_get_position sage_control) 1.00))
(fade_out 0.00 0.00 0.00 30)
(sleep 30)
(ai_erase_all)
(sound_impulse_predict tm\sounds\dialouge\sage\cine_d true)
(object_teleport approach_sage plyer_sage_cine)
(object_create_anew may_2)
(object_create_anew brandon_2)
(ai_attach brandon_2 cine_human)
(unit_set_seat brandon_2 alert)
(unit_set_seat may_2 alert)
(camera_control true)
(cinematic_start)
(camera_set cine_d_g_1 0)
(custom_animation may_2 tm\levels\tmc_b\anim\may\may may_press true)
(fade_in 0.00 0.00 0.00 30)
(camera_set cine_d_g_2 150)
(ai_command_list_by_unit brandon_2 cine_d_brandon)
(sleep 125)
(camera_set cine_d_h_1 0)
(sleep 50)
(camera_set cine_d_h_2 120)
(sleep 70)
(object_create_anew sage_hologram)
(object_create_anew sage_hologram_alt)
(sleep 7)
(object_destroy sage_hologram)
(sleep 3)
(object_create_anew sage_hologram)
(object_destroy sage_hologram_alt)
(sleep 9)
(object_destroy sage_hologram)
(sleep 4)
(object_create_anew sage_hologram)
(sleep 50)
(wake sage_cine)
(camera_set cine_d_b_1 0)
(camera_set cine_d_b_2 300)
(sleep 150)
(camera_set cine_d_b_3 300)
(sleep 150)
(camera_set cine_d_c_1 0)
(sleep 116)
(camera_set cine_d_d_1 0)
(camera_set cine_d_d_2 200)
(sleep 200)
(camera_set cine_d_e_1 0)
(sleep 200)
(camera_set cine_d_f_1 0)
(sleep 100)
(camera_set cine_d_f_2 175)
(sound_looping_stop sound\music\string_low1\string_low1)
(sleep 100)
(camera_set cine_d_j_1 0)
(camera_set cine_d_j_2 200)
(sleep 100)
(camera_set cine_d_j_3 200)
(sleep 190)
(sleep 10)
(fade_out 1.00 1.00 1.00 30)
(sleep 30)
(map_name lumoria_c)))

(script dormant void terminal3
(begin
(sleep_until
(=
(device_get_position terminal3) 1.00))
(player_enable_input false)
(camera_control true)
(show_hud false)
(camera_set terminal_3_cut 0)
(cinematic_set_title terminal3)
(sleep
(* 45.00 30.00))
(camera_control false)
(show_hud true)
(player_enable_input true)))

(script startup void enc_d
(begin
(wake terminal3)
(sleep_until
(volume_test_objects switchd_c
(players)))
(wake migrate_encounters_c_d)
(sleep_until
(volume_test_object spawn_d_approach enc_d))
(ai_place enc_d_creatures)
(game_save_totally_unsafe)
(wake getbrandonhere2)
(if
(vehicle_test_seat_list enc_d_rhog w-driver enc_d)
(set player_d_rhog true))
(if
(vehicle_test_seat_list hog_r w-driver enc_d)
(set player_d_rhog true))
(if
(vehicle_test_seat_list r_hog_c w-driver enc_d)
(set player_d_rhog true))
(if
(vehicle_test_seat_list enc_b_creep g-driver enc_d)
(set player_d_creep true))
(if
(vehicle_test_seat_list enc_b_left_creep g-driver enc_d)
(set player_d_creep true))
(if
(vehicle_test_seat_list enc_d_creep g-driver enc_d)
(set player_d_creep true))
(wake obj4)
(object_create_anew enc_d_turret1)
(object_create_anew enc_d_turret2)
(object_create_anew enc_d_ghost_flea)
(ai_place enc_d_covenant/turret1)
(ai_place enc_d_covenant/jackals_near_turret1)
(ai_place enc_d_covenant/turret2)
(vehicle_load_magic enc_d_turret1 gunner
(ai_actors enc_d_covenant/turret1))
(vehicle_load_magic enc_d_turret2 gunner
(ai_actors enc_d_covenant/turret2))
(ai_magically_see_players enc_d_covenant/turret1)
(ai_magically_see_players enc_d_covenant/turret2)
(if player_d_rhog
(object_create_anew enc_d_wraith)
(if player_d_creep
(object_create_anew enc_d_normal_shadow)
(object_create_anew enc_d_shadow)))
(sleep 120)
(ai_place enc_d_covenant/ghost_flea)
(sleep_until
(volume_test_object spawn_d_main enc_d))
(object_create_anew enc_d_ghost1)
(object_create_anew enc_d_ghost2)
(object_create_anew enc_d_turret3)
(ai_place enc_d_covenant/ghost1)
(ai_place enc_d_covenant/ghost2)
(ai_place enc_d_covenant/wraith)
(ai_place enc_d_covenant/turret3)
(ai_place enc_d_covenant/main_infantry)
(if
(not player_d_rhog)
(ai_place enc_d_covenant/shadow_gunner))
(vehicle_load_magic enc_d_turret3 gunner
(ai_actors enc_d_covenant/turret3))
(vehicle_load_magic enc_d_ghost1 driver
(ai_actors enc_d_covenant/ghost1))
(vehicle_load_magic enc_d_ghost2 driver
(ai_actors enc_d_covenant/ghost2))
(if player_d_rhog
(vehicle_load_magic enc_d_wraith driver
(ai_actors enc_d_covenant/wraith)))
(begin
(vehicle_load_magic enc_d_shadow driver
(ai_actors enc_d_covenant/wraith))
(vehicle_load_magic enc_d_shadow gunner
(ai_actors enc_d_covenant/shadow_gunner))
(vehicle_load_magic enc_d_normal_shadow driver
(ai_actors enc_d_covenant/wraith))
(vehicle_load_magic enc_d_normal_shadow gunner
(ai_actors enc_d_covenant/shadow_gunner)))
(sleep_until
(volume_test_object music_start enc_d))
(sound_looping_start tm\sounds\music\battle_d\battle_d none 1.00)
(game_save)
(sleep_until
(volume_test_object spawn_d_drones enc_d))
(ai_magically_see_players enc_d_drones/drones)
(ai_follow_target_players enc_d_drones)
(game_save_no_timeout)
(sleep_until
(volume_test_object spawn_first_floor enc_d))
(ai_place enc_d_covenant/first_floor_welcome)
(ai_magically_see_players enc_d_covenant/first_floor_welcome)
(sleep_until
(volume_test_object spawn_welcome_d enc_d))
(ai_place enc_d_covenant/first_floor)
(ai_magically_see_players enc_d_covenant/first_floor)
(sound_looping_start tm\sounds\music\abyss\abyss none 1.00)
(sleep_until
(volume_test_object spawn_d_ledge enc_d))
(ai_place enc_d_covenant/first_floor_jackals)
(vehicle_unload hog_1 )
(vehicle_unload hog_r )
(vehicle_unload r_hog_c )
(vehicle_unload hog_c )
(vehicle_unload enc_c_warthog )
(vehicle_unload enc_c_rhog )
(vehicle_unload enc_d_hog )
(vehicle_unload enc_d_rhog )
(vehicle_unload enc_b_left_creep )
(vehicle_unload enc_b_left_ghost_2 )
(vehicle_unload enc_b_left_ghost_1 )
(vehicle_unload enc_b_shadow )
(vehicle_unload enc_b_creep )
(vehicle_unload enc_b_ghost_left )
(vehicle_unload enc_b_ghost_right )
(vehicle_unload enc_b_ghost_left_2 )
(vehicle_unload enc_b_ghost_right_2 )
(vehicle_unload enc_bc_shadow )
(vehicle_unload enc_d_shadow )
(vehicle_unload brandon_d_ghost )
(sleep 60)
(game_save_no_timeout)
(ai_place enc_d_covenant/turret4)
(ai_follow_target_players enc_d_human)
(sleep 10)
(wake get_grunt_in_turret)
(ai_magically_see_players enc_d_covenant/turret4)
(sleep_until
(volume_test_object spawn_second_floor enc_d))
(wake covenant_cruiser_d_flyby)
(ai_place enc_d_covenant/second_floor_main)
(ai_place enc_d_covenant/crossfire_elites)
(ai_place enc_d_covenant/crossfire_left)
(ai_place enc_d_covenant/crossfire_right)
(ai_place enc_d_covenant/second_grunts_left)
(ai_place enc_d_covenant/zealot)
(ai_attach enc_d_autoturret enc_d_covenant/zealot)
(object_cannot_take_damage enc_d_autoturret)
(wake second_layer_top)
(sleep 240)
(sleep 240)
(ai_place enc_d_covenant/crossfire_elites_2)
(sleep 60)
(ai_place enc_d_drones_top)
(sleep_until
(=
(device_get_position auto_cannon_control) 1.00))
(deactivate_nav_point_flag enc_d d_autoturret)
(ai_kill enc_d_covenant/ghost1)
(ai_kill enc_d_covenant/ghost2)
(ai_kill enc_d_covenant/wraith)
(ai_kill enc_d_covenant/turret1)
(ai_kill enc_d_covenant/turret2)
(ai_kill enc_d_covenant/turret3)
(ai_kill enc_d_covenant/ghost_flea)
(ai_kill enc_d_covenant/first_floor)
(ai_kill enc_d_covenant/first_floor_jackals)
(ai_kill enc_d_covenant/first_floor_welcome)
(ai_kill enc_d_covenant/turret4)
(ai_kill enc_d_covenant/main_infantry)
(ai_kill enc_d_covenant/second_floor_ledge)
(ai_kill enc_d_covenant/second_floor_main)
(ai_kill enc_d_covenant/jackals_near_turret1)
(ai_kill enc_d_covenant/shadow_gunner)
(ai_braindead enc_d_covenant/zealot true)
(ai_disregard enc_d_autoturret true)
(ai_detach enc_d_autoturret)
(ai_attach enc_d_autoturret enc_d_drones)
(sleep 5)
(sleep_until
(<=
(ai_living_count enc_d_covenant) 1))
(sleep 100)
(object_create_anew peli_d_spire)
(unit_set_enterable_by_player peli_d_spire false)
(object_teleport peli_d_spire d_dropships)
(ai_place marine_unlock_d)
(ai_place pilots_bsp_d)
(units_set_current_vitality
(ai_actors marine_unlock_d/a) 0.10 0.01)
(object_cannot_take_damage
(ai_actors marine_unlock_d/a))
(vehicle_load_magic peli_d_spire rider
(ai_actors marine_unlock_d/a))
(vehicle_load_magic peli_d_spire driver
(ai_actors pilots_bsp_d/pilot))
(ai_place enc_d_human_2/reinforcement)
(vehicle_load_magic peli_d_spire rider
(ai_actors enc_d_human_2/reinforcement))
(ai_renew enc_d_human)
(custom_animation peli_d_spire tm\levels\tmc_b\anim\scarecrow_shootcdrop pel true)
(sleep_until
(<=
(unit_get_custom_animation_time peli_d_spire) 1300))
(vehicle_unload peli_d_spire rider)
(ai_command_list_advance marine_unlock_d)
(sleep 100)
(object_can_take_damage
(ai_actors marine_unlock_d/a))
(units_set_current_vitality
(ai_actors marine_unlock_d/a) 0.10 0.01)
(sleep 150)
(game_save)
(ai_follow_target_players enc_d_human)
(ai_follow_target_players enc_d_human_2)
(sleep 250)
(ai_place enc_d_covenant/hunters)
(ai_magically_see_players enc_d_covenant/hunters)
(sleep 10)
(device_set_power big_door 1.00)
(device_set_position big_door 1.00)
(effect_new weapons\fuel rod gun\fuel rod gun detonating d_rod1)
(effect_new weapons\fuel rod gun\fuel rod gun detonating d_rod2)
(sleep 120)
(effect_new weapons\plasma_cannon\effects\explosion d_explosion)
(sound_looping_start sound\music\cstrng\cstrng1 none 1.00)
(sleep 90)
(sound_looping_start sound\music\string_low1\string_low1 none 1.00)
(ai_command_list_advance enc_d_covenant/hunters)
(ai_kill marine_unlock_d)
(cinematic_set_title sage)
(wake approach_sage)))

(script startup void marine_shadow
(begin
(sleep_until
(volume_test_object ai_conv_shadow marine_shadow))
(if player_d_rhog
(ai_conversation marine_d_wraith)
(ai_conversation marine_d))
(sleep 10)
(ai_conversation enc_d_brnd)))

(script startup void brandon_is_gay
(begin
(sleep_until
(volume_test_object spawn_second_floor brandon_is_gay))
(game_save_no_timeout)
(sleep 240)
(ai_conversation enc_d_brnd_3)))