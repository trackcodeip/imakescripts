-- Servizi
local HttpService = game:GetService("HttpService")

-- Carica Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Firebase Realtime Database URL (sostituisci con il tuo)
local FirebaseURL = "https://your-firebase-project.firebaseio.com/usersCount.json"

-- Funzioni per contare utenti
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

-- Incrementa utenti e ottieni totale
local totalUsers = incrementUserCount()

-- Crea finestra principale
local Window = Rayfield:CreateWindow({
    Name = "Rich Hub",
    WindowTitle = "Rich Hub",
    LoadingTitle = "Script Hub",
    LoadingSubtitle = "By: Rich",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RichHubConfig",
        FileName = "MainConfig"
    },
    Discord = {
        Enabled = true,
        Invite = "97mkbSWwmQ",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Rich Hub | Key System 🔑",
        Subtitle = "Enter the key to continue",
        Note = "Get the key from our Discord.gg/n7AucXH96x",
        FileName = "RichHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"FreeAccess57"}
    }
})

-- ===== TAB: Read Me =====
local TabReadMe = Window:CreateTab("Read Me", 6034509995)
local SectionRead = TabReadMe:CreateSection("Credits")
TabReadMe:CreateLabel("Hub Created by: Rich")
TabReadMe:CreateLabel("Thanks for using my hub ❤️")
TabReadMe:CreateButton({
    Name = "Copy Discord Link 📋",
    Callback = function()
        setclipboard("https://discord.gg/97mkbSWwmQ")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord link copied to clipboard ✔️",
            Duration = 5
        })
    end
})

-- ===== TAB 2: Scripts =====
local TabGames = Window:CreateTab("Other Games 🎮", 6034509993)

local gameScripts = {
    ["99 Nights in the Forest"] = "https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader",
    ["Steal a Brain OP"] = "https://raw.githubusercontent.com/SolinTop/Steal-A-Brain-OP/refs/heads/main/Steal%20a%20brainrot",
    ["MM2"] = "https://raw.githubusercontent.com/Vax3478/Vax/refs/heads/main/mm2scripthubkeyless",
    ["Legends of Speed"] = "https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua",
    ["Pls Donate Auto Beg"] = "https://raw.githubusercontent.com/Azura83/PLZ-Donate/refs/heads/main/AzuraHub.lua",
    ["Rivals Script & Arsenal (Unpatched)"] = "https://soluna-script.vercel.app/main.lua",
    ["Blade Ball"] = "https://pastebin.com/raw/idKUExya",
    ["Bed Wars"] = "https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau",
    ["DeadRails"] = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails",
    ["Ninja Legends"] = "https://raw.githubusercontent.com/Zepsyy2/asd/main/Ninja%20Legends.lua",
    ["Brookhaven OP"] = "https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua",
    ["Da Hood"] = "https://rawscripts.net/raw/Universal-Script-FE-Dearsister-Pistol-Hat-Script-UNIVERSAL-DA-HOOD-SUPPORT-19428",
    ["Grow A Garden Test"] = "https://rawscripts.net/raw/Grow-a-Garden-Blackhub-Infinite-Sheckles-41369",
    ["Attack Zombie OP"] = "https://scriptblox.com/raw/Universal-Script-Desynced-43753",
    ["Forsaken"] = "https://rawscripts.net/raw/NOLI-Forsaken-Forsaken-script-47704",
    ["Demon Fall"] = "https://rawscripts.net/raw/Demonfall-DUPE-Solixhub-OP-Auto-Farms-Solara-Supported-25087",
    ["Blue Lock Rivals"] = "https://rawscripts.net/raw/2-HRS-Blue-Lock:-Rivals-CRISTIANO-RONALDO-MOVESET-42974",
    ["South Bronx The Trenches"] = "https://rawscripts.net/raw/South-Bronx:-The-Trenches-Best-FREE-Bronx-Script-Undetected-46496"
}

for name, url in pairs(gameScripts) do
    TabGames:CreateButton({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(url, true))()
        end
    })
end

-- ===== TAB 3: Universal Scripts =====
local TabUtils = Window:CreateTab("Utilities 🛠️", 6034509990)
local utilScripts = {
    ["Infinite Yield"] = "https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua",
    ["Chat Spy (Exclusive Version)"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
    ["Wall Hop"] = "https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"
}

for name, url in pairs(utilScripts) do
    TabUtils:CreateButton({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(url, true))()
        end
    })
end

-- ===== TAB 4: Soon ❗ =====
local TabIDK = Window:CreateTab("Soon ❗", 6034509992)
TabIDK:CreateButton({
    Name = "Mystery Script ❓",
    Callback = function()
        Rayfield:Notify({
            Title = "Coming Soon",
            Content = "This section will have random scripts!",
            Duration = 5
        })
    end
})
