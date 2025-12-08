-- ======================================
-- VECTOR HUB MAIN (AK-STYLE)
-- ======================================

-- Servizi
local HttpService = game:GetService("HttpService")

-- Carica Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ==========================
-- FIREBASE USER COUNTER
-- ==========================
local FirebaseURL = "https://your-firebase-project.firebaseio.com/usersCount.json"

local function getUserCount()
    local success, response = pcall(function()
        return HttpService:GetAsync(FirebaseURL)
    end)
    if success then
        local data = HttpService:JSONDecode(response)
        return tonumber(data.count) or 0
    else
        return 0
    end
end

local function incrementUserCount()
    local currentCount = getUserCount()
    local newCount = currentCount + 1
    pcall(function()
        HttpService:PutAsync(FirebaseURL, HttpService:JSONEncode({count = newCount}))
    end)
    return newCount
end

local totalUsers = incrementUserCount()

-- ==========================
-- CREA FINESTRA PRINCIPALE
-- ==========================
local Window = Rayfield:CreateWindow({
    Name = "Vector Hub",
    WindowTitle = "Vector Hub",
    LoadingTitle = "Script Hub",
    LoadingSubtitle = "By: Bogie",
    ConfigurationSaving = { Enabled = true, FolderName = "VectorHubConfig", FileName = "MainConfig" },
    Discord = { Enabled = true, Invite = "RRuyhrX37U", RememberJoins = true },
    KeySystem = true,
    KeySettings = {
        Title = "Vector Hub | Key System",
        Subtitle = "Enter the key to continue",
        Note = "Get the key from our Discord!",
        FileName = "VectorHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"FreeAccess57"}
    }
})

-- ==========================
-- TAB: Read Me
-- ==========================
local TabReadMe = Window:CreateTab("Read Me", 6034509995)
TabReadMe:CreateSection("Credits")
TabReadMe:CreateLabel("Hub Created by: Bogie")
TabReadMe:CreateLabel("Thanks for using Vector Hub ❤️")
TabReadMe:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/RRuyhrX37U")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord link copied to clipboard!",
            Duration = 5
        })
    end
})

-- ==========================
-- TAB: Games
-- ==========================
local TabGames = Window:CreateTab("Games", 6034509993)

local GameScripts = {
    ["99 Nights in the Forest"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/99Nights2",
    ["Steal a Brain OP"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/AutoFISH",
    ["MM2"] = "https://raw.githubusercontent.com/Vax3478/Vax/refs/heads/main/mm2scripthubkeyless",
    ["Legends of Speed"] = "https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua",
    ["Pls Donate Auto Beg"] = "https://raw.githubusercontent.com/Azura83/PLZ-Donate/refs/heads/main/AzuraHub.lua",
    ["Rivals Script & Arsenal"] = "https://soluna-script.vercel.app/main.lua",
    ["Blade Ball"] = "https://pastebin.com/raw/idKUExya",
    ["Bed Wars"] = "https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau",
    ["DeadRails"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/DeadRails",
    ["Ninja Legends"] = "https://raw.githubusercontent.com/Zepsyy2/asd/main/Ninja%20Legends.lua",
    ["Brookhaven OP"] = "https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua",
    ["Da Hood"] = "https://rawscripts.net/raw/Universal-Script-FE-Dearsister-Pistol-Hat-Script-UNIVERSAL-DA-HOOD-SUPPORT-19428",
    ["Grow A Garden Test"] = "https://rawscripts.net/raw/Grow-a-Garden-Blackhub-Infinite-Sheckles-41369",
    ["Attack Zombie OP"] = "https://scriptblox.com/raw/Universal-Script-Desynced-43753",

    -- ⭐ NUOVI SCRIPT AGGIUNTI ⭐
    ["Forsaken"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/Forsaken",
    ["Ability Wars"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/AbilityWars",
    ["Basketball Legends"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/BasketballLegends",
    ["Flick"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/Flick",
    ["Prison Life"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/PrisonLife",
    ["LuckyBlocks"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/LuckyBlocks",
    ["Plants Vs Brainrot"] = "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/PlantsVsBrainrot",

    ["Demon Fall"] = "https://rawscripts.net/raw/Demonfall-DUPE-Solixhub-OP-Auto-Farms-Solara-Supported-25087",
    ["Blue Lock Rivals"] = "https://rawscripts.net/raw/2-HRS-Blue-Lock:-Rivals-CRISTIANO-RONALDO-MOVESET-42974",
    ["South Bronx The Trenches"] = "https://rawscripts.net/raw/South-Bronx:-The-Trenches-Best-FREE-Bronx-Script-Undetected-46496"
}

for name, link in pairs(GameScripts) do
    TabGames:CreateButton({
        Name = name,
        Callback = function()
            Rayfield:Notify({
                Title = "Loading...",
                Content = "Executing "..name.."!",
                Duration = 3
            })
            loadstring(game:HttpGet(link, true))()
        end
    })
end

-- ==========================
-- TAB: Utilities
-- ==========================
local TabUtils = Window:CreateTab("Utilities", 6034509990)

local UtilityScripts = {
    ["Infinite Yield"] = "https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua",
    ["Chat Spy"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
    ["Wall Hop"] = "https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"
}

for name, link in pairs(UtilityScripts) do
    TabUtils:CreateButton({
        Name = name,
        Callback = function()
            Rayfield:Notify({
                Title = "Loading...",
                Content = "Executing "..name.."!",
                Duration = 3
            })
            loadstring(game:HttpGet(link, true))()
        end
    })
end

-- ==========================
-- TAB: Update (Random Script)
-- ==========================
local TabUpdate = Window:CreateTab("Update", 6034509992)

local MysteryScripts = {
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/99Nights2",
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/Forsaken",
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/AbilityWars",
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/BasketballLegends",
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/Flick",
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/PrisonLife",
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/LuckyBlocks",
    "https://raw.githubusercontent.com/scripture2025/FlashHub/refs/heads/main/PlantsVsBrainrot"
}

TabUpdate:CreateButton({
    Name = "Random Script",
    Callback = function()
        local randIndex = math.random(1, #MysteryScripts)
        local scriptLink = MysteryScripts[randIndex]
        Rayfield:Notify({
            Title = "Random Script",
            Content = "Executing random update script!",
            Duration = 4
        })
        loadstring(game:HttpGet(scriptLink, true))()
    end
})
