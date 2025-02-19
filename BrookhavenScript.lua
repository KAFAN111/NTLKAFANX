local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Brookhaven Script | By NTLKAFANX",
    LoadingTitle = "Brookhaven Hack",
    LoadingSubtitle = "Developed by NTLKAFANX",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "BrookhavenHack"
    },
    Discord = {
       Enabled = false,
       Invite = "",
       RememberJoins = false
    },
    KeySystem = false
})

Rayfield:Notify({
    Title = "Welcome!",
    Content = "This script is developed by NTLKAFANX. Enjoy!",
    Duration = 5,
    Image = 4483362458,
    Actions = {
        OK = {
            Name = "Thanks",
            Callback = function() end
        }
    }
})

local SpeedTab = Window:CreateTab("التحكم", 4483362458)

-- شريط السرعة
local SpeedSlider = SpeedTab:CreateSlider({
    Name = "السرعة",
    Range = {16, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- شريط قوة النط
local JumpSlider = SpeedTab:CreateSlider({
    Name = "قوة الوثب",
    Range = {50, 300},
    Increment = 1,
    Suffix = "Jump",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

-- زر سكربت الرقصات
SpeedTab:CreateButton({
    Name = "سكربت رقصات",
    Callback = function()
        loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/RedZenXYZ/3da6af1961efa275de6c3c2a6dbace03/raw/bb027f99cec0ea48ef9c5eabfb9116ddff20633d/FE%2520Emotes%2520Gui"))()
    end
})

-- زر تطير بالكنبة
SpeedTab:CreateButton({
    Name = "تطير بالكنبة",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/TXMNj1yy'))()
    end
})

-- زر الحصول على الكنبة
SpeedTab:CreateButton({
    Name = "احصل على الكنبة",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            -- البحث عن الكنبة في الماب
            local couchModel = game.Workspace:FindFirstChild("Sofa") -- تم تغيير الاسم إلى "Sofa"
            if couchModel then
                -- نسخ الكنبة وإضافتها للشخصية
                local clonedCouch = couchModel:Clone()
                clonedCouch.Parent = character
                clonedCouch:SetPrimaryPartCFrame(character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
                
                Rayfield:Notify({
                    Title = "تمت إضافة الكنبة!",
                    Content = "تمت إضافة الكنبة إلى شخصيتك.",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                Rayfield:Notify({
                    Title = "خطأ!",
                    Content = "لم يتم العثور على الكنبة في الماب.",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        end
    end
})

-- زر تشغيل سكربت جيون
SpeedTab:CreateButton({
    Name = "سكربت جيون",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joygril/e-Jeon/refs/heads/main/Script-Jeon-Brookhaven.txt"))()
    end
})

local SkinsTab = Window:CreateTab("السكنات", 4483362458)

local originalShirt, originalPants
local player = game.Players.LocalPlayer
if player.Character then
    originalShirt = player.Character:FindFirstChildOfClass("Shirt")
    originalPants = player.Character:FindFirstChildOfClass("Pants")
end

local SkinsDropdown = SkinsTab:CreateDropdown({
    Name = "اختر سكن",
    Options = {"Goku", "Naruto", "Batman", "Spiderman", "Iron Man", "إرجاع"},
    CurrentOption = "إرجاع",
    Flag = "SelectedSkin",
    Callback = function(selectedSkin)
        local character = player.Character
        if character then
            for _, obj in pairs(character:GetChildren()) do
                if obj:IsA("Shirt") or obj:IsA("Pants") then obj:Destroy() end
            end

            if selectedSkin == "إرجاع" then
                if originalShirt then originalShirt:Clone().Parent = character end
                if originalPants then originalPants:Clone().Parent = character end
            else
                local skinData = {
                    ["Goku"] = {ShirtId = 12345678, PantsId = 87654321},
                    ["Naruto"] = {ShirtId = 23456789, PantsId = 98765432},
                    ["Batman"] = {ShirtId = 34567890, PantsId = 876543210},
                    ["Spiderman"] = {ShirtId = 45678901, PantsId = 765432109},
                    ["Iron Man"] = {ShirtId = 56789012, PantsId = 654321098}
                }

                local chosenSkin = skinData[selectedSkin]
                if chosenSkin then
                    Instance.new("Shirt", character).ShirtTemplate = "rbxassetid://"..chosenSkin.ShirtId
                    Instance.new("Pants", character).PantsTemplate = "rbxassetid://"..chosenSkin.PantsId
                end
            end
        end
    end
})

Rayfield:Notify({
    Title = "تم التحميل!",
    Content = "اختر السكنات من القائمة",
    Duration = 5,
    Image = 4483362458,
    Actions = {
        OK = {
            Name = "تم",
            Callback = function() end
        }
    }
})
