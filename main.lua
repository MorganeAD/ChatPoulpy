require 'middleclass'
require 'character'
require 'plateform'
require 'camera'

function love.load()
    love.graphics.setBackgroundColor(156, 218, 241)
    --love.sensor.enable("TYPE_ACCELEROMETER")
    --acc = 0
    camera = Camera:new()
    c = Character:new()
    p1 = Plateform:new(100, 100)
    p2 = Plateform:new(250, 250)
    p3 = Plateform:new(200, 400)
end

function love.update(dt)
    c:update(dt)
    p1:update(dt)
    p2:update(dt)
    p3:update(dt)
end

function love.sensorchanged(n,t,v)
    acc = -tonumber(v[1])
end

function love.draw()
    camera:set()
    p1:draw()
    p2:draw()
    p3:draw()
    c:draw()
    camera:unset()
end