local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TITLE", "Sentinel")
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
Section:NewToggle("Auto Farm", "ToggleInfo", function(a)
    _G.FarmAuto = a
end)

Section:NewToggle("Auto State", "ToggleInfo", function(e)
    _G.AutoState = e
end)

local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")

Weaponlist = {}
Weapon = nil
for i,v in pairs(game:GetService("Players").FunnyScript111.Backpack:GetChildren()) do
    table.insert(Weaponlist,v.Name)
end

Section:NewDropdown("DropdownText", "DropdownInf", Weaponlist, function(currentOption)
    Weapon = currentOption
end)



Section:NewToggle("Auto Equip", "ToggleInfo", function(r)
    _G.AutoEquip = r
end)


spawn(function()
    while wait() do
        if _G.AutoEquip then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").FunnyScript111.Backpack:FindFirstChild(Weapon))
            end)
        end
    end
end)








spawn(function()
    while wait() do
        if _G.AutoState then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 3)
        end
    end
end)


function Checklevel()
    local Mylevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Mylevel == 1 or Mylevel <= 9 then
        MON = "Bandit [Lv. 5]"
        MONNAME = "Bandit"
        QUEST = "BanditQuest1"
        QTNUM = 1
        MONCF = CFrame.new(1189.53173828125, 16.729299545288086, 1620.749267578125)
        QUESTCF = CFrame.new(1061.0633544921875, 16.388538360595703, 1549.193603515625)
    elseif Mylevel == 10 or Mylevel <= 14 then
        MON = "Monkey [Lv. 14]"
        MONNAME = "Monkey"
        QUEST = "JungleQuest"
        QTNUM = 1
        MONCF = CFrame.new(-1623.695068359375, 15.877896308898926, 78.28404235839844)
        QUESTCF = CFrame.new(-1599.714599609375, 36.8779296875, 152.850341796875)
    elseif Mylevel == 15 or Mylevel <= 29 then
        MON = "Gorilla [Lv. 20]"
        MONNAME = "Gorilla"
        QUEST = "JungleQuest"
        QTNUM = 2
        MONCF = CFrame.new(-1241.9107666015625, 6.305166244506836, -520.2518920898438)
        QUESTCF = CFrame.new(-1600.009033203125, 36.8779296875, 152.89236450195312)
    elseif Mylevel == 30 or Mylevel <=  39 then
        MON = "Pirate [Lv. 35]"
        MONNAME = "Pirate"
        QUEST = "BuggyQuest1"
        QTNUM = 1
        MONCF = CFrame.new(-1225.421875, 4.777853488922119, 3917.103271484375)
        QUESTCF = CFrame.new(-1141.7689208984375, 4.777853488922119, 3829.562744140625)
    elseif Mylevel == 40 or Mylevel <= 59 then
        MON = "Brute [Lv. 45]"
        MONNAME = "Brute"
        QUEST = "BuggyQuest1"
        QTNUM = 2
        MONCF = CFrame.new(-1069.99267578125, 14.835677146911621, 4302.2392578125)
        QUESTCF = CFrame.new(-1141.7689208984375, 4.777853488922119, 3829.562744140625)
    elseif Mylevel == 60 or Mylevel <= 74 then
        MON = "Desert Bandit [Lv. 60]"
        MONNAME = "Desert Bandit"
        QUEST = "DesertQuest"
        QTNUM = 1
        MONCF = CFrame.new(931.6926879882812, 6.450431823730469, 4490.34619140625)
        QUESTCF = CFrame.new(896.79443359375, 6.438474178314209, 4391.8271484375)
    elseif Mylevel == 75 or Mylevel <= 89 then
        MON = "Desert Officer [Lv. 70]"
        MONNAME = "Desert Officer"
        QUEST = "DesertQuest"
        QTNUM = 2
        MONCF = CFrame.new(1607.697021484375, 9.771275520324707, 4370.73583984375)
        QUESTCF = CFrame.new(896.79443359375, 6.438474178314209, 4391.8271484375)
    elseif Mylevel == 90 or Mylevel <= 99 then
        MON = "Snow Bandit [Lv. 90]"
        MONNAME = "Snow Bandit"
        QUEST = "SnowQuest"
        QTNUM = 1
        MONCF = CFrame.new(1294.7200927734375, 87.27277374267578, -1380.6439208984375)
        QUESTCF = CFrame.new(1387.896240234375, 87.27277374267578, -1299.7076416015625)
    elseif Mylevel == 100 or Mylevel <= 119 then
        MON = "Snowman [Lv. 100]"
        MONNAME = "Snowman"
        QUEST = "SnowQuest"
        QTNUM = 2
        MONCF = CFrame.new(1152.6964111328125, 105.82967376708984, -1491.8155517578125)
        QUESTCF = CFrame.new(1387.896240234375, 87.27277374267578, -1299.7076416015625)
    end
