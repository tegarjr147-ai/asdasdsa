-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusTools/Rayfield/main/source'))() 
end)

if not success then warn("Gagal load Rayfield!") return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Hybrid Fix)",
    LoadingTitle = "Applying Corrupted ID...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")

-- 🛠️ Fungsi A: DevProduct (Eyeball/Coil)
local function snipeProduct(id)
    local PromptDevProduct = RemoteFuncs:FindFirstChild("PromptDeveloperProduct")
    if PromptDevProduct then
        print("🎯 Sniping Product: " .. id)
        PromptDevProduct:InvokeServer(id, "shop")
        
        Rayfield:Notify({
            Title = "Target Acquired",
            Content = "Nembak " .. id .. " via DevProduct!",
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote PromptDevProduct ilang!", Duration = 5})
    end
end

-- 🛠️ Fungsi B: Direct Buy (Snowman)
local function snipeDirect(unitName)
    local BuyUnitRemote = RemoteFuncs:FindFirstChild("BuyUnitWithRobux")
    if BuyUnitRemote then
        print("🔥 Direct Buying: " .. unitName)
        BuyUnitRemote:InvokeServer(unitName)
        
        Rayfield:Notify({
            Title = "Direct Buy Sent",
            Content = "Nembak " .. unitName .. " via Direct Remote!",
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote BuyUnitWithRobux ilang!", Duration = 5})
    end
end

Tab:CreateSection("Exclusive Units (Prompt)")

Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() 
        snipeProduct("dp_unit_eyeball") 
    end,
})

Tab:CreateButton({
    Name = "⚡ Buy Teslaflora (Coil)",
    Callback = function() 
        snipeProduct("dp_unit_coil") 
    end,
})

Tab:CreateSection("Direct Units (Bypass)")

Tab:CreateButton({
    Name = "⛄ Buy Snowman (Direct)",
    Callback = function() 
        snipeDirect("unit_snowman") 
    end,
})

Tab:CreateSection("Quantities")

Tab:CreateButton({
    Name = "📦 Buy Eyeball x3",
    Callback = function() snipeProduct("dp_unit_eyeball_x3") end,
})
