/*==========
m_defs.qc
==========*/

//globals
float	spawned_mama_shambler;
float	M_is_DM_map;
float	FL_SQUAD	  		= 16384; 

//variables
.float 	count_spawned;			//count how many squads a monster has spawned
.float	spawn_squad_tick;		//interval between spawning squads
.float	squad_think_tick;		//countdown until next time a squad will call its think function (M_Squad_Think)
.float	squad_teleport_wait_time;	//amount of time to wait between teleporting to leader
.float	squad_lost_leader_time;		//countdown until squad will teleport to leader, resets when squad is close to leader + visible to leader
.float	max_squads;			//maximum number of squads a monster can spawn
.float	pain_threshold;			//Mama Shambler wont show pain frames until her health is lower than pain_threshold
.float  min_dist_from_leader;		//when a squad reaches a minimum distance to their leader they stop following
.float	max_dist_from_leader;		//when a squad reaches a maximum distance from their leader they start following
.float	goal_timeout;			//(ai_roam) a monster will seek a new goal_entity after a time
.float	old_dist;			//(ai_roam) save the previous distance to goal_entity to compare it with the current distance
.float	fly_time;			//time between mini shambler jumps
.float	motd_time;			//time to display motd
.float  motd_count;			

.void()	th_follow;			//follow function

.entity squad_leader;			//the leader that spawns squads who then follow it

.entity last_goal1;			//(ai_roam) save previous goal_entity
.entity last_goal2;			//(ai_roam) save previous goal_entity
.entity last_goal3;			//(ai_roam) save previous goal_entity
.entity last_goal4;			//(ai_roam) save previous goal_entity
.entity last_goal5;			//(ai_roam) save previous goal_entity

//fuction prototypes
void(entity ent, void() thinkst) SUB_Think;
void() M_CheckMOTD;
void() M_Spawn_Mama_Shambler;
void() monster_mama_shambler;
void(vector org) spawn_tfog;
void(vector org, entity ent) spawn_tdeath;
float(entity head) Space_Occupied;
float() M_CheckMonsterJumpDown;
entity() M_Find_Spawnpoint;
//========================================================

void() m_precache =
{

	//mini sham
	precache_model ("progs/matboe_mini_shambler.mdl");
	precache_model ("progs/matboe_h_mini_shambler.mdl");
	precache_model ("progs/matboe_gib1_mini.mdl");		
	precache_model ("progs/matboe_gib2_mini.mdl");		
	precache_model ("progs/matboe_gib3_mini.mdl");	
	precache_sound ("matboe/matboe_mini_sham_growl.wav");	
	precache_sound ("matboe/matboe_mini_sham_scream.wav");
	precache_sound ("matboe/matboe_mini_sham_scream2.wav");
	precache_sound ("matboe/matboe_mini_sham_bump.wav");
	precache_sound ("matboe/matboe_mini_sham_bump2.wav");
	precache_sound ("matboe/matboe_mini_sham_idle.wav");

	//mama sham
	precache_model ("progs/matboe_shambler.mdl");
	precache_model ("progs/s_light.mdl");
	precache_model ("progs/h_shams.mdl");
	precache_model ("progs/bolt.mdl");
	precache_sound ("shambler/sattck1.wav");
	precache_sound ("shambler/sboom.wav");
	precache_sound ("shambler/sdeath.wav");
	precache_sound ("shambler/shurt2.wav");
	precache_sound ("shambler/sidle.wav");
	precache_sound ("shambler/ssight.wav");
	precache_sound ("shambler/melee1.wav");
	precache_sound ("shambler/melee2.wav");
	precache_sound ("shambler/smack.wav");
	precache_sound ("matboe/matboe_sham1_roar.wav");

};