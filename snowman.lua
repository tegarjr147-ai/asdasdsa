-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (The Last Stand)",
    LoadingTitle = "Bruteforcing All Winter IDs...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("Snowman Fix", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemotePrompt = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("PromptDeveloperProduct")
local RemoteIndex = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("IndexClick")

-- 🛠️ Fungsi Multi-Snipe (Nembak Brutal)
local function megaSnipe()
    -- 1. Kita pancing pake Index dulu
    RemoteIndex:FireServer("unit_snowman")
    task.wait(0.2)
    
    -- 2. Kita tembak semua kemungkinan ID yang masuk akal
    local ids = {
        "dp_wt_unit_snowman",  -- Pola Steam Trap
        "dp_wt_snowman",       -- Pola tanpa 'unit'
        "dp_unit_snowman",     -- Pola standard
        3486360167,            -- ID murni dari link lu
        "unit_snowman"         -- Nama murni
    }
    
    for _, id in pairs(ids) do
        print("🚀 Testing Snowman ID: " .. tostring(id))
        RemotePrompt:InvokeServer(id, "shop")
    end
    
    Rayfield:Notify({
        Title = "Mega-Shot Sent",
        Content = "Udah ditembak semua jalur, Gar!",
        Duration = 3
    })
end

Tab:CreateSection("Special Snowman Fix")

Tab:CreateButton({
    Name = "⛄ FORCE SNIPE SNOWMAN (ALL PATHS)",
    Callback = function()
        megaSnipe()
    end,
})

Tab:CreateSection("Originals (Pasti Bisa)")

Tab:CreateButton({
    Name = "👁️ Buy Eyeball",
    Callback = function() 
        RemotePrompt:InvokeServer("dp_unit_eyeball", "shop") 
    end,
})

Tab:CreateButton({
    Name = "⚙️ Buy Steam Trap",
    Callback = function() 
        RemotePrompt:InvokeServer("dp_wt_unit_steam_trap", "shop") 
    end,
})

Rayfield:Notify({Title = "Ready", Content = "Hajar Snowmannya, Gar!", Duration = 5})
