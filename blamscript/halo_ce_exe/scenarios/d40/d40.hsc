(global bool global_dialog_on false)

(global bool global_music_on false)

(global long global_delay_music
	(* 30.00 300.00))

(global long global_delay_music_alt
	(* 30.00 300.00))

(global bool cinematics_debug false)

(global real monitor_dialogue_scale 1.00)

(global real cortana_dialogue_scale 1.00)

(global real pilot_dialogue_scale 1.00)

(global real chief_dialogue_scale 1.00)

(global bool debug false)

(global bool coop false)

(global real spawn_scale 1.00)

(global short min_combat_spawn 2)

(global short min_carrier_spawn 2)

(global short min_infection_spawn 4)

(global short testing_fast 5)

(global short testing_very_fast 2)

(global short testing_save 5)

(global short testing_lift 10)

(global short testing_trench 10)

(global short enc5_1_wave_seperator 600)

(global short explosion_seperation 30)

(global short hud_objectives_display_time 90)

(global short trench_safe_save_time 4500)

(global short timer_minutes 6)

(global short timer_seconds 0)

(global short destroyed_count 0)

(global effect explosion_small effects\small explosion)

(global effect explosion_grenade weapons\frag grenade\effects\explosion)

(global effect explosion_medium effects\explosions\medium explosion)

(global effect explosion_medium_no effects\explosions\medium explosion no objects)

(global effect explosion_large effects\explosions\large explosion)

(global effect explosion_large_no effects\explosions\large explosion no objects)

(global effect explosion_steam effects\explosions\steam explosion)

(global effect explosion_steam_no effects\explosions\steam explosion no objects)

(global bool save_now false)

(global bool timer_active false)

(global short time_out_of_jeep 0)

(global bool trench_jeep_test_paused false)

(global bool trench_scene_continued false)

(global bool manifold_n1_destroyed false)

(global bool manifold_n3_destroyed false)

(global bool manifold_s1_destroyed false)

(global bool manifold_s3_destroyed false)

(global bool controls_marked false)

(global bool manifold_all_destroyed false)

(global short player_is_on_floor 0)

(global short current_damage_level destroyed_count)

(global short current_explosion_seperation 150)

(global effect current_explosion explosion_small)

(global short enc5_1_s12_limiter 0)

(global short enc5_1_s23_limiter 0)

(global short enc5_1_n12_limiter 0)

(global short enc5_1_n23_limiter 0)

(global bool inside_n12 false)

(global bool inside_n23 false)

(global bool inside_s12 false)

(global bool inside_s23 false)

(global bool enc5_1_active false)

(global short enc4_2_limiter 0)

(global short enc3_6_limiter 0)

(global short enc3_5_limiter 0)

(global short enc1_4_limiter 0)

(global bool cinematic_ran false)

(global bool trench_scene_allow_continue true)

(script static unit player0
	(begin
		(unit
			(list_get
				(players) 0))))

(script static unit player1
	(begin
		(unit
			(list_get
				(players) 1))))

(script static short player_count
	(begin
		(list_count
			(players))))

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

(script static void script_dialog_start
	(begin
		(sleep_until
			(not global_dialog_on))
		(set global_dialog_on true)
		(ai_dialogue_triggers false)))

(script static void script_dialog_stop
	(begin
		(ai_dialogue_triggers true)
		(sleep 30)
		(set global_dialog_on false)))

(script static void player_effect_impact
	(begin
		(player_effect_set_max_translation 0.05 0.05 0.08)
		(player_effect_set_max_rotation 0.00 0.00 0.00)
		(player_effect_set_max_rumble 0.40 1.00)
		(player_effect_start
			(real_random_range 0.70 0.90) 0.10)))

(script static void player_effect_explosion
	(begin
		(player_effect_set_max_translation 0.01 0.01 0.03)
		(player_effect_set_max_rotation 0.50 0.50 1.00)
		(player_effect_set_max_rumble 0.50 0.40)
		(player_effect_start
			(real_random_range 0.70 0.90) 0.10)))

(script static void player_effect_rumble
	(begin
		(player_effect_set_max_translation 0.01 0.00 0.02)
		(player_effect_set_max_rotation 0.10 0.10 0.20)
		(player_effect_set_max_rumble 0.50 0.30)
		(player_effect_start
			(real_random_range 0.70 0.90) 0.50)))

(script static void player_effect_vibration
	(begin
		(player_effect_set_max_translation 0.01 0.01 0.01)
		(player_effect_set_max_rotation 0.01 0.01 0.05)
		(player_effect_set_max_rumble 0.20 0.50)
		(player_effect_start
			(real_random_range 0.70 0.90) 1.00)))

(script static void d40_010_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_010_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_010_cortana) 30.00)))))

(script static void d40_020_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_020_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_020_cortana) 0.00)))))

(script static void d40_030_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_030_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_030_cortana) 30.00)))))

(script static void d40_050_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_050_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_050_cortana) 30.00)))))

(script static void d40_060_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_060_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_060_cortana) 30.00)))))

(script static void d40_070_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_070_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_070_cortana) 30.00)))))

(script static void d40_080_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_080_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_080_cortana) 30.00)))))

(script static void d40_100_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_100_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_100_cortana) 30.00)))))

(script static void d40_110_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_110_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_110_cortana) 1.00)))
		(sleep 40)))

(script static void d40_120_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_120_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_120_cortana) 30.00)))))

(script static void d40_130_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_130_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_130_cortana) 5.00)))))

(script static void d40_140_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_140_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_140_cortana) 30.00)))))

(script static void d40_150_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_150_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_150_cortana) 0.00)))))

(script static void d40_160_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_160_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_160_cortana) 0.00)))))

(script static void d40_170_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_170_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_170_cortana) 30.00)))))

(script static void d40_180_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_180_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_180_cortana) 30.00)))))

(script static void d40_200_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_200_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_200_cortana) 10.00)))))

(script static void d40_210_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_210_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_210_cortana) 30.00)))))

(script static void d40_220_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_220_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_220_cortana) 30.00)))))

(script static void d40_230_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_230_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_230_cortana) 10.00)))))

(script static void d40_240_pilot
	(begin
		(sound_impulse_start sound\dialog\d40\d40_240_pilot none pilot_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_240_pilot) 15.00)))))

(script static void d40_250_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_250_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_250_cortana) 15.00)))))

(script static void d40_260_pilot
	(begin
		(sound_impulse_start sound\dialog\d40\d40_260_pilot none pilot_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_260_pilot) 5.00)))))

(script static void d40_270_pilot
	(begin
		(sound_impulse_start sound\dialog\d40\d40_270_pilot none pilot_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_270_pilot) 15.00)))))

(script static void d40_280_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_280_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_280_cortana) 30.00)))))

(script static void d40_300_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_300_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_300_cortana) 30.00)))))

(script static void d40_310_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_310_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_310_cortana) 30.00)))))

(script static void d40_320_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_320_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_320_cortana) 30.00)))))

(script static void d40_330_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_330_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_330_cortana) 30.00)))))

(script static void d40_340_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_340_cortana none cortana_dialogue_scale)))

(script static void d40_350_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_350_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_350_cortana) 30.00)))))

(script static void d40_360_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_360_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_360_cortana) 30.00)))))

(script static void d40_362_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_362_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_362_cortana) 30.00)))))

(script static void d40_363_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_363_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_363_cortana) 30.00)))))

(script static void d40_370_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_370_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_370_cortana) 30.00)))))

(script static void d40_380_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_380_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_380_cortana) 30.00)))))

(script static void d40_390_pilot
	(begin
		(sound_impulse_start sound\dialog\d40\d40_390_pilot none pilot_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_390_pilot) 30.00)))))

(script static void d40_400_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_400_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_400_cortana) 30.00)))))

(script static void d40_410_pilot
	(begin
		(sound_impulse_start sound\dialog\d40\d40_410_pilot none pilot_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_410_pilot) 30.00)))))

(script static void d40_420_pilot
	(begin
		(sound_impulse_start sound\dialog\d40\d40_420_pilot none pilot_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_420_pilot) 30.00)))))

(script static void d40_440_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_440_cortana none cortana_dialogue_scale)))

(script static void d40_441_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_441_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_441_cortana) 240.00)))))

(script static void d40_450_cortana
	(begin
		(sound_impulse_start sound\dialog\d40\d40_450_cortana none cortana_dialogue_scale)
		(sleep
			(max 0.00
				(-
					(sound_impulse_time sound\dialog\d40\d40_450_cortana) 30.00)))))

(script static void cutscene_lose
	(begin
		(sound_looping_stop levels\d40\music\d40_07)
		(sound_looping_stop levels\d40\music\d40_08)
		(sound_looping_start sound\sinomatixx_music\d40_lose_music none 1.00)
		(sound_looping_start sound\sinomatixx_foley\d40_lose_foley none 1.00)
		(fade_out 1.00 1.00 1.00 15)
		(sleep 15)
		(camera_control true)
		(cinematic_start)
		(unit_suspended cutscene_lose true)
		(unit_suspended cutscene_lose true)
		(switch_bsp 8)
		(camera_set game_lose_1a 0)
		(camera_set game_lose_1c 300)
		(fade_in 1.00 1.00 1.00 15)
		(sleep 30)
		(object_destroy poa_explosion)
		(object_create poa_explosion)
		(object_pvs_activate poa_explosion)
		(sleep 120)
		(player_effect_set_max_rotation 0.00 0.50 0.50)
		(player_effect_start 1.00 2.00)
		(sleep 120)
		(cinematic_screen_effect_start true)
		(cinematic_screen_effect_set_filter_desaturation_tint 1.00 1.00 1.00)
		(cinematic_screen_effect_set_filter 0.00 1.00 0.00 1.00 true 1.00)
		(sleep 30)
		(fade_out 1.00 1.00 1.00 15)
		(sleep 30)
		(cinematic_screen_effect_stop)
		(player_effect_stop 4.00)
		(object_destroy poa_explosion)
		(game_lost)))

(script static void cinematic_time_up
	(begin cinematic_time_up))

(script static void x70_finale
	(begin
		(cinematic_suppress_bsp_object_creation true)
		(player_effect_start 1.00 0.00)
		(player_effect_set_max_translation 0.00 0.00 0.00)
		(player_effect_set_max_rotation 0.00 0.00 0.00)
		(player_effect_set_max_rumble 0.00 0.00)
		(sound_looping_start sound\sinomatixx_music\x70_music none 1.00)
		(sound_looping_start sound\sinomatixx_foley\x70_foley1 none 1.00)
		(object_destroy_containing nipple)
		(fade_out 1.00 1.00 1.00 50)
		(sleep 30)
		(cinematic_start)
		(camera_control true)
		(switch_bsp 7)
		(object_teleport x70_finale player0_finale_pause)
		(object_teleport x70_finale player1_finale_pause)
		(unit_suspended x70_finale true)
		(unit_suspended x70_finale true) x70_finale x70_finale
		(sound_class_set_gain weapon_fire 0.00 0)
		(sound_class_set_gain projectile_detonation 0.00 0)
		(sound_class_set_gain projectile_impact 0.00 0)
		(sound_class_set_gain unit_dialog 0.00 0) x70_finale
		(if
			(= easy
				(game_difficulty_get_real))
			(begin
				(switch_bsp 8) x70_finale
				(sound_class_set_gain unit_footsteps 0.00 0) x70_finale
				(fade_out 0.00 0.00 0.00 0)
				(switch_bsp 9)
				(fade_in 0.00 0.00 0.00 0)
				(rasterizer_model_ambient_reflection_tint 1.00 1.00 1.00 1.00) x70_finale x70_finale
				(fade_in 1.00 1.00 1.00 15) x70_finale x70_finale x70_finale x70_finale x70_finale
				(fade_out 0.00 0.00 0.00 120)
				(sleep 520)
				(cinematic_screen_effect_stop)
				(rasterizer_model_ambient_reflection_tint 0.00 0.00 0.00 0.00)
				(print cue credits)))
		(if
			(= normal
				(game_difficulty_get_real))
			(begin
				(switch_bsp 8) x70_finale
				(sound_class_set_gain unit_footsteps 0.00 0) x70_finale
				(fade_out 0.00 0.00 0.00 0)
				(switch_bsp 9)
				(fade_in 0.00 0.00 0.00 0)
				(rasterizer_model_ambient_reflection_tint 1.00 1.00 1.00 1.00) x70_finale x70_finale
				(fade_in 1.00 1.00 1.00 15) x70_finale x70_finale x70_finale x70_finale x70_finale
				(fade_out 0.00 0.00 0.00 120)
				(sleep 520)
				(cinematic_screen_effect_stop)
				(rasterizer_model_ambient_reflection_tint 0.00 0.00 0.00 0.00)
				(print cue credits)))
		(if
			(= hard
				(game_difficulty_get_real))
			(begin
				(switch_bsp 8) x70_finale
				(sound_class_set_gain unit_footsteps 0.00 0) x70_finale
				(fade_out 0.00 0.00 0.00 0)
				(switch_bsp 9)
				(fade_in 0.00 0.00 0.00 0)
				(rasterizer_model_ambient_reflection_tint 1.00 1.00 1.00 1.00) x70_finale x70_finale
				(fade_in 1.00 1.00 1.00 15) x70_finale x70_finale x70_finale x70_finale x70_finale
				(fade_out 0.00 0.00 0.00 120)
				(sleep 520)
				(cinematic_screen_effect_stop)
				(rasterizer_model_ambient_reflection_tint 0.00 0.00 0.00 0.00)
				(print cue credits)))
		(if
			(= impossible
				(game_difficulty_get_real))
			(begin
				(print happy easter)
				(switch_bsp 8) x70_finale
				(switch_bsp 9)
				(fade_in 0.00 0.00 0.00 0)
				(rasterizer_model_ambient_reflection_tint 1.00 1.00 1.00 1.00) x70_finale x70_finale
				(fade_in 1.00 1.00 1.00 15) x70_finale x70_finale x70_finale x70_finale x70_finale
				(fade_out 0.00 0.00 0.00 120)
				(sleep 520)
				(cinematic_screen_effect_stop)
				(rasterizer_model_ambient_reflection_tint 0.00 0.00 0.00 0.00)
				(print cue credits)))))

(script static void cinematic_finale
	(begin cinematic_finale))

(script static void x70_bridge
	(begin
		(wake bridge_music_1)
		(sound_looping_start sound\sinomatixx_foley\d40_bridge_foley1 none 1.00)
		(fade_out 1.00 1.00 1.00 30)
		(sleep 30)
		(cinematic_start)
		(camera_control true)
		(switch_bsp 1)
		(object_teleport x70_bridge player0_bridge_pause)
		(object_teleport x70_bridge player1_bridge_pause)
		(unit_suspended x70_bridge true)
		(unit_suspended x70_bridge true)
		(cinematic_set_near_clip_distance 0.01) x70_bridge
		(switch_bsp 4) x70_bridge
		(switch_bsp 1)
		(breakable_surfaces_enable true)
		(sound_looping_start sound\sinomatixx_foley\d40_bridge_foley2 none 1.00) x70_bridge
		(cinematic_screen_effect_stop)
		(cinematic_set_near_clip_distance 0.06)
		(object_teleport x70_bridge player0_playon_base)
		(object_teleport x70_bridge player1_playon_base)
		(unit_suspended x70_bridge false)
		(unit_suspended x70_bridge false)
		(camera_control false)
		(cinematic_stop)
		(sleep 15)
		(fade_in 1.00 1.00 1.00 15)
		(sleep 15)))

(script static void cinematic_bridge
	(begin cinematic_bridge))

(script static void cutscene_insertion
	(begin
		(fade_out 0.00 0.00 0.00 0)
		(camera_control true)
		(cinematic_start)
		(object_teleport cutscene_insertion player0_intro_base)
		(object_teleport cutscene_insertion player1_intro_base)
		(unit_suspended cutscene_insertion true)
		(unit_suspended cutscene_insertion true)
		(switch_bsp 8)
		(wake insertion_music) cutscene_insertion
		(switch_bsp 0) cutscene_insertion
		(fade_out 1.00 1.00 1.00 15)
		(sleep 15)
		(unit_suspended cutscene_insertion false)
		(unit_suspended cutscene_insertion false)
		(object_teleport cutscene_insertion player0_intro_done)
		(object_teleport cutscene_insertion player1_intro_done)
		(object_destroy chief_insertion)
		(object_destroy intro_banshee)
		(camera_control false)
		(cinematic_stop)
		(fade_in 1.00 1.00 1.00 15)
		(breakable_surfaces_reset)
		(breakable_surfaces_enable false)
		(sound_class_set_gain vehicle_engine 1.00 5)))

(script static void cinematic_intro
	(begin cinematic_intro))

(script static void chapter_d40_1
	(begin
		(sleep 30)
		(cinematic_set_title chapter_d40_1)
		(sleep 150)))

(script static void chapter_d40_2
	(begin
		(show_hud false)
		(cinematic_show_letterbox true)
		(sleep 30)
		(cinematic_set_title chapter_d40_2)
		(sleep 90)
		(cinematic_set_title chapter_d40_2b)
		(sleep 150)
		(cinematic_show_letterbox false)
		(show_hud true)))

(script static void chapter_d40_3
	(begin
		(show_hud false)
		(cinematic_show_letterbox true)
		(sleep 30)
		(cinematic_set_title chapter_d40_3)
		(sleep 150)
		(cinematic_show_letterbox false)
		(show_hud true)))

(script static void obj_bridge
	(begin
		(show_hud_help_text true)
		(hud_set_help_text obj_bridge)
		(hud_set_objective_text obj_bridge)
		(sleep hud_objectives_display_time)
		(show_hud_help_text false)))

(script static void obj_engineering
	(begin
		(show_hud_help_text true)
		(hud_set_help_text obj_engineering)
		(hud_set_objective_text obj_engineering)
		(sleep hud_objectives_display_time)
		(show_hud_help_text false)))

(script static void obj_retract
	(begin
		(show_hud_help_text true)
		(hud_set_help_text obj_retract)
		(hud_set_objective_text obj_retract)
		(sleep hud_objectives_display_time)
		(show_hud_help_text false)))

(script static void obj_frogblast
	(begin
		(show_hud_help_text true)
		(hud_set_help_text obj_frogblast)
		(hud_set_objective_text obj_frogblast)
		(sleep hud_objectives_display_time)
		(show_hud_help_text false)))

(script static void obj_elevator
	(begin
		(show_hud_help_text true)
		(hud_set_help_text obj_elevator)
		(hud_set_objective_text obj_elevator)
		(sleep hud_objectives_display_time)
		(show_hud_help_text false)))

(script static void obj_escape
	(begin
		(show_hud_help_text true)
		(hud_set_help_text obj_escape)
		(hud_set_objective_text obj_escape)
		(sleep hud_objectives_display_time)
		(show_hud_help_text false)))

(script continuous void save_loop
	(begin
		(sleep_until save_now testing_save)
		(game_save_no_timeout)
		(set save_now false)))

(script static void certain_save
	(begin
		(set save_now true)))

(script static void enc6_5_dropship
	(begin
		(object_create enc6_5_dropship)
		(object_teleport enc6_5_dropship enc6_5_dropship)
		(recording_play
			(unit enc6_5_dropship) enc6_5_dropship)
		(sleep
			(recording_time enc6_5_dropship))
		(vehicle_hover enc6_5_dropship true)
		(object_set_ranged_attack_inhibited enc6_5_dropship false)))

