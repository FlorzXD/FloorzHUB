-- Settings Module
-- Handles configuration saving/loading

local Settings = {}
Settings.__index = Settings

function Settings.new(FloorzHUB)
    local self = setmetatable({}, Settings)
    self.FloorzHUB = FloorzHUB
    return self
end

function Settings:Load()
    -- Try to load saved settings
    local success, saved = pcall(function()
        return self.FloorzHUB.Services.HttpService:JSONDecode(
            readfile("FloorzHUB_Settings.json")
        )
    end)
    
    -- Return defaults if loading fails
    if not success then
        return {
            AutoFarm = {
                Enabled = false,
                Sea = "First Sea",
                AutoQuest = true,
                AutoAttack = true,
                AutoBestWeapon = true,
                AutoHop = true,
                AutoUpgrade = true,
                SelectedStats = {"Melee", "Defense"}
            },
            DevilFruit = {
                AutoSpin = false,
                AutoStore = true,
                AutoEat = false,
                FruitNotifier = true,
                AutoGrab = true,
                Blacklist = {}
            },
            Webhook = {
                Enabled = false,
                URL = "",
                SendFruits = true,
                SendLevels = true,
                SendScreenshots = false,
                SendBans = true
            },
            Misc = {
                AntiAFK = true,
                FPSBooster = false,
                WalkSpeed = 16,
                JumpPower = 50,
                Invisible = false
            }
        }
    end
    
    return saved
end

function Settings:Save()
    -- Save current configuration
    pcall(function()
        writefile("FloorzHUB_Settings.json", 
            self.FloorzHUB.Services.HttpService:JSONEncode(self.FloorzHUB.Config)
        )
    end)
end

return Settings
