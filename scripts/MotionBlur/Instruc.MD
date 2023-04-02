# game>starterplayer>starterplayerscripts

# LocalScript

The script begins by defining some settings such as the amount of blur, the blur power, the maximum blur size, the camera object, and the blur effect object.

Next, it creates a connection to the Changed event of the Workspace object. Whenever the CurrentCamera property of the workspace changes, the script updates the camera variable and checks if the blurEffect is still valid. If it's not, it creates a new one and sets it as a child of the camera.

Finally, the script creates a connection to the Heartbeat event of the RunService. This event is fired every frame, and the script uses it to update the size of the blurEffect based on the movement of the camera.

The script calculates the difference between the current look vector of the camera and the last look vector to determine the amount of camera movement. If the movement is greater than the blurThreshold, which is a customizable value that determines the sensitivity of the motion blur effect, the script calculates the size of the blurEffect based on the blurAmount, blurPower, and the movement.

The script then clamps the calculated blurSize value between 0 and the maxBlurSize setting to prevent excessively large blurs. Finally, it updates the Size property of the blurEffect with the new blurSize value.
