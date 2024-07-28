local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() 
local Window = OrionLib:MakeWindow({IntroText = "Doors GUI v1.2",Name = "NOOOD V1.0", HidePremium = false, SaveConfig = true, ConfigFolder = "DoorsSex"}) 
if game.PlaceId == 6516141723 then 
    OrionLib:MakeNotification({ 
        Name = "Error", 
        Content = "Пожалуйста, выполните во время игры, а не в лобби.", 
        Time = 2 
    }) 
end 
local VisualsTab = Window:MakeTab({ 
	Name = "Visuals", 
	Icon = "rbxassetid://4483345998", 
	PremiumOnly = false 
}) 
local CF = CFrame.new 
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom 
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart local 

KeyChams = {} 
VisualsTab:AddToggle({ 
	Name = "Key Chams", 
	Default = false, 
    Flag = "KeyToggle", 
    Save = true, 
	Callback = function(Value) 
		for i,v in pairs(KeyChams) do 
            v.Enabled = Value 
        end 
	end     
}) 

local function ApplyKeyChams(inst) 
    wait() 
    local Cham = Instance.new("Highlight") 
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
    Cham.FillColor = Color3.new(0.980392, 0.670588, 0) 
    Cham.FillTransparency = 0.5 
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156) 
    Cham.Parent = game:GetService("CoreGui") 
    Cham.Adornee = inst 
    Cham.Enabled = OrionLib.Flags["KeyToggle"].Value 
    Cham.RobloxLocked = true 
    return Cham 
end 

local KeyCoroutine = coroutine.create(function() 
    workspace.CurrentRooms.DescendantAdded:Connect(function(inst) 
        if inst.Name == "KeyObtain" then 
            table.insert(KeyChams,ApplyKeyChams(inst)) 
        end 
    end) 
end) 
for i,v in ipairs(workspace:GetDescendants()) do 
    if v.Name == "KeyObtain" then 
        table.insert(KeyChams,ApplyKeyChams(v)) 
    end 
end 
coroutine.resume(KeyCoroutine) 

local BookChams = {} 
VisualsTab:AddToggle({ 
	Name = "Book Chams", 
	Default = false, 
    Flag = "BookToggle", 
    Save = true, 
	Callback = function(Value) 
		for i,v in pairs(BookChams) do 
            v.Включено = Значение 
        конец 
	конец     
}) 

локальный FigureChams = {}
VisualsTab:AddToggle({ 
	Name = "Figure Chams", 
	Default = false, 
    Flag = "FigureToggle", 
    Save = true, 
    Callback = function(Value) 
        for i,v in pairs(FigureChams) do 
            v.Enabled = Value 
        end 
    end 
}) 

local function ApplyBookChams(inst) 
    if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50 then 
        wait() 
        local Cham = Instance.new("Highlight") 
        Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
        Cham.FillColor = Color3.new(0, 1, 0.749019) 
        Cham.FillTransparency = 0.5 
        Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156) 
        Cham.Parent = game:GetService("CoreGui") 
        Cham.Enabled = OrionLib.Flags["BookToggle"].Value 
        Cham.Adornee = inst 
        Cham.RobloxLocked = true 
        return Cham 
    end 
end 

local function ApplyEntityChams(inst) 
    wait() 
    local Cham = Instance.new("Highlight") 
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
    Cham.FillColor = Color3.new(1, 0, 0) 
    Cham.FillTransparency = 0.5 
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156) 
    Cham.Parent = game:GetService("CoreGui") 
    Cham.Enabled = OrionLib.Flags["FigureToggle"].Value 
    Cham.Adornee = inst 
    Cham.RobloxLocked = true 
    return Cham 
end 

local BookCoroutine = coroutine.create(function() 
    task.wait(1) 
    for i,v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do 
        if v.Name == "LiveHintBook" then 
            table.insert(BookChams,ApplyBookChams(v)) 
        end 
    end 
end) 
local EntityCoroutine = coroutine.create(function() 
    local Entity = game:GetService("Workspace").CurrentRooms["50"].FigureSetup:WaitForChild("FigureRagdoll",5) 
    Entity:WaitForChild("Торс",2.5) 
    table.insert(FigureChams,ApplyEntityChams(Entity)) 
end) 


local GameTab = Window:MakeTab({ 
	Name = "Игра", 
	Icon = "rbxassetid://4483345998", 
	PremiumOnly = false 
}) 
local CharTab = Window:MakeTab({ 
	Name = "Персонаж",
	Значок = "rbxassetid://4483345998", 
	PremiumOnly = false 
}) 

