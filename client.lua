local player = PlayerPedId()
local hash = GetHashKey('WEAPON_KNIFE')

RegisterNetEvent('cr_scav:client')
AddEventHandler('cr_scav:client', function(label)
    label = label
    itemFound = label
end)

CreateThread(function()
while true do
    local height = GetEntityHeightAboveGround(player)
    local playerPos = GetEntityCoords(player)
    Wait(0)
if IsPedSwimmingUnderWater(player) and HasPedGotWeapon(player, hash, false) and height < 1 then
    Draw3DText(playerPos.x, playerPos.y, playerPos.z - 0.5, '[G] Scavenge', 1)
if IsPedSwimmingUnderWater(player) and HasPedGotWeapon(player, hash, false) and height < 1 and IsControlJustReleased(0, 47) then
    local spotCooldown = GetEntityCoords(player)
    Aspire.Animation.LoadDict("mini@triathlon")
    TaskPlayAnim(PlayerPedId(), "mini@triathlon", "rummage_bag", 8.0, -8.0, -1, 0, 0.0, false, false, false)
    local finished = exports["ag_taskbar"]:taskBar(5000, "Scavenging")
    TriggerServerEvent('cr_scav:Search')
    Wait(1000)
    text = 'You found a ' .. itemFound .. ''
    TriggerEvent('ag_ui:SendNotification', text, {timeout=10000})
    Wait(5000)
end
end
end
end)

function Draw3DText(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(1, 0.35)
    SetTextFont(6)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEdge(3, 0, 0, 0, 255)
    SetTextOutline() 
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function GetDistance(playerCoords, CooldownSpot)
    return #(playerCoords - CooldownSpot)
end

