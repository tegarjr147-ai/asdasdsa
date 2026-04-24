-- 🧩 Load Rayfield UI (Link GitHub Raw)
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusTools/Rayfield/main/source'))() 
end)

if not success or not Rayfield then return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Hybrid Fix)",
    LoadingTitle = "Bypassing All Remote Paths...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 🛠️ Fungsi Safety buat ambil Remote (Biar gak nyangkut/infinite yield)
local function getRemote(name)
    local rf = ReplicatedStorage:FindFirstChild("RemoteFunctions")
    if rf then
        return rf:FindFirstChild(name)
    end
    return nil
end

-- ==========================================
-- 🛠️ METODE A: PROMPT DEV PRODUCT
-- ==========================================
local function snipeDevProduct(id)
    local remote = getRemote("PromptDeveloperProduct")
    if remote then
        task.spawn(function()
            remote:InvokeServer(id, "shop")
        end)
        Rayfield:Notify({Title = "Sent", Content = "Request " .. id .. " terkirim!", Duration = 2})
    else
        Rayfield:Notify({Title = "Error", Content = "Remote DevProduct Hilang!", Duration = 3})
    end
end

-- ==========================================
-- 🛠️ METODE B: DIRECT BUY (SNOWMAN/FIREBLOOM)
-- ==========================================
local function snipeDirectUnit(unitName)
    local remote = getRemote("BuyUnitWithRobux")
    if remote then
        task.spawn(function()
            -- Sesuai format args yang lu kasih di awal
            remote:InvokeServer(unitName) 
        end)
        Rayfield:Notify({Title = "Sent", Content = "Direct Buy " .. unitName .. " terkirim!", Duration = 2})
    else
        Rayfield:Notify({Title = "Error", Content = "Remote Direct Buy Hilang!", Duration = 3})
    end
end

-- SECTION 1
Tab:CreateSection("DevProduct Sniper")

Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() snipeDevProduct("dp_unit_eyeball") end,
})

Tab:CreateButton({
    Name = "⚡ Buy Teslaflora (Coil)",
    Callback = function() snipeDevProduct("dp_unit_coil") end,
})

-- SECTION 2
Tab:CreateSection("Direct Unit Sniper")

Tab:CreateButton({
    Name = "❄️ Buy Snowman",
    Callback = function() snipeDirectUnit("unit_snowman") end,
})

Tab:CreateButton({
    Name = "🔥 Buy Fire Bloom",
    Callback = function() snipeDirectUnit("unit_fire_bloom") end,
})

Rayfield:Notify({
    Title = "Script Ready",
    Content = "Jalur Direct & Prompt Aktif!",
    Duration = 5
})
