# 04b_floodlab (The Oracle) Script Docs.

-----

```lisp
(sleep_until (= (volume_test_objects vol_lab_enter (players)) TRUE))

(data_mine_set_mission_segment "04b_7_flood_lab_start")
(game_save_no_timeout)

(set silo_killer_power FALSE)

(ai_place lab_heretics_01 1)
(ai_place lab_turret_grunts_01 2)
(ai_place lab_exit_turrets 2)
(ai_place lab_carriers_01/init1)
(ai_place lab_carriers_01/init2)
(ai_place lab_carriers_01/init3)
```
* wait permanently until the player is within volume 'vol_lab_enter'

* set mission segment to '04b_7_flood_lab_start'

* "permanently" attempt to create a checkpoint when the player is "safe".

* (set silo_killer_power FALSE)


- spawn 1 AI unit from the squad 'lab_heretics_01'
- spawn 2 AI units from the squad 'lab_turret_grunts_01'
- spawn 2 AI units from the squad 'lab_exit_turrets'
- spawn AI unit from the squad 'lab_carriers_01' who's starting location is 'init1'
- spawn AI unit from the squad 'lab_carriers_01' who's starting location is 'init2'
- spawn AI unit from the squad 'lab_carriers_01' who's starting location is 'init3'

-----

````lisp
(wake lab_barricades)
(if (difficulty_legendary)
  (wake famine_flavor)
)

(wake music_04b_03_start)

(sleep_until
  (AND
    (= (volume_test_objects_all vol_lab_floor (players)) TRUE)
    (> (player_count) 0)
  )
30 900)
````
* wake the function 'lab_barricades'

* -- __if__ on legendary, (wake famine_flavor) (skull)

* (wake music_04b_03_start)

* scan every 30 frames (time_here)
   * __if__ the player is within volume 'vol_lab_floor'
   * __if__ the player is still alive
   * __or__ wait 900 frames (time_here) until resuming script actions.

-----

````lisp
(if
    (AND
			(= (volume_test_objects_all vol_lab_floor (players)) FALSE)
			(> (player_count) 0)
		)
			(begin_random
				(begin
					(ai_place lab_combatforms_02/r1)
					(sleep (random_range 5 45))
				)
				(begin
					(ai_place lab_combatforms_02/r2)
					(sleep (random_range 5 45))
				)
				(begin
					(ai_place lab_combatforms_02/r3)
					(sleep (random_range 5 45))
				)
				(begin
					(ai_place lab_combatforms_02/r4)
					(sleep (random_range 5 45))
				)
			)
)
````
* check __if__ the player is _not_ in the volume 'vol_lab_floor'.
* check __if__ the player is still alive.
* __then__ spawn the following AI units in any random order
   * (ai_place lab_combatforms_02/r1)
   * (ai_place lab_combatforms_02/r2)
   * (ai_place lab_combatforms_02/r3)
   * (ai_place lab_combatforms_02/r4)
* __then after__ immediately wait for a random amount of time between 5 frames and 45 frames (time_here or time_here) _after each single_ spawn.

-----

````lisp
(sleep_until
		(AND
			(= (volume_test_objects_all vol_lab_floor (players)) TRUE)
			(> (player_count) 0)
		)
	)
	(game_save_no_timeout)
	(ai_set_orders arm02_allies allies_lab_lower)
````
* wait permanently until
   * the player is within volume 'vol_lab_enter'
   * the player is alive.


* "permanently" attempt to create a checkpoint when the player is "safe".
* (ai_set_orders arm02_allies allies_lab_lower)

-----

````lisp
(sleep_until
		(AND
			(= (ai_nonswarm_count lab_flood) 0)
			(= (ai_living_count lab_heretics) 0)
			(= (volume_test_objects_all vol_lab_floor (players)) TRUE)
			(> (player_count) 0)
		)
	30 8000)
	(data_mine_set_mission_segment "04b_8_flood_lab_mid_01")
	(game_save_no_timeout)
	(ai_place lab_heretics_above 3)
	(sleep 15)
	(ai_magically_see_object lab_heretics_above (player0))
	(ai_magically_see_object lab_heretics_above (player1))
