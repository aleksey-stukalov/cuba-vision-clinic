-- begin APPOINTMENTS
alter table Appointments add constraint FK_APPOINTMENTS_APPOINTMENT_PATIENT foreign key (APPOINTMENT_PATIENT) references Patients(ID)^
create index IDX_APPOINTMENTS_APPOINTMENT_PATIENT on Appointments (APPOINTMENT_PATIENT)^
-- end APPOINTMENTS
-- begin INVOICEDETAILS
alter table InvoiceDetails add constraint FK_INVOICEDETAILS_PRODUCT_PRODUCTID foreign key (PRODUCT_PRODUCTID) references Product(ProductID)^
alter table InvoiceDetails add constraint FK_INVOICEDETAILS_INVOICE_INVOICEDETAIL foreign key (INVOICE_INVOICEDETAIL) references Invoices(ID)^
create index IDX_INVOICEDETAILS_INVOICE_INVOICEDETAIL on InvoiceDetails (INVOICE_INVOICEDETAIL)^
create index IDX_INVOICEDETAILS_PRODUCT_PRODUCTID on InvoiceDetails (PRODUCT_PRODUCTID)^
-- end INVOICEDETAILS
-- begin INVOICES
alter table Invoices add constraint FK_INVOICES_INVOICE_PATIENT foreign key (INVOICE_PATIENT) references Patients(ID)^
create index IDX_INVOICES_INVOICE_PATIENT on Invoices (INVOICE_PATIENT)^
-- end INVOICES
-- begin PRODUCTREBATE
alter table ProductRebate add constraint FK_PRODUCTREBATE_PRODUCTID foreign key (PRODUCTID) references Product(ProductID)^
create index IDX_PRODUCTREBATE_PRODUCTID on ProductRebate (PRODUCTID)^
-- end PRODUCTREBATE
