--// Jaylen was here

--// Settings
local blurAmount = 10
local blurPower = 2
local maxBlurSize = 50
local camera = game.Workspace.CurrentCamera
local lastLookVector = camera.CFrame.lookVector
local blurEffect = Instance.new("BlurEffect", camera)
local blurThreshold = 0.09 -- customize the threshold for camera movement to start motion blur, 0.01 meaning it will happen most times you move your cam slightly fast, up to 100 making it so it doesnt have motionblur at all.

--// Logic

game.Workspace.Changed:Connect(function(property)
	if property ~= "CurrentCamera" then return end

	camera = game.Workspace.CurrentCamera

	if not blurEffect or not blurEffect.Parent then
		blurEffect = Instance.new("BlurEffect", camera)
	end

	blurEffect.Parent = camera
end)

-- Update blur effect size based on camera movement
game:GetService("RunService").Heartbeat:Connect(function()
	if not blurEffect or not blurEffect.Parent then
		blurEffect = Instance.new("BlurEffect", camera)
	end

	local currentLookVector = camera.CFrame.lookVector
	local movement = (currentLookVector - lastLookVector).Magnitude

	-- Apply customizable motion blur calculations
	local blurSize = 0
	if movement > blurThreshold then
		blurSize = math.pow(blurAmount * movement, blurPower)
		blurSize = math.clamp(blurSize, 0, maxBlurSize)
	end

	blurEffect.Size = blurSize

	lastLookVector = currentLookVector
end)
