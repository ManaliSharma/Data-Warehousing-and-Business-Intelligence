--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Chinook_1.DM1
--
-- Date Created : Monday, February 11, 2019 14:28:48
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: DIM_ALBUM 
--

CREATE TABLE DIM_ALBUM(
    AlbumID      NUMBER(38, 0)     NOT NULL,
    Title        NVARCHAR2(100)    NOT NULL,
    Artist_Id    NUMBER(38, 0)     NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (AlbumID)
)
;



-- 
-- TABLE: DIM_ARTIST 
--

CREATE TABLE DIM_ARTIST(
    Artist_Id     NUMBER(38, 0)    NOT NULL,
    ArtistName    NVARCHAR2(10),
    CONSTRAINT PK2 PRIMARY KEY (Artist_Id)
)
;



-- 
-- TABLE: DIM_CUSTOMER 
--

CREATE TABLE DIM_CUSTOMER(
    CustomerID     NUMBER(38, 0)    NOT NULL,
    FirstName      NVARCHAR2(10)    NOT NULL,
    LastName       NVARCHAR2(10)    NOT NULL,
    Company        NVARCHAR2(10),
    Phone          NVARCHAR2(10),
    Email          NVARCHAR2(10)    NOT NULL,
    EmployeeID     NUMBER(38, 0),
    GeographyID    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (CustomerID)
)
;



-- 
-- TABLE: DIM_DATE 
--

CREATE TABLE DIM_DATE(
    FullDate    DATE    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (FullDate)
)
;



-- 
-- TABLE: DIM_EMPLOYEE 
--

CREATE TABLE DIM_EMPLOYEE(
    EmployeeID     NUMBER(38, 0)    NOT NULL,
    ReportsTo      NUMBER(38, 0),
    FirstName      NVARCHAR2(10)    NOT NULL,
    LastName       NVARCHAR2(10)    NOT NULL,
    Title          NVARCHAR2(10),
    Birthdate      DATE,
    HireDate       DATE,
    Address        NVARCHAR2(10),
    Phone          NVARCHAR2(10),
    Fax            NVARCHAR2(10),
    Email          NVARCHAR2(10),
    GeographyID    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (EmployeeID)
)
;



-- 
-- TABLE: DIM_GENRE 
--

CREATE TABLE DIM_GENRE(
    GenreID    NUMBER(38, 0)     NOT NULL,
    Name       NVARCHAR2(100),
    CONSTRAINT PK4 PRIMARY KEY (GenreID)
)
;



-- 
-- TABLE: DIM_GEOGRAPHY 
--

CREATE TABLE DIM_GEOGRAPHY(
    GeographyID    NUMBER(38, 0)    NOT NULL,
    City           NVARCHAR2(20),
    State          NVARCHAR2(20),
    Country        NVARCHAR2(20),
    PostalCode     NVARCHAR2(10)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (GeographyID)
)
;



-- 
-- TABLE: DIM_INVOICELINE 
--

CREATE TABLE DIM_INVOICELINE(
    InvoiceLineID    NUMBER(38, 0)    NOT NULL,
    UnitPrice        NUMBER           NOT NULL,
    Quantity         NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (InvoiceLineID)
)
;



-- 
-- TABLE: DIM_MEDIATYPE 
--

CREATE TABLE DIM_MEDIATYPE(
    MediatypeID    NUMBER(38, 0)     NOT NULL,
    Name           NVARCHAR2(100),
    CONSTRAINT PK6 PRIMARY KEY (MediatypeID)
)
;



-- 
-- TABLE: DIM_PLAYLIST 
--

CREATE TABLE DIM_PLAYLIST(
    PlaylistID    NUMBER(38, 0)     NOT NULL,
    Name          NVARCHAR2(100),
    CONSTRAINT PK7 PRIMARY KEY (PlaylistID)
)
;



-- 
-- TABLE: FACT_INVOICE 
--

CREATE TABLE FACT_INVOICE(
    Invoice_ID           CHAR(10)          NOT NULL,
    Invoice_Date         DATE,
    BillingAddress       NVARCHAR2(10),
    BillingCity          NVARCHAR2(10),
    BillingCountry       NVARCHAR2(10),
    BillingPostalCode    CHAR(10),
    Total                NUMBER(100, 0),
    CustomerID           NUMBER(38, 0)     NOT NULL,
    InvoiceLineID        NUMBER(38, 0)     NOT NULL,
    FullDate             DATE,
    CONSTRAINT PK1 PRIMARY KEY (Invoice_ID)
)
;



