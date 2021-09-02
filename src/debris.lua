function spawnTrash()
    math.randomseed(os.time())

    local trash = {}
    trash.x = math.random(225, 590)
    trash.y = math.random(-200, -300)
    trash.speed = 200

    table.insert(debris, trash)
end