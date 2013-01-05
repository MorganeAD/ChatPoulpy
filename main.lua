require 'middleclass'
require 'character'

function love.load()
    love.graphics.setBackgroundColor(156, 218, 241)
    --love.sensor.enable("TYPE_ALL")
    --nn = 'aaa'
    --tt = 'aaa'
    c1 = Character:new()
    c2 = Character:new()
end

function love.update(dt)
    c1:update(dt)
    c2:update(dt)
end

function love.sensorchanged(n,t,v)
    --nn = n
    --tt = t
    --print(n, t)
    --for index, val in pairs(v) do
    --  print(index, "->", val)
    --end
end

function love.draw()
    --love.graphics.print(nn, 20, 20)
    --love.graphics.print(tt, 20, 40)
    c1:draw()
    c2:draw()
end