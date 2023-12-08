-- mbappe's sport types

select "Sport_Type" from "Sport_Types", "Users_Sport_Types"
where "Users_Sport_Types"."IDuser" = 1 
and "Users_Sport_Types"."IDsport_type" = "Sport_Types"."IDsport_type" 