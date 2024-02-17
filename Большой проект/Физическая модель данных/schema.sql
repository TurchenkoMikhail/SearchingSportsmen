-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;
-- public."Moderator" definition

-- Drop table

-- DROP TABLE public."Moderator";

CREATE TABLE public."Moderator" (
	"IDmoderator" int4 NOT NULL,
	"Full_Name" varchar NULL,
	CONSTRAINT moderator_pk PRIMARY KEY ("IDmoderator")
);

-- Permissions

ALTER TABLE public."Moderator" OWNER TO postgres;
GRANT ALL ON TABLE public."Moderator" TO postgres;


-- public."Processing_Status" definition

-- Drop table

-- DROP TABLE public."Processing_Status";

CREATE TABLE public."Processing_Status" (
	"IDstatus" int4 NOT NULL DEFAULT '-1'::integer,
	description varchar NULL,
	CONSTRAINT processing_status_pk PRIMARY KEY ("IDstatus")
);

-- Permissions

ALTER TABLE public."Processing_Status" OWNER TO postgres;
GRANT ALL ON TABLE public."Processing_Status" TO postgres;


-- public."Sport_Types" definition

-- Drop table

-- DROP TABLE public."Sport_Types";

CREATE TABLE public."Sport_Types" (
	"Sport_Type" varchar NOT NULL,
	"IDsport_type" int4 NOT NULL,
	CONSTRAINT sport_type_pk PRIMARY KEY ("IDsport_type")
);

-- Permissions

ALTER TABLE public."Sport_Types" OWNER TO postgres;
GRANT ALL ON TABLE public."Sport_Types" TO postgres;


-- public."User" definition

-- Drop table

-- DROP TABLE public."User";

CREATE TABLE public."User" (
	"IDuser" int4 NOT NULL,
	"Full_Name" varchar NULL,
	"IsSportsman" bool NULL,
	"IsManager" bool NULL,
	CONSTRAINT "User_pk" PRIMARY KEY ("IDuser")
);

-- Permissions

ALTER TABLE public."User" OWNER TO postgres;
GRANT ALL ON TABLE public."User" TO postgres;


-- public."Users_Sport_Types" definition

-- Drop table

-- DROP TABLE public."Users_Sport_Types";

CREATE TABLE public."Users_Sport_Types" (
	"IDuser" int4 NOT NULL,
	"IDsport_type" int4 NOT NULL
);

-- Permissions

ALTER TABLE public."Users_Sport_Types" OWNER TO postgres;
GRANT ALL ON TABLE public."Users_Sport_Types" TO postgres;


-- public."Event" definition

-- Drop table

-- DROP TABLE public."Event";

CREATE TABLE public."Event" (
	"IDevent" int4 NOT NULL,
	"IDmanager" int4 NOT NULL,
	"IDsport_type" int4 NOT NULL,
	"Date" varchar NULL,
	"Time" varchar NULL,
	"Address" varchar NULL,
	"Comment" varchar NULL,
	"isClosed" bool NULL DEFAULT false,
	CONSTRAINT event_pk PRIMARY KEY ("IDevent"),
	CONSTRAINT event_manager_fk FOREIGN KEY ("IDmanager") REFERENCES public."User"("IDuser")
);

-- Permissions

ALTER TABLE public."Event" OWNER TO postgres;
GRANT ALL ON TABLE public."Event" TO postgres;


-- public."Review" definition

-- Drop table

-- DROP TABLE public."Review";

CREATE TABLE public."Review" (
	"IDreceiver" int4 NOT NULL,
	"IDsender" int4 NOT NULL,
	"Mark" int4 NOT NULL,
	"Comment" varchar NULL,
	"Reply" varchar NULL,
	"IsActive" bool NOT NULL DEFAULT true,
	"IDreview" int4 NOT NULL,
	"IDevent" int4 NULL,
	CONSTRAINT "Review_pk" PRIMARY KEY ("IDreview"),
	CONSTRAINT "Review_Receiver_fk" FOREIGN KEY ("IDreceiver") REFERENCES public."User"("IDuser"),
	CONSTRAINT "Review_Sender_fk" FOREIGN KEY ("IDsender") REFERENCES public."User"("IDuser"),
	CONSTRAINT review_event_fk FOREIGN KEY ("IDevent") REFERENCES public."Event"("IDevent")
);

-- Permissions

ALTER TABLE public."Review" OWNER TO postgres;
GRANT ALL ON TABLE public."Review" TO postgres;


-- public."Application" definition

-- Drop table

-- DROP TABLE public."Application";

CREATE TABLE public."Application" (
	"IDevent" int4 NULL,
	"IDapplication" int4 NOT NULL,
	"IDsportsman" int4 NULL,
	"IDstatus" int4 NULL DEFAULT '-1'::integer,
	"Comment" varchar NULL,
	CONSTRAINT apllication_pk PRIMARY KEY ("IDapplication"),
	CONSTRAINT application_event_fk FOREIGN KEY ("IDevent") REFERENCES public."Event"("IDevent"),
	CONSTRAINT application_sportsman_fk FOREIGN KEY ("IDsportsman") REFERENCES public."User"("IDuser"),
	CONSTRAINT application_status_fk FOREIGN KEY ("IDstatus") REFERENCES public."Processing_Status"("IDstatus")
);

-- Permissions

ALTER TABLE public."Application" OWNER TO postgres;
GRANT ALL ON TABLE public."Application" TO postgres;


-- public."Complaint" definition

-- Drop table

-- DROP TABLE public."Complaint";

CREATE TABLE public."Complaint" (
	"IDcomplaint" int4 NOT NULL,
	"IDmoderator" int4 NULL,
	"IDreview" int4 NULL,
	"IDstatus" int4 NULL DEFAULT '-1'::integer,
	"comment" varchar NULL,
	CONSTRAINT "Complaint_pk" PRIMARY KEY ("IDcomplaint"),
	CONSTRAINT "Complaint_Moderator_fk" FOREIGN KEY ("IDmoderator") REFERENCES public."Moderator"("IDmoderator"),
	CONSTRAINT "Complaint_Review_fk" FOREIGN KEY ("IDreview") REFERENCES public."Review"("IDreview"),
	CONSTRAINT complaint_status_fk FOREIGN KEY ("IDstatus") REFERENCES public."Processing_Status"("IDstatus")
);

-- Permissions

ALTER TABLE public."Complaint" OWNER TO postgres;
GRANT ALL ON TABLE public."Complaint" TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;