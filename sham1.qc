/*________________________________________________________________________________________________________________________________
==================================================================================================================================

                                                             ▄▄                                  ▄▄          ▄▄                  
 ▀████▄     ▄███▀                                     ▄█▀▀▀█▄███                                 ▄██        ▀███                  
   ████    ████                                      ▄██    ▀███                                  ██          ██                  
   █ ██   ▄█ ██  ▄█▀██▄ ▀████████▄█████▄  ▄█▀██▄     ▀███▄    ███████▄  ▄█▀██▄ ▀████████▄█████▄   ██▄████▄    ██   ▄▄█▀██▀███▄███ 
   █  █▓  █▀ ██ ██   ██   ██    ██    ██ ██   ██       ▀█████▄██    ██ ██   ██   ██    ██    ██   ██    ▀██   ▓█  ▄█▀   ██ ██▀ ▀▀ 
   ▓  █▓▄█▀  ██  ▄███▓█   ▓█    ██    ██  ▄███▓█           ▀████    █▓  ▄███▓█   ▓█    ██    ██   ▓█     ██   ▓█  ▓█▀▀▀▀▀▀ █▓     
   ▓  ▀▓█▀   ██ █▓   ▓█   ▓█    ▓█    ██ █▓   ▓█     ██     ███▓    █▓ █▓   ▓█   ▓█    ▓█    ██   ▓▓▓   ▄█▓   ▓█  ▓█▄    ▄ █▓     
   ▓  ▓▓▓▓▀  ▓▓  ▓▓▓▓▒▓   ▓▓    ▓▓    ▓▓  ▓▓▓▓▒▓     ▓     ▀█▓▓▓    ▓▓  ▓▓▓▓▒▓   ▓▓    ▓▓    ▓▓   ▓▓     ▓▓   ▓▓  ▓▓▀▀▀▀▀▀ ▓▓     
   ▒  ▀▓▓▀   ▓▓ ▓▓   ▒▓   ▒▓    ▒▓    ▓▓ ▓▓   ▒▓     ▓▓     ▓▓▓▒    ▓▒ ▓▓   ▒▓   ▒▓    ▒▓    ▓▓   ▒▓▓   ▓▓▓   ▒▓  ▒▓▓      ▓▒     
 ▒ ▒▒▒ ▒   ▒ ▒▒▒▒▓▒ ▒ ▓▒▒ ▒▓▒  ▒▒▒   ▒▒▓▒▒▓▒ ▒ ▓▒    ▒▓▒ ▒ ▒▓▒ ▒   ▒ ▒ ▒▓▒ ▒ ▓▒▒ ▒▓▒  ▒▒▒   ▒▒▓▒  ▒ ▒ ▒ ▒▒  ▒ ▒ ▒  ▒ ▒ ▒▒▒ ▒▒▒    
                                                                                                                                 

                                                                                                        matboe - mod_jam_2022                                                                                                                                                                                                                                                                      
__________________________________________________________________________________________________________________________________
================================================================================================================================*/

//animation frames
$cd id1/models/shams
$origin 0 0 24
$base base		
$skin base

$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7 stand8 stand9
$frame stand10 stand11 stand12 stand13 stand14 stand15 stand16 stand17

$frame walk1 walk2 walk3 walk4 walk5 walk6 walk7 
$frame walk8 walk9 walk10 walk11 walk12

$frame run1 run2 run3 run4 run5 run6

$frame smash1 smash2 smash3 smash4 smash5 smash6 smash7 
$frame smash8 smash9 smash10 smash11 smash12

$frame swingr1 swingr2 swingr3 swingr4 swingr5 
$frame swingr6 swingr7 swingr8 swingr9

$frame swingl1 swingl2 swingl3 swingl4 swingl5 
$frame swingl6 swingl7 swingl8 swingl9

$frame throw1 throw2 throw3 throw4 throw5 throw6 throw7 
$frame throw8 throw9 

$frame magic1 magic2 magic3 magic4 magic5 
$frame magic6 magic7 magic8 magic9 magic10 magic11 magic12

$frame pain1 pain2 pain3 pain4 pain5 pain6

