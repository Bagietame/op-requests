local ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('op-requests:sendRequestToPlayer')
AddEventHandler('op-requests:sendRequestToPlayer', function(rData)
	local xPlayer  = ESX.GetPlayerFromId(rData.fromwho)

    if rData.towho ~= nil then
        local xReceiver = ESX.GetPlayerFromId(rData.towho)
        
        local receivernames = xReceiver.variables.firstName.. " ".. xReceiver.variables.lastName
           
        rData.towhonames = receivernames
 
        TriggerClientEvent("op-requests:showRequest", xReceiver.source, rData)
        
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Request Sent to ".. receivernames)
    end
end)

RegisterServerEvent('op-requests:notifyFirst')
AddEventHandler('op-requests:notifyFirst', function(type, rData)
    local xSender = ESX.GetPlayerFromId(rData.fromwho)

    if type == "accepted" then 
        TriggerClientEvent('esx:showNotification', xSender.source, "Request accepted by ".. rData.towhonames)
        TriggerClientEvent("op-requests:runFuncs", xSender.source, "accepted")
    elseif type == "rejected" then 
        TriggerClientEvent('esx:showNotification', xSender.source, "Request rejected by ".. rData.towhonames)
        TriggerClientEvent("op-requests:runFuncs", xSender.source, "rejected")
    end
end)

RegisterServerEvent('op-requests:error')
AddEventHandler('op-requests:error', function(rData)
    local xSender = ESX.GetPlayerFromId(rData.fromwho)

    TriggerClientEvent('esx:showNotification', xSender.source, "Can't send request to ".. rData.towhonames)
end)