````
* scan every 30 frames (time_here)
   * __if__ there's no AI alive that are in the squad 'lab_flood' who are also not flagged with having a "swarm count".
   * __if__ there's no AI alive that are in the squad 'lab_heretics'.
   * __if__ the player is within volume 'vol_lab_floor'
   * __if__ the player is still alive
   * __or__ wait 8000 frames (time_here) until resuming script actions.


* set mission segment to '04b_8_flood_lab_mid_01'
* "permanently" attempt to create a checkpoint when the player is "safe".
* (ai_place lab_heretics_above 3)
* (sleep 15)
* (ai_magically_see_object lab_heretics_above (player0))
* (ai_magically_see_object lab_heretics_above (player1))

-----

````lisp
(sleep_until (= (objects_can_see_object (players) (list_get (ai_actors lab_heretics_above) 0) 60) TRUE) 30 450)
````
* scan every 30 frames (time_here)
   * __if__ the AI unit with the starting location 'h1' from the squad 'lab_heretics_above' is looking within 60 degrees of the player
   * __or__ wait 450 frames (time_here) until resuming script actions.

-----

````lisp
(sleep_until
  (OR
    (= (ai_living_count allies_elites) 0)
    (ai_scene lab_heretic_ally_scene lab_heretics_ally all_allies)
  )
30 300)

(ai_place lab_combatforms_02/r2)
(ai_place lab_carriers_02/r4)
(ai_set_orders lab_flood lab_above)
````

-- todo

(ai_place lab_combatforms_02/r2)
(ai_place lab_carriers_02/r4)
(ai_set_orders lab_flood lab_above)

-----

````lisp
(sleep_until
		(begin
			(begin_random
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_combatforms_02/r1)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_combatforms_02/r2)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_combatforms_02/r3)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_combatforms_02/r4)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_combatforms_02/r5)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_carriers_02/r1)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_carriers_02/r2)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_carriers_02/r3)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_carriers_02/r4)
						(sleep (random_range 10 40))
					)
				)
				(if (< (ai_nonswarm_count lab_flood) 4)
					(begin
						(ai_place lab_carriers_02/r5)
						(sleep (random_range 10 40))
					)
				)
			)
			(OR
				(< (ai_living_count lab_heretics_above) 1)
				(AND
					(= (volume_test_objects_all vol_lab_floor (ai_actors lab_heretics_above)) TRUE)
					(> (player_count) 0)
				)
			)
		)
	30 4000)
````

* scan every 30 frames (time_here)
   * check to spawn the following AI units in any random order.
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_combatforms_02/r1)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_combatforms_02/r2)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_combatforms_02/r3)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_combatforms_02/r4)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_combatforms_02/r5)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_carriers_02/r1)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_carriers_02/r2)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_carriers_02/r3)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_carriers_02/r4)
      * __if__ the total amount of AI units in the squad 'lab_flood' that don't have the "swarm count" flag is less than 4
      * __then__ (ai_place lab_carriers_02/r5)
   * __then after__ immediately wait for a random amount of time between 10 frames and 40 frames (time_here or time_here)  _after each single_ spawn.


*   
   * __or__ if the total amount of AI units in squad 'lab_heretics_above' is less than 1
   * __and__ a AI unit from the squad 'lab_heretics_above' is within volume 'vol_lab_floor'
   * __and__ the player is still alive.


*   
   * __or__ wait 4000 frames (time_here) until resuming script actions.

-----

````lisp
(game_save_no_timeout)
(ai_set_orders lab_heretics_above lab_flood_all)
(ai_set_orders lab_flood lab_flood_all)
(ai_set_orders arm02_allies allies_lab_wagons)

