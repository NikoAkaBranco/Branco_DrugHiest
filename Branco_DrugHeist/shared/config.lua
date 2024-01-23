Config = {}

Config.misionstart = vector4(-48.45, -1823.46, 26.54, 4.26)   ---- Start npc location
Config.car = 'gburrito' --- lost van https://gtacars.net/gta5/gburrito
Config.heistCooldown = 120    ---- time befor another heist can be made (in minutes) (COMING SOOON)
Config.moneyisitem = true -- true if you use item as cash false if you dont
Config.moneyname = cash
Config.startcost =  10000   -- what it cost to start the hiest (can be nothing)
Config.npcmodel = 'g_m_m_chicold_01'  -- NPC model when mision start
Config.Startmsg = 'I sent you a Gps go there'
Config.lootmsg = 'Lootet Succes'
Config.reward = {
    { name = 'cokebaggy', amount = math.random(250,500)},
    { name = 'cash', amount = math.random(150000,350000)},
}



Config.outpost1 = vector4(1388.92, 2984.86, 40.87, 321.07)   ---- the car spawn location and npc's
Config.npcA = 15  -- How many npc the will spawn at the car
Config.guard = 'g_m_y_lost_03'
Config.npcweapon = 'WEAPON_ASSAULTRIFLE'   ---- the weapon the npc will carry