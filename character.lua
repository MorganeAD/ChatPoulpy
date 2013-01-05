
Character = class('Character')

Character.octocat = love.graphics.newImage("octocat.png")

function Character:initialize()
    self.yspeed = 0
    self.y = 480 - 56
    self.gravity = 1200

    self.xspeed = 0
    self.x = 320/2
    self.xspeedmax = 250
end

function Character:update(dt)
    -- gravité et vitesse sur Y
    self.yspeed = self.yspeed + self.gravity * dt
    self.y = self.y + self.yspeed * dt

    -- collision avec le sol
    if self.y >= 480 - 56/2 then
        self.y = 480 - 56/2 -- correction du delta
        self.yspeed = -650 -- saut
    end

    if love.keyboard.isDown("left") then
        if self.xspeed > -self.xspeedmax then self.xspeed = self.xspeed - 10 end
    elseif love.keyboard.isDown("right") then
        if self.xspeed <  self.xspeedmax then self.xspeed = self.xspeed + 10 end
    else
        self.xspeed = self.xspeed / 1.05
    end
    self.x = self.x + self.xspeed * dt

    -- infini sur x
    if self.x <=   0 then self.x = 320 end
    if self.x >  320 then self.x =   0 end
end

function Character:draw()
    love.graphics.draw(Character.octocat, self.x    , self.y, 0, 1, 1, 64/2, 56/2)
    love.graphics.draw(Character.octocat, self.x-320, self.y, 0, 1, 1, 64/2, 56/2)
    love.graphics.draw(Character.octocat, self.x+320, self.y, 0, 1, 1, 64/2, 56/2)
end