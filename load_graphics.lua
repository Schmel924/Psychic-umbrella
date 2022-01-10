animation = {}

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
	animation["Water_anim"] = newAnimation (SS_water, 80, 40, speed_animation)
	animation["Sand_anim"] = newAnimation (SS_sand,  80, 40, speed_animation)
	animation["Grass_anim"] = newAnimation (SS_grass, 80, 40, speed_animation)

end

function animation.update_time (dt)
 for k,v in pairs(animation) do
 	if type(v) ~= "function" then 
 		v.currentTime = v.currentTime + dt
		if v.currentTime >= v.duration then
    		v.currentTime = v.currentTime - v.duration
		end
	end
 end

end	

function animation.drawself (self)
	local count = 0
	for k,v in pairs(self) do
		if type(v) ~= "function" then 
			local spriteNum = math.floor(v.currentTime / v.duration * #v.quads) + 1
    		love.graphics.draw(v.spriteSheet, v.quads[spriteNum], count*80, count*40, 0, 1)
    		count = count+1 
		end 
	end	 
end	