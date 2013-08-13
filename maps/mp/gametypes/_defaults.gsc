init()
{
	setDvar("scr_hardcore",1 );
	setDvar( "player_movespeed", 0.57 );
	setDvar( "player_strafeSpeedScale", 1 );
	setDvar( "scr_enable_hiticon", 0 );
	setDvar( "player_sprintSpeedScale", 2);
	setDvar( "player_sprintTime", 12);
	setDvar( "scr_player_sprinttime", 12);
	setDvar( "scr_game_hardpoints", 0);
	//setDvar( "class_assault_movespeed", 0.6 );
	//setDvar( "class_specops_movespeed", 0.6 );
	//setDvar( "class_heavygunner_movespeed", 0.6 );
	//setDvar( "class_demolitions_movespeed", 0.6 );
	//setDvar( "class_sniper_movespeed", 0.6 );
	level thread loadWeaponSounds();
}
loadWeaponSounds()
{
	level.ShotSound=[];
	level.weapon=[];
	// Assault class weapons	
	level.weapon[ "m16_acog_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m16_gl_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m16_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m16_reflex_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m16_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";
        level.weapon[ "gl_m16_mp" ]["ShotSound"] = "weap_m203_fire_npc_far";

	level.weapon[ "ak47_acog_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "ak47_gl_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "ak47_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "ak47_reflex_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "ak47_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";
	level.weapon[ "gl_ak47_mp" ]["ShotSound"] = "weap_gp25_fire_npc_far";

	level.weapon[ "m4_acog_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m4_gl_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m4_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m4_reflex_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "m4_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";
	level.weapon[ "gl_m4_mp" ]["ShotSound"] = "weap_m203_fire_npc_far";

	level.weapon[ "g3_acog_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "g3_gl_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "g3_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "g3_reflex_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "g3_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";
	level.weapon[ "gl_g3_mp" ]["ShotSound"] = "weap_m203_fire_npc_far";

	level.weapon[ "g36c_acog_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "g36c_gl_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "g36c_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "g36c_reflex_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "g36c_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";
	level.weapon[ "gl_g36c_mp" ]["ShotSound"] = "weap_m203_fire_npc_far";

	level.weapon[ "m14_acog_mp" ]["ShotSound"] = "762_single_npc_far";
	level.weapon[ "m14_gl_mp" ]["ShotSound"] = "762_single_npc_far";
	level.weapon[ "m14_mp" ]["ShotSound"] = "762_single_npc_far";
	level.weapon[ "m14_reflex_mp" ]["ShotSound"] = "762_single_npc_far";
	level.weapon[ "m14_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";
	level.weapon[ "gl_m14_mp" ]["ShotSound"] = "weap_m203_fire_npc_far";

	level.weapon[ "mp44_mp" ]["ShotSound"] = "762_auto_npc_far";


	// Special Ops class weapons
	level.weapon[ "mp5_acog_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "mp5_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "mp5_reflex_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "mp5_silencer_mp" ]["ShotSound"] = "9mm_silenced_npc_far";

	level.weapon[ "skorpion_acog_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "skorpion_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "skorpion_reflex_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "skorpion_silencer_mp" ]["ShotSound"] = "9mm_silenced_npc_far";

	level.weapon[ "uzi_acog_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "uzi_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "uzi_reflex_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "uzi_silencer_mp" ]["ShotSound"] = "9mm_silenced_npc_far";

	level.weapon[ "ak74u_acog_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "ak74u_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "ak74u_reflex_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "ak74u_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";

	level.weapon[ "p90_acog_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "p90_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "p90_reflex_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "p90_silencer_mp" ]["ShotSound"] = "SilencedRifle_npc_far";


	// Demolition class weapons
	level.weapon[ "m1014_grip_mp" ]["ShotSound"] = "weap_m1014_fire_npc";
	level.weapon[ "m1014_mp" ]["ShotSound"] = "weap_m1014_fire_npc";
	level.weapon[ "m1014_reflex_mp" ]["ShotSound"] = "weap_m1014_fire_npc";

	level.weapon[ "winchester1200_grip_mp" ]["ShotSound"] = "weap_winch1200_fire_npc";
	level.weapon[ "winchester1200_mp" ]["ShotSound"] = "weap_winch1200_fire_npc";
	level.weapon[ "winchester1200_reflex_mp" ]["ShotSound"] = "weap_winch1200_fire_npc";


	// Heavy gunner class weapons
	level.weapon[ "saw_acog_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "saw_grip_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "saw_mp" ]["ShotSound"] = "556_npc_far";
	level.weapon[ "saw_reflex_mp" ]["ShotSound"] = "556_npc_far";

	level.weapon[ "rpd_acog_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "rpd_grip_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "rpd_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "rpd_reflex_mp" ]["ShotSound"] = "762_auto_npc_far";

	level.weapon[ "m60e4_acog_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "m60e4_grip_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "m60e4_mp" ]["ShotSound"] = "762_auto_npc_far";
	level.weapon[ "m60e4_reflex_mp" ]["ShotSound"] = "762_auto_npc_far";


	// Sniper class weapons
	level.weapon[ "dragunov_acog_mp" ]["ShotSound"] = "762_single_npc_far";
	level.weapon[ "dragunov_mp" ]["ShotSound"] ="762_single_npc_far";

	level.weapon[ "m40a3_acog_mp" ]["ShotSound"] = "762_sniper_npc_far";
	level.weapon[ "m40a3_mp" ]["ShotSound"] = "762_sniper_npc_far";

	level.weapon[ "barrett_acog_mp" ]["ShotSound"] = "Heavy_npc_far";
	level.weapon[ "barrett_mp" ]["ShotSound"] = "Heavy_npc_far";

	level.weapon[ "remington700_acog_mp" ]["ShotSound"] = "762_sniper_npc_far";
	level.weapon[ "remington700_mp" ]["ShotSound"] = "762_sniper_npc_far";

	level.weapon[ "m21_acog_mp" ]["ShotSound"] = "762_single_npc_far";
	level.weapon[ "m21_mp" ]["ShotSound"] = "762_single_npc_far";


	// Handguns
	level.weapon[ "beretta_mp" ]["ShotSound"] = "9mm_npc_far";
	level.weapon[ "beretta_silencer_mp" ]["ShotSound"] = "9mm_silenced_npc_far";

	level.weapon[ "colt45_mp" ]["ShotSound"] = "45ACP_npc_far";
	level.weapon[ "colt45_silencer_mp" ]["ShotSound"] = "45ACP_silenced_npc_far";

	level.weapon[ "usp_mp" ]["ShotSound"] = "45ACP_npc_far";
	level.weapon[ "usp_silencer_mp" ]["ShotSound"] = "45ACP_silenced_npc_far";

	level.weapon[ "deserteagle_mp" ]["ShotSound"] = "50AE_npc_far";
	level.weapon[ "deserteaglegold_mp" ]["ShotSound"] = "50AE_npc_far";
	

	return;
}
