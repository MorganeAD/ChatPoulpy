
Plateform = class('Plateform')

Plateform.image = love.graphics.newImage("plateform.png")

function Plateform:initialize(x, y)
   self.x = x
   self.y = y
end

function Plateform:update(dt)
    if c1.y > self.y - 64/2 - 5 and c1.y < self.y - 64/2 + 5 and c1.yspeed > 0 and c1.x > self.x - 35  and c1.x < self.x + 35 then
        c1.y = self.y - 64/2-- correction du delta
        c1.yspeed = -650 -- saut
    end
end

function Plateform:draw()
    love.graphics.draw(Plateform.image, self.x, self.y, 0, 1, 1, 50/2, 10/2)
end