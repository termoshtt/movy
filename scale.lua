
local math = require("math")

module("movy.scale")

function scale(c,width_rate,height_rate,width_mini,height_mini)
    local width_rate = width_rate or 1.0
    local height_rate = height_rate or 1.0
    local width_mini = width_mini or 150.0
    local height_mini = height_mini or 150.0

    local geo = c:geometry()

    local width = geo.width * width_rate
    local height = geo.height * height_rate 

    width = math.max(width,width_mini)
    height = math.max(height,height_mini)

    c:geometry({height = height ,width = width})
end

function rescale(c,rate)
    local rate = rate or 1.0
    scale(c,rate,rate)
end

function enlarge(c)
    rescale(c,1.1)
end

function contruct(c)
    rescale(c,0.9)
end


