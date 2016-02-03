(global effect tele cinematics\effects\teleportation\teleportation)

(global effect pg weapons\plasma grenade\effects\explosion)

(global short battle_length 350)

(global short tp_delay 30)

(global short previous_point 1)

(global bool origin true)

(global bool higher_ring false)

(global bool ground_level false)

(global bool ring_decided false)

(global bool ground_decided false)

(global bool destination_decided false)

(global bool start_boss false)

(global bool consideration_finished false)

(global effect bigasssplosion bigasssplosion\rocket explosion)

(global bool sage_ingame_battle false)

(global bool brandon_dead false)

(global bool turret_converted false)

(global bool teleported false)

(global bool end_wing_1 false)

(global bool end_wing_2 false)

(global bool end_wing_3 false)

(global bool end_wing_4 false)

(global bool cheat_to_g false)

(global bool migrate_humans_right false)

(global bool migrate_humans_left false)

(script static void optimise_f_hill
(begin
(object_destroy_containing f_del)
(object_destroy_containing redcedar_small)
(object_destroy_containing f_tree_hill)
(object_destroy_containing f_cedar)
(object_destroy_containing f_lower_shrub)
(object_destroy_containing f_lower_tree)))

(script static void player_effect_rumble
(begin
(player_effect_set_max_translation 0.01 0.00 0.02)
(player_effect_set_max_rotation 0.10 0.10 0.20)
(player_effect_set_max_rumble 0.50 0.30)
(player_effect_start
(real_random_range 0.70 0.90) 0.50)))

(script static unit player0
(begin
(unit
(list_get
(players) 0))))

(script dormant void sword_place
(begin
(sleep 200)
(sleep 23)
(object_create_anew sword)
(objects_attach elite_boss_cine right hand elite sword )))

(script continuous void cine
(begin
(if brandon_dead
(begin
(custom_animation brandon tm\levels\tmc_d\anim\cine_h\dead_brandon\dead_brandon dead_brandon true)
(sleep 2000)))))

(script dormant void z_credits
(begin
(switch_bsp 2)
(object_create_anew z_frigate)
(camera_set z_1.1 0)
(fade_in 0.00 0.00 0.00 75)
(sound_looping_start tm\sounds\dialouge\lp_halo\z none 1.00)
(camera_set z_1.2 150)
(sleep 75)
(camera_set z_1.3 150)
(sleep 75)
(camera_set z_1.4 100)
(sleep 50)
(fade_out 0.00 0.00 0.00 93)
(sleep 93)
(cinematic_stop)
(object_create_anew z_1)
(object_destroy z_frigate)
(camera_set z_n_1 0)
(fade_in 0.00 0.00 0.00 11)
(sleep 132)
(camera_set z_n_2 3750)
(sleep 3750)
(sound_looping_stop tm\sounds\dialouge\lp_halo\z)
(fade_out 0.00 0.00 0.00 200)))

