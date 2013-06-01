#include common_scripts\utility;
init()
{
	precacheShellShock( "frag_grenade_mp" );
        level thread onPlayerConnect();
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
	                dist = Length(VectorFromLineToPoint( start, end, self getPlayerEyes() ));
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
	//	self iprintln("weapon fired!!!");
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