$frame death1 death2 death3 death4 death5 death6 
$frame death7 death8 death9 death10 death11


//function prototypes
void() monster_mini_shambler;
void() Mini_Shambler_Death;
void() check_spawn_squad;
void() M_Throw_Mini_Shambler;
float() sham1_check_throw;

//==========================================================================================

void() sham1_stand1		=[	$stand1,	sham1_stand2	] {ai_stand();};
void() sham1_stand2		=[	$stand2,	sham1_stand3	] {ai_stand();};
void() sham1_stand3		=[	$stand3,	sham1_stand4	] {ai_stand();};
void() sham1_stand4		=[	$stand4,	sham1_stand5	] {ai_stand();};
void() sham1_stand5		=[	$stand5,	sham1_stand6	] {ai_stand();};
void() sham1_stand6		=[	$stand6,	sham1_stand7	] {ai_stand();};
void() sham1_stand7		=[	$stand7,	sham1_stand8	] {ai_stand();};
void() sham1_stand8		=[	$stand8,	sham1_stand9	] {ai_stand();};
void() sham1_stand9		=[	$stand9,	sham1_stand10	] {ai_stand();};
void() sham1_stand10		=[	$stand10,	sham1_stand11	] {ai_stand();};
void() sham1_stand11		=[	$stand11,	sham1_stand12	] {ai_stand();};
void() sham1_stand12		=[	$stand12,	sham1_stand13	] {ai_stand();};
void() sham1_stand13		=[	$stand13,	sham1_stand14	] {ai_stand();};
void() sham1_stand14		=[	$stand14,	sham1_stand15	] {ai_stand();};
void() sham1_stand15		=[	$stand15,	sham1_stand16	] {ai_stand();};
void() sham1_stand16		=[	$stand16,	sham1_stand17	] {ai_stand();};
void() sham1_stand17		=[	$stand17,	sham1_stand1	] {ai_stand();check_spawn_squad();};


void() sham1_walk1		=[      $walk1,		sham1_walk2 ] {ai_walk(10);};
void() sham1_walk2      	=[      $walk2,	        sham1_walk3 ] {ai_walk(9); };
void() sham1_walk3      	=[      $walk3,	        sham1_walk4 ] {ai_walk(7);};
void() sham1_walk4      	=[      $walk4,	        sham1_walk5 ] {ai_walk(3);};
void() sham1_walk5      	=[      $walk5,	        sham1_walk6 ] {ai_walk(4);};
void() sham1_walk6      	=[      $walk6,	        sham1_walk7 ] {ai_walk(10);};
void() sham1_walk7     		=[      $walk7,	        sham1_walk8 ] {ai_walk(6);};
void() sham1_walk8    	 	=[      $walk8,	        sham1_walk9 ] {ai_walk(2);};
void() sham1_walk9    	 	=[      $walk9,	        sham1_walk10] {ai_walk(13);};
void() sham1_walk10     	=[      $walk10,	sham1_walk11] {ai_walk(7);};
void() sham1_walk11   		=[      $walk11,	sham1_walk12] {ai_walk(5);};
void() sham1_walk12   		=[      $walk12,	sham1_walk1 ] {ai_walk(5);
check_spawn_squad();
if (random() > 0.8)
	sound (self, CHAN_VOICE, "shambler/sidle.wav", 1, ATTN_IDLE);
};

void() sham1_roam1		=[      $walk1,		sham1_roam2 ] {ai_roam(10);};
void() sham1_roam2      	=[      $walk2,	        sham1_roam3 ] {ai_roam(9); };
void() sham1_roam3      	=[      $walk3,	        sham1_roam4 ] {ai_roam(7);};
void() sham1_roam4      	=[      $walk4,	        sham1_roam5 ] {ai_roam(3);};
void() sham1_roam5      	=[      $walk5,	        sham1_roam6 ] {ai_roam(4);};
void() sham1_roam6      	=[      $walk6,	        sham1_roam7 ] {ai_roam(10);};
void() sham1_roam7     		=[      $walk7,	        sham1_roam8 ] {ai_roam(6);};
void() sham1_roam8    	 	=[      $walk8,	        sham1_roam9 ] {ai_roam(2);};
void() sham1_roam9    	 	=[      $walk9,	        sham1_roam10] {ai_roam(13);};
void() sham1_roam10     	=[      $walk10,	sham1_roam11] {ai_roam(7);};
void() sham1_roam11   		=[      $walk11,	sham1_roam12] {ai_roam(5);};
void() sham1_roam12   		=[      $walk12,	sham1_roam1 ] {ai_roam(5);
check_spawn_squad();
if (random() > 0.8)
	sound (self, CHAN_VOICE, "shambler/sidle.wav", 1, ATTN_IDLE);
};


