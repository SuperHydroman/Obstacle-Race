function love.load()
    require("src/player")

    sprites = {}
    sprites.background = love.graphics.newImage("assets/sprites/background.png")
    sprites.player = love.graphics.newImage("assets/sprites/player.png")

    gameState = 1       --[[   --> 1 == main menu, 2 == playing <--   ]]--
end

function love.update(dt)
--    if gameState == 2 then
        player:update(dt)
--    end
end

function love.draw()
    love.graphics.print(love.graphics:getWidth() .. " & " .. love.graphics:getHeight())
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(sprites.player, player.x, player.y, nil, 0.5, nil, sprites.player:getWidth() / 2, sprites.player:getHeight() / 2)
end