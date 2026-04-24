-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusTools/Rayfield/main/source'))() 
end)

if not success then return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Hybrid Fix)",
    LoadingTitle = "Bypassing All Remote Paths...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")

-- ==========================================
-- 🛠️ METODE A: PROMPT DEV PRODUCT (EYEBALL)
-- ==========================================
local function snipeDevProduct(id)
    local PromptDevProduct = RemoteFuncs:FindFirstChild("PromptDeveloperProduct")
    if PromptDevProduct then
        print("🎯 Sniping DevProduct: " .. id)
        PromptDevProduct:InvokeServer(id, "shop")
        
        Rayfield:Notify({
            Title = "DevProduct Sent",
            Content = "Nembak " .. id .. " via Prompt!",
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote PromptDevProduct ilang!", Duration = 5})
    end
end

-- ==========================================
-- 🛠️ METODE B: DIRECT BUY (FIRE BLOOM)
-- ==========================================
local function snipeDirectUnit(unitName)
    local BuyUnitRemote = RemoteFuncs:FindFirstChild("BuyUnitWithRobux")
    if BuyUnitRemote then
        print("🔥 Direct Buying Unit: " .. unitName)
        -- Mengirim args sebagai tabel sesuai format lu
        BuyUnitRemote:InvokeServer(unitName)
        
        Rayfield:Notify({
            Title = "Direct Purchase Sent",
            Content = "Bypass beli " .. unitName .. " sukses!",
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote BuyUnitWithRobux ilang!", Duration = 5})
    end
end

-- SECTION 1: DEVPRODUCT PATH
Tab:CreateSection("DevProduct Sniper (Eyeball Path)")

Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() 
        snipeDevProduct("dp_unit_eyeball") 
    end,
})

Tab:CreateButton({
    Name = "⚡ Buy Teslaflora (Coil)",
    Callback = function() 
        snipeDevProduct("dp_unit_coil") 
    end,
})

-- SECTION 2: DIRECT BUY PATH (REQUEST LU)
Tab:CreateSection("Direct Unit Sniper")

Tab:CreateButton({
    Name = "🔥 Buy Snowman",
    Callback = function() 
        snipeDirectUnit("unit_snowman") -- Nembak tanpa prefix 'dp_'
    end,
})



Rayfield:Notify({
    Title = "Script Ready",
    Content = "Hybrid Method Active - by Tegar",
    Duration = 5
})
