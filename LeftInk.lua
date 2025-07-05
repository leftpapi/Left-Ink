--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local TweenService = game:GetService("TweenService");
local UserInput = game:GetService("UserInputService");
local Workspace = game:GetService("Workspace");
local player = Players.LocalPlayer;
local cam = Workspace.CurrentCamera;
local guiParent = player:WaitForChild("PlayerGui");
local AIM_LERP_SPEED = 0.1;
local isEspOn = false;
local isAimbotOn = false;
local isInfiniteJumpOn = false;
local walkSpeed = 28;
local isKillAllOn = false;
local killAllThread = nil;
local function showErrorOverlay(errMsg)
	local FlatIdent_2953F = 0;
	local screenGui;
	local frame;
	local corner;
	local label;
	while true do
		if (FlatIdent_2953F == 3) then
			label.Position = UDim2.new(0, 10, 0, 10);
			label.BackgroundTransparency = 1;
			label.TextColor3 = Color3.new(1, 1, 1);
			label.Font = Enum.Font.FredokaOne;
			FlatIdent_2953F = 4;
		end
		if (FlatIdent_2953F == 2) then
			corner = Instance.new("UICorner", frame);
			corner.CornerRadius = UDim.new(0, 12);
			label = Instance.new("TextLabel", frame);
			label.Size = UDim2.new(1, -20, 1, -20);
			FlatIdent_2953F = 3;
		end
		if (FlatIdent_2953F == 4) then
			label.TextSize = 18;
			label.TextWrapped = true;
			label.Text = ("Something seems off.\nDM leftpapi on Discord for help.\n\nError: %s"):format(tostring(errMsg));
			break;
		end
		if (1 == FlatIdent_2953F) then
			frame.Size = UDim2.new(0, 400, 0, 100);
			frame.Position = UDim2.new(0, 10, 1, -110);
			frame.BackgroundColor3 = Color3.fromRGB(170, 35, 35);
			frame.BorderSizePixel = 0;
			FlatIdent_2953F = 2;
		end
		if (FlatIdent_2953F == 0) then
			screenGui = Instance.new("ScreenGui", guiParent);
			screenGui.Name = "ErrorOverlay";
			screenGui.ResetOnSpawn = false;
			frame = Instance.new("Frame", screenGui);
			FlatIdent_2953F = 1;
		end
	end
end
local function showThankYouMsg()
	local FlatIdent_60EA1 = 0;
	local screenGui;
	local frame;
	local corner;
	local circle;
	local circleCorner;
	local iconLabel;
	local message;
	while true do
		if (FlatIdent_60EA1 == 4) then
			iconLabel.TextSize = 20;
			iconLabel.Rotation = 180;
			message = Instance.new("TextLabel", frame);
			message.Size = UDim2.new(1, -45, 1, 0);
			message.Position = UDim2.new(0, 40, 0, 0);
			message.BackgroundTransparency = 1;
			FlatIdent_60EA1 = 5;
		end
		if (1 == FlatIdent_60EA1) then
			frame.AnchorPoint = Vector2.new(0.5, 0);
			frame.BackgroundColor3 = Color3.fromRGB(22, 34, 72);
			frame.BorderSizePixel = 0;
			corner = Instance.new("UICorner", frame);
			corner.CornerRadius = UDim.new(0, 10);
			circle = Instance.new("Frame", frame);
			FlatIdent_60EA1 = 2;
		end
		if (FlatIdent_60EA1 == 2) then
			circle.Size = UDim2.new(0, 30, 0, 30);
			circle.Position = UDim2.new(0, 5, 0.5, -15);
			circle.BackgroundColor3 = Color3.new(1, 1, 1);
			circle.BorderSizePixel = 0;
			circleCorner = Instance.new("UICorner", circle);
			circleCorner.CornerRadius = UDim.new(1, 0);
			FlatIdent_60EA1 = 3;
		end
		if (5 == FlatIdent_60EA1) then
			message.Text = "ty for using left ink :)";
			message.TextColor3 = Color3.new(1, 1, 1);
			message.Font = Enum.Font.FredokaOne;
			message.TextSize = 16;
			message.TextXAlignment = Enum.TextXAlignment.Left;
			TweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency=0}):Play();
			FlatIdent_60EA1 = 6;
		end
		if (FlatIdent_60EA1 == 3) then
			iconLabel = Instance.new("TextLabel", circle);
			iconLabel.Size = UDim2.new(1, 0, 1, 0);
			iconLabel.BackgroundTransparency = 1;
			iconLabel.Text = "i";
			iconLabel.TextColor3 = Color3.new(0, 0, 0);
			iconLabel.Font = Enum.Font.FredokaOne;
			FlatIdent_60EA1 = 4;
		end
		if (FlatIdent_60EA1 == 6) then
			task.wait(3);
			TweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency=1}):Play();
			task.wait(0.3);
			screenGui:Destroy();
			break;
		end
		if (FlatIdent_60EA1 == 0) then
			screenGui = Instance.new("ScreenGui", guiParent);
			screenGui.Name = "ThankYouGui";
			screenGui.ResetOnSpawn = false;
			frame = Instance.new("Frame", screenGui);
			frame.Size = UDim2.new(0, 190, 0, 40);
			frame.Position = UDim2.new(0.5, 0, 0, 40);
			FlatIdent_60EA1 = 1;
		end
	end
