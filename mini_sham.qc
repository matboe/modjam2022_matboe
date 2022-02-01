/*_____________________________________________________________________________________________________________________________
===============================================================================================================================

                 ▄▄              ▄▄              ▄▄                                  ▄▄          ▄▄                  
 ▀████▄     ▄███▀ ██              ██      ▄█▀▀▀█▄███                                 ▄██        ▀███                  
   ████    ████                          ▄██    ▀███                                  ██          ██                  
   █ ██   ▄█ ██ ▀███ ▀████████▄ ▀███     ▀███▄    ███████▄  ▄█▀██▄ ▀████████▄█████▄   ██▄████▄    ██   ▄▄█▀██▀███▄███ 
   █  █▓  █▀ ██   ██   ██    ██   ██       ▀█████▄██    ██ ██   ██   ██    ██    ██   ██    ▀██   ▓█  ▄█▀   ██ ██▀ ▀▀ 
   ▓  █▓▄█▀  ██   ▓█   █▓    ██   ▓█           ▀████    █▓  ▄███▓█   ▓█    ██    ██   ▓█     ██   ▓█  ▓█▀▀▀▀▀▀ █▓     
   ▓  ▀▓█▀   ██   ▓█   █▓    ▓█   ▓█     ██     ███▓    █▓ █▓   ▓█   ▓█    ▓█    ██   ▓▓▓   ▄█▓   ▓█  ▓█▄    ▄ █▓     
   ▓  ▓▓▓▓▀  ▓▓   ▓▓   ▓▓    ▓▓   ▓▓     ▓     ▀█▓▓▓    ▓▓  ▓▓▓▓▒▓   ▓▓    ▓▓    ▓▓   ▓▓     ▓▓   ▓▓  ▓▓▀▀▀▀▀▀ ▓▓     
   ▒  ▀▓▓▀   ▓▓   ▓▓   ▓▓    ▓▓   ▓▓     ▓▓     ▓▓▓▒    ▓▒ ▓▓   ▒▓   ▒▓    ▒▓    ▓▓   ▒▓▓   ▓▓▓   ▒▓  ▒▓▓      ▓▒     
 ▒ ▒▒▒ ▒   ▒ ▒▒▒▒ ▒ ▒▒ ▒▒▒  ▒▓▒ ▒ ▒ ▒    ▒▓▒ ▒ ▒▓▒ ▒   ▒ ▒ ▒▓▒ ▒ ▓▒▒ ▒▓▒  ▒▒▒   ▒▒▓▒  ▒ ▒ ▒ ▒▒  ▒ ▒ ▒  ▒ ▒ ▒▒▒ ▒▒▒    
                                                                                                                     
                                                                                                                     

                                                                                               matboe - mod_jam_2022                                                                                                                                                                                                                                                                      
_______________________________________________________________________________________________________________________________
=============================================================================================================================*/

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

//=====================================================================================================

void() mini_sham_death1      =[      $death1,		mini_sham_death2     ] {};
void() mini_sham_death2      =[      $death2,		mini_sham_death3     ] {};
void() mini_sham_death3      =[      $death3,		mini_sham_death4     ] {self.solid = SOLID_NOT;};
void() mini_sham_death4      =[      $death4,		mini_sham_death5     ] {};
void() mini_sham_death5      =[      $death5,		mini_sham_death6     ] {};
void() mini_sham_death6      =[      $death6,		mini_sham_death7     ] {};
void() mini_sham_death7      =[      $death7,		mini_sham_death8     ] {};
void() mini_sham_death8      =[      $death8,		mini_sham_death9     ] {};
void() mini_sham_death9      =[      $death9,		mini_sham_death10    ] {};
void() mini_sham_death10     =[      $death10,		mini_sham_death11    ] {};
void() mini_sham_death11     =[      $death11,		mini_sham_death11    ] {};