(script dormant void cine_i_leg
(begin
(switch_bsp 1)
(sleep 3)
(object_destroy door_i1)
(object_destroy door_i2)
(object_destroy door_i3)
(object_destroy door_i4)
(object_destroy door_i5)
(object_destroy door_i6)
(object_destroy door_i7)
(camera_set il_2.1 0)
(object_destroy may_un)
(object_destroy scientist)
(object_teleport cine_i_leg cine_e_player)
(player_enable_input false)
(ai_place cine_i_h)
(ai_place cine_i_sen)
(ai_magically_see_encounter cine_i_h cine_i_sen)
(object_cannot_take_damage
(ai_actors cine_i_sen))
(object_cannot_take_damage
(ai_actors cine_i_h))
(sleep 30)
(fade_in 0.00 0.00 0.00 75)
(camera_set il_2.2 200)
(sleep 200)
(camera_set i_1.1 0)
(camera_set i_1.2 150)
(sleep 75)
(camera_set i_1.3 150)
(sleep 125)
(camera_set i_2.1 0)
(camera_set i_2.2 200)
(sleep 180)
(ai_kill cine_i_sen/a)
(sleep 20)
(camera_set i_3.1 0)
(sleep 10)
(ai_kill cine_i_sen/b)
(sleep 11)
(ai_kill cine_i_sen/c)
(sleep 4)
(ai_kill cine_i_sen/d)
(sleep 12)
(ai_kill cine_i_sen/e)
(sleep 50)
(sleep 15)
(object_create_anew pilot_armed)
(custom_animation pilot_armed tm\levels\tmc_d\anim\cine_h\pilot_cheer\pilot_cheer pilot_cheer true)
(sound_impulse_start tm\sounds\dialouge\cine_h\ending_leg\v2 none 1.00)
(camera_set i_5.1 0)
(ai_erase cine_i_h)
(camera_set i_5.2 150)
(sleep 95)
(ai_place cine_i_sen2)
(sleep 15)
(camera_set i_4.1 0)
(camera_set i_4.2 200)
(sleep 70)
(ai_kill cine_i_sen2/a)
(sleep 20)
(ai_kill cine_i_sen2/b)
(sleep 17)
(ai_kill cine_i_sen2/c)
(sleep 60)
(fade_out 0.00 0.00 0.00 75)
(sleep 75)
(object_destroy pilot_armed)
(switch_bsp 0)
(ai_erase_all)
(sleep 4)
(object_destroy sage)
(object_create_anew brandon)
(object_teleport brandon dead_brandon)
(set brandon_dead true)
(object_create_anew may_un)
(object_create_anew scientist)
(unit_set_seat may_un alert)
(unit_set_seat scientist alert)
(object_teleport may_un i_may1)
(object_teleport scientist i_scientist1)
(object_teleport cine_i_leg cine_g_teleport)
(camera_set i_6.1 0)
(ai_place cine_i_sen3)
(fade_in 0.00 0.00 0.00 75)
(camera_set i_6.2 300)
(sleep 75)
(ai_kill cine_i_sen3/a)
(sleep 25)
(ai_kill cine_i_sen3/b)
(sleep 200)
(camera_set i_7.1 0)
(camera_set i_7.2 300)
(sleep 300)
(camera_set i_8.1 0)
(camera_set i_8.2 250)
(recording_play may_un cine_i_may1)
(recording_play scientist cine_i_scientist1)
(sleep 262)
(recording_kill may_un)
(sleep 15)
(camera_set il_1.1 0)
(camera_set il_1.2 175)
(sleep 88)
(camera_set il_1.3 175)
(sleep 190)
(camera_set i_9.1 0)
(camera_set i_9.2 300)
(sleep 250)
(fade_out 0.00 0.00 0.00 50)
(sleep 50)
(switch_bsp 1)
(object_destroy may_un)
(object_destroy scientist)
(object_destroy brandon)
(sleep 1)
(object_teleport cine_i_leg cine_i_fin_player)
(object_create_anew i_peli)
(object_teleport i_peli i_peli_flag)
(custom_animation i_peli tm\levels\tmc_d\anim\cine_h\i_peli\i_peli i_peli_hold true)
(object_create_anew brandon)
(object_teleport brandon i_peli_flag)
(custom_animation brandon tm\levels\tmc_d\anim\cine_h\dead_brandon\dead_brandon dead_brandon_peli true)
(object_create_anew may_un)
(object_teleport may_un i_may2)
(object_create_anew scientist)
(object_teleport scientist i_scientist2)
(ai_place cine_i_marines)
(camera_set i_10.1 0)
(fade_in 0.00 0.00 0.00 50)
(camera_set i_10.2 100)
(sleep 85)
(unit_set_seat may_un alert)
(recording_play may_un cine_i_may2)
(sleep 25)
(camera_set i_11.1 0)
(camera_set i_11.2 250)
(sleep 200)
(camera_set i_12.1 0)
(camera_set i_12.2 250)
(recording_kill may_un)
(object_teleport may_un i_may3)
(recording_play may_un cine_i_may3)
(object_destroy i_peli)
(object_destroy brandon)
(sleep 140)
(custom_animation may_un tm\levels\tmc_d\anim\cine_h\i_may\i_may i_may_1 true)
(sleep 65)
(object_create_anew cyborg_helmet)
(objects_attach may_un right hand cyborg_helmet cyborghelmet)
(sleep 65)
(sleep 46)
(camera_set i_13.1 0)
(recording_kill may_un)
(recording_play may_un cine_i_may4)
(camera_set i_13.2 175)
(sleep 88)
(ai_command_list cine_i_marines cine_i_marines)
(camera_set i_13.3 175)
(sleep 110)
(ai_attach scientist cine_human)
(ai_command_list_by_unit scientist cine_i_marines)
(sleep 39)
(object_create_anew i_peli)
(object_teleport i_peli i_peli_flag)
(custom_animation i_peli tm\levels\tmc_d\anim\cine_h\i_peli\i_peli i_peli_fly true)
(sleep 3)
(camera_set i_14.1 0)
(ai_erase cine_i_marines)
(unit_enter_vehicle may_un i_peli p-riderlf)
(unit_enter_vehicle scientist i_peli p-riderrf)
(sleep 150)
(camera_set i_14.2 400)
(sleep 90)
(object_destroy i_peli)
(sleep 110)
(fade_out 0.00 0.00 0.00 200)
(sleep 15)
(sleep 135)
(sleep 60)
(wake z_credits)))

