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
    b = 500
    plateforms = {}
    birth()
    
    --for i = 1, 1000 do
    --    x = math.random(0, 20)
    --    if x >= 3 and x <= 20 then table.insert(plateforms, Plateform:new(math.random(0 + 50, 320 - 50), - i*30 + 480)) end
    --end    

end

function love.update(dt)

    b = b + camera.y
    c:update(dt)
    camera:update(dt)
    for _, p in pairs(plateforms) do
        p:update(dt)
    end    
end

function birth()

    for i = 1, b do
        x = math.random(0, 20)
        if x >= 3 and x <= 20 then table.insert(plateforms, Plateform:new(math.random(0 + 50, 320 - 50), - i*30 + 480)) end
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