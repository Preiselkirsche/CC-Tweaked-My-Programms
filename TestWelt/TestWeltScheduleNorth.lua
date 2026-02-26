
northSchedules =
{
    cyclic=true,
    entries={
           
        {
            instruction={
                data={
                    include_previous_station=false,
                    train_line = {
                        -1632728337,
                        -1067694710,
                        -1563614300,
                        171209346
                    },
                    usable=true
                },
                id="createrailwaysnavigator:travel_selection"
            }
        },
           
        {
            conditions = {
                {
                    {data={time_unit=1,value=20},id="create:delay"}
                }
            },
            instruction = {
                data={text="Spawn 1"},
                id="create:destination"
            }
        },

        {
            conditions = {
                {
                    {data={time_unit=1,value=10},id="create:delay"}
                }
            },
            instruction = {
                data={text="Zwischenstop North 1"},
                id="create:destination"
            }
        },  

        {
            conditions = {
                {
                    {data={time_unit=1,value=5},id="create:delay"}
                }
            },
            instruction = {
                data={text="Endstation North"},
                id="create:destination"
            }
        },        
    },
    progress = 1
}

