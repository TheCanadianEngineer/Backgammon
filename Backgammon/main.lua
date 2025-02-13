-- Libraries



function love.load()
  draw = true
  numOfPieces = nil
  pieceType = nil
  pieceLocation = nil

  -- Creating piece storage
  pieces = {{{2,1, 391}, {0,"", 546}, {0,"", 701}, {0,"", 856}, {0,"", 1011}, {5,2, 1166}, {0,"", 1633}, {3,2, 1788}, {0,"", 1943}, {0,"", 2098}, {0,"", 2253}, {5,1, 2408}},
            {{2,2, 391}, {0,"", 546}, {0,"", 701}, {0,"", 856}, {0,"", 1011}, {5,1, 1166}, {0,"", 1633}, {3,1, 1788}, {0,"", 1943}, {0,"", 2098}, {0,"", 2253}, {5,2, 2408}}}

  -- Creating the image objects
  background = love.graphics.newImage("Images/Backgammon_Board_blender_concept-with-pieces.png")

  whitePiece = love.graphics.newImage("Images/White_Piece.png")
  blackPiece = love.graphics.newImage("Images/Black_Piece.png")
end

function drawPieces()
  print("Drawing pieces")
  for i = 1, #pieces do
    for j = 1, #pieces[i] do
          -- Setting how many pieces are in the location
          numOfPieces = pieces[i][j][1]
          print("Number of pieces: "..numOfPieces)
          -- Setting the type of piece
          pieceType = pieces[i][j][2]
          print("Type of piece: "..pieceType)
          -- Setting the location of the piece
          pieceLocation = pieces[i][j][3]
          print("Location of piece: "..pieceLocation)

        if numOfPieces > 0 then
          if i == 1 then
            local y = 0
            for l = 1, numOfPieces do
              if pieceType == 2 then
                love.graphics.draw(blackPiece, pieceLocation - (148 / 2), y)
              else
                love.graphics.draw(whitePiece, pieceLocation - (148 / 2), y)
              end
              y = y + 100
            end
          elseif i == 2 then
            local y = 1439 - 148
            for h = 1, numOfPieces do
              if pieceType == 2 then
                love.graphics.draw(blackPiece, pieceLocation - (148 / 2), y)
              else
                love.graphics.draw(whitePiece, pieceLocation - (148 / 2), y)
              end
              y = y - 100
            end
          end
      end
    end
  end
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
  -- if draw then
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(background, 0, 0)
  -- love.graphics.draw(whitePiece, 1000, 1000)
  -- love.graphics.draw(blackPiece, 1200, 1244)
  drawPieces()
  love.graphics.setColor(0, 0, 1)
  love.graphics.print(love.mouse.getX()..", "..love.mouse.getY(), 1000, 1000)
  love.graphics.print(mouseCoordsX..", "..mouseCoordsY, 1000, 1100)
  draw = false
  -- end
end