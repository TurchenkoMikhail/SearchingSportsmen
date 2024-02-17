-- Opened Events where mbappe plays
select "Event"."IDevent","IDmanager","IDsport_type","Date","Time","Address","Event"."Comment" from "Event", "Application"
where "Application"."IDsportsman" = 1
and "Application"."IDstatus" = 1
and "Event"."IDevent" = "Application"."IDevent"
and "Event"."isClosed" = false