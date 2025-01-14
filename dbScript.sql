CREATE TABLE "users" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL UNIQUE,
	"password" varchar(255) NOT NULL,
	"complete_name" varchar(255),
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "signature" (
	"id" serial NOT NULL,
	"signature_date" timestamp with time zone NOT NULL DEFAULT 'NOW()',
	"delivery_date_id" integer NOT NULL,
	"user_id" integer NOT NULL UNIQUE,
	CONSTRAINT "signature_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "plans" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	"plan_description" TEXT NOT NULL,
	"img_url" TEXT NOT NULL,
	CONSTRAINT "plans_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "product_options" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "product_options_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "address" (
	"id" serial NOT NULL,
	"zip_code" varchar(255) NOT NULL,
	"street" varchar(255) NOT NULL,
	"street_number" varchar(255) NOT NULL,
	"neighborhood" varchar(255) NOT NULL,
	"user_id" integer NOT NULL UNIQUE,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "delivery_date" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	"plan_id" integer NOT NULL,
	CONSTRAINT "delivery_date_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_products" (
	"id" serial NOT NULL,
	"product_options_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "user_products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "signature" ADD CONSTRAINT "signature_fk0" FOREIGN KEY ("delivery_date_id") REFERENCES "delivery_date"("id");
ALTER TABLE "signature" ADD CONSTRAINT "signature_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");


ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "delivery_date" ADD CONSTRAINT "delivery_date_fk0" FOREIGN KEY ("plan_id") REFERENCES "plans"("id");

ALTER TABLE "user_products" ADD CONSTRAINT "user_products_fk0" FOREIGN KEY ("product_options_id") REFERENCES "product_options"("id");
ALTER TABLE "user_products" ADD CONSTRAINT "user_products_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");










INSERT INTO "plans" ("name","plan_description","img_url") VALUES ('semanal','Você recebe um box por semana.Ideal para quem quer exercer a gratidão todos os dias.','https://raw.githubusercontent.com/camilocoelhogomes/projeto_16_gratibox_front_end/main/src/assets/images/image04.jpg');
INSERT INTO "plans" ("name","plan_description","img_url") VALUES ('mensal','Você recebe um box por mês.Ideal para quem está começando agora.','https://raw.githubusercontent.com/camilocoelhogomes/projeto_16_gratibox_front_end/main/src/assets/images/image02.jpg');

INSERT INTO "product_options" ("name") VALUES ('Chás');
INSERT INTO "product_options" ("name") VALUES ('Incensos');
INSERT INTO "product_options" ("name") VALUES ('Produtos orgânicos');

INSERT INTO "delivery_date" ("name","plan_id") VALUES ('Segunda',1);
INSERT INTO "delivery_date" ("name","plan_id") VALUES ('Quarta',1);
INSERT INTO "delivery_date" ("name","plan_id") VALUES ('Sexta',1);


INSERT INTO "delivery_date" ("name","plan_id") VALUES ('10',2);
INSERT INTO "delivery_date" ("name","plan_id") VALUES ('20',2);
INSERT INTO "delivery_date" ("name","plan_id") VALUES ('30',2);










