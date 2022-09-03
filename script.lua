--script.lua

loadingPic = Image.load("ms0:/PSP/GAME/PSPNotes/pictures/loadingPic.png")
screen:blit(0,0,loadingPic)
screen:flip()

dofile("ms0:/PSP/GAME/PSPNotes/scripts/fonctions.lua")

if Controls.read():up() then
	QuickNote()
end

faderTS("init", 1, 100, "")

loadColor()

Time()

System.sleep(200)--PAUSE

screen:flip()
faderTS("", "timeTable", "Loading...", 1)
screen:flip()

loadFont()

loadPic()

pOsk()

loadLanguage()

password()

checkDir()

increName("first.spn", 1)

if firstStart() == "1" then
firstStartF = "yes"
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/options.lua")
end

if soundsMode() == "yes" and alreadyBoot ~= 1 then
System.oaenable()
System.currentDirectory("ms0:/PSP/GAME/"..path_Folders.."/scripts")
sonmenu = Sound.load("sonmenu.wav",false)
soundsM="yes"
end

loadLanguage()

System.sleep(600)--PAUSE

alreadyBoot = 1

fadeScreen("Decrease", loadingPic, 12) 

dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")