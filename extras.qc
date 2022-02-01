/*______________________________________________________________________________________
========================================================================================

                                                  
  ▀███▀▀▀███            ██                          
    ██    ▀█            ██                          
    ██   █  ▀██▀   ▀██▀█████▀███▄███ ▄█▀██▄  ▄██▀███
    ██████    ▀██ ▄█▀   ██    ██▀ ▀▀██   ██  ██   ▀▀
    ██   █  ▄   ███     ██    █▓     ▄███▓█  ▀█████▄
    █▓     ▄█   ▓▓██    █▓    █▓    █▓   ▓█       ██
    ▓▓   ▓  ▓   ▓▓█     ▓▓    ▓▓     ▓▓▓▓▒▓  ▀▓   █▓
    ▓▓     ▓▓ ▓▓▀ ▓▓▓   ▓▓    ▓▒    ▓▓   ▒▓  ▓▓   ▓▓
  ▒ ▒▒▒▓▒ ▒ ▒▒▒    ▒▓▒  ▒▒▒ ▒ ▒▒▒   ▒▓▒ ▒ ▓▒ ▒ ▒▓▒  
                                                  
                                                  

				    matboe - mod_jam_2022                                                                                                                                                                                                                                                                      
________________________________________________________________________________________
======================================================================================*/



/*============================================================
 SUB_Think
============================================================*/
void(entity ent, void() thinkst) SUB_Think =
{
    local   entity  swap;

    swap = self;
    self = ent;
    thinkst ();
    self = swap;
};


/*========================================================
 PM_GrenadeFly

 this returns the z-velocity added to a monster's grenade based on
 the distance between attacker and target and on gravity.
 code by Patrick Martin
===========================================================*/

float(float dist) PM_GrenadeFly =
{
        local   float   g;      // Gravity -- g = 1 is Earth gravity.
        local   float   base;   // This dictates how fast the projectile
                                //   will fly up when it is launched.

	//  800 is normal (Earth) gravity.  800 * 0.00125 = 1
        g = (cvar("sv_gravity")) * 0.00125;   // Find gravity in terms of g.

        if (dist > 900)       base = 200+((dist - (200 - (dist * 0.2)))*0.5);
        else if (dist > 700)  base = 200+((dist - (200 - (dist * 0.15)))*0.5);
        else if (dist > 500)  base = 200+((dist - (200 - (dist * 0.1)))*0.5);
        else if (dist > 300)  base = 200+((dist - 200)*0.5);
        else if (dist > 200)  base = 200;
        else if (dist > 100)  base = dist;
        else                  base = 100;

        return (base * g);
};

/*==========================================
 PM_TraceCheck

 checks for obstacles such as solid entities or walls inside
 the bbox and along its borders.  if an obstacle is met, FALSE is
 returned. 
 code by Patrick Martin
==========================================*/
float(entity head, vector spot) PM_TraceCheck =
{
        local   vector  p1, p2;

	// Check for obstacles inside the bbox
        p1 = spot + head.mins;
        p2 = spot + head.maxs;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1_x = spot_x + head.maxs_x;
        p2_x = spot_x + head.mins_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1_y = spot_y + head.maxs_y;
        p2_y = spot_y + head.mins_y;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1_x = spot_x + head.mins_x;
        p2_x = spot_x + head.maxs_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

	// Check for obstacles along the bbox boundaries
        p1 = p2 = spot + head.maxs;
        p2_z = spot_z + head.mins_z;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1_x = p2_x = spot_x + head.mins_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1_y = p2_y = spot_y + head.mins_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1_x = p2_x = spot_x + head.maxs_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2 = spot + head.mins;
        p2_x = spot_x + head.maxs_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2;
        p2_y = spot_y + head.maxs_y;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2;
        p2_x = spot_x + head.mins_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2;
        p2_y = spot_y + head.mins_y;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2 = spot + head.maxs;
        p2_x = spot_x + head.mins_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2;
        p2_y = spot_y + head.mins_y;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2;
        p2_x = spot_x + head.maxs_x;
        traceline (p1, p2, FALSE, head);
        if (trace_fraction < 1)  return FALSE;

        p1 = p2;
        p2_y = spot_y + head.maxs_y;
        traceline (p1, p2, FALSE, head);
        return (trace_fraction == 1);
};

