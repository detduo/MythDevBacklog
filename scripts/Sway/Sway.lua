local RunService = game:GetService("RunService")
local sway = 45
local function lerp(a, b, t)
	return a + (b - a) * t
end
local swaySpeed = 0.00075
local swayAmount = 0.062
local swaySpeed2 = 0.00075
local swayAmount2 = 0
local pi2 = math.pi * 2
local angle1 = 0
local angle2 = 0
local CurrentCamera = workspace.CurrentCamera
local sin = math.sin
RunService:BindToRenderStep("Swaying", 201, function()
	sway = lerp(sway, 0.0452, 0.21)
	swaySpeed = lerp(swaySpeed, 0.00045, 0.11)
	swayAmount = lerp(swayAmount, 0.0424, 0.031)
	swaySpeed2 = lerp(swaySpeed2, 0.00045, 0.061)
	angle1 = (angle1 + sway) % pi2
	angle2 = (angle2 + swayAmount) % pi2
	CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.Angles(sin(angle1) * swaySpeed, sin(angle2) * swaySpeed2, 0)
end)
