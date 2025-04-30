local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AvatarCustomizerGUI"

-- Title
local title = Instance.new("TextLabel", gui)
title.Size = UDim2.new(0, 350, 0, 50)
title.Position = UDim2.new(0, 20, 0, 20)
title.Text = "Avatar Customizer – Brookhaven Style"
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

-- Page control
local currentPage = 1
local totalPages = 3
local pages = {}

-- Create page
local function createPage()
	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 350, 0, 250)
	frame.Position = UDim2.new(0, 20, 0, 80)
	frame.BackgroundTransparency = 1
	frame.Visible = false
	table.insert(pages, frame)
	return frame
end

-- Create button
local function createButton(parent, posY, text, callback)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 20
	btn.MouseButton1Click:Connect(callback)
end

-- Page 1: Height
local page1 = createPage()
createButton(page1, 0, "Increase Height", function()
	hum.BodyHeightScale.Value = 1.5
end)
createButton(page1, 50, "Decrease Height", function()
	hum.BodyHeightScale.Value = 0.8
end)

-- Page 2: Arms
local page2 = createPage()
createButton(page2, 0, "Widen Arms", function()
	hum.BodyWidthScale.Value = 1.3
end)
createButton(page2, 50, "Thin Arms", function()
	hum.BodyWidthScale.Value = 0.6
end)

-- Page 3: Body Type
local page3 = createPage()
createButton(page3, 0, "Human Body Type", function()
	hum.BodyTypeScale.Value = 0
end)
createButton(page3, 50, "Robot Body Type", function()
	hum.BodyTypeScale.Value = 1
end)

-- Page switching
local function updatePages()
	for i, frame in pairs(pages) do
		frame.Visible = (i == currentPage)
	end
end

-- Next / Back buttons
local nextBtn = Instance.new("TextButton", gui)
nextBtn.Size = UDim2.new(0, 100, 0, 40)
nextBtn.Position = UDim2.new(0, 240, 0, 350)
nextBtn.Text = "Next →"
nextBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
nextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
nextBtn.Font = Enum.Font.GothamBold
nextBtn.TextSize = 18
nextBtn.MouseButton1Click:Connect(function()
	currentPage = math.clamp(currentPage + 1, 1, totalPages)
	updatePages()
end)

local backBtn = Instance.new("TextButton", gui)
backBtn.Size = UDim2.new(0, 100, 0, 40)
backBtn.Position = UDim2.new(0, 130, 0, 350)
backBtn.Text = "← Back"
backBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 18
backBtn.MouseButton1Click:Connect(function()
	currentPage = math.clamp(currentPage - 1, 1, totalPages)
	updatePages()
end)

-- First page shown
updatePages()
