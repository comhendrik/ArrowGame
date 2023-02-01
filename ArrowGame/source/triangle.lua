local pd <const> = playdate
local gfx <const> = pd.graphics

class('Triangle').extends(gfx.sprite)

function Triangle:init(x, y, w, h)
    Triangle.super.init(self)
    self:moveTo(x, 120)
    local triangleImage = gfx.image.new(20,20)
    gfx.pushContext(triangleImage)
        gfx.fillTriangle(0,0,20,10,0,20)
    gfx.popContext()
    self:setImage(triangleImage)
end