(script dormant void cine_i_normal
(begin
(switch_bsp 1)
(sleep 3)
(object_destroy door_i1)
(object_destroy door_i2)
(object_destroy door_i3)
(object_destroy door_i4)
(object_destroy door_i5)
(object_destroy door_i6)
(object_destroy door_i7)
(camera_set i_1.1 0)
(object_destroy may_un)
(object_destroy scientist)
(object_teleport cine_i_normal cine_e_player)
(player_enable_input false)
(ai_place cine_i_h)
(ai_place cine_i_sen)
(ai_magically_see_encounter cine_i_h cine_i_sen)
(object_cannot_take_damage
(ai_actors cine_i_sen))
(object_cannot_take_damage
(ai_actors cine_i_h))
(sleep 30)
(fade_in 0.00 0.00 0.00 75)
(camera_set i_1.2 150)
(sleep 75)
(camera_set i_1.3 150)
(sleep 125)
(camera_set i_2.1 0)
(camera_set i_2.2 200)
(sleep 180)
(ai_kill cine_i_sen/a)
(sleep 20)
(camera_set i_3.1 0)
(sleep 10)
(ai_kill cine_i_sen/b)
(sleep 11)
(ai_kill cine_i_sen/c)
(sleep 4)
(ai_kill cine_i_sen/d)
(sleep 12)
(ai_kill cine_i_sen/e)
(sleep 50)
(ai_place cine_i_sen2)
(sleep 15)
(camera_set i_4.1 0)
(camera_set i_4.2 200)
(ai_erase cine_i_h)
(sleep 70)
(ai_kill cine_i_sen2/a)
(sleep 20)
(ai_kill cine_i_sen2/b)
(sleep 17)
(ai_kill cine_i_sen2/c)
(object_create_anew pilot_armed)
(sleep 66)
(custom_animation pilot_armed tm\levels\tmc_d\anim\cine_h\pilot_cheer\pilot_cheer pilot_cheer true)
(sleep 3)
(camera_set i_5.1 0)
(camera_set i_5.2 150)
(sleep 60)
(fade_out 0.00 0.00 0.00 50)
(sleep 50)
(object_destroy pilot_armed)
(switch_bsp 0)
(ai_erase_all)
(sleep 4)
(object_destroy sage)
(object_create_anew brandon)
(object_teleport brandon dead_brandon)
(set brandon_dead true)
(object_create_anew may_un)
(object_create_anew scientist)
(unit_set_seat may_un alert)
(unit_set_seat scientist alert)
(object_teleport may_un i_may1)
(object_teleport scientist i_scientist1)
(object_teleport cine_i_normal cine_g_teleport)
(camera_set i_6.1 0)
(ai_place cine_i_sen3)
(fade_in 0.00 0.00 0.00 75)
(camera_set i_6.2 300)
(sleep 75)
(sound_impulse_start tm\sounds\dialouge\cine_h\ending_normal none 1.00)
(ai_kill cine_i_sen3/a)
(sleep 25)
(ai_kill cine_i_sen3/b)
(sleep 200)
(camera_set i_7.1 0)
(camera_set i_7.2 300)
(sleep 300)
(camera_set i_8.1 0)
(camera_set i_8.2 250)
(recording_play may_un cine_i_may1)
(recording_play scientist cine_i_scientist1)
(sleep 262)
(recording_kill may_un)
(sleep 15)
(camera_set i_9.1 0)
(camera_set i_9.2 300)
(sleep 250)
(fade_out 0.00 0.00 0.00 50)
(sleep 50)
(switch_bsp 1)
(object_destroy may_un)
(object_destroy scientist)
(object_destroy brandon)
(sleep 1)
(object_teleport cine_i_normal cine_i_fin_player)
(object_create_anew i_peli)
(object_teleport i_peli i_peli_flag)
(custom_animation i_peli tm\levels\tmc_d\anim\cine_h\i_peli\i_peli i_peli_hold true)
(object_create_anew brandon)
(object_teleport brandon i_peli_flag)
(custom_animation brandon tm\levels\tmc_d\anim\cine_h\dead_brandon\dead_brandon dead_brandon_peli true)
(object_create_anew may_un)
(object_teleport may_un i_may2)
(object_create_anew scientist)
(object_teleport scientist i_scientist2)
(ai_place cine_i_marines)
(camera_set i_10.1 0)
(fade_in 0.00 0.00 0.00 50)
(camera_set i_10.2 100)
(sleep 85)
(unit_set_seat may_un alert)
(recording_play may_un cine_i_may2)
(sleep 25)
(camera_set i_11.1 0)
(camera_set i_11.2 250)
(sleep 200)
(camera_set i_12.1 0)
(camera_set i_12.2 250)
(recording_kill may_un)
(object_teleport may_un i_may3)
(recording_play may_un cine_i_may3)
(object_destroy i_peli)
(object_destroy brandon)
(sleep 140)
(custom_animation may_un tm\levels\tmc_d\anim\cine_h\i_may\i_may i_may_1 true)
(sleep 65)
(object_create_anew cyborg_helmet)
(objects_attach may_un right hand cyborg_helmet cyborghelmet)
(sleep 65)
(sleep 46)
(camera_set i_13.1 0)
(recording_kill may_un)
(recording_play may_un cine_i_may4)
(camera_set i_13.2 175)
(sleep 88)
(ai_command_list cine_i_marines cine_i_marines)
(camera_set i_13.3 175)
(sleep 110)
(ai_attach scientist cine_human)
(ai_command_list_by_unit scientist cine_i_marines)
(sleep 39)
(object_create_anew i_peli)
(object_teleport i_peli i_peli_flag)
(custom_animation i_peli tm\levels\tmc_d\anim\cine_h\i_peli\i_peli i_peli_fly true)
(sleep 3)
(camera_set i_14.1 0)
(ai_erase cine_i_marines)
(unit_enter_vehicle may_un i_peli p-riderlf)
(unit_enter_vehicle scientist i_peli p-riderrf)
(sleep 150)
(camera_set i_14.2 400)
(sleep 90)
(object_destroy i_peli)
(sleep 110)
(fade_out 0.00 0.00 0.00 200)
(sleep 15)
(sleep 135)
(sleep 60)
(wake z_credits)))

