-- ====================================
-- EINSTELLUNGEN
-- ====================================

local LIMIT = 10000
local INTERVAL = 2
local OUTPUT_SIDE = "back"
local PULSE_TIME = 0.2   -- Dauer des Impulses

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
-- TANKS FINDEN
-- ====================================

local tanks = { peripheral.find("createdieselgenerators:distillation_tank_block_entity") }

if #tanks == 0 then
    print("Keine Tanks gefunden!")
    return
end

print(#tanks .. " Tanks gefunden.")

-- Speichert ob Valve aktuell offen ist
local valveState = {}
for i = 1, #tanks do
    valveState[i] = false
end

-- ====================================
-- IMPULS FUNKTION
-- ====================================

local function pulse(color)
    redstone.setBundledOutput(OUTPUT_SIDE, color)
    sleep(PULSE_TIME)
    redstone.setBundledOutput(OUTPUT_SIDE, 0)
end

-- ====================================
-- HAUPTSCHLEIFE
-- ====================================

while true do
    
    for i, tank in ipairs(tanks) do
        
        local data = tank.tanks()
        local amount = 0
        
        if data and data[1] then
            amount = data[1].amount or 0
        end
        
        -- Tank über Limit -> öffnen falls noch geschlossen
        if amount > LIMIT and not valveState[i] then
            pulse(tankColors[i])
            valveState[i] = true
            print("Tank "..i.." -> Öffnungsimpuls")
        
        -- Tank unter Limit -> schließen falls offen
        elseif amount <= LIMIT and valveState[i] then
            pulse(tankColors[i])
            valveState[i] = false
            print("Tank "..i.." -> Schließimpuls")
        end
        
    end
    
    sleep(INTERVAL)
end