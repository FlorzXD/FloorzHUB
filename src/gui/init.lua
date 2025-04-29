-- FloorzHUB GUI Module
-- Creates the modern, sleek interface

local GUI = {}
GUI.__index = GUI

-- Colors
local Colors = {
    Background = Color3.fromRGB(20, 25, 30),
    Primary = Color3.fromRGB(0, 162, 255),
    Secondary = Color3.fromRGB(40, 45, 50),
    Text = Color3.fromRGB(240, 240, 240),
    Success = Color3.fromRGB(0, 200, 83),
    Warning = Color3.fromRGB(255, 171, 0),
    Error = Color3.fromRGB(255, 55, 80)
}

function GUI.new(FloorzHUB)
    local self = setmetatable({}, GUI)
    self.FloorzHUB = FloorzHUB
    self.Objects = {}
    self.Notifications = {}
    return self
end

function GUI
