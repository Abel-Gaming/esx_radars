ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_radars:FineDriver')
AddEventHandler('esx_radars:FineDriver', function(FineAmount)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney(Config.AutoPayAccount, FineAmount)
end)

RegisterServerEvent('esx_radars:DiscordWebhook')
AddEventHandler('esx_radars:DiscordWebhook', function(FineLevel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerName = xPlayer.getName()
	PerformHttpRequest(Config.DiscordWebHook, function(err, text, headers) end, 'POST', json.encode(
		{
			username = 'Speed Camera', 
			content = "" .. xPlayerName .. " has been clocked by a speed camera doing " .. FineLevel
		}
	), { ['Content-Type'] = 'application/json' })
end)