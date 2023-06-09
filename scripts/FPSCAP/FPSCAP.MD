# game>starterplayer>starterplayerscripts

# LocalScript

The script works by continuously looping while waiting for the RunService.Heartbeat event to fire, which occurs once per frame. When the event fires, the script calculates the time that has elapsed since the last frame was rendered and updates the FrameTime variable accordingly.

The script then checks if the FrameTime is greater than 0, which ensures that the script is not limiting the frame rate to 0 FPS. If the FrameTime is greater than 0, the script calculates the target frame time based on the desired maximum FPS (in this case, 1/240 seconds per frame).

The script then enters a loop that repeats until the time for the next frame has arrived. This loop effectively blocks the script from continuing until it is time to render the next frame, thus limiting the FPS to the desired maximum value.
