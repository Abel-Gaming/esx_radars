ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.radarZones) do
        local blip = AddBlipForCoord(v.position)
	    SetBlipSprite(blip, 184)
	    SetBlipColour(blip, 5)
	    SetBlipScale(blip, 0.75)
	    SetBlipDisplay(blip, 4)
	    SetBlipAsShortRange(blip, true)
	    BeginTextCommandSetBlipName("STRING")
	    AddTextComponentString("Speed Radar")
	    EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(Config.radarZones) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(Config.radarZones[k].position.x, Config.radarZones[k].position.y, Config.radarZones[k].position.z, coords["x"], coords["y"], coords["z"]) < 20 then
                if PlayerData.job ~= nil and not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
                    checkSpeed(Config.radarZones[k].SpeedLimit)
                end
            end
        end
    end
end)

function checkSpeed(SpeedLimit)
    local pP = GetPlayerPed(-1)
    local speed = GetEntitySpeed(pP)
    local vehicle = GetVehiclePedIsIn(pP, false)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local plate = GetVehicleNumberPlateText(vehicle)
    local maxspeed = SpeedLimit
    local mphspeed = math.ceil(speed*2.236936)
	local fineamount = nil
	local finelevel = nil
	local truespeed = mphspeed
    
    if mphspeed > maxspeed and driver == pP then
        Citizen.Wait(250)

        if truespeed >= SpeedLimit + 10 and truespeed <= SpeedLimit + 19 then
	        fineamount = Config.Fine
	        finelevel = '10mph Over Limit'
            if Config.AutoPay then
                TriggerServerEvent('esx_radars:FineDriver', fineamount)
            else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerId()), '', 'Speeding Ticket', fineamount)
            end
	    end
	
        if truespeed >= SpeedLimit + 20 and truespeed <= SpeedLimit + 29 then
	        fineamount = Config.Fine2
	        finelevel = '20mph Over Limit'
            if Config.AutoPay then
                TriggerServerEvent('esx_radars:FineDriver', fineamount)
            else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerPedId()), '', 'Speeding Ticket', fineamount)
            end
	    end
	
        if truespeed >= SpeedLimit + 30 and truespeed <= SpeedLimit + 39 then
	        fineamount = Config.Fine3
	        finelevel = '30mph Over Limit'
            if Config.AutoPay then
                TriggerServerEvent('esx_radars:FineDriver', fineamount)
            else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerPedId()), '', 'Speeding Ticket', fineamount)
            end
	    end
	
        if truespeed >= SpeedLimit + 40 and truespeed <= SpeedLimit + 50 then
	        fineamount = Config.Fine4
	        finelevel = '40mph Over Limit'
            if Config.AutoPay then
                TriggerServerEvent('esx_radars:FineDriver', fineamount)
            else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerPedId()), '', 'Speeding Ticket', fineamount)
            end
	    end
        
        exports.pNotify:SetQueueMax("left", 1)
        exports.pNotify:SendNotification({
            text = "<h2><center>Speed Camera</center></h2>" .. "</br>You've been issued a fine for speeding!</br>Plate Number: " .. plate .. "</br>Fine Amount: $" .. fineamount .. "</br>Violation: " .. finelevel .. "</br>Speed Limit: " .. maxspeed .. "</br>Your Speed: " ..mphspeed,
            type = "error",
            timeout = 9500,
            layout = "centerLeft",
            queue = "left"
        })
    end
end
