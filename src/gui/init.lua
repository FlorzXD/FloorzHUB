--// gui/init.lua

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()
local Window = Rayfield:CreateWindow({
    Name = "FLOORZHUB | Blox Fruits",
    LoadingTitle = "FloorzHUB",
    LoadingSubtitle = "by FlorzXD",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "FloorzHUBConfig", -- Saves settings
       FileName = "FloorzHUB"
    },
    Discord = {
       Enabled = false
    },
    KeySystem = false -- Will be enabled later
})

-- Notifications
Rayfield:Notify({
    Title = "FloorzHUB Loaded",
    Content = "Welcome back, legend.",
    Duration = 5,
    Image = nil
})

-- Tabs
local tabs = {
    Autofarm = Window:CreateTab("🧪 Autofarm"),
    Fruits = Window:CreateTab("🍎 Devil Fruits"),
    Teleport = Window:CreateTab("🌍 Teleport"),
    Shop = Window:CreateTab("🛒 Shop"),
    Misc = Window:CreateTab("🎮 Misc"),
    Settings = Window:CreateTab("⚙️ Settings"),
}

return {
    Rayfield = Rayfield,
    Tabs = tabs
}

