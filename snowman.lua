-- 🧩 Load Rayfield UI (Fast Load & Anti-Cache)
local success, Rayfield = pcall(function() 
    local rLink = "https://raw.githubusercontent.com/SiriusTools/Rayfield/main/source"
    return loadstring(game:HttpGet(rLink .. "?t=" .. os.time()))() 
end)

if not success then return end

local Window = Rayfield:CreateWindow({
    Name = "Snowman Sniper Solo",
    LoadingTitle = "Focusing Snowman Path...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("Snowman", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions", 5)

-- 🛠️ Fungsi Direct Buy (Jalur Snowman)
local function snipeSnowman()
    if RemoteFuncs then
        local BuyUnitRemote = RemoteFuncs:FindFirstChild("BuyUnitWithRobux")
        if BuyUnitRemote then
            print("❄️ Direct Buying Snowman...")
            BuyUnitRemote:InvokeServer("unit_snowman")
            
            Rayfield:Notify({
                Title = "Target Sent",
                Content = "Nembak Snowman via Direct Remote!",
                Duration = 3
            })
        else
            Rayfield:Notify({Title = "Error", Content = "Remote BuyUnitWithRobux ilang!", Duration = 5})
        end
    else
        Rayfield:Notify({Title = "Error", Content = "Folder RemoteFunctions tidak ditemukan!", Duration = 5})
    end
end

Tab:CreateSection("Bypass Unit")

Tab:CreateButton({
    Name = "⛄ Buy Snowman (Direct)",
    Callback = function() 
        snipeSnowman() 
    end,
})

Tab:CreateSection("Status")
Tab:CreateLabel("Mode: Solo Sniper")
Tab:CreateLabel("Target: unit_snowman")

Rayfield:Notify({
    Title = "Snowman Sniper Ready",
    Content = "Jalur Direct Aktif, Gar!",
    Duration = 5
})
