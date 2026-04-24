-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then warn("Gagal load Rayfield!") return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Snowman Fix)",
    LoadingTitle = "Bypassing Product ID...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")
local PromptDevProduct = RemoteFuncs:FindFirstChild("PromptDeveloperProduct")

-- 🛠️ Fungsi Tembak ID Angka
local function snipeProductID(id)
    if PromptDevProduct then
        print("🎯 Sniping Product ID: " .. id)
        -- Kirim ID angka murni (bukan string nama)
        PromptDevProduct:InvokeServer(id, "shop")
        
        Rayfield:Notify({
            Title = "Target Sent",
            Content = "Nembak ID " .. id .. " (Snowman)!",
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote Missing!", Duration = 5})
    end
end

Tab:CreateSection("Special Event Unit")

-- Tombol Snowman pake ID yang lu kasih tadi
Tab:CreateButton({
    Name = "⛄ Buy Snowman (245 Robux)",
    Callback = function() 
        snipeProductID(3486360167) -- ID DARI LINK LU
    end,
})

Tab:CreateSection("Exclusive Units")

Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() 
        -- Kalau eyeball tipenya sama, lu juga harus cari ID angkanya sebenernya
        -- Tapi kita coba pake string lama lu dulu
        snipeProductID("dp_unit_eyeball") 
    end,
})

Rayfield:Notify({
    Title = "Ready",
    Content = "ID Snowman Terpasang!",
    Duration = 5
})
