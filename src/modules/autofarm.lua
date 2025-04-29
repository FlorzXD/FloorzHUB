-- AutoFarm Module
-- Handles all autofarming functionality

local AutoFarm = {}
AutoFarm.__index = AutoFarm

function AutoFarm.new(FloorzHUB)
    local self = setmetatable({}, AutoFarm)
    self.FloorzHUB = FloorzHUB
    self.Enabled = false
    self.CurrentSea = "First Sea"
    self.CurrentMob = nil
    self.Farming = false
    return self
end

function AutoFarm:Init()
    -- Initialize autofarm settings
    self.Config = self.FloorzHUB.Config.AutoFarm or {
        Enabled = false,
        Sea = "First Sea",
        AutoQuest = true,
        AutoAttack = true,
        AutoBestWeapon = true,
        AutoHop = true,
        AutoUpgrade = true,
        SelectedStats = {"Melee", "Defense"}
    }
    
    -- Save reference to module
    self.FloorzHUB.Modules.AutoFarm = self
    
    -- Start main loop
    task.spawn(function()
        while task.wait(0.1) do
            if self.Enabled then
                self:FarmLoop()
            end
        end
    end)
end

function AutoFarm:Toggle(value)
    self.Enabled = value
    self.Config.Enabled = value
    self.FloorzHUB.Modules.Settings:Save()
    
    if value then
        self.FloorzHUB.Modules.GUI:Notify("Autofarm", "Autofarm enabled", "success")
    else
        self.FloorzHUB.Modules.GUI:Notify("Autofarm", "Autofarm disabled", "warning")
    end
end

function AutoFarm:SetSea(sea)
    if table.find({"First Sea", "Second Sea", "Third Sea", "Fourth Sea"}, sea) then
        self.CurrentSea = sea
        self.Config.Sea = sea
        self.FloorzHUB.Modules.Settings:Save()
        
        self.FloorzHUB.Modules.GUI:Notify("Autofarm", "Set sea to: " .. sea, "info")
    end
end

function AutoFarm:FarmLoop()
    if self.Farming then return end
    self.Farming = true
    
    -- Main farming logic
    local success, err = pcall(function()
        -- 1. Check if player has a quest
        if not self:HasQuest() and self.Config.AutoQuest then
            self:GetNewQuest()
        end
        
        -- 2. Find nearest target mob
        local target = self:FindNearestMob()
        if not target and self.Config.AutoHop then
            self:ServerHop()
            return
        end
        
        -- 3. Teleport to mob if needed
        if target and self:DistanceTo(target) > 50 then
            self:TeleportTo(target)
        end
        
        -- 4. Select best weapon
        if self.Config.AutoBestWeapon then
            self:SelectBestWeapon()
        end
        
        -- 5. Attack mob
        if target and self.Config.AutoAttack then
            self:AttackMob(target)
        end
        
        -- 6. Upgrade stats
        if self.Config.AutoUpgrade then
            self:UpgradeStats()
        end
    end)
    
    if not success then
        warn("[Autofarm Error] " .. tostring(err))
    end
    
    self.Farming = false
end

-- Other autofarm methods would be implemented here
-- (HasQuest, GetNewQuest, FindNearestMob, DistanceTo, TeleportTo, SelectBestWeapon, AttackMob, UpgradeStats, ServerHop, etc.)

function AutoFarm:CharacterUpdated()
    -- Handle character respawns
    if self.Enabled then
        self.FloorzHUB.Modules.GUI:Notify("Autofarm", "Character respawned - continuing farm", "info")
    end
end

return AutoFarm
