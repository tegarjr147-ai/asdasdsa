-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then warn("Gagal load Rayfield!") return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Eyeball Fix)",
    LoadingTitle = "Applying Corrupted ID...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")
local PromptDevProduct = RemoteFuncs:FindFirstChild("PromptDeveloperProduct")

-- 🛠️ Fungsi Tembak Developer Product
local function snipeProduct(id)
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

Tab:CreateSection("Exclusive Units")

-- Tombol Eyeball (Lu bilang ini bisa)
Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() 
        snipeProduct("dp_unit_eyeball") 
    end,
})

-- TOMBOL SNOWMAN (Gue taro di sini pake jalur Direct lu)
Tab:CreateButton({
    Name = "⛄ Buy Snowman (Direct)",
    Callback = function() 
        local BuyRemote = RemoteFuncs:FindFirstChild("BuyUnitWithRobux")
        if BuyRemote then
            BuyRemote:InvokeServer("unit_snowman")
            Rayfield:Notify({Title = "Success", Content = "Nembak Snowman!", Duration = 3})
        end
    end,
})

-- Tombol Tesla
Tab:CreateButton({
    Name = "⚡ Buy Teslaflora (Coil)",
    Callback = function() 
        snipeProduct("dp_unit_coil") 
    end,
})

Tab:CreateSection("Quantities")
Tab:CreateButton({
    Name = "📦 Buy Eyeball x3",
    Callback = function() snipeProduct("dp_unit_eyeball_x3") end,
})
