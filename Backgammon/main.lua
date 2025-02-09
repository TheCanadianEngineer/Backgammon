-- Libraries

-- Declare variable

function love.load()
  blackChip = love.graphics.newImage("Images/Black_Backgammon.png")
  background = love.graphics.newImage("Images/Backgammon_Board_blender_concept-with-pieces.png")
end

function love.update(dt)
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()

  mouseCoordsY = math.ceil(mouseY / (love.graphics.getHeight() / 2))

  if mouseX > 316 and mouseX < 1243 then
    mouseCoordsX = math.ceil((mouseX - 315 ) / 155)
  elseif mouseX > 1557 and mouseX < 2487 then
    mouseCoordsX = math.ceil((mouseX - 1557 ) / 155) + 6
  else
    mouseCoordsX = 0
    mouseCoordsY = 0  
  end
  
  
end

function love.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(background, 0, 0)
  love.graphics.setColor(0, 0, 1)
  love.graphics.print(love.mouse.getX()..", "..love.mouse.getY(), 1000, 1000)
  love.graphics.print(mouseCoordsX..", "..mouseCoordsY, 1000, 1100)
end