(script dormant void cinematic_h
(begin
(sleep_until
(=
(ai_living_count boss_battle) 0) 15)
(sound_looping_stop sound\halo2\music\ben\ben)
(sleep 300)
(fade_out 0.00 0.00 0.00 200)
(sleep 100)
(ai_kill enc_k_covenant)
(sleep 100)
(cinematic_start)
(camera_control true)
(player_enable_input false)
(object_create_anew may_un)
(object_teleport may_un cine_h_ra)
(unit_set_seat may_un alert)
(camera_set h_1.1 0)
(camera_set h_1.2 300)
(fade_in 0.00 0.00 0.00 200)
(object_teleport cinematic_h cine_g_teleport)
(object_destroy boss_elite)
(sleep 280)
(recording_play may_un cine_h_may1)
(sleep 20)
(camera_set h_2.1 0)
(sound_impulse_start tm\sounds\dialouge\cine_h\h_bg_1 none 1.00)
(sleep 20)
(sleep 30)
(camera_set h_2.2 175)
(sleep 130)
(object_create_anew elite_boss_cine)
(object_teleport elite_boss_cine cine_h_swordtoss)
(custom_animation elite_boss_cine tm\levels\tmc_d\anim\cine_h\elite\elite h_elite_1 true)
(sleep 3)
(wake sword_place)
(camera_set h_3.1 0)
(sleep 85)
(camera_set h_4.1 0)
(object_destroy may_un)
(sleep 168)
(camera_set h_4.2 200)
(sleep 80)
(camera_set h_4.3 50)
(sleep 99)
(object_create_anew may_un)
(object_teleport may_un cine_h_swordtoss2)
(custom_animation may_un tm\levels\tmc_d\anim\cine_h\may\may h_may_2 true)
(sleep 3)
(custom_animation elite_boss_cine tm\levels\tmc_d\anim\cine_h\elite\elite h_elite_2 true)
(camera_set h_5.1 0)
(camera_set h_5.2 219)
(sleep 42)
(object_create_anew sword)
(objects_attach may_un left hand sword )
(sleep 177)
(camera_set h_6.1 0)
(camera_set h_6.3 125)
(sleep 62)
(camera_set h_6.4 121)
(sleep 80)
(sound_looping_start tm\sounds\music\no_more_dead\no_more_dead none 1.00)
(sleep 31)
(camera_set h_7.1 0)
(camera_set h_7.2 250)
(sleep 125)
(camera_set h_7.3 200)
(object_create_anew banshee_cine)
(object_teleport banshee_cine h_bnsh)
(custom_animation banshee_cine tm\levels\tmc_d\anim\cine_h\bnsh\bnsh s_h_banshee true)
(sleep 100)
(camera_set h_7.4 175)
(sleep 190)
(object_create_anew scientist)
(object_destroy elite_boss_cine)
(object_teleport scientist h_sci_spawn)
(object_create_anew banshee2)
(recording_kill banshee_cine)
(object_destroy banshee_cine)
(object_teleport banshee2 h_bnsh)
(recording_play scientist cine_h_sci1)
(camera_set h_8.1 0)
(camera_set h_8.2 120)
(sleep 60)
(camera_set h_8.3 120)
(sleep 60)
(camera_set h_8.4 142)
(sleep 112)
(sound_impulse_start tm\sounds\dialouge\cine_h\dennis_1 scientist 1.00)
(sleep 30)
(camera_set h_9.1 0)
(camera_set h_9.2 250)
(sleep 62)
(object_create_anew may_un)
(object_teleport may_un h_may_swrd)
(object_create_anew sword)
(objects_attach may_un right hand sword )
(unit_set_seat may_un alert)
(recording_play may_un cine_h_may2)
(sleep 63)
(camera_set h_9.3 250)
(sleep 250)
(object_teleport cinematic_h boss7)
(camera_set h_10.1 0)
(camera_set h_10.2 175)
(sleep 175)
(object_teleport cinematic_h cine_g_teleport)
(ai_attach may_un cine_human)
(ai_command_list_by_unit may_un cine_h_may1)
(camera_set h_11.1 0)
(camera_set h_11.2 300)
(sleep 100)
(sleep 230)
(sound_impulse_start tm\sounds\dialouge\cine_h\captain_1 none 1.00)
(camera_set h_12.1 0)
(camera_set h_12.2 200)
(sleep 200)
(camera_set h_13.1 0)
(sound_impulse_start tm\sounds\dialouge\cine_h\dennis_2 scientist 1.00)
(sleep 173)
(set sage_ingame_battle false)
(scenery_animation_start sage tm\levels\tmc_d\anim\cine_h\sage_death\sage_death sage_death)
(camera_set h_14.1 0)
(camera_set h_14.2 200)
(sleep 100)
(camera_set h_14.3 200)
(sleep 100)
(sound_impulse_start tm\sounds\dialouge\cine_h\dennis_3 scientist 1.00)
(sound_impulse_start tm\sounds\dialouge\cine_h\dennis_3 none 1.00)
(camera_set h_14.4 200)
(sleep 100)
(camera_set h_14.5 200)
(sleep 100)
(camera_set h_14.6 200)
(sleep 100)
(sleep 53)
(sound_impulse_start tm\sounds\sfx\frigate none 1.00)
(object_create_anew destroy_sage_beam)
(sleep 47)
(sound_impulse_start tm\sounds\dialouge\cine_h\sage_explosions none 1.00)
(effect_new bigasssplosion sage_expl1)
(sleep 80)
(effect_new bigasssplosion sage_expl4)
(effect_new bigasssplosion sage_expl2)
(effect_new bigasssplosion sage_expl3)
(sleep 20)
(object_teleport may_un h_may_look)
(camera_set h_15.1 0)
(camera_set h_15.2 200)
(sleep 100)
(object_destroy destroy_sage_beam)
(sleep 100)
(sound_impulse_start tm\sounds\dialouge\cine_h\dennis_4 scientist 1.00)
(sleep 250)
(camera_set h_16.1 0)
(camera_set h_16.2 550)
(unit_set_seat scientist alert)
(ai_attach scientist cine_human)
(ai_command_list_by_unit scientist cine_h_scientist)
(sleep 150)
(sleep 100)
(sound_looping_stop tm\sounds\music\no_more_dead\no_more_dead)
(sound_impulse_start tm\sounds\dialouge\cine_h\dennis_5 scientist 1.00)
(sleep 100)
(sound_impulse_start tm\sounds\dialouge\cine_h\may_3 none 1.00)
(fade_out 0.00 0.00 0.00 250)
(sleep 250)
(object_destroy sage)
(object_destroy brandon_dead_ingame)
(object_destroy brandon_dead_shotgun)
(if
(or
(=
(game_difficulty_get) normal)
(=
(game_difficulty_get) hard))
(wake cine_i_normal))
(if
(=
(game_difficulty_get) impossible)
(wake cine_i_leg))))

(script static void consider_origin
(begin
(sleep 1)
(if origin
(begin
(sleep 1)
(ai_command_list_by_unit boss_elite boss_elite_maneuvres1)
(sleep 1)
(ai_command_list_by_unit boss_elite boss_elite_maneuvres1)
(sleep 1)
(sleep_until
(=
(ai_command_list_status boss_elite) 1))
(begin
(set destination_decided false)
(begin_random
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss6)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 6))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss7)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 7))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss8)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 8))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss9)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 9))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss2)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 2))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss3)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 3))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss4)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 4))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss5)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 5))))))
(sleep 1)
(set consideration_finished true)))))

