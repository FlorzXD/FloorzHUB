-- FloorzHUB Loader
-- This is what users paste into their executor
-- It loads the main script from GitHub

local success, err = pcall(function()
    local repoUrl = "https://raw.githubusercontent.com/YourUsername/YourRepoName/main/src/main.lua"
    
    -- Check if already loaded
    if _G.FloorzHUB_Loaded then
        return print("[FloorzHUB] Already loaded!")
    end
    
    -- Load the main script
    local response = game:HttpGet(repoUrl, true)
    if not response then
        error("Failed to fetch main script")
    end
    
    -- Execute the main script
    local mainScript = loadstring(response)
    if mainScript then
        mainScript()
        _G.FloorzHUB_Loaded = true
        print("[FloorzHUB] Successfully loaded!")
    else
        error("Failed to load main script")
    end
end)

if not success then
    warn("[FloorzHUB Loader Error] " .. tostring(err))
end
