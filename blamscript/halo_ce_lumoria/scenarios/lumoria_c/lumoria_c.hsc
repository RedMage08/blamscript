(global bool cheat_to_f false)

(global bool can_advance_elites false)

(global bool advance_tank_1 false)

(global bool tank_advance_bend false)

(global bool tank_advance_bend2 false)

(global bool tank_advance_bend3 false)

(global bool tank_advance_bend4 false)

(global bool tank_advance_bend5 false)

(global bool valley_tank_start_bool false)

(global bool h_chose_infantry_bool false)

(global bool tank_hack_2_bool false)

(global bool tank_go_left_bool false)

(global bool tank_go_right_bool false)

(global bool no_tunnel_ghosts false)

(global bool start_mac_rounds false)

(global bool no_cutscene_yet true)

(global bool advance_valley_hog false)

(global bool end_valley false)

(global bool end_courtyard_2_global false)

(global bool hog_timer_bool false)

(global bool ghost_timer_bool false)

(global bool timer2expired false)

(global bool timer3expired false)

(global bool valley_finished false)

(script static unit player0
(begin
(unit
(list_get
(players) 0))))

(script static void set_correct_scenery_transition
(begin
(object_set_permutation e1 boulder base02)
(object_set_permutation e2 boulder base03)
(object_set_permutation e3 boulder base01)
(object_set_permutation e4 boulder base02)
(object_set_permutation e5 boulder base00)
(object_set_permutation e6 boulder base03)
(object_set_permutation e7 boulder base00)
(object_set_permutation e8 boulder base01)
(object_set_permutation e9 boulder base00)
(object_set_permutation e10 boulder base02)
(object_set_permutation e11 boulder base03)
(object_set_permutation e12 boulder base00)
(object_set_permutation e13 boulder base02)
(object_set_permutation e14 boulder base00)
(object_set_permutation e15 boulder base01)
(object_set_permutation e16 boulder base00)
(object_set_permutation e17 boulder base01)
(object_set_permutation e18 boulder base02)
(object_set_permutation e19 boulder base03)
(object_set_permutation e20 boulder base00)
(object_set_permutation e21 boulder base01)
(object_set_permutation e22 boulder base02)
(object_set_permutation e23 boulder base03)
(object_set_permutation e24 boulder base00)
(object_set_permutation e25 boulder base01)
(object_set_permutation e26 boulder base03)
(object_set_permutation e27 boulder base02)
(object_set_scale redalder_large1 1.30 0)
(object_set_scale redalder_large2 2.00 0)
(object_set_scale redcedar_small1 0.55 0)
(object_set_scale redcedar_small2 0.75 0)
(object_set_scale redcedar_small3 0.30 0)
(object_set_scale e_alder1 1.30 0)
(object_set_scale e_alder2 1.40 0)
(object_set_scale e_cedar1 0.60 0)
(object_set_scale f_alder1 1.70 0)
(object_set_scale f_cedar11 1.50 0)
(object_set_scale f_cedar22 1.65 0)
(object_set_scale f_cedar33 1.35 0)
(object_set_scale f_cedar44 1.55 0)
(object_set_scale f_cedar55 1.40 0)
(object_set_scale f_alder22 1.50 0)
(object_set_scale e_alder3 1.60 0)
(object_set_scale fg_alder1 2.00 0)
(object_set_scale fg_cedar1 1.30 0)
(object_set_scale f_alder11 1.40 0)
(object_set_scale f_alder2 1.60 0)
(object_set_scale f_alder3 1.70 0)))

(script static void optimise_f_hill
(begin
(object_destroy_containing f_del)
(object_destroy_containing redcedar_small)
(object_destroy_containing f_tree_hill)
(object_destroy_containing f_cedar)
(object_destroy_containing f_lower_shrub)
(object_destroy_containing f_lower_tree)))

(script dormant void cheat_to_f_script
(begin
(if cheat_to_f
(begin
(unit_enter_vehicle cheat_to_f_script player_tank_vb g-driver)
(ai_detach brandon)
(sleep 1)
(ai_attach brandon enc_e_human)
(ai_follow_target_players enc_e_human)
(object_teleport brandon cheat_to_f_flag)
(sleep 5)
(sound_looping_stop tm\sounds\music\rythmshad\rythmshad)
(sleep 250)
(sound_looping_stop tm\sounds\music\rythmshad\rythmshad)
(sleep 50)
(sound_looping_stop tm\sounds\music\rythmshad\rythmshad)))))

(script dormant void prison_doors
(begin
(sleep_until
(=
(device_get_position prison_control) 1.00))
(sleep 50)
(object_destroy prison_door)
(sleep 30)
(ai_braindead enc_e_human_prisoners false)
(ai_conversation marine_e)
(ai_follow_target_players enc_e_human)
(ai_follow_target_players enc_e_human_prisoners)))

(script dormant void obj1
(begin
(hud_set_objective_text obj1)
(show_hud_help_text true)
(hud_set_help_text obj1)
(sleep 300)
(show_hud_help_text false)))

(script dormant void escape_music
(begin
(sleep 20)
(sound_looping_start tm\sounds\music\rythmshad\rythmshad none 1.00)
(sleep_until
(or
(volume_test_object end_escape_music_e escape_music)
(=
(ai_living_count enc_e_sentinels) 0)))
(sound_looping_stop tm\sounds\music\rythmshad\rythmshad)))

(script startup void tmc_c_start
(begin
(fade_out 1.00 1.00 1.00 0)
(device_set_position sage_control 1.00)
(ai_allegiance human player)
(ai_allegiance human flood)
(ai_allegiance player flood)
(ai_place enc_e_ambient)
(ai_allegiance flood covenant)
(object_create_anew brandon)
(object_cannot_take_damage brandon)
(player_add_equipment tmc_c_start start true)
(ai_attach brandon enc_e_human/a)
(ai_place enc_e_human/a)
(object_create_anew captive_poodle)
(ai_attach captive_poodle enc_e_human_prisoners/captive_poodles)
(ai_place enc_e_sentinels)
(wake obj1)
(wake cheat_to_f_script)
(object_cannot_take_damage
(list_get
(ai_actors enc_e_human_prisoners/captive_poodles) 1))
(ai_braindead enc_e_human_prisoners/captive_poodles true)
(ai_follow_target_players enc_e_human)
(ai_follow_target_players enc_e_human_prisoners)
(device_set_position sage_bef_door 0.00)
(wake prison_doors) tmc_c_start
(sleep 30)
(fade_in 1.00 1.00 1.00 30)
(sleep 120)
(device_set_power sage_bef_door 0.00)
(wake escape_music)))

(script dormant void manage_right_forest
(begin
(sleep_until
(or
(volume_test_object e_advance2 manage_right_forest)
(<=
(ai_living_count enc_e_covenant/forest_right) 1)))
(ai_maneuver enc_e_human_valley/right_assault2)))

(script dormant void manage_left_forest
(begin
(sleep_until
(or
(volume_test_object e_advance2 manage_left_forest)
(<=
(ai_living_count enc_e_covenant/forest_left) 1)))
(ai_maneuver enc_e_human_valley/left_assault2)))

