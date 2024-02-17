-- active reports on Mbappe

select "IDreceiver" as "Receiver", "IDsender" as "Sender", "Mark", "Comment", "Reply", "IDevent" 
from "Review"
where "Review"."IDreceiver" = 1
and "IsActive" = true