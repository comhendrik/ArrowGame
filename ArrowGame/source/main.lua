import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "wall"
import "arrow"
import "triangle"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
    local wall = Wall(350, 120, 20, 175)
    wall:add()
    local triangle = Triangle(0, 0, 5, 10)
    triangle:add()
end

initialize()

function playdate.update()
    if pd.buttonIsPressed(pd.kButtonA) then
        local newArrow = Arrow(20, 120, 5, 1.6)
        newArrow:add()
    end
    gfx.sprite.update()
    pd.drawFPS(380, 10)
end