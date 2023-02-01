local pd <const> = playdate
local gfx <const> = pd.graphics

class('Wall').extends(gfx.sprite)

function Wall:init(x, y, w, h)
    Wall.super.init(self)
    self:moveTo(x, y)
    local wallImage = gfx.image.new(w,h)
    gfx.pushContext(wallImage)
        gfx.fillRect(0,0,w,h)
    gfx.popContext()
    self:setImage(wallImage)
    self:setCollideRect(0, 0, self:getSize())
end