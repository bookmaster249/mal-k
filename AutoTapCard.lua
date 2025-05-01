local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AutoTapCardGui"

-- Kart görünümü
local card = Instance.new("TextButton")
card.Size = UDim2.new(0, 200, 0, 100)
card.Position = UDim2.new(0, 20, 0, 300)
card.Text = "AUTO TAP: OFF"
card.TextSize = 20
card.Font = Enum.Font.GothamBold
card.TextColor3 = Color3.fromRGB(255, 255, 255)
card.BackgroundColor3 = Color3.fromRGB(255, 60, 60) -- Kırmızı (kapalı)
card.BorderSizePixel = 0
card.Parent = gui

-- Ayar
local autoTap = false
local delay = 0.1 -- tıklama hızı

-- Görünümü güncelle
local function updateCard()
	if autoTap then
		card.Text = "AUTO TAP: ON"
		card.BackgroundColor3 = Color3.fromRGB(60, 200, 60) -- Yeşil
	else
		card.Text = "AUTO TAP: OFF"
		card.BackgroundColor3 = Color3.fromRGB(255, 60, 60) -- Kırmızı
	end
end

-- Kart tıklandığında aktif/pasif geçiş
card.MouseButton1Click:Connect(function()
	autoTap = not autoTap
	updateCard()
end)

-- Auto tap döngüsü
task.spawn(function()
	while true do
		if autoTap then
			mouse1click()
		end
		task.wait(delay)
	end
end)

-- Başlangıç görünümü ayarla
updateCard()
