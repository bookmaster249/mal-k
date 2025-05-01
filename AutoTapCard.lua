local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI OLUŞTUR
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AutoTapCardGUI"

-- KART GÖRÜNÜMÜ
local card = Instance.new("TextButton")
card.Size = UDim2.new(0, 200, 0, 100)
card.Position = UDim2.new(0, 30, 0, 300)
card.Text = "AUTO TAP: OFF"
card.TextSize = 20
card.Font = Enum.Font.GothamBold
card.TextColor3 = Color3.fromRGB(255, 255, 255)
card.BackgroundColor3 = Color3.fromRGB(255, 60, 60) -- Kırmızı (kapalı)
card.BorderSizePixel = 0
card.Parent = gui

-- AYARLAR
local autoTap = false
local tapSpeed = 0.1

-- BUTON YERİ (OYUNDAKİ BUTONUN YOLU)
-- Burayı kendi GUI yapına göre düzenle!
local targetButton
pcall(function()
	targetButton = player.PlayerGui:WaitForChild("PhantomBallGui"):WaitForChild("BlockY")
end)

-- GÖRÜNÜM GÜNCELLE
local function updateCard()
	if autoTap then
		card.Text = "AUTO TAP: ON"
		card.BackgroundColor3 = Color3.fromRGB(60, 200, 60) -- Yeşil
	else
		card.Text = "AUTO TAP: OFF"
		card.BackgroundColor3 = Color3.fromRGB(255, 60, 60) -- Kırmızı
	end
end
updateCard()

-- TIKLANINCA DURUM DEĞİŞTİR
card.MouseButton1Click:Connect(function()
	autoTap = not autoTap
	updateCard()
end)

-- OTOMATİK TIKLAMA DÖNGÜSÜ
task.spawn(function()
	while true do
		if autoTap and targetButton then
			pcall(function()
				targetButton:Activate() -- Gerçek butona tıklama
			end)
		end
		task.wait(tapSpeed)
	end
end)
