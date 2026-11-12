-- BREAK & STEAL AN EGG - GUI DEMO
-- UI only: buttons toggle visual states; no game automation/exploits.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("BreakAndStealHub")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "BreakAndStealHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(270, 315)
main.Position = UDim2.new(0.5, -135, 0.5, -157)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -42, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(105, 65, 220)
title.Text = "BREAK & STEAL EGG"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 17
title.Font = Enum.Font.GothamBold
title.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = title

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(32, 32)
close.Position = UDim2.new(1, -37, 0, 6)
close.BackgroundColor3 = Color3.fromRGB(200, 45, 45)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextSize = 15
close.Parent = main
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

local features = {
    "Auto Steal Egg",
    "Auto Collect",
    "Auto Hatch",
    "ESP Egg",
    "Auto Farm"
}

local states = {}

for i, name in ipairs(features) do
    states[name] = false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.88, 0, 0, 40)
    button.Position = UDim2.new(0.06, 0, 0, 58 + (i - 1) * 48)
    button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.Text = name .. " : OFF"
    button.Parent = main
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

    button.Activated:Connect(function()
        states[name] = not states[name]
        button.Text = name .. (states[name] and " : ON" or " : OFF")
        button.BackgroundColor3 = states[name]
            and Color3.fromRGB(40, 150, 85)
            or Color3.fromRGB(55, 55, 65)
    end)
end

close.Activated:Connect(function()
    gui:Destroy()
end)
