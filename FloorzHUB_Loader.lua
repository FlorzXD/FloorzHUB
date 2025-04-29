--// FloorzHUB Loader by ChatGPT 💀
local repoURL = "https://raw.githubusercontent.com/FlorzXD/FloorzHUB/main/src/main.lua"

-- Show notification on script load (Synapse or KRNL supported)
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "FloorzHUB",
        Text = "Loading script...",
        Duration = 5
    })
end)

-- Fetch and load the main script
local success, result = pcall(function()
    return loadstring(game:HttpGet(repoURL, true))()
end)

if not success then
    warn("[FloorzHUB Loader] Failed to load main script:", result)
    -- Show error in the output window
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "FloorzHUB",
            Text = "Error loading script! Check console for details.",
            Duration = 10
        })
    end)
    -- Printing detailed error in output
    print("[ERROR DETAILS] " .. tostring(result))
end

