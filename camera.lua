
Camera = class('Camera')

function Camera:initialize()

end

function Camera:update(dt)

end

function Camera:set()
    love.graphics.push()
    love.graphics.translate(0, - c1.y + 480/2)
end

function Camera:unset()
    love.graphics.pop()
end