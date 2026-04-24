-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then warn("Gagal load Rayfield!") return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Winter Fix)",
    LoadingTitle = "Applying WT Prefix...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")
local PromptDevProduct = RemoteFuncs:FindFirstChild("PromptDeveloperProduct")

-- 🛠️ Fungsi Tembak Developer Product (Format WT)
local function snipeWT(id)
    if PromptDevProduct then
        print("🎯 Sniping WT Product: " .. id)
        -- Format unpack args sesuai temuan lu
        local args = {id, "shop"}
        PromptDevProduct:InvokeServer(unpack(args))
        
        Rayfield:Notify({
            Title = "Target Acquired",
            Content = "Nembak " .. id .. " via WT Path!",
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote Missing!", Duration = 5})
    end
end

Tab:CreateSection("Winter / Event Units")

-- Tombol Snowman dengan pola dp_wt_
Tab:CreateButton({
    Name = "⛄ Buy Snowman (WT Path)",
    Callback = function() 
        snipeWT("dp_wt_unit_snowman") 
    end,
})

-- Tombol Steam Trap (Buat ngetes jalur yg udah pasti bisa)
Tab:CreateButton({
    Name = "⚙️ Buy Steam Trap (WT Path)",
    Callback = function() 
        snipeWT("dp_wt_unit_steam_trap") 
    end,
})

Tab:CreateSection("Original Units")

Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() 
        snipeWT("dp_unit_eyeball") -- Tetep pake fungsi yg sama
    end,
})

Rayfield:Notify({
    Title = "Ready",
    Content = "Jalur dp_wt_ Aktif, Gar!",
    Duration = 5
})
