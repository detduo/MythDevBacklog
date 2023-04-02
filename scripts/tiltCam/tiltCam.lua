local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera
local TiltAmount = 0.8 -- Change this value to adjust the tilt amount

while true do
	RunService.RenderStepped:wait()
	CurrentCamera.CoordinateFrame = CurrentCamera.CoordinateFrame *
		CFrame.Angles(0, 0, math.rad(5 * math.sin(tick() * TiltAmount)))
end
