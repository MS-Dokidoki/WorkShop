local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
        Asset( "SCRIPT", "scripts/prefabs/player_common.lua"),
        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),

        Asset( "ANIM", "anim/Muri.zip" ),
}

TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.MURI = {
    "flint",
	"flint",
	"twigs",
	"twigs",
}

local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.MURI
end

local prefabs = FlattenTree(start_inv, true)

-- 角色没死亡时, 设置速度
local function onbecamehuman(inst)
	-- Set speed when not a ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "Muri_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "Muri_speed_mod")
end

local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

local common = function(e)
    e.MiniMapEntity:SetIcon("Muri.tex")   
end

local main = function(e)
    e.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default 
	
    e.soundsname = "willow"
	
	e.components.health:SetMaxHealth(TUNING.COMMON_HEALTH)
	e.components.hunger:SetMax(TUNING.COMMON_HUNGER)
	e.components.sanity:SetMax(TUNING.COMMON_SANITY)
	
	e.components.combat.damagemultiplier = 1
	
	e.components.hunger.hungerrate = TUNING.COMMON_HUNGER_RATE
	
	e.components.locomotor.walkspeed = TUNING.COMMON_WALK_SPEED
	e.components.locomotor.runspeed = TUNING.COMMON_RUN_SPEED

    e.OnLoad = onload
    e.OnNewSpawn = onload
end

return MakePlayerCharacter("Muri", prefabs, assets, common, main, start_inv)