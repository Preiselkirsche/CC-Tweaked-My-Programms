-- ====================================
-- SETTINGS
-- ====================================

local OUTPUT_SIDE = "back"
local PULSE_TIME = 0.4

local colorsList = {
    colors.white,
    colors.orange,
    colors.magenta,
    colors.lightBlue,
    colors.yellow,
    colors.lime,
    colors.pink
}

local colorNames = {
    "white",
    "orange",
    "magenta",
    "lightBlue",
    "yellow",
    "lime",
    "pink"
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
print("Press key to start mapping")
os.pullEvent("key")

-- ====================================
-- PULSE FUNCTION
-- ====================================

local function pulse(color)
    redstone.setBundledOutput(OUTPUT_SIDE, color)
    sleep(PULSE_TIME)
    redstone.setBundledOutput(OUTPUT_SIDE, 0)
end

-- ====================================
-- TEST LOOP
-- ====================================

for i, tank in ipairs(tanks) do

    term.clear()
    term.setCursorPos(1,1)

    local name = peripheral.getName(tank)

    print("Tank "..i)
    print("")
    print("Peripheral name:")
    print(name)
    print("")
    print("Test color:")
    print(colorNames[i])
    print("")
    print("Look which valve toggles")
    print("")
    print("Press key to send pulse")

    os.pullEvent("key")

    pulse(colorsList[i])

    print("")
    print("Press key for next tank")

    os.pullEvent("key")

end

print("")
print("Mapping finished")