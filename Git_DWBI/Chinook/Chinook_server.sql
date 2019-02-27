/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Chinook_1.DM1
 *
 * Date Created : Monday, February 11, 2019 14:29:50
 * Target DBMS : Microsoft SQL Server 2017
 */

/* 
 * TABLE: DIM_ALBUM 
 */

CREATE TABLE DIM_ALBUM(
    AlbumID      int              NOT NULL,
    Title        nvarchar(100)    NOT NULL,
    Artist_Id    int              NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (AlbumID)
)
go



IF OBJECT_ID('DIM_ALBUM') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_ALBUM >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_ALBUM >>>'
go

/* 
 * TABLE: DIM_ARTIST 
 */

CREATE TABLE DIM_ARTIST(
    Artist_Id     int             NOT NULL,
    ArtistName    nvarchar(10)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (Artist_Id)
)
go



IF OBJECT_ID('DIM_ARTIST') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_ARTIST >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_ARTIST >>>'
go

/* 
 * TABLE: DIM_CUSTOMER 
 */

CREATE TABLE DIM_CUSTOMER(
    CustomerID     int             NOT NULL,
    FirstName      nvarchar(10)    NOT NULL,
    LastName       nvarchar(10)    NOT NULL,
    Company        nvarchar(10)    NULL,
    Phone          nvarchar(10)    NULL,
    Email          nvarchar(10)    NOT NULL,
    EmployeeID     int             NULL,
    GeographyID    int             NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (CustomerID)
)
go



IF OBJECT_ID('DIM_CUSTOMER') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_CUSTOMER >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_CUSTOMER >>>'
go

/* 
 * TABLE: DIM_DATE 
 */

CREATE TABLE DIM_DATE(
    FullDate    date    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (FullDate)
)
go



