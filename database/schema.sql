set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "users" (
	"userId" serial NOT NULL,
	"firstName" TEXT NOT NULL,
	"lastName" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT now(),
	CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "todos" (
	"todoId" serial NOT NULL,
	"name" TEXT NOT NULL,
	"details" TEXT NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "todos_pk" PRIMARY KEY ("todoId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "events" (
	"eventId" serial NOT NULL,
	"name" TEXT NOT NULL,
	"description" TEXT NOT NULL,
	"location" TEXT NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "events_pk" PRIMARY KEY ("eventId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "eventTodos" (
	"eventId" integer NOT NULL,
	"todoId" integer NOT NULL,
	CONSTRAINT "eventTodos_pk" PRIMARY KEY ("eventId","todoId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "participants" (
	"eventId" integer NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "participants_pk" PRIMARY KEY ("eventId","userId")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "todos" ADD CONSTRAINT "todos_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");
ALTER TABLE "events" ADD CONSTRAINT "events_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");
ALTER TABLE "eventTodos" ADD CONSTRAINT "eventTodos_fk0" FOREIGN KEY ("eventId") REFERENCES "events"("eventId");
ALTER TABLE "eventTodos" ADD CONSTRAINT "eventTodos_fk1" FOREIGN KEY ("todoId") REFERENCES "todos"("todoId");
ALTER TABLE "participants" ADD CONSTRAINT "participants_fk0" FOREIGN KEY ("eventId") REFERENCES "events"("eventId");
ALTER TABLE "participants" ADD CONSTRAINT "participants_fk1" FOREIGN KEY ("userId") REFERENCES "users"("userId");
