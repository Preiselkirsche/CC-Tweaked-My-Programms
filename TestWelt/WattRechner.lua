local path = "/disk/power.txt"
local total = 0

-- gespeicherten Wert laden
if fs.exists(path) then
    local f = fs.open(path, "r")
    total = tonumber(f.readAll()) or 0
    f.close()
end

-- Leistung aus Display holen
local function getPower()
    local s = target1.getLine(1)

    s = s:gsub(",", "")
    s = s:gsub("%..*", "")
    s = s:gsub("%D", "")

    return tonumber(s) or 0
end

local lastTime = os.clock()

while true do
    local now = os.clock()
    local dt = now - lastTime
    lastTime = now

    local watt = getPower()
    local kw = watt / 1000

    local hours = dt / 3600
    local energy = kw * hours

    total = total + energy

    -- speichern
    local f = fs.open(path, "w")
    f.write(total)
    f.close()

    print("Leistung:", kw, "kW")
    print("Gesamt:", total, "kWh")

    sleep(5)
end