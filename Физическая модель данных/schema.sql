-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;
-- public.виды_спорта definition

-- Drop table

-- DROP TABLE public.виды_спорта;

CREATE TABLE public.виды_спорта (
	"Вид спорта" varchar NOT NULL,
	"IDвид_спорта" int4 NOT NULL,
	CONSTRAINT виды_спорта_pk PRIMARY KEY ("IDвид_спорта")
);

-- Permissions

ALTER TABLE public.виды_спорта OWNER TO postgres;
GRANT ALL ON TABLE public.виды_спорта TO postgres;


-- public.виды_спорта_участников definition

-- Drop table

-- DROP TABLE public.виды_спорта_участников;

CREATE TABLE public.виды_спорта_участников (
	"IDучастник" int4 NOT NULL,
	"IDвид_спорта" int4 NOT NULL
);

-- Permissions

ALTER TABLE public.виды_спорта_участников OWNER TO postgres;
GRANT ALL ON TABLE public.виды_спорта_участников TO postgres;


-- public.модератор definition

-- Drop table

-- DROP TABLE public.модератор;

CREATE TABLE public.модератор (
	"IDмодератор" int4 NOT NULL,
	фио varchar NULL,
	CONSTRAINT модератор_pk PRIMARY KEY ("IDмодератор")
);

-- Permissions

ALTER TABLE public.модератор OWNER TO postgres;
GRANT ALL ON TABLE public.модератор TO postgres;


-- public.участник definition

-- Drop table

-- DROP TABLE public.участник;

CREATE TABLE public.участник (
	"IDучастник" int4 NOT NULL,
	"ФИО" varchar NULL,
	"Спортсмен?" bool NULL,
	"Менеджер?" bool NULL,
	CONSTRAINT участник_pk PRIMARY KEY ("IDучастник")
);

-- Permissions

ALTER TABLE public.участник OWNER TO postgres;
GRANT ALL ON TABLE public.участник TO postgres;


-- public.мероприятие definition

-- Drop table

-- DROP TABLE public.мероприятие;

CREATE TABLE public.мероприятие (
	"IDмероприятие" int4 NOT NULL,
	"IDменеджер" int4 NOT NULL,
	"IDвид_спорта" int4 NOT NULL,
	дата varchar NULL,
	время varchar NULL,
	место varchar NULL,
	комментарий varchar NULL,
	CONSTRAINT мероприятие_pk PRIMARY KEY ("IDмероприятие"),
	CONSTRAINT мероприятие_менеджер_fk FOREIGN KEY ("IDменеджер") REFERENCES public.участник("IDучастник")
);

-- Permissions

ALTER TABLE public.мероприятие OWNER TO postgres;
GRANT ALL ON TABLE public.мероприятие TO postgres;


-- public.отзыв definition

-- Drop table

-- DROP TABLE public.отзыв;

CREATE TABLE public.отзыв (
	"IDполучатель" int4 NOT NULL,
	"IDотправитель" int4 NOT NULL,
	оценка int4 NOT NULL,
	комментарий varchar NULL,
	reply varchar NULL,
	"Активный?" bool NOT NULL DEFAULT true,
	"IDотзыв" int4 NOT NULL,
	CONSTRAINT отзыв_pk PRIMARY KEY ("IDотзыв"),
	CONSTRAINT отзыв_отправитель_fk FOREIGN KEY ("IDотправитель") REFERENCES public.участник("IDучастник"),
	CONSTRAINT отзыв_получатель_fk FOREIGN KEY ("IDполучатель") REFERENCES public.участник("IDучастник")
);

-- Permissions

ALTER TABLE public.отзыв OWNER TO postgres;
GRANT ALL ON TABLE public.отзыв TO postgres;


-- public.жалоба definition

-- Drop table

-- DROP TABLE public.жалоба;

CREATE TABLE public.жалоба (
	"IDжалоба" int4 NOT NULL,
	"IDмодератор" int4 NULL,
	"Обработана?" bool NOT NULL DEFAULT false,
	"Удовлетворена?" bool NOT NULL DEFAULT false,
	"IDотзыв" int4 NULL,
	CONSTRAINT жалоба_pk PRIMARY KEY ("IDжалоба"),
	CONSTRAINT жалоба_модератор_fk FOREIGN KEY ("IDмодератор") REFERENCES public.модератор("IDмодератор"),
	CONSTRAINT жалоба_отзыв_fk FOREIGN KEY ("IDотзыв") REFERENCES public.отзыв("IDотзыв")
);

-- Permissions

ALTER TABLE public.жалоба OWNER TO postgres;
GRANT ALL ON TABLE public.жалоба TO postgres;


-- public.заявка definition

-- Drop table

-- DROP TABLE public.заявка;

CREATE TABLE public.заявка (
	"IDмероприятие" int4 NULL,
	"IDзаявка" int4 NOT NULL,
	"Одобрена?" bool NULL DEFAULT false,
	"IDспортсмен" int4 NULL,
	CONSTRAINT заявка_pk PRIMARY KEY ("IDзаявка"),
	CONSTRAINT заявка_меро_fk FOREIGN KEY ("IDмероприятие") REFERENCES public.мероприятие("IDмероприятие"),
	CONSTRAINT заявка_спортсмен_fk FOREIGN KEY ("IDспортсмен") REFERENCES public.участник("IDучастник")
);

-- Permissions

ALTER TABLE public.заявка OWNER TO postgres;
GRANT ALL ON TABLE public.заявка TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;
