size = 200
zMax = 5
speed = 0.1

width = 480
height = 272

starfield = {}
math.randomseed(os.time())

for i = 1, size do
   createStar(i)
   starfield[i].z = math.random(zMax)
end





aT1 = 20
aT2 = 40
aT3 = 65
aT4 = 90
aT5 = 115
aT6 = 140
aT7 = 165
aT8 = 190
aT9 = 215
aT10 = 240
aT11 = 265
aT12 = 290





--Textes
t1 = { txt = text_By[1], vit = 12, x = 480}
t2 = { txt = text_By[2], vit = 12, x = 495}
t3 = { txt = text_By[3], vit = 12, x = 510}
t4 = { txt = text_By[4], vit = 12, x = 525}
t5 = { txt = text_By[5], vit = 12, x = 540}
t6 = { txt = text_By[6], vit = 12, x = 555}
t7 = { txt = text_By[7], vit = 12, x = 570}
t8 = { txt = text_By[8], vit = 12, x = 585}
t9 = { txt = text_By[9], vit = 12, x = 600}
t10 = { txt = text_By[10], vit = 12, x = 615}
t11 = { txt = text_By[11], vit = 12, x = 630}
t12 = { txt = text_By[12], vit = 12, x = 645}



fadeScreen("Increase", note, 28)

while true do
   screen:blit(0,0,note)
   for i = 1, size do
      starfield[i].z = starfield[i].z - speed
      if starfield[i].z < speed then createStar(i) end
      x = width / 2 + starfield[i].x / starfield[i].z
      y = height / 2 + starfield[i].y / starfield[i].z
      if x < 0 or y < 0 or x >= width or y >= height then
         createStar(i)
      else
         screen:pixel(x, y, noir)
      end
   end
		 
		 		 
screen:print(t1.x,aT1,t1.txt,rouge)
screen:print(t2.x,aT2,t2.txt,rouge)
screen:print(t3.x,aT3,t3.txt,rouge)
screen:print(t4.x,aT4,t4.txt,rouge)
screen:print(t5.x,aT5,t5.txt,rouge)
screen:print(t6.x,aT6,t6.txt,rouge)
screen:print(t7.x,aT7,t7.txt,rouge)
screen:print(t8.x,aT8,t8.txt,rouge)
screen:print(t9.x,aT9,t9.txt,rouge)
screen:print(t10.x,aT10,t10.txt,rouge)
screen:print(t11.x,aT11,t11.txt,rouge)
screen:print(t12.x,aT12,t12.txt,rouge)


if t1.x < 240 - (string.len(t1.txt)*8) / 2 then
t1.vit = 0
end
if t2.x < 240 - (string.len(t2.txt)*8) / 2 then
t2.vit = 0
end
if t3.x < 240 - (string.len(t3.txt)*8) / 2 then
t3.vit = 0 
end
if t4.x < 240 - (string.len(t4.txt)*8) / 2 then
t4.vit = 0
end
if t5.x < 240 - (string.len(t5.txt)*8) / 2 then
t5.vit = 0
end
if t6.x < 240 - (string.len(t6.txt)*8) / 2 then
t6.vit = 0
end
if t7.x < 240 - (string.len(t7.txt)*8) / 2 then
t7.vit = 0
end
if t8.x < 240 - (string.len(t8.txt)*8) / 2 then
t8.vit = 0
end
if t9.x < 240 - (string.len(t9.txt)*8) / 2 then
t9.vit = 0
end
if t10.x < 240 - (string.len(t10.txt)*8) / 2 then
t10.vit = 0
end
if t11.x < 240 - (string.len(t11.txt)*8) / 2 then
t11.vit = 0
end
if t12.x < 240 - (string.len(t12.txt)*8) / 2 then
t12.vit = 0
end

if t12.vit == 0 then

         aT1 = aT1-0.8
		 aT2 = aT2-0.8
		 aT3 = aT3-0.8
		 aT4 = aT4-0.8
		 aT5 = aT5-0.8
		 aT6 = aT6-0.8
		 aT7 = aT7-0.8
		 aT8 = aT8-0.8
		 aT9 = aT9-0.8
		 aT10 = aT10-0.8
		 aT11 = aT11-0.8
		 aT12 = aT12-0.8
end

t1.x = t1.x - t1.vit
t2.x = t2.x - t2.vit
t3.x = t3.x - t3.vit
t4.x = t4.x - t4.vit
t5.x = t5.x - t5.vit
t6.x = t6.x - t6.vit
t7.x = t7.x - t7.vit
t8.x = t8.x - t8.vit
t9.x = t9.x - t9.vit
t10.x = t10.x - t10.vit
t11.x = t11.x - t11.vit
t12.x = t12.x - t12.vit
   
   screen:print(10,262,text_By[13],blanc)
   screen.waitVblankStart()
   screen.flip()
   
   if aT12 <= -5 then
   dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")
   end
   
   if Controls.read():circle() then
   fadeScreen("Decrease", note, 28)
   dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")
   end
   
   if Controls.read():triangle() then
   System.webbrowser("ms0:/PSP/GAME/"..path_Folders.."", text_By[12])
   end
end
