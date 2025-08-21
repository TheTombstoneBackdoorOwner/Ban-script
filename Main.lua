local player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local BanGui = Instance.new("ScreenGui")
BanGui.Name = "DestroyTool"
BanGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 150)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = BanGui

local TargetBox = Instance.new("TextBox")
TargetBox.Size = UDim2.new(0.8, 0, 0, 35)
TargetBox.Position = UDim2.new(0.1, 0, 0.2, 0)
TargetBox.PlaceholderText = "Enter username"
TargetBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.Font = Enum.Font.Gotham
TargetBox.TextSize = 14
TargetBox.Parent = MainFrame

local DestroyButton = Instance.new("TextButton")
DestroyButton.Size = UDim2.new(0.6, 0, 0, 40)
DestroyButton.Position = UDim2.new(0.2, 0, 0.6, 0)
DestroyButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
DestroyButton.Text = "DESTROY"
DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DestroyButton.Font = Enum.Font.GothamBold
DestroyButton.TextSize = 16
DestroyButton.Parent = MainFrame

DestroyButton.MouseButton1Click:Connect(function()
    local targetName = TargetBox.Text
    if targetName == "" then return end
    
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Name:lower():find(targetName:lower()) or v.DisplayName:lower():find(targetName:lower()) then
            pcall(function()
                v:Destroy()
            end)
        end
    end
end)
