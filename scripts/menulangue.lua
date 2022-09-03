bleu = Color.new(0,0,255)
blanc = Color.new(255,255,255)
rouge = Color.new(255,0,0)
Selecteur = 1

avantmenu = Image.load("ms0:/PSP/GAME/PSPNotes/images/avantmenu.png")


file = io.open("ms0:/PSP/GAME/PSPNotes/script/test.txt" ,"w")
file:write("2")
file:close()

while true do

screen:clear()


screen:blit(0,0,avantmenu)

screen:print(80,80,"Choisissez votre langage",blanc)
screen:print(80,100,"Choose your language",blanc)

screen:print(73,150,"Francais",rouge)
screen:print(73,170,"English",rouge)


screen:print(62,130 + (Selecteur * 20),">",bleu)


screen:print(20,205,"Si vous voulez changer la langue ulterieurement",blanc)
screen:print(20,220,"pressez L et R",blanc)

screen:print(20,240,"If you want to change the language later",blanc)
screen:print(20,255,"press L and R",blanc)


pad = Controls.read()


if pad:up() then -- Si on appuit sur Haut

Selecteur = Selecteur - 1 -- On déplace le curseur d'une position en arrière(-1) 
end 

if pad:down() then -- Si on appuit sur Bas

Selecteur = Selecteur + 1 -- On déplace le curseur d'une position en avant(+1) 
end


if Selecteur > 2 then

Selecteur = 2
end 

if Selecteur < 1 then

Selecteur = 1
end 

if pad:cross() and Selecteur == 1 then

file = io.open("ms0:/PSP/GAME/PSPNotes/langue.txt" ,"w")
file:write("fr")
file:close()
dofile ("ms0:/PSP/GAME/PSPNotes/script/menufr.lua")
end

if pad:cross() and Selecteur == 2 then

file = io.open("ms0:/PSP/GAME/PSPNotes/langue.txt" ,"w")
file:write("eng")
file:close()
dofile("ms0:/PSP/GAME/PSPNotes/script/menueng.lua")
end


if pad:square() and Selecteur == 1 then

System.unassign("flash1:")
System.assign("flash1:","lflash0:0,1","flashfat1:")

file = io.open("flash1:/config.note" ,"w")
file:write("fr")
file:close()
dofile ("ms0:/PSP/GAME/PSPNotes/script/menufr.lua")
end

if pad:square() and Selecteur == 2 then

System.unassign("flash1:")
System.assign("flash1:","lflash0:0,1","flashfat1:")

file = io.open("flash1:/config.note" ,"w")
file:write("eng")
file:close()
dofile("ms0:/PSP/GAME/PSPNotes/script/menueng.lua")
end

screen.flip()
screen.waitVblankStart()

end