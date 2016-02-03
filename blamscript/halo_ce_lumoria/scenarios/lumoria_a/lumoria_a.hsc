(global bool cheat_to_ar false)

(global bool canjump false)

(global bool notyetpassedbendenca true)

(global bool canrespawnodsta false)

(global bool base_passed false)

(global bool legitbridgereached false)

(global bool reachedbeforedropships false)

(global bool reachedafterdropships false)

(global bool can_loop false)

(global bool passedmoveup false)

(global short shadowtimer 0)

(global bool starttimer false)

(global long global_delay_music
(* 30.00 300.00))

(global long global_delay_music_alt
(* 30.00 300.00))

(global bool play_music_ar false)

(global bool play_music_ar_alt false)

(global bool drones false)

(global bool jackals_passed false)

(global bool jackalsdead false)

(global bool cheat_to_boss false)

(global effect tele cinematics\effects\teleportation\teleportation)

(global effect explosion_med_no weapons\plasma_cannon\effects\explosion)

(global effect explosion_large_no weapons\plasma grenade\effects\explosion)

(global bool space_done false)

(script static unit player0
(begin
(unit
(list_get
(players) 0))))

(script dormant void odst_commander
(begin
(sleep 600)
(ai_command_list_advance enc_a_human)
(sleep_until
(or canjump
(and
(>
(ai_living_count enc_a_covenant/bend_reinforcements) 0)
(<=
(+
(ai_living_count enc_a_covenant/main_encounter)
(ai_living_count enc_a_covenant/bend_reinforcements)) 2.00))))
(ai_command_list_advance enc_a_human)
(sleep 150)
(ai_command_list_advance enc_a_human)
(ai_follow_target_players enc_a_human)
(sleep 300)
(ai_command_list_advance enc_a_human)
(ai_follow_target_players enc_a_human)))

(script static void getodstoutofturretifneeded
(begin
(sleep_until
(=
(ai_living_count enc_a_covenant) 0))
(ai_vehicle_enterable_disable enc_a_turret1)
(vehicle_unload enc_a_turret1 )
(sleep 60)
(ai_follow_target_players enc_a_human)))

(script dormant void getodstoutturretfinally
(begin getodstoutturretfinally))

(script dormant void waitforbend
(begin
(sleep_until
(<=
(ai_living_count enc_a_covenant/main_encounter) 2))
(ai_place enc_a_covenant/bend_reinforcements) waitforbend))

(script continuous void check_base
(begin
(if
(volume_test_objects advance_brandon_to_base
(players))
(begin
(set base_passed true)
(ai_place enc_b_covenant/interior_surprise_jackals)
(sleep_until
(= 1.00 0.00))))))

(script continuous void death_gorge
(begin
(sleep_until
(volume_test_objects kill_player_c
(players)))
(unit_kill
(unit
(list_get
(players) 0)))))

(script dormant void deactivatehelpbrandon
(begin
(sleep 360)
(show_hud_help_text false)))

(script dormant void enc_b_jackal_stop
(begin
(sleep 60)
(ai_command_list_advance enc_b_covenant/ledge_jackals)))

(script dormant void tmc_a_enc_b
(begin
(sleep_until
(or
(volume_test_objects spawn_enc_b
(players))
(volume_test_objects spawn_enc_b_bis
(players))) 5)
(ai_place enc_b_quadwings)
(ai_place butterfly_a)
(ai_place enc_b_brandon)
(ai_playfight enc_b_brandon/brandon true)
(object_cannot_take_damage
(ai_actors enc_b_brandon))
(unit_impervious
(ai_actors enc_b_brandon) true)
(ai_place enc_b_covenant)
(ai_erase enc_b_covenant/interior_surprise_jackals)
(ai_erase enc_b_covenant/turret_elite)
(ai_playfight enc_b_covenant/play_fighters true)
(wake enc_b_jackal_stop)
(object_create_anew dropship1)
(object_teleport dropship1 dropship)
(custom_animation dropship1 tm\tmc_a_dropships\tmc_a_dropships dropship2 true)
(sleep 30)
(hud_set_objective_text obj1)
(show_hud_help_text true)
(hud_set_help_text obj1)
(activate_team_nav_point_object default player
(list_get
(ai_actors enc_b_brandon/brandon) 0) 1.00)
(wake deactivatehelpbrandon)
(sleep_until
(or
(<=
(ai_living_count enc_b_covenant/play_fighters) 4)
(<=
(ai_living_count enc_b_covenant/center_squad_to_player_attacker) 1)
(<=
(ai_living_count enc_b_covenant/tower_defenders) 4)))
(sound_looping_start sound\halo2\music\peril\peril none 1.00)
(sound_looping_set_alternate sound\halo2\music\peril\peril true)
(deactivate_team_nav_point_object player
(list_get
(ai_actors enc_b_brandon/brandon) 0))
(ai_place enc_b_covenant/turret_elite)
(ai_playfight enc_b_covenant/play_fighters false)
(ai_playfight enc_b_brandon false)
(unit_impervious
(ai_actors enc_b_brandon) false)
(ai_maneuver enc_b_brandon/move1)
(sleep 50)
(ai_go_to_vehicle enc_b_covenant/turret_elite enc_b_turret1 gunner)
(sleep_until base_passed)
(ai_maneuver enc_b_brandon/move2)
(game_save)
(sleep 50)
(ai_conversation down_tunnel)
(sound_looping_set_alternate sound\halo2\music\peril\peril true)))

(script dormant void stop_disregard
(begin
(if
(not canrespawnodsta)
(sleep_until
(volume_test_objects kill_if_not_yet_inside
(list_get
(ai_actors enc_b_odst_clones/brandon) 0)))
(begin
(sleep_until
(and
(volume_test_objects kill_if_not_yet_inside
(list_get
(ai_actors enc_b_odst_clones/brandon) 0))
(volume_test_objects kill_if_not_yet_inside
(list_get
(ai_actors enc_b_odst_clones/odst_a) 0))))))
(ai_set_blind enc_b_odst_clones false)
(ai_follow_target_players enc_b_odst_clones)))

(script continuous void death_bridge_b
(begin
(sleep_until
(volume_test_objects kill_if_not_yet_inside
(players)))
(sleep 60)
(if
(= legitbridgereached false)
(unit_kill
(unit
(list_get
(players) 0))))))

(script continuous void death_cave
(begin
(sleep_until
(volume_test_objects kill_cavedrop
(players)))
(unit_kill
(unit
(list_get
(players) 0)))))

(script startup void advance_interior_enc_b
(begin
(sleep_until
(volume_test_objects proceed_with_odst
(players)))
(ai_conversation bridge_a)
(game_save_totally_unsafe)
(object_create_anew dropship1)
(object_teleport dropship1 dropship)
(custom_animation dropship1 tm\tmc_a_dropships\tmc_a_dropships dropship1 true)
(sound_looping_stop sound\halo2\music\peril\peril)
(if
(>
(ai_living_count enc_a_human) 0)
(set canrespawnodsta true))
(ai_erase enc_b_brandon)
(ai_erase enc_a_human)
(ai_place enc_b_odst_clones/brandon)
(object_cannot_take_damage
(ai_actors enc_b_odst_clones/brandon))
(if canrespawnodsta
(ai_place enc_b_odst_clones/odst_a))
(ai_set_blind enc_b_odst_clones true)
(sleep_until
(volume_test_objects continue_inside
(players)))
(ai_command_list_advance enc_b_odst_clones)
(sleep_until
(volume_test_objects kill_if_not_yet_inside
(players)))
(set legitbridgereached true)
(sound_looping_start tm\sounds\music\glue\d_full\d_full none 1.00)
(ai_place enc_c_covenant/initial_rushersa)
(ai_place enc_c_covenant/initial_rushersb)
(ai_magically_see_players enc_c_covenant/initial_rushersa)
(ai_magically_see_players enc_c_covenant/initial_rushersb)
(ai_command_list_advance enc_b_odst_clones)
(wake stop_disregard)
(sleep_until
(or
(=
(ai_living_count enc_c_covenant) 0)
(volume_test_objects continue_bridge
(players))))
(ai_place enc_c_covenant/the_rest)
(ai_magically_see_players enc_c_covenant/the_rest)
(ai_command_list_advance enc_b_odst_clones)
(sleep_until
(volume_test_objects peril_stop
(players)))
(sound_looping_stop tm\sounds\music\glue\d_full\d_full)))

(script dormant void obj2_fade
(begin
(sleep 240)
(show_hud_help_text false)))

