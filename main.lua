function love.load()
    math.randomseed(os.time())

    require("src/player")
    require("src/debris")

    sprites = {}
    sprites.background = love.graphics.newImage("assets/sprites/background.png")
    sprites.player = love.graphics.newImage("assets/sprites/player.png")
    sprites.trash = love.graphics.newImage("assets/sprites/trash.png")

    backgroundY = 0

    debris = {}

    playerAngle = nil
    maxTime = 1
    timer = maxTime
    gameState = 1       --[[   --> 1 == main menu, 2 == playing <--   ]]--


    sprites.background:setWrap("repeat", "repeat")
    bg_quad = love.graphics.newQuad(0, 0, love.graphics.getWidth(), love.graphics.getHeight(), sprites.background:getWidth(), sprites.background:getHeight())
end

function love.update(dt)
--    if gameState == 2 then
        player:update(dt)
--    end

    if gameState == 1 then
        timer = timer - dt
        if timer <= 0 then
            spawnTrash()
            timer = maxTime
        end

        backgroundY = backgroundY + 100 * dt

        for i,d in ipairs(debris) do
            d.y = d.y + d.speed * dt
        end
    end

end


function love.draw()
    love.graphics.draw(sprites.background, bg_quad, 0, backgroundY)

    for i,d in ipairs(debris) do
        love.graphics.draw(sprites.trash, d.x, d.y, nil, 0.45, nil, sprites.trash:getWidth() / 2, sprites.trash:getHeight() / 2)
    end

    love.graphics.draw(sprites.player, player.x, player.y, nil, 0.75, nil, sprites.player:getWidth() / 2, sprites.player:getHeight() / 2)
    love.graphics.printf(timer, 5, love.graphics.getHeight() - 35, love.graphics.getWidth(), nil)
end

function love.keypressed(key)
    if key == "space" then
        spawnTrash()
    end
end