-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Log Fix)",
    LoadingTitle = "Syncing with Console Logs...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local Remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PromptDeveloperProduct")

-- 🛠️ Fungsi Sniper Universal
local function snipe(id)
    if Remote then
        print("🚀 Executing: " .. tostring(id))
        Remote:InvokeServer(id, "shop")
        Rayfield:Notify({Title = "Sent", Content = "Targeting: " .. tostring(id), Duration = 2})
    end
end

Tab:CreateSection("Snowman Bruteforce (Berdasarkan Log)")

-- Mode 1: Pake prefix md_ (yg muncul di console lu)
Tab:CreateButton({
    Name = "⛄ Mode MD (md_unit_snowman)",
    Callback = function() snipe("md_unit_snowman") end,
})

-- Mode 2: Pake prefix dp_wt_ (jalur Steam Trap)
Tab:CreateButton({
    Name = "⛄ Mode WT (dp_wt_unit_snowman)",
    Callback = function() snipe("dp_wt_unit_snowman") end,
})

-- Mode 3: ID Angka Langsung (Product ID)
Tab:CreateButton({
    Name = "⛄ Mode ID (3486360167)",
    Callback = function() snipe(3486360167) end,
})

Tab:CreateSection("Originals")
Tab:CreateButton({
    Name = "👁️ Eyeball",
    Callback = function() snipe("dp_unit_eyeball") end,
})

Rayfield:Notify({Title = "Ready", Content = "Coba Mode MD dulu, Gar!", Duration = 5})