(script static void consider_higher_ring
(begin
(sleep 1)
(if higher_ring
(begin
(set ring_decided false)
(begin_random
(if
(not ring_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres2)
(set ring_decided true)
(sleep 1)))
(if
(not ring_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres3)
(set ring_decided true)
(sleep 1)))
(if
(not ring_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres4)
(set ring_decided true)
(sleep 1)))
(if
(not ring_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres5)
(set ring_decided true)
(sleep 1))))
(sleep 1)
(sleep_until
(=
(ai_command_list_status boss_elite) 1))
(begin
(set destination_decided false)
(begin_random
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss1)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set origin true)
(set destination_decided true)
(sleep 1)
(set previous_point 1))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss6)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 6))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss7)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 7))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss8)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 8))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss9)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 9))))
(begin
(if
(and
(not destination_decided)
(!= 2 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss2)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 2))))
(begin
(if
(and
(not destination_decided)
(!= 3 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss3)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 3))))
(begin
(if
(and
(not destination_decided)
(!= 4 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss4)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 4))))
(begin
(if
(and
(not destination_decided)
(!= 5 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss5)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 5))))))
(sleep 1)
(set consideration_finished true)))))

(script static void consider_ground_level
(begin
(sleep 1)
(if ground_level
(begin
(set ground_decided false)
(begin_random
(if
(not ground_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres6)
(set ground_decided true)
(sleep 1)))
(if
(not ground_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres7)
(set ground_decided true)
(sleep 1)))
(if
(not ground_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres8)
(set ground_decided true)
(sleep 1)))
(if
(not ground_decided)
(begin
(ai_command_list_by_unit boss_elite boss_elite_maneuvres9)
(set ground_decided true)
(sleep 1))))
(sleep 1)
(sleep_until
(=
(ai_command_list_status boss_elite) 1))
(begin
(set destination_decided false)
(begin_random
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss1)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set origin true)
(set destination_decided true)
(sleep 1)
(set previous_point 1))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss2)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 2))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss3)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 3))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss4)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 4))))
(begin
(if
(not destination_decided)
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss5)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set higher_ring true)
(set destination_decided true)
(sleep 1)
(set previous_point 5))))
(begin
(if
(and
(not destination_decided)
(!= 6 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss6)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 6))))
(begin
(if
(and
(not destination_decided)
(!= 7 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss7)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 7))))
(begin
(if
(and
(not destination_decided)
(!= 8 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss8)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 8))))
(begin
(if
(and
(not destination_decided)
(!= 9 previous_point))
(begin
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep tp_delay)
(object_teleport boss_elite boss9)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(set ground_level true)
(set destination_decided true)
(sleep 1)
(set previous_point 9))))))
(sleep 1)
(set consideration_finished true)))))

(script continuous void boss_battle
(begin
(sleep_until start_boss)
(sleep battle_length)
(set consideration_finished false)
(sleep 1)
(begin_random
(if
(not consideration_finished)
(begin boss_battle
(sleep 1)))
(if
(not consideration_finished)
(begin boss_battle
(sleep 1)))
(if
(not consideration_finished)
(begin boss_battle
(sleep 1))))
(sleep 1)
(sleep_until consideration_finished)))

(script continuous void sage_battle
(begin
(if sage_ingame_battle
(begin
(scenery_animation_start sage tm\levels\tmc_c\anim\sage_battle\sage_battle sage_battle)
(sleep 2000)))))

