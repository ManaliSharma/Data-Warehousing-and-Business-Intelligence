--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Chinook_1.DM1
--
-- Date Created : Monday, February 11, 2019 14:30:34
-- Target DBMS : PostgreSQL 9.x
--

-- 
-- TABLE: "DIM_ALBUM" 
--

CREATE TABLE "DIM_ALBUM"(
    "AlbumID"    int4            NOT NULL,
    "Title"      varchar(100)    NOT NULL,
    "Artist_Id"  int4            NOT NULL,
    CONSTRAINT "PK11" PRIMARY KEY ("AlbumID")
)
;



-- 
-- TABLE: "DIM_ARTIST" 
--

CREATE TABLE "DIM_ARTIST"(
    "Artist_Id"   int4           NOT NULL,
    "ArtistName"  varchar(10),
    CONSTRAINT "PK2" PRIMARY KEY ("Artist_Id")
)
;



-- 
-- TABLE: "DIM_CUSTOMER" 
--

CREATE TABLE "DIM_CUSTOMER"(
    "CustomerID"   int4           NOT NULL,
    "FirstName"    varchar(10)    NOT NULL,
    "LastName"     varchar(10)    NOT NULL,
    "Company"      varchar(10),
    "Phone"        varchar(10),
    "Email"        varchar(10)    NOT NULL,
    "EmployeeID"   int4,
    "GeographyID"  int4           NOT NULL,
    CONSTRAINT "PK9" PRIMARY KEY ("CustomerID")
)
;



-- 
-- TABLE: "DIM_DATE" 
--

CREATE TABLE "DIM_DATE"(
    "FullDate"  date    NOT NULL,
    CONSTRAINT "PK13" PRIMARY KEY ("FullDate")
)
;



-- 
-- TABLE: "DIM_EMPLOYEE" 
--

CREATE TABLE "DIM_EMPLOYEE"(
    "EmployeeID"   int4           NOT NULL,
    "ReportsTo"    int4,
    "FirstName"    varchar(10)    NOT NULL,
    "LastName"     varchar(10)    NOT NULL,
    "Title"        varchar(10),
    "Birthdate"    date,
    "HireDate"     date,
    "Address"      varchar(10),
    "Phone"        varchar(10),
    "Fax"          varchar(10),
    "Email"        varchar(10),
    "GeographyID"  int4           NOT NULL,
    CONSTRAINT "PK10" PRIMARY KEY ("EmployeeID")
)
;



-- 
-- TABLE: "DIM_GENRE" 
--

CREATE TABLE "DIM_GENRE"(
    "GenreID"  int4            NOT NULL,
    "Name"     varchar(100),
    CONSTRAINT "PK4" PRIMARY KEY ("GenreID")
)
;



-- 
-- TABLE: "DIM_GEOGRAPHY" 
--

CREATE TABLE "DIM_GEOGRAPHY"(
    "GeographyID"  int4           NOT NULL,
    "City"         varchar(20),
    "State"        varchar(20),
    "Country"      varchar(20),
    "PostalCode"   varchar(10)    NOT NULL,
    CONSTRAINT "PK12" PRIMARY KEY ("GeographyID")
)
;



-- 
-- TABLE: "DIM_INVOICELINE" 
--

CREATE TABLE "DIM_INVOICELINE"(
    "InvoiceLineID"  int4       NOT NULL,
    "UnitPrice"      numeric    NOT NULL,
    "Quantity"       int4       NOT NULL,
    CONSTRAINT "PK3" PRIMARY KEY ("InvoiceLineID")
)
;



-- 
-- TABLE: "DIM_MEDIATYPE" 
--

CREATE TABLE "DIM_MEDIATYPE"(
    "MediatypeID"  int4            NOT NULL,
    "Name"         varchar(100),
    CONSTRAINT "PK6" PRIMARY KEY ("MediatypeID")
)
;



-- 
-- TABLE: "DIM_PLAYLIST" 
--

CREATE TABLE "DIM_PLAYLIST"(
    "PlaylistID"  int4            NOT NULL,
    "Name"        varchar(100),
    CONSTRAINT "PK7" PRIMARY KEY ("PlaylistID")
)
;



-- 
-- TABLE: "FACT_INVOICE" 
--

CREATE TABLE "FACT_INVOICE"(
    "Invoice_ID"         char(10)           NOT NULL,
    "Invoice_Date"       date,
    "BillingAddress"     varchar(10),
    "BillingCity"        varchar(10),
    "BillingCountry"     varchar(10),
    "BillingPostalCode"  char(10),
    "Total"              numeric(100, 0),
    "CustomerID"         int4               NOT NULL,
    "InvoiceLineID"      int4               NOT NULL,
    "FullDate"           date,
    CONSTRAINT "PK1" PRIMARY KEY ("Invoice_ID")
)
;



