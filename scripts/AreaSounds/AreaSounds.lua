local AreaSounds = {} -- create a table to hold all sounds in the area

local plr = script.Parent
local presser = plr.HumanoidRootPart
local differentAreas = workspace.Map.Areas
local currentArea = nil
local fadeTime = 2.5 -- time it takes for the sound to fade in/out
local fadeTween = nil -- variable to hold the tween object

local function fadeSoundIn()
	if fadeTween then fadeTween:Cancel() end -- cancel any existing tweens
	for _, sound in pairs(AreaSounds) do -- fade in all sounds in the area
		fadeTween = game:GetService("TweenService"):Create(sound, TweenInfo.new(fadeTime), {Volume = 1})
		fadeTween:Play()
	end
end

local function fadeSoundOut()
	if fadeTween then fadeTween:Cancel() end -- cancel any existing tweens
	for _, sound in pairs(AreaSounds) do -- fade out all sounds in the area
		fadeTween = game:GetService("TweenService"):Create(sound, TweenInfo.new(fadeTime), {Volume = 0})
		fadeTween:Play()
	end
end

game:GetService("RunService").Heartbeat:Connect(function()
	local raycast = Ray.new(presser.Position, presser.CFrame.UpVector * -1000)
	local part = workspace:FindPartOnRayWithWhitelist(raycast, {differentAreas})
	if part and part.Parent == differentAreas then
		if part ~= currentArea then
			currentArea = part
			AreaSounds = {} -- clear previous sounds
			for _, sound in pairs(currentArea:GetChildren()) do -- add all sounds in the area to the table
				if sound:IsA("Sound") then
					table.insert(AreaSounds, sound)
				end
			end
			fadeSoundOut() -- fade out previous sound
			task.wait(fadeTime) -- wait for fade out to complete before fading in new sound
			fadeSoundIn() -- fade in new sound
			for _, sound in pairs(AreaSounds) do -- play all sounds in the area together
				sound:Play()
			end
		end
	else
		if currentArea then
			fadeSoundOut() -- fade out previous sound
			task.wait(fadeTime) -- wait for fade out to complete before stopping sound
			currentArea = nil
			for _, sound in pairs(AreaSounds) do -- stop all sounds in the area
				sound:Stop()
			end
		end
	end
end)