/*========================================
 PM_InWall

 this checks if a bbox is inside a wall or sky.  the bbox's origin
 and corners are checked.  If any one points is within a solid or sky,
 TRUE is returned. code by Patrick Martin
=========================================*/
float(entity head, vector spot) PM_InWall =
{
        local   vector  p;

	// Check origin
        p = spot;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

	// Check bbox faces
        p_x = spot_x + head.mins_x;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.maxs_x;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p = spot;
        p_y = spot_y + head.mins_y;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_y = spot_y + head.maxs_y;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p = spot;
        p_z = spot_z + head.mins_z;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_z = spot_z + head.maxs_z;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

	// Check bbox corners
        p_x = spot_x + head.maxs_x;
        p_y = spot_y + head.maxs_y;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.mins_x;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.maxs_x;
        p_y = spot_y + head.mins_y;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.mins_x;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.maxs_x;
        p_y = spot_y + head.maxs_y;
        p_z = spot_z + head.mins_z;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.mins_x;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.maxs_x;
        p_y = spot_y + head.mins_y;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        if (pointcontents(p) == CONTENT_SKY)    return TRUE;

        p_x = spot_x + head.mins_x;
        if (pointcontents(p) == CONTENT_SOLID)  return TRUE;
        return (pointcontents(p) == CONTENT_SKY);
};

/*========================================
 Space_Occupied

 checks if the spot is empty or occupied by a solid
========================================*/
float(entity head) Space_Occupied =
{
	// If a wall or other solid is in the way, the monster can't respawn here.
        if (PM_InWall(head, head.origin))  return TRUE;

	// Check if other obstacles such as entities are occupying the space.
        return !PM_TraceCheck(head, head.origin);
};


/*========================
 M_Find_Space_Around_Ent

 find free space MAX_DIST radius around ent
========================*/
vector(entity ent, float MIN_DIST, float MAX_DIST) M_Find_Space_Around_Ent =
{
	local 	vector 	tempvec, ANGLE;
	local 	float 	forward, ang;
	local 	entity 	center, ent, marker;


	center = spawn();
	setorigin (center, ent.origin);		
	center.angles_y = 360*random();		//start with a random y_angle

	forward = MIN_DIST;

	while (forward < MAX_DIST)
	{
		while (ang < 360)
		{
			//trace out
			makevectors (center.angles);
			traceline (center.origin, center.origin + v_forward * forward, TRUE, ent);

			tempvec = trace_endpos;
			
			//trace down to ground
			traceline (tempvec, tempvec - v_up * 9999999, TRUE, ent);

			tempvec = trace_endpos;
			tempvec_z = tempvec_z + (ent.maxs_z);

			if ( ((ent.origin_z - trace_endpos_z) < 50) && (ent.origin_z - trace_endpos_z > 5) )
			{
				if (!trace_ent.health)	//don't find a vector on top of a monster/player
				{
					tempvec_z = tempvec_z - 35;
					marker = spawn();
					//setsize (marker, ent.mins-'1 1 1', ent.maxs+'1 1 1');
					setsize (marker, VEC_HULL_MIN, VEC_HULL_MAX);
					setorigin (marker, tempvec);
					//setmodel (marker, "progs/h_mega.mdl");
					if ((Space_Occupied (marker))
					  || (pointcontents (tempvec) != CONTENT_EMPTY))
					  remove (marker);
					else					
					{
						remove (marker);
						remove (center);
						return tempvec;
					}
				}
			}

			ANGLE = ANGLE + '0 40 0';
			ang = ang + 40;
			center.angles = ANGLE;
		}
		forward = forward + 128;
		ang = 0;
	}
	remove (center);

	return '0 0 0';
};


/*====================
 M_Teleport_To_Squad_Leader

 follower teleports to its squad_leader
====================*/
void() M_Teleport_To_Squad_Leader =
{
	local entity temp;
	local vector v;


	if (self.squad_teleport_wait_time > time)
		return;

	if (!self.squad_leader)
		return;

	self.squad_teleport_wait_time = time + 3;	

	v = M_Find_Space_Around_Ent (self.squad_leader, 100, 300);

	if (!v)
		return;

	v = v + '0 0 4'; //slightly off the ground

//spawn a temporary ent the same size as the teleporting monster at the destination
	temp = spawn();
	setsize (temp, self.mins, self.maxs);
	setorigin (temp, v);

//check if the temp ent fits 
	if (Space_Occupied(temp))
	{
		remove(temp);	
		return;
	}	

//teleport successful
	self.enemy = world;
	droptofloor();
	spawn_tfog (self.origin);
	spawn_tfog (v);
	setorigin (self, v);
	self.th_run();

	remove(temp);	
};