(script dormant void manage_marines_e
(begin
(sleep 10)
(ai_migrate enc_e_human enc_e_human_valley/left_assault)
(ai_migrate enc_e_human_prisoners enc_e_human_valley/right_assault)
(ai_magically_see_encounter enc_e_human_valley enc_e_covenant)
(sleep 180)
(ai_maneuver enc_e_human_valley/left_assault)
(ai_maneuver enc_e_human_valley/right_assault)
(sleep 180)
(ai_set_blind enc_e_human false)
(ai_set_blind enc_e_human_prisoners false)
(ai_set_blind enc_e_human_valley false)
(wake manage_right_forest)
(wake manage_left_forest)
(sleep_until
(or
(volume_test_object e_advance2 manage_marines_e)
(<=
(/
(+
(ai_living_fraction enc_e_covenant/forest_left)
(ai_living_fraction enc_e_covenant/forest_right)) 2.00) 0.35)))
(ai_place enc_e_covenant/forest_backup)
(sleep 10)
(sleep_until
(or
(<=
(ai_living_count enc_e_covenant/forest_backup) 1)
(volume_test_object move_to_flowers manage_marines_e)))
(ai_maneuver enc_e_human_valley/left_assault3)
(ai_maneuver enc_e_human_valley/right_assault3)
(sleep_until
(or
(<=
(/
(+
(ai_living_fraction enc_e_covenant/structure_left)
(ai_living_fraction enc_e_covenant/structure_left_turret)) 2.00) 0.10)
(volume_test_object move_to_flowers manage_marines_e)))
(ai_maneuver enc_e_human_valley/left_assault4)
(ai_maneuver enc_e_human_valley/right_assault4)
(sleep_until
(volume_test_object move_to_flowers manage_marines_e))
(ai_maneuver enc_e_human_valley/left_assault5)
(ai_maneuver enc_e_human_valley/right_assault5)
(game_save)))

(script startup void encounter_e
(begin
(sleep_until
(volume_test_object spawn_e_cov encounter_e))
(game_save_totally_unsafe)
(ai_place enc_e_covenant)
(ai_erase enc_e_covenant/ghost_left)
(ai_erase enc_e_covenant/ghost_right)
(ai_erase enc_e_covenant/forest_backup)
(ai_set_blind enc_e_human true)
(ai_set_blind enc_e_human_prisoners true)
(ai_set_blind enc_e_human_valley true)
(ai_set_blind enc_e_covenant true)
(vehicle_load_magic e_turret gunner
(ai_actors enc_e_covenant/structure_left_turret))
(sleep_until
(=
(device_get_position e_start) 1.00))
(sound_looping_start tm\sounds\music\hero\hero none 1.00)
(sleep 10)
(ai_set_blind enc_e_covenant false)
(wake manage_marines_e)
(sleep_until
(or
(volume_test_object e_ghosts encounter_e)
(<=
(ai_living_count enc_e_covenant) 3)))
(ai_place enc_e_covenant/ghost_right)
(object_create_anew e_ghost_right)
(vehicle_load_magic e_ghost_right driver
(ai_actors enc_e_covenant/ghost_right))
(sleep 350)
(sound_looping_stop sound\music\anotherwalk\anotherwalk)))

(script dormant void f_deaf_manager
(begin
(sleep 60)
(sleep_until
(or
(volume_test_object f_cave f_deaf_manager)
(volume_test_object f_epic f_deaf_manager)
(<
(ai_strength enc_f_covenant/jackals_left) 1.00)
(<
(ai_strength enc_f_covenant/jackals_right) 1.00)))
(ai_set_deaf enc_f_covenant/jackals_right false)
(ai_set_deaf enc_f_covenant/jackals_left false)
(ai_set_blind enc_f_covenant/jackals_right false)
(ai_set_blind enc_f_covenant/jackals_left false)
(ai_disregard
(ai_actors enc_f_covenant/jackals_left) false)
(ai_disregard
(ai_actors enc_f_covenant/jackals_right) false)
(ai_disregard
(ai_actors enc_f_covenant/sniper) false)))

(script dormant void e_drones
(begin
(sleep_until
(volume_test_object migrate_e e_drones))
(sleep 1)
(ai_place enc_f_drones)))

(script dormant void migrate_e_marines
(begin
(wake e_drones)
(sleep_until
(or
(volume_test_object migrate_e migrate_e_marines)
(and
(<=
(ai_living_count enc_f_covenant/jackals_left) 0)
(<=
(ai_living_count enc_f_covenant/jackals_right) 0)
(<=
(ai_living_count enc_f_covenant/bend_reinforcements) 0))))
(ai_migrate enc_f_human_follow enc_f_human_follow_2/a)
(ai_migrate enc_e_human_valley enc_f_human_follow_2/a)
(ai_migrate enc_e_human enc_f_human_follow_2/a)
(ai_follow_target_players enc_f_human_follow_2)))

(script dormant void reinforcements_f2
(begin
(sleep_until
(volume_test_object f_twisty reinforcements_f2))
(ai_place enc_f_covenant/bend_reinforcements3)
(ai_place enc_f_covenant/bend_reinforcements4)
(ai_place enc_f_covenant/bend_reinforcements5)
(sound_looping_stop tm\sounds\music\hero\hero)
(sleep_until
(volume_test_object g_sentinels reinforcements_f2))
(ai_place enc_g_sentinels)))

(script dormant void reinforcements_f
(begin
(sleep_until
(or
(volume_test_object f_cave reinforcements_f)
(volume_test_object f_epic reinforcements_f)
(<
(ai_living_count enc_f_covenant/jackals_left) 1)
(<
(ai_living_count enc_f_covenant/jackals_right) 2)))
(ai_place enc_f_covenant/bend_reinforcements)
(ai_place enc_f_covenant/bend_reinforcements2)
(sound_looping_stop tm\sounds\music\hero\hero)))

(script dormant void epic_manager
(begin
(wake reinforcements_f)
(wake migrate_e_marines)
(sleep_until
(or
(volume_test_object f_cave epic_manager)
(volume_test_object f_epic epic_manager)
(and
(<=
(ai_living_count enc_f_covenant/patrol1) 0)
(<=
(ai_living_count enc_f_covenant/patrol2) 0)
(<=
(ai_living_count enc_f_covenant/patrol3) 0))
(<
(ai_living_count enc_f_covenant/jackals_left) 2)
(<
(ai_living_count enc_f_covenant/jackals_right) 3)))
(ai_maneuver enc_e_human_valley/flower_main_r)
(wake reinforcements_f2)
(sleep_until
(<=
(ai_living_count enc_f_covenant/jackals_left) 0))
(ai_maneuver enc_e_human_valley/flower_main_s)))

(script dormant void f_main_manager
(begin
(sleep 60)
(wake epic_manager)
(sleep_until
(<=
(ai_living_count enc_f_covenant/patrol1) 2))
(ai_maneuver enc_e_human_valley/flower_main2)
(sleep_until
(<=
(ai_living_count enc_f_covenant/patrol1) 1))
(ai_maneuver enc_e_human_valley/flower_main3)
(sleep_until
(<=
(ai_living_count enc_f_covenant/patrol3) 1))
(ai_maneuver enc_e_human_valley/flower_main4)))