end
local mainGuiFrame;
local toggleButton;
local function createMainGui()
	local screenGui = Instance.new("ScreenGui", guiParent);
	screenGui.Name = "LeftInkMainGui";
	screenGui.ResetOnSpawn = false;
	local frame = Instance.new("Frame", screenGui);
	frame.Size = UDim2.new(0, 200, 0, 220);
	frame.Position = UDim2.new(0.5, 0, 0.5, 0);
	frame.AnchorPoint = Vector2.new(0.5, 0.5);
	frame.BackgroundColor3 = Color3.fromRGB(22, 34, 72);
	frame.BorderSizePixel = 0;
	frame.Active = true;
	frame.Draggable = true;
	frame.BackgroundTransparency = 1;
	local frameCorner = Instance.new("UICorner", frame);
	frameCorner.CornerRadius = UDim.new(0, 12);
	local title = Instance.new("TextLabel", frame);
	title.Size = UDim2.new(1, 0, 0, 30);
	title.Text = "Left Ink";
	title.TextColor3 = Color3.fromRGB(220, 220, 220);
	title.BackgroundColor3 = Color3.fromRGB(16, 24, 52);
	title.Font = Enum.Font.FredokaOne;
	title.TextSize = 20;
	title.BorderSizePixel = 0;
	local titleCorner = Instance.new("UICorner", title);
	titleCorner.CornerRadius = UDim.new(0, 12);
	local function makeToggle(text, yPos, callback)
		local FlatIdent_703C8 = 0;
		local btn;
		local corner;
		while true do
			if (FlatIdent_703C8 == 0) then
				btn = Instance.new("TextButton", frame);
				btn.Size = UDim2.new(1, -20, 0, 28);
				btn.Position = UDim2.new(0, 10, 0, yPos);
				btn.BackgroundColor3 = Color3.new(1, 1, 1);
				FlatIdent_703C8 = 1;
			end
			if (FlatIdent_703C8 == 1) then
				btn.TextColor3 = Color3.new(0, 0, 0);
				btn.Font = Enum.Font.FredokaOne;
				btn.TextSize = 16;
				btn.Text = text .. " [OFF]";
				FlatIdent_703C8 = 2;
			end
			if (FlatIdent_703C8 == 2) then
				corner = Instance.new("UICorner", btn);
				corner.CornerRadius = UDim.new(0, 8);
				btn.MouseButton1Click:Connect(function()
					local FlatIdent_17196 = 0;
					local isOff;
					while true do
						if (FlatIdent_17196 == 1) then
							callback(isOff);
							break;
						end
						if (FlatIdent_17196 == 0) then
							isOff = btn.Text:find("OFF") ~= nil;
							btn.Text = text .. ((isOff and " [ON]") or " [OFF]");
							FlatIdent_17196 = 1;
						end
					end
				end);
				return btn;
			end
		end
	end
	makeToggle("Aimbot (Rebel)", 40, function(on)
		isAimbotOn = on;
	end);
	makeToggle("ESP (Rebel)", 75, function(on)
		isEspOn = on;
	end);
	makeToggle("Infinite Jump", 110, function(on)
		isInfiniteJumpOn = on;
	end);
	makeToggle("Kill All (Fork)", 145, function(on)
		local FlatIdent_5BA5E = 0;
		while true do
			if (FlatIdent_5BA5E == 1) then
				if on then
					local FlatIdent_295EB = 0;
					while true do
						if (FlatIdent_295EB == 0) then
							killAllThread = coroutine.create(function()
								while isKillAllOn and player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Fork") do
									local char = player.Character;
									if (char and char:FindFirstChild("HumanoidRootPart")) then
										for _, target in pairs(Players:GetPlayers()) do
											if ((target ~= player) and target.Character and target.Character:FindFirstChild("HumanoidRootPart")) then
												if (target.Character:FindFirstChildOfClass("Humanoid").Health > 0) then
													local FlatIdent_981A3 = 0;
													local hrp;
													local fork;
													while true do
														if (FlatIdent_981A3 == 0) then
															hrp = char:FindFirstChild("HumanoidRootPart");
															hrp.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1);
															FlatIdent_981A3 = 1;
														end
														if (FlatIdent_981A3 == 2) then
															if fork then
																player.Character.Humanoid:EquipTool(fork);
																task.wait(0.1);
																fork:Activate();
																task.wait(0.5);
															end
															break;
														end
														if (FlatIdent_981A3 == 1) then
															task.wait(0.2);
															fork = player.Backpack:FindFirstChild("Fork");
															FlatIdent_981A3 = 2;
														end
													end
												end
											end
										end
									end
									task.wait(0.5);
								end
							end);
							coroutine.resume(killAllThread);
							break;
						end
					end
				end
				break;
			end
			if (FlatIdent_5BA5E == 0) then
				isKillAllOn = on;
				if killAllThread then
					killAllThread = nil;
				end
				FlatIdent_5BA5E = 1;
			end
		end
	end);
	local speedLabel = Instance.new("TextLabel", frame);
	speedLabel.Text = "Speed:";
	speedLabel.Size = UDim2.new(0, 50, 0, 28);
	speedLabel.Position = UDim2.new(0, 10, 0, 180);
	speedLabel.TextColor3 = Color3.new(1, 1, 1);
	speedLabel.BackgroundTransparency = 1;
	speedLabel.Font = Enum.Font.FredokaOne;
	speedLabel.TextSize = 16;
	speedLabel.TextXAlignment = Enum.TextXAlignment.Left;
	local speedInput = Instance.new("TextBox", frame);
	speedInput.Size = UDim2.new(1, -70, 0, 28);
	speedInput.Position = UDim2.new(0, 65, 0, 180);
	speedInput.Text = tostring(walkSpeed);
	speedInput.ClearTextOnFocus = false;
	speedInput.TextColor3 = Color3.new(0, 0, 0);
	speedInput.BackgroundColor3 = Color3.new(1, 1, 1);
	speedInput.Font = Enum.Font.FredokaOne;
	speedInput.TextSize = 16;
	local inputCorner = Instance.new("UICorner", speedInput);
	inputCorner.CornerRadius = UDim.new(0, 8);
	speedInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local FlatIdent_9622C = 0;
			local val;
			local hum;
			while true do
				if (FlatIdent_9622C == 1) then
					speedInput.Text = tostring(walkSpeed);
					hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid");
					FlatIdent_9622C = 2;
				end
				if (FlatIdent_9622C == 0) then
					val = tonumber(speedInput.Text);
					if val then
						local FlatIdent_8B523 = 0;
						while true do
							if (FlatIdent_8B523 == 1) then
								walkSpeed = val;
								break;
							end
							if (FlatIdent_8B523 == 0) then
								if (val < 28) then
									val = 28;
								end
								if (val > 100) then
									val = 100;
								end
								FlatIdent_8B523 = 1;
							end
						end
					end
					FlatIdent_9622C = 1;
				end
				if (FlatIdent_9622C == 2) then
					if hum then
						hum.WalkSpeed = walkSpeed;
					end
					break;
				end
			end
		end
	end);
	RunService.RenderStepped:Connect(function()
		local FlatIdent_61EE = 0;
		local char;
		while true do
			if (0 == FlatIdent_61EE) then
				char = player.Character;
				if char then
					local FlatIdent_89237 = 0;
					local hum;
					while true do
						if (FlatIdent_89237 == 0) then
							hum = char:FindFirstChildOfClass("Humanoid");
							if hum then
								hum.WalkSpeed = walkSpeed;
							end
							break;
						end
					end
				end
				break;
			end
		end
	end);
	mainGuiFrame = frame;
	TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Quad), {BackgroundTransparency=0}):Play();
	local iconGui = Instance.new("ScreenGui", guiParent);
	iconGui.Name = "LeftInkToggleGui";
	iconGui.ResetOnSpawn = false;
	toggleButton = Instance.new("ImageButton", iconGui);
	toggleButton.Size = UDim2.new(0, 40, 0, 40);
	toggleButton.Position = UDim2.new(1, -60, 0, 20);
	toggleButton.BackgroundColor3 = Color3.fromRGB(22, 34, 72);
	toggleButton.BorderSizePixel = 0;
	toggleButton.Image = "rbxassetid://118783379027658";
	local toggleCorner = Instance.new("UICorner", toggleButton);
	toggleCorner.CornerRadius = UDim.new(0, 10);
	toggleButton.MouseButton1Click:Connect(function()
		if mainGuiFrame.Visible then
			local FlatIdent_49280 = 0;
			local tweenOut;
			while true do
				if (FlatIdent_49280 == 0) then
					tweenOut = TweenService:Create(mainGuiFrame, TweenInfo.new(0.3), {BackgroundTransparency=1});
					tweenOut:Play();
					FlatIdent_49280 = 1;
				end
				if (FlatIdent_49280 == 1) then
					tweenOut.Completed:Wait();
					mainGuiFrame.Visible = false;
					break;
				end
			end
		else
			mainGuiFrame.Visible = true;
			TweenService:Create(mainGuiFrame, TweenInfo.new(0.3), {BackgroundTransparency=0}):Play();
		end
	end);