end


spawn(function()
    while task.wait() do
        Checklevel()
        if _G.FarmAuto then
            pcall(function()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,MONNAME) then
                    game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    tp(QUESTCF)
                    wait(4)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QUEST, QTNUM)
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == MON then
                            tp(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                            v.HumanoidRootPart.CanCollide = false
                            for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == MON and v2.Name == MON then
                                    v.HumanoidRootPart.Size = Vector3.new(40,40,40)
                                    v.HumanoidRootPart.CFrame = v2.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.CFrame = MONCF
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)



spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FarmAuto then
            pcall(function()
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)






function Teleport()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Level == 1 or Level <= 9 then
        CFTP = CFrame.new(1189.53173828125, 16.729299545288086, 1620.749267578125)
    elseif Level == 10 or Level <= 14 then
        CFTP = CFrame.new(-1623.695068359375, 15.877896308898926, 78.28404235839844)
    elseif Level == 15 or Level <= 29 then
        CFTP = CFrame.new(-1241.9107666015625, 6.305166244506836, -520.2518920898438)
    elseif Level == 30 or Level <= 39 then
        CFTP = CFrame.new(-1225.421875, 4.777853488922119, 3917.103271484375)
    elseif Level == 40 or Level <= 59 then
        CFTP = CFrame.new(-1069.99267578125, 14.835677146911621, 4302.2392578125)
    elseif Level == 60 or Level <= 74 then
        CFTP = CFrame.new(931.6926879882812, 6.450431823730469, 4490.34619140625)
    elseif Level == 75 or Level <= 89 then
        CFTP = CFrame.new(1607.697021484375, 9.771275520324707, 4370.73583984375)
    elseif Level == 90 or Level <= 99 then
        CFTP = CFrame.new(1294.7200927734375, 87.27277374267578, -1380.6439208984375)
    elseif Level == 100 or Level <= 119 then
        CFTP = CFrame.new(1152.6964111328125, 105.82967376708984, -1491.8155517578125)
    end
end


spawn(function()
    while task.wait(5) do
        Teleport()
        if _G.FarmAuto then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                pcall(function()
                    tp(CFTP)
                end)
            end
        end
    end
end)





spawn(function()
    while wait() do
        if _G.FarmAuto then
            if not game:GetService("Workspace"):FindFirstChild("tween") then
                local part = Instance.new("Part")
                part.Name = "tween"
                part.Parent = game:GetService("Workspace")
                part.Anchored = true
                part.Transparency = 1
                part.Size = Vector3.new(7,1,7)
            end
        end
    end
end)




spawn(function()
    while wait() do
        if _G.FarmAuto then
            local TweenService = game:GetService("TweenService")
            local part = game:GetService("Workspace").tween
            local tweeninfo = TweenInfo.new(0, Enum.EasingStyle.Linear)
            local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
            part.Anchored = true
            pcall(function()
                TweenService:Create(part, tweeninfo, {CFrame = plr.CFrame * CFrame.new(0,-4,0)}):Play()
            end)
        end
    end
end)



spawn(function()
    while wait() do
        if _G.FarmAuto then
            pcall(function()
                if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                    game.workspace.tween:Destroy()
                end 
            end)
        end
    end
end)



function tp(P)
    Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 10 then
        Speed = 1000
    elseif Distance < 170 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        Speed = 350
    elseif Distance < 1000 then
        Speed = 350
    elseif Distance >= 100 then
        Speed = 300
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P}
    ):Play()
end