void () Mini_Shambler_Death =
{
	local float r;

	if (self.squad_leader)
		self.squad_leader.count_spawned = self.squad_leader.count_spawned - 1;

	T_Damage(self, self, self, 50); //M - Make em pop!
	sound (self, CHAN_VOICE, "player/udeath.wav", 1, ATTN_NORM);
	
	r = random();
	
	r = (-50 - (r * 10));
	ThrowHead ("progs/matboe_h_mini_shambler.mdl", r);
	ThrowGib ("progs/matboe_gib1_mini.mdl", (r));
	ThrowGib ("progs/matboe_gib2_mini.mdl", (r));
	ThrowGib ("progs/matboe_gib3_mini.mdl", (r));
	ThrowGib ("progs/matboe_gib1_mini.mdl", (r));
	ThrowGib ("progs/matboe_gib2_mini.mdl", (r));
	ThrowGib ("progs/matboe_gib3_mini.mdl", (r));

	self.nextthink = time + 15;
	self.think = SUB_Remove;

};

//=================================================================================

void(float side) MiniShamClaw =
{
	local vector	delta;
	local float 	ldmg;

	if (!self.enemy)
		return;

	ai_charge(10);

	delta = self.enemy.origin - self.origin;

	if (vlen(delta) > 80)
		return;

	ldmg = (random() + random() + random()) * 5;
	T_Damage (self.enemy, self, self, ldmg);
	sound (self, CHAN_VOICE, "shambler/smack.wav", 1, ATTN_NORM);

	if (side)
	{
		if (random() > 0.8)
		{
			makevectors (self.angles);
			SpawnMeatSpray (self.origin + v_forward*16, side * v_right);
		}	
	}
};

//=================================================================================
void() mini_sham_stand1	   =[      $stand1,	mini_sham_stand2 ] {ai_stand();};
void() mini_sham_stand2    =[      $stand2,     mini_sham_stand3 ] {ai_stand();};
void() mini_sham_stand3    =[      $stand3,	mini_sham_stand4 ] {ai_stand();};
void() mini_sham_stand4    =[      $stand4,	mini_sham_stand5 ] {ai_stand();};
void() mini_sham_stand5    =[      $stand5,	mini_sham_stand6 ] {ai_stand();};
void() mini_sham_stand6    =[      $stand6,	mini_sham_stand7 ] {ai_stand();};
void() mini_sham_stand7    =[      $stand7,	mini_sham_stand8 ] {ai_stand();};
void() mini_sham_stand8    =[      $stand8,	mini_sham_stand9 ] {ai_stand();};
void() mini_sham_stand9    =[      $stand9,	mini_sham_stand10] {ai_stand();};
void() mini_sham_stand10   =[      $stand10,	mini_sham_stand11] {ai_stand();};
void() mini_sham_stand11   =[      $stand11,	mini_sham_stand12] {ai_stand();};
void() mini_sham_stand12   =[      $stand12,	mini_sham_stand13] {ai_stand();};
void() mini_sham_stand13   =[      $stand13,	mini_sham_stand14] {ai_stand();};
void() mini_sham_stand14   =[      $stand14,	mini_sham_stand15] {ai_stand();};
void() mini_sham_stand15   =[      $stand15,	mini_sham_stand16] {ai_stand();};
void() mini_sham_stand16   =[      $stand16,	mini_sham_stand17] {ai_stand();};
void() mini_sham_stand17   =[      $stand16,	mini_sham_stand1 ] {
ai_stand();
if (random() > 0.95)
	sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_idle.wav", 1, ATTN_IDLE);

if (self.flags & FL_ONGROUND)
	droptofloor();

M_Squad_Think();
};

//=================================================================================


