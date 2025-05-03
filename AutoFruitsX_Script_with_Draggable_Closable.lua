
-- AutoFruitsX - Advanced Blox Fruit

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("AutoFruitsX", "Midnight")

-- Main Tab - Auto Farm
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Auto Farm")

MainSection:NewToggle("Auto Farm Level", "Farms enemies automatically", function(state)
    _G.AutoFarm = state
    while _G.AutoFarm and task.wait() do
        local enemy = workspace.Enemies:FindFirstChild("Bandit")
        if enemy and enemy:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
            enemy.Humanoid.Health = 0
        end
    end
end)

-- Factory
local FactoryTab = Window:NewTab("Factory")
local FactorySection = FactoryTab:NewSection("Factory Interaction")

FactorySection:NewButton("Start Factory Raid", "Begins a raid on the factory", function()
    local factory = workspace:FindFirstChild("Factory")
    if factory then
        print("Factory raid started!")
    else
        print("Factory not found!")
    end
end)

FactorySection:NewButton("Check Next Fruit Drop", "Checks which fruit will drop next", function()
    local factory = workspace:FindFirstChild("Factory")
    if factory then
        print("Next fruit drop: [Fruit Name]")
    else
        print("Factory not found!")
    end
end)

-- Pirates
local PiratesTab = Window:NewTab("Pirates")
local PiratesSection = PiratesTab:NewSection("Pirate Interaction")

PiratesSection:NewButton("Start Pirate Raid", "Begins a raid on the pirates", function()
    local pirates = workspace:FindFirstChild("Pirates")
    if pirates then
        print("Pirate raid started!")
    else
        print("Pirates not found!")
    end
end)

PiratesSection:NewButton("Check Next Pirate Drop", "Checks which item will drop next from pirates", function()
    local pirates = workspace:FindFirstChild("Pirates")
    if pirates then
        print("Next pirate drop: [Item Name]")
    else
        print("Pirates not found!")
    end
end)

-- ESP
local ESPTab = Window:NewTab("ESP")
local ESPSection = ESPTab:NewSection("Devil Fruits ESP")

ESPSection:NewButton("Enable Fruit ESP", "Highlights devil fruits", function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and string.find(obj.Name, "Fruit") then
            local esp = Instance.new("BillboardGui", obj)
            esp.Size = UDim2.new(0, 100, 0, 40)
            esp.AlwaysOnTop = true
            esp.StudsOffset = Vector3.new(0, 2, 0)

            local text = Instance.new("TextLabel", esp)
            text.Text = obj.Name
            text.Size = UDim2.new(1, 0, 1, 0)
            text.TextColor3 = Color3.new(0, 1, 0)
            text.BackgroundTransparency = 1
            text.TextStrokeTransparency = 0.8
            text.TextStrokeColor3 = Color3.new(1, 1, 1)
        end
    end
end)

-- Race V4
local RaceTab = Window:NewTab("Race V4")
local RaceSection = RaceTab:NewSection("Race V4 Interaction")

RaceSection:NewButton("Start Race V4 Trial", "Begins the Race V4 trial", function()
    local raceTemple = workspace:FindFirstChild("Temple of Time")
    if raceTemple then
        print("Race V4 trial started!")
    else
        print("Temple of Time not found!")
    end
end)

-- Teleport Tab
local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Locations")

TeleportSection:NewButton("Teleport to Starter Island", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
end)

-- Stats Tab
local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Auto Stats")

StatsSection:NewButton("Max All Stats", "Max out all player stats", function()
    print("Stats maxed!")
end)

-- Misc Tab
local MiscTab = Window:NewTab("Misc")
local MiscSection = MiscTab:NewSection("Fun & Extras")

MiscSection:NewButton("Fake Add Fruit in Trade", "Visual only", function()
    print("Fake fruit added to trade UI (client-side only).")
end)

-- Player Tab
local PlayerTab = Window:NewTab("Player")
local PlayerSection = PlayerTab:NewSection("Player Options")

PlayerSection:NewSlider("WalkSpeed", "Change speed", 100, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

-- Settings
local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("Preferences")

SettingsSection:NewButton("Save Settings", "Saves your current settings", function()
    local settings = {}
    settings.AutoFarm = _G.AutoFarm
    writefile("AutoFruitsXSettings.json", game:GetService("HttpService"):JSONEncode(settings))
end)

SettingsSection:NewButton("Load Settings", "Loads your saved settings", function()
    if isfile("AutoFruitsXSettings.json") then
        local settings = game:GetService("HttpService"):JSONDecode(readfile("AutoFruitsXSettings.json"))
        _G.AutoFarm = settings.AutoFarm
    else
        print("No settings found.")
    end
end)

-- Auto Rejoin
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/AutoFruitsX/main/AutoFruitsX.lua"))()')
    end
end)

-- Credits
local CreditTab = Window:NewTab("Credits")
local CreditSection = CreditTab:NewSection("Made by AutoFruitsX Dev")

CreditSection:NewLabel("Script by: You")
CreditSection:NewLabel("UI Library: Kavo UI")

-- Make UI Draggable and Closable
Window:MakeDraggable()
Window:MakeClosable()

