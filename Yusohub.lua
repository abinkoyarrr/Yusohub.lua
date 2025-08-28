-- YusoHub.lua
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

-- {YUSO HUB} Billboard
do
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local billboard = Instance.new("BillboardGui", hrp)
    billboard.Size = UDim2.new(0,200,0,50)
    billboard.StudsOffset = Vector3.new(0,3,0)
    billboard.AlwaysOnTop = true
    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Text = "{YUSO HUB}"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    delay(5,function() billboard:Destroy() end)
end

-- Loading
local loadingGui = Instance.new("ScreenGui", playerGui)
local frame = Instance.new("Frame", loadingGui)
frame.Size = UDim2.new(0,400,0,150)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(28,28,28)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,15)

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1,0,0.5,0)
text.Position = UDim2.new(0,0,0,10)
text.BackgroundTransparency = 1
text.Text = "Yükleniyor..."
text.TextColor3 = Color3.fromRGB(255,255,255)
text.Font = Enum.Font.GothamBold
text.TextScaled = true

local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1,0,0.5,0)
credit.Position = UDim2.new(0,0,0.5,0)
credit.BackgroundTransparency = 1
credit.Text = "Made by: OWNEROFWORLDXD"
credit.TextColor3 = Color3.fromRGB(255,255,255)
credit.Font = Enum.Font.Gotham
credit.TextScaled = true

delay(5,function()
    loadingGui:Destroy()

    -- Main GUI
    local gui = Instance.new("ScreenGui", playerGui)
    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0,500,0,300)
    main.Position = UDim2.new(0.5,0,0.5,0)
    main.AnchorPoint = Vector2.new(0.5,0.5)
    main.BackgroundColor3 = Color3.fromRGB(28,28,28)
    Instance.new("UICorner", main).CornerRadius = UDim.new(0,15)

    -- Title
    local title = Instance.new("TextLabel", main)
    title.Text = "Yuso Hub"
    title.Size = UDim2.new(0,200,0,40)
    title.Position = UDim2.new(0,15,0,10)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true

    -- Close & Minimize
    local close = Instance.new("TextButton", main)
    close.Text = "X"
    close.Size = UDim2.new(0,35,0,35)
    close.Position = UDim2.new(1,-50,0,10)
    close.BackgroundColor3 = Color3.fromRGB(200,0,0)
    close.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)

    local minimize = Instance.new("TextButton", main)
    minimize.Text = "-"
    minimize.Size = UDim2.new(0,35,0,35)
    minimize.Position = UDim2.new(1,-90,0,10)
    minimize.BackgroundColor3 = Color3.fromRGB(50,50,50)
    minimize.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", minimize).CornerRadius = UDim.new(0,8)

    local logo = Instance.new("TextButton", gui)
    logo.Text = "Yuso Hub"
    logo.Size = UDim2.new(0,60,0,60)
    logo.Position = UDim2.new(0,10,0,10)
    logo.BackgroundColor3 = Color3.fromRGB(28,28,28)
    logo.TextColor3 = Color3.fromRGB(255,255,255)
    logo.Font = Enum.Font.GothamBold
    logo.TextScaled = true
    logo.Visible = false
    Instance.new("UICorner", logo).CornerRadius = UDim.new(1,0)

    minimize.MouseButton1Click:Connect(function()
        main.Visible=false
        logo.Visible=true
    end)
    logo.MouseButton1Click:Connect(function()
        main.Visible=true
        logo.Visible=false
    end)
    close.MouseButton1Click:Connect(function()
        main.Visible=false
        logo.Visible=false
    end)

    -- Tabs
    local tabs = {"Home","Characters","Credits"}
    local frames = {}
    for i,tab in ipairs(tabs) do
        local btn = Instance.new("TextButton", main)
        btn.Text = tab
        btn.Size = UDim2.new(0,160,0,35)
        btn.Position = UDim2.new(0,15+(i-1)*165,0,60)
        btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Font = Enum.Font.Gotham
        btn.TextScaled = true
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

        local frame = Instance.new("ScrollingFrame", main)
        frame.Size = UDim2.new(1,-30,1,-110)
        frame.Position = UDim2.new(0,15,0,110)
        frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
        frame.CanvasSize = UDim2.new(0,0,0,0)
        frame.ScrollBarThickness = 8
        frame.Visible = i==1
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)
        frames[tab] = frame

        btn.MouseButton1Click:Connect(function()
            for n,f in pairs(frames) do f.Visible=false end
            frame.Visible=true
        end)
    end

    -- Home Buttons
    local yPos=20
    local flyActive=false
    local flyLoop=nil
    local homeBtns = {"Teleport","Speed","Jump","Fly","Infinite Yield"}
    for _,name in ipairs(homeBtns) do
        local btn = Instance.new("TextButton", frames["Home"])
        btn.Text=name
        btn.Size = UDim2.new(0,300,0,50)
        btn.Position = UDim2.new(0.5,-150,0,yPos)
        btn.BackgroundColor3 = Color3.fromRGB(100,150,255)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Font = Enum.Font.GothamBold
        btn.TextScaled = true
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)
        yPos = yPos + 70

        btn.MouseButton1Click:Connect(function()
            local char = player.Character
            if not char then return end
            local hum = char:FindFirstChild("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if name=="Teleport" and hrp then hrp.CFrame=CFrame.new(0,10,0) end
            if name=="Speed" and hum then hum.WalkSpeed=50 end
            if name=="Jump" and hum then hum.JumpPower=100 end
            if name=="Fly" and hrp and hum then
                if flyActive then flyActive=false if flyLoop then flyLoop:Disconnect() end hum.PlatformStand=false
                else
                    flyActive=true
                    hum.PlatformStand=true
                    flyLoop=RS.RenderStepped:Connect(function()
                        local dir=Vector3.new()
                        if UIS:IsKeyDown(Enum.KeyCode.W) then dir=dir+workspace.CurrentCamera.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.S) then dir=dir-workspace.CurrentCamera.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.A) then dir=dir-workspace.CurrentCamera.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.D) then dir=dir+workspace.CurrentCamera.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.Space) then dir=dir+Vector3.new(0,1,0) end
                        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then dir=dir-Vector3.new(0,1,0) end
                        if dir.Magnitude>0 then hrp.CFrame=hrp.CFrame+dir.Unit*0.5 end
                    end)
                end
            end
            if name=="Infinite Yield" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            end
        end)
    end

    -- Characters Tab: Korblox
    local kor = Instance.new("TextButton", frames["Characters"])
    kor.Text="Korblox"
    kor.Size=UDim2.new(0,300,0,50)
    kor.Position=UDim2.new(0.5,-150,0,20)
    kor.BackgroundColor3=Color3.fromRGB(200,100,255)
    kor.TextColor3=Color3.fromRGB(255,255,255)
    kor.Font=Enum.Font.GothamBold
    kor.TextScaled=true
    Instance.new("UICorner", kor).CornerRadius=UDim.new(0,12)
    kor.MouseButton1Click:Connect(function()
        local char=player.Character
        if not char then return end
        local rleg=char:FindFirstChild("Right Leg") or char:FindFirstChild("RightLowerLeg")
        if rleg then rleg.MeshId="http://www.roblox.com/asset/?id=128207411" end
    end)
end)
