require 'middleclass'
require 'character'
require 'plateform'
require 'camera'

function love.load()
    love.graphics.setBackgroundColor(156, 218, 241)
    --love.sensor.enable("TYPE_ACCELEROMETER")
    --acc = 0
    c = Character:new()
    camera = Camera:new()    

    plateforms = {}

    for i = 1, 20 do
        for j = 1, 10 do
            table.insert(plateforms, Plateform:new(math.random(0 + 50, 320 - 50),math.random(480, -480)))
        end
    end

    --table.insert(plateforms, Plateform:new(100, 100))
    --table.insert(plateforms, Plateform:new(250, 250))
    --table.insert(plateforms, Plateform:new(200, 400))

end

function love.update(dt)

    c:update(dt)
    camera:update(dt)
    for _, p in pairs(plateforms) do
        p:update(dt)
    end    

end

function love.sensorchanged(n,t,v)
    acc = -tonumber(v[1])
end

function love.draw()
    camera:set()
    for _, p in pairs(plateforms) do
        p:draw()
    end
    c:draw()
    camera:unset()
end