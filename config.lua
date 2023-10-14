-- LAST EDIT by just_Salkin 14.10.2023 | WHITE-SANDS-RP german RP server
-- Version 1.1
Config = {}
------------------- Change this -----------------
Config.pay = 5
------------------- NPCs ------------------------
Config.NPCs = {
    --No Interaction
    { npc_name = "Prostitute", blip = 0, npcmodel = "cs_valprostitute_01", coords = vector3(-308.28, 802.46, 120.98), heading = 67.18, radius = 3.0, type = "nointeraction"},
    --Job NPC
    { npc_name = "Valentine Saloon Hooker", -- NPC/blip name
    blip = 1451797164, --set to 0 to not display a blip for this NPC
    npcmodel = "cs_valprostitute_02", 
    coords = vector3(-313.21, 802.43, 120.98), 
    pos = vector3(-311.85, 798.95, 120.99), --pos player gets portet to during  the interaction
    heading = -11.18, 
    radius = 3.0, --interaction radius
    type = "m_interaction", --you can set the npc to interact with male(m), female(f) or both(b)
    },
    { npc_name = "SD Saloon Hooker",
    blip = 1451797164,
    npcmodel = "u_m_m_sdstrongwomanassistant_01", 
    coords = vector3(2637.48, -1226.97, 58.48), 
    pos = vector3(2629.34, -1240.80, 53.86),
    heading = 140.17, 
    radius = 3.0, 
    type = "b_interaction",
    },
    { npc_name = "Rhodes Saloon Hooker",
    blip = 1451797164,
    npcmodel = "cs_valprostitute_01", 
    coords = vector3(1339.87, -1377.90, 83.28), 
    pos = vector3(1360.44, -1399.47, 78.35),
    heading = -97.54, 
    radius = 3.0,
    type = "f_interaction",
    },
}
------------------- TRANSLATE HERE --------------
Config.Language = {
    talk = "talk to npc",
    press = "press ",
    invite = "Hey sweety, do you want some fun? Then let's go to my room.",
    reject_f = "Sorry sweetie, Clara will be there tomorrow, I'm sure she'll be happy to take care of you.*hihi*",
    reject_m = "Sorry sweetie, but I'll just take care of girls.*hihi*",
    notify_1 = " `moans` OMG!",
    notify_2 = "You were great.",
    payed1 = "You payed ",
    payed2 = "$ "
}
------------------- Interaction -----------------
Config.keys = {
    G = 0x760A9C6F, -- talk/interact
}