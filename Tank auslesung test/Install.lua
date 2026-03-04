-- ====================================
-- SETTINGS
-- ====================================

local OPEN_LIMIT = 10000
local CLOSE_LIMIT = 8000
local INTERVAL = 2
local OUTPUT_SIDE = "back"
local PULSE_TIME = 0.2

local tankColors = {
    colors.white,
    colors.orange,
    colors.magenta,
    colors.lightBlue,
    colors.yellow,
    colors.lime,
    colors.pink,
    colors.gray,
    colors.lightGray,
    colors.cyan,
    colors.purple,
    colors.blue,
    colors.brown,
    colors.green
}

-- ====================================
-- FIND TANKS
-- ====================================

local tanks = { peripheral.find("createdieselgenerators:distillation_tank_block_entity") }

if #tanks == 0 then
    print("No tanks found")
    return
end

print(#tanks .. " tanks found")

-- save valve state
local valveState = {}
for i = 1, #tanks do
    valveState[i] = false
end

-- ====================================
-- PULSE FUNCTION
-- ====================================

local function pulse(color)
    redstone.setBundledOutput(OUTPUT_SIDE, color)
    sleep(PULSE_TIME)
    redstone.setBundledOutput(OUTPUT_SIDE, 0)
end

-- ====================================
-- MAIN LOOP
-- ====================================

while true do
    
    for i, tank in ipairs(tanks) do
        
        local data = tank.tanks()
        local amount = 0
        
        if data and data[1] then
            amount = data[1].amount or 0
        end
        
        -- open valve
        if amount >= OPEN_LIMIT and not valveState[i] then
            pulse(tankColors[i])
            valveState[i] = true
            print("Tank "..i.." OPEN ("..amount.." mB)")
        
        -- close valve
        elseif amount <= CLOSE_LIMIT and valveState[i] then
            pulse(tankColors[i])
            valveState[i] = false
            print("Tank "..i.." CLOSE ("..amount.." mB)")
        end
        
    end
    
    sleep(INTERVAL)
end