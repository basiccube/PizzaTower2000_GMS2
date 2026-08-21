#macro CHARACTER_FILE "character.ini"

function scr_player_initCharacter()
{
	ini_open(CHARACTER_FILE)

	name = string_upper(ini_read_string("Character", "Name", "Peppino"))
	useMachFreefallAnim = ini_read_real("Character", "UseMachFreefall", 1)
	grabTurnBoost = ini_read_real("Character", "GrabTurnBoost", 0)
	knightAttackType = ini_read_real("Character", "KnightAttackType", 0)

	piledriverAnim = ini_read_real("Piledriver", "PiledriverAnim", 1)
	piledriverX = ini_read_real("Piledriver", "PiledriverXOffset", 0)
	piledriverY = ini_read_real("Piledriver", "PiledriverYOffset", 0)

	ini_close()
}