void() mini_sham_walk1	  =[      $walk1,	mini_sham_walk2 ] {ai_walk(10);};
void() mini_sham_walk2    =[      $walk2,       mini_sham_walk3 ] {ai_walk(9);};
void() mini_sham_walk3    =[      $walk3,	mini_sham_walk4 ] {ai_walk(7);};
void() mini_sham_walk4    =[      $walk4,	mini_sham_walk5 ] {ai_walk(3);};
void() mini_sham_walk5    =[      $walk5,	mini_sham_walk6 ] {ai_walk(4);};
void() mini_sham_walk6    =[      $walk6,	mini_sham_walk7 ] {ai_walk(10);};
void() mini_sham_walk7    =[      $walk7,	mini_sham_walk8 ] {ai_walk(6);};
void() mini_sham_walk8    =[      $walk8,	mini_sham_walk9 ] {ai_walk(2);};
void() mini_sham_walk9    =[      $walk9,	mini_sham_walk10] {ai_walk(13);};
void() mini_sham_walk10   =[      $walk10,	mini_sham_walk11] {ai_walk(7);};
void() mini_sham_walk11   =[      $walk11,	mini_sham_walk12] {ai_walk(5);};
void() mini_sham_walk12   =[      $walk12,	mini_sham_walk1 ] {ai_walk(5);
if (random() > 0.95)
	sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_idle.wav", 1, ATTN_IDLE);

if (self.flags & FL_ONGROUND)
	droptofloor();

M_Squad_Think();
};


//=================================================================================


void() mini_sham_run1	=[      $run1,        mini_sham_run2      ] {ai_run(20);};
void() mini_sham_run2   =[      $run2,        mini_sham_run3      ] {ai_run(20);};
void() mini_sham_run3   =[      $run3,        mini_sham_run4      ] {ai_run(24);};
void() mini_sham_run4   =[      $run4,        mini_sham_run5      ] {ai_run(20);};
void() mini_sham_run5   =[      $run5,        mini_sham_run6      ] {ai_run(20);};
void() mini_sham_run6   =[      $run6,        mini_sham_run1      ] {ai_run(24);
//if (random() > 0.95) sound (self, CHAN_VOICE, "shambler/sidle.wav", 1, ATTN_IDLE);

if (self.flags & FL_ONGROUND)
	droptofloor();

M_Squad_Think();
};

//=================================================================================

void() mini_sham_follow1   =[      $run1,        mini_sham_follow2      ] {ai_follow_leader(20);};
void() mini_sham_follow2   =[      $run2,        mini_sham_follow3      ] {ai_follow_leader(20);};
void() mini_sham_follow3   =[      $run3,        mini_sham_follow4      ] {ai_follow_leader(24);};
void() mini_sham_follow4   =[      $run4,        mini_sham_follow5    	] {ai_follow_leader(20);};
void() mini_sham_follow5   =[      $run5,        mini_sham_follow6      ] {ai_follow_leader(24);};
void() mini_sham_follow6   =[      $run6,        mini_sham_follow1    	] {ai_follow_leader(20);

if (self.flags & FL_ONGROUND)
	droptofloor();

M_Squad_Think();
};

//=================================================================================

void() mini_sham_swing1 =[      $swingl1,      mini_sham_swing2   ] {
if (random() > 0.7)
  sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_growl.wav", 1, ATTN_NORM);
ai_charge(5);
};
void() mini_sham_swing2 =[      $swingl4,      mini_sham_swing3   ] {ai_charge(3);};
void() mini_sham_swing3 =[      $swingl7,      mini_sham_swing4   ] {ai_charge(5); MiniShamClaw(50);};
void() mini_sham_swing4 =[      $swingr1,      mini_sham_swing5   ] {
if (random() > 0.7)
  sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_growl.wav", 1, ATTN_NORM);
ai_charge(1);
};
void() mini_sham_swing5 =[      $swingr4,      mini_sham_swing6   ] {ai_charge(7);};
void() mini_sham_swing6 =[      $swingr7,      mini_sham_swing7   ] {ai_charge(6); MiniShamClaw(-50);};
void() mini_sham_swing7 =[      $swingr9,      mini_sham_run1     ] {};


