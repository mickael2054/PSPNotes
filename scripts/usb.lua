--usb.lua


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



System.usbDiskModeActivate()

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




Time()

faderTS("", "timeTable", "USB", 1)


Textecentre(248, text_USB[3], noir)

if System.usbState(1,0) == 1 and System.usbState(3,0) ~= 1 then
Textecentre(120, text_USB[1], noir)
end

if System.usbState(3,0) == 1 then
Textecentre(130, text_USB[2], noir)
end

if Controls.read():circle() then
System.usbDiskModeDeactivate()

System.sleep(200)--PAUSE
fadeScreen("Decrease", note, 28)
dofile("ms0:/PSP/GAME/"..path_Folders.."/scripts/menu.lua")
end
screen.waitVblankStart()
screen.flip()
end