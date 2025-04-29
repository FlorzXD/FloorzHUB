--// src/main.lua — FloorzHUB Self-Contained GUI & Debug

-- 1) Debug print on load
print("[FloorzHUB] main.lua loaded!")

-- 2) Quick notification
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "FloorzHUB",
        Text = "Main script started!",
        Duration = 4
    })
end)

-- 3) Load Rayfield UI library
local ok, Rayfield = pcall(function()
    return loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua",
    true))()
end)
if not ok then
    warn("[FloorzHUB] Failed to load Rayfield UI:", Rayfield)
    return
end

-- 4) Create the main window
local Window = Rayfield:CreateWindow({
    Name = "FLOORZHUB | Blox Fruits",
    LoadingTitle = "FloorzHUB",
    LoadingSubtitle = "by FlorzXD",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FloorzHUBConfig",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- 5) Helper for in-game notifications
local function notify(content)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "FloorzHUB",
            Text = content,
            Duration = 3
        })
    end)
end

notify("GUI loaded successfully!")

-- 6) Create tabs
local AutofarmTab = Window:CreateTab("🧪 Autofarm")
local FruitsTab   = Window:CreateTab("🍎 Devil Fruits")
local TeleportTab = Window:CreateTab("🌍 Teleport")
local ShopTab     = Window:CreateTab("🛒 Shop")
local MiscTab     = Window:CreateTab("🎮 Misc")
local SettingsTab = Window:CreateTab("⚙️ Settings")

-- 7) Placeholder labels (we’ll replace these with real controls next)
AutofarmTab:CreateLabel("Autofarm features coming soon...")
FruitsTab:CreateLabel("Devil Fruit features coming soon...")
TeleportTab:CreateLabel("Teleportation tools coming soon...")
ShopTab:CreateLabel("Shop automation coming soon...")
MiscTab:CreateLabel("Miscellaneous tools coming soon...")
SettingsTab:CreateLabel("Configure your FloorzHUB settings here.")

print("[FloorzHUB] GUI and placeholders initialized!")
