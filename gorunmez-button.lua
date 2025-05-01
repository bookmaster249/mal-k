-- Basit görünmezlik butonu GUI'si
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Button.Parent = ScreenGui
Button.Text = "Görünmez Ol"
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.9, -25)
Button.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 22

Button.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        for _,v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                v.Transparency = 1
                if v:FindFirstChild("face") then
                    v.face:Destroy()
                end
            end
        end
        Button.Text = "Artık Görünmezsin 😎"
        Button.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
    end
end)
