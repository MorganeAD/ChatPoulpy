function love.load()
    octocat = love.graphics.newImage("octocat.png")
    love.graphics.setBackgroundColor(156, 218, 241)
    --love.sensor.enable("TYPE_ALL")
    --nn = 'aaa'
    --tt = 'aaa'

    yspeed = 0
    y = 480 - 56
    gravity = 1200

    xspeed = 0
    x = 320/2
    xspeedmax = 250
end

function love.update(dt)
    -- gravité et vitesse sur Y
    yspeed = yspeed + gravity * dt
    y = y + yspeed * dt

    -- collision avec le sol
    if y >= 480 - 56/2 then
        y = 480 - 56/2 -- correction du delta
        yspeed = -650 -- saut
    end

    if love.keyboard.isDown("left") then
        --if xspeed > 0 then xspeed = 0 end
        if xspeed > -xspeedmax then xspeed = xspeed - 10 end
    elseif love.keyboard.isDown("right") then
        --if xspeed < 0 then xspeed = 0 end
        if xspeed <  xspeedmax then xspeed = xspeed + 10 end
    else
        xspeed = xspeed / 1.05
    end
    x = x + xspeed * dt

    -- infini sur x
    if x <=   0 then x = 320 end
    if x >  320 then x =   0 end
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
    love.graphics.draw(octocat, x    , y, 0, 1, 1, 64/2, 56/2)
    love.graphics.draw(octocat, x-320, y, 0, 1, 1, 64/2, 56/2)
    love.graphics.draw(octocat, x+320, y, 0, 1, 1, 64/2, 56/2)
    --love.graphics.print(nn, 20, 20)
    --love.graphics.print(tt, 20, 40)
end