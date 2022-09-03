selected = 1
opSelected7 = 11
x_option = 62

nbLoadH = firstStart()


if soundsM ~= "yes" then
configSons = text_Options[16]
else
configSons = text_Options[17]
end

text_Options[19] = "Danzeff"
text_Options[20] = "Sony"

keyBoard = pOsk


if passOk == nil then
passOk = text_Options[16]
end

fbrowser = {s = 3, fl = System.listDirectory("ms0:/PSP/GAME/"..path_Folders.."/lang")}
fbrowser.nf = table.getn(fbrowser.fl)

fbrowser2 = {s = 3, fl = System.listDirectory("ms0:/PSP/GAME/"..path_Folders.."/skins")}
fbrowser2.nf = table.getn(fbrowser2.fl)

fadeScreen("Increase", settings, 28)


while true do
screen:blit(0,0,settings)

Time()


if firstStartF == "yes" then
faderTS("", "timeTable", "PSPNotes config", 1)
else

faderTS("", "timeTable", "Options", 1)
end

pad = Controls.read()

if pad:up() then
System.sleep(100)
selected = selected - 1
end

if pad:down() then
System.sleep(100)
selected = selected + 1
end

if selected < 1 then
selected = 1
end

if selected > 6 then
selected = 6
end
--
screen:print(350,  x_option-34, text_Options[25].." : "..nbLoadH, noir)