void() sham1_run1       	=[      $run1,        	sham1_run2      ] {ai_run(10);};
void() sham1_run2       	=[      $run2,       	sham1_run3      ] {ai_run(14);};
void() sham1_run3      		=[      $run3,        	sham1_run4      ] {ai_run(10);};
void() sham1_run4       	=[      $run4,        	sham1_run5      ] {ai_run(10);};
void() sham1_run5       	=[      $run5,       	sham1_run6      ] {ai_run(14);};
void() sham1_run6       	=[      $run6,       	sham1_run1      ] {ai_run(10);
check_spawn_squad();
if (random() > 0.8)
	sound (self, CHAN_VOICE, "shambler/sidle.wav", 1, ATTN_IDLE);
};

void() sham1_smash1     	=[      $smash1,       sham1_smash2    ] {
sound (self, CHAN_VOICE, "shambler/melee1.wav", 1, ATTN_NORM);
ai_charge(2);};
void() sham1_smash2     	=[      $smash2,      	sham1_smash3    ] {ai_charge(6);};
void() sham1_smash3     	=[      $smash3,      	sham1_smash4    ] {ai_charge(6);};
void() sham1_smash4    		=[      $smash4,       	sham1_smash5    ] {ai_charge(5);};
void() sham1_smash5     	=[      $smash5,       	sham1_smash6    ] {ai_charge(4);};
void() sham1_smash6     	=[      $smash6,      	sham1_smash7    ] {ai_charge(1);};
void() sham1_smash7     	=[      $smash7,       	sham1_smash8    ] {ai_charge(0);};
void() sham1_smash8     	=[      $smash8,      	sham1_smash9    ] {ai_charge(0);};
void() sham1_smash9     	=[      $smash9,      	sham1_smash10   ] {ai_charge(0);};
void() sham1_smash10    	=[      $smash10,      	sham1_smash11   ] {
local vector	delta;
local float 	ldmg;

	if (!self.enemy)
		return;
	ai_charge(0);

	delta = self.enemy.origin - self.origin;

	if (vlen(delta) > 100)
		return;
	if (!CanDamage (self.enemy, self))
		return;
		
	ldmg = (random() + random() + random()) * 40;

        if (ldmg < 10)  ldmg = 20;

	T_Damage (self.enemy, self, self, ldmg);
	sound (self, CHAN_VOICE, "shambler/smack.wav", 1, ATTN_NORM);

	SpawnMeatSpray (self.origin + v_forward*16, crandom() * 100 * v_right);
	SpawnMeatSpray (self.origin + v_forward*16, crandom() * 100 * v_right);
};

void() sham1_smash11    	=[      $smash11,      sham1_smash12	] {ai_charge(5);};
void() sham1_smash12    	=[      $smash12,      sham1_run1	] {ai_charge(4);};
void() sham1_swingr1;

void(float side) Cranked_ShamClaw =
{
local vector	delta;
local float 	ldmg;

	if (!self.enemy)
		return;
	ai_charge(10);

	delta = self.enemy.origin - self.origin;

	if (vlen(delta) > 100)
		return;
		
	ldmg = (random() + random() + random()) * 20;

        if (ldmg < 10)  ldmg = 10;

	T_Damage (self.enemy, self, self, ldmg);

	sound (self, CHAN_VOICE, "shambler/smack.wav", 1, ATTN_NORM);

	if (side)
	{
		makevectors (self.angles);
		SpawnMeatSpray (self.origin + v_forward*16, side * v_right);
	}
};

