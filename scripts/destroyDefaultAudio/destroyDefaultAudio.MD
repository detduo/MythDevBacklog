# game>starterplayer>startercharacterscripts

# LocalScript

Designed to remove all sounds attached to a player's character except for one specific sound named "Running". The script first retrieves the LocalPlayer and their Character, or waits for it to be added if it hasn't already. It then loops through all of the children of the character's HumanoidRootPart to check if they are Sounds. If they are, it checks if their name is not "Running". If it isn't, it prints the sound's name and then destroys the object, effectively removing the sound from the character.