(script dormant void endgame_cinematics
	(begin
		(if
			(<=
				(hud_get_timer_ticks) 0)
			(begin
				(show_hud_timer false)
				(set timer_active false)
				(pause_hud_timer true) endgame_cinematics)
			(begin
				(show_hud_timer false)
				(set timer_active false)
				(pause_hud_timer true) endgame_cinematics
				(game_won)))))

(script continuous void trench_jeep_test
	(begin
		(sleep_until
			(not trench_jeep_test_paused))
		(if
			(or
				(vehicle_test_seat_list trench_jeep1 w-driver
					(players))
				(vehicle_test_seat_list trench_jeep2 w-driver
					(players))
				(vehicle_test_seat_list trench_jeep3 w-driver
					(players))
				(vehicle_test_seat_list trench_jeep4 w-driver
					(players))
				(vehicle_test_seat_list asspain_1 w-driver
					(players))
				(vehicle_test_seat_list asspain_2 w-driver
					(players))
				(vehicle_test_seat_list asspain_3 w-driver
					(players)))
			(set time_out_of_jeep 0)
			(set time_out_of_jeep
				(+ time_out_of_jeep 1.00)))
		(sleep 30)
		(if
			(>= time_out_of_jeep 15)
			(begin
				(set time_out_of_jeep 0) trench_jeep_test))))

(script dormant void timer_begin
	(begin
		(if
			(= impossible
				(game_difficulty_get)) timer_begin timer_begin)
		(hud_set_timer_position 0 0 bottom_right)
		(hud_set_timer_time timer_minutes timer_seconds)
		(hud_set_timer_warning_time 1 0)
		(show_hud_timer true)
		(set timer_active true) timer_begin
		(wake trench_jeep_test)
		(sleep_until
			(and timer_active
				(<=
					(hud_get_timer_ticks) 0)))
		(if timer_active
			(wake endgame_cinematics))))

(script dormant void endgame_cleaner
	(begin
		(sleep 400)
		(object_destroy_containing bsp_8_)))

(script dormant void test_for_endgame
	(begin test_for_endgame
		(sleep_until
			(volume_test_objects grand_finale
				(players)) testing_trench)
		(deactivate_team_nav_point_flag player nav_endpoint)
		(sound_looping_stop levels\d40\music\d40_08)
		(object_destroy_all)
		(object_create_containing bsp_8_1)
		(object_create_containing bsp_8_5)
		(object_create_containing bsp_8_7)
		(object_create_containing bsp_8_8)
		(wake endgame_cleaner)
		(wake endgame_cinematics)))

(script dormant void enc7_7
	(begin
		(sleep_until
			(volume_test_objects enc7_7
				(players)) testing_trench)
		(wake test_for_endgame)
		(ai_place enc7_7_cov/left_gunner)
		(ai_place enc7_7_cov/right_gunner)
		(ai_try_to_fight_player enc7_7_cov/left_gunner)
		(ai_try_to_fight_player enc7_7_cov/right_gunner)
		(vehicle_load_magic enc7_7_turret_left gunner
			(ai_actors enc7_7_cov/left_gunner))
		(vehicle_load_magic enc7_7_turret_right gunner
			(ai_actors enc7_7_cov/right_gunner))
		(ai_command_list enc7_7_cov/right_gunner enc7_7_shooting)
		(ai_command_list enc7_7_cov/left_gunner enc7_7_shooting)
		(effect_new explosion_large enc7_7_l1)
		(sleep 2)
		(effect_new explosion_large enc7_7_r1)
		(sleep_until
			(volume_test_objects enc7_7_2
				(players)) testing_very_fast)
		(effect_new explosion_steam enc7_7_l4)
		(sleep 2)
		(effect_new explosion_large_no enc7_7_r4)
		(sleep_until
			(volume_test_objects enc7_7_3
				(players)) testing_very_fast)
		(effect_new explosion_medium_no enc7_7_r5)
		(sleep_until
			(volume_test_objects enc7_7_4
				(players)) testing_very_fast)
		(effect_new explosion_steam enc7_7_r6)
		(sleep 7)
		(effect_new explosion_large_no enc7_7_l6)
		(sleep_until
			(volume_test_objects enc7_7_6
				(players)) testing_very_fast)
		(effect_new explosion_large_no enc7_7_l8)
		(sleep 5)
		(effect_new explosion_large enc7_7_r8)))

(script dormant void enc7_1
	(begin
		(sleep_until
			(volume_test_objects enc7_1
				(players)) testing_trench)
		(wake enc7_7)
		(effect_new explosion_steam_no enc6_9_blast2)
		(sleep 18)
		(effect_new explosion_large enc6_9_blast3)
		(sleep 15)
		(effect_new explosion_small enc6_9_blast4)
		(sleep 20)
		(effect_new explosion_large_no enc6_9_blast5)
		(sleep 10)
		(effect_new explosion_small enc6_9_blast6)
		(sleep 15)
		(effect_new explosion_large enc6_9_blast7)
		(sleep 13)
		(ai_place enc7_7_cov/r3)
		(ai_place enc7_7_cov/r7)
		(ai_place enc7_7_flood)
		(ai_try_to_fight enc7_7_cov/r3 enc7_7_flood)
		(ai_try_to_fight enc7_7_cov/r7 enc7_7_flood)
		(ai_magically_see_players enc7_7_cov)
		(ai_magically_see_players enc7_7_flood)))

(script dormant void section7
	(begin
		(sleep_until
			(volume_test_objects section7
				(players)) testing_trench)
		(ai_place enc7_1_flood)
		(effect_new explosion_large enc6_9_blast8)
		(wake enc7_1)
		(ai_kill enc6_9_flood)))

(script dormant void enc6_10
	(begin
		(ai_place enc6_9_flood/infsb)))

(script dormant void enc6_9_1
	(begin
		(sleep_until
			(volume_test_objects enc6_9_1
				(players)) 1)
		(sound_looping_start levels\d40\music\d40_09 none 1.00)))

(script dormant void enc6_9
	(begin
		(wake enc6_9_1)
		(wake enc6_10)
		(ai_place enc6_9_flood/infsa)
		(ai_place enc6_9_flood/carriers)
		(effect_new explosion_large enc6_9_blast1) enc6_9))

(script continuous void enc6_8_ambients
	(begin
		(begin_random
			(begin
				(effect_new explosion_small enc6_8_blast12)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_8_blast13)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_8_blast14)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_8_blast15)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_8_blast16)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_8_blast17)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_8_blast18)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_8_blast19)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium enc6_8_blast20)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_8_blast21)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_8_blast22)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium enc6_8_blast23)
				(sleep explosion_seperation)))
		(sleep 15)))

(script dormant void enc6_8_8
	(begin
		(sleep_until
			(volume_test_objects enc6_8_8
				(players)) testing_trench)
		(effect_new explosion_large_no enc6_8_blast10)
		(effect_new explosion_large_no enc6_8_blast11)))

(script dormant void enc6_8_7
	(begin
		(sleep_until
			(volume_test_objects enc6_8_7
				(players)) testing_trench)
		(wake enc6_8_8)
		(effect_new explosion_large enc6_8_blast9)))

(script dormant void enc6_8_6
	(begin
		(sleep_until
			(volume_test_objects enc6_8_6
				(players)) testing_trench)
		(effect_new explosion_large_no enc6_8_blast7)
		(effect_new explosion_medium_no enc6_8_blast8)))

(script dormant void enc6_8_5
	(begin
		(sleep_until
			(volume_test_objects enc6_8_5
				(players)) testing_trench)
		(wake enc6_8_6)
		(effect_new explosion_large_no enc6_8_blast6)))

(script dormant void enc6_8_3
	(begin
		(sleep_until
			(volume_test_objects enc6_8_3
				(players)) testing_trench)
		(sleep_until
			(volume_test_objects enc6_8_6
				(players)) testing_trench) enc6_8_3))

(script dormant void enc6_8_4
	(begin
		(sleep_until
			(volume_test_objects enc6_8_4
				(players)) testing_trench)
		(wake enc6_8_5)
		(effect_new explosion_medium_no enc6_8_blast5)
		(sleep -1 enc6_8_3)))

(script dormant void enc6_8_2
	(begin
		(sleep_until
			(volume_test_objects enc6_8_2
				(players)) testing_trench)
		(wake enc6_8_3)
		(wake enc6_8_4)
		(wake enc6_8_7)
		(effect_new explosion_medium_no enc6_8_blast3)
		(effect_new explosion_large_no enc6_8_blast4)))

(script dormant void enc6_8_1
	(begin
		(sleep_until
			(volume_test_objects enc6_8_1
				(players)) testing_trench)
		(wake enc6_8_2)
		(effect_new explosion_large_no enc6_8_blast2)))

(script static void enc6_8_cleaner
	(begin
		(sleep -1 enc6_8_ambients)
		(sleep -1 enc6_8_3)
		(sleep -1 enc6_8_4)
		(sleep -1 enc6_8_5)
		(sleep -1 enc6_8_6)))

(script dormant void enc6_8
	(begin
		(set explosion_seperation 15)
		(wake enc6_8_ambients)
		(wake enc6_8_1)
		(sleep -1 trench_jeep_test)
		(effect_new explosion_small enc6_8_blast1)
		(sleep_until
			(volume_test_objects enc6_9
				(players)) testing_trench) enc6_8
		(wake enc6_9)))

(script static void trench_scene
	(begin
		(ai_magically_see_players trench_banshee_pilots)
		(ai_magically_see_players trench_banshees)
		(wake trench_pelican_thread)
		(sleep 60)
		(wake trench_banshee1_thread)
		(wake trench_banshee2_thread)
		(sleep 70)
		(sound_impulse_start sound\dialog\d40\d40_400_cortana none 1.00)))

(script static void kill_trench_scene
	(begin
		(set trench_scene_allow_continue false)
		(sound_impulse_stop sound\dialog\d40\d40_411_pilot)
		(sound_impulse_stop sound\dialog\d40\d40_400_cortana)))

(script static void trench_scene_continue
	(begin
		(set trench_scene_continued true) trench_scene_continue
		(sound_looping_stop levels\d40\music\d40_07)
		(sound_looping_start levels\d40\music\d40_08 none 1.00) trench_scene_continue
		(sleep 180)
		(set trench_jeep_test_paused false)
		(set timer_active true)
		(pause_hud_timer false)
		(show_hud_timer true)
		(if
			(>=
				(hud_get_timer_ticks) trench_safe_save_time)
			(begin
				(game_save_cancel)
				(game_save)))
		(activate_team_nav_point_flag default_red player nav_endpoint 0.00)))

(script dormant void enc6_7_2
	(begin
		(sleep_until
			(volume_test_objects enc6_7_2
				(players)) testing_trench)
		(ai_place enc6_8_cov)
		(ai_command_list enc6_8_cov enc6_8_longrun)
		(effect_new explosion_large enc6_7_blast2)
		(sleep 30)
		(effect_new explosion_steam_no enc6_7_blast3)
		(sleep 30)
		(effect_new explosion_steam_no enc6_7_blast4)
		(sleep 30)
		(effect_new explosion_medium_no enc6_7_blast5)
		(sleep 30)
		(effect_new explosion_steam enc6_7_blast6)))

(script dormant void enc6_7_1
	(begin
		(sleep_until
			(volume_test_objects enc6_7_1
				(players)) testing_trench)
		(wake enc6_7_2)
		(if
			(not trench_scene_continued) enc6_7_1)))

(script dormant void enc6_7
	(begin
		(wake enc6_7_1)
		(effect_new explosion_steam enc6_7_blast1)
		(sleep_until
			(volume_test_objects enc6_8
				(players)) testing_trench)
		(wake enc6_8)))

(script continuous void enc6_6_ambients
	(begin
		(sleep 30)))

(script dormant void enc6_6_1
	(begin
		(sleep_until
			(volume_test_objects enc6_6_1
				(players)) testing_trench)
		(deactivate_team_nav_point_flag player nav_midpoint)
		(set timer_active false)
		(show_hud_timer false)
		(pause_hud_timer true)
		(sound_looping_set_alternate levels\d40\music\d40_07 true)
		(set trench_jeep_test_paused true) enc6_6_1 enc6_6_1
		(sleep 850 enc6_6_ambients)
		(sleep 510)
		(if
			(not trench_scene_continued) enc6_6_1)))

(script static void enc6_6_cleaner
	(begin
		(sleep -1 enc6_6_ambients)))

(script dormant void enc6_6
	(begin
		(sleep_until
			(volume_test_objects enc6_6
				(players)) testing_trench)
		(wake enc6_6_ambients)
		(wake enc6_6_1)
		(sleep_until
			(volume_test_objects enc6_7
				(players)) testing_trench)
		(wake enc6_7) enc6_6))

(script continuous void enc6_5_ambients
	(begin
		(begin_random
			(begin
				(effect_new explosion_steam_no enc6_5_blast3)
				(sleep 45))
			(begin
				(effect_new explosion_steam_no enc6_5_blast4)
				(sleep 45))
			(begin
				(effect_new explosion_steam_no enc6_5_blast5)
				(sleep 45))
			(begin
				(effect_new explosion_steam_no enc6_5_blast6)
				(sleep 45))
			(begin
				(effect_new explosion_steam_no enc6_5_blast7)
				(sleep 45))
			(begin
				(effect_new explosion_steam_no enc6_5_blast8)
				(sleep 45)))))

(script dormant void enc6_5_9
	(begin
		(sleep_until
			(volume_test_objects enc6_5_9
				(players)) testing_trench)))

(script dormant void enc6_5_8
	(begin
		(sleep_until
			(volume_test_objects enc6_5_8
				(players)) testing_trench) enc6_5_8
		(sleep 20) enc6_5_8))

(script dormant void enc6_5_7
	(begin
		(sleep_until
			(volume_test_objects enc6_5_7
				(players)) testing_trench)
		(wake enc6_5_8)))

(script dormant void enc6_5_6
	(begin
		(sleep_until
			(volume_test_objects enc6_5_6
				(players)) testing_trench)
		(wake enc6_5_7)
		(sleep -1 enc6_5_ambients)
		(ai_place enc6_5_cov/evacs1)
		(ai_place enc6_5_cov/evacs2)
		(ai_place enc6_5_cov/gunner)
		(ai_go_to_vehicle enc6_5_cov/gunner enc6_5_turret gunner) enc6_5_6
		(ai_defend enc6_5_cov/evacs)))

(script dormant void enc6_5_5
	(begin
		(sleep_until
			(volume_test_objects enc6_5_5
				(players)) testing_trench)))

(script dormant void enc6_5_4
	(begin
		(sleep_until
			(volume_test_objects enc6_5_4
				(players)) testing_trench)
		(wake enc6_5_5)
		(wake enc6_5_6)
		(ai_maneuver enc6_5_cov/grunts_advance)
		(wake enc6_5_ambients)))

(script dormant void enc6_5_3
	(begin
		(sleep_until
			(volume_test_objects enc6_5_3
				(players)) testing_trench)))

(script dormant void enc6_5_2
	(begin
		(sleep_until
			(volume_test_objects enc6_5_2
				(players)) testing_trench)
		(wake enc6_5_3)
		(wake enc6_5_4)
		(effect_new explosion_large enc6_5_blast2)))

(script dormant void enc6_5_1
	(begin
		(sleep_until
			(volume_test_objects enc6_5_1
				(players)) testing_trench)
		(effect_new explosion_large enc6_5_blast1)
		(ai_place enc6_5_flood/infsb)))

(script static void enc6_5_cleaner
	(begin
		(sleep -1 enc6_5_1)
		(sleep -1 enc6_5_3)
		(sleep -1 enc6_5_5)
		(sleep -1 enc6_5_8)
		(sleep -1 enc6_5_ambients)
		(ai_kill enc6_5_flood)))

(script dormant void enc6_5
	(begin
		(wake enc6_5_1)
		(wake enc6_5_2)
		(object_create_anew enc6_5_turret)
		(sleep_until
			(volume_test_objects enc6_6
				(players)) testing_trench)
		(wake enc6_6) enc6_5))

(script dormant void enc6_4_8
	(begin
		(sleep_until
			(volume_test_objects enc6_4_8
				(players)) testing_trench)
		(ai_place enc6_5_cov/grunts_advance)
		(ai_place enc6_5_flood/infsa)
		(if
			(or coop
				(= hard
					(game_difficulty_get))
				(= impossible
					(game_difficulty_get)))
			(begin
				(ai_place enc6_5_cov/fuel_rod_grunts)
				(ai_magically_see_players enc6_5_cov/fuel_rod_grunts)
				(ai_try_to_fight_player enc6_5_cov/fuel_rod_grunts)))
		(objects_predict enc6_5_dropship)))

(script dormant void enc6_4_7
	(begin
		(sleep_until
			(volume_test_objects enc6_4_7
				(players)) testing_trench)
		(wake enc6_4_8)
		(effect_new explosion_large_no enc6_4_blast8)
		(sleep 15)
		(effect_new explosion_large enc6_4_blast9)))

(script dormant void enc6_4_6
	(begin
		(sleep_until
			(volume_test_objects enc6_4_6
				(players)) testing_trench)
		(wake enc6_4_7)))

(script dormant void enc6_4_5
	(begin
		(sleep_until
			(volume_test_objects enc6_4_5
				(players)) testing_trench)
		(effect_new explosion_medium_no enc6_4_blast6)
		(sleep 25)
		(effect_new explosion_large_no enc6_4_blast7)))

(script dormant void enc6_4_4
	(begin
		(sleep_until
			(volume_test_objects enc6_4_4
				(players)) testing_trench)
		(effect_new explosion_steam enc6_4_blast11)
		(sleep 15)
		(effect_new explosion_small enc6_4_blast11)))

(script dormant void enc6_4_3
	(begin
		(sleep_until
			(volume_test_objects enc6_4_3
				(players)) testing_trench)
		(effect_new explosion_steam enc6_4_blast10)
		(sleep 15)
		(effect_new explosion_small enc6_4_blast10)))

(script dormant void enc6_4_2
	(begin
		(sleep_until
			(volume_test_objects enc6_4_2
				(players)) testing_trench)
		(effect_new explosion_medium_no enc6_4_blast4)
		(sleep 25)
		(effect_new explosion_large_no enc6_4_blast5)))

(script dormant void enc6_4_1
	(begin
		(sleep_until
			(volume_test_objects enc6_4_1
				(players)) testing_trench)
		(wake enc6_4_2)
		(wake enc6_4_3)
		(wake enc6_4_4)
		(wake enc6_4_5)
		(wake enc6_4_6)))

(script static void enc6_4_cleaner
	(begin
		(sleep -1 enc6_4_2)
		(sleep -1 enc6_4_3)
		(sleep -1 enc6_4_4)
		(sleep -1 enc6_4_5)
		(sleep 150)
		(ai_kill enc6_4_flood)))

(script dormant void enc6_4
	(begin
		(wake enc6_4_1)
		(effect_new explosion_medium enc6_4_blast1)
		(effect_new explosion_grenade enc6_4_blast2)
		(effect_new explosion_large enc6_4_blast3)
		(sleep_until
			(volume_test_objects enc6_5
				(players)) testing_trench)
		(wake enc6_5) enc6_4))

(script dormant void enc6_3_4
	(begin
		(sleep_until
			(volume_test_objects enc6_3_4
				(players)) testing_trench)
		(ai_place enc6_3_sents/squadc)
		(ai_place enc6_4_flood/squada)
		(ai_place enc6_4_flood/squadb)
		(ai_place enc6_4_flood/squadc)
		(ai_place enc6_4_flood/infs)
		(ai_kill enc6_2_sents)
		(ai_kill enc6_2_flood)))