void() sham1_swingl1	=[      $swingl1,      sham1_swingl2   ] {
sound (self, CHAN_VOICE, "shambler/melee2.wav", 1, ATTN_NORM);
ai_charge(5);
};
void() sham1_swingl2 =[      $swingl2,      sham1_swingl3   ] {ai_charge(3);};
void() sham1_swingl3 =[      $swingl3,      sham1_swingl4   ] {ai_charge(7);};
void() sham1_swingl4 =[      $swingl4,      sham1_swingl5   ] {ai_charge(3);};
void() sham1_swingl5 =[      $swingl5,      sham1_swingl6   ] {ai_charge(7);};
void() sham1_swingl6 =[      $swingl6,      sham1_swingl7   ] {ai_charge(9);};
void() sham1_swingl7 =[      $swingl7,      sham1_swingl8   ] {ai_charge(5); Cranked_ShamClaw(250);};
void() sham1_swingl8 =[      $swingl8,      sham1_swingl9   ] {ai_charge(4);};
void() sham1_swingl9 =[      $swingl9,      sham1_run1  ] {
ai_charge(8);
if (random()<0.5)

if (self.enemy.health > 0)      // Stop when enemy is dead.
	self.think = sham1_swingr1;
};

void() sham1_swingr1	=[      $swingr1,      sham1_swingr2   ] {
sound (self, CHAN_VOICE, "shambler/melee1.wav", 1, ATTN_NORM);
ai_charge(1);
};
void() sham1_swingr2	=[      $swingr2,      sham1_swingr3   ] {ai_charge(8);};
void() sham1_swingr3 =[      $swingr3,      sham1_swingr4   ] {ai_charge(14);};
void() sham1_swingr4 =[      $swingr4,      sham1_swingr5   ] {ai_charge(7);};
void() sham1_swingr5 =[      $swingr5,      sham1_swingr6   ] {ai_charge(3);};
void() sham1_swingr6 =[      $swingr6,      sham1_swingr7   ] {ai_charge(6);};
void() sham1_swingr7 =[      $swingr7,      sham1_swingr8   ] {ai_charge(6); Cranked_ShamClaw(-250);};
void() sham1_swingr8 =[      $swingr8,      sham1_swingr9   ] {ai_charge(3);};
void() sham1_swingr9 =[      $swingr9,      sham1_run1  ] {ai_charge(1);
ai_charge(10);
if (random()<0.5)

if (self.enemy.health > 0)      // Stop when enemy is dead.
	self.think = sham1_swingl1;
};

void() sham1_melee =
{
	local float chance;
	
	chance = random();
        if (chance > 0.6 || self.health == 600)
                sham1_smash1 ();
	else if (chance > 0.3)
		sham1_swingr1 ();
	else
		sham1_swingl1 ();
};


//============================================================================


void() sham1_pain1       =[      $pain1, sham1_pain2      ] {};
void() sham1_pain2       =[      $pain2, sham1_pain3      ] {};
void() sham1_pain3       =[      $pain3, sham1_pain4      ] {};
void() sham1_pain4       =[      $pain4, sham1_pain5      ] {};
void() sham1_pain5       =[      $pain5, sham1_pain6      ] {};
void() sham1_pain6       =[      $pain6, sham1_run1      ] {};

void(entity attacker, float damage)	sham1_pain =
{
	sound (self, CHAN_VOICE, "shambler/shurt2.wav", 1, ATTN_NORM);

	if (self.health <= 0)
		return;		// allready dying, don't go into pain frame

	if (random()*200 > damage)
		return;		// didn't flinch

	if (self.pain_finished > time)
		return;

	if (self.health > self.pain_threshold)
		return;

	self.pain_finished = time + 2;
		
	sham1_pain1 ();
};


//============================================================================

