Citizen.CreateThread(function()
    if Config.FrameWork == "esx" then
        ESX = exports["es_extended"]:getSharedObject()
        getPlayer = function(...)
            return ESX.GetPlayerFromId(...)
        end
        getName = function(player)
            return player.variables.firstName.." "..player.variables.lastName
        end
        sendNotify = function(player, type, text)
            return TriggerClientEvent('esx:showNotification', player.source, text)
        end
        getSource = function(player) 
            return player.source
        end
    else 
        QBCore = exports['qb-core']:GetCoreObject()
        getPlayer = function(...)
            return QBCore.Functions.GetPlayer(...)
        end
        getName = function(player)
            return player.PlayerData.charinfo.firstname.." "..player.PlayerData.charinfo.lastname
        end
        sendNotify = function(player, type, text)
            return TriggerClientEvent('QBCore:Notify', player.PlayerData.source, text, type)
        end
        getSource = function(player) 
            return player.PlayerData.source
        end
    end
end)

RegisterServerEvent('op-requests:sendRequestToPlayer')
AddEventHandler('op-requests:sendRequestToPlayer', function(rData)
	local xPlayer  = getPlayer(rData.fromwho)

    if rData.towho ~= nil then
        local xReceiver = getPlayer(rData.towho)
        local receivernames = getName(xReceiver)
        rData.towhonames = receivernames

        local _player = getSource(xPlayer)
 
        TriggerClientEvent("op-requests:showRequest", _player, rData)
        
        sendNotify(xPlayer, "success", "Request Sent to ".. receivernames)
    end
end)

RegisterServerEvent('op-requests:notifyFirst')
AddEventHandler('op-requests:notifyFirst', function(type, rData)
    local xSender = getPlayer(rData.fromwho)
    local _player = getSource(xSender)
    if type == "accepted" then 
        sendNotify(xSender, "success", "Request accepted by ".. rData.towhonames)
        TriggerClientEvent("op-requests:runFuncs", _player, "accepted")
    elseif type == "rejected" then 
        sendNotify(xSender, "error", "Request rejected by ".. rData.towhonames)
        TriggerClientEvent("op-requests:runFuncs", _player, "rejected")
    end
end)

RegisterServerEvent('op-requests:error')
AddEventHandler('op-requests:error', function(rData)
    local xSender = getPlayer(rData.fromwho)
    sendNotify(xSender, "error", "Can't send request to ".. rData.towhonames)
end)