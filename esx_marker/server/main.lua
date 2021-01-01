local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

ESX.RegisterServerCallback("esx_marker:fetchUserRank", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

RegisterServerEvent('tpmlog')
AddEventHandler('tpmlog', function(text)
	local steamname = GetPlayerName(source)
    local leave = {
		{
			["color"] = "15158332",
			["title"] = "**"..steamname.."** /tpm komutunu kullandı.",
		}
	}
PerformHttpRequest("https://discordapp.com/api/webhooks/716141871600238632/zjkX-49nOZ1b4Lqscafeh_z7xLklshSI6OD2aqwcy1bVaKhyxKtOypKC0hy4Cmjd_rmB", function(err, text, headers) end, 'POST', json.encode({username = "Project X", embeds = leave}), { ['Content-Type'] = 'application/json' })
end)

