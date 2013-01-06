
Camera = class('Camera')

function Camera:initialize()
    self.y = 480/2
end

function Camera:update(dt)
    if self.y > c.y then self.y = c.y end
end

function Camera:set()
    love.graphics.push()
    love.graphics.translate(0, - self.y + 480/2)
end

function Camera:unset()
    love.graphics.pop()
end