(script dormant void enc6_3_2
	(begin
		(sleep_until
			(volume_test_objects enc6_3_2
				(players)) testing_trench)
		(ai_place enc6_3_flood/infsb)
		(ai_kill enc6_3_sents/squadb)
		(effect_new explosion_medium enc6_3_2_blast1)
		(effect_new explosion_medium enc6_3_2_blast2)
		(sleep_until
			(volume_test_objects enc6_3_2b
				(players)) testing_trench) enc6_3_2))

(script dormant void enc6_3_3
	(begin
		(sleep_until
			(volume_test_objects enc6_3_3
				(players)) testing_trench)
		(effect_new explosion_large enc6_3_3_blast1)
		(sleep -1 enc6_3_2)))

(script dormant void enc6_3_1
	(begin
		(sleep_until
			(volume_test_objects enc6_3_1
				(players)) testing_trench)
		(wake enc6_3_2)
		(wake enc6_3_3)
		(wake enc6_3_4)
		(ai_place enc6_3_sents/squadb)))

(script static void enc6_3_cleaner
	(begin
		(sleep -1 enc6_3_2)
		(sleep -1 enc6_3_3)
		(sleep 150)
		(ai_kill enc6_3_flood)
		(ai_kill enc6_3_sents)))

(script dormant void enc6_3
	(begin
		(wake enc6_3_1)
		(ai_place enc6_3_sents/squada)
		(ai_place enc6_3_flood/combatsa)
		(ai_place enc6_3_flood/infsa)
		(sleep_until
			(volume_test_objects enc6_4
				(players)) testing_trench)
		(wake enc6_4) enc6_3))

(script dormant void enc6_2_8
	(begin
		(sleep_until
			(volume_test_objects enc6_2_8
				(players)) testing_trench)
		(ai_place enc6_2_sents/squadf)
		(effect_new explosion_steam_no enc6_2_blast3)))

(script dormant void enc6_2_7
	(begin
		(sleep_until
			(volume_test_objects enc6_2_7
				(players)) testing_trench)
		(ai_place enc6_2_sents/squade)
		(effect_new explosion_large enc6_2_blast4)))

(script dormant void enc6_2_6
	(begin
		(sleep_until
			(volume_test_objects enc6_2_6
				(players)) testing_trench)
		(effect_new explosion_large enc6_2_blast7)))

(script dormant void enc6_2_5
	(begin
		(sleep_until
			(volume_test_objects enc6_2_5
				(players)) testing_trench)
		(wake enc6_2_6)
		(ai_place enc6_2_flood/infs2)
		(ai_kill enc6_2_sents/squada)
		(ai_kill enc6_2_sents/squadb)))

(script dormant void enc6_2_4
	(begin
		(sleep_until
			(volume_test_objects enc6_2_4
				(players)) testing_trench)
		(ai_place enc6_2_sents/squade)))

(script dormant void enc6_2_3
	(begin
		(sleep_until
			(volume_test_objects enc6_2_3
				(players)) testing_trench)
		(ai_place enc6_2_sents/squadf)))

(script dormant void enc6_2_2
	(begin
		(sleep_until
			(volume_test_objects enc6_2_2
				(players)) testing_trench)
		(ai_place enc6_2_sents/squadd)
		(effect_new explosion_medium enc6_2_blast5)
		(effect_new explosion_medium enc6_2_blast6)))

(script dormant void enc6_2_1
	(begin
		(sleep_until
			(volume_test_objects enc6_2_1
				(players)) testing_trench)
		(wake enc6_2_2)
		(wake enc6_2_3)
		(wake enc6_2_4)
		(wake enc6_2_5)
		(wake enc6_2_7)
		(wake enc6_2_8)
		(ai_place enc6_2_sents/squadc)
		(effect_new explosion_large_no enc6_2_1_blast1)
		(effect_new explosion_medium enc6_2_1_blast2)))

(script dormant void enc6_2_0
	(begin
		(sleep_until
			(volume_test_objects enc6_2_0
				(players)) testing_trench)
		(wake enc6_2_1)))

(script static void enc6_2_cleaner
	(begin
		(sleep -1 enc6_2_2)
		(sleep -1 enc6_2_3)
		(sleep -1 enc6_2_4)
		(sleep -1 enc6_2_7)
		(sleep -1 enc6_2_8)
		(sleep 150)
		(ai_kill enc6_2_flood)
		(ai_kill enc6_2_sents)))

(script dormant void enc6_2
	(begin
		(wake enc6_2_0)
		(ai_place enc6_2_flood/infs)
		(ai_place enc6_2_flood/combats)
		(ai_place enc6_2_sents/squada)
		(ai_place enc6_2_sents/squadb)
		(sleep 120)
		(effect_new explosion_large enc6_2_blast1)
		(effect_new explosion_medium_no enc6_2_blast2)
		(sleep_until
			(volume_test_objects enc6_3
				(players)) testing_trench)
		(wake enc6_3) enc6_2))

(script dormant void enc6_1_9
	(begin
		(sleep_until
			(volume_test_objects enc6_1_9
				(players)) testing_trench)))

(script dormant void enc6_1_8
	(begin
		(sleep_until
			(volume_test_objects enc6_1_8
				(players)) testing_trench)
		(wake enc6_1_9)))

(script dormant void enc6_1_7
	(begin
		(sleep_until
			(volume_test_objects enc6_1_7
				(players)) testing_trench)
		(wake enc6_1_8)
		(effect_new explosion_grenade enc6_1_7_blast1)
		(effect_new explosion_medium enc6_1_7_blast2)
		(ai_kill enc6_1_flood/fodder5)))

(script dormant void enc6_1_6
	(begin
		(sleep_until
			(volume_test_objects enc6_1_6
				(players)) testing_trench)
		(ai_place enc6_1_flood/fodder6)
		(ai_kill enc6_1_flood/fodder1)
		(ai_kill enc6_1_flood/squada)
		(ai_kill enc6_1_flood/squadb)
		(ai_kill enc6_1_flood/squadc)
		(ai_kill enc6_1_flood/squadd)
		(sleep 30)
		(ai_place enc6_1_flood/fodder4)))

(script dormant void enc6_1_5
	(begin
		(sleep_until
			(volume_test_objects enc6_1_5
				(players)) testing_trench)
		(wake enc6_1_6)
		(wake enc6_1_7)))

(script dormant void enc6_1_4
	(begin
		(sleep_until
			(volume_test_objects enc6_1_4
				(players)) testing_trench)
		(ai_place enc6_1_flood/fodder2)
		(sleep 65)
		(effect_new explosion_medium enc6_1_4_blast1)))

(script dormant void enc6_1_3
	(begin
		(sleep_until
			(volume_test_objects enc6_1_3
				(players)) testing_trench)
		(wake enc6_1_4)
		(wake enc6_1_5)
		(ai_place enc6_1_flood/fodder3)))

(script dormant void enc6_1_2
	(begin
		(sleep_until
			(volume_test_objects enc6_1_2
				(players)) testing_trench)
		(wake enc6_1_3)
		(ai_place enc6_1_flood/fodder5)
		(ai_kill enc6_0_flood)))

(script dormant void enc6_1_1
	(begin
		(sleep_until
			(volume_test_objects enc6_1_1
				(players)) testing_trench)
		(effect_new explosion_steam_no enc6_1_1_blast3)
		(effect_new explosion_steam_no enc6_1_1_blast4)
		(sleep 30)
		(effect_new explosion_grenade enc6_1_1_blast1)
		(effect_new explosion_grenade enc6_1_1_blast2)
		(ai_place enc6_1_flood/squadd)))

(script continuous void enc6_1_ambients
	(begin
		(begin_random
			(begin
				(effect_new explosion_small enc6_1_amb_blast1)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_1_amb_blast2)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_steam_no enc6_1_amb_blast3)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_1_amb_blast4)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_grenade enc6_1_amb_blast5)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_1_amb_blast6)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_1_amb_blast7)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_steam_no enc6_1_amb_blast8)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_grenade enc6_1_amb_blast9)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_1_amb_blast10)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_1_amb_blast11)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_small enc6_1_amb_blast12)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_grenade enc6_1_amb_blast13)
				(sleep explosion_seperation))
			(begin
				(effect_new explosion_medium_no enc6_1_amb_blast14)
				(sleep explosion_seperation)))))

(script static void enc6_1_cleaner
	(begin
		(sleep -1 enc6_1_1)
		(sleep -1 enc6_1_4)
		(sleep -1 enc6_1_6)
		(sleep -1 enc6_1_ambients)
		(ai_kill enc6_1_flood)
		(ai_kill enc6_0_flood)
		(ai_kill enc6_0_cov)))

(script dormant void enc6_1
	(begin
		(sleep_until
			(volume_test_objects enc6_1
				(players)) testing_trench)
		(set explosion_seperation 30)
		(wake enc6_1_ambients)
		(wake enc6_1_1)
		(wake enc6_1_2)
		(ai_magically_see_players enc6_1_flood)
		(ai_playfight enc6_1_flood true)
		(ai_place enc6_1_flood/squadb)
		(ai_place enc6_1_flood/fodder1)
		(sleep_until
			(volume_test_objects enc6_2
				(players)) testing_trench)
		(wake enc6_2) enc6_1))

(script dormant void enc6_0_1
	(begin
		(sleep_until
			(volume_test_objects enc6_0_1
				(players)) testing_trench)
		(wake enc6_1)
		(ai_place enc6_1_flood/squada)
		(ai_place enc6_1_flood/squadc)
		(sleep 90)
		(effect_new explosion_steam_no enc6_0_1_blast1)
		(sleep 90)
		(effect_new explosion_small enc6_0_1_blast2)
		(sleep 15)
		(effect_new explosion_steam_no enc6_0_1_blast3)
		(sleep 45)
		(effect_new explosion_steam_no enc6_0_1_blast4)
		(if
			(or
				(vehicle_test_seat_list trench_jeep1 w-driver
					(players))
				(vehicle_test_seat_list trench_jeep2 w-driver
					(players))
				(vehicle_test_seat_list trench_jeep3 w-driver
					(players))
				(vehicle_test_seat_list trench_jeep4 w-driver
					(players))
				(vehicle_test_seat_list asspain_1 w-driver
					(players))
				(vehicle_test_seat_list asspain_2 w-driver
					(players))
				(vehicle_test_seat_list asspain_3 w-driver
					(players)))
			(sleep 1) enc6_0_1)))

(script dormant void enc6_0
	(begin
		(sleep_until
			(volume_test_objects enc6_0
				(players)) testing_trench)
		(wake enc6_0_1)
		(effect_new explosion_medium enc6_0_blast1)
		(effect_new explosion_grenade enc6_0_blast1)
		(sleep 15)
		(effect_new explosion_grenade enc6_0_blast4)
		(effect_new explosion_grenade enc6_0_blast2)
		(sleep 15)
		(effect_new explosion_grenade enc6_0_blast3)
		(ai_place enc6_0_cov)
		(ai_force_active enc6_0_cov true)
		(ai_place enc6_0_flood)
		(ai_try_to_fight enc6_0_flood enc6_0_cov)
		(ai_magically_see_encounter enc6_0_flood enc6_0_cov)))

(script dormant void enc6_0_dialog
	(begin
		(sleep_until
			(volume_test_objects enc6_0_dialog
				(players)) 1)
		(sound_looping_stop levels\d40\music\d40_06)
		(sound_looping_start levels\d40\music\d40_07 none 1.00)
		(deactivate_team_nav_point_flag player waypoint_lift) enc6_0_dialog
		(activate_team_nav_point_flag default_red player nav_midpoint 0.00)))

(script dormant void section6
	(begin
		(sleep -1 trench_jeep_test)
		(sleep -1 enc6_1_ambients)
		(sleep -1 enc6_5_ambients)
		(sleep -1 enc6_6_ambients)
		(sleep -1 enc6_8_ambients)
		(sleep_until
			(volume_test_objects section6
				(players)) testing_trench)
		(deactivate_team_nav_point_flag player waypoint_lift)
		(game_save_cancel)
		(game_save)
		(sound_looping_stop sound\sfx\ambience\d40\engine_critical)
		(wake enc6_0)
		(wake enc6_0_dialog) section6))

(script static void close_manifold_n1
	(begin
		(if
			(not manifold_n1_destroyed)
			(begin
				(device_set_position enc5_1_pistonn1 0.00)
				(if
					(!=
						(device_get_position enc5_1_pistonn1) 0.00)
					(print placeholder: alarm sound close_n1))))))

(script static void close_manifold_n3
	(begin
		(if
			(not manifold_n3_destroyed)
			(begin
				(device_set_position enc5_1_pistonn3 0.00)
				(if
					(!=
						(device_get_position enc5_1_pistonn3) 0.00)
					(print placeholder: alarm sound close_n3))))))

(script static void close_manifold_s1
	(begin
		(if
			(not manifold_s1_destroyed)
			(begin
				(device_set_position enc5_1_pistons1 0.00)
				(if
					(!=
						(device_get_position enc5_1_pistons1) 0.00)
					(print placeholder: alarm sound close_s1))))))

(script static void close_manifold_s3
	(begin
		(if
			(not manifold_s3_destroyed)
			(begin
				(device_set_position enc5_1_pistons3 0.00)
				(if
					(!=
						(device_get_position enc5_1_pistons3) 0.00)
					(print placeholder: alarm sound close_s3))))))

(script static void open_manifold_n1
	(begin
		(device_set_power enc5_1_controln1 0.00)
		(sound_impulse_start sound\sfx\ambience\d40\oven_door_alarm enc5_1_controln1 1.00)
		(device_set_power enc5_1_siglight_n11 1.00)
		(device_set_power enc5_1_siglight_n12 1.00)
		(device_set_position_immediate enc5_1_siglight_n11 1.00)
		(device_set_position_immediate enc5_1_siglight_n12 1.00) open_manifold_n1 open_manifold_n1 open_manifold_n1))

(script static void open_manifold_n3
	(begin
		(device_set_power enc5_1_controln3 0.00)
		(sound_impulse_start sound\sfx\ambience\d40\oven_door_alarm enc5_1_controln3 1.00)
		(device_set_power enc5_1_siglight_n31 1.00)
		(device_set_power enc5_1_siglight_n32 1.00)
		(device_set_position_immediate enc5_1_siglight_n31 1.00)
		(device_set_position_immediate enc5_1_siglight_n32 1.00) open_manifold_n3 open_manifold_n3 open_manifold_n3))

(script static void open_manifold_s1
	(begin
		(device_set_power enc5_1_controls1 0.00)
		(sound_impulse_start sound\sfx\ambience\d40\oven_door_alarm enc5_1_controls1 1.00)
		(device_set_power enc5_1_siglight_s11 1.00)
		(device_set_power enc5_1_siglight_s12 1.00)
		(device_set_position_immediate enc5_1_siglight_s11 1.00)
		(device_set_position_immediate enc5_1_siglight_s12 1.00) open_manifold_s1 open_manifold_s1 open_manifold_s1))

(script static void open_manifold_s3
	(begin
		(device_set_power enc5_1_controls3 0.00)
		(sound_impulse_start sound\sfx\ambience\d40\oven_door_alarm enc5_1_controls3 1.00)
		(device_set_power enc5_1_siglight_s31 1.00)
		(device_set_power enc5_1_siglight_s32 1.00)
		(device_set_position_immediate enc5_1_siglight_s31 1.00)
		(device_set_position_immediate enc5_1_siglight_s32 1.00) open_manifold_s3 open_manifold_s3 open_manifold_s3))

(script static void enc5_1_mark_manifolds
	(begin
		(deactivate_team_nav_point_flag player nav_cntrl_n1)
		(deactivate_team_nav_point_flag player nav_cntrl_n3)
		(deactivate_team_nav_point_flag player nav_cntrl_s1)
		(deactivate_team_nav_point_flag player nav_cntrl_s3)
		(if
			(and
				(not manifold_n1_destroyed)
				(>
					(device_get_position enc5_1_pistonn1) 0.00))
			(activate_team_nav_point_flag default_red player enc5_1_manifold_n1 0.00)
			(deactivate_team_nav_point_flag player enc5_1_manifold_n1))
		(if
			(and
				(not manifold_n3_destroyed)
				(>
					(device_get_position enc5_1_pistonn3) 0.00))
			(activate_team_nav_point_flag default_red player enc5_1_manifold_n3 0.00)
			(deactivate_team_nav_point_flag player enc5_1_manifold_n3))
		(if
			(and
				(not manifold_s1_destroyed)
				(>
					(device_get_position enc5_1_pistons1) 0.00))
			(activate_team_nav_point_flag default_red player enc5_1_manifold_s1 0.00)
			(deactivate_team_nav_point_flag player enc5_1_manifold_s1))
		(if
			(and
				(not manifold_s3_destroyed)
				(>
					(device_get_position enc5_1_pistons3) 0.00))
			(activate_team_nav_point_flag default_red player enc5_1_manifold_s3 0.00)
			(deactivate_team_nav_point_flag player enc5_1_manifold_s3))))

(script static void enc5_1_mark_controls
	(begin
		(deactivate_team_nav_point_flag player enc5_1_manifold_n1)
		(deactivate_team_nav_point_flag player enc5_1_manifold_n3)
		(deactivate_team_nav_point_flag player enc5_1_manifold_s1)
		(deactivate_team_nav_point_flag player enc5_1_manifold_s3)
		(if
			(=
				(device_get_power enc5_1_controln1) 1.00)
			(activate_team_nav_point_flag default_red player nav_cntrl_n1 0.40)
			(deactivate_team_nav_point_flag player nav_cntrl_n1))
		(if
			(=
				(device_get_power enc5_1_controln3) 1.00)
			(activate_team_nav_point_flag default_red player nav_cntrl_n3 0.40)
			(deactivate_team_nav_point_flag player nav_cntrl_n3))
		(if
			(=
				(device_get_power enc5_1_controls1) 1.00)
			(activate_team_nav_point_flag default_red player nav_cntrl_s1 0.40)
			(deactivate_team_nav_point_flag player nav_cntrl_s1))
		(if
			(=
				(device_get_power enc5_1_controls3) 1.00)
			(activate_team_nav_point_flag default_red player nav_cntrl_s3 0.40)
			(deactivate_team_nav_point_flag player nav_cntrl_s3))))

(script static void enc5_1_waypoint_control
	(begin
		(if
			(or
				(>
					(device_get_position enc5_1_pistonn1) 0.00)
				(>
					(device_get_position enc5_1_pistonn3) 0.00)
				(>
					(device_get_position enc5_1_pistons1) 0.00)
				(>
					(device_get_position enc5_1_pistons3) 0.00)
				(>
					(device_get_position enc5_1_pistonn2) 0.00))
			(begin
				(if controls_marked enc5_1_waypoint_control) enc5_1_waypoint_control
				(set controls_marked false))
			(begin
				(if
					(not controls_marked) enc5_1_waypoint_control) enc5_1_waypoint_control
				(set controls_marked true)))))