(script startup void trigger_boss
(begin
(unit_impervious boss_elite true)
(object_destroy brandon_dead_shotgun)
(sleep_until
(volume_test_objects boss_trigger
(players)))
(fade_out 0.00 0.00 0.00 30)
(sleep 30)
(object_destroy ac2)
(object_destroy ac3)
(ai_kill enc_k_banshee)
(cinematic_start)
(player_enable_input false)
(object_teleport trigger_boss cine_g_teleport)
(object_destroy banshee)
(object_destroy banshee2)
(object_destroy banshee3)
(sound_impulse_start tm\sounds\sfx\cine_g_bg none 1.00)
(object_create_anew banshee_cine)
(object_teleport banshee_cine h_bnsh)
(custom_animation banshee_cine tm\levels\tmc_c\anim\banshee\banshee banshee_land true)
(camera_control true)
(object_create_anew boss_elite)
(object_create_anew g_grunt)
(object_teleport boss_elite cine_g_elite)
(camera_set cine_g_1.1 0)
(camera_set cine_g_1.2 175)
(fade_in 0.00 0.00 0.00 30)
(recording_play boss_elite cine_g_elite)
(recording_play g_grunt cine_g_grunt)
(sleep 200)
(object_create_anew may)
(object_teleport may boss5)
(recording_play may cine_g_may)
(camera_set cine_g_2.2 0)
(camera_set cine_g_2.3 175)
(sleep 70)
(custom_animation banshee_cine tm\levels\tmc_c\anim\banshee\banshee banshee_explode true)
(sleep 41)
(sleep 26)
(unit_kill g_grunt)
(sleep 20)
(camera_set cine_g_3.1 0)
(sleep 65)
(sleep 5)
(camera_set cine_g_4.1 0)
(camera_set cine_g_4.2 100)
(object_create_anew banshee_cine)
(object_teleport banshee_cine h_bnsh)
(custom_animation banshee_cine tm\levels\tmc_d\anim\cine_h\bnsh\bnsh s_h_banshee true)
(sleep 70)
(camera_set cine_g_5.1 0)
(sleep 80)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation boss_elite body)
(sleep 17)
(object_destroy boss_elite)
(camera_set cine_g_5.2 125)
(sleep 75)
(effect_new tele cine_g_tele3)
(sleep 17)
(object_create_anew elite_boss_cine)
(object_teleport elite_boss_cine bd_1)
(object_create_anew sword)
(objects_attach elite_boss_cine right hand elite sword )
(sleep 100)
(recording_kill banshee_cine)
(object_destroy banshee_cine)
(object_create_anew banshee)
(object_teleport banshee h_bnsh)
(camera_set cine_g_6.1 0)
(object_create_anew brandon)
(object_teleport brandon g_brandon1)
(recording_play brandon cine_g_bd)
(custom_animation elite_boss_cine characters\elite\elite stand sword evade-right true)
(camera_set cine_g_6.2 150)
(sleep 35)
(custom_animation elite_boss_cine characters\elite\elite stand sword evade-left true)
(sleep 40)
(camera_set cine_g_6.3 150)
(effect_new tele cine_g_tele3)
(sleep 17)
(object_destroy elite_boss_cine)
(sleep 150)
(object_teleport brandon bd)
(recording_kill brandon)
(camera_set cine_g_9.1 0)
(camera_set cine_g_9.2 200)
(object_teleport may bdm_may)
(sleep 50)
(effect_new tele bdm_elite_tele)
(sleep 30)
(object_create_anew elite_boss_cine)
(object_create_anew sword)
(objects_attach elite_boss_cine right hand elite sword )
(object_teleport elite_boss_cine bdm_elite)
(sleep 70)
(recording_play elite_boss_cine bdm_elite)
(recording_play may bdm_may)
(camera_set cine_g_11.1 0)
(camera_set cine_g_11.2 120)
(sleep 60)
(camera_set cine_g_11.3 120)
(sleep 110)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation elite_boss_cine body)
(sleep 25)
(object_destroy elite_boss_cine)
(sleep 40)
(camera_set cine_g_12.1 0)
(sleep 122)
(custom_animation brandon tm\levels\tmc_d\anim\cine_g\brandon\brandon b_dies true)
(sleep 5)
(camera_set cine_g_13.1 0)
(camera_set cine_g_13.2 150)
(sleep 15)
(object_create_anew elite_boss_cine)
(object_create_anew sword)
(objects_attach elite_boss_cine right hand elite sword )
(object_teleport elite_boss_cine bd1)
(custom_animation elite_boss_cine tm\levels\tmc_d\anim\cine_g\elite\elite e_stabbd true)
(sleep 50)
(sleep 20)
(sound_impulse_start sound\music\cstrng\cstrng3 none 1.00)
(sleep 20)
(sound_impulse_start h2\weapons\single\energy_sword\sounds\impact\impact_character none 1.00)
(sleep 30)
(camera_set cine_g_10.1 0)
(camera_set cine_g_10.2 200)
(sleep 39)
(sound_impulse_start sound\dialog\elite\conditional\combat2\exclamations\berserk none 1.00)
(sleep 41)
(effect_new tele bd1_teleporter)
(sleep 35)
(object_destroy elite_boss_cine)
(object_create_anew may)
(object_teleport may bd_mayfin)
(sleep 70)
(camera_set cine_g_14.1 0)
(sound_looping_start sound\halo2\music\ben\ben none 1.00)
(sleep 30)
(effect_new tele cine_g_tele2)
(sleep 20)
(camera_set cine_g_14.2 200)
(sleep 20)
(object_create_anew boss_elite)
(object_teleport boss_elite bd_ger)
(sleep 50)
(custom_animation boss_elite characters\elite\elite stand pistol throw-grenade true)
(sleep 60)
(fade_out 1.00 1.00 1.00 50)
(sleep 50)
(object_destroy may)
(object_destroy brandon)
(object_create_anew brandon_dead_ingame)
(object_create_anew brandon_dead_shotgun)
(cinematic_stop)
(camera_control false)
(object_teleport trigger_boss boss_battle_start)
(fade_in 1.00 1.00 1.00 50)
(player_enable_input true)
(object_create_anew boss_elite)
(ai_attach boss_elite boss_battle/a)
(set start_boss true)
(wake cinematic_h)
(unit_set_enterable_by_player banshee false)
(game_save_totally_unsafe)
(sleep 40)
(effect_new pg bd_pg)
(effect_new pg bd_pg1)
(effect_new pg bd_pg2)))

(script startup void terminal4
(begin
(sleep_until
(=
(device_get_position terminal4) 1.00))
(player_enable_input false)
(camera_control true)
(show_hud false)
(camera_set sage_terminal_4_cut 0)
(cinematic_set_title terminal4)
(sleep
(* 45.00 30.00))
(cinematic_set_title terminal4_b)
(sleep
(* 50.00 30.00))
(cinematic_set_title terminal4_c)
(sleep
(* 25.00 30.00))
(camera_control false)
(show_hud true)
(player_enable_input true)))

(script continuous void bsp_switching_g_f
(begin
(sleep_until
(volume_test_objects g_to_f
(players)))
(switch_bsp 1)
(sleep_until
(volume_test_objects f_to_g
(players)))
(switch_bsp 0)))

(script dormant void brandon_manager_g
(begin
(sleep 5)
(object_create_anew brandon_g)
(object_create_anew scientist)
(object_cannot_take_damage scientist)
(ai_attach brandon_g enc_i_human/a)
(ai_attach scientist enc_i_human/a)
(ai_follow_target_players enc_i_human)))

(script dormant void ignore_turrets
(begin
(sleep 5)
(sleep_until turret_converted)
(ai_disregard
(ai_actors enc_j_covenant/dummy) true)))

