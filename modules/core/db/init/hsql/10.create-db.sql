-- begin APPOINTMENTS
create table Appointments (
    ID bigint identity not null,
    Created timestamp,
    CreatedBy varchar(255),
    Modified timestamp,
    ModifiedBy varchar(255),
    --
    AppointmentTime time not null,
    AppointmentDate date not null,
    AppointmentType integer not null,
    DoctorNotes varchar(255),
    Appointment_Patient bigint not null
)^
-- end APPOINTMENTS
-- begin INVOICEDETAILS
create table InvoiceDetails (
    ID bigint identity not null,
    Created timestamp,
    CreatedBy varchar(255),
    Modified timestamp,
    ModifiedBy varchar(255),
    --
    Quantity integer not null,
    UnitPrice decimal(18, 2) not null,
    Product_ProductID bigint not null,
    Invoice_InvoiceDetail bigint not null
)^
-- end INVOICEDETAILS
-- begin INVOICES
create table Invoices (
    ID bigint identity not null,
    Created timestamp,
    CreatedBy varchar(255),
    Modified timestamp,
    ModifiedBy varchar(255),
    --
    InvoiceDate timestamp not null,
    InvoiceDue timestamp not null,
    InvoiceStatus integer not null,
    ShipDate timestamp not null,
    Invoice_Patient bigint not null
)^
-- end INVOICES
-- begin PATIENTS
create table Patients (
    ID bigint identity not null,
    Created timestamp,
    CreatedBy varchar(255),
    Modified timestamp,
    ModifiedBy varchar(255),
    --
    Name varchar(255) not null,
    Street varchar(255) not null,
    Street2 varchar(255),
    City varchar(255) not null,
    State varchar(255) not null,
    Zip varchar(255) not null,
    PrimaryPhone varchar(255) not null,
    SecondaryPhone varchar(255),
    Email varchar(255),
    PolicyNumber varchar(12) not null
)^
-- end PATIENTS
-- begin PRODUCT
create table Product (
    ProductID bigint identity not null,
    --
    ProductName varchar(50) not null,
    MSRP decimal(19, 4) not null,
    Description longvarchar,
    ProductImage longvarbinary,
    Category longvarchar
)^
-- end PRODUCT
-- begin PRODUCTREBATE
create table ProductRebate (
    ProductRebateID bigint identity not null,
    --
    ProductID bigint not null,
    RebateStart timestamp,
    RebateEnd timestamp,
    Rebate decimal(19, 4)
)^
-- end PRODUCTREBATE