(sleep_until
		(AND
			(< (ai_nonswarm_count lab_flood) 1)
			(< (ai_living_count lab_heretics_above) 1)
		)
	30 2000)
	(game_save_no_timeout)

	(music_04b_03_start_alt)

	(set lab_flood_count 0)
	(wake lab_wave_new_02)
	(sleep 1800)
````
* "permanently" attempt to create a checkpoint when the player is "safe".
* (ai_set_orders lab_heretics_above lab_flood_all)
* (ai_set_orders lab_flood lab_flood_all)
* (ai_set_orders arm02_allies allies_lab_wagons)


* scan every 30 frames (time_here)
   * __if__ the total amount of AI units in the squad 'lab_flood' is less than 1.
   * __and__ if the total amount of AI units in the squad 'lab_heretics_above' is less than 1.
   * __or__ wait 2000 frames (time_here) until resuming script actions.


* "permanently" attempt to create a checkpoint when the player is "safe".


* (music_04b_03_start_alt)


* (set lab_flood_count 0)
* (wake lab_wave_new_02)
* (sleep 1800)

-----

````lisp
(sleep_until (< (ai_nonswarm_count lab_flood) 1) 30 3600)
	(sleep_until (= (ai_trigger_test "done_fighting" lab_flood) TRUE) 30 1800)
	(data_mine_set_mission_segment "04b_9_flood_lab_mid_02")
	(game_save_no_timeout)

	(music_04b_03_stop_alt)

	(set lab_flood_count 0)
	(wake lab_wave_new_01)
````
* scan every 30 frames (time_here)
   * __if__ the total amount of AI units in the squad (GROUP?) 'lab_flood' that don't have the "swarm count" flag is less than 1.
   * __or__ wait 3600 frames (time_here) until resuming script actions.


* -- (sleep_until (= (ai_trigger_test "done_fighting" lab_flood) TRUE) 30 1800)
* scan every 30 frames (time_here)
   * __if__ all AI units in the squad 'lab_flood' are flagged with the AI trigger of 'done_fighting' that returns true when 0 or fewer AI units are alive.
   * __or__ wait 1800 frames (time_here) until resuming script actions.


* set mission segment to '04b_9_flood_lab_mid_02'
* "permanently" attempt to create a checkpoint when the player is "safe".


* (music_04b_03_stop_alt)


* (set lab_flood_count 0)
* wake the function 'lab_wave_new_01'

-----

````lisp
(data_mine_set_mission_segment "04b_10_flood_lab_end")
	(sleep 90)
	(device_operates_automatically_set lab_exit_int TRUE)
	(ai_place lab_heretics_02 2)
	(ai_place lab_grunts_02 3)
	(ai_set_orders arm02_allies allies_lab_end)
	(wake fuck_this_turret_shit)

	(wake music_04b_03_stop)
````

* set mission segment to '04b_10_flood_lab_end'
* (sleep 90)
* (device_operates_automatically_set lab_exit_int TRUE)
* (ai_place lab_heretics_02 2)
* (ai_place lab_grunts_02 3)
* (ai_set_orders arm02_allies allies_lab_end)
* wake the function 'fuck_this_turret_shit'

* (wake music_04b_03_stop)

-----

````lisp
(sleep_until
  (OR
    (= (ai_living_count lab_heretics) 0)
    (AND
      (= (volume_test_objects_all vol_research_arm_swap (players)) TRUE)
      (> (player_count) 0)
    )
  )
)
(game_save_no_timeout)
(ai_set_orders all_allies allies_airlock)
(wake research_arm_bsp_swap)
)
````
* wait permanently until
   * the total amount of AI units in the squad 'lab_heretics' is equal to 0.
      * __and if__ the player is within volume 'vol_research_arm_swap'.
      * __and if__ the player is still alive.


* "permanently" attempt to create a checkpoint when the player is "safe".
* (ai_set_orders all_allies allies_airlock)
* wake the function 'research_arm_bsp_swap'.
