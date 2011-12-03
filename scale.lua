module("movy.scale")

function rescale(c,rate)
    local rate = rate or 1.0
    local geo = c:geometry()
    local width = geo.width
    local height = geo.height
    c:geometry({width = rate*width,height = rate*height})
end

