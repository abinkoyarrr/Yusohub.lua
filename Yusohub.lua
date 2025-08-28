loadstring([[
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- GUI oluştur
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "YusoHubGUI"

-- Yükleniyor frame
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(0,300,0,120)
loadingFrame.Position = UDim2.new(0.5,-150,0.5,-60)
loadingFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
local frameCorner = Instance.new("UICorner", loadingFrame)
frameCorner.CornerRadius = UDim.new(0,50)

local loadingLabel = Instance.new("TextLabel", loadingFrame)
loadingLabel.Size = UDim2.new(1,0,0,50)
loadingLabel.Position = UDim2.new(0,0,0,10)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Yükleniyor..."
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextSize = 24
loadingLabel.TextXAlignment = Enum.TextXAlignment.Center
loadingLabel.TextYAlignment = Enum.TextYAlignment.Center
loadingLabel.TextColor3 = Color3.fromRGB(255,255,255)

local subLabel = Instance.new("TextLabel", loadingFrame)
subLabel.Size = UDim2.new(1,0,0,40)
subLabel.Position = UDim2.new(0,0,0,60)
subLabel.BackgroundTransparency = 1
subLabel.Text = "Berat İyi Günler Diler"
subLabel.Font = Enum.Font.GothamBold
subLabel.TextSize = 20
subLabel.TextXAlignment = Enum.TextXAlignment.Center
subLabel.TextYAlignment = Enum.TextYAlignment.Center

-- Rengarenk döngü
local colors = {Color3.fromRGB(255,0,0),Color3.fromRGB(255,127,0),Color3.fromRGB(255,255,0),
                Color3.fromRGB(0,255,0),Color3.fromRGB(0,0,255),Color3.fromRGB(75,0,130),Color3.fromRGB(139,0,255)}
local colorIndex = 1
local running = true
spawn(function()
    while running do
        subLabel.TextColor3 = colors[colorIndex]
        colorIndex = colorIndex + 1
        if colorIndex > #colors then colorIndex = 1 end
        wait(0.25)
    end
end)

-- Yükleme bitince GUI
delay(2,function()
    running = false
    loadingFrame:Destroy()

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0,420,0,260)
    frame.Position = UDim2.new(0.5,-210,0.5,-130)
    frame.BackgroundColor3 = Color3.fromRGB(38,38,42)
    local frameCorner2 = Instance.new("UICorner", frame)
    frameCorner2.CornerRadius = UDim.new(0,16)
    frame.ClipsDescendants = true

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(0,420,0,40)
    title.Position = UDim2.new(0,0,0,0)
    title.BackgroundTransparency = 1
    title.Text = "Yuso Hub"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 28
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.TextYAlignment = Enum.TextYAlignment.Center

    -- Kapat ve minimize
    local closeBtn = Instance.new("TextButton", frame)
    closeBtn.Size = UDim2.new(0,30,0,30)
    closeBtn.Position = UDim2.new(1,-40,0,5)
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
    closeBtn.BackgroundColor3 = Color3.fromRGB(80,0,0)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextScaled = true
    local closeCorner = Instance.new("UICorner", closeBtn)
    closeCorner.CornerRadius = UDim.new(0,8)
    closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

    local minimizeBtn = Instance.new("TextButton", frame)
    minimizeBtn.Size = UDim2.new(0,30,0,30)
    minimizeBtn.Position = UDim2.new(1,-80,0,5)
    minimizeBtn.Text = "-"
    minimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.TextScaled = true
    local minCorner = Instance.new("UICorner", minimizeBtn)
    minCorner.CornerRadius = UDim.new(0,8)
    local minimized = false
    minimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        frame.Size = minimized and UDim2.new(0,420,0,50) or UDim2.new(0,420,0,260)
        for i,btn in ipairs(frame:GetChildren()) do
            if btn:IsA("Frame") or btn:IsA("TextButton") then
                btn.Visible = not minimized
            end
        end
        title.Visible = true
        closeBtn.Visible = true
        minimizeBtn.Visible = true
    end)

    -- Sekmeler
    local tabs = {"Ana Sayfa","Krediler"}
    local tabButtons = {}
    local tabFrames = {}
    for i, tabName in ipairs(tabs) do
        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(0,180,0,28)
        btn.Position = UDim2.new(0, 20 + (i-1)*200, 0, 50)
        btn.Text = tabName
        btn.BackgroundColor3 = Color3.fromRGB(70,70,80)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 16
        local btnCorner = Instance.new("UICorner", btn)
        btnCorner.CornerRadius = UDim.new(0,6)
        table.insert(tabButtons, btn)

        local tabFrame = Instance.new("Frame", frame)
        tabFrame.Size = UDim2.new(1,-40,1,-100)
        tabFrame.Position = UDim2.new(0,20,0,90)
        tabFrame.BackgroundTransparency = 1
        tabFrame.Visible = (i==1)
        table.insert(tabFrames, tabFrame)
    end

    -- Ana Sayfa Butonları
    local speedBtn = Instance.new("TextButton", tabFrames[1])
    speedBtn.Size = UDim2.new(0,180,0,40)
    speedBtn.Position = UDim2.new(0,10,0,0)
    speedBtn.BackgroundColor3 = Color3.fromRGB(46,180,126)
    speedBtn.Text = "Hız = 100"
    speedBtn.TextColor3 = Color3.fromRGB(255,255,255)
    speedBtn.Font = Enum.Font.GothamBold
    speedBtn.TextSize = 18
    local btnCorner1 = Instance.new("UICorner", speedBtn)
    btnCorner1.CornerRadius = UDim.new(0,10)
    speedBtn.MouseButton1Click:Connect(function() player.Character:WaitForChild("Humanoid").WalkSpeed = 100 end)

    local jumpBtn = Instance.new("TextButton", tabFrames[1])
    jumpBtn.Size = UDim2.new(0,180,0,40)
    jumpBtn.Position = UDim2.new(0,10,0,50)
    jumpBtn.BackgroundColor3 = Color3.fromRGB(255,150,50)
    jumpBtn.Text = "JumpPower = 100"
    jumpBtn.TextColor3 = Color3.fromRGB(255,255,255)
    jumpBtn.Font = Enum.Font.GothamBold
    jumpBtn.TextSize = 18
    local btnCorner2 = Instance.new("UICorner", jumpBtn)
    btnCorner2.CornerRadius = UDim.new(0,10)
    jumpBtn.MouseButton1Click:Connect(function() player.Character:WaitForChild("Humanoid").JumpPower = 100 end)

    -- Fly Butonu (mobil uyumlu)
    local flyBtn = Instance.new("TextButton", tabFrames[1])
    flyBtn.Size = UDim2.new(0,180,0,40)
    flyBtn.Position = UDim2.new(0,10,0,100)
    flyBtn.BackgroundColor3 = Color3.fromRGB(100,149,237)
    flyBtn.Text = "Fly"
    flyBtn.TextColor3 = Color3.fromRGB(255,255,255)
    flyBtn.Font = Enum.Font.GothamBold
    flyBtn.TextSize = 18
    local btnCorner3 = Instance.new("UICorner", flyBtn)
    btnCorner3.CornerRadius = UDim.new(0,10)

    local flying = false
    local bodyVelocity
    local flySpeed = 50

    flyBtn.MouseButton1Click:Connect(function()
        flying = not flying
        local hrp = player.Character:WaitForChild("HumanoidRootPart")
        if flying then
            flyBtn.Text = "Fly: Açık"
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(400000,400000,400000)
            bodyVelocity.Velocity = Vector3.new(0,0,0)
            bodyVelocity.Parent = hrp

            local upDown = {Up=false,Down=false}
            UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space then upDown.Up = true end
                if input.KeyCode == Enum.KeyCode.LeftShift then upDown.Down = true end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space then upDown.Up = false end
                if input.KeyCode == Enum.KeyCode.LeftShift then upDown.Down = false end
            end)

            local conn
            conn = RunService.RenderStepped:Connect(function()
                if not flying then
                    if bodyVelocity then bodyVelocity:Destroy() end
                    conn:Disconnect()
                    flyBtn.Text = "Fly"
                else
                    local move = Vector3.new(0,0,0)
                    if upDown.Up then move = move + Vector3.new(0,flySpeed,0) end
                    if upDown.Down then move = move - Vector3.new(0,flySpeed,0) end
                    bodyVelocity.Velocity = move
                end
            end)
        else
            flyBtn.Text = "Fly"
            if bodyVelocity then bodyVelocity:Destroy() end
        end
    end)

    -- Noclip Butonu
    local noclipBtn = Instance.new("TextButton", tabFrames[1])
    noclipBtn.Size = UDim2.new(0,180,0,40)
    noclipBtn.Position = UDim2.new(0,10,0,150)
    noclipBtn.BackgroundColor3 = Color3.fromRGB(199,21,133)
    noclipBtn.Text = "N