локальный TargetWalkspeed
CharTab:AddSlider({ 
	Имя = "Скорость", 
	Мин. = 0, 
	Макс. = 50, 
	По умолчанию = 5, 
	Цвет = Color3.fromRGB(255,255,255), 
	Приращение = 1, 
	Обратный вызов = function(Value) 
		TargetWalkspeed = Значение 
	end     
}) 

local pcl = Instance.new("Прожектор") 
pcl.Яркость = 1 
pcl.Лицо = Enum.Обычный_идентификатор.Фронт 
pcl.Диапазон = 90 
pcl.Родитель = game.Игроки.Локальный_игрок.Персонаж.Голова 
pcl.Включено = false 


CharTab:AddToggle({ 
	Имя = "Фарка", 
	По умолчанию = false, 
    Обратный вызов = function(Value) 
        pcl.Включено = Значение 
    end 
}) 

GameTab:AddToggle({ 
	Имя = "Нет рычагов поиска/препятствий", 
	По умолчанию = false, 
    Флаг = "Нет_поиска", 
    Сохранить = true 
}) 

GameTab:AddToggle({ 
	Name = "Instant Interact", 
	Default = false, 
    Flag = "InstantToggle", 
    Save = true 
}) 
GameTab:AddButton({ 
	Name = "Skip level", 
	Callback = function() 
        pcall(function() 
            local HasKey = false 
            local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door") 
            for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do 
                if v.Name == "KeyObtain" then 
                    HasKey = v 
                end 
            end 
            if HasKey then 
                game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position)) 
                wait(0.3) 
                fireproximityprompt(HasKey.ModulePrompt,0) 
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position)) 
                wait(0.3) 
                fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0) 
            end 
            if LatestRoom == 50 then 
                CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door") 
            end 
            game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position)) 
            wait(0.3) 
            CurrentDoor.ClientOpen:FireServer() 
        end) 
  	end     
}) 

GameTab:AddToggle({ 
	Name = "Автоматический пропуск уровня", 
	Default = false, 
    Save = false,
    Флаг = "AutoSkip" 
}) 

локальный AutoSkipCoro = coroutine.create(function()
        while true do 
            task.wait() 
            pcall(function() 
            if OrionLib.Flags["AutoSkip"].Value == true and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value < 100 then 
                local HasKey = false 
                local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value 
                local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom)]:WaitForChild("Door") 
                for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do 
                    if v.Name == "KeyObtain" then 
                        HasKey = v 
                    end 
                end 
                if HasKey then 
                    game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position)) 
                    task.wait(0.3) 
                    fireproximityprompt(HasKey.ModulePrompt,0) 
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position)) 
                    task.wait(0.3) 
                    fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0) 
                end 
                if LatestRoom == 50 then 
                    CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door") 
                end 
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position)) 
                task.wait(0.3) 
                CurrentDoor.ClientOpen:FireServer() 
            end 
        end) 
        end 
end) 
coroutine.resume(AutoSkipCoro) 

GameTab:AddButton({ 
	Name = "Нет скримеров", 
	Callback = function() 
        pcall(function() 
            game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy() 
        end) 
  	end     
}) 
GameTab:AddToggle({ 
	Name = "Избегать рывка/засады", 
	Default = false, 
    Flag = "AvoidRushToggle", 
    Save = true 
}) 
GameTab:AddToggle({ 
	Name = "Без визга", 
	Default = false, 
    Flag = "ScreechToggle", 
    Save = true 
}) 

GameTab:AddToggle({ 
	Name = "Всегда выигрывать heartbeat", 
	Default = false, 
    Flag = "HeartbeatWin", 
    Save = true 
}) 

GameTab:AddToggle({ 
	Name = "Предсказывать погони", 
	Default = false,
    Флаг = "PredictToggle", 
    Сохранить = true 
})
GameTab:AddToggle({ 
	Name = "Уведомлять о появлении мобов", 
	Default = false, 
    Flag = "MobToggle", 
    Save = true 
}) 
GameTab:AddButton({ 
	Name = "Завершить мини-игру с ящиком-выключателем", 
	Callback = function() 
        game:GetService("ReplicatedStorage").Bricks.EBF:FireServer() 
  	end     
}) 
GameTab:AddButton({ 
	Name = "Пропустить уровень 50", 
	Callback = function() 
        local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Дверь") 
        game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position)) 
  	end     
}) 
GameTab:AddParagraph("Предупреждение","Возможно, вам придется открыть/закрыть панель несколько раз, чтобы это заработало, скоро исправим.") 

