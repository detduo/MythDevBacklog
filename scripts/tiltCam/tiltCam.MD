# game>starterplayer>startercharacterscripts

# LocalScript

Simulates a slight wobbling motion in the camera's angle. It achieves this by updating the camera's coordinate frame every frame with a small rotation along the z-axis that varies over time according to a sine wave.

The script uses a while loop to continuously update the camera's coordinate frame during runtime. It waits for the RenderStepped event to fire, which is triggered every frame, before updating the camera's coordinate frame.

The TiltAmount variable controls the amount of tilt applied to the camera. Increasing its value will make the camera tilt more, while decreasing it will make the camera tilt less.
