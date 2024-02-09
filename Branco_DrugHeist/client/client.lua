QBCore = exports["qb-core"]:GetCoreObject()

Citizen.CreateThread(function()
    Wait(500)
    local npcModel = Config.npcmodel -- Replace this with the desired NPC model
    local npcCoords = Config.misionstart -- Replace x, y, z with the desired coordinates

    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Citizen.Wait(100)
    end

    local npcPed = CreatePed(4, npcModel, npcCoords.x, npcCoords.y, npcCoords.z - 0.5, 0.0, false, false)
    Wait(500)

    SetEntityInvincible(npcPed, true)
    FreezeEntityPosition(npcPed, true)
    TaskStartScenarioInPlace(npcPed, "WORLD_HUMAN_STAND_IMPATIENT", 1, true)

    exports['qb-target']:AddCircleZone("Drugheist", npcCoords, 1.5, {
        name = "Drugheist",
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "Branco:client:start_menu",
                icon = 'fa-solid fa-comment',
                label = 'Talk to Mike',
                targeticon = 'fa-solid fa-people-group',
            },
        },
        distance = 2.5,
    })
end)
RegisterNetEvent("Branco:client:start_menu", function()
    exports['qb-menu']:openMenu({
      {
          header = 'Talke Whit Mike',
          icon = 'fa-solid fa-b',
          isMenuHeader = true, -- Set to true to make a nonclickable title
      },
      {
          header = 'Do you have a job for me',
          txt = 'Remeber its not for fun',
          icon = 'fa-duotone fa-comments',
          params = {
              event = 'start',
              args = {
          message = 'This was called by clicking a button'
              }
          }
      },
  })
end)
 
RegisterNetEvent("Spawnnpc", function ()
    local guard = Config.guard -- Replace this with the desired NPC model
    local npcCoords = Config.outpost1 -- Replace x, y, z with the desired coordinates
    local Weapon = Config.npcweapon
    local numNPCs = Config.npcA
    
	RequestModel(guard)
    while not HasModelLoaded(guard) do
        Citizen.Wait(100)
    end
    for i = 1, numNPCs do
    local offset = vector3(math.random(-3,3) * i, math.random(-3,3) * i, math.random(-3,3) * i)
    local npcPed = CreatePed(4, guard, npcCoords.x + offset.x, npcCoords.y + offset.y, npcCoords.z + offset.z, 0.0, false, false)
   
    Wait(500)
	GiveWeaponToPed(npcPed, Weapon, 1000, true, true)
    local ped = Config.guard
    TaskCombatHatedTargetsAroundPed(ped, 25, 0)
    end   
end)
    
--[[RegisterNetEvent("lootcarbox", function ()
    local npcCoords = Config.outpost1
    TriggerEvent("lootcarbox")
    exports['qb-target']:AddCircleZone("lootcarbox", npcCoords, 4.5, {
        name = "lootcarbox",
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "lootcar",
                icon = 'fa-solid fa-comment',
                label = 'loot car',
                targeticon = 'fa-solid fa-people-group',
            },
        },
        distance = 4.5,
    })
end)]]