(script static void enc5_1_control_poll
	(begin
		(if
			(and
				(not manifold_n1_destroyed)
				(=
					(device_get_position enc5_1_pistonn1) 0.00))
			(begin
				(device_set_power enc5_1_controln1 1.00)
				(device_set_power enc5_1_siglight_n11 0.00)
				(device_set_power enc5_1_siglight_n12 0.00)
				(device_set_position_immediate enc5_1_siglight_n11 1.00)
				(device_set_position_immediate enc5_1_siglight_n12 1.00))
			(if
				(and
					(not manifold_n1_destroyed)
					(=
						(device_get_power enc5_1_controln1) 1.00)) enc5_1_control_poll))
		(if
			(and
				(not manifold_n3_destroyed)
				(=
					(device_get_position enc5_1_pistonn3) 0.00))
			(begin
				(device_set_power enc5_1_controln3 1.00)
				(device_set_power enc5_1_siglight_n31 0.00)
				(device_set_power enc5_1_siglight_n32 0.00)
				(device_set_position_immediate enc5_1_siglight_n31 1.00)
				(device_set_position_immediate enc5_1_siglight_n32 1.00))
			(if
				(and
					(not manifold_n3_destroyed)
					(=
						(device_get_power enc5_1_controln3) 1.00)) enc5_1_control_poll))
		(if
			(and
				(not manifold_s1_destroyed)
				(=
					(device_get_position enc5_1_pistons1) 0.00))
			(begin
				(device_set_power enc5_1_controls1 1.00)
				(device_set_power enc5_1_siglight_s11 0.00)
				(device_set_power enc5_1_siglight_s12 0.00)
				(device_set_position_immediate enc5_1_siglight_s11 1.00)
				(device_set_position_immediate enc5_1_siglight_s12 1.00))
			(if
				(and
					(not manifold_s1_destroyed)
					(=
						(device_get_power enc5_1_controls1) 1.00)) enc5_1_control_poll))
		(if
			(and
				(not manifold_s3_destroyed)
				(=
					(device_get_position enc5_1_pistons3) 0.00))
			(begin
				(device_set_power enc5_1_controls3 1.00)
				(device_set_power enc5_1_siglight_s31 0.00)
				(device_set_power enc5_1_siglight_s32 0.00)
				(device_set_position_immediate enc5_1_siglight_s31 1.00)
				(device_set_position_immediate enc5_1_siglight_s32 1.00))
			(if
				(and
					(not manifold_s3_destroyed)
					(=
						(device_get_power enc5_1_controls3) 1.00)) enc5_1_control_poll))))

(script dormant void manifold_n1_save
	(begin
		(sleep_until
			(and
				(<=
					(device_get_position enc5_1_pistonn1) 0.00)
				(not
					(volume_test_objects enc5_1_oven_n1
						(players))))) manifold_n1_save))

(script dormant void manifold_n3_save
	(begin
		(sleep_until
			(and
				(<=
					(device_get_position enc5_1_pistonn3) 0.00)
				(not
					(volume_test_objects enc5_1_oven_n3
						(players))))) manifold_n3_save))

(script dormant void manifold_s1_save
	(begin
		(sleep_until
			(and
				(<=
					(device_get_position enc5_1_pistons1) 0.00)
				(not
					(volume_test_objects enc5_1_oven_s1
						(players))))) manifold_s1_save))

(script dormant void manifold_s3_save
	(begin
		(sleep_until
			(and
				(<=
					(device_get_position enc5_1_pistons3) 0.00)
				(not
					(volume_test_objects enc5_1_oven_s3
						(players))))) manifold_s3_save))

(script static void destroy_manifold_n1
	(begin
		(game_save_cancel)
		(wake manifold_n1_save)
		(sound_impulse_start sound\sfx\ambience\d40\reactor_destroyed enc5_1_controln1 1.00)
		(device_set_power enc5_1_siglight_n11 1.00)
		(device_set_power enc5_1_siglight_n12 1.00)
		(device_set_position_immediate enc5_1_siglight_n11 0.00)
		(device_set_position_immediate enc5_1_siglight_n12 0.00)
		(set manifold_n1_destroyed true)
		(set destroyed_count
			(+ 1.00 destroyed_count))
		(device_set_position enc5_1_pistonn1 0.00)
		(effect_new explosion_large enc5_1_manifold_n1)
		(object_create enc5_1_fire_n2)))

(script static void destroy_manifold_n3
	(begin
		(game_save_cancel)
		(wake manifold_n3_save)
		(sound_impulse_start sound\sfx\ambience\d40\reactor_destroyed enc5_1_controln3 1.00)
		(device_set_power enc5_1_siglight_n31 1.00)
		(device_set_power enc5_1_siglight_n32 1.00)
		(device_set_position_immediate enc5_1_siglight_n31 0.00)
		(device_set_position_immediate enc5_1_siglight_n32 0.00)
		(set manifold_n3_destroyed true)
		(set destroyed_count
			(+ 1.00 destroyed_count))
		(device_set_position enc5_1_pistonn3 0.00)
		(effect_new explosion_large enc5_1_manifold_n3)
		(object_create enc5_1_damage_flame1)
		(object_create enc5_1_damage_flame2)
		(object_create enc5_1_damage_flame3)))

(script static void destroy_manifold_s1
	(begin
		(game_save_cancel)
		(wake manifold_s1_save)
		(sound_impulse_start sound\sfx\ambience\d40\reactor_destroyed enc5_1_controls1 1.00)
		(device_set_power enc5_1_siglight_s11 1.00)
		(device_set_power enc5_1_siglight_s12 1.00)
		(device_set_position_immediate enc5_1_siglight_s11 0.00)
		(device_set_position_immediate enc5_1_siglight_s12 0.00)
		(set manifold_s1_destroyed true)
		(set destroyed_count
			(+ 1.00 destroyed_count))
		(device_set_position enc5_1_pistons1 0.00)
		(effect_new explosion_large enc5_1_manifold_s1)
		(object_create enc5_1_damage_flame4)
		(object_create enc5_1_fire_s1)))

(script static void destroy_manifold_s3
	(begin
		(game_save_cancel)
		(wake manifold_s3_save)
		(sound_impulse_start sound\sfx\ambience\d40\reactor_destroyed enc5_1_controls3 1.00)
		(device_set_power enc5_1_siglight_s31 1.00)
		(device_set_power enc5_1_siglight_s32 1.00)
		(device_set_position_immediate enc5_1_siglight_s31 0.00)
		(device_set_position_immediate enc5_1_siglight_s32 0.00)
		(set manifold_s3_destroyed true)
		(set destroyed_count
			(+ 1.00 destroyed_count))
		(device_set_position enc5_1_pistons3 0.00)
		(effect_new explosion_large enc5_1_manifold_s3)))

(script static void all_manifolds_destroyed
	(begin
		(sound_looping_start sound\sfx\ambience\d40\engine_critical invisible_alarm 1.00)
		(set manifold_all_destroyed true)
		(device_set_position enc5_1_pistonn2 0.75)
		(device_set_position enc5_1_pistons2 0.75)
		(object_create enc5_1_louv_fire_s2)
		(object_create enc5_1_louv_fire_n2)
		(object_create enc5_1_damage_flame5)
		(device_set_position_immediate bsp4_cutoff 0.50)))

(script static void enc5_1_destroyed_poll
	(begin
		(if
			(and
				(not manifold_n1_destroyed)
				(or
					(<=
						(unit_get_health enc5_1_detector_n1) 0.10)
					(<=
						(unit_get_health enc5_1_detector_n1b) 0.10))) enc5_1_destroyed_poll)
		(if
			(and
				(not manifold_n3_destroyed)
				(or
					(<=
						(unit_get_health enc5_1_detector_n3) 0.10)
					(<=
						(unit_get_health enc5_1_detector_n3b) 0.10))) enc5_1_destroyed_poll)
		(if
			(and
				(not manifold_s1_destroyed)
				(or
					(<=
						(unit_get_health enc5_1_detector_s1) 0.10)
					(<=
						(unit_get_health enc5_1_detector_s1b) 0.10))) enc5_1_destroyed_poll)
		(if
			(and
				(not manifold_s3_destroyed)
				(or
					(<=
						(unit_get_health enc5_1_detector_s3) 0.10)
					(<=
						(unit_get_health enc5_1_detector_s3b) 0.10))) enc5_1_destroyed_poll)
		(if
			(and manifold_n1_destroyed manifold_n3_destroyed manifold_s1_destroyed manifold_s3_destroyed
				(not manifold_all_destroyed)) enc5_1_destroyed_poll)))

(script static void hack_thingie_for_jason
	(begin
		(switch_bsp 5)
		(volume_teleport_players_not_inside null_volume s6)
		(wake enc6_0)))

(script dormant void enc5_3_dialog
	(begin
		(sleep_until
			(>=
				(device_get_position elevator) 0.10) testing_lift) enc5_3_dialog enc5_3_dialog enc5_3_dialog enc5_3_dialog
		(sleep_until
			(>=
				(device_get_position elevator) 0.60) testing_lift) enc5_3_dialog enc5_3_dialog
		(wake timer_begin)))

(script dormant void enc5_3
	(begin
		(sleep_until
			(volume_test_objects_all enc5_3
				(players)))
		(device_set_position elevator_door 0.00)
		(object_create elevator_blocker)
		(sound_looping_stop levels\d40\music\d40_05)
		(sound_looping_start levels\d40\music\d40_06 none 1.00)
		(sleep_until
			(<=
				(device_get_position elevator_door) 0.45))
		(effect_new explosion_large_no prelift1)
		(sleep 5)
		(effect_new explosion_medium_no prelift2)
		(sleep 5)
		(effect_new explosion_medium_no prelift3)
		(effect_new explosion_large_no prelift4)
		(sleep 5)
		(effect_new explosion_large_no prelift5)
		(sleep 5)
		(effect_new explosion_large_no waypoint_lift)
		(if
			(volume_test_objects prelift_slayer
				(list_get
					(players) 0))
			(damage_object effects\damage effects\guaranteed explosion of doom
				(list_get
					(players) 0)))
		(if
			(and coop
				(volume_test_objects enc5_1_oven_n1
					(list_get
						(players) 1)))
			(damage_object effects\damage effects\guaranteed explosion of doom
				(list_get
					(players) 1)))
		(sleep 30)
		(device_set_position elevator 1.00)
		(wake enc5_3_dialog)
		(objects_predict trench_jeep1)
		(sleep_until
			(>=
				(device_get_position elevator) 0.10) testing_lift)
		(effect_new explosion_large_no enc5_3_000)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_380)
		(sleep_until
			(>=
				(device_get_position elevator) 0.20) testing_lift)
		(effect_new explosion_large_no enc5_3_120)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_505)
		(sleep_until
			(>=
				(device_get_position elevator) 0.30) testing_lift)
		(effect_new explosion_large_no enc5_3_295)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_605)
		(sleep_until
			(>=
				(device_get_position elevator) 0.40) testing_lift)
		(effect_new explosion_large_no enc5_3_385)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_380)
		(sleep_until
			(>=
				(device_get_position elevator) 0.50) testing_lift)
		(effect_new explosion_large_no enc5_3_605)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_930)
		(sleep_until
			(>=
				(device_get_position elevator) 0.60) testing_lift)
		(effect_new explosion_large_no enc5_3_930)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_1200)
		(sleep_until
			(>=
				(device_get_position elevator) 0.70) testing_lift)
		(effect_new explosion_steam_no enc5_3_1200)
		(sleep 15)
		(effect_new explosion_large enc5_3_1630)
		(sleep_until
			(>=
				(device_get_position elevator) 0.80) testing_lift)
		(effect_new explosion_large_no enc5_3_1480)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_1812)
		(sleep_until
			(>=
				(device_get_position elevator) 0.90) testing_lift)
		(effect_new explosion_large_no enc5_3_1740)
		(sleep 15)
		(effect_new explosion_large_no enc5_3_2090)
		(sleep_until
			(>=
				(device_get_position elevator) 1.00) testing_lift)
		(effect_new explosion_large_no enc5_3_2180)
		(sleep 15)
		(effect_new explosion_large enc5_3_2350)))

(script dormant void enc5_2
	(begin
		(sleep_until manifold_all_destroyed)
		(sleep_until
			(volume_test_objects enc5_2
				(players))) enc5_2
		(wake enc5_3)
		(sleep 30)
		(effect_new explosion_large enc5_2_door)
		(object_create enc5_2_fire1)
		(object_create enc5_2_fire2)
		(sleep 10)
		(device_set_position_immediate enc5_2_door 1.00)
		(deactivate_team_nav_point_flag player waypoint_lift)
		(ai_place enc5_2_cov/elevator_squad)
		(device_set_position_immediate elevator 0.10)
		(sleep 30)
		(device_set_position elevator 0.00)))

(script static void enc5_1_manifold_ovens
	(begin
		(if
			(= 0.00
				(device_get_position enc5_1_pistonn1))
			(begin
				(if
					(volume_test_objects enc5_1_oven_n1
						(list_get
							(players) 0))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 0)))
				(if
					(and coop
						(volume_test_objects enc5_1_oven_n1
							(list_get
								(players) 1)))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 1)))))
		(if
			(= 0.00
				(device_get_position enc5_1_pistonn3))
			(begin
				(if
					(volume_test_objects enc5_1_oven_n3
						(list_get
							(players) 0))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 0)))
				(if
					(and coop
						(volume_test_objects enc5_1_oven_n3
							(list_get
								(players) 1)))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 1)))))
		(if
			(= 0.00
				(device_get_position enc5_1_pistons1))
			(begin
				(if
					(volume_test_objects enc5_1_oven_s1
						(list_get
							(players) 0))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 0)))
				(if
					(and coop
						(volume_test_objects enc5_1_oven_s1
							(list_get
								(players) 1)))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 1)))))
		(if
			(= 0.00
				(device_get_position enc5_1_pistons3))
			(begin
				(if
					(volume_test_objects enc5_1_oven_s3
						(list_get
							(players) 0))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 0)))
				(if
					(and coop
						(volume_test_objects enc5_1_oven_s3
							(list_get
								(players) 1)))
					(damage_object effects\damage effects\oven heat
						(list_get
							(players) 1)))))))

(script static void enc5_1_floor_control
	(begin
		(if
			(not
				(volume_test_objects enc5_1_main
					(players)))
			(begin
				(ai_kill enc5_1_sents/north)
				(ai_kill enc5_1_sents/south)))
		(if
			(and
				(!= player_is_on_floor 0)
				(volume_test_objects enc5_1_floor0
					(players)))
			(begin
				(set player_is_on_floor 0)))
		(if
			(and
				(!= player_is_on_floor 1)
				(volume_test_objects enc5_1_floor1
					(players)))
			(begin
				(set player_is_on_floor 1)))
		(if
			(and
				(!= player_is_on_floor 2)
				(volume_test_objects enc5_1_floor2
					(players)))
			(begin
				(set player_is_on_floor 2)))
		(if
			(and
				(!= player_is_on_floor 3)
				(volume_test_objects enc5_1_floor3
					(players)))
			(begin
				(set player_is_on_floor 3)))))

(script static void enc5_1_monitor_control
	(begin
		(if
			(!= 3
				(ai_command_list_status
					(ai_actors enc5_1_monitor)))
			(begin
				(if
					(volume_test_objects enc5_1_north
						(ai_actors enc5_1_monitor))
					(if
						(>= player_is_on_floor 2)
						(ai_command_list enc5_1_monitor monitor_n2)
						(ai_command_list enc5_1_monitor monitor_n1)))
				(if
					(volume_test_objects enc5_1_south
						(ai_actors enc5_1_monitor))
					(if
						(>= player_is_on_floor 2)
						(ai_command_list enc5_1_monitor monitor_s2)
						(ai_command_list enc5_1_monitor monitor_s1)))
				(if
					(and
						(volume_test_objects_all enc5_1_north
							(players))
						(volume_test_objects enc5_1_south
							(ai_actors enc5_1_monitor)))
					(ai_command_list enc5_1_monitor monitor_ston))
				(if
					(and
						(volume_test_objects_all enc5_1_south
							(players))
						(volume_test_objects enc5_1_north
							(ai_actors enc5_1_monitor)))
					(ai_command_list enc5_1_monitor monitor_ntos))))))

(script static void enc5_1_explosion
	(begin
		(if
			(and
				(> current_damage_level 0)
				(volume_test_objects enc5_1_main
					(players)))
			(begin
				(if
					(volume_test_objects enc5_1_north
						(players))
					(if
						(>= player_is_on_floor 2)
						(begin_random
							(begin
								(effect_new current_explosion enc5_1_ceiling_n1)
								(sleep current_explosion_seperation))
							(begin
								(effect_new current_explosion enc5_1_ceiling_n2)
								(sleep current_explosion_seperation))
							(begin
								(effect_new current_explosion enc5_1_ceiling_n3)
								(sleep current_explosion_seperation)))
						(begin_random
							(begin
								(effect_new current_explosion enc5_1_stub_n1)
								(sleep current_explosion_seperation))
							(begin
								(effect_new current_explosion enc5_1_stub_n2)
								(sleep current_explosion_seperation))
							(begin
								(effect_new current_explosion enc5_1_stub_n3)
								(sleep current_explosion_seperation))
							(begin
								(effect_new current_explosion enc5_1_stub_n4)
								(sleep current_explosion_seperation))))
					(if
						(volume_test_objects enc5_1_south
							(players))
						(if
							(>= player_is_on_floor 2)
							(begin_random
								(begin
									(effect_new current_explosion enc5_1_ceiling_s1)
									(sleep current_explosion_seperation))
								(begin
									(effect_new current_explosion enc5_1_ceiling_s2)
									(sleep current_explosion_seperation))
								(begin
									(effect_new current_explosion enc5_1_ceiling_s3)
									(sleep current_explosion_seperation)))
							(begin_random
								(begin
									(effect_new current_explosion enc5_1_stub_s1)
									(sleep current_explosion_seperation))
								(begin
									(effect_new current_explosion enc5_1_stub_s2)
									(sleep current_explosion_seperation))
								(begin
									(effect_new current_explosion enc5_1_stub_s3)
									(sleep current_explosion_seperation))))))))
		(if
			(and
				(>= current_damage_level 4)
				(volume_test_objects enc5_1_main
					(players)))
			(begin
				(if
					(volume_test_objects enc5_1_north
						(players))
					(effect_new current_explosion enc5_1_manifold_n2)
					(if
						(volume_test_objects enc5_1_south
							(players))
						(effect_new current_explosion enc5_1_manifold_s2)))))))

(script continuous void enc5_1_explosions
	(begin
		(sleep_until
			(volume_test_objects enc5_1_main
				(players)))
		(if
			(< current_damage_level destroyed_count)
			(begin
				(set current_damage_level
					(+ 1.00 current_damage_level))
				(if
					(= 2 current_damage_level)
					(begin
						(set current_explosion explosion_medium_no)
						(set current_explosion_seperation
							(- current_explosion_seperation 20.00))))
				(if
					(= 3 current_damage_level)
					(begin
						(set current_explosion explosion_large_no)
						(set current_explosion_seperation
							(- current_explosion_seperation 20.00))
						(device_group_set_immediate engine_destroyed_lights 1.00)))
				(if
					(= 4 current_damage_level)
					(begin
						(set current_explosion explosion_large_no)
						(set current_explosion_seperation
							(- current_explosion_seperation 20.00)))))) enc5_1_explosions))

(script dormant void enc5_1_s12
	(begin
		(sleep_until
			(volume_test_objects enc5_1_s12
				(players)))
		(ai_place enc5_1_sents/s12)))

(script static void enc5_1_s12_spawn
	(begin
		(if
			(<=
				(ai_living_count enc5_1_flood/s12) min_combat_spawn)
			(begin
				(ai_spawn_actor enc5_1_flood/s12)
				(set enc5_1_s12_limiter
					(+ enc5_1_s12_limiter 1.00))))
		(if
			(<=
				(ai_living_count enc5_1_infs/s12) min_infection_spawn)
			(ai_place enc5_1_infs/s12))))

