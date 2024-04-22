# CodeTest

I had an issue with an OTclient (https://github.com/edubart/otclient/wiki/Compiling-on-Windows) that was given as animation was showing up weirdly

After some digging in the forum I found out that it could be a possibility of the client problem so I used this client https://otland.net/threads/issue-on-the-animation-of-eternal-winter.281595/ I did not push the files for it as it became a submodule.

As of question 6, 7
Here are the things I've tried:

1. create a new folder in otclient/modules/ called game_jump, and inside there consists 3 files, jump.lua, jump.otmod, jump.otui.

2. After editing the code like the other UI scripts, I add '- game_jump' inside the game_interface/interface.otmod file

These things should've created something but unfortunately nothing was showing up in the client, even when I tried it out with other existing examples, and folders.
