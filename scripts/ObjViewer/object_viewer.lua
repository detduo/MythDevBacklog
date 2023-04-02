local ui = script.Parent
local runService = game:GetService("RunService")
local InputService = game:GetService("UserInputService")
local Ts = game:GetService("TweenService")

local camera = game.Workspace.Camera
local viewingObject = false

local backButton = script.Parent.Back
local object

local playerMod = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local controls = playerMod:GetControls()
local speedOfSpin = 2

--Back button script, it basically just reverses the creation of viewport frames, and removing it
backButton.MouseButton1Click:Connect(function()
	--checking if there is an object in the Ui
	if viewingObject == true then
		--Finding the object reference to enable to the Proximity prompt back up
		if object:FindFirstChild("objReference") ~= nil then
			

			--Reversing the the camera type
			camera.CameraType = Enum.CameraType.Custom
			backButton:TweenPosition(
				UDim2.new(0.227, 0, -0.5, 0),
				"Out",
				"Quad",
				1,
				false
			)
			
			--Playing the back animation
			local tweenInfo = TweenInfo.new(
				1, 
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out,
				0,
				false, 
				0
			)
			local goal = {}
			goal.CFrame = object.objReference.Value.Parent.CFrame
			
			local tween = Ts:Create(object, tweenInfo, goal)
			tween:Play()
			
			repeat 
				object.Transparency = object.Transparency + 0.05
				wait(0.01)
			until object.Transparency >= 1
			
			--Enabling the player's controls and proximity prompt
			controls:Enable()
			
			object.objReference.Value.Enabled = true
			object.Parent:Destroy()
			game.Workspace.Mise.ProximityPrompt.Enabled = true
		end
	end
end)

runService.RenderStepped:Connect(function()
	--checking if there is a viewport Frame
	if ui:FindFirstChild("vpF") ~= nil then
		--Checking if there is an object in the viewport frame
		if ui.vpF:FindFirstChild("objV") ~= nil then
			--setting what the object is
			object = ui.vpF.objV
			
			--Setting the viewing object to true IF there is an object
			if viewingObject == false then
				viewingObject = true
			end
			
			--If there is an object, and the player uses the keys WASD, it will spin
			if viewingObject == true then
				if InputService:IsKeyDown(Enum.KeyCode.A) then
					object.CFrame = object.CFrame * CFrame.Angles(0, 0, math.rad(speedOfSpin))
					wait(0.1)
				end
				if InputService:IsKeyDown(Enum.KeyCode.D) then
					object.CFrame = object.CFrame * CFrame.Angles(0, 0, math.rad(-speedOfSpin))
					wait(0.1)
				end
				if InputService:IsKeyDown(Enum.KeyCode.W) then
					object.CFrame = object.CFrame * CFrame.Angles(math.rad(-speedOfSpin), 0, 0)
					wait(0.1)
				end
				if InputService:IsKeyDown(Enum.KeyCode.S) then
					object.CFrame = object.CFrame * CFrame.Angles(math.rad(speedOfSpin), 0, 0)
					wait(0.1)
				end
			end

		end
	end
	--Setting the viewing object to false IF there is no object
	if ui:FindFirstChild("vpF") == nil then
		if viewingObject == true then
			viewingObject = false
		end
	end
end)
