--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Chinook_1.DM1
--
-- Date Created : Monday, February 11, 2019 14:27:52
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: DIM_ALBUM 
--

CREATE TABLE DIM_ALBUM(
    AlbumID      INT                      NOT NULL,
    Title        NATIONAL VARCHAR(100)    NOT NULL,
    Artist_Id    INT                      NOT NULL,
    PRIMARY KEY (AlbumID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_ARTIST 
--

CREATE TABLE DIM_ARTIST(
    Artist_Id     INT                     NOT NULL,
    ArtistName    NATIONAL VARCHAR(10),
    PRIMARY KEY (Artist_Id)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_CUSTOMER 
--

CREATE TABLE DIM_CUSTOMER(
    CustomerID     INT                     NOT NULL,
    FirstName      NATIONAL VARCHAR(10)    NOT NULL,
    LastName       NATIONAL VARCHAR(10)    NOT NULL,
    Company        NATIONAL VARCHAR(10),
    Phone          NATIONAL VARCHAR(10),
    Email          NATIONAL VARCHAR(10)    NOT NULL,
    EmployeeID     INT,
    GeographyID    INT                     NOT NULL,
    PRIMARY KEY (CustomerID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_DATE 
--

CREATE TABLE DIM_DATE(
    FullDate    DATE    NOT NULL,
    PRIMARY KEY (FullDate)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_EMPLOYEE 
--

CREATE TABLE DIM_EMPLOYEE(
    EmployeeID     INT                     NOT NULL,
    ReportsTo      INT,
    FirstName      NATIONAL VARCHAR(10)    NOT NULL,
    LastName       NATIONAL VARCHAR(10)    NOT NULL,
    Title          NATIONAL VARCHAR(10),
    Birthdate      DATE,
    HireDate       DATE,
    Address        NATIONAL VARCHAR(10),
    Phone          NATIONAL VARCHAR(10),
    Fax            NATIONAL VARCHAR(10),
    Email          NATIONAL VARCHAR(10),
    GeographyID    INT                     NOT NULL,
    PRIMARY KEY (EmployeeID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_GENRE 
--

CREATE TABLE DIM_GENRE(
    GenreID    INT                      NOT NULL,
    Name       NATIONAL VARCHAR(100),
    PRIMARY KEY (GenreID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_GEOGRAPHY 
--

CREATE TABLE DIM_GEOGRAPHY(
    GeographyID    INT                     NOT NULL,
    City           NATIONAL VARCHAR(20),
    State          NATIONAL VARCHAR(20),
    Country        NATIONAL VARCHAR(20),
    PostalCode     NATIONAL VARCHAR(10)    NOT NULL,
    PRIMARY KEY (GeographyID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_INVOICELINE 
--

CREATE TABLE DIM_INVOICELINE(
    InvoiceLineID    INT              NOT NULL,
    UnitPrice        DECIMAL(0, 0)    NOT NULL,
    Quantity         INT              NOT NULL,
    PRIMARY KEY (InvoiceLineID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_MEDIATYPE 
--

CREATE TABLE DIM_MEDIATYPE(
    MediatypeID    INT                      NOT NULL,
    Name           NATIONAL VARCHAR(100),
    PRIMARY KEY (MediatypeID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_PLAYLIST 
--

CREATE TABLE DIM_PLAYLIST(
    PlaylistID    INT                      NOT NULL,
    Name          NATIONAL VARCHAR(100),
    PRIMARY KEY (PlaylistID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FACT_INVOICE 
--

CREATE TABLE FACT_INVOICE(
    Invoice_ID           CHAR(10)                NOT NULL,
    Invoice_Date         DATE,
    BillingAddress       NATIONAL VARCHAR(10),
    BillingCity          NATIONAL VARCHAR(10),
    BillingCountry       NATIONAL VARCHAR(10),
    BillingPostalCode    CHAR(10),
    Total                DECIMAL(100, 0),
    CustomerID           INT                     NOT NULL,
    InvoiceLineID        INT                     NOT NULL,
    FullDate             DATE,
    PRIMARY KEY (Invoice_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FACT_TRACK 
--

CREATE TABLE FACT_TRACK(
    TrackID          INT                      NOT NULL,
    Name             NATIONAL VARCHAR(10)     NOT NULL,
    Composer         NATIONAL VARCHAR(100),
    Millisecond      INT                      NOT NULL,
    Bytes            INT,
    UnitPrice        DECIMAL(10, 2)           NOT NULL,
    AlbumID          INT,
    MediatypeID      INT                      NOT NULL,
    GenreID          INT,
    InvoiceLineID    INT                      NOT NULL,
    PRIMARY KEY (TrackID)
)ENGINE=MYISAM
;



-- 
-- TABLE: PLAYLIST_TRACK 
--

CREATE TABLE PLAYLIST_TRACK(
    PlaylistID    INT    NOT NULL,
    TrackID       INT    NOT NULL,
    PRIMARY KEY (PlaylistID, TrackID)
)ENGINE=MYISAM
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


