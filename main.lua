local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local viewport = workspace.CurrentCamera.ViewportSize

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SchoolFightGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = lp:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 460, 0, 260)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.ZIndex = 1
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Transparency = 0.85
MainStroke.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(5, 5, 5))
}
MainGradient.Rotation = 45
MainGradient.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 10
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "School Fight"
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 19
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 11
Title.Parent = TopBar

local SubTitle = Instance.new("TextLabel")
SubTitle.Name = "SubTitle"
SubTitle.Text = "CodeNinja"
SubTitle.Size = UDim2.new(0, 100, 1, 0)
SubTitle.Position = UDim2.new(0, 140, 0, 2)
SubTitle.BackgroundTransparency = 1
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SubTitle.TextSize = 12
SubTitle.TextTransparency = 0.5
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.ZIndex = 11
SubTitle.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamMedium
CloseBtn.TextSize = 26
CloseBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -42, 0.5, -16)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundTransparency = 0.95
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 12
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseBtn

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Thickness = 1
CloseStroke.Color = Color3.fromRGB(255, 255, 255)
CloseStroke.Transparency = 0.9
CloseStroke.Parent = CloseBtn

local MiniBtn = Instance.new("TextButton")
MiniBtn.Name = "MiniBtn"
MiniBtn.Text = "−"
MiniBtn.Font = Enum.Font.GothamMedium
MiniBtn.TextSize = 26
MiniBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
MiniBtn.Size = UDim2.new(0, 32, 0, 32)
MiniBtn.Position = UDim2.new(1, -82, 0.5, -16)
MiniBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MiniBtn.BackgroundTransparency = 0.95
MiniBtn.AutoButtonColor = false
MiniBtn.ZIndex = 12
MiniBtn.Parent = TopBar

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 10)
MiniCorner.Parent = MiniBtn

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Thickness = 1
MiniStroke.Color = Color3.fromRGB(255, 255, 255)
MiniStroke.Transparency = 0.9
MiniStroke.Parent = MiniBtn

local function AddHover(btn)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.85}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.95}):Play()
    end)
end
AddHover(CloseBtn)
AddHover(MiniBtn)

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -40, 1, -70)
Container.Position = UDim2.new(0, 20, 0, 60)
Container.BackgroundTransparency = 1
Container.ZIndex = 5
Container.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 12)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Parent = Container

local function CreateControl(name, placeholder, callback)
    local ControlFrame = Instance.new("Frame")
    ControlFrame.Name = name .. "Frame"
    ControlFrame.Size = UDim2.new(1, 0, 0, 55)
    ControlFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ControlFrame.BackgroundTransparency = 0.97
    ControlFrame.ZIndex = 6
    ControlFrame.Parent = Container
    
    local CFC = Instance.new("UICorner")
    CFC.CornerRadius = UDim.new(0, 12)
    CFC.Parent = ControlFrame
    
    local CFStroke = Instance.new("UIStroke")
    CFStroke.Thickness = 1
    CFStroke.Color = Color3.fromRGB(255, 255, 255)
    CFStroke.Transparency = 0.92
    CFStroke.Parent = ControlFrame
    
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.6, 0, 1, 0)
    TextBox.Position = UDim2.new(0, 15, 0, 0)
    TextBox.BackgroundTransparency = 1
    TextBox.Font = Enum.Font.Gotham
    TextBox.PlaceholderText = placeholder
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(240, 240, 240)
    TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
    TextBox.TextSize = 14
    TextBox.TextXAlignment = Enum.TextXAlignment.Left
    TextBox.ZIndex = 7
    TextBox.Parent = ControlFrame
    
    local ApplyBtn = Instance.new("TextButton")
    ApplyBtn.Text = "Apply"
    ApplyBtn.Size = UDim2.new(0, 100, 0, 36)
    ApplyBtn.Position = UDim2.new(1, -110, 0.5, -18)
    ApplyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ApplyBtn.BackgroundTransparency = 0.92
    ApplyBtn.Font = Enum.Font.GothamMedium
    ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ApplyBtn.TextSize = 12
    ApplyBtn.AutoButtonColor = false
    ApplyBtn.ZIndex = 7
    ApplyBtn.Parent = ControlFrame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 10)
    BtnCorner.Parent = ApplyBtn
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Thickness = 1
    BtnStroke.Color = Color3.fromRGB(255, 255, 255)
    BtnStroke.Transparency = 0.8
    BtnStroke.Parent = ApplyBtn
    
    ApplyBtn.MouseEnter:Connect(function()
        TweenService:Create(ApplyBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.8}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
    end)
    
    ApplyBtn.MouseLeave:Connect(function()
        TweenService:Create(ApplyBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.92}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Transparency = 0.8}):Play()
    end)
    
    ApplyBtn.MouseButton1Click:Connect(function()
        local num = tonumber(TextBox.Text)
        if num then
            callback(num)
            local ti = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(ApplyBtn, ti, {Size = UDim2.new(0, 95, 0, 34)}):Play()
            wait(0.1)
            TweenService:Create(ApplyBtn, ti, {Size = UDim2.new(0, 100, 0, 36)}):Play()
        end
    end)
end

local tpWalkConnection
local function setTpWalk(speed)
    if tpWalkConnection then
        tpWalkConnection:Disconnect()
        tpWalkConnection = nil
    end
    
    if speed > 0 then
        tpWalkConnection = RunService.Heartbeat:Connect(function(dt)
            local char = lp.Character
            if not char then return end
            local hum = char:FindFirstChild("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if hum and root and hum.MoveDirection.Magnitude > 0 then
                root.CFrame = root.CFrame + (hum.MoveDirection * speed * dt)
            end
        end)
    end
end

local _G_HitboxSize = 2
local _G_HitboxTransparency = 0.7

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            hrp.Size = Vector3.new(_G_HitboxSize, _G_HitboxSize, _G_HitboxSize)
            hrp.Transparency = _G_HitboxTransparency
            hrp.CanCollide = false
            hrp.Color = Color3.fromRGB(255, 0, 0)
        end
    end
end)

CreateControl("TPWalk", "TPWalk Speed...", function(val)
    setTpWalk(val)
end)

CreateControl("Hitbox", "Hitbox Size...", function(val)
    _G_HitboxSize = val
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    local tween = TweenService:Create(MainFrame, TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = targetPos})
    tween:Play()
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local isMinimized = false
local fullSizeHeight = 260
local miniSizeHeight = 50
local currentSizeHeight = fullSizeHeight
local width = 460

MiniBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetHeight = isMinimized and miniSizeHeight or fullSizeHeight
    local heightDiff = targetHeight - currentSizeHeight
    local posOffset = heightDiff * 0.5 
    local currentPos = MainFrame.Position
    local targetPos = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, currentPos.Y.Offset + posOffset)
    
    if isMinimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, width, 0, targetHeight), Position = targetPos}):Play()
        TweenService:Create(Container, TweenInfo.new(0.2), {GroupTransparency = 1}):Play()
        task.delay(0.2, function() if isMinimized then Container.Visible = false end end)
    else
        Container.Visible = true
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, width, 0, targetHeight), Position = targetPos}):Play()
        TweenService:Create(Container, TweenInfo.new(0.4), {GroupTransparency = 0}):Play()
    end
    currentSizeHeight = targetHeight
end)

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    wait(0.3)
    ScreenGui:Destroy()
end)

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundTransparency = 1
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, width, 0, fullSizeHeight), BackgroundTransparency = 0.3}):Play()