(script continuous void teleport_moniter
(begin
(sleep_until
(or
(volume_test_objects left_teleporter
(players))
(volume_test_objects right_teleporter
(players))))
(deactivate_nav_point_flag teleport_moniter left_nav_tele)
(deactivate_nav_point_flag teleport_moniter right_nav_tele)
(fade_in 1.00 1.00 1.00 22)
(object_teleport
(unit
(list_get
(players) 0)) teleporter_exit)
(sound_impulse_start sound\sfx\ui\teleporter_activate none 1.00)
(sound_looping_stop sound\halo2\music\ben\ben)
(object_teleport boss_elite cine_g_elite)
(if
(not teleported)
(game_save_totally_unsafe))
(set teleported true)))

(script dormant void scientist_tele_convo
(begin
(ai_conversation sci_tele)))

(script dormant void ac_manager2
(begin
(sleep_until
(=
(device_get_position ac2_control) 1.00))
(set turret_converted true)
(ai_detach ac2)
(sleep 5)
(ai_attach ac2 enc_i_human/a)
(sleep 5)
(if
(not teleported)
(begin
(activate_nav_point_flag default ac_manager2 right_nav_tele 0.00)
(wake scientist_tele_convo)))))

(script dormant void ac_manager3
(begin
(sleep_until
(=
(device_get_position ac3_control) 1.00))
(set turret_converted true)
(ai_detach ac3)
(sleep 5)
(ai_attach ac3 enc_i_human/a)
(sleep 5)
(if
(not teleported)
(begin
(activate_nav_point_flag default ac_manager3 left_nav_tele 0.00)
(wake scientist_tele_convo)))))

(script dormant void convo_g
(begin
(sleep 15)
(ai_conversation convo_g)
(sleep 1430)
(effect_new bigasssplosion sage_expl4)
(effect_new bigasssplosion sage_expl2)
(effect_new bigasssplosion sage_expl3)
(sleep 40) convo_g
(player_effect_start
(real_random_range 0.85 1.05) 1.00)
(sleep 50)
(player_effect_stop
(real_random_range 1.50 2.50))
(sleep_until
(or
(volume_test_objects spawn_needlers_right
(players))
(volume_test_objects spawn_sentinels_left_2
(players))))
(game_save_no_timeout)
(ai_conversation convo_g_mac)
(sleep 300)
(effect_new bigasssplosion sage_expl4)
(effect_new bigasssplosion sage_expl2)
(effect_new bigasssplosion sage_expl3) convo_g
(player_effect_start
(real_random_range 0.85 1.05) 1.00)
(sleep 50)
(player_effect_stop
(real_random_range 1.50 2.50))
(sleep_until
(volume_test_objects spawn_needlers_right
(players)))
(sleep 300)
(effect_new bigasssplosion sage_expl4)
(effect_new bigasssplosion sage_expl2)
(effect_new bigasssplosion sage_expl3) convo_g
(player_effect_start
(real_random_range 0.85 1.05) 1.00)
(sleep 50)
(player_effect_stop
(real_random_range 1.50 2.50))
(sleep 300)
(effect_new bigasssplosion sage_expl4)
(effect_new bigasssplosion sage_expl2)
(effect_new bigasssplosion sage_expl3) convo_g
(player_effect_start
(real_random_range 0.85 1.05) 1.00)
(sleep 220)
(player_effect_stop
(real_random_range 1.50 2.50))))

(script dormant void music_manager
(begin
(sound_looping_start levels\c40\music\c40_08 none 1.00)
(sleep_until
(volume_test_objects end_c40_08
(players)))
(set sage_ingame_battle true)
(sound_looping_stop levels\c40\music\c40_08)
(sleep 50)
(sound_looping_start sound\halo2\music\ben\ben none 1.00)
(sleep_until
(volume_test_objects ben_alt
(players)))
(sound_looping_set_alternate sound\halo2\music\ben\ben true)))

(script dormant void delay_initial_drones
(begin
(sleep 400)
(ai_place enc_k_drones/initial)))

(script dormant void drones_right
(begin
(sleep 150)
(ai_place enc_k_drones/right_1)))

(script dormant void moniter_lightbridge_right
(begin
(sleep_until
(=
(device_get_position g_right_bridge) 1.00))
(object_destroy g_bridge_right)
(sleep 1)
(ai_braindead enc_k_covenant/right_wing_2_lightbridge true)
(sleep 5)
(ai_braindead enc_k_covenant/right_wing_2_lightbridge false)))

(script dormant void moniter_lightbridge_left
(begin
(sleep_until
(=
(device_get_position g_left_bridge) 1.00))
(sleep 10)
(object_create sparks_left)))

(script dormant void obj3
(begin
(hud_set_objective_text obj3)
(show_hud_help_text true)
(hud_set_help_text obj3)
(sleep 300)
(show_hud_help_text false)))

(script dormant void banshee_moniter
(begin
(sleep 10)
(ai_place enc_k_banshee)
(sleep 60)
(vehicle_load_magic enc_k_banshee driver
(ai_actors enc_k_banshee/banshee_driver))
(sleep 120)
(ai_disregard enc_k_banshee true)))

(script dormant void end_wing_booleans
(begin
(sleep_until
(or
(volume_test_objects spawn_bridge_g_right
(players))
(volume_test_objects spawn_sentinels_left
(players))))
(set end_wing_1 true)
(sleep_until
(or
(volume_test_objects spawn_sentinels_fight3
(players))
(volume_test_objects spawn_sentinels_right
(players))))
(set end_wing_2 true)
(sleep_until
(or
(volume_test_objects spawn_needlers_right
(players))
(volume_test_objects spawn_sentinels_left_2
(players))))
(set end_wing_3 true)
(sleep 100)
(set end_wing_4 true)))

