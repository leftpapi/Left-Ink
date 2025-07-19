-- Services
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Coordinates
local coords_RLGL = Vector3.new(-45.0, 1023.3, 95.1)
local coords_LightsOut = Vector3.new(195.6, 122.7, -93.1)
local coords_GlassBridge = Vector3.new(-206.4, 520.7, -1534.0)

-- Lights Out valid tools
local lightsOutTools = {
	["Fork"] = true,
	["Soda"] = true,
	["Bottle"] = true,
	["Kimbap"] = true
}

-- UI Setup
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "AutoFarmGui"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Position = UDim2.new(0.05, 0, 0.2, 0)
frame.Size = UDim2.new(0, 160, 0, 60)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

local farmToggle = Instance.new("TextButton", frame)
farmToggle.Size = UDim2.new(0, 140, 0, 40)
farmToggle.Position = UDim2.new(0, 10, 0, 10)
farmToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
farmToggle.TextColor3 = Color3.new(1, 1, 1)
farmToggle.Font = Enum.Font.Gotham
farmToggle.TextSize = 16
farmToggle.Text = "Farm: OFF"
Instance.new("UICorner", farmToggle)

local farmEnabled = false

-- Dalgona Logic
local function runDalgonaHack()
	if not farmEnabled then return end

	local DalgonaClient = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Games"):WaitForChild("DalgonaClient")

	for _, fn in ipairs(getreg()) do
		if typeof(fn) == "function" and islclosure(fn) then
			local env = getfenv(fn)
			if env and env.script == DalgonaClient then
				local info = debug.getinfo(fn)
				if info and info.nups == 73 then
					setupvalue(fn, 31, 9e9)
					break
				end
			end
		end
	end
end

-- Teleport check
local function checkTool(name)
	if not farmEnabled then return end

	if name == "Pocket Sand" then
		local char = player.Character or player.CharacterAdded:Wait()
		local root = char:FindFirstChild("HumanoidRootPart")
		if root then root.CFrame = CFrame.new(coords_RLGL) end
	elseif lightsOutTools[name] then
		local char = player.Character or player.CharacterAdded:Wait()
		local root = char:FindFirstChild("HumanoidRootPart")
		if root then root.CFrame = CFrame.new(coords_LightsOut) end
	end
end

-- Backpack tools
player.Backpack.ChildAdded:Connect(function(tool)
	checkTool(tool.Name)
end)

-- Character tools + Glass Bridge Y-check
player.CharacterAdded:Connect(function(char)
	char.ChildAdded:Connect(function(tool)
		checkTool(tool.Name)
	end)

	task.wait(0.5)
	if farmEnabled then
		local root = char:FindFirstChild("HumanoidRootPart")
		if root and root.Position.Y > 500 then
			root.CFrame = CFrame.new(coords_GlassBridge)
		end

		runDalgonaHack()
	end
end)

-- Toggle handler
farmToggle.MouseButton1Click:Connect(function()
	farmEnabled = not farmEnabled
	farmToggle.Text = "Farm: " .. (farmEnabled and "ON" or "OFF")
	farmToggle.BackgroundColor3 = farmEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 50)

	if farmEnabled then
		runDalgonaHack()
	end
end)