System.currentDirectory("ms0:/PSP/GAME/"..path_Folders.."/notes")

fbrowser = {s = 3, fl = System.listDirectory("ms0:/PSP/GAME/"..path_Folders.."/notes"),ls = 3, sp = 20}
fbrowser.nf = table.getn(fbrowser.fl)

fadeScreen("Increase", menu, 28)

while true do

System.setHigh()

Time()

screen:clear()
screen:blit(0,0,menu)

faderTS("", "timeTable", "Mainmenu", 1)


screen:print(290,262,"L -> "..text_Menu[3],bleu)

browser()

------USB------
if Controls.read():select() then
fadeScreen("Decrease", menu, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/usb.lua")
end

------Supp 1note------
if Controls.read():triangle() then
deleteNote("simple")
end

------Supp toutes les notes------
if Controls.read():start() then
deleteNote("all")
end

------Lire note------
if Controls.read():cross() then
fadeScreen("Decrease", menu, 28)
readNote()
end

------Info on the keys------
if Controls.read():l() and not Controls.read():r() then
fadeScreen("Decrease", menu, 28)
infoKeys()
end

------New note------
if Controls.read():circle() then
editNote="no"
fadeScreen("Decrease", menu, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/newnote.lua")
end

------Credits------
if Controls.read():square() then
fadeScreen("Decrease", menu, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/by.lua")
end


if Controls.read():l() and Controls.read():r() then
fadeScreen("Decrease", menu, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/options.lua")
end

screen.waitVblankStart()
screen.flip()
end
