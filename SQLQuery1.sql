-- Chason Mierau
-- Exercise2A - Table Queries

-- 1. Building, Apartment tables sort by. BuildingId and ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum
-- 2. Building, Apartment tables sort by. BuildingId and ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC
-- 3. Building, Apartment tables sort by. BuildingId and ApartmentNum
SELECT        Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceDate, Invoice.DueDate, Invoice.InvoiceId
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Invoice.InvoiceDate DESC, Apartment.ApartmentNum
-- 4. 	Apartment, Invoice
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate
-- 5. 	Apartment, Person
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS Admin, Apartment.Rent
FROM            Apartment CROSS JOIN
                         Person
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum
-- 6. 	Apartment, Invoice
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS TenantLastName, Person.FirstName AS TenantFirstName
FROM            Apartment CROSS JOIN
                         Person
ORDER BY Apartment.BuildingId, TenantFirstName, TenantLastName
-- 7. Invoice, LineItem
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, LineItem.Description, LineItem.Amount, Invoice.InvoiceDate
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC
-- 8. Invoice, LineItem
SELECT        Invoice.InvoiceId, Invoice.ApartmentId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Garage') OR
                         (LineItem.Description = N'Rent, October 2018')
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC
-- 9. 	Invoice, Receipt
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceId