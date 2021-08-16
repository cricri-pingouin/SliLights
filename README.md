# SliLights
A Lights Out game clone, with some levels built in and random levels generator. Written in Turbo Delphi.

----------------
v1.2, 16/08/2021
----------------
Added option to play any level. Once completed, you go back to the latest completed level. This saves the hassle of having to fiddle with the .ini file.
Also note that deleting the .ini file loses your colour settings, so prefer changing the CurrentLevel value in the .ini file rather than deleting the file to start again from level 1.

----------------
v1.1, 15/08/2021
----------------
I eventually bought a Lights Out 2000 from eBay, and started looking for solutions. While doing so, I found the following:
https://www.jaapsch.net/puzzles/javascript/lightjcl.htm

So I copied/paste from the Javascript code the levels data and inserted them in my Delphi code.
This brings the following changes:
- Removed the 5 levels from the menu as this became superseded.
- Will play the levels in turn. Starting with the 2 sets of 25 classic levels, followed by the  the 2 sets of 25 Lights Out 2000 levels, as in the Javascript game linked above. The window caption indicates the current level (1 to 100).
- Once you have passed a level, it goes to the next one.
- Once you reached the last level (100), it keeps playing it if you complete it. Change the .ini file if you want to go back to a level, or delete the .ini file to start from level 1 again.
- You can still play random levels. The window caption will indicate when a random level is being played. Once completed, you go back to the current standard level.
- The original Lights Out game will fail a level if you use too many clicks (is it more than 10 clicks more than the minimum?). I don't know what those limits are, so they are not implemented.

I considered storing the levels in a separate file (e.g. text file), which would also allow for custom sets. However, my philosophy is to have self-contained executables, so you only need the .exe file. For this reason, I built the levels into the code as a const array of arrays.