void() sham1_death1      =[      $death1,       sham1_death2     ] {};
void() sham1_death2      =[      $death2,       sham1_death3     ] {};
void() sham1_death3      =[      $death3,       sham1_death4     ] {self.solid = SOLID_NOT;};
void() sham1_death4      =[      $death4,       sham1_death5     ] {};
void() sham1_death5      =[      $death5,       sham1_death6     ] {};
void() sham1_death6      =[      $death6,       sham1_death7     ] {};
void() sham1_death7      =[      $death7,       sham1_death8     ] {};
void() sham1_death8      =[      $death8,       sham1_death9     ] {};
void() sham1_death9      =[      $death9,       sham1_death10    ] {};
void() sham1_death10     =[      $death10,      sham1_death11    ] {};
void() sham1_death11     =[      $death11,      sham1_death11    ] {
self.nextthink = time + 3;
if (M_is_DM_map == FALSE)
	return;

self.think = M_Level_Exit;
};

void() sham1_die =
{

//if its a deathmatch map exit the level
	if (M_is_DM_map == TRUE)
	{
		self.nextthink = time + 3;
		self.think = M_Level_Exit;
	}

// check for gib
	if (self.health < -60)
	{
		sound (self, CHAN_VOICE, "player/udeath.wav", 1, ATTN_NORM);
		ThrowHead ("progs/h_shams.mdl", self.health);
		ThrowGib ("progs/gib1.mdl", self.health);
		ThrowGib ("progs/gib2.mdl", self.health);
		ThrowGib ("progs/gib3.mdl", self.health);
		return;
	}

// regular death
	sound (self, CHAN_VOICE, "shambler/sdeath.wav", 1, ATTN_NORM);
	sham1_death1 ();
};

//=================================================================================

void() sham1_throw1	=[      $throw1,      sham1_throw2   ] {
sound (self, CHAN_VOICE, "shambler/melee2.wav", 1, ATTN_NORM);
ai_charge(5);};
void() sham1_throw2  =[      $throw2,	sham1_throw3	] {ai_face();};
void() sham1_throw3  =[      $throw3,	sham1_throw4	] {ai_face();};
void() sham1_throw4  =[      $throw4,	sham1_throw5	] {ai_face();};
void() sham1_throw5  =[      $throw4,	sham1_throw6	] {ai_face();};
void() sham1_throw6  =[      $throw4,	sham1_throw7	] {ai_face();};
void() sham1_throw7  =[      $throw4,	sham1_throw8	] {ai_face();};
void() sham1_throw8  =[      $throw4,	sham1_throw9	] {ai_face();};
void() sham1_throw9  =[      $throw5,	sham1_throw10	] {ai_face();};
void() sham1_throw10 =[      $throw6,	sham1_throw11	] {ai_face();M_Throw_Mini_Shambler();};
void() sham1_throw11 =[      $throw7,	sham1_throw12	] {ai_face();};
void() sham1_throw12 =[      $throw8,	sham1_throw13	] {ai_face();SUB_CheckRefire (sham1_throw2);};
void() sham1_throw13 =[      $throw9,	sham1_run1	] {};


