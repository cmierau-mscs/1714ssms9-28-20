-- 2D.1	Buildings, apartments, administrators
SELECT        Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
GROUP BY Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
ORDER BY Building.City, Building.BuildingName, Person.FirstName, Person.LastName, Apartment.ApartmentNum
-- 2D.2	Tenants, buildings, apartments
SELECT        Person.PersonId, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId, Apartment.ApartmentNum
-- 2D.3	Apartment, tenant, invoice, line items
SELECT        Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate
-- 2D.4	Apartment, tenant, invoice total
SELECT        Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.Rent AS [Invoice Total]
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
-- 2D.5	Invoice, tenant, receipt
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate
-- 2D.6	Invoice, tenant, apartment, billed, received
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, Receipt.Amount AS Billed, Receipt.Amount AS Received
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
-- 2D.7	Administrator, invoice, total billed, received
SELECT        Person.PersonId, Person.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Receipt.Amount AS Billed, Receipt.Amount AS Received
FROM            Receipt INNER JOIN
                         Invoice ON Receipt.InvoiceId = Invoice.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId