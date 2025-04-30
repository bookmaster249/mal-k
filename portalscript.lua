local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local savedCFrame = nil

-- GUI Oluştur
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "PortalGui"

-- Kaydetme Butonu
local saveBtn = Instance.new("TextButton", screenGui)
saveBtn.Size = UDim2.new(0, 150, 0, 50)
saveBtn.Position = UDim2.new(0, 20, 0, 300)
saveBtn.Text = "📍 Konumu Kaydet (P)"
saveBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
saveBtn.TextSize = 18

-- Dönüş Butonu
local returnBtn = Instance.new("TextButton", screenGui)
returnBtn.Size = UDim2.new(0, 150, 0, 50)
returnBtn.Position = UDim2.new(0, 20, 0, 360)
returnBtn.Text = "⏪ Geri Dön (O)"
returnBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 50)
returnBtn.TextSize = 18

-- Kaydet fonksiyonu
local function savePosition()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		savedCFrame = player.Character.HumanoidRootPart.CFrame
		game.StarterGui:SetCore("SendNotification", {
			Title = "Konum Kaydedildi",
			Text = "Geri dönüş için O tuşuna bas ya da butona tıkla.",
			Duration = 3
		})
	end
end

-- Geri dön fonksiyonu
local function returnToSaved()
	if savedCFrame and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame = savedCFrame + Vector3.new(0, 3, 0)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Geri Dönüldü",
			Text = "Başarıyla ışınlandın!",
			Duration = 3
		})
	end
end

-- Tuş ve buton bağlantıları
saveBtn.MouseButton1Click:Connect(savePosition)
returnBtn.MouseButton1Click:Connect(returnToSaved)

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.P then
		savePosition()
	elseif input.KeyCode == Enum.KeyCode.O then
		returnToSaved()
	end
end)
