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
		self thread indevelopment();
        }
}
indevelopment()
{
//	self thread spawnBullets();
//		self thread SoundTestBot();
		self thread GunShotPlayer();
	//	self thread maps\mp\gametypes\_fx::init();
}
spawnBullets()
{
	self.bullets=[];
	for(b=0;b<=6;b++)
	{
		self iprintln("spawning bullet #"+b);
		self.bullets[b]=spawn("script_origin",self.origin);	
		self.bullets[b].owner=self;
		self.bullets[b].fired=false;
//		self.bullets[b] LinkTo(self,"tag_gunRight",(0,0,0),(0,0,0));
	}
}
shootBullet()
{
	TheBullet=undefined;
	for(b=0;b<=6;b++)
        {
                self iprintln("shooting bullet #"+b);
		if(!self.bullets[b].fired)
		{
			TheBullet=self.bullets[b];
			TheBullet.fired=true;
			break;
		}
        }
//	TheBullet.origin=self.origin;
	Trace = Bullettrace(self getplayereyes(),self getplayereyes()+anglestoforward(self getplayerangles())*self.spottingDist,true,self);
	if(isDefined(TheBullet))
	{
		TheBullet.flyTime=distance(self.origin,Trace["position"])/30000;
		self IprintLn("FlyTime = "+ TheBullet.flyTime);
		TheBullet.origin=self.origin;
		TheBullet MoveTo(Trace["position"], TheBullet.flyTime, 0, 0);
		TheBullet waittill("movedone");
		TheBullet.fired=false;
	}
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
		wait 0.05;
	}
	//Deleting bullets
//        for(b=0;b<=6;b++)
//        {
//		self iprintln("deleting bullet #"+b);
//              self.bullets[b] delete();
//        }
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
	if(!isDefined(self.soundActor)){
	self.soundActor = Spawn( "script_origin", self getPlayerEyes() );
	}
	while(isAlive(self))
	{
		self waittill("PlayGunShot",ShotSound,Source);
		self.soundActor.origin = Source;
		if(distance(self.soundActor.origin,self.origin)>=1200){
			self.soundActor playsoundtoplayer( "null" , self );
			self.soundActor playsoundtoplayer( ShotSound , self );
		}	
		
	}
	self.soundActor delete();
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
	//sActor=Spawn( "script_origin", self getPlayerEyes() );
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
			//if ( dist <= self.snapplaydist )
			//{	
			//	sActor.origin = eyes + distvect;
			//	sActor playsoundtoplayer( "bulletsnap" , self );
			//	self playsoundtoplayer( "bulletsnap" , self );
			//	self notify("PlayGunShot", "bulletsnap" , eyes + distvect );
			//}
		}
		
        }
	//sActor delete();
}
playsuppression(distance)
{

	if(distance <=1){
	distance = 1;
	}
	time = 1/distance;
	self shellshock( "frag_grenade_mp", 0.5 );
//	self playsoundtoplayer( "bulletsnap", self );
}
SoundTestBot()
{
	bot=spawn("script_origin",self.origin);
	wait(1);
	while(isAlive(self))
	{
		self waittill("weapon_fired");
	//	TheGun=getdvar("sv_testbotgun");
	//	if(!isDefined(TheGun))
	//	{
			//TheGun = self GetCurrentWeapon();
			TheGun = "barrett_mp";
	//	}
                for(i=0;i<=level.players.size;i++)
                {
			if(isDefined(level.players[i]) && isDefined(TheGun))
                        {
                        	level.players[i] thread sendshotsound(TheGun,bot.origin);
			}
                }		
		wait 0.05;
	}
	bot delete();
}
gunwatcher()
{
	while(isalive(self))
	{
		self waittill("weapon_fired");
		//self thread shootBullet();
	       	SoundOrigin = self getPlayerEyes();
                TheGun = self GetCurrentWeapon();
                for(i=0;i<=level.players.size;i++)
                {
                        if(isDefined(level.players[i]) && isDefined(TheGun) && level.players[i] != self)
                        {
                                level.players[i] thread sendshotsound(TheGun,SoundOrigin);
        	        }      
		}
	
		//self playsoundtoplayer( "whizby", self );
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
	//self iprintln("Distance=" + distance(start,end)*0.0254);
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


