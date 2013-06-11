main()
{
	while(isAlive(self))
	{
		self waittill("weapon_fired");
		self iprintln("client fired");
	}
	
}
