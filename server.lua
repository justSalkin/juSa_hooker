VorpCore = {}
local VorpInv = exports.vorp_inventory:vorp_inventoryApi()

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("juSa_hooker:pay")
AddEventHandler("juSa_hooker:pay", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter

    Character.removeCurrency(0, Config.pay)
    TriggerClientEvent("vorp:TipRight", _source, "" ..Config.Language.payed1.. "" ..Config.pay.. "" ..Config.Language.payed2.. "" , 4000)
end)