(script startup void pelican_incoming
(begin
(sleep_until
(volume_test_objects pelican_incoming
(players)))
(object_create_anew pelican)
(object_teleport pelican dropship)
(unit_set_enterable_by_player pelican false)
(object_create_anew warthog)
(vehicle_hover pelican true)
(ai_place enc_c_driver)
(ai_place enc_c_hog)
(vehicle_load_magic pelican p-riderlf
(ai_actors enc_c_hog/bridgecover))
(vehicle_load_magic pelican p-riderrf
(ai_actors enc_c_hog/bridgecover2))
(vehicle_load_magic pelican driver
(ai_actors enc_c_driver))
(vehicle_load_magic pelican cargo warthog)
(vehicle_hover pelican false)
(custom_animation pelican tm\levels\tmc_a\anim\hogcover_peli\hogcover_peli hogcover_peli true)
(sleep 200)
(hud_set_objective_text obj2)
(show_hud_help_text true)
(hud_set_help_text obj2)
(sleep 120)
(wake obj2_fade)
(sleep 60)
(ai_magically_see_encounter enc_c_hog enc_c_covenant)
(sleep_until
(=
(unit_get_custom_animation_time pelican) 1))
(object_destroy pelican)))

(script dormant void teleport_if_needed
(begin
(sleep_until
(volume_test_objects 2,3
(players)))
(sleep 30)
(ai_force_active enc_e_human_migration true)
(ai_teleport_to_starting_location_if_unsupported enc_e_human_migration)
(ai_follow_target_players enc_e_human_migration)))

(script dormant void redundancy
(begin
(sleep_until
(volume_test_objects 2,3
(players)))
(sleep 30)
(ai_migrate enc_d_human_migration enc_e_human_migration/a)
(ai_follow_target_players enc_e_human_migration)))

(script dormant void end_pelican1
(begin
(sleep_until
(<=
(unit_get_custom_animation_time pelican1) 0))
(object_destroy pelican1)
(sleep 100)
(object_destroy pelican1)))

(script dormant void gorge_banshee
(begin
(object_create gorge_banshee)
(ai_place enc_d_banshee)
(vehicle_load_magic gorge_banshee b-driver
(ai_actors enc_d_banshee/driver))
(object_teleport gorge_banshee gorge_banshee)))

(script dormant void obj3_fade
(begin
(sleep 300)
(show_hud_help_text false)))

(script dormant void gorge_continue
(begin
(sleep_until
(vehicle_test_seat warthog1 w-driver gorge_continue))
(hud_set_objective_text obj3)
(show_hud_help_text true)
(hud_set_help_text obj3)
(sleep 60)
(wake obj3_fade)
(game_save)
(wake gorge_banshee)
(sound_looping_start sound\halo2\music\perc_drums\perc_drums none 1.00)
(sleep 60)
(sound_looping_start tm\sounds\music\glue\nohi2\nohi2 none 1.00)
(sound_looping_set_scale tm\sounds\music\glue\nohi2\nohi2 0.70)
(sleep_until
(volume_test_objects enc_d_ghosts
(players)))
(sound_looping_stop sound\halo2\music\perc_drums\perc_drums)))

(script dormant void disregard_guards
(begin
(ai_disregard
(ai_actors enc_d/shield_guards1) true)
(ai_disregard
(ai_actors enc_d/shield_guards2) true)
(sleep 60)
(sleep_until
(=
(ai_living_count enc_d/wraith) 0))
(ai_disregard
(ai_actors enc_d/shield_guards1) false)
(ai_disregard
(ai_actors enc_d/shield_guards2) false)))

(script startup void gorge_continue_overhang
(begin
(sleep_until
(volume_test_objects start_gorge
(players)))
(ai_place enc_d/turret)
(object_create_anew enc_d_turret)
(vehicle_load_magic enc_d_turret gunner
(ai_actors enc_d/turret))
(ai_place enc_d/rock)
(sleep_until
(volume_test_objects enter_wraith
(players)))
(ai_place enc_d/across_bridge_jacks)
(ai_place enc_d/shield_guards1)
(ai_place enc_d/shield_guards2)
(ai_place enc_d/wraith)
(ai_go_to_vehicle enc_d/wraith enc_d_wraith driver)
(ai_magically_see_encounter enc_e_hog enc_d)
(wake disregard_guards)
(sleep_until
(volume_test_objects enc_d_ghosts
(players)))
(sleep 240)
(device_set_power ghost_blastdoor 1.00)
(device_set_position ghost_blastdoor 1.00)
(sleep 180)
(ai_place enc_d/ghost1)
(ai_place enc_d/ghost2)
(vehicle_load_magic enc_d_ghost1 driver
(ai_actors enc_d/ghost1))
(vehicle_load_magic enc_d_ghost2 driver
(ai_actors enc_d/ghost2))
(ai_magically_see_encounter enc_e_hog enc_d)
(sleep 240)
(device_set_power ghost_blastdoor 0.00)))

(script startup void exterior_wall
(begin
(sleep_until
(volume_test_objects e_migration
(players)))
(ai_migrate enc_d_human_migration enc_e_human_migration/a)
(ai_follow_target_players enc_e_human_migration)
(wake teleport_if_needed)
(sleep_until
(volume_test_objects enc_e
(players)))
(sound_looping_start sound\halo2\music\inamberclad1\in_amber_clad none 1.00)
(game_save_totally_unsafe)
(ai_place butterfly_c)
(ai_place enc_d_quadwings)
(ai_place e_jackals)
(ai_place e_main/main_a)
(ai_place e_main/main_b)
(ai_place e_main/main_c)
(ai_place e_main/e_turret)
(vehicle_load_magic e_turret gunner
(ai_actors e_main/e_turret))
(ai_place e_main/e_turret2)
(vehicle_load_magic e_turret2 gunner
(ai_actors e_main/e_turret2))
(wake redundancy)
(set reachedbeforedropships true)
(sleep_until
(or
(<=
(ai_living_count e_main) 2)
(=
(ai_living_count e_main) 0)))
(set reachedafterdropships true)
(sleep 100)
(ai_place e_main/e_cov1)
(object_create_anew cov1)
(object_teleport cov1 cov)
(vehicle_load_magic cov1 passenger
(ai_actors e_main/e_cov1))
(custom_animation cov1 tm\levels\tmc_a\anim\bsp2\covshipdrops a_0_38_cov1 true)
(ai_conversation exterior_c)
(activate_team_nav_point_object default_red player cov1 1.00)
(sleep 250)
(begin_random
(begin
(vehicle_unload cov1 cd-passengerl01)
(sleep 5))
(begin
(vehicle_unload cov1 cd-passengerl02)
(sleep 5))
(begin
(vehicle_unload cov1 cd-passengerl03)
(sleep 5))
(begin
(vehicle_unload cov1 cd-passengerl04)
(sleep 5))
(begin
(vehicle_unload cov1 cd-passengerr01)
(sleep 5)))
(deactivate_team_nav_point_object player cov1)
(sleep 600)
(object_destroy cov1)
(sleep 50)
(ai_place e_main/e_cov3)
(object_create_anew cov3)
(object_teleport cov3 cov)
(vehicle_load_magic cov3 passenger
(ai_actors e_main/e_cov3))
(custom_animation cov3 tm\levels\tmc_a\anim\bsp2\covshipdrops a_0_38_cov3 true)
(activate_team_nav_point_object default_red player cov3 1.00)
(sleep 250)
(begin_random
(begin
(vehicle_unload cov3 cd-passengerl01)
(sleep 5))
(begin
(vehicle_unload cov3 cd-passengerl02)
(sleep 5))
(begin
(vehicle_unload cov3 cd-passengerl03)
(sleep 5))
(begin
(vehicle_unload cov3 cd-passengerl04)
(sleep 5))
(begin
(vehicle_unload cov3 cd-passengerr01)
(sleep 5))
(begin
(vehicle_unload cov3 cd-passengerr02)
(sleep 5)))
(deactivate_team_nav_point_object player cov3)
(sleep 300)
(object_destroy cov3)
(sleep 50)
(sleep 210)
(ai_place e_main/e_cov2)
(object_create_anew cov2)
(object_teleport cov2 cov)
(activate_team_nav_point_object default_red player cov2 1.00)
(vehicle_load_magic cov2 passenger
(ai_actors e_main/e_cov2))
(custom_animation cov2 tm\levels\tmc_a\anim\bsp2\covshipdrops a_0_38_cov2 true)
(sleep 250)
(begin_random
(begin
(vehicle_unload cov2 cd-passengerl01)
(sleep 5))
(begin
(vehicle_unload cov2 cd-passengerl02)
(sleep 5))
(begin
(vehicle_unload cov2 cd-passengerl03)
(sleep 5))
(begin
(vehicle_unload cov2 cd-passengerl04)
(sleep 5))
(begin
(vehicle_unload cov2 cd-passengerr01)
(sleep 5))
(begin
(vehicle_unload cov2 cd-passengerr02)
(sleep 5))
(begin
(vehicle_unload cov2 cd-passengerr03)
(sleep 5)))
(deactivate_team_nav_point_object player cov2)
(sleep 300)
(object_destroy cov2)
(sleep 80)
(sleep_until
(<=
(ai_living_count e_main) 3))
(object_create_anew warthog1)
(ai_place enc_e_hog)
(ai_place enc_d_driver)
(object_create_anew pelican1)
(object_teleport pelican1 cov)
(unit_set_enterable_by_player pelican1 false)
(vehicle_load_magic pelican1 cargo warthog1)
(vehicle_load_magic pelican1 driver
(ai_actors enc_d_driver))
(vehicle_load_magic pelican1 p-riderlf
(ai_actors enc_e_hog/passenger))
(vehicle_load_magic pelican1 p-riderrf
(ai_actors enc_e_hog/gunner))
(sleep 100)
(custom_animation pelican1 tm\levels\tmc_a\anim\bsp1\pelicans a_0_38_drophog true)
(sleep 30)
(ai_conversation exterior_c2)
(sleep 300)
(vehicle_unload pelican1 cargo)
(wake gorge_continue)
(sleep 120)
(vehicle_unload pelican1 p-rider)
(sound_looping_stop sound\halo2\music\inamberclad1\in_amber_clad)
(sleep 1)
(ai_go_to_vehicle enc_e_hog/passenger warthog1 passenger)
(ai_go_to_vehicle enc_e_hog/gunner warthog1 gunner)
(ai_go_to_vehicle enc_e_human_migration pelican1 p-rider)
(set can_loop true)
(ai_go_to_vehicle enc_e_human_migration pelican1 p-rider)
(ai_go_to_vehicle enc_e_hog/passenger warthog1 passenger)
(ai_go_to_vehicle enc_e_hog/gunner warthog1 gunner)
(sleep_until
(= can_loop false))
(unit_custom_animation_at_frame pelican1 tm\levels\tmc_a\anim\bsp1\pelicans a_0_38_drophog true 1500)
(wake end_pelican1)
(game_save)
(ai_go_to_vehicle enc_e_hog/passenger warthog1 passenger)
(ai_go_to_vehicle enc_e_hog/gunner warthog1 gunner)))

