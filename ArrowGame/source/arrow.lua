local pd <const> = playdate
local gfx <const> = pd.graphics

class('Arrow').extends(gfx.sprite)

function Arrow:init(x, y, speed, accelaration)
    Arrow.super.init(self)
    self:moveTo(x, y)
    self:setGroups(1)
    self.x = x
    self.y = y
    local arrowImage = gfx.image.new("images/arrow")
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
        end
    end
    self:moveWithCollisions(self.x, self.y)
end

function Arrow:collisionResponse(other)
    return "freeze"
end