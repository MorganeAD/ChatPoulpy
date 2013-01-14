    require 'middleclass'
    require 'character'
    require 'plateform'
    require 'camera'
     
    function love.load()
        love.graphics.setBackgroundColor(156, 218, 241)
        love.sensor.enable("TYPE_ACCELEROMETER")
        --acc = 0
        c = Character:new()
        camera = Camera:new()
        step = 300
        done = step
        plateforms = {}
        generate(0, step)
    end
     
    function love.update(dt)
     
        if -camera.y + 480/2 > done - 480 then
            generate(done, done+step)
            done = done + step
            print('generated')
        end
     
        c:update(dt)
        camera:update(dt)
        for k, p in pairs(plateforms) do
            p:update(dt)
            if p.y > camera.y + 480/2 then
                table.remove(plateforms, k)
            end
        end
        print(table.getn(plateforms))
     
    end
     
    function generate(from, to)
        for i = from/30 + 1, to/30 do
            x = math.random(0, 20)
            if x >= 3 and x <= 20 then table.insert(plateforms, Plateform:new(math.random(0 + 50, 320 - 50), - i*30 + 480)) end
        end
    end
     
    --function love.sensorchanged(n,t,v)
    --    acc = -tonumber(v[1])
    --end
     
    function love.draw()
        camera:set()
        for _, p in pairs(plateforms) do
            p:draw()
        end
        c:draw()
        camera:unset()
     
        love.graphics.print(-camera.y + 480/2, 10, 10)
    end
