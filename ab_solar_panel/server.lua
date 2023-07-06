ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('esx_legacy:removeItem')
AddEventHandler('esx_legacy:removeItem', function(itemName)
    local xPlayer = ESX.GetPlayerFromId(source)
  
    if xPlayer and xPlayer.getInventoryItem(itemName) then
        xPlayer.removeInventoryItem(itemName, 1)
    end
end)

RegisterServerEvent('esx_legacy:giveItem')
AddEventHandler('esx_legacy:giveItem', function(itemName)
    local xPlayer = ESX.GetPlayerFromId(source)
  
    if xPlayer then
        xPlayer.addInventoryItem(itemName, 1)
    end
end)