--// ok фактический код начинается здесь 

game:GetService("RunService").RenderStepped:Connect(function() 
    pcall(function() 
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then 
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/50) 
        end 
    end) 
end) 

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(descendant) 
    if OrionLib.Flags["NoSeek"].Value == true and descendant.Name == ("Seek_Arm" or "ChandelierObstruction") then 
        task.spawn(function() 
            wait() 
            descendant:Destroy() 
        end) 
    end 
end) 

game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt) 
    if OrionLib.Flags["InstantToggle"].Value == true then 
        fireproximityprompt(prompt) 
    end 
end) 

local old 
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...) 
    local args = {...} 
    local method = getnamecallmethod() 
    
    if tostring(self) == 'Screech' and method == "FireServer" and OrionLib.Flags["ScreechToggle"].Value == true then 
        args[1] = true 
        return old(self,unpack(args)) 
    end 
    if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and OrionLib.Flags["HeartbeatWin"].Value == true then 
        args[2] = true 
        return old(self,unpack(args)) 
    end 
    
    return old(self,...) 
end)) 

workspace.CurrentCamera.ChildAdded:Connect(function(child) 
    if child.Name == "Screech" and OrionLib.Flags["ScreechToggle"].Value == true then
        child:Destroy() 
    end 
end) 

local NotificationCoroutine = coroutine.create(function() 
    LatestRoom.Changed:Connect(function() 
        if OrionLib.Flags["PredictToggle"].Value == true then 
            local n = ChaseStart.Value - LatestRoom.Value 
            if 0 < n and n < 4 then 
                OrionLib:MakeNotification({ 
                    Name = "Warning!", 
                    Content = "Event in " .. tostring(n) .. " rooms.", 
                    Time = 5 
                }) 
            end 
        end 
        if OrionLib.Flags["BookToggle"].Value == true then 
            if LatestRoom.Value == 50 then 
                coroutine.resume(BookCoroutine) 
            end 
        end 
        if OrionLib.Flags["FigureToggle"].Value == true then 
            if LatestRoom.Value == 50 then 
                coroutine.resume(EntityCoroutine) 
            end 
        end 
    end) 
    workspace.ChildAdded:Connect(function(inst) 
        if inst.Name == "RushMoving" and OrionLib.Flags["MobToggle"].Value == true then 
            if OrionLib.Flags["AvoidRushToggle"].Value == true then 
                OrionLib:MakeNotification({ 
                    Name = "Warning!", 
                    Content = "Avoid Rush. Пожалуйста, подождите.", 
                    Time = 5 
                }) 
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 
                local con = game:GetService("RunService").Heartbeat:Connect(function() 
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) 
                end) 
                
                inst.Destroying:Wait() 
                con:Disconnect() 

                game.Players.LocalPlayer.Character:MoveTo(OldPos) 
            else 
                OrionLib:MakeNotification({ 
                    Name = "Warning!", 
                    Content = "Rush появился, спрячьтесь!", 
                    Time = 5 
                }) 
            end 
        elseif inst.Name == "AmbushMoving" and OrionLib.Flags["MobToggle"].Value == true then 
            if OrionLib.Flags["AvoidRushToggle"].Value == true then 
                OrionLib:MakeNotification({ 
                    Name = "Warning!",
                    Содержание = "Избегаем засады. Пожалуйста, подождите.", 
                    Время = 5
                }) 
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 
                local con = game:GetService("RunService").Heartbeat:Connect(function() 
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) 
                end) 
                
                inst.Destroying:Wait() 
                con:Disconnect() 
                
                game.Players.LocalPlayer.Character:MoveTo(OldPos) 
            else 
                OrionLib:MakeNotification({ 
                    Name = "Warning!", 
                    Content = "Ambush has spawned, hide!", 
                    Time = 5 
                }) 
            end 
        end 
    end) 
end) 

--// ok фактический код заканчивается здесь 

local CreditsTab = Window:MakeTab({ 
	Name = "Credits", 
	Icon = "rbxassetid://4483345998", 
	PremiumOnly = false 
}) 

CreditsTab:AddParagraph("Credits to","OminousVibes - (Большинство идей взято из их ветки, посмотрите! - https://v3rmillion.net/showthread.php?tid=1184088)") 

coroutine.resume(NotificationCoroutine) 

OrionLib:Init() 

task.wait(2)