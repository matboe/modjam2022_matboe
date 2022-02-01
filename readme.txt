
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
                                                                                                                                 
                                                                                                                                 

===========================================================================
Title                   : Mama Shambler
Filename                : modjam_matboe
Release date            : 10/02/2022 (For Mod Jam 2022)
Author                  : Matt 'matboe' Edney
Email Address           : matboe@yandex.com
Other Files By Author   : Boss Faction (wip)
Misc. Author Info       : https://www.youtube.com/channel/UCzx6ZLaId77j_9e8EtrLJFg (Boss Faction demos)

Description             : Here is my submission for this year's Modding Jam. I took the opportunity to give people a sample
			  of what I've already accomplished for my upcoming mod, "Boss Faction". It is compatible with
			  any map that can be played on vanilla quake/id1. 
			  A Mama Shambler will spawn on a random player spawn point and roam between items and path_corners.
			  She will spawn many minions into the empty space around her, they will follow her around until sighting 
			  a player.  If any minions stray too far they will teleport back to their mama.  Mama Shamblers health and
			  max number of minions depends on the 'skill' setting.
			  Mama Shambler will throw her minions at the player.  Minions will jump down to land on a player.
			  The mod can tell if the map is a single player or a deathmatch map (by counting the number of monsters) 
			  and will respawn weapons and give Mama Shambler 3x health on DM maps.
			  I honestly believe that to some degree the AI concepts presented here are original and hope that other
			  modders make use of them the betterment of the Quake community.
			  
What's new              :
			* ai_roam - a monster will search for any visible nearby item or path_corner that is a similar height to 
			  his own and navigates to it until his timer runs out.  If the monsters is getting closer to his goal his
			  timer is reset.  When a monster reaches his goal he stores that point in a list and wont revist it again
			  until he has visited 4 other points. If the monster is lost and can't find any more goals his list is reset
			  and he start again.
			  
			* ai_follow - a monster will navigate to and follow his leader.  When he reaches his 'minimum distance' 
			  from his leader he will roam.  When he reaches his 'maximum distance' he will follow again.  If a monster
			  sights a player he will run towards and attack the player, and notify his leader to attack if not already
			  engaged.

			* monster_jump_down - a different jump routine.  If the distance to jump is not too great a monster will jump 
			  across a gap to land on a player, or he will jump down land on a player from above, he will never jump up
			  or into a liquid.

			* find_space - A monster will spawn minions into the empty space around it. 


Additional Credits to   : *fw, for the Chibi Shambler model
			  *Grue for the epic custom map
			  *Patrick Martin who's object collision code I have been borrowing for years
			  *The people on the Quake Mapping discord server for their support and crucial feedback
			  *You, for playing my mod! Enjoy it!

Original assets belong to iD Software

===========================================================================
* What is included *

New levels              : No
Sounds                  : Yes
Music                   : No
Graphics                : Yes, mini shambler by pw, and a throw animation for the shambler done poorly by me.
Other                   : Yes! new ai! Roaming and following monsters. Monsters that spawn other monsters
Other files required    : No


* Play Information *

Singleplayer tested, but potentionally works on co-op and deathmatch games.


* Construction *

Base                    : Mod Jam 2022 supplied the progs
Tested With             : Quakespasm 
Known Bugs              : Sometimes the mini shamblers spawn stuck in the walls, but they correct themselves eventually.
To do			: Fix mentionned bugs



* Copyright / Permissions *

Authors (MAY/may NOT) use the contents of this file as a base for
modification or reuse.  Permissions have been obtained from original 
authors for any of their resources modified or included in this file.

You MAY distribute this file, provided you include this text file, with
no modifications.  You may distribute this file in any electronic
format (BBS, Diskette, CD, etc) as long as you include this file 
intact.  I have received permission from the original authors of any
modified or included content in this file to allow further distribution.