-- 
-- TABLE: "FACT_TRACK" 
--

CREATE TABLE "FACT_TRACK"(
    "TrackID"        int4              NOT NULL,
    "Name"           varchar(10)       NOT NULL,
    "Composer"       varchar(100),
    "Millisecond"    int4              NOT NULL,
    "Bytes"          int4,
    "UnitPrice"      numeric(10, 2)    NOT NULL,
    "AlbumID"        int4,
    "MediatypeID"    int4              NOT NULL,
    "GenreID"        int4,
    "InvoiceLineID"  int4              NOT NULL,
    CONSTRAINT "PK5" PRIMARY KEY ("TrackID")
)
;



-- 
-- TABLE: "PLAYLIST_TRACK" 
--

CREATE TABLE "PLAYLIST_TRACK"(
    "PlaylistID"  int4    NOT NULL,
    "TrackID"     int4    NOT NULL,
    CONSTRAINT "PK8" PRIMARY KEY ("PlaylistID", "TrackID")
)
;



-- 
-- TABLE: "DIM_ALBUM" 
--

ALTER TABLE "DIM_ALBUM" ADD CONSTRAINT "RefDIM_ARTIST1" 
    FOREIGN KEY ("Artist_Id")
    REFERENCES "DIM_ARTIST"("Artist_Id")
;


-- 
-- TABLE: "DIM_CUSTOMER" 
--

ALTER TABLE "DIM_CUSTOMER" ADD CONSTRAINT "RefDIM_EMPLOYEE11" 
    FOREIGN KEY ("EmployeeID")
    REFERENCES "DIM_EMPLOYEE"("EmployeeID")
;

ALTER TABLE "DIM_CUSTOMER" ADD CONSTRAINT "RefDIM_GEOGRAPHY15" 
    FOREIGN KEY ("GeographyID")
    REFERENCES "DIM_GEOGRAPHY"("GeographyID")
;


-- 
-- TABLE: "DIM_EMPLOYEE" 
--

ALTER TABLE "DIM_EMPLOYEE" ADD CONSTRAINT "RefDIM_EMPLOYEE10" 
    FOREIGN KEY ("ReportsTo")
    REFERENCES "DIM_EMPLOYEE"("EmployeeID")
;

ALTER TABLE "DIM_EMPLOYEE" ADD CONSTRAINT "RefDIM_GEOGRAPHY14" 
    FOREIGN KEY ("GeographyID")
    REFERENCES "DIM_GEOGRAPHY"("GeographyID")
;


-- 
-- TABLE: "FACT_INVOICE" 
--

ALTER TABLE "FACT_INVOICE" ADD CONSTRAINT "RefDIM_CUSTOMER9" 
    FOREIGN KEY ("CustomerID")
    REFERENCES "DIM_CUSTOMER"("CustomerID")
;

ALTER TABLE "FACT_INVOICE" ADD CONSTRAINT "RefDIM_INVOICELINE13" 
    FOREIGN KEY ("InvoiceLineID")
    REFERENCES "DIM_INVOICELINE"("InvoiceLineID")
;

ALTER TABLE "FACT_INVOICE" ADD CONSTRAINT "RefDIM_DATE16" 
    FOREIGN KEY ("FullDate")
    REFERENCES "DIM_DATE"("FullDate")
;


-- 
-- TABLE: "FACT_TRACK" 
--

ALTER TABLE "FACT_TRACK" ADD CONSTRAINT "RefDIM_ALBUM4" 
    FOREIGN KEY ("AlbumID")
    REFERENCES "DIM_ALBUM"("AlbumID")
;

ALTER TABLE "FACT_TRACK" ADD CONSTRAINT "RefDIM_MEDIATYPE5" 
    FOREIGN KEY ("MediatypeID")
    REFERENCES "DIM_MEDIATYPE"("MediatypeID")
;

ALTER TABLE "FACT_TRACK" ADD CONSTRAINT "RefDIM_GENRE6" 
    FOREIGN KEY ("GenreID")
    REFERENCES "DIM_GENRE"("GenreID")
;

ALTER TABLE "FACT_TRACK" ADD CONSTRAINT "RefDIM_INVOICELINE12" 
    FOREIGN KEY ("InvoiceLineID")
    REFERENCES "DIM_INVOICELINE"("InvoiceLineID")
;


-- 
-- TABLE: "PLAYLIST_TRACK" 
--

ALTER TABLE "PLAYLIST_TRACK" ADD CONSTRAINT "RefDIM_PLAYLIST7" 
    FOREIGN KEY ("PlaylistID")
    REFERENCES "DIM_PLAYLIST"("PlaylistID")
;

ALTER TABLE "PLAYLIST_TRACK" ADD CONSTRAINT "RefFACT_TRACK8" 
    FOREIGN KEY ("TrackID")
    REFERENCES "FACT_TRACK"("TrackID")
;


