/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      AdventureWorks-PurchaseDW.DM1
 *
 * Date Created : Wednesday, February 13, 2019 14:38:57
 * Target DBMS : Microsoft SQL Server 2017
 */

/* 
 * TABLE: [Dim.Date] 
 */

CREATE TABLE [Dim.Date](
    ModifiedDate    date    NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (ModifiedDate)
)
go



IF OBJECT_ID('Dim.Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.Date >>>'
go

/* 
 * TABLE: [Dim.Employee] 
 */

CREATE TABLE [Dim.Employee](
    EmployeeID             int                 NOT NULL,
    NationalIDNumber       nvarchar(15)        NOT NULL,
    LoginID                nvarchar(256)       NOT NULL,
    OrganizationNode       hierarchyid         NULL,
    OrganizationalLevel    smallint            NULL,
    JobTitle               nvarchar(15)        NOT NULL,
    Birthdate              date                NOT NULL,
    Marital_Status         nchar(1)            NOT NULL,
    Gender                 nchar(1)            NOT NULL,
    HireDate               date                NOT NULL,
    SalariedFlag           nchar(1)            NOT NULL,
    VacationHours          smallint            NOT NULL,
    SickLeaveHours         smallint            NOT NULL,
    CurrentFlag            nchar(1)            NOT NULL,
    ModifiedDate           date                NOT NULL,
    RowGuid                uniqueidentifier    NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (EmployeeID)
)
go



IF OBJECT_ID('Dim.Employee') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.Employee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.Employee >>>'
go

/* 
 * TABLE: [Dim.EmployeePayHistory] 
 */

CREATE TABLE [Dim.EmployeePayHistory](
    PayHistoryID      int         NOT NULL,
    RateChangeDate    datetime    NOT NULL,
    Rate              money       NOT NULL,
    PayFrequency      tinyint     NOT NULL,
    ModifiedDate      date        NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (PayHistoryID)
)
go



IF OBJECT_ID('Dim.EmployeePayHistory') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.EmployeePayHistory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.EmployeePayHistory >>>'
go

/* 
 * TABLE: [Dim.Geography] 
 */

CREATE TABLE [Dim.Geography](
    City                  nvarchar(100)     NULL,
    StateProvinceCode     numeric(10, 0)    NOT NULL,
    StateProvinceName     nvarchar(10)      NOT NULL,
    CountryRegionCode     char(100)         NOT NULL,
    PostalCode            nvarchar(10)      NOT NULL,
    TerritoryID           int               NOT NULL,
    ProductInventoryID    int               NOT NULL
)
go



IF OBJECT_ID('Dim.Geography') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.Geography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.Geography >>>'
go

/* 
 * TABLE: [Dim.ProductCategory] 
 */

CREATE TABLE [Dim.ProductCategory](
    ProductCategoryID    int                 NOT NULL,
    Name                 nvarchar(100)       NOT NULL,
    RowGuid              uniqueidentifier    NOT NULL,
    ModifiedDate         date                NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (ProductCategoryID)
)
go



IF OBJECT_ID('Dim.ProductCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ProductCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ProductCategory >>>'
go

/* 
 * TABLE: [Dim.ProductCost] 
 */

CREATE TABLE [Dim.ProductCost](
    StartDate       datetime    NULL,
    EndDate         datetime    NULL,
    CostPrice       money       NOT NULL,
    ModifiedDate    date        NOT NULL
)
go



IF OBJECT_ID('Dim.ProductCost') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ProductCost >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ProductCost >>>'
go

/* 
 * TABLE: [Dim.ProductInventory] 
 */

CREATE TABLE [Dim.ProductInventory](
    ProductInventoryID    int                 NOT NULL,
    Shelf                 nvarchar(10)        NOT NULL,
    Bin                   tinyint             NOT NULL,
    Quantity              smallint            NOT NULL,
    RowGuid               uniqueidentifier    NOT NULL,
    ModifiedDate          date                NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (ProductInventoryID)
)
go



IF OBJECT_ID('Dim.ProductInventory') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ProductInventory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ProductInventory >>>'
go

/* 
 * TABLE: [Dim.ProductListPrice] 
 */

CREATE TABLE [Dim.ProductListPrice](
    StartDate       datetime    NOT NULL,
    EndDate         datetime    NULL,
    ListPrice       money       NOT NULL,
    ModifiedDate    date        NOT NULL
)
go



IF OBJECT_ID('Dim.ProductListPrice') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ProductListPrice >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ProductListPrice >>>'
go

/* 
 * TABLE: [Dim.ProductModel] 
 */

CREATE TABLE [Dim.ProductModel](
    ProductModelID        int                 NOT NULL,
    Name                  nvarchar(100)       NOT NULL,
    CatalogDescription    xml                 NULL,
    Instructions          xml                 NULL,
    RowGuid               uniqueidentifier    NOT NULL,
    ModifiedDate          date                NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (ProductModelID)
)
go



IF OBJECT_ID('Dim.ProductModel') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ProductModel >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ProductModel >>>'
go

/* 
 * TABLE: [Dim.ProductSubCategory] 
 */

CREATE TABLE [Dim.ProductSubCategory](
    ProductSubCategoryID    int                 NOT NULL,
    Name                    nvarchar(100)       NOT NULL,
    RowGuid                 uniqueidentifier    NOT NULL,
    ModifiedDate            date                NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (ProductSubCategoryID)
)
go



IF OBJECT_ID('Dim.ProductSubCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ProductSubCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ProductSubCategory >>>'
go

/* 
 * TABLE: [Dim.ProductVendor] 
 */

CREATE TABLE [Dim.ProductVendor](
    VendorID           int         NOT NULL,
    ProductID          int         NOT NULL,
    AverageLeadTime    int         NOT NULL,
    StandardPrice      money       NOT NULL,
    LastReceiptCost    money       NULL,
    LastReceiptDate    datetime    NULL,
    MinOrderQty        int         NOT NULL,
    MaxOrderQty        int         NOT NULL,
    OnOrderQty         int         NULL,
    UnitMeasureCode    nchar(3)    NOT NULL,
    ModifiedDate       date        NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (VendorID, ProductID)
)
go



IF OBJECT_ID('Dim.ProductVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ProductVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ProductVendor >>>'
go

/* 
 * TABLE: [Dim.SalesTerritory] 
 */

CREATE TABLE [Dim.SalesTerritory](
    TerritoryID      int              NOT NULL,
    Name             nvarchar(100)    NOT NULL,
    SalesYTD         money            NOT NULL,
    SalesLastYear    money            NOT NULL,
    CostYTD          money            NOT NULL,
    CostLastYear     money            NOT NULL,
    ModifiedDate     date             NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (TerritoryID)
)
go



IF OBJECT_ID('Dim.SalesTerritory') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.SalesTerritory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.SalesTerritory >>>'
go

/* 
 * TABLE: [Dim.ShipMethod] 
 */

CREATE TABLE [Dim.ShipMethod](
    ShipMethodID    int                 NOT NULL,
    Name            nvarchar(25)        NOT NULL,
    ShipBase        money               NOT NULL,
    ShipRate        money               NOT NULL,
    RowGuid         uniqueidentifier    NOT NULL,
    ModifiedDate    date                NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ShipMethodID)
)
go



IF OBJECT_ID('Dim.ShipMethod') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.ShipMethod >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.ShipMethod >>>'
go

/* 
 * TABLE: [Dim.Vendor] 
 */

CREATE TABLE [Dim.Vendor](
    VendorID                   int               NOT NULL,
    AccountNumber              numeric(40, 0)    NOT NULL,
    Name                       varchar(50)       NOT NULL,
    CreditRange                tinyint           NOT NULL,
    PreferredVendorStatus      nvarchar(11)      NOT NULL,
    ActiveFlag                 nvarchar(1)       NOT NULL,
    PurchasingWebServiceURL    nvarchar(1024)    NULL,
    ModifiedDate               date              NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (VendorID)
)
go



IF OBJECT_ID('Dim.Vendor') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim.Vendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim.Vendor >>>'
go

/* 
 * TABLE: [Fact.Product] 
 */

CREATE TABLE [Fact.Product](
    ProductID               int                 NOT NULL,
    Name                    nvarchar(25)        NOT NULL,
    ProductNumber           nvarchar(25)        NOT NULL,
    MakeFlag                nvarchar(1)         NOT NULL,
    FinishedGoodsFlag       nvarchar(1)         NOT NULL,
    Color                   nvarchar(15)        NULL,
    SafetyStockLevel        smallint            NOT NULL,
    ReorderPoint            smallint            NOT NULL,
    Size                    nvarchar(5)         NULL,
    Weight                  nchar(3)            NULL,
    DaysToManufacture       int                 NOT NULL,
    ProductLine             nchar(2)            NULL,
    Class                   nchar(2)            NULL,
    Style                   nchar(2)            NULL,
    SellStartDate           datetime            NOT NULL,
    SellEndDate             datetime            NULL,
    DiscontinuedDate        datetime            NULL,
    rowguid                 uniqueidentifier    NOT NULL,
    ModifiedDate            date                NOT NULL,
    ProductInventoryID      int                 NOT NULL,
    ProductModelID          int                 NOT NULL,
    ProductSubCategoryID    int                 NOT NULL,
    ProductCategoryID       int                 NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (ProductID)
)
go



IF OBJECT_ID('Fact.Product') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact.Product >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact.Product >>>'
go

/* 
 * TABLE: [Fact.Purchase] 
 */

CREATE TABLE [Fact.Purchase](
    PurchaseOrderID    int              NOT NULL,
    [Revision Number]  tinyint          NOT NULL,
    Status             tinyint          NOT NULL,
    OrderDate          datetime         NOT NULL,
    ShipDate           datetime         NULL,
    TaxAmount          money            NOT NULL,
    SubAmount          money            NOT NULL,
    Freight            money            NOT NULL,
    TotalDue           money            NOT NULL,
    ModifiedDate       date             NOT NULL,
    DueDate            datetime         NOT NULL,
    OrderQty           smallint         NOT NULL,
    UnitPrice          money            NOT NULL,
    LIneTotal          money            NOT NULL,
    ReceivedQty        decimal(8, 2)    NOT NULL,
    RejectedQty        decimal(8, 2)    NOT NULL,
    StockedQty         decimal(9, 2)    NULL,
    EmployeeID         int              NOT NULL,
    PayHistoryID       int              NOT NULL,
    VendorID           int              NOT NULL,
    ShipMethodID       int              NOT NULL,
    TerritoryID        int              NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (PurchaseOrderID)
)
go



IF OBJECT_ID('Fact.Purchase') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact.Purchase >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact.Purchase >>>'
go

/* 
 * TABLE: [Dim.Employee] 
 */

ALTER TABLE [Dim.Employee] ADD CONSTRAINT [RefDim.Date18] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.EmployeePayHistory] 
 */

ALTER TABLE [Dim.EmployeePayHistory] ADD CONSTRAINT [RefDim.Date19] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.Geography] 
 */

ALTER TABLE [Dim.Geography] ADD CONSTRAINT [RefDim.SalesTerritory30] 
    FOREIGN KEY (TerritoryID)
    REFERENCES [Dim.SalesTerritory](TerritoryID)
go

ALTER TABLE [Dim.Geography] ADD CONSTRAINT [RefDim.ProductInventory31] 
    FOREIGN KEY (ProductInventoryID)
    REFERENCES [Dim.ProductInventory](ProductInventoryID)
go


/* 
 * TABLE: [Dim.ProductCategory] 
 */

ALTER TABLE [Dim.ProductCategory] ADD CONSTRAINT [RefDim.Date23] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.ProductCost] 
 */

