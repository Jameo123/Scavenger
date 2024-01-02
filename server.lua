RegisterNetEvent('cr_scav:Search')
AddEventHandler('cr_scav:Search', function()
    local xPlayer = Aspire.GetCharacterFromId(source)
    local xInventory = xPlayer.inventory
    local src = source
    if xInventory then
        reward = Items[math.random(1, #Items)]
        amount = math.random(2)
        label = Aspire.FetchItemLabel(reward)
        xInventory.addItem(reward, amount)
        TriggerClientEvent('cr_scav:client', src, label, label2, label3, label4)
    end
end)    