/*================
 M_Squad_Think 

  main squad think routine
================*/
void() M_Squad_Think =
{	
	local float delta;


	if (!(self.flags & FL_SQUAD))
		return;

	if (!(self.squad_leader))
		return;

	if (self.squad_think_tick > time)
		return;

	self.squad_think_tick = time + 1;

//teleport to leader if stuck
	if (!walkmove(0,0))
	{
		M_Teleport_To_Squad_Leader();
		return;
	}

//squad_leader is dead
	if (self.squad_leader.health < 1)
	{
		self.squad_leader = world;
		self.flags = self.flags - (self.flags & FL_SQUAD);
		return;
	}

//already fighting? ignore leader
	//if (FindTarget())
	//	return;

//check distance from squad_leader
	delta = vlen(self.squad_leader.origin - self.origin);


//reset squad_lost_leader_time
	if ( (delta < self.max_dist_from_leader) && (visible(self.squad_leader)) )
	{
		self.squad_lost_leader_time = time + 20;	
		self.th_walk();
	}

//lost... teleport
	if ((self.squad_teleport_wait_time < time) && (self.squad_lost_leader_time < time) && (!visible(self.squad_leader)) )
	{
		M_Teleport_To_Squad_Leader();
		return;
	}

//squad notifies leader of nearby enemy
	if ((!self.squad_leader.enemy)
	  && (self.enemy)
	  && (self.enemy.health > 0)
	  && (self.enemy != world))
	{
		self.squad_leader.enemy = self.enemy;
		self.squad_leader.goalentity = self.enemy;
	}

//walk if close to squad_leader and not fighting
	if (delta < self.min_dist_from_leader)
	{
		self.goalentity = self.movetarget = self.enemy = self.squad_leader.goalentity;		
		self.th_run();
		return;
	}

//too far away, run back to squad_leader
	if (delta > self.max_dist_from_leader)
	{
		self.goalentity = self.movetarget = self.enemy = self.squad_leader;
		self.th_follow();
		return;
	}
};


/*=====================
 M_Spawn_Squad

 ent spawns a new monster nearby its origin
=====================*/
void(void() monster_to_spawn) M_Spawn_Squad =
{
	local 	entity 	squad;
	local 	vector	org;


	if (self.count_spawned >= self.max_squads)
		return;

//find space
	org = M_Find_Space_Around_Ent (self, 128, 500);		

	if ((org == '0 0 0') || (!org))
		return;		

//load squad
	squad = spawn();
	squad.squad_leader = self;
	setorigin (squad, org);
	SUB_Think (squad, monster_to_spawn);

	squad.owner = self;

//remove if squad is stuck in brush or ent, or not visible to squad_leader
	if ( (Space_Occupied (squad)) || (!visible(squad)) || (!walkmove(0,0)) )
	{	
		remove(squad);
		return;
	}

	spawn_tfog(squad.origin);

	SUB_Think (squad, walkmonster_start);

	self.count_spawned = self.count_spawned + 1;
	if (!checkbottom(squad))
		SUB_Think (squad, droptofloor);
};	


/*==================================================================================
  ai_roam

- added to ai_walk so that a monster can walk around deathmatch maps 
  without headbutting the walls like a tard.
- monsters find items, player start porints or path_corner and sets it as goalentity
- goal_timeout resets if monster is closer to goalentity than the previous timer reset 
- if monster reaches his goal or his timer runs out he finds another goal
- monster chains goalentity through 5 saved slots and will not revisit any entity in the
  chain unless he can't find any more and his timer has run out  */


//path_roam spawn function
void() path_roam =
{
};


/*===================
 M_Chain_Goal_Ents
===================*/
void() M_Chain_Goal_Ents =
{
	//bprint ("M_Chain_Goal_Ents\n");
	self.last_goal5 = self.last_goal4;
	self.last_goal4 = self.last_goal3;
	self.last_goal3 = self.last_goal2;
	self.last_goal2 = self.last_goal1;
	self.last_goal1 = self.goalentity;
};

/*===================
 M_Reset_Goal_Entity
===================*/
void() M_Reset_Goal_Entity = 
{
	//bprint ("M_Reset_Goal_Entity\n");
	self.last_goal5 = world;
	self.last_goal4 = world;
	self.last_goal3 = world;
	self.last_goal2 = world;
	self.last_goal1 = world;
};

