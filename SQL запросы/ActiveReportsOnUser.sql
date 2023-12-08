-- active reports on Guardiola

select "IDreceiver" as "Receiver", "IDsender" as "Sender", "Mark", "Comment", "Reply"
from "Review"
where "Review"."IDreceiver" = 4
and "IsActive" = true