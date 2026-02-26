
schedules =
{
    cyclic=true,
    entries={
           
        {
            instructions={
                data={
                    include_previous_station=false,
                    train_line = {
                        112700444,
                        -2090516141,
                        -1601924858,
                        -1483314606
                    },
                    usable=true
                },
                id="createrailwaysnavigator:travel_selection"
            }
        },
           
        {
            conditions = {
                {
                    {data={time_unit=2,value=5},id="create:delay"}
                }
            },
            instructions = {
                data={text="THis topwn"},
                id="create:destination"
            }
        },
           
        {
            conditions = {
                {
                    {data={time_unit = 1 ,value = 5 },id="create:delay"}
                }
            },
            instructions = {
                data={
                    avoid_red_signal=true,
                    avoid_trains = true,
                    filters = {"spawn1","spawn2","spawn3"}
                },
                id="createrailwaysnavigator:prioritized_destination_instruction"
            }             
        }
    },
    progress = 1
}