ALTER TABLE [Dim.ProductCost] ADD CONSTRAINT [RefDim.Date25] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.ProductInventory] 
 */

ALTER TABLE [Dim.ProductInventory] ADD CONSTRAINT [RefDim.Date21] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.ProductListPrice] 
 */

ALTER TABLE [Dim.ProductListPrice] ADD CONSTRAINT [RefDim.Date27] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.ProductModel] 
 */

ALTER TABLE [Dim.ProductModel] ADD CONSTRAINT [RefDim.Date22] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.ProductSubCategory] 
 */

ALTER TABLE [Dim.ProductSubCategory] ADD CONSTRAINT [RefDim.Date24] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.ProductVendor] 
 */

ALTER TABLE [Dim.ProductVendor] ADD CONSTRAINT [RefDim.Vendor13] 
    FOREIGN KEY (VendorID)
    REFERENCES [Dim.Vendor](VendorID)
go

ALTER TABLE [Dim.ProductVendor] ADD CONSTRAINT [RefFact.Product15] 
    FOREIGN KEY (ProductID)
    REFERENCES [Fact.Product](ProductID)
go

ALTER TABLE [Dim.ProductVendor] ADD CONSTRAINT [RefDim.Date28] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.SalesTerritory] 
 */

ALTER TABLE [Dim.SalesTerritory] ADD CONSTRAINT [RefDim.Date17] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.ShipMethod] 
 */

