--[[function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end]]

function love.load()
	GameState = {"Menu"}
end

function love.keypressed (k)
	-- escape to previous GameState, if it's outermost - close the program
	if k == 'escape' then
		if GameState[1] == "Menu" then
		    love.event.quit(0) 
		end
		table.remove(GameState, 1)
	end

end	

function love.update(dt)
	
end


function love.draw()
    love.graphics.print('Hello World!', 400, 300)
end