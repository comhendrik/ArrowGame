local pd <const> = playdate
local gfx <const> = pd.graphics

class('Arrow').extends(gfx.sprite)

function Arrow:init(x, y, speed, accelaration)
    Arrow.super.init(self)
    self:moveTo(x, y)
    self:setGroups(1)
    self.x = x
    self.y = y
    local arrowImage = gfx.image.new("images/arrow_up")
    self:setImage(arrowImage)
    self.speed = speed
    self.accelaration = accelaration
    self.reachedHighesPoint = false
    self:setCollideRect(0, 0, self:getSize())
end

function Arrow:update()
    self.x = self.x + self.speed
    self.y = self.y - self.accelaration
    if self.reachedHighesPoint == true then
        self.accelaration = self.accelaration - 0.1
    else
        self.accelaration = self.accelaration + 0.1
        if self.accelaration > 4 then
            self.reachedHighesPoint = true
            self.accelaration = 0
            self:updateImage("images/arrow_down")
        end
    end
    self:moveWithCollisions(self.x, self.y)
    if self.y < 0 then
        self:remove()
    elseif self.y > 240 then
        self:remove()
    end
end

function Arrow:updateImage(imageName)
    local arrowImage = gfx.image.new(imageName)
    self:setImage(arrowImage)
end

function Arrow:collisionResponse(other)
    return "freeze"
end