(script startup void encounter_f
(begin
(sleep_until
(or
(volume_test_object move_brandon_flowers encounter_f)
(volume_test_object move_cave_flowers encounter_f)))
(game_save)
(object_can_take_damage
(list_get
(ai_actors enc_e_human_prisoners/captive_poodles) 1))
(ai_maneuver enc_e_human_valley/flower_brandon)
(ai_migrate enc_e_human_valley/flower_follow enc_f_human_follow/a)
(ai_follow_target_players enc_f_human_follow/a)
(sleep_until
(or
(volume_test_object spawn_f_a encounter_f)
(volume_test_object spawn_f_b encounter_f)))
(ai_place enc_f_covenant)
(ai_erase enc_f_covenant/bend_reinforcements)
(ai_erase enc_f_covenant/bend_reinforcements2)
(ai_erase enc_f_covenant/bend_reinforcements3)
(ai_erase enc_f_covenant/bend_reinforcements4)
(ai_erase enc_f_covenant/bend_reinforcements5)
(ai_place enc_f_engineers)
(ai_maneuver enc_e_human_valley/flower_main1)
(vehicle_load_magic f_turret gunner
(ai_actors enc_f_covenant/turret))
(wake f_main_manager)
(sleep 60)
(ai_set_deaf enc_f_covenant/jackals_right true)
(ai_set_deaf enc_f_covenant/jackals_left true)
(ai_set_blind enc_f_covenant/jackals_right true)
(ai_set_blind enc_f_covenant/jackals_left true)
(ai_disregard
(ai_actors enc_f_covenant/jackals_left) true)
(ai_disregard
(ai_actors enc_f_covenant/jackals_right) true)
(ai_disregard
(ai_actors enc_f_covenant/sniper) true)
(wake f_deaf_manager)
(sleep_until
(or
(<=
(ai_living_count enc_f_covenant/patrol1) 2)
(<=
(ai_living_count enc_f_covenant/patrol2) 1)))
(sleep 300)))

(script dormant void elite_timer
(begin
(sleep 640)
(set can_advance_elites true)))

(script dormant void elite_squad_g
(begin
(wake elite_timer)
(sleep_until
(or can_advance_elites
(volume_test_object enc_g_b elite_squad_g)))
(ai_braindead enc_g_covenant/elite_rush false)))

(script dormant void continue_g
(begin
(sleep_until
(volume_test_object enc_g_b continue_g))
(ai_place enc_g_covenant/bottom_guys)
(ai_place enc_g_covenant/bottom2)))

(script dormant void continue_jackals
(begin
(sleep_until
(volume_test_object enc_g_jackals continue_jackals))
(ai_braindead enc_g_covenant/jackals_left false)))

(script dormant void end_music_g
(begin
(sleep_until
(or
(vehicle_test_seat_list player_tank_vb g-driver end_music_g)
(volume_test_object enc_g_end_music end_music_g)))
(sound_looping_stop levels\b30\music\b30_05)))

(script dormant void enc_g_mountup
(begin
(sleep_until
(=
(ai_living_count enc_g_covenant) 0))
(ai_conversation enc_g_kallis_mount)))

(script startup void encounter_g
(begin
(sleep_until
(volume_test_object enc_g_spawn_humans encounter_g))
(game_save)
(object_create_anew g_marine)
(ai_attach g_marine enc_g_marines/a)
(ai_command_list_by_unit g_marine enc_g_crouch)
(object_create_anew kallis_real)
(ai_attach kallis_real enc_g_marines/a)
(ai_command_list_by_unit kallis_real enc_g_crouch)
(ai_place enc_g_covenant)
(ai_erase enc_g_covenant/bottom_guys)
(ai_erase enc_g_covenant/bottom2)
(ai_braindead enc_g_covenant/jackals_left true)
(ai_braindead enc_g_covenant/elite_rush true)
(ai_magically_see_encounter enc_g_covenant/ghost enc_g_marines)
(vehicle_load_magic enc_g_turret_a gunner
(ai_actors enc_g_covenant/turret1))
(vehicle_load_magic enc_g_turret_b gunner
(ai_actors enc_g_covenant/turret2))
(vehicle_load_magic enc_g_ghost driver
(ai_actors enc_g_covenant/ghost))
(ai_playfight enc_g_marines true)
(ai_playfight enc_g_covenant true)
(sleep_until
(volume_test_object enc_g_kallis encounter_g))
(ai_conversation enc_g_kallis)
(wake enc_g_mountup)
(sound_looping_start levels\b30\music\b30_05 none 1.00)
(ai_playfight enc_g_marines false)
(ai_playfight enc_g_covenant false)
(wake elite_squad_g)
(wake continue_g)
(wake continue_jackals)
(wake end_music_g)
(sleep 60)
(sleep 120)
(sleep 180)
(ai_command_list_advance enc_g_marines)
(ai_command_list_advance_by_unit kallis_real)
(ai_command_list_advance_by_unit g_marine)
(ai_command_list_advance enc_g_covenant)
(ai_braindead enc_g_covenant/jackals_left false)
(ai_migrate enc_f_human_follow_2 enc_g_marines/a)
(ai_follow_target_players enc_g_marines)))

(script dormant void delay_squad_c
(begin
(sleep 150)
(ai_place enc_h_covenant/squad_c_fuelrod)
(ai_magically_see_players enc_h_covenant)))

(script dormant void h_rocket_manager
(begin
(ai_disregard valley_tank true)
(sleep 10)
(sleep_until
(<=
(ai_living_count enc_h_covenant/attack_rocket) 0))
(sleep 300)
(ai_command_list_by_unit valley_rocket_marine rocket_marine)
(ai_command_list_by_unit valley_marine1 valley_marine)
(ai_command_list_by_unit valley_marine2 valley_marine2)
(sleep_until advance_tank_1)
(sleep 210)
(ai_command_list_advance_by_unit valley_rocket_marine)
(ai_command_list_advance_by_unit valley_marine1)
(ai_command_list_advance_by_unit valley_marine2)
(sleep 450)
(ai_command_list_advance_by_unit valley_rocket_marine)
(ai_command_list_advance_by_unit valley_marine1)
(ai_command_list_advance_by_unit valley_marine2)
(sleep 300)
(ai_command_list_advance_by_unit valley_rocket_marine)
(ai_command_list_advance_by_unit valley_marine1)
(ai_command_list_advance_by_unit valley_marine2)
(sleep 360)
(ai_command_list_advance_by_unit valley_rocket_marine)
(ai_command_list_advance_by_unit valley_marine1)
(ai_command_list_advance_by_unit valley_marine2)
(sleep_until
(or h_chose_infantry_bool tank_advance_bend5))
(ai_command_list_advance_by_unit valley_rocket_marine)
(ai_command_list_advance_by_unit valley_marine1)
(ai_command_list_advance_by_unit valley_marine2)
(ai_maneuver enc_h_human/rocket_marine)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant/wraith1) 0)
(<=
(ai_living_count enc_h_covenant/wraith3) 0)))
(ai_maneuver enc_h_human/rocket_marine7)))

(script dormant void h_tank_manager
(begin
(sleep 10)
(sleep_until
(<=
(ai_living_count enc_h_covenant/attack_tank) 0))
(ai_attach valley_tank_driver enc_h_human/tank_squad)
(vehicle_load_magic valley_tank driver valley_tank_driver)
(sleep 10)
(ai_command_list_by_unit valley_tank_driver valley_tank_start)
(ai_go_to_vehicle enc_h_human/tank_squad valley_tank )
(sleep_until advance_tank_1)
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep 750)
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep_until
(or tank_advance_bend
(and
(<=
(ai_living_count enc_h_covenant/ghost1) 0)
(<=
(ai_living_count enc_h_covenant/squad_b) 0)
(<=
(ai_living_count enc_h_covenant/shadow1_driver) 0)
(<=
(ai_living_count enc_h_covenant/shadow1_gunner) 0))))
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep_until tank_advance_bend)
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep_until tank_advance_bend2)
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep_until tank_advance_bend3)
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep_until tank_advance_bend4)
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep_until tank_advance_bend5)
(ai_command_list_advance_by_unit valley_tank_driver)
(sleep 180)
(set valley_tank_start_bool true)))

