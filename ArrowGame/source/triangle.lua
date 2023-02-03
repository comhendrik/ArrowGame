local pd <const> = playdate
local gfx <const> = pd.graphics

class('Triangle').extends(gfx.sprite)

function Triangle:init(x, y)
    Triangle.super.init(self)
    self.x = x
    self.y = y
    self:moveTo(10, 120)
    local triangleImage = gfx.image.new(x,y)
    gfx.pushContext(triangleImage)
        gfx.fillTriangle(0,0,x,x/2,0,x)
    gfx.popContext()
    self:setImage(triangleImage)
end

function Triangle:update()
    if pd.buttonIsPressed(pd.kButtonUp) then 
        if self.y > 0 then
            self:moveTo(10,self.y-1,120)
            self.y = self.y - 1  
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 240 then
            self:moveTo(10,self.y+1)
            self.y = self.y + 1
        end
    end
end