if selected == 1 then
screen:fontPrint(himfont, 40, x_option, text_Options[1].."   < "..fbrowser.fl[fbrowser.s].name.." >", noir)
screen:fontPrint(himfont, 40, x_option+22, text_Options[2].."   "..passOk, blanc)
screen:fontPrint(himfont, 40, x_option+44, text_Options[3].."   "..keyBoard, blanc)
screen:fontPrint(himfont, 40, x_option+66, text_Options[4].."   "..fbrowser2.fl[fbrowser2.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+88, text_Options[5].."   "..configSons, blanc)

screen:fontPrint(himfont, 40, x_option+176, text_Options[6], bleuc)


if Controls.read():left() and fbrowser.s > 3 then
fbrowser.s = fbrowser.s - 1
System.sleep(80)
end
if Controls.read():right() and fbrowser.s < fbrowser.nf then
fbrowser.s = fbrowser.s + 1
System.sleep(80)
end




elseif selected == 2 then
screen:fontPrint(himfont, 40, x_option, text_Options[1].."   "..fbrowser.fl[fbrowser.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+22,text_Options[2].."   < "..passOk.." >", noir)
screen:fontPrint(himfont, 40, x_option+44, text_Options[3].."   "..keyBoard, blanc)
screen:fontPrint(himfont, 40, x_option+66, text_Options[4].."   "..fbrowser2.fl[fbrowser2.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+88, text_Options[5].."   "..configSons, blanc)

screen:fontPrint(himfont, 40, x_option+176, text_Options[6], bleuc)

if Controls.read():right() and passOk == text_Options[16] then
passOk = print_osk(text_Options[18], text_NewNote[10], "")
end

if Controls.read():left() and passOk ~= text_Options[16] then
passOk = text_Options[16]
end




elseif selected == 3 then
screen:fontPrint(himfont, 40, x_option, text_Options[1].."   "..fbrowser.fl[fbrowser.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+22,text_Options[2].."   "..passOk, blanc)
screen:fontPrint(himfont, 40, x_option+44, text_Options[3].."   < "..keyBoard.." >", noir)
screen:fontPrint(himfont, 40, x_option+66, text_Options[4].."   "..fbrowser2.fl[fbrowser2.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+88, text_Options[5].."   "..configSons, blanc)

screen:fontPrint(himfont, 40, x_option+176, text_Options[6], bleuc)


if Controls.read():left() then
if keyBoard == "Sony" then
keyBoard = "Danzeff"
System.sleep(80)
else
keyBoard =  "Sony"
System.sleep(80)
end
end

if Controls.read():right() then 
if keyBoard == "Sony" then
keyBoard =  "Danzeff"

System.sleep(80)
else
keyBoard = "Sony"
System.sleep(80)
end
end


elseif selected == 4 then
screen:fontPrint(himfont, 40, x_option, text_Options[1].."   "..fbrowser.fl[fbrowser.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+22, text_Options[2].."   "..passOk, blanc)
screen:fontPrint(himfont, 40, x_option+44, text_Options[3].."   "..keyBoard, blanc)
screen:fontPrint(himfont, 40, x_option+66, text_Options[4].."   < "..fbrowser2.fl[fbrowser2.s].name.." >", noir)
screen:fontPrint(himfont, 40, x_option+88, text_Options[5].."   "..configSons, blanc)

screen:fontPrint(himfont, 40, x_option+176, text_Options[6], bleuc)

if Controls.read():left() and fbrowser2.s > 3 then
fbrowser2.s = fbrowser2.s - 1
System.sleep(80)
end
if Controls.read():right() and fbrowser2.s < fbrowser2.nf then
fbrowser2.s = fbrowser2.s + 1
System.sleep(80)
end



elseif selected == 5 then
screen:fontPrint(himfont, 40, x_option, text_Options[1].."   "..fbrowser.fl[fbrowser.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+22,text_Options[2].."   "..passOk, blanc)
screen:fontPrint(himfont, 40, x_option+44, text_Options[3].."   "..keyBoard, blanc)
screen:fontPrint(himfont, 40, x_option+66, text_Options[4].."   "..fbrowser2.fl[fbrowser2.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+88, text_Options[5].."   < "..configSons.." >", noir)

screen:fontPrint(himfont, 40, x_option+176, text_Options[6], bleuc)

if Controls.read():left() then
if configSons == text_Options[17] then
configSons = text_Options[16]
System.sleep(80)
else
configSons = text_Options[17]
alreadyBoot = 0
System.sleep(80)
end
end

if Controls.read():right() then 
if configSons == text_Options[17] then
configSons = text_Options[16]
System.sleep(80)
else
configSons = text_Options[17]
System.sleep(80)
end
end



elseif selected == 6 then
screen:fontPrint(himfont, 40, x_option, text_Options[1].."   "..fbrowser.fl[fbrowser.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+22,text_Options[2].."   "..passOk, blanc)
screen:fontPrint(himfont, 40, x_option+44, text_Options[3].."   "..keyBoard, blanc)
screen:fontPrint(himfont, 40, x_option+66, text_Options[4].."   "..fbrowser2.fl[fbrowser2.s].name, blanc)
screen:fontPrint(himfont, 40, x_option+88, text_Options[5].."   "..configSons, blanc)

screen:fontPrint(himfont, 40, x_option+176, text_Options[6], noir)
screen:fontPrint(himfont, 40, x_option+198, " --> "..text_Options[opSelected7].." <--", noir)

if nbLoadH == "1" then
text_Options[opSelected7] = "--"

if Controls.read():cross() then
sauvSettings()
fadeScreen("Decrease", settings, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/script.lua")
end
end



if nbLoadH ~= "1" then

if Controls.read():left() and opSelected7 >= 12 then
opSelected7 = opSelected7 - 1
System.sleep(80)
end
if Controls.read():right() and opSelected7 <= 14 then
opSelected7 = opSelected7 + 1
System.sleep(80)
end

if Controls.read():cross() then
if opSelected7 == 11 then
sauvSettings()
fadeScreen("Decrease", settings, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")
elseif opSelected7 == 12 then
sauvSettings()
fadeScreen("Decrease", settings, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/script.lua")
elseif opSelected7 == 13 then
sauvSettings()
fadeScreen("Decrease", settings, 28)
System.Quit()
elseif opSelected7 == 14 then
sauvSettings()
fadeScreen("Decrease", settings, 28)
System.shutdown()
elseif opSelected7 == 15 then
fadeScreen("Decrease", settings, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")
end
end
end
end

screen.waitVblankStart()
screen.flip()
end
   