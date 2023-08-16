local blips = {
    { name = "Regular Blip 1", sprite = 1, x = 100.0, y = 100.0, premium = false },
    { name = "Regular Blip 2", sprite = 2, x = 200.0, y = 200.0, premium = false },
    { name = "Premium Blip 1", sprite = 3, x = 300.0, y = 300.0, premium = true },
    { name = "Premium Blip 2", sprite = 4, x = 400.0, y = 400.0, premium = true },
}

-- Event handler for when the player spawns
RegisterNetEvent("playerSpawned")
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("checkPremiumAndCreateBlips")
end)

-- Event handler for creating blips based on premium status
RegisterNetEvent("createBlipsBasedOnPremium")
AddEventHandler("createBlipsBasedOnPremium", function(premiumStatus)
    createBlipsForPlayer(premiumStatus)
end)

-- Function to create blips for the player
function createBlipsForPlayer(premiumStatus)
    for _, blipData in pairs(blips) do
        if not blipData.premium or premiumStatus then
            local blip = AddBlipForCoord(blipData.x, blipData.y, 0.0)
            SetBlipSprite(blip, blipData.sprite)
            SetBlipDisplay(blip, 2)
            SetBlipScale(blip, 1.0)
            SetBlipColour(blip, 1)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blipData.name)
            EndTextCommandSetBlipName(blip)
        end
    end
end

