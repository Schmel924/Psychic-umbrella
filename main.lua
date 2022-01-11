
require("load_graphics")

function love.load()
	GameState = {"Menu"}
	load_graphic_tiles ()
end



function pressmenu (k)
	if k == 'space'  then table.insert(GameState, 1, "Editor") 	end
	if k == 'escape' then love.event.quit(0) 				   	end
end

function pressedit (k)
	if k == 'escape' then table.remove(GameState, 1) 			end
end

function love.keypressed (k)
	if GameState[1] == "Menu"   then pressmenu(k) end
	if GameState[1] == "Editor" then pressedit(k) end	
end	

function drawmenu ()
	love.graphics.setBackgroundColor( 0, 0, 0, alpha)
	love.graphics.print('Hello World!', 400, 300)
end	

function drawedit ()
	love.graphics.setBackgroundColor( 115/255, 27/255, 135/255, 50/100)
	map.drawself()
--	love.graphics.draw (Asphalt, 3*80, 3*40, 0, 1)
end	


function love.update(dt)
	map:update_time (dt)
end

function love.draw()
	if GameState[1] == "Menu" 	then drawmenu() end
    if GameState[1] == "Editor" then drawedit() end	
end