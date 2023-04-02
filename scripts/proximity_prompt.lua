--Getting the prompt's instance
local prompt = script.Parent

--when prompt is trigger
prompt.Triggered:Connect(function(plr)
	local char = plr.Character
	local typeOfAction = "View"
	--IMPORTANT SETTING THE OBJECTS ANGLE TO THE WAY YOU WANT IT, JUST FILL IN THE NUMBERS OF THE CFRAME.ANGLES
	local angle = CFrame.Angles(math.rad(90), math.rad(180), 0)
	
	--FIRING THE EVENT TO THE LOCAL SCRIPT
	game.ReplicatedStorage.Actions:FireAllClients(typeOfAction, prompt, plr, angle)
end)