(script continuous void loop_anim_pelican
(begin
(sleep_until can_loop)
(if
(!=
(ai_going_to_vehicle pelican1) 0)
(unit_custom_animation_at_frame pelican1 tm\levels\tmc_a\anim\bsp1\pelicans a_0_38_drophog true 1000)
(set can_loop false))))

(script dormant void advance_badboys
(begin
(sleep 360)
(ai_maneuver enc_f/badboy-jackalls)
(sleep 60)
(ai_maneuver enc_f/badboy-jackalls)))

(script startup void enc_e_f_hog
(begin
(sleep_until
(volume_test_objects migrate_hog_e_f
(players)))
(ai_migrate enc_e_hog enc_f_hog/a)))

(script dormant void sentinel_elites
(begin
(sleep_until
(volume_test_objects sentinel_elites
(players)))
(ai_place enc_f/elite)
(ai_place enc_f_sentinels)
(ai_braindead enc_f_hog true)
(sleep_until
(<=
(ai_living_count enc_f_sentinels) 0))
(ai_braindead enc_f_hog false)))

(script dormant void bridge_controls
(begin
(sleep_until
(=
(device_get_position bridge_control) 1.00))
(object_create_anew light_bridge)
(fade_out 0.00 0.00 0.00 30)
(cinematic_start)
(device_set_position light_bridge 1.00)
(sound_looping_start tm\sounds\music\misc\open_fb none 1.00)
(show_hud false)
(sleep 30)
(ai_erase enc_f_sentinels)
(object_teleport
(unit
(list_get
(players) 0)) teleport_start_bridge)
(camera_control true)
(camera_set bridge1 0)
(object_create_anew may_bridge1)
(fade_in 0.00 0.00 0.00 100)
(object_cannot_take_damage may_bridge1)
(custom_animation may_bridge1 cinematics\animations\chief\level_specific\b30\b30 b30holomapshort true)
(sleep 125)
(object_destroy may_bridge1)
(object_teleport
(unit
(list_get
(players) 0)) teleport_end_bridge)
(camera_set bridge2 0)
(sleep 50)
(camera_set bridge3 110)
(cinematic_set_title switch)
(sleep 50)
(camera_set bridge4 150)
(sleep 50)
(camera_set bridge5 160)
(sleep 50)
(camera_set bridge6 160)
(sleep 50)
(camera_set bridge7 160)
(sleep 50)
(camera_set bridge8 150)
(sleep 40)
(camera_control false)
(fade_in 0.00 0.00 0.00 25)
(player_enable_input true)
(cinematic_stop)
(sleep 10)
(show_hud true)
(game_save)))

(script startup void fore_tunnels_bridge
(begin
(sleep_until
(volume_test_objects enc_f
(players)))
(sound_looping_stop tm\sounds\music\glue\nohi2\nohi2)
(game_save)
(object_destroy may_bridge1)
(ai_place enc_f/cargo)
(wake bridge_controls)
(sleep_until
(volume_test_objects convoelites
(players)))
(sound_looping_start levels\a50\music\a50_06 none 1.00)
(ai_place enc_f/elite_convo_room1)
(sleep_until
(volume_test_objects sleepers
(players)))
(ai_place enc_f/sleepers_wheepers)
(sleep_until
(volume_test_objects badboyjackalls
(players)))
(ai_place enc_f/badboy-jackalls)
(wake advance_badboys)
(sleep_until
(volume_test_objects sci_fi_stop
(players)))
(sound_looping_stop levels\a50\music\a50_06)
(wake sentinel_elites)))

(script dormant void fly_in_pelican
(begin
(object_create_anew odst_supreme)
(object_teleport odst_supreme abeyant_rev)
(unit_set_enterable_by_player odst_supreme false)
(ai_place peli_driver_e)
(vehicle_load_magic odst_supreme driver
(ai_actors peli_driver_e/driver))
(ai_place enc_h_human)
(object_cannot_take_damage
(ai_actors enc_h_human/odst_supreme))
(vehicle_load_magic odst_supreme p-riderlf
(ai_actors enc_h_human/odst_supreme))
(vehicle_load_magic odst_supreme p-riderrf
(ai_actors enc_h_human/odst_supreme2))
(unit_custom_animation_at_frame odst_supreme tm\levels\tmc_a\anim\pelicans anim true 250)
(sleep_until
(<=
(unit_get_custom_animation_time odst_supreme) 249))
(vehicle_unload odst_supreme )
(ai_conversation pelican_e2)
(ai_attack enc_h_human)
(sleep_until
(<=
(ai_living_count enc_h_covenant/right_forest) 1))
(ai_maneuver enc_h_human/odst)
(sleep_until
(<=
(ai_living_count enc_h_covenant/center_forest) 0))
(ai_maneuver enc_h_human/maneuver_a)))

(script dormant void control_marines
(begin
(sleep 60)
(sleep_until
(<=
(ai_living_count enc_h_covenant/center_forest) 3))
(ai_maneuver enc_h_marines/marines)
(sleep_until passedmoveup)
(ai_maneuver enc_h_marines/squad_b)
(sleep_until
(volume_test_objects move_odst_up
(players)))
(ai_maneuver enc_h_marines/squad_c)
(ai_magically_see_encounter enc_h_marines enc_h_covenant)))

(script dormant void summon_killers
(begin
(sleep_until
(volume_test_objects summon_killers
(players)))
(ai_place blockade_sentinels)))

(script continuous void updatetimer
(begin
(sleep_until starttimer)
(set shadowtimer
(+ shadowtimer 1.00))))

