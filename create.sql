CREATE TABLE IF NOT EXISTS "Concerts"."Artists"
(
    "Artist_Id" bigint NOT NULL,
    "A_Name" character varying COLLATE pg_catalog."default" NOT NULL,
    "A_Phone" character varying COLLATE pg_catalog."default" NOT NULL,
    "A_Email" character varying COLLATE pg_catalog."default" NOT NULL,
    "A_Address" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Artist_Id" PRIMARY KEY ("Artist_Id")
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Producers"
(
    "Producer_Id" bigint NOT NULL,
    "P_Title" character varying COLLATE pg_catalog."default" NOT NULL,
    "P_Address" character varying COLLATE pg_catalog."default" NOT NULL,
    "P_Phone" character varying COLLATE pg_catalog."default" NOT NULL,
    "P_Email" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Producer_Id" PRIMARY KEY ("Producer_Id")
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Halls"
(
    "Hall_Id" bigint NOT NULL,
    "H_Title" character varying COLLATE pg_catalog."default" NOT NULL,
    "H_Phone" character varying COLLATE pg_catalog."default" NOT NULL,
    "H_Email" character varying COLLATE pg_catalog."default" NOT NULL,
    "H_Address" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Hall_Id" PRIMARY KEY ("Hall_Id")
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Seats"
(
    "Seat_Id" bigint NOT NULL,
    "Hall_Id" bigint NOT NULL,
    "S_Category" character varying COLLATE pg_catalog."default" NOT NULL,
    "S_Quantity_Max" bigint NOT NULL,
    CONSTRAINT "Seat_Id" PRIMARY KEY ("Seat_Id"),
    CONSTRAINT "Hall_Id" FOREIGN KEY ("Hall_Id")
        REFERENCES "Concerts"."Halls" ("Hall_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Concerts"
(
    "Concert_Id" bigint NOT NULL,
    "Artist_Id" bigint NOT NULL,
    "Hall_Id" bigint NOT NULL,
    "Producer_Id" bigint NOT NULL,
    "C_Date" date NOT NULL,
    CONSTRAINT "Concert_Id" PRIMARY KEY ("Concert_Id"),
    CONSTRAINT "Artist_Id" FOREIGN KEY ("Artist_Id")
        REFERENCES "Concerts"."Artists" ("Artist_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Hall_Id" FOREIGN KEY ("Hall_Id")
        REFERENCES "Concerts"."Halls" ("Hall_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Producer_Id" FOREIGN KEY ("Producer_Id")
        REFERENCES "Concerts"."Producers" ("Producer_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Tickets"
(
    "Ticket_Id" bigint NOT NULL,
    "Concert_Id" bigint NOT NULL,
    "Seat_Id" bigint NOT NULL,
    "T_Price" money NOT NULL,
    "T_Remaining_Seats" bigint NOT NULL,
    CONSTRAINT "Ticket_Id" PRIMARY KEY ("Ticket_Id"),
    CONSTRAINT "Concert_Id" FOREIGN KEY ("Concert_Id")
        REFERENCES "Concerts"."Concerts" ("Concert_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Seat_Id" FOREIGN KEY ("Seat_Id")
        REFERENCES "Concerts"."Seats" ("Seat_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Receipts"
(
    "Receipt_Id" bigint NOT NULL,
    "R_Date" date NOT NULL,
    "R_Amount" money NOT NULL,
    CONSTRAINT "Receipt_Id" PRIMARY KEY ("Receipt_Id")
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Receipt_Items"
(
    "RI_Id" bigint NOT NULL,
    "Receipt_Id" bigint NOT NULL,
    "Ticket_Id" bigint NOT NULL,
    "RI_Quantity" bigint NOT NULL,
    "RI_Price" money NOT NULL,
    CONSTRAINT "RI_Id" PRIMARY KEY ("RI_Id"),
    CONSTRAINT "Receipt_Id" FOREIGN KEY ("Receipt_Id")
        REFERENCES "Concerts"."Receipts" ("Receipt_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Ticket_Id" FOREIGN KEY ("Ticket_Id")
        REFERENCES "Concerts"."Tickets" ("Ticket_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS "Concerts"."Refund"
(
    "Refund_Id" bigint NOT NULL,
    "Receipt_Id" bigint NOT NULL,
    "Ticket_Id" bigint NOT NULL,
    "RF_Quantity" bigint NOT NULL,
    "RF_Date" date NOT NULL,
    CONSTRAINT "Refund_Id" PRIMARY KEY ("Refund_Id"),
    CONSTRAINT "Receipt_Id" FOREIGN KEY ("Receipt_Id")
        REFERENCES "Concerts"."Receipts" ("Receipt_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Ticket_Id" FOREIGN KEY ("Ticket_Id")
        REFERENCES "Concerts"."Tickets" ("Ticket_Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;
