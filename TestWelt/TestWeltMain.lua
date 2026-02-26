stationSpawn1 = peripheral.wrap("Create_Station_0")

dofile("TestWeltScheduleNorth.lua")

while not stationSpawn1.isTrainPresent() do
    sleep(0.1)
end

stationSpawn1.setSchedule(northSchedules)
