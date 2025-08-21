--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @V3x
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

Credits to V3x
]=]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local G2L = {}

G2L["ScreenGui_1"] = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"])
G2L["Frame_2"]["BorderSizePixel"] = 0
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(74, 74, 74)
G2L["Frame_2"]["Size"] = UDim2.new(0.19062, 0, 0.18329, 0)
G2L["Frame_2"]["Position"] = UDim2.new(0.22344, 0, 0.20216, 0)
G2L["Frame_2"]["BackgroundTransparency"] = 0.25

G2L["TextBox_3"] = Instance.new("TextBox", G2L["Frame_2"])
G2L["TextBox_3"]["CursorPosition"] = -1
G2L["TextBox_3"]["BorderSizePixel"] = 0
G2L["TextBox_3"]["BackgroundColor3"] = Color3.fromRGB(174, 174, 174)
G2L["TextBox_3"]["Size"] = UDim2.new(0.92623, 0, 0.48529, 0)
G2L["TextBox_3"]["Position"] = UDim2.new(0.04098, 0, 0.02941, 0)
G2L["TextBox_3"]["Text"] = ""
G2L["TextBox_3"]["PlaceholderText"] = "Enter username..."

G2L["UICorner_4"] = Instance.new("UICorner", G2L["TextBox_3"])
G2L["UICorner_5"] = Instance.new("UICorner", G2L["Frame_2"])

G2L["TextButton_6"] = Instance.new("TextButton", G2L["Frame_2"])
G2L["TextButton_6"]["BorderSizePixel"] = 0
G2L["TextButton_6"]["BackgroundColor3"] = Color3.fromRGB(190, 190, 190)
G2L["TextButton_6"]["Size"] = UDim2.new(0.36885, 0, 0.33824, 0)
G2L["TextButton_6"]["Position"] = UDim2.new(0.04918, 0, 0.60294, 0)
G2L["TextButton_6"]["Text"] = "Ban the skid."

G2L["UICorner_7"] = Instance.new("UICorner", G2L["TextButton_6"])

G2L["TextButton_6"].MouseButton1Click:Connect(function()
    local targetUsername = G2L["TextBox_3"].Text
    if targetUsername == "" then
        G2L["TextBox_3"].Text = "ENTER USERNAME FIRST!"
        wait(2)
        G2L["TextBox_3"].Text = ""
        return
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower() == targetUsername:lower() or player.DisplayName:lower() == targetUsername:lower() then
            G2L["TextBox_3"].Text = "Banning " .. player.Name:upper() .. "..."
            wait(1.5)
            G2L["TextBox_3"].Text = "SUCCESS! " .. player.Name:upper() .. " user banned"
            wait(1)
            G2L["TextBox_3"].Text = ""
            player:Kick("Kicked by client-side tool")
            return
        end
    end
    
    G2L["TextBox_3"].Text = "PLAYER NOT FOUND!"
    wait(2)
    G2L["TextBox_3"].Text = ""
end)

return G2L["ScreenGui_1"]
