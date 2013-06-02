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
		self thread GunWatcher();
		self thread SuppressionController();
        }
}
SuppressionController()
{
	self.suppressionDist = 60;
	for(;;)
        {
                level waittill("suppress",start,end,owner);
		if(self != owner)
		{
			distVect = VectorFromLineToPoint( start, end, self getPlayerEyes() );
	                dist = Length(distVect);
                	//self iprintln("Distance to vector="+dist);
               		if ( dist <= self.suppressionDist )
               		{
                        	self thread PlaySuppression(dist);
                	}
		}
		
        }
}
PlaySuppression(distance)
{

	if(distance <=1){
	distance = 1;
	}
	time = 1/distance;
	self shellShock( "frag_grenade_mp", 1 );
}
GunWatcher()
{
	for(;;)
	{
		self waittill("weapon_fired");
                vel = Length(self GetVelocity()) * 0.0254;
                self iprintln("velocity" + vel);
		self thread SendShotVector();
	}
}
SendShotVector()
{
	maxdist = 5000000;
	owner = self;
	start = self getPlayerEyes();
	angle = self getplayerangles();
	vector = vectorscale( anglestoforward( angle ), maxdist );
	trace = bullettrace( start, start + vector, 0, self );
	end = trace["position"];
	SuppressionVector = vectorscale( anglestoforward( angle ), distance(start,end) );
	level notify("suppress", start,end, owner);
		
}
getPlayerEyes()
{
    playerEyes = self.origin;
    switch ( self getStance() ) {
    case "prone":
        playerEyes += (0,0,11);
    break;
    case "crouch":
        playerEyes += (0,0,40);
    break;
    case "stand":
        playerEyes += (0,0,60);
    break;
    }

return playerEyes;	
}


