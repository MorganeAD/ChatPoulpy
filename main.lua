require 'middleclass'
require 'character'
require 'plateform'

function love.load()
    love.graphics.setBackgroundColor(156, 218, 241)
    --love.sensor.enable("TYPE_ACCELEROMETER")
    --acc = 0
    c1 = Character:new()
    p1 = Plateform:new(100, 100)
    p2 = Plateform:new(250, 250)
    p3 = Plateform:new(200, 400)
end

function love.update(dt)
    c1:update(dt)
    p1:update(dt)
    p2:update(dt)
    p3:update(dt)
end

function love.sensorchanged(n,t,v)
    acc = -tonumber(v[1])
end

function love.draw()
    love.graphics.push()
    love.graphics.translate(0, - c1.y + 120*3)
    p1:draw()
    p2:draw()
    p3:draw()
    c1:draw()
   love.graphics.pop()

end