(script static void enc5_1_s23_spawn
	(begin
		(if
			(<=
				(ai_living_count enc5_1_flood/s23) min_combat_spawn)
			(begin
				(ai_spawn_actor enc5_1_flood/s23)
				(set enc5_1_s23_limiter
					(+ enc5_1_s23_limiter 1.00))))
		(if
			(<=
				(ai_living_count enc5_1_infs/s23) min_infection_spawn)
			(ai_place enc5_1_infs/s23))))

(script static void enc5_1_n12_spawn
	(begin
		(if
			(<=
				(ai_living_count enc5_1_flood/n12) min_combat_spawn)
			(begin
				(ai_spawn_actor enc5_1_flood/n12)
				(set enc5_1_n12_limiter
					(+ enc5_1_n12_limiter 1.00))))
		(if
			(<=
				(ai_living_count enc5_1_infs/n12) min_infection_spawn)
			(ai_place enc5_1_infs/n12))))

(script static void enc5_1_n23_spawn
	(begin
		(if
			(<=
				(ai_living_count enc5_1_flood/n23) min_combat_spawn)
			(begin
				(ai_spawn_actor enc5_1_flood/n23)
				(set enc5_1_n23_limiter
					(+ enc5_1_n23_limiter 1.00))))
		(if
			(<=
				(ai_living_count enc5_1_infs/n23) min_infection_spawn)
			(ai_place enc5_1_infs/n23))))

(script static void enc5_1_side_corridors
	(begin
		(if
			(and
				(or
					(> current_damage_level 0)
					(= impossible
						(game_difficulty_get)))
				(volume_test_objects_all enc5_1_s12_upper
					(players))
				(<= enc5_1_s12_limiter
					(* 30.00 spawn_scale))
				(<= player_is_on_floor 1))
			(begin enc5_1_side_corridors
				(set inside_s12 true))
			(set inside_s12 false))
		(if
			(and
				(or
					(< current_damage_level 1)
					(= impossible
						(game_difficulty_get)))
				(volume_test_objects_all enc5_1_s23_upper
					(players))
				(<= enc5_1_s23_limiter
					(* 20.00 spawn_scale))
				(<= player_is_on_floor 2))
			(begin enc5_1_side_corridors
				(set inside_s23 true))
			(set inside_s23 false))
		(if
			(and
				(or
					(> current_damage_level 0)
					(= impossible
						(game_difficulty_get)))
				(volume_test_objects_all enc5_1_n12_upper
					(players))
				(<= enc5_1_n12_limiter
					(* 20.00 spawn_scale))
				(<= player_is_on_floor 1))
			(begin enc5_1_side_corridors
				(set inside_n12 true))
			(set inside_n12 false))
		(if
			(and
				(or
					(< current_damage_level 1)
					(= impossible
						(game_difficulty_get)))
				(volume_test_objects_all enc5_1_n23_upper
					(players))
				(<= enc5_1_n23_limiter
					(* 30.00 spawn_scale))
				(<= player_is_on_floor 2))
			(begin enc5_1_side_corridors
				(set inside_n23 true))
			(set inside_n23 false))))

(script static void enc5_1_infs_floor0
	(begin
		(if
			(volume_test_objects enc5_1_north
				(players))
			(ai_place enc5_1_infs/n2)
			(if
				(volume_test_objects enc5_1_south
					(players))
				(ai_place enc5_1_infs/s2)))))

(script static void enc5_1_infs_floor1
	(begin enc5_1_infs_floor1))

(script static void enc5_1_infs_floor2
	(begin
		(if
			(volume_test_objects enc5_1_north
				(players))
			(ai_place enc5_1_infs/n0)
			(if
				(volume_test_objects enc5_1_south
					(players))
				(ai_place enc5_1_infs/s0)))))

(script static void enc5_1_infs_floor3
	(begin
		(if
			(volume_test_objects enc5_1_north
				(players))
			(ai_place enc5_1_infs/n1)
			(if
				(volume_test_objects enc5_1_south
					(players))
				(ai_place enc5_1_infs/s1)))))

(script static void enc5_1_infs_spawn
	(begin
		(if
			(<
				(ai_living_count enc5_1_infs) min_infection_spawn)
			(begin
				(if
					(= player_is_on_floor 0) enc5_1_infs_spawn)
				(if
					(= player_is_on_floor 1) enc5_1_infs_spawn)))))

(script static void enc5_1_flood_north
	(begin
		(if
			(not
				(volume_test_objects enc5_1_cov_north
					(players)))
			(ai_place enc5_1_flood/north))))

(script static void enc5_1_flood_south
	(begin
		(if
			(not
				(volume_test_objects enc5_1_cov_south
					(players)))
			(ai_place enc5_1_flood/south))))

(script static void enc5_1_flood_spawn
	(begin
		(if
			(<=
				(ai_living_count enc5_1_flood) 2)
			(if
				(volume_test_objects_all enc5_1_north
					(players)) enc5_1_flood_spawn
				(if
					(volume_test_objects_all enc5_1_south
						(players)) enc5_1_flood_spawn)))
		(if
			(and
				(<=
					(+
						(ai_living_count enc5_1_flood/upper_south)
						(ai_living_count enc5_1_flood/upper_north)) 1.00)
				(volume_test_objects_all enc5_1_main
					(players)))
			(if
				(volume_test_objects_all enc5_1_north
					(players))
				(ai_place enc5_1_flood/upper_south)
				(ai_place enc5_1_flood/upper_north)))))

(script static void enc5_1_elevator_spawn
	(begin
		(if
			(volume_test_objects_all enc5_1_main
				(players))
			(ai_place enc5_1_cov/elevator_squad))))

(script static void enc5_1_sents_spawn
	(begin
		(if
			(volume_test_objects_all enc5_1_north
				(players))
			(begin
				(ai_kill enc5_1_sents/south)
				(if
					(and
						(<=
							(ai_living_count enc5_1_sents) 1)
						(volume_test_objects enc5_1_main
							(players)))
					(begin
						(sleep 150)
						(if
							(>= player_is_on_floor 2)
							(sound_impulse_start sound\dialog\d40\d40_monitor_player
								(list_get
									(ai_actors enc5_1_monitor) 0) 1.00)
							(sound_impulse_start sound\dialog\d40\d40_monitor_self
								(list_get
									(ai_actors enc5_1_monitor) 0) 1.00))
						(sleep 300)
						(ai_place enc5_1_sents/north)))))
		(if
			(volume_test_objects_all enc5_1_south
				(players))
			(begin
				(ai_kill enc5_1_sents/north)
				(if
					(and
						(<=
							(ai_living_count enc5_1_sents) 1)
						(volume_test_objects enc5_1_main
							(players)))
					(begin
						(sleep 150)
						(if
							(>= player_is_on_floor 2)
							(sound_impulse_start sound\dialog\d40\d40_monitor_player
								(list_get
									(ai_actors enc5_1_monitor) 0) 1.00)
							(sound_impulse_start sound\dialog\d40\d40_monitor_self
								(list_get
									(ai_actors enc5_1_monitor) 0) 1.00))
						(sleep 300)
						(ai_place enc5_1_sents/south)))))))

(script continuous void enc5_1_spawner
	(begin
		(sleep_until
			(volume_test_objects enc5_1_main
				(players))) enc5_1_spawner enc5_1_spawner
		(sleep 300)))

(script continuous void enc5_1_spawner_sents
	(begin
		(sleep_until
			(volume_test_objects enc5_1_main
				(players))) enc5_1_spawner_sents))

(script static void enc5_1_damage_detector_control
	(begin
		(if
			(<=
				(device_get_position enc5_1_pistonn1) 0.00)
			(object_cannot_take_damage enc5_1_detector_n1)
			(object_can_take_damage enc5_1_detector_n1))
		(if
			(<=
				(device_get_position enc5_1_pistonn3) 0.00)
			(object_cannot_take_damage enc5_1_detector_n3)
			(object_can_take_damage enc5_1_detector_n3))
		(if
			(<=
				(device_get_position enc5_1_pistons1) 0.00)
			(object_cannot_take_damage enc5_1_detector_s1)
			(object_can_take_damage enc5_1_detector_s1))
		(if
			(<=
				(device_get_position enc5_1_pistons3) 0.00)
			(object_cannot_take_damage enc5_1_detector_s3)
			(object_can_take_damage enc5_1_detector_s3))))

(script continuous void enc5_1_manager
	(begin
		(sleep_until enc5_1_active) enc5_1_manager enc5_1_manager enc5_1_manager enc5_1_manager enc5_1_manager enc5_1_manager enc5_1_manager enc5_1_manager
		(if
			(or inside_n12 inside_n23 inside_s12 inside_s23)
			(sound_looping_set_alternate levels\d40\music\d40_03 true)
			(sound_looping_set_alternate levels\d40\music\d40_03 false))))

(script dormant void enc5_1_music_hook
	(begin
		(sleep_until
			(and
				(<
					(device_get_position enc5_1_pistonn1) 0.10)
				(<
					(device_get_position enc5_1_pistonn3) 0.10)
				(<
					(device_get_position enc5_1_pistons1) 0.10)
				(<
					(device_get_position enc5_1_pistons3) 0.10)) 30 1800)
		(sleep_until
			(or
				(>
					(device_get_position enc5_1_pistonn1) 0.10)
				(>
					(device_get_position enc5_1_pistonn3) 0.10)
				(>
					(device_get_position enc5_1_pistons1) 0.10)
				(>
					(device_get_position enc5_1_pistons3) 0.10)))
		(sound_looping_stop levels\d40\music\d40_04)
		(sound_looping_start levels\d40\music\d40_05 none 1.00)))

(script dormant void enc5_1
	(begin enc5_1
		(wake enc5_1_manager)
		(wake enc5_1_explosions)
		(wake enc5_1_s12)
		(ai_magically_see_players enc5_1_sents)
		(ai_magically_see_players enc5_1_flood)
		(ai_place enc5_1_monitor)
		(object_cannot_take_damage
			(ai_actors enc5_1_monitor))
		(ai_magically_see_players enc5_1_monitor)
		(ai_disregard
			(ai_actors enc5_1_monitor) true)
		(ai_try_to_fight enc5_1_cov enc5_1_flood)
		(ai_try_to_fight enc5_1_cov enc5_1_infs)
		(ai_try_to_fight enc5_1_sents enc5_1_flood)
		(ai_try_to_fight enc5_1_sents enc5_1_infs)
		(wake enc5_1_spawner)
		(ai_magically_see_players enc5_1_flood/n12)
		(ai_magically_see_players enc5_1_infs/n12)
		(ai_try_to_fight_player enc5_1_flood/n12)
		(ai_try_to_fight_player enc5_1_infs/n12)
		(ai_magically_see_players enc5_1_flood/n23)
		(ai_magically_see_players enc5_1_infs/n23)
		(ai_try_to_fight_player enc5_1_flood/n23)
		(ai_try_to_fight_player enc5_1_infs/n23)
		(ai_magically_see_players enc5_1_flood/s12)
		(ai_magically_see_players enc5_1_infs/s12)
		(ai_try_to_fight_player enc5_1_flood/s12)
		(ai_try_to_fight_player enc5_1_infs/s12)
		(sleep_until
			(volume_test_objects enc5_1_main
				(players))) enc5_1
		(sleep 60) enc5_1 enc5_1
		(set enc5_1_active true) enc5_1
		(wake enc5_1_spawner_sents)
		(sleep_until
			(or
				(>
					(device_get_position enc5_1_pistonn1) 0.10)
				(>
					(device_get_position enc5_1_pistonn3) 0.10)
				(>
					(device_get_position enc5_1_pistons1) 0.10)
				(>
					(device_get_position enc5_1_pistons3) 0.10)) 5) enc5_1
		(sound_looping_stop levels\d40\music\d40_03)
		(sound_looping_start levels\d40\music\d40_04 none 1.00) enc5_1 enc5_1
		(sleep_until
			(>= current_damage_level 1))
		(sound_looping_set_alternate levels\d40\music\d40_04 true) enc5_1
		(sleep_until
			(>= current_damage_level 2))
		(wake enc5_1_music_hook)
		(sleep_until
			(>= current_damage_level 3)) enc5_1
		(sleep_until
			(>= current_damage_level 4))
		(sound_looping_set_alternate levels\d40\music\d40_05 true) enc5_1 enc5_1
		(activate_team_nav_point_flag default_red player waypoint_lift 0.00) enc5_1))

(script static void section5_cleaner
	(begin
		(sleep -1 enc5_1_infs_spawn)
		(sleep -1 enc5_1_manager)
		(sleep -1 enc5_1_spawner)
		(sleep -1 enc5_1_spawner_sents)))

(script dormant void section5
	(begin
		(sleep -1 enc5_1_manager)
		(sleep -1 enc5_1_spawner)
		(sleep -1 enc5_1_spawner_sents)
		(sleep -1 enc5_1_explosions)
		(sleep_until
			(volume_test_objects section5
				(players)))
		(wake enc5_1)
		(wake enc5_2)
		(device_set_position_immediate bsp3_cutoff 0.50)
		(sound_looping_start levels\d40\music\d40_03 none 1.00) section5
		(sleep_until
			(and manifold_n1_destroyed manifold_n3_destroyed manifold_s1_destroyed manifold_s3_destroyed
				(volume_test_objects enc5_2
					(players)))) section5))

(script dormant void enc4_3
	(begin
		(sleep_until
			(volume_test_objects enc4_3
				(players))) enc4_3
		(sound_looping_start levels\d40\music\d40_02 none 1.00)
		(sleep 150)
		(sleep_until
			(and
				(not
					(objects_can_see_flag
						(players) enc4_3_door 10.00))
				(not
					(volume_test_objects enc4_3b
						(players)))))
		(sleep 60)
		(ai_place enc4_3_flood/stealth_combats)
		(sleep_until
			(= 1
				(ai_command_list_status
					(ai_actors enc4_3_flood/stealth_combats))))
		(if
			(volume_test_objects enc4_3_left
				(players))
			(ai_command_list enc4_3_flood/stealth_combats enc4_3_right)
			(ai_command_list enc4_3_flood/stealth_combats enc4_3_left))
		(sleep_until
			(= 0
				(ai_living_count enc4_3_flood)))
		(ai_place enc4_3_flood/second_wave)
		(sleep_until
			(or
				(<
					(ai_strength enc4_3_flood/second_wave) 0.70)
				(volume_test_objects enc4_3_flight
					(players))) 5)
		(sound_looping_set_alternate levels\d40\music\d40_02 true)
		(sleep_until
			(or
				(= 0
					(ai_living_count enc4_3_flood))
				(volume_test_objects enc4_3_flight
					(players))) 5)
		(sound_looping_stop levels\d40\music\d40_02)))

(script continuous void enc4_2_manager
	(begin
		(sleep_until
			(<= enc4_2_limiter
				(* 45.00 spawn_scale)))
		(sleep_until
			(not
				(volume_test_objects enc4_2c
					(players))))
		(if
			(<= enc4_2_limiter 7)
			(if
				(<
					(ai_living_count enc4_2_sents/sents)
					(* 1.50 min_combat_spawn))
				(begin
					(ai_spawn_actor enc4_2_sents/sents)
					(set enc4_2_limiter
						(+ enc4_2_limiter 1.00))
					(sleep 45)))
			(begin
				(if
					(<
						(ai_living_count enc4_2_flood/combats)
						(* 1.50 min_combat_spawn))
					(begin
						(ai_spawn_actor enc4_2_flood/combats)
						(set enc4_2_limiter
							(+ enc4_2_limiter 1.00))))
				(if
					(<
						(ai_living_count enc4_2_flood/carriers) min_carrier_spawn)
					(begin
						(ai_spawn_actor enc4_2_flood/carriers)
						(set enc4_2_limiter
							(+ enc4_2_limiter 1.00))))
				(if
					(<
						(ai_living_count enc4_2_flood/infs) min_infection_spawn)
					(begin
						(ai_place enc4_2_flood/infs)))))
		(sleep 15)))

(script dormant void enc4_2
	(begin enc4_2
		(wake enc4_3)
		(ai_place enc4_2_cov)
		(ai_try_to_fight enc4_2_cov enc4_2_sents)
		(ai_try_to_fight enc4_2_cov enc4_2_flood)
		(ai_link_activation enc4_2_cov enc4_2_sents)
		(ai_link_activation enc4_2_sents enc4_2_cov)
		(ai_link_activation enc4_2_cov enc4_2_flood)
		(ai_link_activation enc4_2_flood enc4_2_cov)
		(ai_magically_see_encounter enc4_2_sents enc4_2_cov)
		(ai_magically_see_encounter enc4_2_cov enc4_2_sents)
		(ai_magically_see_encounter enc4_2_flood enc4_2_cov)
		(ai_magically_see_players enc4_2_flood)
		(wake enc4_2_manager)
		(sleep_until
			(>= enc4_2_limiter
				(* 45.00 spawn_scale)))
		(sleep -1 enc4_2_manager)))

(script dormant void enc4_1
	(begin
		(sleep_until
			(volume_test_objects enc4_1
				(players)) testing_fast) enc4_1
		(ai_link_activation enc4_1_cov enc4_1_flood)
		(ai_link_activation enc4_1_flood enc4_1_cov)
		(ai_magically_see_encounter enc4_1_flood enc4_1_cov)
		(ai_place enc4_1_cov)
		(ai_place enc4_1_flood)
		(ai_try_to_fight enc4_1_flood enc4_1_cov)
		(wake enc4_2)))

(script dormant void section4
	(begin
		(sleep -1 enc4_2_manager)
		(sleep_until
			(volume_test_objects section4
				(players)))
		(wake enc4_1)))

(script continuous void enc3_6_manager
	(begin
		(sleep_until
			(<= enc3_6_limiter
				(* 30.00 spawn_scale)))
		(sleep_until
			(volume_test_objects_all enc3_6
				(players)))
		(if
			(<
				(ai_living_count enc3_6_flood/combats) min_combat_spawn)
			(begin
				(ai_spawn_actor enc3_6_flood/combats)
				(set enc3_6_limiter
					(+ enc3_6_limiter 1.00))))
		(if
			(<
				(ai_living_count enc3_6_flood/carriers) min_carrier_spawn)
			(begin
				(ai_spawn_actor enc3_6_flood/carriers)
				(set enc3_6_limiter
					(+ enc3_6_limiter 1.00))))
		(if
			(<
				(ai_living_count enc3_6_flood/infs) min_infection_spawn)
			(begin
				(ai_place enc3_6_flood/infs)))
		(sleep 15)))

(script dormant void enc3_6
	(begin
		(sleep -1 enc3_6_manager)
		(sleep_until
			(volume_test_objects enc3_6
				(players))) enc3_6
		(sound_looping_stop levels\d40\music\d40_013)
		(ai_place enc3_6_flood/stalling_infs)
		(ai_magically_see_players enc3_6_flood)
		(ai_force_active enc3_6_flood true)
		(wake enc3_6_manager)
		(sleep_until
			(volume_test_objects section4
				(players)) testing_fast)
		(sleep -1 enc3_6_manager)
		(ai_force_active enc3_6_flood false) enc3_6))

(script continuous void enc3_5_manager
	(begin
		(sleep_until
			(<= enc3_5_limiter
				(* 30.00 spawn_scale)))
		(if
			(<
				(ai_living_count enc3_5_flood/combats) min_combat_spawn)
			(begin
				(ai_spawn_actor enc3_5_flood/combats)
				(set enc3_5_limiter
					(+ enc3_5_limiter 1.00))))
		(if
			(<
				(ai_living_count enc3_5_flood/carriers) min_carrier_spawn)
			(begin
				(ai_spawn_actor enc3_5_flood/carriers)
				(set enc3_5_limiter
					(+ enc3_5_limiter 1.00))))
		(if
			(<
				(ai_living_count enc3_5_flood/infs) min_infection_spawn)
			(begin
				(ai_place enc3_5_flood/infs)))
		(sleep 15)))