(script dormant void tank_continue_left
(begin
(ai_command_list_by_unit valley_tank_driver valley_tank_left)
(ai_command_list_by_unit valley_tank_driver_hack2 valley_tank_left)
(sleep_until
(<=
(ai_living_count enc_h_covenant/wraith1) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(<=
(ai_living_count enc_h_covenant/wraith2) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)))

(script dormant void tank_continue_right
(begin
(ai_command_list_by_unit valley_tank_driver valley_tank_right)
(ai_command_list_by_unit valley_tank_driver_hack2 valley_tank_right)
(sleep_until
(<=
(ai_living_count enc_h_covenant/wraith1) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(<=
(ai_living_count enc_h_covenant/wraith3) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)))

(script dormant void tank_continue_right_hack
(begin
(ai_command_list_by_unit valley_tank_driver_hack valley_tank_right)
(sleep_until
(<=
(ai_living_count enc_h_covenant/wraith1) 0))
(sleep_until
(=
(ai_command_list_status valley_tank_driver_hack) 2))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(sleep_until
(<=
(ai_living_count enc_h_covenant/wraith3) 0))
(sleep_until
(=
(ai_command_list_status valley_tank_driver_hack) 2))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(sleep_until
(=
(ai_command_list_status valley_tank_driver_hack) 2))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver_hack)))

(script dormant void h_banshee_2_delay
(begin
(sleep 250)
(ai_place enc_h_banshees/banshee2)
(vehicle_load_magic h_banshee2 driver
(ai_actors enc_h_banshees/banshee2))))

(script dormant void tank_continue
(begin
(sleep_until
(or tank_go_left_bool tank_go_right_bool))
(object_create_anew h_banshee1)
(object_create_anew h_banshee2)
(ai_place enc_h_banshees/banshee1)
(vehicle_load_magic h_banshee1 driver
(ai_actors enc_h_banshees/banshee1))
(wake h_banshee_2_delay)
(if tank_go_left_bool
(wake tank_continue_left))
(if tank_go_right_bool
(wake tank_continue_right))))

(script dormant void tank_go_left
(begin
(sleep_until
(volume_test_object player_center_right tank_go_left))
(set tank_go_left_bool true)))

(script dormant void tank_go_right
(begin
(sleep_until
(volume_test_object player_center_left tank_go_right))
(set tank_go_right_bool true)))

(script dormant void tank_teleporter
(begin
(sleep_until
(volume_test_object h_tank_teleporter tank_teleporter))
(object_destroy h_ghost4)
(object_destroy h_ghost5)
(set no_tunnel_ghosts true)
(object_teleport valley_tank tank_hack1)
(object_destroy valley_tank_driver)
(sleep 1)
(object_create_anew valley_tank_driver_hack)
(ai_attach valley_tank_driver_hack enc_h_human/tank_squad)
(vehicle_load_magic valley_tank driver valley_tank_driver_hack)
(wake tank_continue_right_hack)
(sleep 1)
(wake tank_continue)
(set tank_go_right_bool true)))

(script dormant void infantry_path_h
(begin
(sleep_until
(volume_test_object h_chose_infantry infantry_path_h))
(set h_chose_infantry_bool true)
(wake tank_teleporter)
(set tank_advance_bend true)
(sleep 200)
(set tank_advance_bend2 true)
(sleep 200)
(set tank_advance_bend3 true)
(sleep 200)
(set tank_advance_bend4 true)
(sleep 200)
(sleep 200)
(set tank_advance_bend5 true)
(sleep 200)
(sleep_until valley_tank_start_bool)
(set tank_go_right_bool true)))

(script dormant void h_cliff_infantry
(begin
(object_create_anew valley_rocket_marine2)
(object_create_anew valley_marine3)
(object_create_anew valley_marine4)
(ai_attach valley_rocket_marine2 enc_h_human/marine_squad_cliff)
(ai_attach valley_marine3 enc_h_human/marine_squad_cliff)
(ai_attach valley_marine4 enc_h_human/marine_squad_cliff)
(sleep 1)
(ai_command_list_by_unit valley_rocket_marine2 valley_rocket2)
(ai_command_list_by_unit valley_marine3 valley_marine3)
(ai_command_list_by_unit valley_marine4 valley_marine4)
(sleep 300)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant/wraith1) 0)
(<=
(ai_living_count enc_h_covenant/wraith2) 0)))
(ai_maneuver enc_h_human/marine_squad_cliff)))

(script continuous void shootmacsounds
(begin
(sleep_until
(and start_mac_rounds no_cutscene_yet))
(sound_impulse_start tm\sounds\sfx\frigate none 0.50)
(sleep
(* 14.00 30.00))))

(script dormant void frigate_battle
(begin
(object_create frigate_a)
(object_create frigate_b)
(object_create_anew cruiser_a)
(scenery_animation_start frigate_a tm\levels\tmc_c\anim\frigate2\frigate2 frigate_a)
(scenery_animation_start frigate_b tm\levels\tmc_c\anim\frigate3\frigate3 frigate_b)
(scenery_animation_start cruiser_a tm\levels\tmc_c\anim\cruiser2\cruiser2 cruiser_battle)
(sleep 160)
(sleep 1500)
(object_create_anew fire_a)
(object_create_anew fire_b)
(set start_mac_rounds true)))

(script dormant void spawn_center_covenant_h
(begin
(sleep_until
(or h_chose_infantry_bool tank_advance_bend4))
(game_save)
(wake frigate_battle)
(wake h_cliff_infantry)
(object_create_anew h_wraith1)
(object_create_anew h_wraith2)
(object_create_anew h_wraith3)
(object_create_anew h_wraith4)
(object_create_anew h_ghost3)
(ai_place enc_h_covenant/wraith1)
(ai_place enc_h_covenant/wraith2)
(ai_place enc_h_covenant/wraith3)
(ai_place enc_h_covenant/wraith4)
(ai_place enc_h_covenant/ghost3)
(vehicle_load_magic h_wraith1 driver
(ai_actors enc_h_covenant/wraith1))
(vehicle_load_magic h_wraith2 driver
(ai_actors enc_h_covenant/wraith2))
(vehicle_load_magic h_wraith3 driver
(ai_actors enc_h_covenant/wraith3))
(vehicle_load_magic h_wraith4 driver
(ai_actors enc_h_covenant/wraith4))
(vehicle_load_magic h_ghost3 driver
(ai_actors enc_h_covenant/ghost3))
(sleep 1)
(if
(not h_chose_infantry_bool)
(ai_magically_see_players enc_h_covenant))))

(script dormant void check_tank_tunnel_hack
(begin
(sleep 10)
(if
(=
(volume_test_object tunnel_hack_check valley_tank) false)
(begin
(set tank_hack_2_bool true)
(object_teleport valley_tank tank_hack2)
(object_destroy valley_tank_driver)
(sleep 1)
(object_create_anew valley_tank_driver_hack2)
(ai_attach valley_tank_driver_hack2 enc_h_human/tank_squad)
(vehicle_load_magic valley_tank driver valley_tank_driver_hack2)
(ai_command_list_by_unit valley_tank_driver_hack2 valley_tank_hack_2)
(sleep_until tank_advance_bend5)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)))))

