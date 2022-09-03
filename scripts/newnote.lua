--newnote.lua

selected = 1

	if editNote == "no" then
		innote = ""
		comnote = ""
		namenotep = ("Note du "..day.." du "..month.." a "..hour.." h "..minute)
	end

fadeScreen("Increase", note, 28)

while true do
	screen:blit(0,0,note)

	faderTS("", "timeTable", "NewNote", 1)

	pad = Controls.read()

		if pad:up() then
			System.sleep(200)
			selected = selected - 1
		end

		if pad:down() then
			System.sleep(200)
			selected = selected + 1
		end

		if selected < 1 then
			selected = 3
		end

		if selected > 3 then
			selected = 1
		end

	screen:fontPrint(himfont,40,238,text_NewNote[10],noir)

		if selected == 1 then
			screen:fontPrint(himfont,40,62,text_NewNote[1]..">   "..innote,noir)
			screen:fontPrint(himfont,40,106,text_NewNote[3].."    "..comnote,blanc)
			screen:fontPrint(himfont,40,150,text_NewNote[5].."    "..namenotep,blanc)

			if pad:right() or pad:cross() then
				fadeScreen("Decrease", note, 38)

					if not editNote == 1 then
						innote = print_osk(text_NewNote[1], "START -> "..text_NewNote[2], "")
					else
						innote = print_osk(text_NewNote[1], "START -> ".. text_NewNote[2], innote)
					end

				fadeScreen("Increase", note, 38)
			end

		elseif selected == 2 then
			screen:fontPrint(himfont,40,62,text_NewNote[1].."    "..innote,blanc)
			screen:fontPrint(himfont,40,106,text_NewNote[3]..">   "..comnote,noir)
			screen:fontPrint(himfont,40,150,text_NewNote[5].."    "..namenotep,blanc)

				if pad:right() or pad:cross() then
					fadeScreen("Decrease", note, 38)
					comnote = print_osk(text_NewNote[3], "START -> "..text_NewNote[4], comnote)
					fadeScreen("Increase", note, 38)
				end

		elseif selected == 3 then
			screen:fontPrint(himfont,40,62,text_NewNote[1].."    "..innote,blanc)
			screen:fontPrint(himfont,40,106,text_NewNote[3].."    "..comnote,blanc)
			screen:fontPrint(himfont,40,150,text_NewNote[5]..">   "..namenotep,noir)

				if pad:right() or pad:cross() then
					fadeScreen("Decrease", note, 38)
					namenotep = print_osk(text_NewNote[5], "START -> "..text_NewNote[6], namenotep)
					fadeScreen("Increase", note, 38)
				end
		end
		

	if string.len(innote) > 2 and string.len(namenotep) > 2 then
		selctOk = "ok"
	end

			if Controls.read():start() and selctOk == "ok" then
				editNote = 0
				creatNote()
				fadeScreen("Decrease", note, 28)
				dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")
			end

	screen.waitVblankStart()
	screen.flip()
end
