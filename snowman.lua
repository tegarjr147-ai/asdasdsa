local function scanModules()
    print("--- [ STARTING DATABASE SCAN ] ---")
    local found = 0
    
    for _, v in pairs(game:GetDescendants()) do
        -- Kita cari ModuleScript yang biasanya isinya tabel ID
        if v:IsA("ModuleScript") then
            local success, content = pcall(function() return require(v) end)
            
            if success and type(content) == "table" then
                -- Kita cari tabel yang punya ciri-ciri database shop
                for key, value in pairs(content) do
                    -- Nyari ID yang ada "unit", "dp", atau "snowman"
                    local s_key = tostring(key):lower()
                    if s_key:find("unit") or s_key:find("dp") or s_key:find("id") then
                        print("📂 Module: " .. v.Name)
                        print("   ID Ketemu: " .. tostring(key) .. " = " .. tostring(value))
                        found = found + 1
                    end
                    
                    -- Kalau isinya tabel lagi (nested table), kita bongkar lagi
                    if type(value) == "table" then
                        for k2, v2 in pairs(value) do
                            if tostring(k2):lower():find("id") or tostring(v2):lower():find("unit") then
                                print("   [Nested] ID: " .. tostring(v2))
                            end
                        end
                    end
                end
            end
        end
    end
    print("--- [ SCAN SELESAI: Ketemu " .. found .. " Potensi ID ] ---")
end

scanModules()