void() M_Throw_Mini_Shambler =
{
	local	entity	mini_sham;
        local   float   dist;		   // Distance between attacker and target.
        local   float   fly; 		   // This dictates how fast the projectile will fly up when it is launched.                                	   /
        local   float   airtime;           // Approximate time for grenade to reach target.
        local   vector  move;   	   // xy-velocity of target. 
        local   vector  spot;   	   // Spot where grenade will land with leading.
        local   vector  org;    	   // Location where grenade is spawned.
	local	vector	dir;

	ai_face();

	makevectors (self.angles);

        org 	= (self.origin + v_forward * 64 + v_right * -40 + v_up*32);
        dist 	= vlen(self.enemy.origin - org);
        airtime = dist / 600;
        move 	= self.enemy.velocity;
        move_z  = 0;
        spot 	= self.enemy.origin + airtime * move;

	//load mini shambler
	mini_sham			= spawn();
	mini_sham.classname 		= "monster_mini_shambler";
	mini_sham.flags 		= mini_sham.flags | FL_MONSTER | FL_SQUAD;
	mini_sham.solid 		= SOLID_BBOX;
	mini_sham.movetype 		= MOVETYPE_STEP;	
	mini_sham.health 		= 20;
	mini_sham.takedamage		= DAMAGE_AIM;
	mini_sham.th_stand 		= mini_sham_stand1;
	mini_sham.th_walk 		= mini_sham_walk1;
	mini_sham.th_run 		= mini_sham_run1;
	mini_sham.th_die 		= Mini_Shambler_Death;
	mini_sham.th_melee 		= mini_sham_swing1;
	mini_sham.th_missile 		= mini_sham_jump;
	mini_sham.th_pain 		= sham_pain;
	mini_sham.th_follow		= mini_sham_follow1;
	mini_sham.yaw_speed		= 20;
	mini_sham.view_ofs 		= '0 0 25';
	mini_sham.use 			= monster_use;
	mini_sham.owner 		= self;
	mini_sham.angles		= '0 0 0';
	mini_sham.touch    		= Mini_Shambler_Touch;
	mini_sham.movetype 		= MOVETYPE_BOUNCE;	
	mini_sham.squad_leader		= self; 
	mini_sham.squad_think_tick	= time + 10;
	mini_sham.squad_teleport_wait_time	= time + 10;
	mini_sham.min_dist_from_leader 		= 100;
	mini_sham.max_dist_from_leader 		= 200;

	setorigin (mini_sham, org);
	setmodel (mini_sham, "progs/matboe_mini_shambler.mdl");
	setsize (mini_sham, '-8 -8 -6', '8 8 16');

	//throw
        if (vlen(spot - org) < dist)
                spot = self.enemy.origin + airtime * move * 0.7;
        else if (vlen(spot - org) > dist)
                spot = self.enemy.origin + airtime * move * 1.2;

        mini_sham.velocity = normalize (spot - org);

        mini_sham.velocity = mini_sham.velocity * 500;

        dist = vlen(spot - org);

        fly = PM_GrenadeFly(dist);

        mini_sham.velocity_z = ((mini_sham.velocity_z + fly));

	dir = normalize(self.enemy.origin - mini_sham.origin);
	mini_sham.angles = vectoangles(dir);

	mini_sham.enemy = self.enemy;
	mini_sham.goalentity = self.enemy;
	SUB_Think (mini_sham, mini_sham_fly1);

	self.count_spawned = self.count_spawned + 1;
};

//============================================================================

void() BossShamCastLightning =
{
	local	vector	org, dir;
	
	self.effects = self.effects | EF_MUZZLEFLASH;

	ai_face ();

	org = self.origin + '0 0 40';

	dir = self.enemy.origin + '0 0 16' - org;
	dir = normalize (dir);

	traceline (org, self.origin + dir*600, TRUE, self);

	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_LIGHTNING1);
	WriteEntity (MSG_BROADCAST, self);
	WriteCoord (MSG_BROADCAST, org_x);
	WriteCoord (MSG_BROADCAST, org_y);
	WriteCoord (MSG_BROADCAST, org_z);
	WriteCoord (MSG_BROADCAST, trace_endpos_x);
	WriteCoord (MSG_BROADCAST, trace_endpos_y);
	WriteCoord (MSG_BROADCAST, trace_endpos_z);

	LightningDamage (org, trace_endpos, self, 10);
};

void() sham1_magic1     =[      $magic1,       sham1_magic2    ] {ai_face();
	sound (self, CHAN_WEAPON, "shambler/sattck1.wav", 1, ATTN_NORM);
};
void() sham1_magic2     =[      $magic2,       sham1_magic3    ] {ai_face();};
void() sham1_magic3     =[      $magic3,       sham1_magic4    ] {ai_face();self.nextthink = self.nextthink + 0.2;
local entity o;

self.effects = self.effects | EF_MUZZLEFLASH;
ai_face();
self.owner = spawn();
o = self.owner;
setmodel (o, "progs/s_light.mdl");
setorigin (o, self.origin);
o.angles = self.angles;
o.nextthink = time + 0.7;
o.think = SUB_Remove;
};
void() sham1_magic4     =[      $magic4,       sham1_magic5    ]
{
self.effects = self.effects | EF_MUZZLEFLASH;
self.owner.frame = 1;
};
void() sham1_magic5     =[      $magic5,       sham1_magic6    ]
{
self.effects = self.effects | EF_MUZZLEFLASH;
self.owner.frame = 2;
};
void() sham1_magic6     =[      $magic6,       sham1_magic9    ]
{
remove (self.owner);
BossShamCastLightning();
sound (self, CHAN_WEAPON, "shambler/sboom.wav", 1, ATTN_NORM);
};
void() sham1_magic9     =[      $magic9,       sham1_magic10   ]
{BossShamCastLightning();};
void() sham1_magic10    =[      $magic10,      sham1_magic11   ]
{BossShamCastLightning();};
void() sham1_magic11    =[      $magic11,      sham1_magic12   ]
{
if (skill == 3)
	BossShamCastLightning();
};
void() sham1_magic12    =[      $magic12,      sham1_run1	   ] {};

