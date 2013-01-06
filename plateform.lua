
Plateform = class('Plateform')

Plateform.image = love.graphics.newImage("plateform.png")

function Plateform:initialize(x, y)
   self.x = x
   self.y = y
end

function Plateform:update(dt)
    if c.y > self.y - 64/2 - 5 and c.y < self.y - 64/2 + 5 and c.yspeed > 0 and c.x > self.x - 35  and c.x < self.x + 35 then
        c.y = self.y - 64/2-- correction du delta
        c.yspeed = -650 -- saut
    end
end

function Plateform:draw()
    love.graphics.draw(Plateform.image, self.x, self.y, 0, 1, 1, 50/2, 10/2)
end