-- 
-- TABLE: FACT_TRACK 
--

CREATE TABLE FACT_TRACK(
    TrackID          NUMBER(38, 0)     NOT NULL,
    Name             NVARCHAR2(10)     NOT NULL,
    Composer         NVARCHAR2(100),
    Millisecond      NUMBER(38, 0)     NOT NULL,
    Bytes            NUMBER(38, 0),
    UnitPrice        NUMBER(10, 2)     NOT NULL,
    AlbumID          NUMBER(38, 0),
    MediatypeID      NUMBER(38, 0)     NOT NULL,
    GenreID          NUMBER(38, 0),
    InvoiceLineID    NUMBER(38, 0)     NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (TrackID)
)
;



-- 
-- TABLE: PLAYLIST_TRACK 
--

CREATE TABLE PLAYLIST_TRACK(
    PlaylistID    NUMBER(38, 0)    NOT NULL,
    TrackID       NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (PlaylistID, TrackID)
)
;



-- 
-- TABLE: DIM_ALBUM 
--

ALTER TABLE DIM_ALBUM ADD CONSTRAINT RefDIM_ARTIST1 
    FOREIGN KEY (Artist_Id)
    REFERENCES DIM_ARTIST(Artist_Id)
;


-- 
-- TABLE: DIM_CUSTOMER 
--

ALTER TABLE DIM_CUSTOMER ADD CONSTRAINT RefDIM_EMPLOYEE11 
    FOREIGN KEY (EmployeeID)
    REFERENCES DIM_EMPLOYEE(EmployeeID)
;

ALTER TABLE DIM_CUSTOMER ADD CONSTRAINT RefDIM_GEOGRAPHY15 
    FOREIGN KEY (GeographyID)
    REFERENCES DIM_GEOGRAPHY(GeographyID)
;


-- 
-- TABLE: DIM_EMPLOYEE 
--

ALTER TABLE DIM_EMPLOYEE ADD CONSTRAINT RefDIM_EMPLOYEE10 
    FOREIGN KEY (ReportsTo)
    REFERENCES DIM_EMPLOYEE(EmployeeID)
;

ALTER TABLE DIM_EMPLOYEE ADD CONSTRAINT RefDIM_GEOGRAPHY14 
    FOREIGN KEY (GeographyID)
    REFERENCES DIM_GEOGRAPHY(GeographyID)
;


-- 
-- TABLE: FACT_INVOICE 
--

ALTER TABLE FACT_INVOICE ADD CONSTRAINT RefDIM_CUSTOMER9 
    FOREIGN KEY (CustomerID)
    REFERENCES DIM_CUSTOMER(CustomerID)
;

ALTER TABLE FACT_INVOICE ADD CONSTRAINT RefDIM_INVOICELINE13 
    FOREIGN KEY (InvoiceLineID)
    REFERENCES DIM_INVOICELINE(InvoiceLineID)
;

ALTER TABLE FACT_INVOICE ADD CONSTRAINT RefDIM_DATE16 
    FOREIGN KEY (FullDate)
    REFERENCES DIM_DATE(FullDate)
;


-- 
-- TABLE: FACT_TRACK 
--

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_ALBUM4 
    FOREIGN KEY (AlbumID)
    REFERENCES DIM_ALBUM(AlbumID)
;

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_MEDIATYPE5 
    FOREIGN KEY (MediatypeID)
    REFERENCES DIM_MEDIATYPE(MediatypeID)
;

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_GENRE6 
    FOREIGN KEY (GenreID)
    REFERENCES DIM_GENRE(GenreID)
;

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_INVOICELINE12 
    FOREIGN KEY (InvoiceLineID)
    REFERENCES DIM_INVOICELINE(InvoiceLineID)
;


-- 
-- TABLE: PLAYLIST_TRACK 
--

ALTER TABLE PLAYLIST_TRACK ADD CONSTRAINT RefDIM_PLAYLIST7 
    FOREIGN KEY (PlaylistID)
    REFERENCES DIM_PLAYLIST(PlaylistID)
;

ALTER TABLE PLAYLIST_TRACK ADD CONSTRAINT RefFACT_TRACK8 
    FOREIGN KEY (TrackID)
    REFERENCES FACT_TRACK(TrackID)
;