(script dormant void shadow_approach
(begin
(object_create_anew shadow)
(unit_set_enterable_by_player shadow false)
(wake summon_killers)
(ai_place enc_h_covenant/shadow_driver)
(ai_place enc_h_covenant/shadow_gunner)
(vehicle_load_magic shadow gunner
(ai_actors enc_h_covenant/shadow_gunner))
(vehicle_load_magic shadow driver
(ai_actors enc_h_covenant/shadow_driver))
(sleep 100)
(set starttimer true)
(sleep_until
(or
(>= shadowtimer 1500)
(<=
(+
(ai_living_count enc_h_covenant/shadow_driver)
(ai_living_count enc_h_covenant/shadow_gunner)) 0.00)))
(sleep 100)
(device_set_power structure_entrance 1.00)
(ai_place enc_h_covenant/shield_elite)
(sleep_until
(=
(ai_living_count enc_h_covenant/shield_elite) 0))
(set play_music_ar false)
(ai_conversation brandon_structure)))

(script dormant void obj4_fade
(begin
(sleep 300)
(show_hud_help_text false)))

(script static void music_ar_go
(begin
(sound_looping_start sound\music\perilous journey\perilous journey none 1.00)
(sleep_until
(or play_music_ar_alt
(not play_music_ar)) 1 global_delay_music)
(if play_music_ar_alt
(begin
(sound_looping_set_alternate sound\music\perilous journey\perilous journey true)
(sleep_until
(not play_music_ar) 1 global_delay_music)
(set play_music_ar_alt false)))
(set play_music_ar false)
(sound_looping_stop sound\music\perilous journey\perilous journey)))

(script dormant void music_ar
(begin
(sleep_until play_music_ar 1) music_ar))

(script dormant void outpostsupremest
(begin
(vehicle_unload warthog1 )
(unit_set_enterable_by_player warthog1 false)
(vehicle_unload enc_d_ghost1 )
(unit_set_enterable_by_player enc_d_ghost1 false)
(vehicle_unload enc_d_ghost2 )
(unit_set_enterable_by_player enc_d_ghost2 false)
(vehicle_unload enc_g_ghost )
(unit_set_enterable_by_player enc_g_ghost false)
(game_save_totally_unsafe)
(ai_migrate enc_g_hog enc_h_human_migration/a)
(ai_follow_target_players enc_h_human_migration)
(sleep 60)
(ai_follow_target_players enc_h_human_migration)
(sleep_until
(volume_test_objects start_supremest
(players)))
(wake music_ar)
(set play_music_ar true)
(sound_looping_stop tm\sounds\music\glue\nolow1\nowlow1)
(cinematic_set_title ar)
(ai_place e_butt)
(ai_migrate enc_h_human_migration enc_h_marines/marines)
(ai_attack enc_h_marines)
(ai_place enc_h_covenant/center_forest)
(ai_place enc_h_covenant/right_forest)
(ai_place enc_h_covenant/turret1)
(ai_place enc_h_covenant/turret2)
(ai_place enc_h_covenant/shields)
(vehicle_load_magic supreme_turret_1 gunner
(ai_actors enc_h_covenant/turret1))
(vehicle_load_magic supreme_turret_2 gunner
(ai_actors enc_h_covenant/turret2))
(wake fly_in_pelican)
(wake control_marines)
(sleep_until
(volume_test_objects start_supremest_2
(players)))
(game_save)
(set passedmoveup true)
(set play_music_ar_alt true)
(hud_set_objective_text obj4)
(show_hud_help_text true)
(hud_set_help_text obj4)
(sleep 60)
(wake obj4_fade)
(ai_place enc_h_covenant/middle_slope)
(ai_place enc_h_covenant/top_gunners)
(ai_vehicle_enterable_actors supreme_turret_1 enc_h_covenant/top_gunners)
(ai_vehicle_enterable_actors supreme_turret_2 enc_h_covenant/top_gunners)
(sleep_until
(volume_test_objects move_odst_up
(players)))
(ai_place enc_h_covenant/extra_land_squad)
(ai_place enc_h_covenant/extra_land_jackals)
(ai_maneuver enc_h_human/maneuver_b)
(ai_magically_see_encounter enc_h_human enc_h_covenant)
(sleep_until
(volume_test_objects spawn_exit_structure
(players)))
(ai_magically_see_players enc_h_covenant/exit_structure)
(wake shadow_approach)
(sleep_until
(<=
(ai_living_count enc_h_covenant) 0))
(ai_maneuver enc_h_human/maneuver_c)
(ai_maneuver enc_h_marines/squad_d)
(sleep 120)
(if
(= false cheat_to_ar)
(game_save))))

(script dormant void enc_g_ghost
(begin
(object_create_anew enc_g_ghost)
(ai_place enc_g/ghost)
(vehicle_load_magic enc_g_ghost driver
(ai_actors enc_g/ghost))
(sleep 700)
(ai_command_list_advance enc_g/ghost)))

(script dormant void fly_over_pelican
(begin
(object_create_anew odst_supreme)
(object_teleport odst_supreme abeyant_rev)
(unit_set_enterable_by_player odst_supreme false)
(ai_place peli_driver_e)
(vehicle_load_magic odst_supreme driver
(ai_actors peli_driver_e/driver))
(sleep 120)
(custom_animation odst_supreme tm\levels\tmc_a\anim\pelicans anim true)
(sleep 40)
(ai_conversation pelican_e)
(sleep 150)
(object_destroy odst_supreme)))

(script dormant void glue_1
(begin
(sound_looping_start tm\sounds\music\misc\open_ex none 1.00)))

(script startup void scientist_exterior_valley_far
(begin
(sleep_until
(volume_test_objects 5,4
(players)))
(ai_migrate enc_f_hog enc_g_hog/a)
(sleep_until
(volume_test_objects 4,5
(players)))
(game_save)
(sleep_until
(volume_test_objects enc_g_spawn
(players)))
(ai_place butterfly_e/valley_far)
(ai_place e_birds/valley1)
(ai_place enc_g/grunts)
(wake enc_g_ghost)
(wake fly_over_pelican)
(wake glue_1)
(sleep_until
(volume_test_objects enc_g_jackals
(players)))
(ai_place enc_g/jackals)
(ai_place e_birds)
(sleep_until
(volume_test_objects exit_hog
(players)))
(wake outpostsupremest)
(object_create_anew supreme_turret_2)
(object_create_anew supreme_turret_1)))

(script startup void inside_wall
(begin
(sleep_until
(volume_test_objects mor2
(players)))
(sound_looping_start levels\b40\music\b40_02 none 1.00)
(ai_migrate enc_b_odst_clones enc_d_human_migration/a)
(ai_follow_target_players enc_d_human_migration)
(sleep_until
(volume_test_objects 0,2
(players)))
(game_save)
(ai_place enc_d_covenant/big_room)
(ai_place enc_d_covenant/aeriths_circle)
(ai_place enc_d_covenant/grunt)
(sleep 30)
(ai_force_active enc_d_human_migration true)
(ai_teleport_to_starting_location_if_unsupported enc_d_human_migration)
(ai_follow_target_players enc_d_human_migration)
(sleep_until
(volume_test_objects spawn_enc_d_jackals
(players)))
(ai_place enc_d_covenant/jackals_bend)
(ai_place enc_d_covenant/enc_d_turret)
(vehicle_load_magic enc_d_turret1 gunner
(ai_actors enc_d_covenant/enc_d_turret))
(sleep_until
(volume_test_objects spawn_enc_d_hallway
(players)))
(ai_place enc_d_covenant/hallway)
(ai_magically_see_players enc_d_covenant/enc_d_turret)
(sleep_until
(volume_test_objects dmusicstop
(players)))
(sound_looping_stop levels\b40\music\b40_02)))

(script dormant void manage_jackals
(begin
(sleep_until
(or
(and drones
(<=
(ai_living_count enc_i_drones) 3))
(volume_test_objects trigger_enc_i_jackals
(players))))
(sleep 120)
(ai_command_list_advance enc_i_covenant/hunterjackals)))

(script dormant void manage_jackal_trigger
(begin
(sleep_until
(volume_test_objects trigger_enc_i_jackals
(players)))
(set jackals_passed true)))

(script dormant void hunter_drones
(begin
(wake manage_jackals)
(wake manage_jackal_trigger)
(ai_place enc_i_covenant/hunters)
(ai_place enc_i_covenant/gunner2)
(ai_place enc_i_covenant/hunterjackals)
(vehicle_load_magic enc_i_turret2 gunner
(ai_actors enc_i_covenant/gunner2))
(ai_magically_see_players enc_i_covenant)
(sleep 180)
(ai_place enc_i_drones)
(ai_magically_see_players enc_i_drones)
(sleep 60)
(sleep_until
(>=
(ai_living_count enc_h_marines) 0))
(set drones true)
(sleep_until
(<=
(ai_living_count enc_i_drones) 3))
(ai_maneuver enc_i_covenant/hunters)))