(script dormant void enc3_5
	(begin
		(sleep_until
			(volume_test_objects enc3_5
				(players))) enc3_5
		(wake enc3_6)
		(ai_place enc3_5_flood/sacrifices)
		(ai_magically_see_players enc3_5_flood)
		(ai_force_active enc3_5_flood true)
		(wake enc3_5_manager)
		(sleep_until
			(volume_test_objects enc3_5b
				(players)) testing_fast)
		(sleep -1 enc3_5_manager)
		(ai_force_active enc3_5_flood false) enc3_5))

(script dormant void enc3_4
	(begin
		(sleep_until
			(volume_test_objects enc3_4
				(players))) enc3_4
		(sound_looping_start levels\d40\music\d40_013 none 1.00)
		(ai_place enc3_4_monitor/monitor)
		(sleep 60)
		(ai_place enc3_4_monitor/sents) enc3_4))

(script dormant void enc3_3
	(begin
		(sleep_until
			(volume_test_objects enc3_3
				(players))) enc3_3
		(ai_place enc3_3_flood/combats)
		(ai_place enc3_3_flood/infs)
		(ai_place enc3_3_sents)
		(ai_try_to_fight enc3_3_sents enc3_3_flood)
		(ai_try_to_fight enc3_3_flood enc3_3_sents)
		(sleep_until
			(or
				(>=
					(device_get_position enc3_3_door1) 0.90)
				(>=
					(device_get_position enc3_3_door2) 0.90)) testing_fast 300)
		(if
			(>=
				(device_get_position enc3_3_door1) 0.90)
			(ai_place enc3_3_flood/door_infs1)
			(if
				(>=
					(device_get_position enc3_3_door2) 0.90)
				(ai_place enc3_3_flood/door_infs2)))
		(sleep_until
			(and
				(volume_test_objects_all enc3_3b
					(players))
				(<=
					(ai_living_count enc3_3_sents) 0)))
		(ai_place enc3_3_flood/combats2)))

(script dormant void enc3_2
	(begin
		(sleep_until
			(volume_test_objects enc3_2
				(players))) enc3_2
		(wake enc3_3)
		(wake enc3_4)
		(wake enc3_5)
		(ai_place enc3_2_sents)
		(sleep_until
			(= 0
				(ai_living_count enc3_2_sents))) enc3_2))

(script dormant void enc3_1
	(begin
		(sleep_until
			(volume_test_objects enc3_1
				(players))) enc3_1
		(ai_place enc3_1_flood)
		(ai_place enc3_1_sents)
		(ai_try_to_fight enc3_1_sents enc3_1_flood)
		(ai_try_to_fight enc3_1_flood enc3_1_sents)
		(ai_force_active enc3_1_flood true)
		(ai_force_active enc3_1_sents true)
		(sleep_until
			(or
				(volume_test_objects enc3_1b
					(players))
				(<=
					(ai_strength enc3_1_sents) 0.50)))
		(ai_place enc3_1_flood/infs2)))

(script dormant void section3
	(begin
		(sleep -1 enc3_5_manager)
		(sleep_until
			(volume_test_objects section3
				(players)))
		(sound_looping_stop levels\d40\music\d40_012)
		(wake enc3_1)
		(wake enc3_2)))

(script dormant void enc2_7
	(begin
		(sleep_until
			(volume_test_objects enc2_7
				(players)) testing_fast) enc2_7
		(ai_place enc2_7_cov)
		(ai_place enc2_7_flood)))

(script dormant void enc2_6
	(begin
		(sleep_until
			(volume_test_objects enc2_6
				(players))) enc2_6
		(wake enc2_7)
		(sound_looping_start levels\d40\music\d40_012 none 1.00)
		(device_set_position_immediate enc2_6_door 1.00)
		(sleep_until
			(volume_test_objects enc2_6b
				(players)))
		(ai_place enc2_6_flood)
		(sleep_until
			(= 0
				(ai_living_count enc2_6_flood))) enc2_6))

(script dormant void enc2_5_music
	(begin
		(sleep_until
			(and
				(<=
					(ai_living_count enc2_2_cov) 0)
				(<=
					(ai_living_count enc2_4_cov) 0)))
		(sound_looping_start levels\d40\music\d40_011 none 1.00)))

(script dormant void enc2_5
	(begin
		(sleep_until
			(volume_test_objects enc2_6
				(players)) testing_fast) enc2_5
		(ai_place enc2_5_cov)
		(ai_place enc2_5_flood)
		(sleep 30) enc2_5
		(sleep_until
			(<=
				(ai_living_count enc2_5_cov) 0))
		(sleep 30) enc2_5
		(sleep_until
			(and
				(volume_test_objects_all cinematic_bridge
					(players))
				(game_safe_to_save)))
		(sound_looping_stop levels\d40\music\d40_011)
		(if enc2_5 enc2_5) enc2_5
		(device_set_position_immediate cafeteria_door 0.00)
		(wake enc2_6)
		(ai_place enc2_5_sents)
		(sleep 30)
		(sleep_until
			(volume_test_objects enc2_5_retreat2
				(players))) enc2_5 enc2_5))

(script dormant void enc2_4
	(begin
		(sleep_until
			(and
				(volume_test_objects enc2_4
					(players))
				(<=
					(ai_living_count enc2_2_cov) 2))) enc2_4
		(ai_place enc2_4_cov)
		(ai_magically_see_players enc2_2_cov)
		(sleep_until
			(= 0
				(ai_living_count enc2_4_cov))) enc2_4))

(script static void enc2_2_hunter1
	(begin
		(ai_place enc2_2_cov/hunter1)
		(device_set_position enc2_1_door2 1.00)))

(script static void enc2_2_hunter2
	(begin
		(ai_place enc2_2_cov/hunter2)
		(device_set_position enc2_1_door1 1.00)))

(script dormant void enc2_2
	(begin enc2_2
		(wake enc2_4)
		(wake enc2_5)
		(ai_place enc2_2_flood/sacrifices)
		(ai_place enc2_2_flood/combats)
		(sleep_until
			(volume_test_objects enc2_2
				(players)))
		(ai_place enc2_2_cov/squad1)
		(ai_place enc2_2_cov/squad2)
		(wake enc2_5_music)
		(if
			(=
				(game_difficulty_get_real) easy)
			(begin
				(device_set_position enc2_1_door2 1.00)
				(device_set_position enc2_1_door1 1.00))
			(begin enc2_2
				(sleep 120) enc2_2))
		(ai_place enc2_2_flood/infs)
		(sleep_until
			(= 0.00
				(+
					(ai_living_count enc2_2_cov/hunter1)
					(ai_living_count enc2_2_cov/hunter2)))) enc2_2
		(sleep 90)
		(sound_looping_stop levels\d40\music\d40_01)))

(script dormant void enc2_1
	(begin
		(sleep_until
			(volume_test_objects enc2_1
				(players)) testing_fast) enc2_1
		(wake enc2_2)
		(ai_place enc2_1_flood)
		(ai_magically_see_players enc2_1_flood)))

(script static void section2_scenery
	(begin
		(effect_new effects\bursts\ar burst ar_burst_4)
		(sleep 15)
		(effect_new effects\bursts\ar burst ar_burst_3)
		(sleep 15)
		(effect_new effects\bursts\ar burst ar_burst_2)
		(sleep 15)
		(effect_new effects\bursts\ar burst ar_burst_1)))

(script dormant void section2
	(begin
		(sleep_until
			(volume_test_objects section2
				(players)))
		(sound_looping_set_alternate levels\d40\music\d40_01 false)
		(device_set_position_immediate bsp0_cutoff 0.00)
		(wake enc2_1) section2 section2))

(script continuous void enc1_4_manager
	(begin
		(sleep_until
			(<= enc1_4_limiter
				(* 20.00 spawn_scale)))
		(if
			(<
				(ai_living_count enc1_4_flood/combats) min_combat_spawn)
			(begin
				(ai_spawn_actor enc1_4_flood/combats)
				(set enc1_4_limiter
					(+ enc1_4_limiter 1.00))))
		(if
			(<
				(ai_living_count enc1_4_flood/infs) min_infection_spawn)
			(begin
				(ai_place enc1_4_flood/infs)))))

(script dormant void enc1_4
	(begin
		(sleep_until
			(volume_test_objects enc1_4
				(players))) enc1_4
		(ai_place enc1_4_flood/init_combats)
		(ai_place enc1_4_flood/init_infs)
		(device_set_position enc1_4_door 1.00)
		(ai_magically_see_players enc1_4_sents)
		(ai_force_active enc1_4_flood true)
		(ai_force_active enc1_4_sents true)
		(ai_place enc1_4_flood)
		(ai_magically_see_players enc1_4_flood)
		(wake enc1_4_manager)
		(sleep_until
			(volume_test_objects enc1_5
				(players)) testing_fast)
		(sleep -1 enc1_4_manager)))

(script dormant void enc1_3
	(begin
		(sleep_until
			(volume_test_objects enc1_3
				(players)))
		(sound_looping_set_alternate levels\d40\music\d40_01 true)))

(script dormant void enc1_2
	(begin
		(sleep_until
			(volume_test_objects enc1_2
				(players))) enc1_2
		(ai_place enc1_2_flood)
		(ai_place enc1_2_sents)))

(script dormant void enc1_1
	(begin
		(sleep_until
			(volume_test_objects enc1_1
				(players)) testing_fast) enc1_1
		(ai_place enc1_1_sents)
		(ai_place enc1_1_flood)
		(ai_try_to_fight enc1_1_sents enc1_1_flood)
		(ai_try_to_fight enc1_1_flood enc1_1_sents)))

(script dormant void enc1_0
	(begin enc1_0 enc1_0 enc1_0
		(sleep 300)
		(ai_place enc1_0_sents)
		(sleep 60)
		(ai_place enc1_0_sents)))

(script dormant void section1
	(begin
		(sleep -1 enc1_4_manager)
		(sleep_until
			(volume_test_objects section1
				(players)))
		(wake enc1_0)
		(wake enc1_1)
		(wake enc1_2)
		(wake enc1_3)
		(wake enc1_4)))

(script static void coop_control
	(begin
		(if
			(<
				(list_count
					(players)) 1)
			(begin
				(set coop true)
				(set spawn_scale
					(* spawn_scale 1.20))
				(set min_combat_spawn
					(+ min_combat_spawn 1.00))))))

(script static void diff_control
	(begin
		(if
			(= hard
				(game_difficulty_get))
			(begin
				(set spawn_scale
					(* spawn_scale 1.10))
				(set min_combat_spawn
					(+ min_combat_spawn 1.00))
				(set min_carrier_spawn
					(+ min_carrier_spawn 1.00))
				(set min_infection_spawn
					(+ min_infection_spawn 1.00))))
		(if
			(= impossible
				(game_difficulty_get))
			(begin
				(set spawn_scale
					(* spawn_scale 1.25))
				(set min_combat_spawn
					(+ min_combat_spawn 1.00))
				(set min_carrier_spawn
					(+ min_carrier_spawn 1.00))
				(set min_infection_spawn
					(+ min_infection_spawn 2.00))
				(set timer_minutes
					(- timer_minutes 1.00))))))

(script dormant void intro_cutscene_aux
	(begin
		(sleep 90) intro_cutscene_aux))

(script startup void mission
	(begin
		(fade_out 0.00 0.00 0.00 0) mission mission
		(wake section1)
		(wake section2)
		(wake section3)
		(wake section4)
		(wake section5)
		(wake section6)
		(wake section7)
		(if mission
			(begin
				(set cinematic_ran true)
				(wake intro_cutscene_aux) mission)) mission
		(sound_looping_start levels\d40\music\d40_01 none 1.00)
		(if
			(not cinematic_ran)
			(begin
				(fade_in 0.00 0.00 0.00 0)
				(breakable_surfaces_reset)
				(breakable_surfaces_enable false)))
		(object_create_containing asspain)
		(object_create_containing trench_jeep)))

(script static void bridge_1
	(begin
		(cinematic_set_near_clip_distance 0.01)
		(object_create_anew chief_armed)
		(object_create_anew cortana_chip)
		(object_teleport chief_armed chief_bridge_base)
		(camera_set plugin_1a 0)
		(camera_set plugin_1b 200)
		(object_pvs_activate chief_armed)
		(object_teleport chief_armed chief_plugin_base)
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_0210 false)
		(fade_in 1.00 1.00 1.00 30)
		(sleep 60)
		(objects_attach chief_armed left hand cortana_chip )
		(effect_new_on_object_marker cinematics\effects\cyborg chip insertion chief_armed left hand)
		(sleep 50)
		(objects_detach chief_armed cortana_chip)
		(object_destroy cortana_chip)
		(unit_stop_custom_animation chief_armed)
		(camera_set leave_home_1a 0)
		(camera_set leave_home_1b 180)
		(effect_new cinematics\effects\cortana effects\cortana on off cortana_effect_base)
		(sleep 30)
		(object_destroy cortana)
		(object_create cortana)
		(unit_set_emotion cortana 6)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_1_0-409 true)
		(sound_impulse_start sound\dialog\x70\cor_01 cortana 1.00)
		(sleep
			(-
				(sound_impulse_time sound\dialog\x70\cor_01) 60.00))
		(unit_set_emotion cortana 0)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_01))
		(sleep 30)
		(camera_set there_1a 0)
		(object_create_anew display_back)
		(object_create_anew display_count)
		(numeric_countdown_timer_set 12000000 true)
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_0430 false)
		(unit_set_emotion cortana 6)
		(sound_impulse_start sound\dialog\x70\cor_02 cortana 1.00)
		(sleep
			(-
				(sound_impulse_time sound\dialog\x70\cor_02) 150.00))
		(camera_set countdown_1a 0)
		(camera_set countdown_1b 150)
		(sleep
			(camera_time))
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_0435 true)
		(camera_set remove_1a 0)
		(camera_set remove_1b 90)
		(sleep 90)
		(sound_impulse_start sound\dialog\x70\mon_01 none 1.00)
		(sleep 15)
		(unit_stop_custom_animation cortana)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_1b true)
		(sleep
			(sound_impulse_time sound\dialog\x70\mon_01))
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_2_410-725 true)
		(camera_set oh_hell_1a 0)
		(camera_set oh_hell_1b 30)
		(unit_set_emotion cortana 7)
		(sound_impulse_start sound\dialog\x70\cor_03 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_03))
		(camera_set hes_back_1a 0)
		(camera_set hes_back_1b 120)
		(sound_impulse_start sound\dialog\x70\mon_02 none 1.00)
		(sleep 60)
		(camera_set hes_back_1c 120)
		(sleep
			(sound_impulse_time sound\dialog\x70\mon_02))
		(camera_set cortana_1 0)
		(camera_set cortana_tap_1a 30)
		(unit_set_emotion cortana 1)
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_1210 true)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_3_726-1512 false)
		(sound_impulse_start sound\dialog\x70\cor_04 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_04))
		(fade_out 0.00 0.00 0.00 15)
		(sleep 15)))

(script dormant void engine_sentinels_1
	(begin
		(object_create_anew_containing engine_sentinel_1)
		(object_teleport engine_sentinel_1a engine_sentinel_1a)
		(object_teleport engine_sentinel_1b engine_sentinel_1b)
		(ai_attach_free engine_sentinel_1a characters\monitor\monitor)
		(ai_attach_free engine_sentinel_1b characters\monitor\monitor)
		(ai_command_list_by_unit engine_sentinel_1b engine_sentinel_1b_fly)
		(sleep 30)
		(ai_command_list_by_unit engine_sentinel_1a engine_sentinel_1a_fly)))

(script dormant void engine_sentinels_2
	(begin
		(object_destroy_containing engine_sentinel_1)
		(object_create_anew_containing engine_sentinel_2)
		(object_teleport engine_sentinel_2a engine_sentinel_2a)
		(object_teleport engine_sentinel_2b engine_sentinel_2b)
		(ai_attach_free engine_sentinel_2a characters\monitor\monitor)
		(ai_attach_free engine_sentinel_2b characters\monitor\monitor)
		(ai_command_list_by_unit engine_sentinel_2a engine_sentinel_2a_fly)
		(sleep 60)
		(ai_command_list_by_unit engine_sentinel_2b engine_sentinel_2b_fly)))

(script static void monitor_1
	(begin
		(object_create_anew monitor)
		(object_teleport monitor monitor_base_1)
		(ai_attach_free monitor characters\monitor\monitor)
		(object_pvs_activate monitor)
		(sleep 10)
		(fade_in 0.00 0.00 0.00 15)
		(camera_set monitor_work_1a 0)
		(camera_set monitor_work_1b 150)
		(sleep 5)
		(sound_impulse_start sound\dialog\x70\mon_03 monitor 1.00)
		(sleep 75)
		(camera_set monitor_work_1c 150)
		(object_set_permutation monitor unamed lightning-100)
		(custom_animation monitor cinematics\animations\monitor\x70\x70 workingb true)
		(sleep
			(unit_get_custom_animation_time monitor))
		(object_set_permutation monitor unamed monitor)
		(camera_set monitor_work_2a 0)
		(camera_set monitor_work_2b 120)
		(ai_command_list_by_unit monitor fly_to_console)
		(sleep 60)
		(camera_set monitor_work_2c 120)
		(wake engine_sentinels_1)
		(sleep 60)
		(camera_set monitor_work_2d 120)
		(sleep 60)
		(camera_set monitor_work_2e 120)
		(sleep 120)
		(camera_set monitor_work_3a 0)
		(camera_set monitor_work_3b 200)
		(object_teleport monitor monitor_base_2)
		(object_set_permutation monitor unamed lightning-100)
		(ai_detach monitor)
		(custom_animation monitor cinematics\animations\monitor\x70\x70 workingc true)
		(sound_impulse_start sound\dialog\x70\mon_04 monitor 1.00)
		(sleep 200)
		(wake engine_sentinels_2)
		(object_teleport monitor monitor_base_3)
		(object_set_permutation monitor unamed monitor)
		(camera_set monitor_work_3c 0)
		(camera_set monitor_work_3d 200)
		(sleep
			(sound_impulse_time sound\dialog\x70\mon_04))
		(fade_out 0.00 0.00 0.00 15)
		(sleep 15)
		(object_destroy_containing engine_sentinel)))

(script dormant void sentinels_enter_1
	(begin
		(object_create_anew_containing bridge_sentinel)
		(object_teleport bridge_sentinel_1 sentinel_1_in)
		(object_teleport bridge_sentinel_2 sentinel_2_in)
		(ai_attach_free bridge_sentinel_1 characters\monitor\monitor)
		(ai_attach_free bridge_sentinel_2 characters\monitor\monitor)
		(ai_command_list_by_unit bridge_sentinel_1 sentinel_1_enter)
		(ai_command_list_by_unit bridge_sentinel_2 sentinel_2_enter)))

(script dormant void sentinels_enter_2
	(begin
		(object_teleport bridge_sentinel_3 sentinel_3_in)
		(object_teleport bridge_sentinel_4 sentinel_4_in)
		(ai_attach_free bridge_sentinel_3 characters\monitor\monitor)
		(ai_attach_free bridge_sentinel_4 characters\monitor\monitor)
		(ai_command_list_by_unit bridge_sentinel_3 sentinel_3_enter)
		(ai_command_list_by_unit bridge_sentinel_4 sentinel_4_enter)))