(script continuous void player_tank_passengers
(begin
(if
(not
(vehicle_test_seat player_tank_vb g-driver player_tank_passengers))
(vehicle_unload player_tank_vb ))))

(script dormant void obj2
(begin
(hud_set_objective_text obj2)
(show_hud_help_text true)
(hud_set_help_text obj2)
(sleep 300)
(show_hud_help_text false)))

(script dormant void marine_convo_f
(begin
(ai_conversation marine_f)))

(script dormant void watchtower
(begin
(sleep 20)
(ai_place enc_h_covenant_2/watchtower_a)
(ai_place enc_h_covenant_2/watchtower_b)
(ai_place enc_h_covenant_2/watchtower_c)))

(script startup void valleybattle
(begin
(sleep_until
(volume_test_object start_valley valleybattle))
(game_save)
(ai_place enc_f_dino)
(sound_looping_start tm\sounds\music\halo_rev\halo_rev none 1.00)
(wake obj2)
(cinematic_set_title totalw)
(ai_place enc_h_covenant/attack_tank)
(ai_place enc_h_covenant/attack_rocket)
(ai_place enc_h_covenant/turret1)
(ai_place enc_h_covenant/turret2)
(ai_place enc_h_covenant/turret3)
(ai_place enc_h_covenant/squad_b)
(ai_place enc_h_covenant/squad_d)
(ai_place enc_h_human/tank_squad)
(ai_place enc_h_human/rocket_marine)
(object_create_anew valley_tank_driver)
(object_create_anew valley_tank)
(object_create_anew valley_rocket_marine)
(object_create_anew valley_marine1)
(object_create_anew valley_marine2)
(object_cannot_take_damage valley_tank_driver)
(ai_attach valley_rocket_marine enc_h_human/rocket_marine)
(ai_attach valley_marine1 enc_h_human/rocket_marine)
(ai_attach valley_marine2 enc_h_human/rocket_marine)
(ai_detach brandon)
(ai_detach kallis_real)
(ai_detach captive_poodle)
(ai_detach g_marine)
(ai_attach brandon enc_h_human/rocket_marine)
(ai_attach kallis_real enc_h_human/rocket_marine)
(ai_attach captive_poodle enc_h_human/rocket_marine)
(ai_attach g_marine enc_h_human/rocket_marine)
(wake h_tank_manager)
(wake h_rocket_manager)
(vehicle_load_magic h_turret1 gunner
(ai_actors enc_h_covenant/turret1))
(vehicle_load_magic h_turret2 gunner
(ai_actors enc_h_covenant/turret2))
(vehicle_load_magic h_turret3 gunner
(ai_actors enc_h_covenant/turret3))
(unit_impervious h_turret3 true)
(sleep_until
(volume_test_object valley_ghosts_1 valleybattle))
(ai_conversation enc_f_kallis_structure)
(set advance_tank_1 true)
(ai_place enc_h_covenant/ghost1)
(ai_place enc_h_covenant/ghost2)
(vehicle_load_magic h_ghost1 driver
(ai_actors enc_h_covenant/ghost1))
(vehicle_load_magic h_ghost2 driver
(ai_actors enc_h_covenant/ghost2))
(ai_magically_see_players enc_h_covenant)
(wake delay_squad_c)
(sleep_until
(volume_test_object valley_shadow_1 valleybattle))
(ai_place enc_h_covenant/shadow1_driver)
(ai_place enc_h_covenant/shadow1_gunner)
(vehicle_load_magic h_shadow1 driver
(ai_actors enc_h_covenant/shadow1_driver))
(vehicle_load_magic h_shadow1 gunner
(ai_actors enc_h_covenant/shadow1_gunner))
(wake marine_convo_f)
(wake infantry_path_h)
(wake spawn_center_covenant_h)
(sleep_until
(volume_test_object valley_bend valleybattle))
(set tank_advance_bend true)
(if
(not no_tunnel_ghosts)
(begin
(object_create_anew h_ghost4)
(object_create_anew h_ghost5)
(ai_place enc_h_covenant/ghost4)
(ai_place enc_h_covenant/ghost5)
(vehicle_load_magic h_ghost4 driver
(ai_actors enc_h_covenant/ghost4))
(vehicle_load_magic h_ghost5 driver
(ai_actors enc_h_covenant/ghost5))))
(ai_magically_see_players enc_h_covenant/ghost4)
(ai_magically_see_players enc_h_covenant/ghost5)
(sleep_until
(volume_test_object valley_bend2 valleybattle))
(set tank_advance_bend2 true)
(sleep_until
(volume_test_object valley_bend3 valleybattle))
(set tank_advance_bend3 true)
(sleep_until
(volume_test_object valley_middle valleybattle))
(set tank_advance_bend4 true)
(wake check_tank_tunnel_hack)
(sleep_until
(volume_test_object valley_bend4 valleybattle))
(set tank_advance_bend5 true)
(wake tank_go_left)
(wake tank_go_right)
(wake tank_continue)
(wake watchtower)))

(script static void set_correct_scenery
(begin
(object_set_permutation crashed_boulder1 boulder base03)
(object_set_permutation crashed_boulder2 boulder base03)
(object_set_permutation crashed_boulder3 boulder base00)))

(script continuous void bsp_switching_0_1
(begin bsp_switching_0_1 bsp_switching_0_1
(object_destroy cruiser_a)
(object_destroy frigate_a)
(object_destroy frigate_b)
(sleep_until
(volume_test_objects switche_f
(players)))
(switch_bsp 1)
(game_save) bsp_switching_0_1 bsp_switching_0_1
(object_destroy cruiser_a)
(object_destroy frigate_a)
(object_destroy frigate_b)
(sleep_until
(volume_test_objects switchf_e
(players)))
(switch_bsp 0) bsp_switching_0_1))

(script dormant void valley_hog
(begin
(object_create_anew valley_hog_driver)
(unit_impervious h_hog1 true)
(ai_attach valley_hog_driver enc_h_human/tank_squad)
(vehicle_load_magic h_hog1 driver valley_hog_driver)
(sleep 1)
(ai_command_list_by_unit valley_hog_driver valley_hog_driver)
(ai_disregard valley_hog_driver true)
(sleep_until advance_valley_hog)
(sleep 1)
(ai_command_list_advance_by_unit valley_hog_driver)
(ai_disregard valley_hog_driver false)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/h_frg1_driver) 0)
(<=
(ai_living_count enc_h_covenant_2/h_frg1_gunner) 0)
(<=
(ai_living_count enc_h_covenant_2/arc_infantry) 0)))
(sleep_until
(=
(ai_command_list_status valley_hog_driver) 2))
(sleep 60)
(ai_command_list_advance_by_unit valley_hog_driver)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost8) 0))
(sleep_until
(=
(ai_command_list_status valley_hog_driver) 2))
(sleep 40)
(game_save_no_timeout)
(sleep 40)
(ai_command_list_advance_by_unit valley_hog_driver)
(sleep_until end_courtyard_2_global)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/top_right_inf) 0)
(<=
(ai_living_count enc_h_covenant_2/central_infantry) 0)))
(sleep_until
(=
(ai_command_list_status valley_hog_driver) 2))
(sleep 1)
(ai_command_list_advance_by_unit valley_hog_driver)
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/left_hunters) 0))
(sleep_until
(=
(ai_command_list_status valley_hog_driver) 2))
(sleep 1)
(ai_command_list_advance_by_unit valley_hog_driver)))

(script dormant void hog_advance_timer
(begin
(sleep 1)
(set hog_timer_bool true)))

