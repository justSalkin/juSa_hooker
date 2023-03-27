-- LAST EDIT by just_Salkin 27.03.2023 | WHITE-SANDS-RP german RP server
-- Version 1.0
Config = {}
------------------- Change this -----------------
Config.pay = 5
------------------- NPCs ------------------------
Config.NPCs = {
    --No Interaction
    { npc_name = "Prostitute", blip = 0, npcmodel = "cs_valprostitute_01", coords = vector3(-308.28, 802.46, 120.98), heading = 67.18, radius = 3.0, type = "nointeraction"},
    --Job NPC
    { npc_name = "Valentine Saloon Hooker", -- NPC/blip name
    blip = -426139257, --set to 0 to not display a blip for this NPC
    npcmodel = "cs_valprostitute_02", 
    coords = vector3(-313.21, 802.43, 120.98), 
    pos = vector3(-311.85, 798.95, 120.99),
    heading = -11.18, 
    radius = 3.0, --interaction radius
    type = "jobinteraction", -- if "jobinteraction" you are able to clock in at this npc
    },
}
------------------- TRANSLATE HERE --------------
Config.Language = {
    talk = "talk to npc",
    press = "press ",
    invite = "Hey sweety, do you want some fun? Then let's go to my room.",
    reject = "Sorry sweetie Clara will be there tomorrow, I'm sure she'll be happy to take care of you.*hihi*",
    notify_1 = " `moans` OMG!",
    notify_2 = "You were great.",
    payed1 = "You payed ",
    payed2 = "$ "
}
------------------- Interaction -----------------
Config.keys = {
    G = 0x760A9C6F, -- talk/interact
}