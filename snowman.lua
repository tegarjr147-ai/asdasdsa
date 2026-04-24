local RF = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteFunctions")

if RF then
    print("--- [ DAFTAR REMOTE SAKTI ] ---")
    for _, v in pairs(RF:GetChildren()) do
        print("Nama Remote: " .. v.Name .. " | Tipe: " .. v.ClassName)
    end
    print("-------------------------------")
else
    warn("Folder RemoteFunctions gak ketemu, Gar!")
end

-- Trik nyari ID Snowman di database lokal game
print("--- [ SCANNING ID SNOWMAN ] ---")
local found = false
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("StringValue") and (v.Value:lower():find("snowman") or v.Name:lower():find("snowman")) then
        print("Ketemu Potensi ID: " .. v.Name .. " = " .. v.Value)
        found = true
    end
end
if not found then print("Gak ada string 'snowman' di data game.") end
