PrefabFiles = {
	"Muri"
}

Assets = {
    -- IMAGE文件 为资源本体
    -- ATLAS文件 为资源信息
    
    -- 游戏存档上的人物图标资源
    Asset( "IMAGE", "images/saveslot_portraits/Muri.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/Muri.xml" ),
    
    -- 游戏人物选择界面的人物图标
    Asset( "IMAGE", "images/selectscreen_portraits/Muri.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/Muri.xml" ),
	
    -- 游戏人物选择界面的人物剪影图标
    Asset( "IMAGE", "images/selectscreen_portraits/Muri_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/Muri_silho.xml" ),
    
    -- 人物选择后的预览图
    Asset( "IMAGE", "bigportraits/Muri.tex" ),
    Asset( "ATLAS", "bigportraits/Muri.xml" ),
	
    -- 人物在地图上的小图标
	Asset( "IMAGE", "images/map_icons/Muri.tex" ),
	Asset( "ATLAS", "images/map_icons/Muri.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- 自定义数值
env.TUNING = GLOBAL.TUNING
TUNING.COMMON_HUNGER = 150
TUNING.COMMON_HEALTH = 125
TUNING.COMMON_SANITY = 200
TUNING.COMMON_HUNGER_RATE = TUNING.WILSON_HUNGER_RATE
TUNING.COMMON_WALK_SPEED = 4
TUNING.COMMON_RUN_SPEED = 6

-- Muri
local skin_modes = {
    { 
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle", 
        scale = 0.75, 
        offset = { 0, -25 } 
    },
}

GLOBAL.STRINGS.NAMES.MURI = "Muri"
GLOBAL.STRINGS.CHARACTER_TITLES.Muri = "Muri!"
GLOBAL.STRINGS.CHARACTER_NAMES.Muri = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.Muri = "*rua\n*rua\n*rua"
GLOBAL.STRINGS.CHARACTER_QUOTES.Muri = "\"hello\""
GLOBAL.STRINGS.CHARACTERS.MURI = require "speech_muri"

AddMinimapAtlas("images/map_icons/Muri.xml")
AddModCharacter("Muri", "FEMALE", skin_modes)