(script dormant void sentinels_fire
	(begin
		(ai_command_list_by_unit bridge_sentinel_1 sentinel_3_fire)
		(ai_command_list_by_unit bridge_sentinel_2 sentinel_1_fire)
		(sleep 30)
		(ai_command_list_by_unit bridge_sentinel_3 sentinel_2_fire)
		(sleep 30)
		(ai_command_list_by_unit bridge_sentinel_4 sentinel_4_fire)))

(script dormant void chief_duck
	(begin
		(effect_new cinematics\effects\cortana effects\cortana on off cortana_effect_base)
		(object_destroy cortana)
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_1255 true)
		(sleep 40)
		(object_create_anew cortana_chip)
		(objects_attach chief_armed left hand cortana_chip )
		(sleep 17)
		(effect_new_on_object_marker cinematics\effects\cyborg chip insertion chief_armed left hand)
		(objects_detach chief_armed cortana_chip)
		(object_destroy cortana_chip)
		(sleep
			(unit_get_custom_animation_time chief_armed))
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_1260 true)
		(sleep
			(unit_get_custom_animation_time chief_armed))))

(script static void bridge_2
	(begin
		(cinematic_set_near_clip_distance 0.01)
		(object_create_anew chief_armed)
		(object_create_anew cortana)
		(object_teleport chief_armed chief_plugin_base)
		(object_pvs_activate chief_armed)
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_1220 true)
		(object_create_anew display_abort)
		(numeric_countdown_timer_stop)
		(camera_set hes_stopped_1a 0)
		(fade_in 0.00 0.00 0.00 15)
		(unit_set_emotion cortana 3)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_4_1513-1659 false)
		(sleep 15)
		(sound_impulse_start sound\dialog\x70\cor_05 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_05))
		(camera_set why_fight_1a 0)
		(camera_set why_fight_1b 300)
		(sound_impulse_start sound\dialog\x70\mon_05 none 1.00)
		(sleep
			(-
				(sound_impulse_time sound\dialog\x70\mon_05) 30.00))
		(camera_set at_least_1a 0)
		(camera_set at_least_1b 30)
		(unit_set_emotion cortana 6)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_5_1857-1969 false)
		(sound_impulse_start sound\dialog\x70\cor_06 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_06))
		(camera_set where_is_1a 0)
		(camera_set where_is_1b 300)
		(unit_custom_animation_at_frame chief_armed cinematics\animations\chief\x70\x70 x70_1230 false 15)
		(sound_impulse_start sound\dialog\x70\che_01 chief_armed 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\che_01))
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_6_1970-2524 true)
		(unit_set_emotion cortana 8)
		(sound_impulse_start sound\dialog\x70\cor_07 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_07))
		(camera_set core_offline_1a 0)
		(camera_set core_offline_1b 400)
		(unit_set_emotion cortana 3)
		(sleep 30)
		(sound_impulse_start sound\dialog\x70\cor_08 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_08))
		(sound_impulse_start sound\dialog\x70\cor_09 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_09))
		(camera_set firepower_1a 0)
		(camera_set firepower_1b 180)
		(unit_custom_animation_at_frame chief_armed cinematics\animations\chief\x70\x70 x70_1240 false 15)
		(sound_impulse_start sound\dialog\x70\che_02 chief_armed 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\che_02))
		(unit_set_emotion cortana 6)
		(unit_stop_custom_animation cortana)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_7_2525-2604 false)
		(sleep 5)
		(camera_set dont_know_1a 0)
		(camera_set but_why_1a 90)
		(sound_impulse_start sound\dialog\x70\cor_10 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_10))
		(sound_looping_start sound\sinomatixx_music\d40_bridge_music02 none 1.00)
		(sound_looping_start sound\sinomatixx_foley\d40_bridge_foley3 none 1.00)
		(camera_set grenade_toss_1a 0)
		(camera_set grenade_toss_1b 180)
		(sound_looping_start sound\sinomatixx_music\d40_bridge_music02 none 1.00)
		(unit_stop_custom_animation chief_armed)
		(object_create_anew grenade)
		(object_teleport chief_armed chief_plugin_base)
		(object_teleport grenade chief_plugin_base)
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_1245 false)
		(scenery_animation_start grenade cinematics\animations\grenade\x70\x70 grenade_juggle)
		(sleep 125)
		(unit_set_emotion cortana 11)
		(unit_stop_custom_animation cortana)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_8_2604-2696 false)
		(camera_set coming_with_1a 0)
		(camera_set coming_with_1b 120)
		(sleep 40)
		(object_destroy grenade)
		(wake sentinels_enter_1)
		(sound_impulse_start sound\dialog\x70\cor_11 cortana 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_11))
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_1250 false)
		(camera_set pull_out_2a 0)
		(camera_set pull_out_2b 120)
		(sleep 60)
		(custom_animation cortana cinematics\animations\cortana\x70\x70 x70_9_2697-2800 true)
		(sound_impulse_start sound\dialog\x70\cor_12 none 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_12))
		(wake sentinels_enter_2)
		(camera_set sentinels_pan_1a 0)
		(camera_set sentinels_pan_1b 120)
		(sleep 120)
		(wake sentinels_fire)
		(wake chief_duck)
		(object_destroy_containing display)
		(camera_set chief_duck_1a 0)
		(camera_set chief_duck_1b 60)
		(sleep 30)
		(camera_set chief_duck_1c 60)
		(sleep 60)
		(unit_stop_custom_animation chief_armed)
		(custom_animation chief_armed cinematics\animations\chief\x70\x70 x70_1265 true)
		(sleep 30)
		(camera_set chief_spring_1a 0)
		(camera_set chief_spring_1b 30)
		(sleep 30)
		(cinematic_screen_effect_start true)
		(cinematic_screen_effect_set_convolution 3 2 1.00 10.00 1.00)
		(fade_out 1.00 1.00 1.00 15)
		(sleep 15)
		(object_destroy chief_armed)
		(object_destroy monitor)
		(object_destroy grenade)
		(object_destroy_containing bridge_sentinel)
		(cinematic_screen_effect_stop)))

(script static void flood_pursuit
	(begin
		(object_create_anew_containing hangar_flood)
		(object_teleport hangar_flood_1 hangar_flood_1_base)
		(object_teleport hangar_flood_2 hangar_flood_2_base)
		(object_teleport hangar_flood_3 hangar_flood_3_base)
		(object_teleport hangar_flood_4 hangar_flood_4_base)
		(object_teleport hangar_flood_5 hangar_flood_5_base)
		(object_teleport hangar_flood_6 hangar_flood_6_base)
		(object_teleport hangar_flood_7 hangar_flood_7_base)
		(object_teleport hangar_flood_8 hangar_flood_8_base)
		(object_teleport hangar_flood_9 hangar_flood_9_base)
		(object_teleport hangar_flood_10 hangar_flood_10_base)
		(ai_attach_free hangar_flood_1 characters\captain\captain)
		(ai_attach_free hangar_flood_2 characters\captain\captain)
		(ai_attach_free hangar_flood_3 characters\captain\captain)
		(ai_attach_free hangar_flood_4 characters\captain\captain)
		(ai_attach_free hangar_flood_5 characters\captain\captain)
		(ai_attach_free hangar_flood_6 characters\captain\captain)
		(ai_attach_free hangar_flood_7 characters\captain\captain)
		(ai_attach_free hangar_flood_8 characters\captain\captain)
		(ai_attach_free hangar_flood_9 characters\captain\captain)
		(ai_attach_free hangar_flood_10 characters\captain\captain)
		(ai_command_list_by_unit hangar_flood_1 hangar_flood_run_l1)
		(ai_command_list_by_unit hangar_flood_2 hangar_flood_run_l1)
		(ai_command_list_by_unit hangar_flood_3 hangar_flood_run_l1)
		(ai_command_list_by_unit hangar_flood_4 hangar_flood_run_l1)
		(ai_command_list_by_unit hangar_flood_5 hangar_flood_run_l1)
		(ai_command_list_by_unit hangar_flood_6 hangar_flood_run_r1)
		(ai_command_list_by_unit hangar_flood_7 hangar_flood_run_r1)
		(ai_command_list_by_unit hangar_flood_8 hangar_flood_run_r1)
		(ai_command_list_by_unit hangar_flood_9 hangar_flood_run_r1)
		(ai_command_list_by_unit hangar_flood_10 hangar_flood_run_r1)))

(script dormant void flood_chase
	(begin
		(ai_command_list_by_unit hangar_flood_1 flood_ship_chase_1)
		(ai_command_list_by_unit hangar_flood_2 flood_ship_chase_2)
		(ai_command_list_by_unit hangar_flood_3 flood_ship_chase_1)
		(ai_command_list_by_unit hangar_flood_4 flood_ship_chase_2)
		(ai_command_list_by_unit hangar_flood_5 flood_ship_chase_1)
		(ai_command_list_by_unit hangar_flood_6 flood_ship_chase_2)
		(ai_command_list_by_unit hangar_flood_7 flood_ship_chase_1)
		(ai_command_list_by_unit hangar_flood_8 flood_ship_chase_2)
		(ai_command_list_by_unit hangar_flood_9 flood_ship_chase_1)
		(ai_command_list_by_unit hangar_flood_10 flood_ship_chase_2)))

(script static void hangar_1
	(begin
		(object_create_anew_containing hangar_fire_1)
		(object_create_anew_containing hangar_tank)
		(object_create_anew chief_unarmed)
		(object_create_anew fighter_hangar)
		(scenery_animation_start fighter_hangar cinematics\animations\h_fighter\x70\x70 stand opening)
		(object_teleport chief_unarmed chief_hangar_run_base)
		(recording_play chief_unarmed chief_hangar_run)
		(object_pvs_activate chief_unarmed)
		(camera_set hangar_run_1a 0)
		(camera_set hangar_run_1b 90)
		(fade_in 1.00 1.00 1.00 15) hangar_1
		(sleep 90)
		(camera_set chief_run_1a 0)
		(camera_set chief_run_1b 120)
		(recording_kill chief_unarmed) hangar_1
		(object_teleport chief_unarmed chief_hangar_run_base)
		(recording_play chief_unarmed chief_hangar_run)
		(sleep 90) hangar_1
		(objects_attach fighter_hangar positionchief chief_unarmed )
		(objects_detach fighter_hangar chief_unarmed)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5000 false)
		(sound_looping_start sound\sinomatixx_foley\x70_foley1b none 1.00)
		(camera_set gangway_1a 0)
		(camera_set gangway_1b 30)
		(sleep 30)
		(scenery_animation_start fighter_hangar cinematics\animations\h_fighter\x70\x70 stand closing)
		(camera_set door_close_1a 0)
		(camera_set door_close_1b 60)
		(sleep 60)
		(sound_impulse_start sound\dialog\x70\cor_13 none 1.00)
		(sleep 30)))

(script dormant void sit_pyrotechnics
	(begin
		(effect_new effects\explosions\large explosion sit_down_pyro_1)
		(sleep 30)
		(effect_new effects\explosions\medium explosion sit_down_pyro_2)))

(script static void hangar_2
	(begin
		(object_create_anew chief_unarmed)
		(object_pvs_activate chief_unarmed)
		(object_teleport chief_unarmed chief_5100)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5100 true)
		(camera_set hall_walk_1a 0)
		(camera_set hall_walk_1b 90)
		(sleep 15)
		(player_effect_set_max_rotation 0.00 0.50 0.50)
		(player_effect_start 1.00 0.00)
		(player_effect_stop 2.00)
		(sleep 75)
		(wake sit_pyrotechnics)
		(unit_stop_custom_animation chief_unarmed)
		(objects_attach fighter_hangar positionchief chief_unarmed )
		(objects_detach fighter_hangar chief_unarmed)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5100-2 false)
		(sleep 15)
		(camera_set sit_down_1a 0)
		(camera_set sit_down_1b 60)
		(sleep
			(camera_time))
		(unit_stop_custom_animation chief_unarmed)
		(objects_attach fighter_hangar positionchief chief_unarmed )
		(objects_detach fighter_hangar chief_unarmed)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5130 false)
		(sound_looping_start sound\sinomatixx_foley\x70_foley1c none 1.00)
		(camera_set here_we_go_1a 0)
		(camera_set here_we_go_1b 90)
		(sleep
			(-
				(unit_get_custom_animation_time chief_unarmed) 90.00))
		(camera_set here_we_go_2a 0)
		(camera_set here_we_go_2b 60)
		(sleep
			(-
				(unit_get_custom_animation_time chief_unarmed) 60.00))
		(sound_impulse_start sound\dialog\x70\che_03 chief_unarmed 1.00)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5140 true)
		(sleep
			(sound_impulse_time sound\dialog\x70\che_03))))

(script static void hangar_seat
	(begin
		(object_create_anew chief_unarmed)
		(object_teleport chief_unarmed chief_hangar_seat)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5130 false)))

(script dormant void hangar_pyrotechnics_1
	(begin
		(effect_new effects\explosions\large explosion hangar_pyro_1)
		(sleep 30)
		(effect_new effects\explosions\medium explosion hangar_pyro_2)))

(script dormant void hangar_pyrotechnics_2
	(begin
		(effect_new effects\explosions\large explosion hangar_pyro_3)
		(sleep 30)
		(effect_new effects\explosions\medium explosion hangar_pyro_4)
		(sleep 30)
		(effect_new effects\explosions\large explosion hangar_pyro_5)
		(sleep 30)
		(effect_new effects\explosions\large explosion hangar_pyro_6)))

(script static void hangar_3
	(begin
		(wake flood_chase)
		(object_create_anew_containing hangar_fire_2)
		(player_effect_set_max_rotation 0.00 0.25 0.25)
		(player_effect_start 1.00 0.00)
		(object_destroy chief_unarmed)
		(object_create_anew fighter_hangar)
		(object_pvs_activate fighter_hangar)
		(object_teleport fighter_hangar fighter_hangar_base)
		(scenery_animation_start fighter_hangar cinematics\animations\h_fighter\x70\x70 x70_1)
		(camera_set takeoff_1a 0)
		(camera_set takeoff_1b 200)
		(sleep 60)
		(wake hangar_pyrotechnics_1)
		(sleep 140)
		(wake hangar_pyrotechnics_2)
		(camera_set takeoff_1c 0)
		(sleep 30)
		(camera_set takeoff_1d 60)
		(player_effect_set_max_rotation 0.00 0.40 0.40)
		(sleep 65)
		(fade_out 0.00 0.00 0.00 15)
		(sleep 15)
		(object_destroy_containing hangar_fire)
		(object_destroy_containing hangar_tank)
		(object_destroy fighter_hangar)
		(player_effect_stop 1.00)))

(script dormant void x80_elite_speech
	(begin
		(sound_impulse_start sound\dialog\elite\conditional\combat2\involuntary\painminor x80_elite 1.00)
		(sleep 60)
		(sound_impulse_start sound\dialog\elite\conditional\combat2\beinghurt\hurtenemy x80_elite 1.00)))

(script static void happy_easter
	(begin
		(object_create_anew x80_johnson)
		(object_create_anew x80_elite)
		(object_create_anew johnson_rifle)
		(object_create_anew_containing easter_flood)
		(objects_attach x80_johnson right hand johnson_rifle )
		(object_beautify x80_johnson true)
		(object_beautify x80_elite true)
		(object_pvs_activate x80_johnson)
		(object_teleport x80_johnson x80_johnson_base)
		(object_teleport x80_elite x80_elite_base)
		(unit_suspended x80_elite true)
		(sleep 15)
		(custom_animation x80_johnson cinematics\animations\marines\x70\x70 easter egg_marine true)
		(custom_animation x80_elite cinematics\animations\elite\x70\x70 easter egg_elite true)
		(camera_set x80_1a 0)
		(camera_set x80_1b 180)
		(sound_class_set_gain music 0.40 6)
		(sound_class_set_gain ambient_machinery 0.00 0)
		(fade_in 0.00 0.00 0.00 15)
		(sleep 5)
		(wake x80_elite_speech)
		(sound_looping_start sound\sinomatixx_foley\d40_easter_foley none 1.00)
		(sound_impulse_start sound\dialog\x70\sgt_easter_01 x80_johnson 1.00)
		(sleep 100)
		(player_effect_start 1.00 4.00)
		(sleep 100)
		(camera_set x80_2a 0)
		(camera_set x80_2b 90)
		(object_create_anew poa_explosion)
		(sleep 120)
		(player_effect_set_max_rotation 0.00 0.30 0.30)
		(camera_set x80_3a 0)
		(camera_set x80_3b 150)
		(sound_impulse_start sound\dialog\x70\sgt_easter_02 x80_johnson 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\sgt_easter_02))
		(camera_set x80_4a 0)
		(camera_set x80_4b 120)
		(player_effect_set_max_rotation 0.00 0.50 0.50)
		(sound_class_set_gain music 1.00 3)
		(sleep 107)
		(fade_out 1.00 1.00 1.00 15)
		(sleep 15)
		(object_destroy x80_johnson)
		(object_destroy x80_elite)
		(object_destroy johnson_rifle)
		(object_destroy poa_explosion)
		(object_destroy_containing easter_flood)
		(player_effect_stop 0.00)
		(switch_bsp 9)))

(script dormant void flood_army_pyros
	(begin
		(effect_new effects\explosions\large explosion final_pyro_1a)
		(sleep 30)
		(effect_new effects\explosions\large explosion final_pyro_1g)
		(sleep 30)
		(effect_new effects\explosions\medium explosion final_pyro_1b)
		(effect_new effects\explosions\large explosion final_pyro_1f)
		(effect_new effects\explosions\medium explosion final_pyro_3a)
		(sleep 30)
		(effect_new effects\explosions\large explosion final_pyro_1c)
		(effect_new effects\explosions\large explosion final_pyro_1h)
		(sleep 30)
		(effect_new effects\explosions\large explosion final_pyro_3b)
		(sleep 60)
		(effect_new effects\explosions\medium explosion final_pyro_1d)
		(sleep 30)
		(effect_new effects\explosions\large explosion final_pyro_1e)))

(script static void launch_1
	(begin
		(time_code_show true)
		(time_code_start true)
		(object_create_anew_containing flood)
		(object_create_anew_containing engine_fire_1)
		(object_teleport flood_1 flood_1_base)
		(object_teleport flood_2 flood_2_base)
		(object_teleport flood_3 flood_3_base)
		(object_teleport flood_4 flood_4_base)
		(object_teleport flood_5 flood_5_base)
		(object_teleport flood_6 flood_6_base)
		(object_teleport flood_7 flood_7_base)
		(object_teleport flood_8 flood_8_base)
		(object_teleport flood_9 flood_9_base)
		(object_teleport flood_10 flood_10_base)
		(object_teleport flood_11 flood_11_base)
		(ai_attach_free flood_1 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_2 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_3 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_4 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_5 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_6 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_7 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_8 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_9 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_10 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_11 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_12 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_13 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_14 characters\floodcombat elite\floodcombat elite unarmed)
		(ai_attach_free flood_15 characters\floodcombat elite\floodcombat elite unarmed)
		(object_pvs_activate flood_1)
		(fade_in 0.00 0.00 0.00 15)
		(camera_set watcher_1a 0)
		(camera_set watcher_1b 300)
		(wake flood_army_pyros)
		(ai_command_list_by_unit flood_1 flood_1_march)
		(sleep 5)
		(ai_command_list_by_unit flood_2 flood_2_march)
		(sleep 5)
		(ai_command_list_by_unit flood_3 flood_3_march)
		(sleep 5)
		(ai_command_list_by_unit flood_4 flood_4_march)
		(sleep 30)
		(ai_command_list_by_unit flood_5 flood_5_march)
		(sleep 5)
		(ai_command_list_by_unit flood_6 flood_6_march)
		(sleep 5)
		(ai_command_list_by_unit flood_7 flood_7_march)
		(sleep 30)
		(ai_command_list_by_unit flood_8 flood_8_march)
		(ai_command_list_by_unit flood_9 flood_9_march)
		(sleep 10)
		(ai_command_list_by_unit flood_10 flood_10_march)
		(ai_command_list_by_unit flood_11 flood_11_march)
		(sleep 5)
		(object_teleport flood_12 flood_5_base)
		(object_teleport flood_13 flood_6_base)
		(object_teleport flood_14 flood_7_base)
		(object_teleport flood_15 flood_8_base)
		(ai_command_list_by_unit flood_12 flood_8_march)
		(ai_command_list_by_unit flood_13 flood_9_march)
		(ai_command_list_by_unit flood_14 flood_10_march)
		(ai_command_list_by_unit flood_15 flood_11_march)
		(sleep 120)
		(object_create_anew fighter_launch)
		(object_set_scale fighter_launch 0.20 0)
		(scenery_animation_start fighter_launch cinematics\animations\h_fighter\x70\x70 x70_2)
		(effect_new effects\explosions\large explosion launch_pyro_base)
		(sleep 120)
		(object_destroy_containing flood)))

