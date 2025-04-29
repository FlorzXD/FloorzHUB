-- FloorzHUB Main Script
-- This is the core script that orchestrates all functionality

local FloorzHUB = {
    Version = "2.1.0",
    Config = {},
    Modules = {},
    Services = {
        Players = game:GetService("Players"),
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
        RunService = game:GetService("RunService"),
        TeleportService = game:GetService("TeleportService"),
        HttpService = game:GetService("HttpService"),
        TweenService = game:GetService("TweenService"),
        Lighting = game:GetService("Lighting"),
        Workspace = game:GetService("Workspace")
    },
    Player = game:GetService("Players").LocalPlayer,
    Character = nil,
    GUI = nil,
    Loaded = false
}

-- Load dependencies
local function LoadModule(name)
    local moduleUrl = "https://raw.githubusercontent.com/YourUsername/YourRepoName/main/src/" .. name
    local success, response = pcall(function()
        return game:HttpGet(moduleUrl, true)
    end)
    
    if success and response then
        local moduleScript = loadstring(response)
        if moduleScript then
            return moduleScript()
        end
    end
    warn("[FloorzHUB] Failed to load module: " .. name)
    return nil
end

-- Initialize core modules
FloorzHUB.Modules.GUI = LoadModule("gui/init.lua")
FloorzHUB.Modules.Settings = LoadModule("core/settings.lua")
FloorzHUB.Modules.Utilities = LoadModule("core/utilities.lua")
FloorzHUB.Modules.Constants = LoadModule("core/constants.lua")

-- Initialize feature modules
FloorzHUB.Modules.AutoFarm = LoadModule("modules/autofarm.lua")
FloorzHUB.Modules.Navigation = LoadModule("modules/navigation.lua")
FloorzHUB.Modules.DevilFruit = LoadModule("modules/devilfruit.lua")
FloorzHUB.Modules.Shop = LoadModule("modules/shop.lua")
FloorzHUB.Modules.Webhook = LoadModule("modules/webhook.lua")
FloorzHUB.Modules.Misc = LoadModule("modules/misc.lua")
FloorzHUB.Modules.Bypass = LoadModule("modules/bypass.lua")

-- Main initialization
function FloorzHUB:Init()
    if self.Loaded then return end
    
    -- Wait for player to load
    repeat task.wait() until self.Player.Character
    self.Character = self.Player.Character
    
    -- Setup character tracking
    self.Player.CharacterAdded:Connect(function(char)
        self.Character = char
        task.wait(1) -- Wait for character to fully load
        if self.Modules.AutoFarm then
            self.Modules.AutoFarm:CharacterUpdated()
        end
    end)
    
    -- Load settings
    self.Config = self.Modules.Settings:Load()
    
    -- Initialize GUI
    if self.Modules.GUI then
        self.GUI = self.Modules.GUI.new(self)
        self.GUI:CreateMainWindow()
    end
    
    -- Initialize modules
    for name, module in pairs(self.Modules) do
        if module.Init and type(module.Init) == "function" then
            module:Init(self)
        end
    end
    
    self.Loaded = true
    print(string.format("[FloorzHUB v%s] Initialized successfully!", self.Version))
end

-- Start the script
FloorzHUB:Init()

return FloorzHUB
