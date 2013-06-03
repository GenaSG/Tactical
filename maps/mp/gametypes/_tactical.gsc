#include common_scripts\utility;
init()
{
	precacheShellShock( "frag_grenade_mp" );
	precacheRumble( "artillery_rumble" );
        level thread onPlayerConnect();
	level thread loadWeaponSounds();
	maps\mp\gametypes\_defaults::init();
}
loadWeaponSounds()
{
	level.ShotSound=[];
	level.weapon=[];
	
	level.weapon[ "m16_acog_mp" ]["ShotSound"] = "weap_m16_fire_npc";
	level.weapon[ "m16_gl_mp" ]["ShotSound"] = "weap_m16_fire_npc";
	level.weapon[ "m16_mp" ]["ShotSound"] = "weap_m16_fire_npc";
	level.weapon[ "m16_reflex_mp" ]["ShotSound"] = "weap_m16_fire_npc";
	level.weapon[ "m16_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";

	level.weapon[ "ak47_acog_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_gl_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_reflex_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";

	level.weapon[ "m4_acog_mp" ]["ShotSound"] = "weap_m4carbine_fire_plr";
	level.weapon[ "m4_gl_mp" ]["ShotSound"] = "weap_m4carbine_fire_plr";
	level.weapon[ "m4_mp" ]["ShotSound"] = "weap_m4carbine_fire_plr";
	level.weapon[ "m4_reflex_mp" ]["ShotSound"] = "weap_m4carbine_fire_plr";
	level.weapon[ "m4_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";

	level.weapon[ "g3_acog_mp" ]["ShotSound"] = "weap_g3_fire_plr";
	level.weapon[ "g3_gl_mp" ]["ShotSound"] = "weap_g3_fire_plr";
	level.weapon[ "g3_mp" ]["ShotSound"] = "weap_g3_fire_plr";
	level.weapon[ "g3_reflex_mp" ]["ShotSound"] = "weap_g3_fire_plr";
	level.weapon[ "g3_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";

	level.weapon[ "g36c_acog_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_gl_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_reflex_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";

	level.weapon[ "m14_acog_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_gl_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_reflex_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";

	level.weapon[ "mp44_mp" ]["ShotSound"] = "weap_mp44_fire_npc";


	// Special Ops class weapons
	level.weapon[ "mp5_acog_mp" ]["ShotSound"] = "weap_mp5_fire_npc";
	level.weapon[ "mp5_mp" ]["ShotSound"] = "weap_mp5_fire_npc";
	level.weapon[ "mp5_reflex_mp" ]["ShotSound"] = "weap_mp5_fire_npc";
	level.weapon[ "mp5_silencer_mp" ]["ShotSound"] = "weap_mp5sd_fire_npc";

	level.weapon[ "skorpion_acog_mp" ]["ShotSound"] = "weap_skorpion_fire_plr";
	level.weapon[ "skorpion_mp" ]["ShotSound"] = "weap_skorpion_fire_plr";
	level.weapon[ "skorpion_reflex_mp" ]["ShotSound"] = "weap_skorpion_fire_plr";
	level.weapon[ "skorpion_silencer_mp" ]["ShotSound"] = "weap_skorpionsd_fire_npc";

	level.weapon[ "uzi_acog_mp" ]["ShotSound"] = "weap_miniuzi_fire_npc";
	level.weapon[ "uzi_mp" ]["ShotSound"] = "weap_miniuzi_fire_npc";
	level.weapon[ "uzi_reflex_mp" ]["ShotSound"] = "weap_miniuzi_fire_npc";
	level.weapon[ "uzi_silencer_mp" ]["ShotSound"] = "weap_miniuzisd_fire_npc";

	level.weapon[ "ak74u_acog_mp" ]["ShotSound"] = "weap_ak74_fire_npc";
	level.weapon[ "ak74u_mp" ]["ShotSound"] = "weap_ak74_fire_npc";
	level.weapon[ "ak74u_reflex_mp" ]["ShotSound"] = "weap_ak74_fire_npc";
	level.weapon[ "ak74u_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";

	level.weapon[ "p90_acog_mp" ]["ShotSound"] = "weap_fnp90_fire_npc";
	level.weapon[ "p90_mp" ]["ShotSound"] = "weap_fnp90_fire_npc";
	level.weapon[ "p90_reflex_mp" ]["ShotSound"] = "weap_fnp90_fire_npc";
	level.weapon[ "p90_silencer_mp" ]["ShotSound"] = "weap_fnp90silenced_fire_npc";


	// Demolition class weapons
	level.weapon[ "m1014_grip_mp" ]["ShotSound"] = "weap_m1014_fire_npc";
	level.weapon[ "m1014_mp" ]["ShotSound"] = "weap_m1014_fire_npc";
	level.weapon[ "m1014_reflex_mp" ]["ShotSound"] = "weap_m1014_fire_npc";

	level.weapon[ "winchester1200_grip_mp" ]["ShotSound"] = "weap_winch1200_fire_npc";
	level.weapon[ "winchester1200_mp" ]["ShotSound"] = "weap_winch1200_fire_npc";
	level.weapon[ "winchester1200_reflex_mp" ]["ShotSound"] = "weap_winch1200_fire_npc";


	// Heavy gunner class weapons
	level.weapon[ "saw_acog_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "saw_grip_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "saw_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "saw_reflex_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";

	level.weapon[ "rpd_acog_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";
	level.weapon[ "rpd_grip_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";
	level.weapon[ "rpd_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";
	level.weapon[ "rpd_reflex_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";

	level.weapon[ "m60e4_acog_mp" ]["ShotSound"] = "weap_m60_fire_npc";
	level.weapon[ "m60e4_grip_mp" ]["ShotSound"] = "weap_m60_fire_npc";
	level.weapon[ "m60e4_mp" ]["ShotSound"] = "weap_m60_fire_npc";
	level.weapon[ "m60e4_reflex_mp" ]["ShotSound"] = "weap_m60_fire_npc";


	// Sniper class weapons
	level.weapon[ "dragunov_acog_mp" ]["ShotSound"] = "weap_dragunovsniper_fire_npc";
	level.weapon[ "dragunov_mp" ]["ShotSound"] ="weap_dragunovsniper_fire_npc";

	level.weapon[ "m40a3_acog_mp" ]["ShotSound"] = "weap_m40a3sniper_fire_npc";
	level.weapon[ "m40a3_mp" ]["ShotSound"] = "weap_m40a3sniper_fire_npc";

	level.weapon[ "barrett_acog_mp" ]["ShotSound"] = "weap_barrett_fire_npc";
	level.weapon[ "barrett_mp" ]["ShotSound"] = "weap_barrett_fire_npc";

	level.weapon[ "remington700_acog_mp" ]["ShotSound"] = "weap_rem700sniper_fire_npc";
	level.weapon[ "remington700_mp" ]["ShotSound"] = "weap_rem700sniper_fire_npc";

	level.weapon[ "m21_acog_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m21_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";


	// Handguns
	level.weapon[ "beretta_mp" ]["ShotSound"] = "weap_m9_fire_npc";
	level.weapon[ "beretta_silencer_mp" ]["ShotSound"] = "weap_usp45sd_fire_npc";

	level.weapon[ "colt45_mp" ]["ShotSound"] = "weap_m1911colt45_fire_npc";
	level.weapon[ "colt45_silencer_mp" ]["ShotSound"] = "weap_usp45sd_fire_npc";

	level.weapon[ "usp_mp" ]["ShotSound"] = "weap_usp45_fire_npc";
	level.weapon[ "usp_silencer_mp" ]["ShotSound"] = "weap_usp45sd_fire_npc";

	level.weapon[ "deserteagle_mp" ]["ShotSound"] = "weap_deserteagle_fire_npc";
	level.weapon[ "deserteaglegold_mp" ]["ShotSound"] = "weap_deserteagle_fire_npc";
	

	return;
}


onPlayerConnect()
{
        for(;;)
        {
                level waittill("connecting", player);
                player thread onPlayerSpawned();
        }
}


onPlayerSpawned()
{
        self endon("disconnect");

        for(;;)
        {
                self waittill("spawned_player");
		self thread GunWatcher();
		self thread SuppressionController();
		self thread moveSpeed();
		self thread GunShotPlayer();
        }
}
GunShotPlayer()
{
	while(isAlive(self))
	{
		self waittill("weapon_fired");
		//SoundOrigin = self getPlayerEyes();
		TheGun = self GetCurrentWeapon();
		for(i=0;i<=level.players.size;i++)
		{
			if(isDefined(level.players[i]) && isDefined(TheGun))
			{
				self thread PlayGunShot(level.players[i],TheGun);		
		}	}
	}
}
PlayGunShot(listener,TheGun)
{
	        if( listener != self )
                {
                        //self iprintln("bang!!!");
			if( isDefined(TheGun) && isDefined(level.weapon[ TheGun ]["ShotSound"]))
			{
				ShotSound = level.weapon[ TheGun ]["ShotSound"];
			}
			else
			{
				ShotSound = level.weapon[ "ak47_acog_mp" ]["ShotSound"];
			}
			
                        dist = distance(self getplayereyes(),listener getplayereyes());
                        if(dist >= 600 && !issubstr( thegun, "silencer" ))
                        {
                                delay=dist/11800;
                                wait(delay);
                                self playsoundtoplayer( shotsound , listener );
                        }
                        else
                        {
				self playsoundtoplayer( shotsound, listener );
                        }
                }
}

movespeed()
{
	speedscale = getdvarfloat( "player_movespeed" );
	self setmovespeedscale( speedscale );
}
suppressioncontroller()
{
	self.suppressiondist = 60;
	while(isalive(self))
        {
                level waittill("suppress",start,end,owner);
		if(self != owner)
		{
			distvect = vectorfromlinetopoint( start, end, self getplayereyes() );
	                dist = length(distvect);
                	//self iprintln("distance to vector="+dist);
               		if ( dist <= self.suppressiondist )
               		{
                        	self thread playsuppression(dist);
                	}
		}
		
        }
}
playsuppression(distance)
{

	if(distance <=1){
	distance = 1;
	}
	time = 1/distance;
	self shellshock( "frag_grenade_mp", 0.5 );
	self playsoundtoplayer( "whizby", self );
}
gunwatcher()
{
	while(isalive(self))
	{
		self waittill("weapon_fired");
               // self iprintln("velocity" + vel);
		self playsoundtoplayer( "whizby", self );
		self thread sendshotvector();
	}
}
sendshotsound()
{
	level notify("gunshot",self getplayereyes(), self,self getcurrentweapon() );
}
sendshotvector()
{
	maxdist = 5000000;
	owner = self;
	start = self getplayereyes();
	angle = self getplayerangles();
	vector = vectorscale( anglestoforward( angle ), maxdist );
	trace = bullettrace( start, start + vector, 0, self );
	end = trace["position"];
	suppressionvector = vectorscale( anglestoforward( angle ), distance(start,end) );
	level notify("suppress", start,end, owner);
		
}
getplayereyes()
{
    playereyes = self.origin;
    switch ( self getstance() ) {
    case "prone":
        playereyes += (0,0,11);
    break;
    case "crouch":
        playereyes += (0,0,40);
    break;
    case "stand":
        playereyes += (0,0,60);
    break;
    }

return playereyes;	
}


