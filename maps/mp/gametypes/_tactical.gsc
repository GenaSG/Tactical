#include common_scripts\utility;
init()
{
	precacheShellShock( "frag_grenade_mp" );
	precacheRumble( "artillery_rumble" );
        level thread onPlayerConnect();
	maps\mp\gametypes\_defaults::init();
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
		self maps\mp\gametypes\_clientdefaults::init();
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
		SoundOrigin = self getPlayerEyes();
		TheGun = self GetCurrentWeapon();
		for(i=0;i<=level.players.size;i++)
		{
			if(isDefined(level.players[i]) && isDefined(TheGun))
			{
				self thread PlayGunShot(level.players[i],TheGun,SoundOrigin);		
		}	}
	}
}
PlayGunShot(listener,TheGun,SoundOrigin)
{
	        if( listener != self )
                {
                        //self iprintln("bang!!!");
			if( isDefined(TheGun) && isDefined(level.weapon[ TheGun ]["ShotSound"]))
			{
				shotsound = level.weapon[ TheGun ]["ShotSound"];
			}
			else
			{
				return;
			}
			
                        dist = distance(self getplayereyes(),listener getplayereyes());
                        if(dist >= 600 && !issubstr( TheGun, "silencer" ))
                        {
                                delay=dist/11800;
                                wait(delay);
				if(isDefined(self) && isAlive(self))
				{
                                	self playsoundtoplayer( shotsound , listener );
				}
				else
				{
					dummy = Spawn( "script_origin", SoundOrigin );
					dummy playsoundtoplayer( shotsound , listener );
					dummy Delete();
					while(isDefined(dummy))
					{
						dummy Delete();
					}
				}
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
	//self playsoundtoplayer( "whizby", self );
}
gunwatcher()
{
	while(isalive(self))
	{
		self waittill("weapon_fired");
               // self iprintln("velocity" + vel);
		//self playsoundtoplayer( "whizby", self );
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