(script dormant void valley_hog_marines
(begin
(sleep 180)
(sleep 200)
(sleep 10)
(wake hog_advance_timer)
(sleep_until hog_timer_bool)
(set advance_valley_hog true)
(ai_vehicle_enterable_team h_hog1 human)))

(script dormant void valley_frg_shadow1
(begin
(ai_place enc_h_covenant_2/h_frg1_driver)
(ai_place enc_h_covenant_2/h_frg1_gunner)
(vehicle_load_magic h_frg1 driver
(ai_actors enc_h_covenant_2/h_frg1_driver))
(vehicle_load_magic h_frg1 gunner
(ai_actors enc_h_covenant_2/h_frg1_gunner))))

(script dormant void ghost_timer
(begin
(sleep 420)
(set ghost_timer_bool true)))

(script dormant void valley_ghosts_line2
(begin
(wake ghost_timer)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_ghosts_line2)))
(ai_command_list_advance enc_h_covenant_2/ghost8)
(ai_command_list_advance enc_h_covenant_2/ghost9)
(ai_place enc_h_banshees/banshee4)
(vehicle_load_magic h_banshee4 driver
(ai_actors enc_h_banshees/banshee4))
(sleep_until
(volume_test_object end_courtyard_2 valley_ghosts_line2))
(sleep 1)
(set end_courtyard_2_global true)))

(script dormant void valley_tank_left_2
(begin
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 1)
(=
(ai_command_list_status valley_tank_driver_hack) 1)
(=
(ai_command_list_status valley_tank_driver_hack2) 1)))
(ai_command_list_by_unit valley_tank_driver valley_tank_left2)
(ai_command_list_by_unit valley_tank_driver_hack valley_tank_left2)
(ai_command_list_by_unit valley_tank_driver_hack2 valley_tank_left2)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost7) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_tank_left_2)))
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/h_frg1_driver) 0)
(<=
(ai_living_count enc_h_covenant_2/h_frg1_gunner) 0)))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_tank_left_2)))
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost9) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_tank_left_2)))
(sleep 1)
(sleep_until end_valley)
(sleep 1)
(sleep_until end_courtyard_2_global)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/left_top_jackals) 0)
(<=
(ai_living_count enc_h_covenant_2/central_infantry) 0)))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/left_hunters) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)))

(script dormant void valley_tank_right_2
(begin
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 1)
(=
(ai_command_list_status valley_tank_driver_hack) 1)
(=
(ai_command_list_status valley_tank_driver_hack2) 1)))
(ai_command_list_by_unit valley_tank_driver valley_tank_right2)
(ai_command_list_by_unit valley_tank_driver_hack valley_tank_right2)
(ai_command_list_by_unit valley_tank_driver_hack2 valley_tank_right2)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost6) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_tank_right_2)))
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/h_frg1_driver) 0)
(<=
(ai_living_count enc_h_covenant_2/h_frg1_gunner) 0)))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_tank_right_2)))
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost8) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_tank_right_2)))
(sleep 1)
(sleep_until end_valley)
(sleep 1)
(sleep_until end_courtyard_2_global)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/top_right_inf) 0)
(<=
(ai_living_count enc_h_covenant_2/central_infantry) 0)))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/left_hunters) 0))
(sleep_until
(or
(=
(ai_command_list_status valley_tank_driver) 2)
(=
(ai_command_list_status valley_tank_driver_hack) 2)
(=
(ai_command_list_status valley_tank_driver_hack2) 2)))
(sleep 1)
(sleep 60)
(ai_command_list_advance_by_unit valley_tank_driver)
(ai_command_list_advance_by_unit valley_tank_driver_hack)
(ai_command_list_advance_by_unit valley_tank_driver_hack2)))

(script dormant void valley_sniper
(begin
(ai_command_list_by_unit valley_rocket_marine2 valley_sniper)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/left_top_jackals) 0)
(<=
(ai_living_count enc_h_covenant_2/left_hunters) 0)))
(sleep 1)
(ai_command_list_advance_by_unit valley_rocket_marine2)))

(script dormant void valley_slope_marines_left
(begin
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost7) 0))
(ai_maneuver enc_h_human/left_bridge)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_slope_marines_left)))
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/h_frg1_driver) 0)
(<=
(ai_living_count enc_h_covenant_2/h_frg1_gunner) 0)))
(ai_maneuver enc_h_human/left_slope)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_slope_marines_left)))
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost9) 0))
(ai_maneuver enc_h_human/left_slope2)
(wake valley_sniper)
(sleep 1)
(sleep_until end_courtyard_2_global)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/left_top_jackals) 0)
(<=
(ai_living_count enc_h_covenant_2/left_hunters) 0)))
(sleep 1)
(ai_maneuver enc_h_human/left_slope3)
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/central_infantry) 0))
(ai_maneuver enc_h_human/left_side)
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/courtyard_left) 0)
(<=
(ai_living_count enc_h_covenant_2/courtyard_right) 0)
(<=
(ai_living_count enc_h_covenant_2/wraith5) 0)
(<=
(ai_living_count enc_h_covenant_2/wraith6) 0)
(<=
(ai_living_count enc_h_covenant_2/wraith7) 0)))
(ai_maneuver enc_h_human/courtyard)))

(script dormant void valley_slope_marines_right
(begin
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/ghost6) 0))
(ai_maneuver enc_h_human/right_bridge)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_slope_marines_right)))
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/h_frg1_driver) 0)
(<=
(ai_living_count enc_h_covenant_2/h_frg1_gunner) 0)))
(ai_maneuver enc_h_human/right_slope)
(sleep_until
(or ghost_timer_bool
(volume_test_object valley_2_ghost_line valley_slope_marines_right)))
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/ghost8) 0)
(<=
(ai_living_count enc_h_covenant_2/arc_infantry) 1)))
(ai_maneuver enc_h_human/right_slope2)
(sleep 1)
(sleep_until end_courtyard_2_global)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/shadow2_driver) 0)
(<=
(ai_living_count enc_h_covenant_2/shadow2_gunner) 0)
(<=
(ai_living_count enc_h_covenant_2/central_infantry) 0)))
(sleep 1)
(ai_maneuver enc_h_human/right_slope3)
(sleep 1)
(sleep_until
(<=
(ai_living_count enc_h_covenant_2/left_hunters) 0))
(ai_maneuver enc_h_human/right_side)
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/courtyard_left) 0)
(<=
(ai_living_count enc_h_covenant_2/courtyard_right) 0)
(<=
(ai_living_count enc_h_covenant_2/wraith5) 0)
(<=
(ai_living_count enc_h_covenant_2/wraith6) 0)
(<=
(ai_living_count enc_h_covenant_2/wraith7) 0)))
(ai_maneuver enc_h_human/courtyard)))

(script dormant void timer2
(begin
(sleep 300)
(set timer2expired true)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant/wraith1) 0)
(<=
(ai_living_count enc_h_covenant/wraith2) 0)
(<=
(ai_living_count enc_h_covenant/wraith3) 0)
(<=
(ai_living_count enc_h_covenant/wraith4) 0)))
(sleep 150)
(set timer3expired true)))

(script dormant void slope_left_inf
(begin
(sleep 120)
(ai_place enc_h_covenant_2/slope_left_inf)))

