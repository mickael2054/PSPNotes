--Fonctions.lua


ver="V2.1"

path_Folders = "PSPNotes"


--Load language----------------------------------------->>
function loadLanguage()
Time()


	check = System.doesFileExist("flash1:/config.note")
	if check == 1 then
		file = io.open("flash1:/config.note", "r")
		sLanguage = file:read()
		file:close()
	
	

		check = System.doesFileExist("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage..".lpn")
		check2 = System.doesFileExist("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage.."ancais.lpn")
		check3 = System.doesFileExist("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage.."lish.lpn")

		if check == 1 then
			text_Load = {}
			text_By = {}
			text_Menu = {}
			text_InfoKeys = {}
			text_Options = {}
			text_NewNote = {}
			text_USB = {}
			text_screenShots = {}


			dofile("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage..".lpn")

			text_By[1] = "PSPNotes "..ver..""
			text_By[2] = "By Mickael2054"
			text_By[3] = "********************"
			text_By[5] = "Dudu-81"
			text_By[6] = "Essgeeaych"
			text_By[7] = "Devsgen Forums"
			text_By[8] = "Pspgen Forums"
			text_By[9] = "XtreamLua"
			text_By[12] = "http://psprevolution.olympe-network.com/"

			text_Options[19] = "Danzeff"
			text_Options[20] = "Sony"

		elseif check2 == 1 then
			dofile("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage.."ancais.lpn")

		elseif check3 == 1 then
			dofile("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage.."lish.lpn")

		else
			System.message("Untraceable language's file in flash1:/! \n\nPress circle to delete file and return to the XMB.", 0)

			System.unassign("flash1:")
			System.sleep(80)--PAUSE
			System.assign("flash1:","lflash0:0,1","flashfat1:")
			System.sleep(80)--PAUSE
			System.removeFile("flash1:/config.note")
			
			System.sleep(80)--PAUSE

			System.Quit()

		end

	else

		file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/lang.spn","r")
		sLanguage = file:read()
		file:close()

			check = System.doesFileExist("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage)
			if check == 1 then
				text_Load = {}
				text_By = {}
				text_Menu = {}
				text_InfoKeys = {}
				text_Options = {}
				text_NewNote = {}
				text_USB = {}
				text_screenShots = {}


				dofile("ms0:/PSP/GAME/"..path_Folders.."/lang/"..sLanguage)

				text_By[1] = "PSPNotes "..ver..""
				text_By[2] = "By Mickael2054"
				text_By[3] = "********************"
				text_By[5] = "Dudu-81"
				text_By[6] = "Essgeeaych"
				text_By[7] = "Devsgen Forums"
				text_By[8] = "Pspgen Forums"
				text_By[9] = "XtreamLua"
				text_By[12] = "http://psprevolution.olympe-network.com/"

				text_Options[19] = "Danzeff"
				text_Options[20] = "Sony"
			else
				System.message("Untraceable language's file! \n\nPlease put the appropriate into : \nms0:/PSP/GAME/PSPNotes/lang/", 0)
				System.Quit()
			end
	end

end

function firstStart()
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/first.spn","r")
firstL = file:read()
file:close()

return firstL
end

function soundsMode()
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/sounds.spn","r")
soundsL = file:read()
file:close()

return soundsL
end

function loadPic()
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/skin.spn","r")
themeN = file:read()
file:close()

pathPic_Folders = "ms0:/PSP/GAME/"..path_Folders.."/skins/"..themeN

menu = Image.load(pathPic_Folders.."/menu.png")
note = Image.load(pathPic_Folders.."/note.png")

--

clavier = Image.load("ms0:/PSP/GAME/"..path_Folders.."/pictures/clavier.png")
clavier1 = Image.load("ms0:/PSP/GAME/"..path_Folders.."/pictures/clavier1.png")
clavier2 = Image.load("ms0:/PSP/GAME/"..path_Folders.."/pictures/clavier2.png")
clavier3 = Image.load("ms0:/PSP/GAME/"..path_Folders.."/pictures/clavier3.png")

help = Image.load("ms0:/PSP/GAME/"..path_Folders.."/pictures/help.png")
settings = Image.load("ms0:/PSP/GAME/"..path_Folders.."/pictures/settings.png")
end

function loadFont()
himfont = Font.load("ms0:/PSP/GAME/"..path_Folders.."/Complete in Him.ttf")
himfont1 = Font.load("ms0:/PSP/GAME/"..path_Folders.."/Complete in Him.ttf")
himfont:setPixelSizes(20,22)
himfont1:setPixelSizes(17,18)
end

function loadColor()
bleu = Color.new(0,0,255)
blanc = Color.new(255,255,255)
noir = Color.new(0,0,0)
rouge = Color.new(255,0,0)
bleuc = Color.new(0, 0, 128)
gris = Color.new(119, 136, 153)
end

function checkDir()
	check = System.doesDirExist("ms0:/PICTURE/Notes")
	if check == 0 then
		System.createDirectory("ms0:/PICTURE/Notes")
	end
end


function faderTS(mode, heightLine, transparency, batt)

	if mode=="init" then
		faderTopSquare = Image.createEmpty(480,heightLine*18)
		faderTopSColor = Color.new(0,0,0,transparency)
		faderTopSquare:clear(faderTopSColor)
	else
		screen:blit(0,0,faderTopSquare)

			if heightLine == "timeTable" then
				screen:print(176, 7, day.." / "..month.." - "..hour.." h "..minute, bleu)
			end

			if transparency ~= nil then
				screen:print(35, 7, transparency, bleu)
			end

			if batt == 1 then
				aff_batterie(375, 7)
			end

	end
end


function faderSquare(Xf, heightLine, Xprint, YheightLine, transparency)
faderSquareC = Image.createEmpty(Xf,heightLine*18 + 16)
faderSColorC = Color.new(0,0,0,transparency)
faderSquareC:clear(faderSColorC)

screen:blit(Xprint,272 - (YheightLine*18) - 16,faderSquareC)
end


--function center text-->>
function Textecentre(y,string,color)
screen:print( 240 - (string.len(string)*8) / 2 ,y,string,color);
end

function texteCentreFont(font, y,string,color)
screen:fontPrint(font, 240 - (string.len(string)*7) / 2 , y,string, color);
end


function aff_batterie(posx, posy)
	if System.powerGetBatteryLifePercent() < 10 then
		colBatLow = rouge
	else
		colBatLow = blanc
	end

	if System.powerIsBatteryCharging() == true then
		colBatLow = bleu
	end


progress_bar(posx,posy, 5, System.powerGetBatteryLifePercent(), 2, noir)
creatExtSquareBar(posx,posy, 50, 5, colBatLow)
screen:print(posx+60,posy,"("..System.powerGetBatteryLifePercent().."%)",colBatLow)
end

--function Time-->>
function Time()
	if System.getTime(5) == "pm" then
		hour = System.getTime(1)+12
	else
		hour = System.getTime(1)
	end

	if hour < 10 then
		hour = "0"..hour
	end

	if System.getTime(2) < 10 then
		minute = "0"..System.getTime(2)
	else
		minute = System.getTime(2)
	end

	if System.getDate(3) < 10 then
		day = "0"..System.getDate(3)
	else
		day = System.getDate(3)
	end

	if System.getDate(2) < 10 then
		month = "0"..System.getDate(2)
	else
		month = System.getDate(2)
	end
end


---Fonction browser---->
function browser()

	if fbrowser.nf < 3 then
		Textecentre(88,text_Menu[8],noir)
	else

		notePlus = 0

			if fbrowser.s-2 > 9 then
				notePlus = fbrowser.s - 11    -->>(-2-9)<<--
			end

		for i = ((fbrowser.ls-1)*fbrowser.sp)+1, fbrowser.ls*fbrowser.sp do
			if fbrowser.nf >= i and fbrowser.fl[i].name ~= "." and fbrowser.fl[i].name ~= ".." then
		
				long = string.len(fbrowser.fl[i].name)
				enxtension = string.sub(fbrowser.fl[i].name,long -3, long)

				if enxtension == ".tpn" then
					sansext = string.sub(fbrowser.fl[i].name,1,long -4)
				end

				if enxtension ~= ".tpn" then
					sansext = fbrowser.fl[i].name
				end


				screen:fontPrint(himfont,50,((i-((fbrowser.ls-1)*fbrowser.sp))*22 + 38)-22-notePlus*22,sansext,noir)
				
			elseif fbrowser.nf < i then 
				break 
			end
		
		end

			if Controls.read():down() then 
				fbrowser.s = fbrowser.s + 1

					if soundsM == "yes" then 
						sonmenu:play()
					end
			end
			
			if Controls.read():up() then 
				fbrowser.s = fbrowser.s - 1

					if soundsM == "yes" then 
						sonmenu:play()
					end
			end

			
			if Controls.read():right() then
				fbrowser.s = fbrowser.s + 3
			end
			
			if Controls.read():left() then
				fbrowser.s = fbrowser.s - 3
			end


			if fbrowser.s > fbrowser.nf then 
				fbrowser.s = fbrowser.nf 
				
			elseif fbrowser.s < 3 then 
				fbrowser.s = 3 
			end
			
			if fbrowser.s > fbrowser.sp*fbrowser.ls then 
				fbrowser.ls = fbrowser.ls + 1
				
			elseif fbrowser.s < ((fbrowser.ls-1) * fbrowser.sp)+1 then 
				fbrowser.ls = fbrowser.ls - 1 
				fbrowser.s = 3 
			end


		screen:fontPrint(himfont,25,((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*22 + 38)-22-notePlus*22,"-->",bleu)
		screen:print(390, 30, text_Menu[12].." "..fbrowser.s-2 .. "/"..fbrowser.nf-2, noir)
	end
end


function deleteNote(mode)

	if mode == "simple" then
		System.message(text_Menu[4], 1)
			if System.buttonPressed(0) == 1 then
				System.removeFile(fbrowser.fl[fbrowser.s].name)
				fbrowser.s = 1
				fbrowser.fl=System.listDirectory()
				fbrowser.nf=table.getn(fbrowser.fl)
				fbrowser.ls = 1
			end
	end

	if mode == "all" then
		System.message(text_Menu[5], 1)
			if System.buttonPressed(0) == 1 then
				fichiers = System.listDirectory() 
				nombre_fichiers = table.getn(fichiers) 

					for z = 1, nombre_fichiers do -- Pour tout les fichiers
						if fichiers[z].directory == false then
							System.removeFile(fichiers[z].name)
						end
					end

				fbrowser.s = 1
				fbrowser.fl=System.listDirectory()
				fbrowser.nf=table.getn(fbrowser.fl)
				fbrowser.ls = 1
			end
	end
end



function readNote()
file = io.open(fbrowser.fl[fbrowser.s].name,"r")
commText = file:read()
file:read()
noteText = file:read("*a")
file:close()

longueurvariable = string.len(noteText)

fadeScreen("Increase", note, 28)


	while true do
	screen:clear()
	screen:blit(0,0,note)

	faderTS("", "timeTable", "Read note", 1)

	faderSquare(480, 1, 0, 1, 80)


	Textecentre(32,fbrowser.fl[fbrowser.s].name,gris)
	screen:fontPrint(himfont,40,60,commText,noir)

		if longueurvariable < 45 then
			screen:fontPrint(himfont,40,82,noteText,bleu)

		elseif longueurvariable < 90 and longueurvariable > 45 then
			notepart1 = string.sub(noteText,1,45)
			notepart2 = string.sub(noteText,45,longueurvariable)

			screen:fontPrint(himfont,40,82,notepart1,bleu)
			screen:fontPrint(himfont,40,104,notepart2,bleu)

		elseif longueurvariable < 135 and longueurvariable > 90 then
			notepart1 = string.sub(noteText,1,45)
			notepart2 = string.sub(noteText,45,90)
			notepart3 = string.sub(noteText,90,longueurvariable)

			screen:fontPrint(himfont,40,82,notepart1,bleu)
			screen:fontPrint(himfont,40,104,notepart2,bleu)
			screen:fontPrint(himfont,40,126,notepart3,bleu)

		else
			System.message(""..noteText.."", 0)
		end

	----
	screen:fontPrint(himfont1,40,258,"O -> "..text_Menu[6],bleu)
	screen:fontPrint(himfont1,190,258,"START -> "..text_Menu[10],bleu)
	screen:fontPrint(himfont1,350,258,"/\/\\\\ -> "..text_Menu[11],bleu)

	----
	pad = Controls.read()

		if pad:circle() then
			System.sleep(300)--PAUSE
			fadeScreen("Decrease", note, 28)
			dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")
		end

		if pad:start() then
			screenShots(fbrowser.fl[fbrowser.s].name)
		end

		if pad:triangle() then
			editNote="yes"

			innote = noteText
			comnote = commText
			namenotep = fbrowser.fl[fbrowser.s].name

			fadeScreen("Decrease", menu, 38)
			dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/newnote.lua")
		end

	screen.flip()
	screen.waitVblankStart()
	end
end


function creatNote()
System.copyFile("ms0:/PSP/GAME/"..path_Folders.."/scripts/vierge.tpn","ms0:/PSP/GAME/"..path_Folders.."/notes/"..namenotep..".tpn" ,0)
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/notes/"..namenotep..".tpn" ,"w")

file:write(comnote.."\n\n")
file:write(innote)
file:close()
end


function infoKeys()
fadeScreen("Increase", help, 28)
	while true do
	screen:clear()
	screen:blit(0,0,help)

	faderTS("", "timeTable", "Info keys", 1)


	screen:print(390, 78, text_InfoKeys[6], bleu)

	screen:print(390, 107, text_InfoKeys[3],bleu)
	screen:print(390, 120, text_InfoKeys[1],bleu)
	screen:print(390, 135, text_InfoKeys[2],bleu)
	screen:print(390, 150, text_InfoKeys[7],bleu)

	screen:print(390, 189, text_InfoKeys[5],bleu)
	screen:print(390 ,207, text_InfoKeys[4],bleu)

	screen:print(10 ,93, text_InfoKeys[8],bleu)
	screen:print(10 ,107, text_InfoKeys[9],bleu)
	screen:print(10 ,120, text_InfoKeys[10],bleu)
	screen:print(10 ,135, text_InfoKeys[12],bleu)
	screen:print(10 ,150, text_InfoKeys[13],bleu)

	texteCentreFont(himfont, 258, "O -> "..text_InfoKeys[14], noir)

		if Controls.read():circle() then
			System.sleep(300)--PAUSE
			fadeScreen("Decrease", help, 28)
			break
		end

	screen.flip()
	screen.waitVblankStart()
	end
end


function nickNameDisp()
screen:fontPrint(himfont,26,16,text_Menu[7]..""..System.nickName(),bleu)
end


function screenShots(name1)
longName = string.len(name1)
noExtName = string.sub(name1,1, longName-4)

namescreen = noExtName.."  "..increName("screenname.spn",1)
screen:save("ms0:/PICTURE/Notes/"..namescreen..".png")
end




function aff_clavier_()
	if pad:l() and oldpad:l() ~= pad:l() then
		if type_clavier == 1 then
			type_clavier = 2
		elseif type_clavier == 2 then
			type_clavier = 1
		end
	end
	if pad:r() then
		if type_clavier == 1 then
			type_clavier2 = 1
		end
		if type_clavier == 2 then
			type_clavier2 = 2
		end
	else
		type_clavier2 = 0
	end
	
		
		
   if type_clavier == 1 and type_clavier2 ~= 1 then
	screen:blit(323,100,clavier,0,0,151,151)
	 --milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(374,151,clavier,202,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then effacer() end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("m") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre(" ") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("n") end
	 end
	 --haut gauche
	 if pad:analogX() < -50 and pad:analogY() < -50 then
	    screen:blit(324,101,clavier,152,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre(",") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("a") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("b") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("c") end
	 end
	 --haut milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() < -50 then
	    screen:blit(374,101,clavier,202,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre(".") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("d") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("e") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("f") end
	 end
	 --haut droite
	 if pad:analogX() > 50 and pad:analogY() < -50 then
	    screen:blit(424,101,clavier,252,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("!") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("g") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("h") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("i") end
	 end
	 --gauche
	 if pad:analogX() < -50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(324,151,clavier,152,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("-") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("j") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("k") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("l") end
	 end
	 --droite
	 if pad:analogX() > 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(424,151,clavier,252,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("?") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("o") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("p") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("q") end
	 end
	 --bas gauche
	 if pad:analogX() < -50 and pad:analogY() > 50 then
	    screen:blit(324,201,clavier,152,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("(") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("r") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("s") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("t") end
	 end
	 --bas milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > 50 then
	    screen:blit(374,201,clavier,202,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre(":") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("u") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("v") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("w") end
	 end
	 --bas droite
	 if pad:analogX() > 50 and pad:analogY() > 50 then
	    screen:blit(424,201,clavier,252,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre(")") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("x") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("y") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("z") end
	 end
   end
   if type_clavier == 2 and type_clavier2 ~= 2 then
		screen:blit(323,100,clavier1,0,0,151,151)
	 --milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(374,151,clavier1,202,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then effacer() end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre(" ") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("5") end
	 end
	 --haut gauche
	 if pad:analogX() < -50 and pad:analogY() < -50 then
	    screen:blit(324,101,clavier1,152,1,49,49)
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("1") end
	 end
	 --haut milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() < -50 then
	    screen:blit(374,101,clavier1,202,1,49,49)
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("2") end
	 end
	 --haut droite
	 if pad:analogX() > 50 and pad:analogY() < -50 then
	    screen:blit(424,101,clavier1,252,1,49,49)
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("3") end
	 end
	 --gauche
	 if pad:analogX() < -50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(324,151,clavier1,152,51,49,49)
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("4") end
	 end
	 --droite
	 if pad:analogX() > 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(424,151,clavier1,252,51,49,49)
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("6") end
	 end
	 --bas gauche
	 if pad:analogX() < -50 and pad:analogY() > 50 then
	    screen:blit(324,201,clavier1,152,101,49,49)
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("7") end
	 end
	 --bas milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > 50 then
	    screen:blit(374,201,clavier1,202,101,49,49)
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("8") end
	 end
	 --bas droite
	 if pad:analogX() > 50 and pad:analogY() > 50 then
	    screen:blit(424,201,clavier1,252,101,49,49)
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("0") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("9") end
	 end
   end
	
	if type_clavier2 == 1 then
	screen:blit(323,100,clavier2,0,0,151,151)
	 --milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(374,151,clavier2,202,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then effacer() end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("M") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre(" ") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("N") end
	 end
	 --haut gauche
	 if pad:analogX() < -50 and pad:analogY() < -50 then
	    screen:blit(324,101,clavier2,152,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("^") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("A") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("B") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("C") end
	 end
	 --haut milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() < -50 then
	    screen:blit(374,101,clavier2,202,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("@") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("D") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("E") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("F") end
	 end
	 --haut droite
	 if pad:analogX() > 50 and pad:analogY() < -50 then
	    screen:blit(424,101,clavier2,252,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("*") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("G") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("H") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("I") end
	 end
	 --gauche
	 if pad:analogX() < -50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(324,151,clavier2,152,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("_") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("J") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("K") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("L") end
	 end
	 --droite
	 if pad:analogX() > 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(424,151,clavier2,252,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("\"") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("O") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("P") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("Q") end
	 end
	 --bas gauche
	 if pad:analogX() < -50 and pad:analogY() > 50 then
	    screen:blit(324,201,clavier2,152,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("=") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("R") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("S") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("T") end
	 end
	 --bas milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > 50 then
	    screen:blit(374,201,clavier2,202,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre(";") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("U") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("V") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("W") end
	 end
	 --bas droite
	 if pad:analogX() > 50 and pad:analogY() > 50 then
	    screen:blit(424,201,clavier2,252,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("/") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("X") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("Y") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("Z") end
	 end
   end
	if type_clavier2 == 2 then
	screen:blit(323,100,clavier3,0,0,151,151)
	 --milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(374,151,clavier3,202,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then effacer() end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre(" ") end
	 end
	 --haut gauche
	 if pad:analogX() < -50 and pad:analogY() < -50 then
	    screen:blit(324,101,clavier3,152,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre(",") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("(") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre(".") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre(")") end
	 end
	 --haut milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() < -50 then
	    screen:blit(374,101,clavier3,202,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("\"") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("<") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("'") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre(">") end
	 end
	 --haut droite
	 if pad:analogX() > 50 and pad:analogY() < -50 then
	    screen:blit(424,101,clavier3,252,1,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("-") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("[") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("_") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("]") end
	 end
	 --gauche
	 if pad:analogX() < -50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(324,151,clavier3,152,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("!") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("{") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("?") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("}") end
	 end
	 --droite
	 if pad:analogX() > 50 and pad:analogY() > -50 and pad:analogY() < 50 then
	    screen:blit(424,151,clavier3,252,51,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("+") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("\\") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("=") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("/") end
	 end
	 --bas gauche
	 if pad:analogX() < -50 and pad:analogY() > 50 then
	    screen:blit(324,201,clavier3,152,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre(":") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("@") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre(";") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("#") end
	 end
	 --bas milieu
	 if pad:analogX() > -50 and pad:analogX() < 50 and pad:analogY() > 50 then
	    screen:blit(374,201,clavier3,202,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("~") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("$") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("`") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("%") end
	 end
	 --bas droite
	 if pad:analogX() > 50 and pad:analogY() > 50 then
	    screen:blit(424,201,clavier3,252,101,49,49)
	    if pad:triangle() and oldpad:triangle() ~= pad:triangle() then ajouter_lettre("*") end
	    if pad:square() and oldpad:square() ~= pad:square() then ajouter_lettre("^") end
	    if pad:cross() and oldpad:cross() ~= pad:cross() then ajouter_lettre("|") end
	    if pad:circle() and oldpad:circle() ~= pad:circle() then ajouter_lettre("&") end
	 end
   end
end   

function ajouter_lettre(lettre)
   if commande==nil then
   commande = lettre
   else
	 commande = commande .. lettre
   end
end

function effacer()
   if commande == nil then
   else
	 enleve_fond = string.sub(commande,0,string.len(commande) - 1)
	 commande = enleve_fond
   end
end
--

function print_osk(text1, text2, textC)

	if pOsk == "Sony" then
	brutFile = System.startOSK(textC,text2)
		
		return DelAcc (brutFile)
	else

		type_clavier = 1
		y=10
		type_clavier2 = 0


		oldpad=Controls.read()

		commande=textC

		fadeScreen("Increase", note, 38)

			while true do
			screen:clear()
			screen:blit(0,0,note)
			faderTS("", "timeTable", "Keyboard", 1)
			pad = Controls.read()
			screen:print(27,52,text1..": "..commande.."_",blanc)

			screen:print(330,260,"SELECT -> -",blanc)
			screen:print(40,260,text2,blanc)
			aff_clavier_()

				if pad:select() then
					commande=""
				end

				if Controls.read():start() then
					fadeScreen("Decrease", note, 38)
					return commande
				end

			screen.flip()
			screen.waitVblankStart()
			oldpad = pad
			end
	end
end
------------------------------------------------------------------



function fadeScreen(mode, picture, speed)

	if mode == "Decrease" then
		fader = Image.createEmpty(480,272)
		alphaValue = 0
		faderColor = Color.new(0,0,0,alphaValue)
		fader:clear(faderColor)

		while true do
			screen:clear()
			screen:blit(0,0,picture)
			screen:blit(0,0,fader)
			
				if alphaValue < 255 then
					alphaValue = alphaValue + speed
				else
					break
				end
				
			faderColor = Color.new(0,0,0,alphaValue)
			fader:clear(faderColor)
			screen.waitVblankStart()
			screen.flip()
		end
	end

	if mode == "Increase" then
		fader = Image.createEmpty(480,272)
		alphaValue = 255
		faderColor = Color.new(0,0,0,alphaValue)
		fader:clear(faderColor)

		while true do
			screen:clear()
			screen:blit(0,0,picture)
			screen:blit(0,0,fader)
			
				if alphaValue > 0 then
					alphaValue = alphaValue - speed
				else
					break
				end
				
			faderColor = Color.new(0,0,0,alphaValue)
			fader:clear(faderColor)
			screen.waitVblankStart()
			screen.flip()
		end
	end
end

function createStar(i)
   starfield[i] = {}
   starfield[i].x = math.random(2*width) - width
   starfield[i].y = math.random(2*height) - height
   starfield[i].z = zMax
end


function creatExtSquareBar(startX, startY, length, width, color)
Image:drawLine(startX, startY, startX, startY+width, color) --verticale gauche (début)
Image:drawLine(startX+length, startY, startX+length, startY+width, color) --verticale droite (fin)
Image:drawLine(startX, startY, startX+length, startY, color) --horizotale haut
Image:drawLine(startX, startY+width, startX+length, startY+width, color) --horizotale bas
end

function progress_bar(x1, y1, h, progress_length, total_length, colorBar)
screen:fillRect(x1,y1,progress_length/total_length,h,colorBar)
end

function password()
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/password.spn", "r")
pass = file:read()
file:close()

	if pass == "0" then
		passOk = nil
	else

		passOk=pass
		enterPass = print_osk(text_Load[1], text_NewNote[10], "")

			if enterPass ~= pass then
				System.message(text_Load[2],0)
				password()
			end
	end
end

function pOsk()
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/keyboard.spn", "r")
pOsk = file:read()
file:close()
end

function increName(fileN, mode)
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/"..fileN ,"r")
number = file:read("*n")
file:close()

number=number+mode

file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/"..fileN ,"w")
file:write(number)
file:close()
return "("..number..")"
end

function sauvSettings()
--Lang
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/lang.spn","w")
file:write(fbrowser.fl[fbrowser.s].name)
file:close()

--Password
if passOk == text_Options[16] then
passOk = "0"
end

file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/password.spn", "w")
file:write(passOk)
file:close()

--Keyboard
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/keyboard.spn", "w")
file:write(keyBoard)
file:close()

--Skin
file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/skin.spn","w")
file:write(fbrowser2.fl[fbrowser2.s].name)
file:close()

--Sounds
	if configSons == text_Options[17] then
		soundsM = "yes"
	else
		soundsM = "No"
	end


file = io.open("ms0:/PSP/GAME/"..path_Folders.."/config/sounds.spn","w")
file:write(soundsM)
file:close()
end

function DelAcc(txt)
	txtOk = string.gsub(txt, "é", "e")
	txtOk = string.gsub(txtOk, "è", "e")
	txtOk = string.gsub(txtOk, "à", "a")
	txtOk = string.gsub(txtOk, "ç", "c")
	txtOk = string.gsub(txtOk, "ê", "e")
	txtOk = string.gsub(txtOk, "î", "i")
	txtOk = string.gsub(txtOk, "€", "E")
	txtOk = string.gsub(txtOk, "ñ", "n")
	txtOk = string.gsub(txtOk, "ù", "u")
	return txtOk
	
end

function QuickNote()

Time()
	
	retQuickN = System.startOSK("","START : OK --> XMB")
	innote = DelAcc (retQuickN)
	
	comnote = "-Quick Note-"
	namenotep = ("QN "..day.."."..month.." - "..hour.."h"..minute)
	
	creatNote()
	
	System.sleep(100)--PAUSE
	
	System.Quit()
end