//============================================================================

float() sham1_check_throw =
{
	local	vector org;


        org 	= (self.origin + v_forward * 64 + v_right * -40 + v_up*32);

	makevectors (self.angles);

	//check if theres space above throw release point
	traceline (org, org + '0 0 64', FALSE, self);
	if ((trace_fraction != 1)
	  || (!trace_inopen)
	  || (pointcontents (trace_endpos) != CONTENT_EMPTY))
		return FALSE;

	//check if theres space left (Mama Shambler is a lefty!)
	traceline (org, org - v_right*64, FALSE, self);
	if ((trace_fraction != 1)
	  || (!trace_inopen)
	  || (pointcontents (trace_endpos) != CONTENT_EMPTY))
		return FALSE;

	//check if theres space in front and above
	traceline (org, org + v_forward * 64 + v_up * 64, FALSE, self);
	if ((trace_fraction != 1)
	  || (!trace_inopen)
	  || (pointcontents (trace_endpos) != CONTENT_EMPTY))
		return FALSE;

	return TRUE;
};


void() sham1_choose_missile =
{
	local float dist;

	dist = vlen(self.enemy.origin - self.origin);

	if ((dist > 200) && (sham1_check_throw() == TRUE))
	{
			sham1_throw1();
			return;
	}

	sham1_magic1();
};


float() calc_spawn_tick_time =
{
	local float s;

	s = (cvar ("skill"));
	if (s > 3) 
		s = 0;

	return s;
};

void() check_spawn_squad =
{


	if ((self.spawn_squad_tick < time) && (self.count_spawned < self.max_squads))
	{
		//bprint ("SPAWN!! "); bprint (ftos(self.count_spawned)); bprint ("  "); bprint(ftos(self.spawn_squad_tick - time));bprint("\n");
		M_Spawn_Squad (monster_mini_shambler);
	
		self.spawn_squad_tick = time + calc_spawn_tick_time();	//set spawn time based on skill level
	}
};


/*==============================
 set_mama_shambler_health

 set health. search for monsters in the map, if none are found return 3x health
==============================*/
float() set_mama_shambler_health =
{
	local entity e;
	local float h, found_monster;

	h = 400 + (100*skill);	//set health based on skill level
	e = nextent (world);
	while ((e) && (!found_monster))
	{
		if (e.flags & FL_MONSTER)
			found_monster = 1;

		e = nextent (e);
	}

	if (!found_monster)
		h = h * 3;

	return h;
};

//============================================================================
/*QUAKED monster_shambler (1 0 0) (-32 -32 -24) (32 32 64) Ambush
*/
void() monster_mama_shambler =
{
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;
	setmodel (self, "progs/matboe_shambler.mdl");

	//setsize (self, '-32 -32 -48', '32 32 64');
	setsize (self, VEC_HULL2_MIN, VEC_HULL2_MAX);

	self.pain_threshold = 200;

	self.health = set_mama_shambler_health();
	self.max_squads = 15+20*skill;
	self.classname = "monster_mama_shambler";
	self.spawn_squad_tick = time + 4;

	self.th_stand = sham1_stand1;
	self.th_walk = sham1_roam1;
	self.th_run = sham1_run1;
	self.th_die = sham1_die;
	self.th_melee = sham1_melee;
        self.th_missile = sham1_choose_missile;

	self.th_pain = sham1_pain;

	walkmonster_start();
};