ALTER TABLE [Dim.ShipMethod] ADD CONSTRAINT [RefDim.Date20] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Dim.Vendor] 
 */

ALTER TABLE [Dim.Vendor] ADD CONSTRAINT [RefDim.Date29] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go


/* 
 * TABLE: [Fact.Product] 
 */

ALTER TABLE [Fact.Product] ADD CONSTRAINT [RefDim.ProductInventory7] 
    FOREIGN KEY (ProductInventoryID)
    REFERENCES [Dim.ProductInventory](ProductInventoryID)
go

ALTER TABLE [Fact.Product] ADD CONSTRAINT [RefDim.ProductModel8] 
    FOREIGN KEY (ProductModelID)
    REFERENCES [Dim.ProductModel](ProductModelID)
go

ALTER TABLE [Fact.Product] ADD CONSTRAINT [RefDim.ProductSubCategory10] 
    FOREIGN KEY (ProductSubCategoryID)
    REFERENCES [Dim.ProductSubCategory](ProductSubCategoryID)
go

ALTER TABLE [Fact.Product] ADD CONSTRAINT [RefDim.ProductCategory11] 
    FOREIGN KEY (ProductCategoryID)
    REFERENCES [Dim.ProductCategory](ProductCategoryID)
go

ALTER TABLE [Fact.Product] ADD CONSTRAINT [RefDim.Date26] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go