end
RunService.RenderStepped:Connect(function()
	local char = player.Character;
	if (not char or not char:FindFirstChild("HumanoidRootPart")) then
		return;
	end
	local rootPart = char.HumanoidRootPart;
	local nearestTarget, nearestDist = nil, math.huge;
	for _, model in ipairs(Workspace:GetDescendants()) do
		if (model:IsA("Model") and not model:IsDescendantOf(Players) and not model:IsDescendantOf(char)) then
			local nm = model.Name:lower();
			if (nm:find("guard") or nm:find("guy") or nm:find("squid")) then
				local FlatIdent_3CF36 = 0;
				local part;
				while true do
					if (0 == FlatIdent_3CF36) then
						part = model:FindFirstChildWhichIsA("BasePart");
						if part then
							local FlatIdent_4D434 = 0;
							local dist;
							while true do
								if (FlatIdent_4D434 == 0) then
									dist = (part.Position - rootPart.Position).Magnitude;
									if (dist < nearestDist) then
										local FlatIdent_61800 = 0;
										while true do
											if (FlatIdent_61800 == 0) then
												nearestTarget = part;
												nearestDist = dist;
												break;
											end
										end
									end
									FlatIdent_4D434 = 1;
								end
								if (FlatIdent_4D434 == 1) then
									if (isEspOn and not part:FindFirstChild("ESP")) then
										local FlatIdent_90A41 = 0;
										local box;
										while true do
											if (FlatIdent_90A41 == 4) then
												box.AdornCullingMode = Enum.AdornCullingMode.Never;
												box.Parent = part;
												break;
											end
											if (FlatIdent_90A41 == 2) then
												box.Color3 = Color3.fromRGB(255, 0, 0);
												box.AlwaysOnTop = true;
												FlatIdent_90A41 = 3;
											end
											if (FlatIdent_90A41 == 3) then
												box.ZIndex = 10;
												box.Transparency = 0.25;
												FlatIdent_90A41 = 4;
											end
											if (FlatIdent_90A41 == 0) then
												box = Instance.new("BoxHandleAdornment");
												box.Name = "ESP";
												FlatIdent_90A41 = 1;
											end
											if (FlatIdent_90A41 == 1) then
												box.Adornee = part;
												box.Size = part.Size;
												FlatIdent_90A41 = 2;
											end
										end
									elseif (not isEspOn and part:FindFirstChild("ESP")) then
										part.ESP:Destroy();
									end
									break;
								end
							end
						end
						break;
					end
				end
			end
		end
	end
	if (isAimbotOn and nearestTarget) then
		local camPos = cam.CFrame.Position;
		local direction = (nearestTarget.Position - camPos).Unit;
		cam.CFrame = cam.CFrame:Lerp(CFrame.new(camPos, camPos + direction), AIM_LERP_SPEED);
	end
end);
UserInput.JumpRequest:Connect(function()
	if isInfiniteJumpOn then
		local FlatIdent_FA88 = 0;
		local char;
		while true do
			if (FlatIdent_FA88 == 0) then
				char = player.Character;
				if char then
					local humanoid = char:FindFirstChildOfClass("Humanoid");
					if humanoid then
						humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
					end
				end
				break;
			end
		end
	end
end);
player.CharacterAdded:Connect(function(char)
	local FlatIdent_580CB = 0;
	local hum;
	while true do
		if (FlatIdent_580CB == 0) then
			hum = char:WaitForChild("Humanoid");
			hum.WalkSpeed = walkSpeed;
			break;
		end
	end
end);
local function showLoadPrompt()
	local FlatIdent_20FE3 = 0;
	local gui;
	local frame;
	local frameCorner;
	local title;
	local yesBtn;
	local yesCorner;
	local noBtn;
	local noCorner;
	local closePrompt;
	while true do
		if (FlatIdent_20FE3 == 0) then
			gui = Instance.new("ScreenGui", guiParent);
			gui.Name = "InkLoadPrompt";
			gui.ResetOnSpawn = false;
			gui.IgnoreGuiInset = true;
			frame = Instance.new("Frame", gui);
			FlatIdent_20FE3 = 1;
		end
		if (8 == FlatIdent_20FE3) then
			TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position=UDim2.new(1, -20, 1, -120)}):Play();
			closePrompt = nil;
			function closePrompt()
				local FlatIdent_44265 = 0;
				while true do
					if (FlatIdent_44265 == 1) then
						gui:Destroy();
						break;
					end
					if (0 == FlatIdent_44265) then
						TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position=UDim2.new(1, 300, 1, -120)}):Play();
						task.wait(0.3);
						FlatIdent_44265 = 1;
					end
				end
			end
			yesBtn.MouseButton1Click:Connect(function()
				local FlatIdent_53124 = 0;
				local ok;
				local err;
				while true do
					if (FlatIdent_53124 == 0) then
						closePrompt();
						ok, err = pcall(createMainGui);
						FlatIdent_53124 = 1;
					end
					if (FlatIdent_53124 == 1) then
						if not ok then
							showErrorOverlay(err);
						else
							showThankYouMsg();
						end
						break;
					end
				end
			end);
			noBtn.MouseButton1Click:Connect(closePrompt);
			FlatIdent_20FE3 = 9;
		end
		if (FlatIdent_20FE3 == 7) then
			noBtn.TextColor3 = Color3.new(1, 1, 1);
			noBtn.Font = Enum.Font.FredokaOne;
			noBtn.TextSize = 20;
			noCorner = Instance.new("UICorner", noBtn);
			noCorner.CornerRadius = UDim.new(0, 12);
			FlatIdent_20FE3 = 8;
		end
		if (FlatIdent_20FE3 == 5) then
			yesBtn.TextColor3 = Color3.new(1, 1, 1);
			yesBtn.Font = Enum.Font.FredokaOne;
			yesBtn.TextSize = 20;
			yesCorner = Instance.new("UICorner", yesBtn);
			yesCorner.CornerRadius = UDim.new(0, 12);
			FlatIdent_20FE3 = 6;
		end
		if (2 == FlatIdent_20FE3) then
			frameCorner = Instance.new("UICorner", frame);
			frameCorner.CornerRadius = UDim.new(0, 12);
			title = Instance.new("TextLabel", frame);
			title.Size = UDim2.new(1, -20, 0, 35);
			title.Position = UDim2.new(0, 10, 0, 10);
			FlatIdent_20FE3 = 3;
		end
		if (FlatIdent_20FE3 == 3) then
			title.BackgroundTransparency = 1;
			title.Text = "Load Left Ink Script?";
			title.TextColor3 = Color3.fromRGB(220, 220, 220);
			title.Font = Enum.Font.FredokaOne;
			title.TextSize = 22;
			FlatIdent_20FE3 = 4;
		end
		if (FlatIdent_20FE3 == 4) then
			yesBtn = Instance.new("TextButton", frame);
			yesBtn.Text = "Yes";
			yesBtn.Size = UDim2.new(0, 90, 0, 30);
			yesBtn.Position = UDim2.new(0, 40, 0, 55);
			yesBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50);
			FlatIdent_20FE3 = 5;
		end
		if (FlatIdent_20FE3 == 1) then
			frame.Size = UDim2.new(0, 250, 0, 90);
			frame.Position = UDim2.new(1, 300, 1, -120);
			frame.AnchorPoint = Vector2.new(1, 1);
			frame.BackgroundColor3 = Color3.fromRGB(22, 34, 72);
			frame.BorderSizePixel = 0;
			FlatIdent_20FE3 = 2;
		end
		if (6 == FlatIdent_20FE3) then
			noBtn = Instance.new("TextButton", frame);
			noBtn.Text = "No";
			noBtn.Size = UDim2.new(0, 90, 0, 30);
			noBtn.Position = UDim2.new(0, 130, 0, 55);
			noBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50);
			FlatIdent_20FE3 = 7;
		end
		if (FlatIdent_20FE3 == 9) then
			task.delay(10, function()
				if gui.Parent then
					closePrompt();
				end
			end);
			break;
		end
	end
end
pcall(showLoadPrompt);