(script dormant void migrateallies
(begin
(sleep 10)))

(script dormant void manage_marines
(begin
(sleep 60)
(if
(=
(ai_living_count enc_h_marines) 2)
(begin
(ai_erase enc_h_marines)
(ai_place enc_i_marines)))
(if
(=
(ai_living_count enc_h_marines) 1)
(begin
(ai_erase enc_h_marines)
(ai_place enc_i_marines/one_marine)))
(if
(=
(ai_living_count enc_h_human) 3)
(begin
(ai_erase enc_h_human)
(ai_place enc_i_human)))
(if
(=
(ai_living_count enc_h_human) 2)
(begin
(ai_erase enc_h_human)
(ai_place enc_i_human/one_marine)))
(object_cannot_take_damage
(ai_actors enc_i_human/one_marine))))

(script dormant void wakesentinels
(begin
(sleep_until
(=
(device_get_position unlock_sentinels) 1.00))
(ai_conversation movement)
(ai_place enc_i_sentinels)
(ai_magically_see_encounter enc_i_sentinels enc_i_covenant/hunters)))

(script dormant void advance_marines
(begin
(sleep 480)
(ai_maneuver enc_i_marines/move_across_bridge)))

(script dormant void teleport_if_needed2
(begin
(sleep_until
(volume_test_objects 6,7
(players)))
(sleep 30)
(ai_force_active enc_j_human true)
(ai_force_active enc_j_marines true)
(ai_teleport_to_starting_location_if_unsupported enc_j_human)
(ai_teleport_to_starting_location_if_unsupported enc_j_marines)))

(script dormant void boss_sentinels
(begin
(sleep_until
(volume_test_objects start_boss_sentinels
(players)))
(object_create_anew dropship_boss)
(object_teleport dropship_boss dropship_boss)
(custom_animation dropship_boss tm\dropship_boss\dropship_boss dropship_boss true)
(sleep 10)
(sleep_until
(= 1
(unit_get_custom_animation_time dropship_boss)))
(object_destroy dropship_boss)))

(script dormant void destroy_boss_ship
(begin
(sleep 10)
(sleep_until
(= 1
(unit_get_custom_animation_time dropship_boss)))
(object_destroy dropship_boss)))

(script dormant void third_floor_jackals
(begin
(sleep 60)
(sleep_until
(or
(<=
(+
(ai_living_count enc_k_covenant/second_floor_right)
(ai_living_count enc_k_covenant/second_floor_left)) 1.00)
(volume_test_objects spawn_third_floor
(players))))
(ai_place enc_k_covenant/third_floor_left)
(ai_place enc_k_covenant/third_floor_right)))

(script dormant void delaysentinels
(begin
(sleep 300)
(ai_place enc_k_sentinels)))

(script dormant void legendary_ending
(begin
(if
(= impossible
(game_difficulty_get_real))
(begin
(switch_bsp 9)
(sleep 50)
(fade_in 1.00 1.00 1.00 120)
(camera_set leg1 0)
(sleep 250)
(camera_set leg2 500)
(sleep 500)
(fade_out 1.00 1.00 1.00 0)
(camera_set leg3 0)
(fade_in 1.00 1.00 1.00 1)
(sound_looping_start tm\sounds\dialouge\future\future none 1.00)
(sleep 110)
(sleep 220)
(fade_out 0.00 0.00 0.00 50)
(sleep 50)
(map_name lumoria_b)))))

(script dormant void end_poodles
(begin
(sleep_until
(=
(ai_living_count enc_k_covenant/boss) 0))
(fade_out 1.00 1.00 1.00 60)
(sleep 50)
(ai_erase enc_k_human)
(ai_erase enc_k_marines)
(ai_erase enc_k_covenant)
(ai_erase enc_j_marines_cheat)
(ai_erase enc_j_human_cheat)
(object_teleport
(unit
(list_get
(players) 0)) teleport_end_scene1)
(sleep 100)
(camera_control true)
(ai_place end_scene)
(ai_place end_scene_sci)
(object_destroy shieldgen)
(ai_erase enc_k_covenant/boss)
(cinematic_start)
(camera_set final1 0)
(fade_in 1.00 1.00 1.00 120)
(sleep 120)
(camera_set final2 120)
(sleep 120)
(camera_set final_3_new 0)
(ai_command_list_advance end_scene)
(ai_command_list_advance end_scene_sci)
(ai_conversation end_scene_sci)
(sleep 300)
(camera_set final_md_4 0)
(sleep 160)
(camera_set final_5_new 0)
(sleep 100)
(camera_set v2_insideend_1.1 0)
(camera_set v2_insideend_1.2 300)
(sleep 200)
(camera_set v2_insideend_2.1 0)
(camera_set v2_insideend_2.2 200)
(sleep 200)
(camera_set final_5_new 0)
(sleep 100)
(object_create_anew dropship_boss)
(object_teleport dropship_boss dropship_boss)
(custom_animation dropship_boss tm\dropship_boss\dropship_boss dropship_boss true)
(wake destroy_boss_ship)
(sleep 80)
(camera_set final_6_new 0)
(sound_looping_start sound\sinomatixx_music\b30_extraction_music none 1.00)
(sleep 50)
(camera_set final_7 120)
(sleep 40)
(camera_set final_8_new 0)
(sleep 60)
(camera_set final_9 100)
(sleep 100)
(camera_set v2_in_1.1 0)
(camera_set v2_in_1.2 200)
(object_create_anew may2)
(object_teleport may2 v2_in_may)
(object_create_anew bra_end)
(object_teleport bra_end v2_in_bra)
(object_create_anew sci_end)
(object_teleport sci_end v2_in_sci)
(ai_attach bra_end h_cinematic)
(ai_attach sci_end h_cinematic)
(ai_attach may2 h_cinematic)
(unit_set_seat may2 stand)
(unit_set_seat bra_end stand)
(unit_set_seat sci_end stand)
(sleep 1)
(ai_command_list_by_unit bra_end v2_in_run_right)
(ai_command_list_by_unit sci_end v2_in_run_left)
(ai_command_list_by_unit may2 v2_in_run_left)
(sleep 14)
(effect_new explosion_med_no expl2)
(sleep 30)
(effect_new explosion_med_no expl1)
(sleep 30)
(sleep 25)
(camera_set v2_in_1.3 200)
(sleep 50)
(effect_new explosion_large_no expl4)
(sleep 100)
(camera_set v2_in_2.1 0)
(sleep 10)
(effect_new tele v2_in_ebosstele)
(sleep 25)
(object_create_anew elite_boss)
(object_teleport elite_boss v2_in_eboss)
(sleep 20)
(effect_new explosion_large_no expl5)
(sleep 100)
(effect_new tele v2_in_ebosstele)
(sleep 10)
(camera_set v2_in_3.1 0)
(object_destroy elite_boss)
(object_create_anew may2)
(object_teleport may2 v2_in_may_bat)
(recording_play may2 may_bat)
(sleep 40)
(effect_new tele eboss_bat_tele)
(sleep 15)
(object_create_anew elite_boss)
(object_teleport elite_boss v2_in_eboss_bat)
(recording_play elite_boss eboss_bat)
(sleep 20)
(camera_set v2_in_4.1 0)
(camera_set v2_in_4.2 100)
(sleep 100)
(effect_new_on_object_marker cinematics\effects\teleportation\teleportation elite_boss body)
(sleep 20)
(object_destroy elite_boss)
(sleep 20)
(camera_set v2_in_6.1 0)
(sleep 100)
(camera_set v2_in_7.1 0)
(object_create_anew may2)
(object_teleport may2 v2_may_end)
(ai_attach may2 h_cinematic)
(unit_set_seat may2 stand)
(sleep 1)
(ai_command_list_by_unit may2 v2_may_end)
(camera_set v2_in_7.2 200)
(sleep 100)
(fade_out 0.00 0.00 0.00 100)
(sleep 100)
(switch_bsp 8)
(object_destroy endlesshorizon)
(object_teleport
(unit
(list_get
(players) 0)) teleport_end_scene2)
(object_create_anew sci_end)
(object_create_anew bra_end)
(object_create_anew may2)
(object_teleport may2 may_end1)
(object_teleport bra_end bra_end1)
(object_teleport sci_end sci_end1)
(recording_play may2 may_end1)
(recording_play bra_end bra_end1)
(recording_play sci_end sci_end1)
(camera_set v2_final_1.1 0)
(sound_looping_start sound\music\lumoria_end\lumoria_end none 1.00)
(camera_set v2_final_1.2 300)
(fade_in 0.00 0.00 0.00 30)
(sleep 300)
(camera_set v2_final_2.1 0)
(recording_kill bra_end)
(recording_kill sci_end)
(recording_kill may2)
(object_teleport bra_end bra_end2)
(object_teleport sci_end sci_end2)
(object_teleport may2 may_end3)
(recording_play bra_end bra_end2)
(recording_play sci_end sci_end2)
(recording_play may2 may_end3)
(ai_place v2_final_cov)
(camera_set v2_final_2.2 200)
(sleep 200)
(camera_set v2_final_7.1 0)
(camera_set v2_final_7.2 200)
(sleep 75)
(object_create_anew elite_boss)
(sleep 10)
(effect_new tele eboss_run_tele)
(sleep 30)
(object_teleport elite_boss eboss_run)
(ai_attach elite_boss v2_final_cov)
(sleep 60)
(object_create_anew final_pelic)
(object_teleport final_pelic end_peli)
(custom_animation final_pelic tm\levels\tmc_a\anim\hogcover_peli\hogcover_peli endpeli_a true)
(sleep 3)
(recording_kill bra_end)
(recording_kill sci_end)
(recording_kill may2)
(object_teleport bra_end bra_end3)
(object_teleport sci_end sci_end3)
(object_teleport may2 may_end4)
(ai_attach bra_end h_cinematic)
(ai_attach sci_end h_cinematic)
(ai_attach may2 h_cinematic)
(unit_set_seat may2 stand)
(unit_set_seat bra_end stand)
(unit_set_seat sci_end stand)
(sleep 1)
(ai_command_list_by_unit bra_end v2_endrun)
(ai_command_list_by_unit sci_end v2_endrun)
(ai_command_list_by_unit may2 v2_endrun)
(sleep 15)
(sleep 20)
(camera_set v2_final_3.1 0)
(ai_erase v2_final_cov)
(object_destroy elite_boss)
(camera_set v2_final_3.2 181)
(sleep 181)
(camera_set v2_final_4.1 0)
(camera_set v2_final_4.2 200)
(ai_place v2_final_cov)
(object_create_anew elite_boss)
(object_teleport elite_boss eboss_run_2)
(ai_attach elite_boss v2_final_cov)
(sleep 121)
(unit_enter_vehicle sci_end final_pelic p-riderlm)
(sleep 24)
(unit_enter_vehicle bra_end final_pelic p-riderrf)
(sleep 21)
(sleep 14)
(camera_set v2_final_6.1 0)
(camera_set v2_final_6.2 150)
(sleep 60)
(unit_enter_vehicle may2 final_pelic p-riderlf)
(sleep 35)
(camera_set v2_final_5.1 0)
(camera_set v2_final_5.2 300)
(sleep 200)
(fade_out 0.00 0.00 0.00 300)
(sleep 300)
(player_enable_input false)
(sleep 100)
(map_name lumoria_b)
(cinematic_stop)))