void(float dist) ai_roam =
{
	local entity		e;
	local float 		dist, len;

 	if (self.enemy.health <= 0)
		self.enemy = world;

	if (FindTarget())
	{
		if (self.enemy.health > 0)
		{
			self.th_run();
			return;
		}
	}

	movedist = dist;

//reached goal
	if (vlen(self.goalentity.origin - self.origin) < 100)
	{
		//bprint(" >>> ai_walk() goal reached!\n");	
		M_Chain_Goal_Ents();
		self.goalentity = world;
	}

//keep heading for goal or change goals?
	len = vlen(self.goalentity.origin - self.origin);
 	if (self.goal_timeout < time)
	{
		if (len < (self.old_dist - 50))
		{
			//bprint(" >>> ai_walk() goal_timeout = reset timer\n"); bprint(ftos(len)); bprint(" >> "); bprint(ftos(self.old_dist)); bprint ("\n");		
			self.old_dist = len;	//measure len against old_dist, see if progress is made towards goalentity (ie, dist is less) 
			self.goal_timeout = time + 5;	//give monster 5 seconds longer to move toward goalentity
		}
		else
		{
			//bprint(" >>> ai_walk() goal_timeout = find new goalentity\n"); bprint(ftos(len)); bprint(" >> "); bprint(ftos(self.old_dist));
			M_Chain_Goal_Ents();
			self.goalentity = world;
		}
	}

//find a new goal
	e = nextent (self.goalentity);
	while (e != world)
	{
		if ((e.classname == "path_corner") 
		  || (e.flags & FL_ITEM)
		  || (e.classname == "info_player_start")
		  || (e.classname == "info_player_deathmatch")
		  || (e.classname == "path_roam"))
		{
			if (visible(e))
			{
				local float dist_z; 
				dist_z = e.origin_z - self.origin_z;
				if (dist_z < 100)
				{
					if ((self.last_goal1 != e) 
					  && (self.last_goal2 != e) 
					  && (self.last_goal3 != e) 
					  && (self.last_goal4 != e) 
					  && (self.last_goal5 != e)
					  && (!self.goalentity))
					{
						if ((e.origin_z < self.origin_z + self.height) || (e.origin_z > self.origin_z + self.height))
						{
							len = vlen (e.origin - self.origin);	
							if ((len > 400) && (len < 5000))
							{
								M_Chain_Goal_Ents();			
								self.goalentity = self.movetarget = e; 
								self.goal_timeout = time + 20;
								self.old_dist = len;
								//setmodel (self.goalentity, "progs/h_player.mdl");							
								//bprint(" >>> ai_roam() goalentity = "); bprint (self.goalentity.classname); bprint ("\n");
							}	
						}
					}
				}
			}
		}
		e = nextent(e);
	}

	if ((!e) && (self.goal_timeout < time))
		M_Reset_Goal_Entity();

	movetogoal (dist);
};


/*=============
ai_follow_leader

Monsters follow their .squad_leader
=============*/
void(float dist) ai_follow_leader =
{
	local float delta;

//no squad leader or squad leader is dead
	if ( (!self.squad_leader) || (self.squad_leader.health < 1) )
	{
		self.th_run();
		return;
	}
	
//check for noticing a player
	if (FindTarget ())
		return;

//check min distance from squad_leader
	delta = (vlen(self.squad_leader.origin - self.origin));
	if (delta < self.min_dist_from_leader)
	{	
		self.squad_think_tick = time;
		M_Squad_Think();
		return;
	}	
	
//set goalentity and move
	self.goalentity = self.movetarget = self.enemy = self.squad_leader;
	
	movedist = dist;
	movetogoal (dist);
};

/*============================
 M_Find_Spawnpoint
============================*/
entity() M_Find_Spawnpoint =
{
	local entity	spawn_point, spot;
	local float 	i, num, Count_Spawn_Points;
	

//count all spawn points
	spawn_point = find (world, classname, "info_player_start");
	while (spawn_point)
	{
		Count_Spawn_Points = Count_Spawn_Points + 1;
		spawn_point.netname = "m_spawn_point";
		spawn_point = find (spawn_point, classname, "info_player_start");
	}

	spawn_point = find (world, classname, "info_player_coop");
	while (spawn_point)
	{
		Count_Spawn_Points = Count_Spawn_Points + 1;
		spawn_point.netname = "m_spawn_point";
		spawn_point = find (spawn_point, classname, "info_player_coop");
	}

	spawn_point = find (world, classname, "info_player_deathmatch");
	while (spawn_point)
	{
		Count_Spawn_Points = Count_Spawn_Points + 1;
		spawn_point.netname = "m_spawn_point";
		spawn_point = find (spawn_point, classname, "info_player_deathmatch");
	}

	i = random() * Count_Spawn_Points;
	i = ceil(i);
	num = 1;

//pick a random spawn point
	//bprint (ftos (i)); bprint (" of "); bprint (ftos(Count_Spawn_Points)); bprint ("\n");
	spot = find (world, netname, "m_spawn_point");
	while (num < i)
	{
		num = num + 1;
		spot = find (spot, netname, "m_spawn_point");
	}

	//bprint ("found spot at ");	bprint (vtos(spot.origin));	bprint ("\n");
	return spot;
};