//=================================================================================

void() mini_sham_land1       =[      $smash9, 		mini_sham_land2      ] {};
void() mini_sham_land2       =[      $smash10,		mini_sham_land3      ] {};
void() mini_sham_land3       =[      $smash11,		mini_sham_land4      ] {};
void() mini_sham_land4       =[      $smash12,		mini_sham_run1       ] {

	if (!walkmove(0,0))
	{
		self.flags = self.flags - (self.flags & FL_ONGROUND);
		if (Space_Occupied(self))
			M_Teleport_To_Squad_Leader();

	}
};

//=================================================================================

void() mini_sham_flail1       =[      $swingl1, 	mini_sham_flail2      ] {};
void() mini_sham_flail2       =[      $swingl4,		mini_sham_flail3      ] {};
void() mini_sham_flail3       =[      $swingl7,		mini_sham_flail4      ] {};
void() mini_sham_flail4       =[      $swingr1,		mini_sham_flail5      ] {};
void() mini_sham_flail5       =[      $swingl4,		mini_sham_flail6      ] {};
void() mini_sham_flail6       =[      $swingl7,		mini_sham_flail7      ] {};
void() mini_sham_flail7       =[      $swingr9,		mini_sham_flail1      ] {};

//=================================================================================

void() mini_sham_jump1;
void() Mini_Shambler_Reset =
{
	self.touch 	= SUB_Null;
	self.movetype 	= MOVETYPE_STEP;
	self.angles	= '0 0 0';
	self.angles_y 	= vectoyaw (self.squad_leader.origin - self.origin);
	self.angles_y 	= self.angles_y - 180;

	mini_sham_land1();
};

void() Mini_Shambler_Touch =
{
//remove if hit the sky
	if (pointcontents(self.origin) == CONTENT_SKY)
	{
		remove(self);
		return;
	}

  	if (random() > 0.5)
		sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_bump.wav", 1, ATTN_NORM);
	else
		sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_bump2.wav", 1, ATTN_NORM);


//landed safely
	if (checkbottom(self))
	{
		Mini_Shambler_Reset();
	}
//hit a wall
	else
	{
		mini_sham_flail1();
		self.avelocity = '50 50 50';	
	}
	
//deal some damage
	if ((other.takedamage) && (other.classname != "monster_mini_shambler") && (other.classname != "monster_mama_shambler"))
		T_Damage (other, self, self, 2);
};

//=================================================================================
void() mini_sham_scream =
{
	if (random() > 0.5)
	  	sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_scream.wav", 1, ATTN_NORM);
	else
	  	sound (self, CHAN_VOICE, "matboe/matboe_mini_sham_scream2.wav", 1, ATTN_NORM);
};


void() mini_sham_fly1 =[      $smash4,      mini_sham_fly2   ] {};
void() mini_sham_fly2 =[      $smash5,      mini_sham_fly3   ] {};
void() mini_sham_fly3 =[      $smash6,      mini_sham_fly4   ] {
if (vlen (self.enemy.origin - self.origin) > 400)
	mini_sham_scream();
};
void() mini_sham_fly4 =[      $smash7,      mini_sham_fly4   ] {};

//=================================================================================

void() mini_sham_jump_down;
void() mini_sham_jump1   =[      $smash1,        mini_sham_jump2	] {ai_face();};
void() mini_sham_jump2   =[      $smash2,        mini_sham_jump3	] {ai_charge(24);};
void() mini_sham_jump3   =[      $smash3,        mini_sham_jump4	] {ai_charge(24);};
void() mini_sham_jump4   =[      $smash4,        mini_sham_jump5	] {ai_charge(20);};
void() mini_sham_jump5   =[      $smash5,        mini_sham_jump6	] {ai_charge(24);};
void() mini_sham_jump6   =[      $smash6,        mini_sham_jump7    	] {ai_charge(20);};
void() mini_sham_jump7   =[      $smash7,        mini_sham_jump8	] {mini_sham_jump_down();};
void() mini_sham_jump8   =[      $smash8,        mini_sham_jump9	] {};
void() mini_sham_jump9   =[      $smash9,        mini_sham_jump10	] {};
void() mini_sham_jump10  =[      $smash10,       mini_sham_jump11    	] {};
void() mini_sham_jump11  =[      $smash11,       mini_sham_jump12	] {};
void() mini_sham_jump12  =[      $smash12,       mini_sham_run1    	] {};

