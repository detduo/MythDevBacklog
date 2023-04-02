local action = game.ReplicatedStorage.Actions
local char = script.Parent

local playerMod = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local controls = playerMod:GetControls()

local TS = game:GetService("TweenService")

local neck = char:FindFirstChild("Neck", true)
local neckDef = neck.C0

local FPS = false

--Receiving the event
action.OnClientEvent:Connect(function(typeOfAction, part, player, angle)
	--verifying if there is/ which player it is
	if player ~= nil then
		if player.Name == script.Parent.Name then
			--what kind of action it is
			if typeOfAction == "View" then
				--Disabling the proximityprompt
				part.Enabled = false
				
				--Disabling the controls
				controls:Disable()
				
				--Creating the viewport frame
				local ObjectViewerUi = game.Players.LocalPlayer.PlayerGui.ObjectViewer
				local VpF = Instance.new("ViewportFrame")
				VpF.Name = "vpF"
				VpF.Parent = ObjectViewerUi
				VpF.Size = UDim2.new(1, 0, 1, 0)
				VpF.BackgroundTransparency = 1
				
				--cloning the part that was the parent of the proximity prompt
				local objectViewing = part.Parent:Clone()

				--parenting the prompt to the UI
				objectViewing.Parent = VpF
				objectViewing.Name = "objV"
				objectViewing.Transparency = 1
				
				--Creating an object value that is connected to the prompt which will be used later
				local objectValue = Instance.new("ObjectValue")
				objectValue.Parent = objectViewing
				objectValue.Name = "objReference"
				objectValue.Value = part
				
				--connecting the camera to the viewport Frame
				local camera = game.Workspace.Camera
				VpF.CurrentCamera = camera
				camera.CameraType = Enum.CameraType.Scriptable

				--Making the transition animation
				local tweenInfo = TweenInfo.new(
					1, 
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out,
					0,
					false, 
					0
				)				
				
				local goal = {}
				goal.CFrame = camera.CFrame * CFrame.new(0, 0, -3) * angle
				ObjectViewerUi.Back:TweenPosition(
					UDim2.new(0.227, 0, 0.188, 0),
					"Out",
					"Quad",
					1,
					false
				)
				
				local tween = TS:Create(objectViewing, tweenInfo, goal)
				tween:Play()
				
				repeat 
					objectViewing.Transparency = objectViewing.Transparency - 0.05
					wait(0.01)
				until objectViewing.Transparency <= 0
				
				
			end
		end
	end
end)
