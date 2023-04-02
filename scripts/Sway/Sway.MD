# game>starterplayer>starterplayerscripts

# LocalScript

The script is using the BindToRenderStep method provided by the RunService to execute a function on every frame render of the game.

The script starts by defining some variables such as sway, swaySpeed, swayAmount, swaySpeed2, angle1, angle2, and CurrentCamera.

Then, the script defines a lerp function, which is used to linearly interpolate between two values.

The RunService:BindToRenderStep function is then called with the "Swaying" identifier, a priority level of 201, and a function that will update the camera's CFrame every frame.

Within the function, the lerp function is used to smoothly change the values of sway, swaySpeed, swayAmount, and swaySpeed2. The angle1 and angle2 variables are updated based on these values, and the camera's CFrame is rotated using the CFrame.Angles method.
