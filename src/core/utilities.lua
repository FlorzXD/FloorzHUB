-- Utilities Module
-- Shared utility functions

local Utilities = {}
Utilities.__index = Utilities

function Utilities.new(FloorzHUB)
    local self = setmetatable({}, Utilities)
    self.FloorzHUB = FloorzHUB
    return self
end

-- Teleport to position (with bypass if available)
function Utilities:Teleport(position)
    if self.FloorzHUB.Modules.Bypass then
        self.FloorzHUB.Modules.Bypass:Teleport(position)
    else
        self.FloorzHUB.Player.Character:SetPrimaryPartCFrame(CFrame.new(position))
    end
end

-- Get distance between two positions
function Utilities:GetDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

-- Get player's current island
function Utilities:GetCurrentIsland()
    -- Implementation would check player position against island boundaries
    return "Unknown"
end

-- Other utility functions would go here
-- (GetNearestNPC, GetPlayerLevel, GetEquippedWeapons, etc.)

return Utilities