(script dormant void valley_courtyard
(begin
(sleep_until
(volume_test_object end_courtyard valley_courtyard))
(ai_place enc_h_covenant_2/courtyard_left)
(ai_place enc_h_covenant_2/courtyard_right)
(set end_valley true)
(sleep 1)
(sleep_until
(volume_test_object end_courtyard_2 valley_courtyard))
(ai_place enc_h_covenant_2/top_right_inf)
(sleep 1)
(ai_place enc_h_covenant_2/shadow2_driver)
(ai_place enc_h_covenant_2/shadow2_gunner)
(vehicle_load_magic h_shadow2 driver
(ai_actors enc_h_covenant_2/shadow2_driver))
(vehicle_load_magic h_shadow2 gunner
(ai_actors enc_h_covenant_2/shadow2_gunner))
(sleep 10)
(ai_command_list_advance enc_h_covenant_2/shadow2_driver)
(ai_command_list_advance enc_h_covenant_2/central_infantry)))

(script dormant void valley_arc
(begin
(sleep 120)
(ai_place enc_h_covenant_2/arc_infantry)))

(script dormant void delete_pelican_f
(begin
(sleep 30)
(sleep_until
(<=
(unit_get_custom_animation_time pelican_f) 0))
(object_destroy pelican_f)))

(script dormant void e_vehicles
(begin
(object_teleport player_banshee cine_e_banshee)
(object_teleport player_warthog cine_e_hog)
(object_teleport player_warthog2 cine_e_hog)
(if
(volume_test_object f_cutscene_area player_tank_vb)
(object_teleport player_tank_vb cine_e_tank))
(object_teleport e_turret e_turret)
(object_teleport e_ghost_right e_ghost_right)
(object_teleport f_turret f_turret)
(object_teleport enc_g_turret_a enc_g_turret_a)
(object_teleport enc_g_turret_b enc_g_turret_b)
(object_teleport valley_tank valley_tank)
(object_teleport h_wraith1 h_wraith1)
(object_teleport h_wraith2 h_wraith2)
(object_teleport h_wraith3 h_wraith3)
(object_destroy h_wraith7)
(object_teleport h_turret1 h_turret1)
(object_teleport h_turret2 h_turret2)
(object_teleport h_turret3 h_turret3)
(object_teleport h_turret5 h_turret5)
(object_teleport h_turret4 h_turret4)
(object_destroy h_turret7)
(object_destroy h_turret6)
(object_destroy h_wraith5)
(object_destroy h_wraith6)
(object_destroy h_ghost6)
(object_destroy h_ghost888)
(object_destroy h_ghost7)
(object_destroy h_ghost9)
(object_destroy ghost1)
(object_destroy ghost2)
(object_destroy h_shadow2)
(object_destroy h_frg1)
(object_destroy h_shadow1)
(object_destroy h_ghost1)
(object_destroy h_ghost2)
(object_destroy h_ghost3)
(object_destroy h_ghost4)
(object_destroy h_ghost5)
(object_destroy frg_mm)
(object_teleport h_hog1 h_hog1)
(object_destroy h_wraith4)
(object_destroy h_banshee1)
(object_destroy h_banshee2)
(object_destroy h_banshee3)
(object_destroy h_banshee4)
(object_destroy h_banshee5)
(object_destroy h_banshee6)
(object_destroy wat)
(object_destroy top_right_inf)
(object_destroy cgun)
(object_destroy h_ghost8)
(object_destroy c_drop_right)
(object_destroy g_turret_1)
(object_destroy h_turret8)))

(script dormant void cine_e_sounds
(begin
(sound_impulse_start tm\sounds\dialouge\cine_e\1 none 1.00)
(sleep 1154)
(sound_impulse_start tm\sounds\dialouge\cine_e\2 scientist2 1.00)
(sleep 195)
(sound_impulse_start tm\sounds\dialouge\cine_e\3 none 1.00)))

(script startup void finish_the_valley
(begin
(sleep_until
(volume_test_object finish_valley finish_the_valley))
(set valley_finished true)))