(script dormant void finalencounter
(begin
(ai_place enc_k_covenant/bridge_grunts)
(ai_place enc_k_covenant/boss)
(object_cannot_take_damage
(ai_actors enc_k_covenant/boss))
(sleep_until
(volume_test_objects start_boss
(players)))
(sound_looping_start tm\sounds\music\divided\divided none 1.00)
(camera_control true)
(cinematic_start)
(camera_set boss1 0)
(fade_in 0.00 0.00 0.00 120)
(sleep 30)
(camera_set boss2 120)
(sleep 30)
(camera_set boss3 120)
(sleep 40)
(camera_set boss4 120)
(sleep 60)
(camera_set boss5 120)
(sleep 100)
(camera_set boss6 140)
(ai_command_list_advance enc_k_covenant/bridge_grunts)
(ai_command_list_advance enc_k_covenant/boss)
(sleep 40)
(camera_control false)
(sleep 20)
(cinematic_stop)
(show_hud true)
(game_save_totally_unsafe)
(ai_renew enc_j_marines)
(ai_renew enc_j_human)
(ai_migrate enc_j_marines enc_k_marines/a)
(ai_migrate enc_j_human enc_k_human/a)
(ai_follow_target_players enc_k_human)
(ai_follow_target_players enc_k_marines)
(ai_place enc_k_covenant/left_wing)
(ai_place enc_k_covenant/right_wing)
(if cheat_to_boss
(begin
(ai_migrate enc_j_marines_cheat enc_k_marines/a)
(ai_migrate enc_j_human_cheat enc_k_human/a)
(ai_follow_target_players enc_k_human)
(ai_follow_target_players enc_k_marines)))
(ai_renew enc_k_marines)
(ai_renew enc_k_human)
(sleep_until
(volume_test_objects start_boss_wings
(players)))
(wake delaysentinels)
(ai_place enc_k_covenant/second_floor_left)
(ai_place enc_k_covenant/second_floor_right)
(wake boss_sentinels)
(wake third_floor_jackals)
(sleep_until
(volume_test_objects spawn_third_floor
(players)))
(ai_place enc_k_covenant/third_floor_center)
(ai_place enc_k_covenant/turret)
(vehicle_load_magic j_turret gunner
(ai_actors enc_k_covenant/turret))
(sleep_until
(volume_test_objects spawn_fuel_rods
(players)))
(sound_looping_set_alternate sound\halo2\music\ben\ben true)
(sound_looping_set_alternate tm\sounds\music\divided\divided true)
(ai_place enc_k_covenant/fourth_floor_left)
(ai_place enc_k_covenant/fourth_floor_right)
(ai_command_list_advance enc_k_covenant/boss)
(sleep_until
(volume_test_objects 1on1cine
(players)))
(game_save)
(sleep 60)
(ai_command_list_advance enc_k_covenant/boss)
(object_can_take_damage
(ai_actors enc_k_covenant/boss))
(ai_place enc_k_drones)
(ai_disregard sci true)
(ai_disregard
(ai_actors enc_k_covenant/boss) true)
(ai_disregard
(ai_actors enc_k_marines) true)
(ai_disregard
(ai_actors enc_k_human) true)
(ai_disregard
(ai_actors enc_j_marines) true)
(ai_disregard
(ai_actors enc_j_human) true)
(sound_looping_stop tm\sounds\music\divided\divided)
(sleep 100)
(sleep_until
(and
(=
(ai_living_count enc_k_covenant/boss) 0)
(=
(ai_living_count enc_k_drones) 0)))
(wake end_poodles)))

(script dormant void maneuverallies3
(begin
(sleep_until
(volume_test_objects maneuver_allies3
(players)))
(ai_maneuver enc_j_human/d)
(ai_maneuver enc_j_marines/d)
(wake finalencounter)))

(script dormant void covy_outpost_caves
(begin
(sleep_until
(volume_test_objects maneuver_allies
(players)))
(ai_maneuver enc_j_human/a)
(ai_maneuver enc_j_marines/a)
(sleep_until
(volume_test_objects enc_j_spawn
(players)))
(ai_place enc_j_covenant)
(object_create_anew g_turret)
(vehicle_load_magic g_turret gunner
(ai_actors enc_j_covenant/turret))
(sleep_until
(volume_test_objects maneuver_allies2
(players)))
(ai_place enc_j_enforcer)
(ai_disregard
(ai_actors enc_j_enforcer) true)
(ai_maneuver enc_j_human/b)
(ai_maneuver enc_j_marines/b)
(wake maneuverallies3)
(sleep_until
(<=
(ai_living_count enc_j_covenant) 5))
(ai_maneuver enc_j_human/c)
(ai_maneuver enc_j_marines/c)))

(script dormant void merc_line
(begin
(sleep 180)
(ai_conversation merc_line1)
(sleep 100)
(ai_renew enc_i_marines)
(ai_renew enc_i_human)
(ai_maneuver enc_i_human/move_up_ramp)
(ai_maneuver enc_i_marines/move_up_ramp)
(ai_maneuver enc_i_mercenary/escaped_mercenary)))

