# game>starterplayer>startercharacterscripts

# LocalScript

To use: create a Folder in workspace called Areas, group any parts called Area into a model called Area and place them into the Areas Folder with the decided audios as children, supports multiple audios at once no problem.

The script creates a table to hold all sounds in the area, and listens for the player's location to change. When the player moves into a new area, the script identifies all sounds in that area and fades out any previous sounds that were playing. Then it fades in the new sounds and plays them. When the player moves out of an area, the script fades out the sounds from that area and stops playing them.

The script uses a Ray object to determine the player's location and identifies any parts in the game that are children of the "Areas" object in the workspace. It then checks to see if the player is currently in one of these areas and fades in/out the appropriate sounds.

The script also uses the TweenService module to create tweens for fading in and out sounds smoothly.
