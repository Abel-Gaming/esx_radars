ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_radars:FineDriver')
AddEventHandler('esx_radars:FineDriver', function(FineAmount)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney(Config.AutoPayAccount, FineAmount)
end)