(script dormant void valley_complete
(begin
(sleep_until
(=
(ai_living_count enc_h_covenant_2/wraith5) 0))
(sleep_until
(=
(ai_living_count enc_h_covenant_2/wraith6) 0))
(sleep_until
(=
(ai_living_count enc_h_covenant_2/wraith7) 0))
(sleep_until end_valley)
(sleep 1)
(sleep_until
(and
(<=
(ai_living_count enc_h_covenant_2/courtyard_left) 1)
(<=
(ai_living_count enc_h_covenant_2/courtyard_left) 1)))
(sleep 0)
(sound_looping_stop tm\sounds\music\halo_rev\halo_rev)
(ai_conversation enc_f_kallis_hell)
(ai_detach kallis_real)
(ai_detach brandon)
(sleep 1)
(ai_attach brandon enc_h_human/secure_top)
(ai_attach kallis_real enc_h_human/secure_top)
(ai_migrate enc_g_marines enc_h_human/secure_top)
(sleep 80)
(sleep 80)
(object_destroy fire_a)
(object_destroy fire_b)
(sleep 90)
(sleep 250)
(sleep_until valley_finished)
(object_create_anew pelican_f)
(ai_place pelican_f)
(object_create_anew scientist_f)
(object_cannot_take_damage scientist_f)
(ai_attach scientist_f dennis/a)
(vehicle_load_magic pelican_f driver
(ai_actors pelican_f/pelican))
(vehicle_load_magic pelican_f p-riderlf
(ai_actors dennis/a))
(object_teleport pelican_f cine_e_tank)
(custom_animation pelican_f tm\levels\tmc_c\anim\dropoff dropoff true)
(wake delete_pelican_f)
(sleep 250)
(set no_cutscene_yet false)
(fade_out 0.00 0.00 0.00 100)
(sleep 100)
(ai_erase enc_h_covenant_2)
(object_destroy cfg_1)
(object_destroy h_wraith5)
(object_destroy h_wraith6)
(object_destroy frigate_a)
(object_destroy frigate_b)
(object_destroy fire_a)
(object_destroy fire_b)
(object_teleport valley_complete cine_e_player)
(wake e_vehicles)
(ai_erase_all)
(cinematic_start)
(camera_control true)
(object_create_anew brandon)
(object_teleport brandon cine_e_bwalk)
(object_create_anew may3)
(object_teleport may3 cine_e_mwalk)
(camera_set cine_e_1.1 0)
(camera_set cine_e_1.2 150)
(unit_set_seat may3 alert)
(unit_set_seat brandon alert)
(recording_play may3 cine_e_mwalk)
(recording_play brandon cine_e_bwalk)
(object_create_anew scientist2)
(unit_enter_vehicle scientist2 pelican_f p-riderrf)
(fade_in 0.00 0.00 0.00 50)
(sleep 150)
(unit_set_seat scientist2 alert)
(ai_attach scientist2 cine_human)
(camera_set cine_e_2.1 0)
(object_destroy may3)
(recording_kill brandon)
(camera_set cine_e_2.2 150)
(sleep 50)
(vehicle_unload pelican_f p-rider)
(sleep 40)
(ai_command_list_by_unit scientist2 cine_e_science)
(sleep 60)
(object_teleport brandon cine_e_brandon)
(ai_attach brandon cine_human)
(unit_set_seat brandon alert)
(object_create_anew may3)
(object_teleport may3 cine_e_may)
(unit_set_seat may3 alert)
(sleep 10)
(object_create_anew may2)
(camera_set cine_e_3.1 0)
(camera_set cine_e_3.2 288)
(ai_command_list_by_unit brandon cine_e_brandon)
(recording_play may3 cine_e_may)
(sleep 288)
(object_create_anew sage2)
(wake cine_e_sounds)
(custom_animation may2 tm\levels\tmc_c\anim\may_cine_e\may_cine_e may_cine_e true)
(object_destroy may3)
(camera_set cine_e_4.1 0)
(sleep 66)
(camera_set cine_e_5.1 0)
(camera_set cine_e_5.2 200)
(sleep 125)
(cinematic_screen_effect_start true)
(cinematic_screen_effect_set_convolution 1 2 5.00 0.00 15.00)
(sound_looping_start sound\music\string_low1\string_low1 none 1.00)
(sleep 61)
(cinematic_screen_effect_start false)
(cinematic_screen_effect_stop)
(camera_set cine_e_6.1 0)
(camera_set cine_e_6.2 200)
(sleep 184)
(camera_set cine_e_7.1 0)
(cinematic_screen_effect_start true)
(cinematic_screen_effect_set_convolution 1 2 5.00 0.00 15.00)
(camera_set cine_e_7.2 125)
(sleep 125)
(cinematic_screen_effect_start false)
(cinematic_screen_effect_stop)
(camera_set cine_e_8.1 0)
(object_teleport brandon cine_e_brandon2)
(ai_detach brandon)
(object_destroy scientist)
(object_create_anew scientist2)
(camera_set cine_e_8.2 210)
(sleep 105)
(camera_set cine_e_8.3 231)
(sleep 231)
(camera_set cine_e_9.1 0)
(cinematic_screen_effect_start true)
(cinematic_screen_effect_set_convolution 1 2 5.00 0.00 15.00)
(camera_set cine_e_9.2 125)
(sleep 72)
(cinematic_screen_effect_start false)
(cinematic_screen_effect_stop)
(camera_set cine_e_10.1 0)
(sleep 88)
(custom_animation brandon tm\levels\tmc_c\anim\b_cine_e\b_cine_e brandon_cine_e true)
(sleep 5)
(camera_set cine_e_11.1 0)
(sleep 86)
(camera_set cine_e_12.1 0)
(camera_set cine_e_12.2 207)
(sleep 207)
(camera_set cine_e_13.1 0)
(camera_set cine_e_13.2 121)
(sleep 121)
(camera_set cine_e_14.1 0)
(recording_kill may3)
(recording_kill brandon)
(scenery_animation_start sage2 tm\levels\tmc_c\anim\sage_cine2\sage_cine2 sage_cine2)
(camera_set cine_e_14.2 325)
(object_destroy may2)
(object_create_anew may2)
(sleep 325)
(sleep 100)
(device_set_power map_room_door 1.00)
(device_set_position map_room_door 1.00)
(ai_attach may2 cine_human)
(unit_set_seat may2 alert)
(ai_attach brandon cine_human)
(unit_set_seat brandon alert)
(ai_attach scientist2 cine_human)
(unit_set_seat scientist2 alert)
(ai_command_list_by_unit may2 cine_e_m_door)
(ai_command_list_by_unit brandon cine_e_b_door)
(ai_command_list_by_unit scientist2 cine_e_s_door)
(camera_set cine_e_15.1 0)
(sleep 275)
(camera_set cine_e_16.1 0)
(device_set_power map_room_door 0.00)
(camera_set cine_e_16.2 250)
(sound_looping_stop sound\music\string_low1\string_low1)
(sleep 285)
(camera_set cine_e_17.1 0)
(sleep 25)
(object_create_anew may)
(unit_set_seat may alert)
(object_teleport may cine_e_mend)
(recording_play may cine_e_mend)
(camera_set cine_e_17.2 250)
(sleep 270)
(fade_out 1.00 1.00 1.00 50)
(cinematic_stop)
(player_enable_input false)
(sleep 60)
(map_name lumoria_d)))

(script startup void valley_battle_2
(begin
(sleep_until
(or tank_go_left_bool tank_go_right_bool))
(sleep 1)
(wake timer2)
(wake valley_hog)
(sleep_until
(or
(<=
(+
(ai_living_count enc_h_covenant/wraith1)
(ai_living_count enc_h_covenant/wraith2)
(ai_living_count enc_h_covenant/wraith3)) 1.00) timer2expired))
(ai_place enc_h_covenant_2/turret4)
(ai_place enc_h_covenant_2/turret5)
(ai_place enc_h_covenant_2/turret6)
(ai_place enc_h_covenant_2/turret7)
(ai_place enc_h_covenant_2/turret8)
(object_create_anew h_turret4)
(object_create_anew h_turret5)
(object_create_anew h_turret8)
(sleep 1)
(vehicle_load_magic h_turret4 gunner
(ai_actors enc_h_covenant_2/turret4))
(vehicle_load_magic h_turret5 gunner
(ai_actors enc_h_covenant_2/turret5))
(vehicle_load_magic h_turret6 gunner
(ai_actors enc_h_covenant_2/turret6))
(vehicle_load_magic h_turret7 gunner
(ai_actors enc_h_covenant_2/turret7))
(vehicle_load_magic h_turret8 gunner
(ai_actors enc_h_covenant_2/turret8))
(ai_place enc_h_covenant_2/ghost6)
(ai_place enc_h_covenant_2/ghost7)
(ai_place enc_h_covenant_2/ghost8)
(ai_place enc_h_covenant_2/ghost9)
(ai_place enc_h_covenant_2/wraith5)
(ai_place enc_h_covenant_2/wraith6)
(ai_place enc_h_covenant_2/wraith7)
(ai_place enc_h_covenant_2/central_infantry)
(ai_place enc_h_covenant_2/left_hunters)
(ai_place enc_h_covenant_2/left_top_jackals)
(object_create_anew h_wraith5)
(object_create_anew h_wraith6)
(object_create_anew h_wraith7)
(vehicle_load_magic h_wraith5 driver
(ai_actors enc_h_covenant_2/wraith5))
(vehicle_load_magic h_wraith6 driver
(ai_actors enc_h_covenant_2/wraith6))
(vehicle_load_magic h_wraith7 driver
(ai_actors enc_h_covenant_2/wraith7))
(vehicle_load_magic h_ghost6 driver
(ai_actors enc_h_covenant_2/ghost6))
(vehicle_load_magic h_ghost7 driver
(ai_actors enc_h_covenant_2/ghost7))
(vehicle_load_magic h_ghost8 gunner
(ai_actors enc_h_covenant_2/ghost8))
(vehicle_load_magic h_ghost9 driver
(ai_actors enc_h_covenant_2/ghost9))
(sleep 1)
(ai_magically_see_players enc_h_covenant_2)
(if tank_go_left_bool
(wake valley_tank_left_2))
(if tank_go_right_bool
(wake valley_tank_right_2))
(wake valley_arc)
(wake slope_left_inf)
(sleep_until
(or timer3expired
(volume_test_object valley_2_bridges valley_battle_2)))
(wake valley_hog_marines)
(wake valley_frg_shadow1)
(wake valley_ghosts_line2)
(wake valley_slope_marines_left)
(wake valley_slope_marines_right)
(wake valley_courtyard)
(wake valley_complete)
(object_create_anew valley_hog_gunner)
(vehicle_load_magic h_hog1 gunner valley_hog_gunner)
(ai_attach valley_hog_gunner enc_h_human/tank_squad)
(sound_looping_set_alternate tm\sounds\music\halo_rev\halo_rev true)
(ai_conversation enc_f_kallis_move)
(sleep_until
(=
(ai_living_count enc_h_covenant_2/wraith7) 0))))