(script dormant void maneuver_human_f
(begin
(ai_maneuver enc_i_human/one_marine)
(ai_maneuver enc_i_human/rest)
(sleep 120)
(ai_maneuver enc_i_marines/one_marine)
(ai_maneuver enc_i_marines/rest)
(sleep_until
(volume_test_objects enc_i_spawn
(players)))
(ai_maneuver enc_i_human/go_down)
(ai_maneuver enc_i_marines/go_down)
(sleep 60)
(sleep_until
(<=
(ai_living_count enc_i_covenant/main) 2))
(ai_maneuver enc_i_human/move_to_bridge)
(ai_maneuver enc_i_marines/move_to_balcony)
(sleep_until
(and jackalsdead
(<=
(ai_living_count enc_i_covenant/jackals) 0)))
(game_save)
(ai_maneuver enc_i_human/move_across_bridge)
(wake advance_marines)
(sleep_until
(volume_test_objects flawed_legacy
(players)))
(wake wakesentinels)
(ai_maneuver enc_i_human/move_inside)
(ai_maneuver enc_i_marines/move_inside)
(sleep_until drones)
(sleep_until
(<=
(ai_living_count enc_i_drones) 2))
(ai_maneuver enc_i_human/engage_hunters)
(ai_maneuver enc_i_marines/engage_hunters)
(sleep 60)
(sleep_until
(and
(<=
(ai_living_count enc_i_covenant/hunters) 0)
(<=
(ai_living_count enc_i_covenant/hunter_charge) 0)))
(device_set_power locked_door_i 1.00)
(ai_place enc_i_mercenary)
(object_cannot_take_damage
(ai_actors enc_i_mercenary))
(sleep_until
(<=
(ai_living_count enc_i_covenant/hunterjackals) 3))
(ai_maneuver enc_i_human/engage_hunters2)
(ai_maneuver enc_i_marines/engage_hunters2)
(sleep_until
(and
(<=
(ai_living_count enc_i_covenant/hunterjackals) 0) jackals_passed))
(object_can_take_damage
(ai_actors enc_i_mercenary))
(wake merc_line)
(sleep_until
(volume_test_objects 7,6
(players)))
(ai_migrate enc_i_human enc_j_human/a)
(ai_migrate enc_i_marines enc_j_marines/a)
(ai_migrate enc_i_mercenary enc_j_marines/a)
(wake teleport_if_needed2)
(wake covy_outpost_caves)))

(script dormant void moremusic
(begin
(sleep 60)
(sound_looping_start sound\sinomatixx_music\d40_insertion_music none 1.00)))

(script startup void caves
(begin
(sleep_until
(volume_test_objects stairwell
(players)))
(wake manage_marines)
(sound_looping_start sound\sinomatixx_music\b30_ledge_music none 1.00)
(ai_place enc_i_covenant/gunner)
(ai_place enc_i_covenant/main)
(ai_set_blind enc_i_covenant true)
(vehicle_load_magic enc_i_turret gunner
(ai_actors enc_i_covenant/gunner))
(show_hud false)
(camera_control true)
(object_create_anew shaft)
(custom_animation shaft tm\bridge\shaft\shaft cyborgshaft true)
(object_teleport
(unit
(list_get
(players) 0)) stair_in)
(cinematic_start)
(camera_set stair1 0)
(fade_in 0.00 0.00 0.00 120)
(camera_set stair2 120)
(sleep 70)
(camera_set stair3 140)
(sleep 110)
(fade_out 0.00 0.00 0.00 60)
(sleep 20)
(sleep_until
(=
(unit_get_custom_animation_time shaft) 0))
(object_destroy shaft)
(object_teleport
(unit
(list_get
(players) 0)) stair_out)
(camera_control false)
(fade_in 0.00 0.00 0.00 60)
(cinematic_stop)
(show_hud true)
(sound_looping_stop sound\sinomatixx_music\b30_ledge_music)
(game_save)
(wake maneuver_human_f)
(sleep 200)
(sound_looping_start levels\c40\music\c40_08 none 0.50)
(wake moremusic)
(sleep_until
(volume_test_objects enc_i_spawn
(players)))
(game_save)
(ai_set_blind enc_i_covenant false)
(ai_place enc_i_covenant/balacony)
(sleep_until
(volume_test_objects enc_i_jackals
(players)))
(set jackalsdead true)
(ai_place enc_i_covenant/jackals)
(sleep_until
(volume_test_objects music_caves_stop1
(players)))
(sleep_until
(volume_test_objects flawed_legacy
(players)))
(wake hunter_drones)
(wake migrateallies)
(sound_looping_start tm\sounds\music\flawed_legacy\flawedlegacy none 1.00)
(sleep_until
(<=
(ai_living_count enc_i_covenant/hunterjackals) 0))
(sound_looping_stop tm\sounds\music\flawed_legacy\flawedlegacy)))

(script continuous void bsp_switching_0_2
(begin
(sleep_until
(volume_test_objects 2,0
(players)))
(switch_bsp 0)
(object_destroy endlesshorizon)
(object_destroy pelican)
(sleep_until
(volume_test_objects 0,2
(players)))
(switch_bsp 1)
(object_destroy endlesshorizon)
(object_destroy pelican)))

(script continuous void bsp_switching_2_3
(begin
(sleep_until
(volume_test_objects 3,2
(players)))
(switch_bsp 1)
(object_destroy endlesshorizon)
(object_destroy pelican)
(sleep_until
(volume_test_objects 2,3
(players)))
(switch_bsp 2)
(object_destroy endlesshorizon)
(object_destroy pelican)))

(script continuous void bsp_switching_3_4
(begin
(sleep_until
(volume_test_objects 3,4
(players)))
(switch_bsp 3)
(object_destroy endlesshorizon)
(object_destroy pelican)))

(script continuous void bsp_switching_4_5
(begin
(sleep_until
(volume_test_objects 4,5
(players)))
(switch_bsp 5)
(object_destroy endlesshorizon)
(object_destroy pelican)
(sleep_until
(volume_test_objects 5,4
(players)))
(switch_bsp 3)
(object_destroy endlesshorizon)
(object_destroy pelican)))

(script continuous void bsp_switching_5_6
(begin
(sleep_until
(volume_test_objects 5,6
(players)))
(switch_bsp 5)
(object_destroy endlesshorizon)
(object_destroy pelican)
(sleep_until
(volume_test_objects 6,5
(players)))
(switch_bsp 6)
(object_destroy endlesshorizon)
(object_destroy pelican)))

(script continuous void bsp_switching_6_7
(begin
(sleep_until
(volume_test_objects 6,7
(players)))
(switch_bsp 7)
(object_destroy endlesshorizon)
(object_destroy shadow)
(object_destroy pelican)
(object_create_anew sci)
(object_cannot_take_damage sci)
(sleep_until
(volume_test_objects 7,6
(players)))
(switch_bsp 6)
(object_destroy endlesshorizon)
(object_destroy shadow)
(object_destroy pelican)))

(script startup void quadwing_manager
(begin
(ai_place enc_a_quadwings)))

(script dormant void cheat_boss
(begin
(switch_bsp 7)
(ai_place enc_j_marines_cheat)
(ai_place enc_j_human_cheat)
(object_teleport cheat_boss cheat_start_boss)
(wake finalencounter)))

(script dormant void cheat_ar
(begin
(switch_bsp 5)
(ai_place enc_h_human_migration)
(object_teleport cheat_ar cheat_start_ar)
(wake outpostsupremest)))

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

(script dormant void space_movement
(begin
(camera_set intro11 0)
(sleep 1)
(camera_set intro22
(* 30.00
(+ 37.00 25.00 19.00)))
(sleep
(* 30.00
(+ 37.00 25.00 19.00)))
(fade_out 0.00 0.00 0.00 50)
(sleep 50)
(object_create endlesshorizon)
(camera_set intro33
(* 30.00 0.00))
(object_destroy_containing end2)
(fade_in 0.00 0.00 0.00 50)
(sleep 50)
(camera_set intro44 120)
(sleep 50)
(camera_set intro55 90)
(sleep 50)
(camera_set intro66 90)
(sleep 50)
(camera_set intro77 90)
(sleep 50)
(camera_set intro88 100)
(sleep 30)
(set space_done true)))