/* 
 * TABLE: [Fact.Purchase] 
 */

ALTER TABLE [Fact.Purchase] ADD CONSTRAINT [RefDim.Employee1] 
    FOREIGN KEY (EmployeeID)
    REFERENCES [Dim.Employee](EmployeeID)
go

ALTER TABLE [Fact.Purchase] ADD CONSTRAINT [RefDim.EmployeePayHistory2] 
    FOREIGN KEY (PayHistoryID)
    REFERENCES [Dim.EmployeePayHistory](PayHistoryID)
go

ALTER TABLE [Fact.Purchase] ADD CONSTRAINT [RefDim.Vendor4] 
    FOREIGN KEY (VendorID)
    REFERENCES [Dim.Vendor](VendorID)
go

ALTER TABLE [Fact.Purchase] ADD CONSTRAINT [RefDim.ShipMethod5] 
    FOREIGN KEY (ShipMethodID)
    REFERENCES [Dim.ShipMethod](ShipMethodID)
go

ALTER TABLE [Fact.Purchase] ADD CONSTRAINT [RefDim.Date16] 
    FOREIGN KEY (ModifiedDate)
    REFERENCES [Dim.Date](ModifiedDate)
go

ALTER TABLE [Fact.Purchase] ADD CONSTRAINT [RefDim.SalesTerritory34] 
    FOREIGN KEY (TerritoryID)
    REFERENCES [Dim.SalesTerritory](TerritoryID)
go


