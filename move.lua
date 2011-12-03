
local math = require("math")
local capi = {
    mouse = mouse,
    client = client,
    screen = screen
}
module("movy.move")

local placelist = { 
    center = {x=1,y=1},
    leftup = {x=0,y=0},
    leftdow = {x=0,y=2},
    rightup = {x=2,y=0},
    rightdown = {x=2,y=2}
}

-- place : center ,leftup ,leftdown ,rightup ,rightdown
function set_place(c,place,screen)
    local place = placelist[place] or placelist["center"]
    local screen = screen or capi.mouse.screen

    local sgeom = capi.screen[screen].workarea
    local cgeom = c:geometry()

    local width  = cgeom.width
    local height = cgeom.height
    
    c:geometry({ 
        x = sgeom.x + place.x * (sgeom.width  - width)  / 2,
        y = sgeom.y + place.y * (sgeom.height - height) / 2,
        width = width,      height = height
    })
end

function move(c,dx,dy,screen)
    local dx = dx or 0.0
    local dy = dy or 0.0

    local screen = screen or capi.mouse.screen
    local sgeom = capi.screen[screen].workarea

    local cgeom = c:geometry()
    local width = cgeom.width
    local height = cgeom.height

    if math.abs(dx) <= 1.0 then dx = dx * sgeom.width / 10.0 end
    if math.abs(dy) <= 1.0 then dy = dy * sgeom.height / 10.0 end

    local x = sgeom.x + cgeom.x + dx
    local y = sgeom.y + cgeom.y + dy

    if x < 0 then x = 0 end
    if y < 0 then y = 0 end

    if x + width > sgeom.x + sgeom.width then
        x = sgeom.x + sgeom.width - width
    end
    if y + height > sgeom.y + sgeom.height then 
        y = sgeom.y + sgeom.height - height
    end
    c:geometry({x=x,y=y})
end

function left(c,screen)
    local screen = screen or capi.mouse.screen
    local sgeom = capi.screen[screen].workarea
    move(c,-sgeom.width,0.0)
end

function right(c,screen)
    local screen = screen or capi.mouse.screen
    local sgeom = capi.screen[screen].workarea
    move(c,sgeom.width,0.0)
end

function up(c,screen)
    local screen = screen or capi.mouse.screen
    local sgeom = capi.screen[screen].workarea
    move(c,0.0,-sgeom.height)
end

function down(c,screen)
    local screen = screen or capi.mouse.screen
    local sgeom = capi.screen[screen].workarea
    move(c,0.0,sgeom.height)
end