void() mini_sham_jump_touch =
{
	local float ldmg;


	if (self.health <= 0)
		return;
		
	if ((other.takedamage) 
	  && (other.classname != "monster_mini_shambler") 
	  && (other.classname != "monster_mama_shambler"))
	{
		if ( vlen(self.velocity) > 400 )
		{
			ldmg = 5 + 2*random();
			T_Damage (other, self, self, ldmg);	
		}
	}

	if (!checkbottom(self))
	{
		if (self.flags & FL_ONGROUND)
		{	// jump randomly to not get hung up

			self.touch = SUB_Null;
			self.think = mini_sham_jump5;
			self.nextthink = time + 0.1;
		}
		return;	// not on ground yet
	}

	self.angles_x = 0;
	self.touch = SUB_Null;
	mini_sham_jump8();
	
};

void() mini_sham_jump_down = 
{
  	local   float   g;      // Gravity -- g = 1 is Earth gravity.
        local   float   dist;   // Distance between attacker and target.
        local   float   base;   // This dictates how fast the projectile
                                //   will fly up when it is launched.



        g = (cvar("sv_gravity")) * 0.00125;   // Find gravity in terms of g. 
					      // 800 is normal (Earth) gravity.  800 * 0.00125 = 1

	ai_face();
	
	self.touch = mini_sham_jump_touch;

	makevectors (self.angles);

	setorigin (self, self.origin + v_forward*20 + v_up*20);



        self.velocity = normalize (self.enemy.origin - self.origin);
        self.velocity = self.velocity * 600;

        dist = vlen(self.enemy.origin - self.origin);

        if (dist > 200)
                base = 200+((dist - (200 - (dist * 0.15)))*0.5);
        else if (dist > 100)
                base = dist;
        else
                base = 100;

        self.velocity_z = (self.velocity_z + (base * g) + 1);

	if (self.flags & FL_ONGROUND)
		self.flags = self.flags - FL_ONGROUND;

	mini_sham_scream();


	self.angles = vectoangles (self.velocity);
	self.fly_time = time + 3; //monster wont jump again until time has expired
	self.nextthink = time + 3;
	self.think = mini_sham_jump8;
};

void() mini_sham_jump =
{
	local float dist;

	if (M_CheckMonsterJumpDown() == TRUE)
	{
		dist = vlen (self.enemy.origin - self.origin);
		if (dist > 300)
		{
			if (random() > 0.9)
				mini_sham_jump1();
		}
		else 
		{
			if (random() > 0.2)
				mini_sham_jump1();
		}
	}
};

//=================================================================================
void() monster_mini_shambler =
{
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	self.classname 	= "monster_mini_shambler";
	self.health 	= 15;

	self.min_dist_from_leader = 100;
	self.max_dist_from_leader = 200;

	self.th_stand 	= sham_stand1;
	self.th_walk 	= mini_sham_walk1;
	self.th_run 	= mini_sham_run1;
	self.th_follow 	= mini_sham_follow1;
	self.th_die 	= Mini_Shambler_Death;
	self.th_melee 	= mini_sham_swing1;
	self.th_missile = mini_sham_jump;
	self.th_pain 	= sham_pain;

	setmodel (self, "progs/matboe_mini_shambler.mdl");
	setsize (self, '-8 -8 -6', '8 8 16');
	walkmonster_start();

	self.flags = self.flags | FL_SQUAD;
};