(script static void endless_horizon
(begin
(object_destroy endlesshorizon)
(switch_bsp 10)
(object_destroy_containing end2)
(camera_set intro11 0)
(sleep 1)
(sound_looping_start tm\sounds\music\space_op\space_op none 1.00)
(sleep 150)
(wake space_movement)
(cinematic_set_title intro1)
(sleep
(* 37.00 30.00))
(cinematic_set_title intro2)
(sleep
(* 25.00 30.00))
(cinematic_set_title intro3)
(sleep
(* 19.00 30.00))
(sleep 50)
(cinematic_set_title intro4)
(sleep
(* 6.00 30.00))
(cinematic_set_title intro5)
(sleep 75)
(fade_out 0.00 0.00 0.00 50)
(sound_looping_stop tm\sounds\music\space_op\space_op)
(sleep_until space_done)
(sleep 50)))

(script startup void startenca
(begin
(ai_vehicle_enterable_distance enc_a_turret1 10.00)
(ai_allegiance human player)
(ai_allegiance human flood)
(ai_allegiance player flood)
(ai_allegiance flood covenant)
(device_set_power structure_entrance 1.00)
(if cheat_to_boss
(begin
(wake cheat_boss)
(sleep_until
(= 0.00 1.00))))
(if cheat_to_ar
(begin
(wake cheat_ar)
(sleep_until
(= 0.00 1.00))))
(show_hud false)
(camera_control true)
(cinematic_start)
(if startenca
(begin startenca
(object_create_containing end2)
(object_destroy mayt2)
(object_destroy bren2)
(object_destroy bren3)
(object_destroy bren4)
(object_destroy mayt3)
(object_destroy s_cut_shee)
(switch_bsp 4)
(object_destroy endlesshorizon)
(sleep 50)
(device_set_power structure_entrance 0.00)
(object_teleport
(unit
(list_get
(players) 0)) may1_teleport_player)
(sound_looping_start tm\sounds\music\bat1\bat1 none 1.00)
(cinematic_set_title eh7)
(camera_set d1 0)
(fade_in 0.00 0.00 0.00 150)
(custom_animation may tm\bridge\may\may endless_bridge_1 true)
(custom_animation brendon tm\bridge\odst\odst brendon_bridge_1 true)
(sleep 150)
(camera_set d2 100)
(sleep 150)
(ai_conversation bridge_scene)
(sleep 48)
(object_create_anew mayt2)
(object_create_anew bren2)
(object_destroy may)
(object_destroy brendon)
(object_set_scale mayt2 1.07 0)
(custom_animation mayt2 tm\bridge\dratt\may\may maybridge2 true)
(custom_animation bren2 tm\bridge\dratt\brandon\brandonnew brenbridge2 true)
(camera_set d3 0)
(camera_set d4 230)
(sleep 390)
(camera_set d5 0)
(object_destroy bren2)
(object_create_anew bren3)
(object_set_scale mayt2 1.00 0)
(custom_animation mayt2 tm\bridge\dratt\may\may maybridge3 true)
(custom_animation bren3 tm\bridge\dratt\brandon\brandonnew newbren3 true)
(custom_animation o1 tm\bridge\odst\odst bridge_bunny1_2 false)
(custom_animation o2 tm\bridge\odst\odst bridge_bunny2_2 false)
(custom_animation o3 tm\bridge\odst\odst bridge_bunny3_2 false)
(sleep 0)
(camera_set d6 150)
(sleep 170)
(camera_set d7 0)
(sleep 60)
(sleep 110)
(object_create_anew mayt3)
(object_create_anew bren4)
(custom_animation mayt3 tm\bridge\dratt\may\may maybridge4 true)
(custom_animation bren4 tm\bridge\dratt\brandon\brandonnew brenbridge4 true)
(object_destroy mayt2)
(object_destroy bren3)
(custom_animation o1 tm\bridge\odst\odst bridge_bunny1_3 false)
(custom_animation o2 tm\bridge\odst\odst bridge_bunny2_3 false)
(custom_animation o3 tm\bridge\odst\odst bridge_bunny3_3 false)
(camera_set d13 0)
(sleep 50)
(camera_set d14 120)
(sleep 100)
(camera_set d15 100)
(sleep 98)
(fade_out 0.00 0.00 0.00 50)
(sleep 50)
(sound_looping_stop tm\sounds\music\bat1\bat1)
(sleep 50))) startenca
(fade_out 0.00 0.00 0.00 0)
(switch_bsp 0)
(sleep 50)
(cinematic_set_title ls8)
(sound_impulse_start tm\sounds\sfx\droppod\boom none 1.00)
(object_teleport
(unit
(list_get
(players) 0)) may1)
(game_save)
(sleep 150)
(custom_animation may2 tm\levels\tmc_a\anim\bsp0\may\may drop-pod kick false)
(scenery_animation_start drop_door tm\levels\tmc_a\anim\bsp1\droppod drop-door break)
(camera_set drop1 0)
(fade_in 0.00 0.00 0.00 150)
(sleep 50)
(camera_set drop2 110)
(sound_impulse_start sound\sfx\impulse\melee\melee_metal none 1.00)
(sleep 50)
(cinematic_set_title quiet)
(camera_set drop3 0)
(sleep 10)
(sound_impulse_start sound\sfx\impulse\melee\melee_metal none 1.00)
(sleep 60)
(sound_impulse_start sound\sfx\impulse\melee\melee_metal none 3.00)
(sleep 40)
(camera_set drop4 150)
(sleep 50)
(camera_set drop5 160)
(sleep 50)
(camera_set drop6 160)
(sleep 50)
(camera_set drop7 160)
(sound_impulse_start sound\sfx\impulse\footsteps\cyborg\grating\jump none 4.00)
(sleep 40)
(camera_set drop8 150)
(sleep 40)
(camera_set drop9 160)
(fade_out 0.00 0.00 0.00 100)
(sleep 40)
(camera_control false)
(fade_in 0.00 0.00 0.00 25)
(object_destroy may2)
(object_teleport
(unit
(list_get
(players) 0)) may2)
(ai_place enc_a_human)
(player_enable_input true)
(cinematic_screen_effect_start true)
(cinematic_screen_effect_set_convolution 1 1 3.00 0.00 7.00)
(cinematic_screen_effect_start false)
(game_save)
(sleep 60)
(sleep_until
(volume_test_objects spawn_enc_a_covenant
(players)) 5)
(sound_looping_start sound\music\walk_in_the_woods\walk_in_the_woods none 1.00)
(ai_place enc_a_covenant/jackal_sentry)
(ai_place enc_a_covenant/main_encounter)
(ai_place enc_a_covenant/enc_a_turret1)
(wake odst_commander)
(vehicle_load_magic enc_a_turret1 gunner
(ai_actors enc_a_covenant/enc_a_turret1))
(cinematic_stop)
(sleep 30)
(show_hud true)
(sleep 30)
(wake waitforbend)
(sleep_until
(volume_test_objects spawn_enc_a_bend
(players)) 5)
(set canjump true)
(sleep_until
(volume_test_objects checkpoint1
(players)) 5)
(set notyetpassedbendenca false)
(game_save)
(sound_looping_stop sound\music\walk_in_the_woods\walk_in_the_woods)
(wake getodstoutturretfinally)
(wake tmc_a_enc_b)))

(script startup void enc_a_extra_turret
(begin
(sleep_until
(and notyetpassedbendenca
(vehicle_test_seat enc_a_turret1 gt-gunner enc_a_extra_turret)))
(ai_place enc_a_covenant/turret_bend)))

(script startup void terminal_a
(begin
(sleep_until
(=
(device_get_position terminal_a) 1.00))
(player_enable_input false)
(camera_control true)
(show_hud false)
(camera_set terminal1 0)
(cinematic_set_title terminal1)
(sleep
(* 45.00 30.00))
(cinematic_set_title terminal1_b)
(sleep
(* 50.00 30.00))
(cinematic_set_title terminal1_c)
(sleep
(* 25.00 30.00))
(camera_control false)
(show_hud true)
(player_enable_input true)))

(script startup void terminal_b
(begin
(sleep_until
(=
(device_get_position terminal_b) 1.00))
(player_enable_input false)
(camera_control true)
(show_hud false)
(camera_set terminal2 0)
(cinematic_set_title terminal2_a)
(sleep
(* 25.00 30.00))
(cinematic_set_title terminal2_b)
(sleep
(* 50.00 30.00))
(cinematic_set_title terminal2_c)
(sleep
(* 65.00 30.00))
(cinematic_set_title terminal2_d)
(sleep
(* 65.00 30.00))
(cinematic_set_title terminal2_e)
(sleep
(* 55.00 30.00))
(cinematic_set_title terminal2_f)
(sleep
(* 35.00 30.00))
(camera_control false)
(show_hud true)
(player_enable_input true)))