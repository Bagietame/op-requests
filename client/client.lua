local isRequest = false
local Request
local rData = {}
rData.status = 3

local function sendRequest(towho, header, description, settings) 
    rData.settings = settings
    rData.header = header
    rData.description = description
    rData.towho = towho
    rData.fromwho = GetPlayerServerId(PlayerId())
    TriggerServerEvent("op-requests:sendRequestToPlayer", rData)
end

exports('sendRequest', sendRequest)

Citizen.CreateThread(function()
    while true do 
        if rData.status == 1 then
            if rData.settings.onAccept then rData.settings.onAccept() end
            rData.status = 3
        elseif rData.status == 2 then
            if rData.settings.onReject then rData.settings.onReject() end
            rData.status = 3
        end
        Wait(1000)
    end
end)

RegisterNetEvent('op-requests:showRequest')
AddEventHandler('op-requests:showRequest', function (rData)
    if not isRequest then 
        isRequest = true
        Request = rData

        SendNUIMessage({
            action = "showRequest",
            head = Request.header,
            desc = Request.description
        })
        SetNuiFocus(true, true)
    else 
        TriggerServerEvent("op-requests:error", rData)
    end
end)

RegisterNUICallback('accepted', function(data, cb)
    SetNuiFocus(false, false)
    isRequest = false
    TriggerServerEvent("op-requests:notifyFirst", "accepted", Request)
    Request = nil
	cb('ok')
end)

RegisterNUICallback('rejected', function(data, cb)
    SetNuiFocus(false, false)
    isRequest = false
    TriggerServerEvent("op-requests:notifyFirst", "rejected", Request)
    Request = nil
	cb('ok')
end)

RegisterNetEvent('op-requests:runFuncs')
AddEventHandler('op-requests:runFuncs', function (r)
    if r == "accepted" then 
        rData.status = 1
    elseif r == "rejected" then 
        rData.status = 2
    end
end)

RegisterCommand('testrequest', function()
    local playerId = GetPlayerServerId(PlayerId())
    exports["op-requests"]:sendRequest(playerId, 'Test', 'Bagno',{
        onReject = function()
          print('odrzucil chuj')
        end, 
        onAccept = function()
            print('zaakceptowal git')
        end
    })
end, false)