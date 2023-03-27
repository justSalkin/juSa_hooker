local prompts = GetRandomIntInRange(0, 0xffffff)

local VorpCore = {}
local VORPInv = {}


local working = false
local hasPackage = false
local MarkerPosition = 0

local progressbar = exports.vorp_progressbar:initiate()

local Animations = exports.vorp_animations.initiate()

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
StartNPCs()-- NPC loads after selecting character
end)

function StartNPCs()
    for i, v in ipairs(Config.NPCs) do
        local x, y, z = table.unpack(v.coords)
        -- Loading Model
        local hashModel = GetHashKey(v.npcmodel)
        if IsModelValid(hashModel) then
            RequestModel(hashModel)
            while not HasModelLoaded(hashModel) do
                Wait(100)
            end
        else
            print(v.npcmodel .. " is not valid")
        end
        -- Spawn NPC Ped
        local npc = CreatePed(hashModel, x, y, z, v.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        Wait(1000)
        FreezeEntityPosition(npc, true) -- NPC can't escape
        SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
        --create blip
        if v.blip ~= 0 then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, x, y, z)
            SetBlipSprite(blip, v.blip, true)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.npc_name)
        end
    end
end

Citizen.CreateThread(function() --create talk to npc prompt
    Citizen.Wait(5000)
    local press = Config.Language.press
    talktonpc = PromptRegisterBegin()
    PromptSetControlAction(talktonpc, Config.keys["G"])
    press = CreateVarString(10, 'LITERAL_STRING', press)
    PromptSetText(talktonpc, press)
    PromptSetEnabled(talktonpc, 1)
    PromptSetVisible(talktonpc, 1)
    PromptSetStandardMode(talktonpc, 1)
    PromptSetHoldMode(talktonpc, 1)
    PromptSetGroup(talktonpc, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, talktonpc, true)
    PromptRegisterEnd(talktonpc)
end)

Citizen.CreateThread(function()
    while true do
        local sleep = true
        local _source = source
        for i, v in ipairs(Config.NPCs) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            if Vdist(playerCoords, v.coords) <= v.radius then -- Checking distance between player and npc
                if v.type ~= "nointeraction" then
                    sleep = false
                    local label = CreateVarString(10, 'LITERAL_STRING', Config.Language.talk)
                    PromptSetActiveGroupThisFrame(prompts, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE, talktonpc) then --if pressing the interaction-key
                        local playerPed = PlayerPedId()
                        if v.type == "jobinteraction" then
                            if IsPedMale(playerPed) then 
                                VorpCore.NotifyBottomRight(Config.Language.invite, 3000)
                                Citizen.Wait(4000)
                                FreezeEntityPosition(playerPed,true)
                                local originalPos = GetEntityCoords(playerPed)
                                DoScreenFadeOut(1000)
                                Citizen.Wait(1000)
                                SetEntityCoords(playerPed, v.pos.x, v.pos.y, v.pos.z) --teleport into room
                                Citizen.Wait(20000) --20 sec in room
                                VorpCore.NotifyCenter(Config.Language.notify_1,6000)
                                VorpCore.NotifyCenter(Config.Language.notify_2,6000)
                                SetEntityCoords(playerPed, originalPos.x, originalPos.y, originalPos.z) --teleport back
                                Citizen.Wait(2000)
                                DoScreenFadeIn(1000)
                                TriggerServerEvent('juSa_hooker:pay')
                                ClearPedTasks(playerPed)
                                FreezeEntityPosition(playerPed,false)
                            else 
                                VorpCore.NotifyBottomRight(Config.Language.reject, 6500) 
                            end
                            Citizen.Wait(1000)
                        end
                        Wait(500)
                    end
                end
            end
        end
        if sleep then
            Citizen.Wait(500)
        end
        Citizen.Wait(1)
    end
end)