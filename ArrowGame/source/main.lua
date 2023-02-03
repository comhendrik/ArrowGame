import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "wall"
import "arrow"
import "triangle"

local pd <const> = playdate
local gfx <const> = pd.graphics


local function initialize()
    local goalWall = Wall(350, 120, 20, 175)
    goalWall:add()
    triangle = Triangle(40,40)
    triangle:add()
end

initialize()

function playdate.update()
    if pd.buttonJustPressed(pd.kButtonA) then
        local newArrow = Arrow(40, triangle.y -10, 5, 1.6)
        newArrow:add()
    end
    gfx.sprite.update()
    pd.drawFPS(380, 10)
end