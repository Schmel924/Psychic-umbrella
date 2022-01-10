function love.load()
	GameState = {"Menu"}
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
	love.graphics.print('Hello World!', 400, 300)
end	

function drawedit ()
	love.graphics.print('EDIT World!', 400, 300)
end	


function love.update(dt)
	
end


function love.draw()
	if GameState[1] == "Menu" 	then drawmenu() end
    if GameState[1] == "Editor" then drawedit() end	
end