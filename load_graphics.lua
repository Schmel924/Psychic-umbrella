map = {}

function newAnimation(image, width, height, duration)
    local animat = {}
    animat.spriteSheet = image;
    animat.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animat.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animat.duration = duration or 1
    animat.currentTime = 0

    return animat
end

function load_graphic_tiles ()
	local speed_animation = 2
	SS_water = love.graphics.newImage("wasser.png")
	SS_grass = love.graphics.newImage("grass.png")
	SS_sand  = love.graphics.newImage("ssand.png")
	Asphalt  = love.graphics.newImage("assphalt.png")
for i=1,10 do
	map[i] = {}
	for j=1,10 do
		map[i][j] = newAnimation (SS_water, 80, 40, speed_animation)
	end
end
end

function map.update_time (self, dt)
for i=1,10 do
	for j=1,10 do
		map[i][j].currentTime = map[i][j].currentTime +dt
		if map[i][j].currentTime >= map[i][j].duration then
    		map[i][j].currentTime = map[i][j].currentTime - map[i][j].duration
		end
	end
end
end	

function TileToScreen (x,y)
	local screenX, screenY
	screenX = - (y * 40) + ( x * 40 ) +360
	screenY = (y * 20) + (x * 20)
return screenX, screenY
end	


function map.drawself ()
for i=1,10 do
	for j=1,10 do
		local spriteNum = math.floor(map[i][j].currentTime / map[i][j].duration * #map[i][j].quads) + 1
		local SX, SY = TileToScreen (i,j)
    	love.graphics.draw(map[i][j].spriteSheet, map[i][j].quads[spriteNum], SX, SY)
	end
end
end	