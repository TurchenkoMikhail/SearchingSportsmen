-- Closed Events where mbappe plays
select "Event"."IDevent","IDmanager","IDsport_type","Date","Time","Address"  from "Event", "Application"
where "Application"."IDsportsman" = 1
and "Application"."IsAccepted" = true
and "Event"."IDevent" = "Application"."IDevent"
and "Event"."isClosed" = true 