(script dormant void right_side_moniter
(begin
(wake end_wing_booleans)
(sleep_until end_wing_1)
(ai_place enc_k_covenant/right_wing_2_lightbridge)
(ai_place enc_j_sentinels/right_v_drones)
(wake drones_right)
(sleep_until end_wing_2)
(ai_place enc_j_sentinels/right_assault)
(ai_place enc_k_covenant/right_wing_4)
(ai_place enc_k_covenant/right_wing_7)
(sleep_until end_wing_3)
(ai_place enc_k_covenant/right_wing_5)
(sleep 90)
(ai_place enc_k_covenant/right_wing_8)
(vehicle_load_magic c_drop_right driver
(ai_actors enc_k_covenant/right_wing_8))
(ai_place enc_k_covenant/right_turret)
(ai_place enc_j_sentinels/right_enforcer)))

(script dormant void left_side_moniter
(begin
(wake end_wing_booleans)
(sleep_until end_wing_1)
(ai_place enc_j_sentinels/left_assault)
(ai_place enc_k_covenant/left_wing_2_wreckage)
(sleep_until end_wing_2)
(ai_place enc_j_sentinels/left_fight_3)
(sleep_until end_wing_3)
(ai_place enc_j_sentinels/left_assault_2)
(ai_place enc_k_covenant/left_wing_4_supports)
(sleep_until end_wing_4)
(ai_place enc_k_covenant/left_wing_5)
(wake banshee_moniter)))

(script dormant void shield_corridor_support
(begin
(sleep 30)
(fade_in 1.00 1.00 1.00 30)
(sleep 120)
(device_set_power sage_bef_door 0.00)
(sleep 15)
(wake convo_g)
(wake music_manager)
(wake ac_manager2)
(wake ac_manager3)
(object_create_anew ac2)
(object_create_anew ac3)
(object_create_anew c_drop_right)))

(script startup void shield_corridor
(begin
(object_destroy destroy_sage_beam)
(fade_out 1.00 1.00 1.00 0)
(sleep_until
(volume_test_objects f_to_g
(players)))
(device_group_set sage_pos 1.00)
(game_save)
(ai_allegiance human player)
(ai_allegiance human flood)
(ai_allegiance player flood)
(ai_allegiance flood covenant)
(wake brandon_manager_g)
(device_set_position sage_bef_door 0.00)
(wake shield_corridor_support)
(ai_place enc_i_covenant)
(ai_erase enc_i_covenant/rear_guard)
(sleep_until
(volume_test_objects spawn_boss_guards1
(players)))
(ai_place enc_i_covenant/rear_guard)
(ai_attach ac2 enc_j_covenant/dummy)
(ai_attach ac3 enc_j_covenant/dummy)
(sleep_until
(volume_test_objects end_c40_08
(players)))
(cinematic_set_title finalr)
(wake obj3)
(ai_place enc_j_sentinels/central_assault)
(ai_place enc_j_sentinels/right_playfight)
(ai_place enc_j_sentinels/left_playfight)
(ai_place enc_j_sentinels/left_playfight_ac3)
(ai_place enc_k_covenant/right_wing_1)
(ai_place enc_k_covenant/central_turret)
(ai_place enc_k_covenant/central_defense)
(ai_place enc_k_covenant/right_wing_3)
(ai_place enc_k_covenant/left_wing_1)
(ai_place enc_k_covenant/left_wing_3)
(vehicle_load_magic g_turret_1 gunner
(ai_actors enc_k_covenant/central_turret))
(wake moniter_lightbridge_right)
(wake moniter_lightbridge_left)
(wake delay_initial_drones)
(wake right_side_moniter)
(wake left_side_moniter)))

(script startup void save_f_start
(begin
(sleep_until
(volume_test_objects save_f_start
(players)))
(game_save_no_timeout)))

(script startup void cheat_to_g
(begin
(if cheat_to_g
(begin
(switch_bsp 1)
(object_teleport cheat_to_g cheat_to_g_flag)
(sleep 5)
(sound_looping_stop tm\sounds\music\rythmshad\rythmshad)
(sleep 250)
(sound_looping_stop tm\sounds\music\rythmshad\rythmshad)
(sleep 50)
(sound_looping_stop tm\sounds\music\rythmshad\rythmshad)))))

(script continuous void monitor_f_advance
(begin
(sleep_until
(or
(volume_test_objects spawn_needlers_right
(players))
(volume_test_objects spawn_sentinels_left_2
(players))))
(if
(volume_test_objects spawn_needlers_right
(players))
(set migrate_humans_right true)
(set migrate_humans_left true))
(sleep 350)
(if migrate_humans_right
(begin
(ai_detach brandon_g)
(ai_detach scientist)
(ai_attach brandon_g enc_i_human_right/a)
(ai_attach scientist enc_i_human_right/a)
(sleep 10)
(ai_follow_target_players enc_i_human_right)))
(if migrate_humans_left
(begin
(ai_detach brandon_g)
(ai_detach scientist)
(ai_attach brandon_g enc_i_human_left/a)
(ai_attach scientist enc_i_human_left/a)
(sleep 10)
(ai_follow_target_players enc_i_human_left)))
(sleep_until
(volume_test_objects teleport_brandon_scientist
(players)))
(game_save)
(object_teleport brandon_g teleporter_exit)
(ai_detach brandon_g)
(ai_attach brandon_g enc_i_human_top/a)
(ai_follow_target_players enc_i_human_top)
(sleep 120)
(object_teleport scientist teleporter_exit)
(ai_detach scientist)
(ai_attach scientist enc_i_human_top/a)
(ai_follow_target_players enc_i_human_top)))