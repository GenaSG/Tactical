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
	level.weapon[ "m16_acog_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m16_gl_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m16_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m16_reflex_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m16_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";
        level.weapon[ "gl_m16_mp" ]["ShotSound"] = "weap_m203_fire_npc";

	level.weapon[ "ak47_acog_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_gl_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_reflex_mp" ]["ShotSound"] = "weap_ak47_fire_npc";
	level.weapon[ "ak47_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";
	level.weapon[ "gl_ak47_mp" ]["ShotSound"] = "weap_gp25_fire_npc";

	level.weapon[ "m4_acog_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m4_gl_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m4_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m4_reflex_mp" ]["ShotSound"] = "weap_m249saw_fire_npc";
	level.weapon[ "m4_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";
	level.weapon[ "gl_m4_mp" ]["ShotSound"] = "weap_m203_fire_npc";

	level.weapon[ "g3_acog_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";
	level.weapon[ "g3_gl_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";
	level.weapon[ "g3_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";
	level.weapon[ "g3_reflex_mp" ]["ShotSound"] = "weap_degtyarev_rpd_fire_npc";
	level.weapon[ "g3_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";
	level.weapon[ "gl_g3_mp" ]["ShotSound"] = "weap_m203_fire_npc";

	level.weapon[ "g36c_acog_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_gl_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_reflex_mp" ]["ShotSound"] = "weap_g36c_fire_npc";
	level.weapon[ "g36c_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";
	level.weapon[ "gl_g36c_mp" ]["ShotSound"] = "weap_m203_fire_npc";

	level.weapon[ "m14_acog_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_gl_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_reflex_mp" ]["ShotSound"] = "weap_m14sniper_fire_npc";
	level.weapon[ "m14_silencer_mp" ]["ShotSound"] = "weap_m4silenced_fire_npc";
	level.weapon[ "gl_m14_mp" ]["ShotSound"] = "weap_m203_fire_npc";

	level.weapon[ "mp44_mp" ]["ShotSound"] = "weap_mp44_fire_npc";


	// Special Ops class weapons
	level.weapon[ "mp5_acog_mp" ]["ShotSound"] = "weap_mp5_fire_npc";
	level.weapon[ "mp5_mp" ]["ShotSound"] = "weap_mp5_fire_npc";
	level.weapon[ "mp5_reflex_mp" ]["ShotSound"] = "weap_mp5_fire_npc";
	level.weapon[ "mp5_silencer_mp" ]["ShotSound"] = "weap_mp5sd_fire_npc";

	level.weapon[ "skorpion_acog_mp" ]["ShotSound"] = "weap_miniuzi_fire_npc";
	level.weapon[ "skorpion_mp" ]["ShotSound"] = "weap_miniuzi_fire_npc";
	level.weapon[ "skorpion_reflex_mp" ]["ShotSound"] = "weap_miniuzi_fire_npc";
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
