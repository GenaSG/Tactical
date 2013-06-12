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
		self thread InitVars();
		self maps\mp\gametypes\_clientdefaults::init();
		self thread GunWatcher();
		self thread SuppressionController();
		self thread moveSpeed();
		self thread InfiniteLoop();
		//self thread maps\mp\gametypes\_fx::init();
		self thread GunShotPlayer();
		self thread indevelopment();
        }
}
indevelopment()
{
	//      self thread SoundTestBot();
}
InitVars()
{
	self.spotDelay=1;
	self.spottingDist=100000;	
	self.nextSpotTime=0;
	self.suppressiondist = 60;
	self.snapplaydist = 120;
}

InfiniteLoop()
{
	while(isAlive(self))
	{
		self thread enemySpotter();
	//	self iprintln(self.psoffsettime);
		wait 0.05;
	}
}

enemySpotter()
{
	if( !level.teambased || gettime() < self.nextSpotTime)
		return;
	if(level.teambased && gettime() >= self.nextSpotTime && self UseButtonPressed())
	{
		self.nextSpotTime = gettime() + self.spotDelay*1000;
		Trace = Bullettrace(self getplayereyes(),self getplayereyes()+anglestoforward(self getplayerangles())*self.spottingDist,true,self);
		if(isDefined(Trace["entity"]) && isPlayer(Trace["entity"] ) && Trace["entity"].team != self.team)
		{
			maps\mp\gametypes\_quickmessages::quickstatements("1");
		//	thread maps\mp\gametypes\_deathicons::addDeathicon( Trace["entity"], self, self.pers["team"], 5.0 );
		//	Trace["entity"] maps\mp\gametypes\_gameobjects::set3DIcon( "friendly", "waypoint_bomb" );
		}
	}

}

GunShotPlayer()
{
	actor = Spawn( "script_origin", self getPlayerEyes() );
	while(isAlive(self))
	{
		self waittill("PlayGunShot",ShotSound,Source);
		actor.origin = Source;
		actor playsoundtoplayer( ShotSound , self );	
		
	}
	actor delete();
}

sendshotsound(TheGun,SoundOrigin)
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
	
        dist = distance(self getplayereyes(),SoundOrigin);
        if((dist >= 600) && !issubstr( TheGun, "silencer" ))
        {
                delay=dist/11800;
                wait(delay);
               	self notify("PlayGunShot", shotsound , SoundOrigin );
	}
	else
        {
		self notify("PlayGunShot", shotsound , SoundOrigin );
        }

}

movespeed()
{
	while(!isAlive(self))
	{
		wait 0.5;
	}
	speedscale = getdvarfloat( "player_movespeed" );
	self setmovespeedscale( speedscale );
}
suppressioncontroller()
{
	sActor=Spawn( "script_origin", self getPlayerEyes() );
	while(isalive(self))
        {
                level waittill("suppress",start,end,owner,TheGun);
		if((self != owner) && (distance(start,self getplayereyes()) <= distance(start,end)) && (distance(end,self getplayereyes()) <= distance(start,end)) )
		{
			eyes =self getplayereyes();
			distvect = vectorfromlinetopoint( start, end, self getplayereyes() );
			//distance(start,eyes) <= distance(start,end) && distance(end,eyes) <= distance(start,end)
	                dist = length(distvect);
                	//self iprintln("distance to vector="+dist);
			trace = BulletTracePassed( eyes, eyes + distvect, true, self );
			
               		if ( dist <= self.suppressiondist )
               		{	
                        	self thread playsuppression(dist);
                	}
			if ( dist <= self.snapplaydist )
			{	
				sActor playsoundtoplayer( "bulletsnap" , self );
			//	self notify("PlayGunShot", "bulletsnap" , eyes + distvect );
			}
		}
		
        }
	sActor delete();
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
SoundTestBot()
{
	bot=spawn("script_origin",self.origin);
	wait(1);
	while(isAlive(self))
	{
	//	TheGun=getdvar("sv_testbotgun");
	//	if(!isDefined(TheGun))
	//	{
			TheGun = self GetCurrentWeapon();
	//	}
                for(i=0;i<=level.players.size;i++)
                {
			if(isDefined(level.players[i]) && isDefined(TheGun))
                        {
                        	level.players[i] thread sendshotsound(TheGun,bot.origin);
			}
                }		
		wait 0.2;
	}
	bot delete();
}
gunwatcher()
{
	while(isalive(self))
	{
		self waittill("weapon_fired");
	       	SoundOrigin = self getPlayerEyes();
                TheGun = self GetCurrentWeapon();
                for(i=0;i<=level.players.size;i++)
                {
                        if(isDefined(level.players[i]) && isDefined(TheGun) && level.players[i] != self)
                        {
                                level.players[i] thread sendshotsound(TheGun,SoundOrigin);
        	        }      
		}
	
		//self playsoundtoplayer( "bulletsnap", self );
		self thread sendshotvector(TheGun);
	}
}

sendshotvector(TheGun)
{
	maxdist = 5000000;
	owner = self;
	start = self getplayereyes();
	angle = self getplayerangles();
	vector = vectorscale( anglestoforward( angle ), maxdist );
	trace = bullettrace( start, start + vector, true, self );
	end = trace["position"];
	suppressionvector = vectorscale( anglestoforward( angle ), distance(start,end) );
	level notify("suppress", start,end, owner,TheGun);
		
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