(script dormant void launch_2_pyro
	(begin
		(effect_new effects\explosions\large explosion final_pyro_2a)
		(effect_new effects\explosions\large explosion final_pyro_2b)
		(effect_new effects\explosions\large explosion final_pyro_2c)
		(sleep 60)
		(object_create engine_fire_2a)
		(effect_new effects\explosions\large explosion final_pyro_3a)
		(effect_new effects\explosions\large explosion final_pyro_3b)
		(sleep 15)
		(effect_new effects\explosions\large explosion final_pyro_3c)
		(sleep 30)
		(object_create engine_fire_2c)
		(effect_new effects\explosions\large explosion final_pyro_3d)
		(effect_new effects\explosions\large explosion final_pyro_3e)
		(object_create engine_fire_2b)
		(sleep 60)
		(effect_new effects\explosions\large explosion final_pyro_4a)
		(sleep 30)
		(object_create engine_fire_3a)
		(effect_new effects\explosions\large explosion final_pyro_4b)
		(effect_new effects\explosions\large explosion final_pyro_4c)))

(script static void launch_2
	(begin
		(wake launch_2_pyro)
		(player_effect_set_max_rotation 0.00 0.25 0.25)
		(player_effect_start 1.00 0.00)
		(object_create_anew fighter_launch)
		(object_set_scale fighter_launch 0.25 0)
		(scenery_animation_start_at_frame fighter_launch cinematics\animations\h_fighter\x70\x70 x70_2 100)
		(object_pvs_activate fighter_launch)
		(camera_set launch_2_1a 0)
		(camera_set launch_2_1b 200)
		(sleep 185)
		(fade_out 1.00 1.00 1.00 15)
		(sleep 15)
		(object_destroy_containing engine_fire)))

(script static void int_1
	(begin
		(object_destroy fighter_launch)
		(player_effect_set_max_rotation 0.00 0.40 0.40)
		(player_effect_start 1.00 0.00)
		(cinematic_screen_effect_start true)
		(cinematic_screen_effect_set_filter_desaturation_tint 1.00 1.00 1.00)
		(cinematic_screen_effect_set_filter 1.00 0.00 1.00 0.00 true 5.00)
		(cinematic_screen_effect_set_convolution 1 2 10.00 0.00 5.00)
		(object_create_anew fighter_clouds)
		(object_pvs_activate fighter_clouds)
		(scenery_animation_start fighter_clouds cinematics\animations\h_fighter\x70\x70 x70_3)
		(camera_set haul_ass_1a 0)
		(camera_set haul_ass_1b 90)
		(fade_in 1.00 1.00 1.00 15)
		(sleep 90)
		(camera_set count_1c 0)
		(camera_set count_1d 60)
		(object_create_anew chief_unarmed)
		(object_create_anew fighter_space)
		(object_pvs_activate fighter_space)
		(objects_attach fighter_space positionchief chief_unarmed )
		(objects_detach fighter_space chief_unarmed)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5140 false)
		(sleep 90)))

(script static void space_1
	(begin
		(object_destroy fighter_clouds)
		(object_create_anew halo_1)
		(object_create_anew fighter_flee)
		(object_set_scale fighter_flee 0.10 0)
		(object_pvs_activate fighter_flee)
		(scenery_animation_start_at_frame fighter_flee cinematics\animations\h_fighter\x70\x70 x70_1 240)
		(camera_set halo_flee_1a 0)
		(camera_set halo_flee_1b 120)
		(sleep 90)
		(device_set_power halo_1 1.00)
		(sleep 45)
		(sound_looping_start sound\sinomatixx_foley\x70_foley2 none 1.00)
		(sleep 45)
		(cinematic_screen_effect_start true)
		(cinematic_screen_effect_set_filter_desaturation_tint 1.00 1.00 1.00)
		(cinematic_screen_effect_set_filter 0.00 1.00 0.00 1.00 true 1.00)
		(sleep 30)
		(fade_out 1.00 1.00 1.00 15)
		(sleep 15)))

(script static void int_2
	(begin
		(object_pvs_activate chief_unarmed)
		(object_create_anew fighter_space)
		(object_create_anew chief_unarmed)
		(object_create_anew warning_panel)
		(object_pvs_activate chief_unarmed)
		(objects_attach fighter_space positionchief chief_unarmed )
		(objects_detach fighter_space chief_unarmed)
		(unit_suspended chief_unarmed true)
		(camera_set temp_critical_1a 0)
		(camera_set temp_critical_1b 60)
		(cinematic_screen_effect_start true)
		(cinematic_screen_effect_set_filter_desaturation_tint 1.00 1.00 1.00)
		(cinematic_screen_effect_set_filter 1.00 0.00 1.00 0.00 true 1.00)
		(fade_in 1.00 1.00 1.00 15)
		(sleep 60)
		(sound_impulse_start sound\dialog\x70\cor_18 none 1.00)
		(unit_stop_custom_animation chief_unarmed)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_5110 false)
		(camera_set temp_critical_2a 0)
		(camera_set temp_critical_2b 120)
		(sleep 120)))

(script static void space_2
	(begin
		(object_destroy chief_unarmed)
		(object_destroy warning_panel)
		(object_create_anew fighter_space)
		(object_create_anew_containing space_sparks_1)
		(object_set_scale fighter_space 0.25 0)
		(camera_set decel_1a 0)
		(camera_set decel_1b 180)
		(scenery_animation_start_at_frame fighter_space cinematics\animations\h_fighter\x70\x70 x70_4 40)
		(sleep
			(camera_time))
		(cinematic_screen_effect_stop)
		(object_destroy_containing space_sparks_1)))

(script static void int_3
	(begin
		(player_effect_set_max_rotation 0.00 0.10 0.10)
		(object_create_anew fighter_space)
		(object_create_anew chief_unarmed)
		(objects_attach fighter_space positionchief chief_unarmed )
		(objects_detach fighter_space chief_unarmed)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_6000 false)
		(camera_set halo_look_a 0)
		(camera_set halo_look_b 250)
		(sleep 30)
		(sound_impulse_start sound\dialog\x70\cor_19 none 1.00)
		(sleep
			(-
				(camera_time) 150.00))
		(object_create_anew halo_1)
		(device_set_power halo_1 1.00)
		(sleep
			(camera_time))))

(script static void space_3
	(begin
		(player_effect_set_max_rotation 0.00 0.00 0.00)
		(object_destroy fighter_flee)
		(object_destroy fighter_space)
		(object_destroy chief_unarmed)
		(camera_set halo_fucked_1a 0)
		(camera_set halo_fucked_1b 400)
		(sleep 200)
		(camera_set halo_fucked_1c 250)
		(sleep 305)
		(sound_impulse_start sound\dialog\x70\che_03b chief_unarmed 1.00)
		(cinematic_screen_effect_start true)
		(cinematic_screen_effect_set_filter_desaturation_tint 1.00 1.00 1.00)
		(cinematic_screen_effect_set_filter 0.00 1.00 0.00 1.00 true 1.00)
		(sleep 30)
		(fade_out 1.00 1.00 1.00 15)
		(sleep 15)))

(script dormant void helmet
	(begin
		(sleep 140)
		(object_create_anew x70_helmet)
		(objects_attach chief_unarmed right hand x70_helmet cyborghelmet)))

(script static void int_4
	(begin
		(player_effect_set_max_rotation 0.00 0.10 0.10)
		(object_destroy halo_1)
		(object_destroy fighter_flee)
		(object_create_anew fighter_space)
		(object_create_anew chief_unarmed)
		(objects_attach fighter_space positionchief chief_unarmed )
		(objects_detach fighter_space chief_unarmed)
		(unit_suspended chief_unarmed true)
		(object_beautify chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_6010 false)
		(cinematic_screen_effect_start true)
		(cinematic_screen_effect_set_filter_desaturation_tint 1.00 1.00 1.00)
		(cinematic_screen_effect_set_filter 1.00 0.00 1.00 0.00 true 1.00)
		(sleep 30)
		(fade_in 1.00 1.00 1.00 15)
		(camera_set anyone_else_1a 0)
		(camera_set anyone_else_1b 250)
		(sound_impulse_start sound\dialog\x70\cor_21 none 1.00)
		(sleep 210)
		(camera_set chief_resolve_1a 0)
		(camera_set chief_resolve_1b 60)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_21))
		(sleep 30)
		(sound_impulse_start sound\dialog\x70\cor_23 none 1.00)
		(sleep 60)
		(camera_set slight_pull_1a 180)
		(sleep
			(unit_get_custom_animation_time chief_unarmed))
		(camera_set long_walk_1a 0)
		(camera_set long_walk_1b 200)
		(objects_attach fighter_space positionchief chief_unarmed )
		(objects_detach fighter_space chief_unarmed)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_7000 false)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_23))
		(camera_set its_finished_1a 0)
		(camera_set its_finished_1b 120)
		(sleep 30)
		(sound_impulse_start sound\dialog\x70\cor_24 none 1.00)
		(sleep
			(sound_impulse_time sound\dialog\x70\cor_24))
		(objects_attach fighter_space positionchief chief_unarmed )
		(objects_detach fighter_space chief_unarmed)
		(unit_suspended chief_unarmed true)
		(custom_animation chief_unarmed cinematics\animations\chief\x70\x70 x70_7200 false)
		(sound_impulse_start sound\dialog\x70\che_05 none 1.00)
		(sound_looping_start sound\sinomatixx_foley\x70_helmet none 1.00)
		(wake helmet)
		(player_effect_stop 10.00)
		(object_create_anew_containing space_sparks_2)
		(camera_set pull_back_1a 0)
		(camera_set pull_back_1b 200)
		(sleep 100)
		(camera_set pull_back_1c 200)
		(sleep 100)
		(camera_set pull_back_1d 150)
		(sleep 75)
		(camera_set pull_back_1e 150)
		(sleep 75)
		(camera_set pull_back_1f 150)
		(sleep 75)
		(camera_set pull_back_1g 150)
		(sleep 75)
		(camera_set pull_back_1h 150)
		(sleep 150)
		(camera_set pull_back_1i 600)
		(sleep 100)))

(script static void ring_test
	(begin ring_test ring_test))

(script dormant void bridge_music_1
	(begin
		(sleep 25)
		(sound_looping_start sound\sinomatixx_music\d40_bridge_music01 none 1.00)))

(script static void insertion_1
	(begin
		(fade_out 0.00 0.00 0.00 0)
		(camera_set flyin_1 0)
		(camera_set flyin_2 200)
		(object_type_predict vehicles\banshee\banshee_cinematic)
		(sleep 60)
		(fade_in 0.00 0.00 0.00 60)
		(sleep 40)
		(camera_set flyin_3 200)
		(sleep 100)
		(camera_set flyin_4 200)
		(sleep 100)
		(camera_set flyin_5 200)
		(sleep 100)
		(camera_set flyin_6 200)
		(sleep 100)
		(camera_set flyin_7 200)
		(sleep 100)
		(camera_set flyin_8 250)
		(sleep 125)
		(camera_set flyin_9 250)
		(sleep 125)
		(camera_set flyin_10 250)
		(sleep 125)
		(camera_set flyin_11 250)
		(sleep 125)
		(camera_set flyin_12 200)
		(sleep 100)
		(object_create_anew intro_banshee)
		(unit_close intro_banshee)
		(object_teleport intro_banshee intro_banshee_base)
		(recording_play intro_banshee intro_banshee_flight)
		(sleep 100)
		(camera_set flyin_13 150)
		(sleep
			(-
				(camera_time) 30.00))
		(fade_out 0.00 0.00 0.00 30)
		(sleep 15)
		(recording_kill intro_banshee)
		(object_destroy intro_banshee)))

(script dormant void insertion_dialog
	(begin
		(sound_impulse_start sound\dialog\d40\d40_insert_020_cortana none 1.00)
		(sleep
			(sound_impulse_time sound\dialog\d40\d40_insert_020_cortana))
		(sound_impulse_start sound\dialog\d40\d40_insert_030_chief none 1.00)
		(sleep
			(sound_impulse_time sound\dialog\d40\d40_insert_030_chief))
		(sound_impulse_start sound\dialog\d40\d40_insert_040_cortana none 1.00)
		(sleep
			(-
				(sound_impulse_time sound\dialog\d40\d40_insert_040_cortana) 15.00))
		(sound_impulse_start sound\dialog\d40\d40_insert_050_chief none 1.00)
		(sleep
			(sound_impulse_time sound\dialog\d40\d40_insert_050_chief))
		(sound_impulse_start sound\dialog\d40\d40_insert_060_cortana none 1.00)))

(script static void insertion_2
	(begin
		(object_create_anew intro_banshee)
		(unit_close intro_banshee)
		(objects_predict chief_insertion)
		(camera_set chief_climb_1a 0)
		(camera_set chief_climb_1b 300)
		(object_pvs_activate intro_banshee)
		(sound_looping_start sound\sinomatixx_foley\d40_insertion_foley none 1.00)
		(fade_in 0.00 0.00 0.00 30)
		(object_create_anew_containing banshee_fire)
		(sleep 75)
		(object_teleport intro_banshee banshee_base)
		(recording_kill intro_banshee)
		(recording_play intro_banshee banshee_approach)
		(sleep 75)
		(wake insertion_dialog)
		(camera_set chief_climb_2a 400)
		(sleep
			(-
				(camera_time) 150.00))
		(sound_class_set_gain vehicle_engine 0.00 0)
		(player_effect_set_max_rotation 0.00 0.30 0.30)
		(player_effect_start 1.00 0.00)
		(effect_new effects\explosions\large explosion banshee_explosion)
		(sound_impulse_start sound\sfx\impulse\impacts\jeep_hit_solid none 1.00)
		(player_effect_stop 4.00)
		(object_destroy intro_banshee)
		(object_create_anew chief_insertion)
		(object_beautify chief_insertion true)
		(object_pvs_activate chief_insertion)
		(sleep 60)
		(sound_impulse_start sound\dialog\d40\d40_insert_070_cortana none 1.00)
		(sleep 40)
		(object_create_anew chief_insertion)
		(object_teleport chief_insertion chief_climbup_base)
		(unit_suspended chief_insertion true)
		(custom_animation chief_insertion cinematics\animations\chief\level_specific\d40\d40 d40climbup true)
		(sleep 180)
		(camera_set chief_climb_2b 0)
		(camera_set chief_climb_2c 120)
		(sleep
			(-
				(unit_get_custom_animation_time chief_insertion) 30.00))))

(script startup void food_nipple_test
	(begin
		(sleep_until
			(volume_test_objects nipple_place
				(players)) 5)
		(object_create_anew nipple_grunt)
		(object_create_anew_containing nipple_flood)
		(object_create_anew_containing nipple_fire)
		(unit_set_seat nipple_grunt noncombat)
		(ai_attach_free nipple_grunt characters\captain\captain)
		(ai_command_list_by_unit nipple_grunt nipple_look)
		(sleep_until
			(volume_test_objects nipple_trigger
				(players)) 5)
		(sleep 150)
		(custom_animation nipple_grunt characters\grunt\grunt stand pistol surprise-front false)
		(sound_impulse_start sound\dialog\grunt\scripted\grunty_thirst nipple_grunt 1.00)
		(sleep
			(sound_impulse_time sound\dialog\grunt\scripted\grunty_thirst))))

(script dormant void insertion_music
	(begin
		(sleep 26)
		(sound_looping_start sound\sinomatixx_music\d40_insertion_music none 1.00)))

(script static void trench_attack_pelican
	(begin
		(object_create v_trench_pelican)
		(object_teleport v_trench_pelican v_trench_pelican_flag)
		(recording_play v_trench_pelican v_rec_trench_pelican_crash)
		(if trench_scene_allow_continue
			(begin
				(sleep 295)
				(effect_new effects\explosions\large explosion no objects pelican_bang_1)
				(sleep 30)
				(if trench_scene_allow_continue
					(sound_impulse_start sound\dialog\d40\d40_411_pilot none 1.00))
				(sleep 15)
				(if trench_scene_allow_continue
					(sound_impulse_stop sound\dialog\d40\d40_400_cortana))
				(sleep 81)
				(effect_new effects\explosions\large explosion no objects pelican_bang_2)
				(sleep 139)
				(effect_new effects\explosions\large explosion no objects pelican_bang_3)
				(sleep 20)
				(if trench_scene_allow_continue
					(sound_impulse_stop sound\dialog\d40\d40_420_pilot))
				(sleep
					(max 0.00
						(-
							(recording_time v_trench_pelican) 15.00)))
				(sound_impulse_start sound\sfx\ambience\d40\burn_pel_out v_trench_pelican 1.00)
				(sleep 15)
				(object_destroy v_trench_pelican)))))

(script static void trench_attack_banshee_1
	(begin
		(object_create v_trench_banshee_1)
		(object_teleport v_trench_banshee_1 v_trench_banshee_1_flag)
		(recording_play v_trench_banshee_1 v_rec_trench_banshee_1_in)
		(sleep
			(max 0.00
				(-
					(recording_time v_trench_banshee_1) 450.00)))
		(ai_place trench_banshee_pilots/pilot1)
		(vehicle_load_magic v_trench_banshee_1 b-driver
			(list_get
				(ai_actors trench_banshee_pilots/pilot1) 0))
		(ai_vehicle_encounter v_trench_banshee_1 trench_banshees/banshees)))

(script static void trench_attack_banshee_2
	(begin
		(object_create v_trench_banshee_2)
		(object_teleport v_trench_banshee_2 v_trench_banshee_2_flag)
		(recording_play v_trench_banshee_2 v_rec_trench_banshee_2_in)
		(sleep
			(max 0.00
				(-
					(recording_time v_trench_banshee_2) 450.00)))
		(ai_place trench_banshee_pilots/pilot2)
		(vehicle_load_magic v_trench_banshee_2 b-driver
			(list_get
				(ai_actors trench_banshee_pilots/pilot2) 0))
		(ai_vehicle_encounter v_trench_banshee_2 trench_banshees/banshees)))

(script dormant void trench_banshee1_thread
	(begin trench_banshee1_thread))

(script dormant void trench_banshee2_thread
	(begin trench_banshee2_thread))

(script dormant void trench_pelican_thread
	(begin trench_pelican_thread))
