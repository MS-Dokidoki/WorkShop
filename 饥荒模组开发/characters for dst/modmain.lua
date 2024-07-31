PrefabFiles = {
	"Muri"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/Muri.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/Muri.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/Muri.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/Muri.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/Muri_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/Muri_silho.xml" ),

    Asset( "IMAGE", "bigportraits/Muri.tex" ),
    Asset( "ATLAS", "bigportraits/Muri.xml" ),
	
	Asset( "IMAGE", "images/map_icons/Muri.tex" ),
	Asset( "ATLAS", "images/map_icons/Muri.xml" ),

}

env.TUNING = GLOBAL.TUNING

TUNING.COMMON_HUNGER = 150
TUNING.COMMON_HEALTH = 125
TUNING.COMMON_SANITY = 200
TUNING.COMMON_HUNGER_RATE = TUNING.WILSON_HUNGER_RATE
TUNING.COMMON_WALK_SPEED = 4
TUNING.COMMON_RUN_SPEED = 6

local require = GLOBAL.require

-- Muri
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "Muri")

GLOBAL.STRINGS.NAMES.MURI = "Muri"
GLOBAL.STRINGS.CHARACTER_TITLES.Muri = "Muri!"
GLOBAL.STRINGS.CHARACTER_NAMES.Muri = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.Muri = "*rua\n*rua\n*rua"
GLOBAL.STRINGS.CHARACTER_QUOTES.Muri = "\"hello\""
GLOBAL.STRINGS.CHARACTERS.MURI = require "speech_muri"

AddMinimapAtlas("images/map_icons/Muri.xml")
AddModCharacter("Muri", "FEMALE")

