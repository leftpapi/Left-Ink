-- services
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local replicated = game:GetService("ReplicatedStorage")

-- saved positions for each minigame
local rlglPos = Vector3.new(-45.0, 1023.3, 95.1)
local lightsOutPos = Vector3.new(195.6, 122.7, -93.1)
local glassBridgePos = Vector3.new(-206.4, 520.7, -1534.0)

-- tools allowed during lights out
local lightsOutItems = {
	["Fork"] = true,
	["Soda"] = true,
	["Bottle"] = true,
	["Kimbap"] = true
}

-- create gui
local gui = Instance.new("ScreenGui")
gui.Name = "AutoFarmGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 160, 0, 60)
frame.Position = UDim2.new(0.05, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.Parent = frame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 140, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.Gotham
toggleBtn.TextSize = 16
toggleBtn.Text = "Farm: OFF"
toggleBtn.Parent = frame

local toggleCorner = Instance.new("UICorner")
toggleCorner.Parent = toggleBtn

local farming = false

-- auto dalgona
local function doDalgona()
	if not farming then return end

	local dalgonaScript = replicated:WaitForChild("Modules"):WaitForChild("Games"):WaitForChild("DalgonaClient")

	for _, fn in ipairs(getreg()) do
		if typeof(fn) == "function" and islclosure(fn) then
			local env = getfenv(fn)
			if env and env.script == dalgonaScript then
				local info = debug.getinfo(fn)
				if info and info.nups == 73 then
					setupvalue(fn, 31, 9e9)
					break
				end
			end
		end
	end
end

-- teleport based on tool name
local function checkTool(toolName)
	if not farming then return end

	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end

	if toolName == "Pocket Sand" then
		root.CFrame = CFrame.new(rlglPos)
	elseif lightsOutItems[toolName] then
		root.CFrame = CFrame.new(lightsOutPos)
	end
end

-- tool added to backpack
player.Backpack.ChildAdded:Connect(function(tool)
	checkTool(tool.Name)
end)

-- tool added to character
player.CharacterAdded:Connect(function(char)
	char.ChildAdded:Connect(function(tool)
		checkTool(tool.Name)
	end)

	task.wait(0.5)

	if farming then
		local root = char:FindFirstChild("HumanoidRootPart")
		if root and root.Position.Y > 500 then
			root.CFrame = CFrame.new(glassBridgePos)
		end

		doDalgona()
	end
end)

-- toggle button
toggleBtn.MouseButton1Click:Connect(function()
	farming = not farming
	toggleBtn.Text = "Farm: " .. (farming and "ON" or "OFF")
	toggleBtn.BackgroundColor3 = farming and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 50)

	if farming then
		doDalgona()
	end
end)