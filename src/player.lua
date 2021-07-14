player = {}
player.x = love.graphics:getWidth() / 2
player.y = love.graphics:getHeight() - 100
player.speed = 350

function player:update(dt)
    player:movement(dt)
    player:checkBoundaries()
end

function player:movement(dt)
    if love.keyboard.isDown("w") then
       player.y = player.y - player.speed * dt
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end
end

function player:checkBoundaries()
    if player.x < 172 then
        player.x = 172
    elseif player.x > love.graphics.getWidth() - 174 then
        player.x = love.graphics.getWidth() - 174
    end

    if player.y < 400 then
        player.y = 400
    elseif player.y > love.graphics:getHeight() - 50 then
        player.y = love.graphics:getHeight() - 50
    end
end
