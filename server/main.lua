-------------------------------------------------------------------------------------▌
--                      Script Created by LANEXA Industries                        --▌
--                This Script is submitted at no copyright and you                 --▌
--                       Can pick this script but please                           --▌
--                 keep the credits and do not sell this script                    --▌
-------------------------------------------------------------------------------------▌

local credit =
[[ 
  ^2//   
  ^2||^5      _
  ^2||^5     | |        _     ___   _   ___  __  __    _
  ^2||^5     | |       /_\   |   \ | | | __| \ \/ /   /_\
  ^2||^5     | |___   / _ \  | |\ \| | | __|  >  <   / _ \
  ^2||^5     |_____| /_/ \_\ |_| \___| |___| /_/\_\ /_/ \_\
  ^2||^5     
  ^2||^5     
  ^2||^1               Created by LNX_lucas
  ^2\\^7]]

print( credit )

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local cl = {}

local function IseventCl(_src)
	for _, id in pairs(cl) do
		if (_src == id) then
			return true
		end
	end
	return false
end

local function adCl(_src)
	table.insert(cl, _src)
end

local function removeCl(_src)
	for idx, id in pairs(cl) do
		if(_src == id) then
			cl[idx] = nil
		end
	end
end

local function lnxevent(eventname, func)
	RegisterServerEvent(eventname)
	AddEventHandler(eventname, function(...)
			_src = source
			if (IseventCl(_src)) then

					DropPlayer(_src, "pk t'essaye d'exploit avec le /porter")  
					print(('%s à exploit avec le /porter'):format(GetPlayerName(_src)))
					return
			end
			adCl(_src)
			SetTimeout(500, function()
					removeCl(_src)
			end)
			func(...)
	end)
end

lnxevent("cmg2_animations:sync", function(animationLib, animation, animation2, distans, distans2, height, targetSrc, length, spin, controlFlagSrc, controlFlagTarget, animFlagTarget)
	if targetSrc == -1 then
		DropPlayer(_src, "pk t'essaye d'exploit avec le /porter")
	else
		TriggerClientEvent('cmg2_animations:syncTarget', targetSrc, source, animationLib, animation2, distans, distans2, height, length, spin, controlFlagTarget, animFlagTarget)
		TriggerClientEvent('cmg2_animations:syncMe', source, animationLib, animation, length, controlFlagSrc, animFlagTarget)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('cmg2_animations:stop')
AddEventHandler('cmg2_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg2_animations:cl_stop', targetSrc)
end)

RegisterServerEvent('cmg3_animations:sync')
AddEventHandler('cmg3_animations:sync', function(animationLib, animationLib2, animation, animation2, distans, distans2, height, targetSrc, length, spin, controlFlagSrc, controlFlagTarget, animFlagTarget, attachFlag)
	TriggerClientEvent('cmg3_animations:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length, spin, controlFlagTarget, animFlagTarget, attachFlag)
	TriggerClientEvent('cmg3_animations:syncMe', source, animationLib, animation, length, controlFlagSrc, animFlagTarget)
end)

RegisterServerEvent('cmg3_animations:stop')
AddEventHandler('cmg3_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg3_animations:cl_stop', targetSrc)
end)