/*========================
 M_Spawn_Mama_Shambler
========================*/
void() M_Spawn_Mama_Shambler =
{
	local entity sham, spot;

	if (spawned_mama_shambler == TRUE)
		return;

	spawned_mama_shambler = TRUE;

	sham = spawn();
	spot = M_Find_Spawnpoint();
	setorigin (sham, spot.origin);

	SUB_Think(sham, monster_mama_shambler);
};

/*========================
 M_Level_Exit

 Change to next map or load another Mama Shambler
========================*/
void() M_Level_Exit =
{
	local	entity	tc;

	return;
	if ( (cvar("noexit") == 1) || ((cvar("noexit") == 2)) )
	{
		if (M_is_DM_map == TRUE)
		{
			spawned_mama_shambler = FALSE;
			M_Spawn_Mama_Shambler();
		}
		return;
	}

	tc = find (world, classname, "trigger_changelevel");	
	nextmap = tc.map;

	SUB_UseTargets ();
	
	// we can't move people right now, because touch functions are called
	// in the middle of C movement code, so set a think time to do it
	execute_changelevel();
};

/*==============
 M_Determine_DM_Map

 find monsters to determine if its a deathmatch map.
 used to determine if the map should exit when Mama Shambler dies.
 also to allow respawning items in deathmatch maps (even tho deathmatch = 0)
==============*/
float()  M_Determine_DM_Map =
{
	local	entity	mon;

	mon = nextent(world);
	while (mon)
	{
		if ((mon.flags & FL_MONSTER) 
		  && (mon.classname != "monster_mama_shambler")
		  && (mon.classname != "monster_mini_shambler"))
			return FALSE;	
		mon = nextent(mon);
	}	

	return TRUE;
};

/*============
 M_CheckMOTD

 stright outta the tut
===========*/
void() M_CheckMOTD =
{
    if ((self.motd_count < 1) && (self.motd_time < time)) // 6 == seconds MOTD will display
    {
        self.motd_time = time + 1;
        self.motd_count = self.motd_count + 1;
        sprint(self, "\bMOD JAM 2022 (AI)\n\bMama Shambler - by matboe\n\n\n"); //Type in you're message here "\n" = new line
        return;
    }
};

/*
=============
M_infront

same as iD's infront() but with 2 targets instead of target and self.
returns 1 if targ1 is in front (in sight) of targ2.

=============
*/
float(entity targ1, entity targ2) M_infront =
{
	local vector	vec;
	local float		dot;
	
	makevectors (self.angles);
	vec = normalize (targ1.origin - targ2.origin);
	dot = vec * v_forward;
	
	if ( dot > 0.3)
	{
		return TRUE;
	}
	return FALSE;
};


/*
==============
M_CheckMonsterJumpDown

A monster will jump down to an enemy.
==============
*/
float() M_CheckMonsterJumpDown =
{
	local float dist, hgt;


	if (!(self.enemy))
		return FALSE;
	if (!(self.flags & FL_ONGROUND))
		return FALSE;
	if (!(self.enemy.flags & FL_ONGROUND))
		return FALSE;
	if (self.fly_time > time)
		return;

//	if (M_infront(self, self.enemy) == FALSE)
//		return;		//only jump down if player is looking, dont jump on player from behind


        if (pointcontents(self.enemy.origin) == CONTENT_WATER)  return FALSE;
        if (pointcontents(self.enemy.origin) == CONTENT_SLIME)  return FALSE;
        if (pointcontents(self.enemy.origin) == CONTENT_LAVA)   return FALSE;

	//don't jump if enemy is in water
	if (self.enemy.waterlevel)
		return FALSE;

	dist = vlen(self.origin - self.enemy.origin);
	hgt = self.origin_z - self.enemy.origin_z;

	//too far to jump
	if (dist > 600)
		return FALSE;

	//only jump down (or up to 100 units up)
	if (trace_endpos_z + 100 > self.origin_z)
		return FALSE;


	//if its a long jump (400 units) then jump if enemy is further down than across
	if (dist > 400)
		if (dist > (hgt*1.5))
			return FALSE;

	return TRUE;
};