IF OBJECT_ID('DIM_DATE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_DATE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_DATE >>>'
go

/* 
 * TABLE: DIM_EMPLOYEE 
 */

CREATE TABLE DIM_EMPLOYEE(
    EmployeeID     int             NOT NULL,
    ReportsTo      int             NULL,
    FirstName      nvarchar(10)    NOT NULL,
    LastName       nvarchar(10)    NOT NULL,
    Title          nvarchar(10)    NULL,
    Birthdate      date            NULL,
    HireDate       date            NULL,
    Address        nvarchar(10)    NULL,
    Phone          nvarchar(10)    NULL,
    Fax            nvarchar(10)    NULL,
    Email          nvarchar(10)    NULL,
    GeographyID    int             NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (EmployeeID)
)
go



IF OBJECT_ID('DIM_EMPLOYEE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_EMPLOYEE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_EMPLOYEE >>>'
go

/* 
 * TABLE: DIM_GENRE 
 */

CREATE TABLE DIM_GENRE(
    GenreID    int              NOT NULL,
    Name       nvarchar(100)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (GenreID)
)
go



IF OBJECT_ID('DIM_GENRE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_GENRE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_GENRE >>>'
go

/* 
 * TABLE: DIM_GEOGRAPHY 
 */

CREATE TABLE DIM_GEOGRAPHY(
    GeographyID    int             NOT NULL,
    City           nvarchar(20)    NULL,
    State          nvarchar(20)    NULL,
    Country        nvarchar(20)    NULL,
    PostalCode     nvarchar(10)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (GeographyID)
)
go



IF OBJECT_ID('DIM_GEOGRAPHY') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_GEOGRAPHY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_GEOGRAPHY >>>'
go

/* 
 * TABLE: DIM_INVOICELINE 
 */

CREATE TABLE DIM_INVOICELINE(
    InvoiceLineID    int        NOT NULL,
    UnitPrice        numeric    NOT NULL,
    Quantity         int        NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (InvoiceLineID)
)
go



IF OBJECT_ID('DIM_INVOICELINE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_INVOICELINE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_INVOICELINE >>>'
go

/* 
 * TABLE: DIM_MEDIATYPE 
 */

CREATE TABLE DIM_MEDIATYPE(
    MediatypeID    int              NOT NULL,
    Name           nvarchar(100)    NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (MediatypeID)
)
go



IF OBJECT_ID('DIM_MEDIATYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_MEDIATYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_MEDIATYPE >>>'
go

/* 
 * TABLE: DIM_PLAYLIST 
 */

CREATE TABLE DIM_PLAYLIST(
    PlaylistID    int              NOT NULL,
    Name          nvarchar(100)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (PlaylistID)
)
go



IF OBJECT_ID('DIM_PLAYLIST') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_PLAYLIST >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_PLAYLIST >>>'
go

/* 
 * TABLE: FACT_INVOICE 
 */

CREATE TABLE FACT_INVOICE(
    Invoice_ID           char(10)           NOT NULL,
    Invoice_Date         date               NULL,
    BillingAddress       nvarchar(10)       NULL,
    BillingCity          nvarchar(10)       NULL,
    BillingCountry       nvarchar(10)       NULL,
    BillingPostalCode    char(10)           NULL,
    Total                numeric(100, 0)    NULL,
    CustomerID           int                NOT NULL,
    InvoiceLineID        int                NOT NULL,
    FullDate             date               NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Invoice_ID)
)
go



IF OBJECT_ID('FACT_INVOICE') IS NOT NULL
    PRINT '<<< CREATED TABLE FACT_INVOICE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FACT_INVOICE >>>'
go

/* 
 * TABLE: FACT_TRACK 
 */

CREATE TABLE FACT_TRACK(
    TrackID          int               NOT NULL,
    Name             nvarchar(10)      NOT NULL,
    Composer         nvarchar(100)     NULL,
    Millisecond      int               NOT NULL,
    Bytes            int               NULL,
    UnitPrice        numeric(10, 2)    NOT NULL,
    AlbumID          int               NULL,
    MediatypeID      int               NOT NULL,
    GenreID          int               NULL,
    InvoiceLineID    int               NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (TrackID)
)
go



IF OBJECT_ID('FACT_TRACK') IS NOT NULL
    PRINT '<<< CREATED TABLE FACT_TRACK >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FACT_TRACK >>>'
go

/* 
 * TABLE: PLAYLIST_TRACK 
 */

CREATE TABLE PLAYLIST_TRACK(
    PlaylistID    int    NOT NULL,
    TrackID       int    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (PlaylistID, TrackID)
)
go



IF OBJECT_ID('PLAYLIST_TRACK') IS NOT NULL
    PRINT '<<< CREATED TABLE PLAYLIST_TRACK >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PLAYLIST_TRACK >>>'
go

/* 
 * TABLE: DIM_ALBUM 
 */

ALTER TABLE DIM_ALBUM ADD CONSTRAINT RefDIM_ARTIST1 
    FOREIGN KEY (Artist_Id)
    REFERENCES DIM_ARTIST(Artist_Id)
go


/* 
 * TABLE: DIM_CUSTOMER 
 */

ALTER TABLE DIM_CUSTOMER ADD CONSTRAINT RefDIM_EMPLOYEE11 
    FOREIGN KEY (EmployeeID)
    REFERENCES DIM_EMPLOYEE(EmployeeID)
go

ALTER TABLE DIM_CUSTOMER ADD CONSTRAINT RefDIM_GEOGRAPHY15 
    FOREIGN KEY (GeographyID)
    REFERENCES DIM_GEOGRAPHY(GeographyID)
go


/* 
 * TABLE: DIM_EMPLOYEE 
 */

ALTER TABLE DIM_EMPLOYEE ADD CONSTRAINT RefDIM_EMPLOYEE10 
    FOREIGN KEY (ReportsTo)
    REFERENCES DIM_EMPLOYEE(EmployeeID)
go

ALTER TABLE DIM_EMPLOYEE ADD CONSTRAINT RefDIM_GEOGRAPHY14 
    FOREIGN KEY (GeographyID)
    REFERENCES DIM_GEOGRAPHY(GeographyID)
go


/* 
 * TABLE: FACT_INVOICE 
 */

ALTER TABLE FACT_INVOICE ADD CONSTRAINT RefDIM_CUSTOMER9 
    FOREIGN KEY (CustomerID)
    REFERENCES DIM_CUSTOMER(CustomerID)
go

ALTER TABLE FACT_INVOICE ADD CONSTRAINT RefDIM_INVOICELINE13 
    FOREIGN KEY (InvoiceLineID)
    REFERENCES DIM_INVOICELINE(InvoiceLineID)
go

ALTER TABLE FACT_INVOICE ADD CONSTRAINT RefDIM_DATE16 
    FOREIGN KEY (FullDate)
    REFERENCES DIM_DATE(FullDate)
go


/* 
 * TABLE: FACT_TRACK 
 */

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_ALBUM4 
    FOREIGN KEY (AlbumID)
    REFERENCES DIM_ALBUM(AlbumID)
go

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_MEDIATYPE5 
    FOREIGN KEY (MediatypeID)
    REFERENCES DIM_MEDIATYPE(MediatypeID)
go

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_GENRE6 
    FOREIGN KEY (GenreID)
    REFERENCES DIM_GENRE(GenreID)
go

ALTER TABLE FACT_TRACK ADD CONSTRAINT RefDIM_INVOICELINE12 
    FOREIGN KEY (InvoiceLineID)
    REFERENCES DIM_INVOICELINE(InvoiceLineID)
go


/* 
 * TABLE: PLAYLIST_TRACK 
 */

ALTER TABLE PLAYLIST_TRACK ADD CONSTRAINT RefDIM_PLAYLIST7 
    FOREIGN KEY (PlaylistID)
    REFERENCES DIM_PLAYLIST(PlaylistID)
go

ALTER TABLE PLAYLIST_TRACK ADD CONSTRAINT RefFACT_TRACK8 
    FOREIGN KEY (TrackID)
    REFERENCES FACT_TRACK(TrackID)
go


