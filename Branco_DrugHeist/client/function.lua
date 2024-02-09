QBCore = exports["qb-core"]:GetCoreObject()


RegisterNetEvent("start", function()    
    local player = PlayerPedId()   --- get the id of the player 
    local gpsDestination = Config.outpost1
  
	FreezeEntityPosition(player, true) -- make the progressbar only activate on the player there is using it 
	QBCore.Functions.Progressbar("drug-", "Talking whit mike ", 8000, false, true, { -- ("Just keep it", "Message", time, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "anim@amb@board_room@supervising@",
		anim = "think_01_hi_amy_skater_01",
		flags = 16,
	}, {}, {}, function() -- Done
		FreezeEntityPosition(player, false)  -- unfreezes the player 
       
        exports['okokNotify']:Alert('Branco DrugHiest', 'Wait for my call', 15000, 'info', true)
       
        Wait(50000)
		TriggerServerEvent("start")  -- trigger the event to get the items 
        SetNewWaypoint(gpsDestination)
    --  exports['qb-notify']:Notify(Config.Startmsg, "success", 100000000)  
    exports['okokNotify']:Alert('Branco DrugHiest', Config.Startmsg, 15000, 'phonemessage', true)
      TriggerEvent("Spawncar")
	  TriggerEvent("Spawnnpc")
    
	end, function() -- Cancel
		ClearPedTasksImmediately(player)   -- cancel the event the player is doing if they escape the progressbar xD
		FreezeEntityPosition(player, false)   -- unfreezes the player 
    
    end)
end)

local function SetCarItemsInfo()
    local items = {}
    for _, item in pairs(Config.reward) do
        local itemInfo = QBCore.Shared.Items[item.name:lower()]
        if itemInfo then
            items[#items + 1] = {
                name = itemInfo.name,
                amount = tonumber(item.amount),
                info = item.info or {},
                label = itemInfo.label,
                description = itemInfo.description or '',
                weight = itemInfo.weight,
                type = itemInfo.type,
                unique = itemInfo.unique,
                useable = itemInfo.useable,
                image = itemInfo.image,
                slot = #items + 1,
            }
        end
    end
    Config.reward = items
end


RegisterNetEvent("Spawncar", function()  
QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
	local veh = NetToVeh(netId)
	SetCarItemsInfo()
    SetVehicleDoorsLockedForAllPlayers(veh, true)
	--TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
	TriggerServerEvent('inventory:server:addTrunkItems', QBCore.Functions.GetPlate(veh), Config.reward) 
    
	SetVehicleEngineOn(veh, true, true)
end, Config.car, Config.outpost1, false)
end)



