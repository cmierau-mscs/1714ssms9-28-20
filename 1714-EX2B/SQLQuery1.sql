-- Chason Mierau
-- Exercise 2B: Summary Queries
-- Property Manager DB


-- 1. Count All Building
SELECT        COUNT(*) AS [All Buildings]
FROM            Building
-- 2. Count Buildings In Winona
SELECT        COUNT(*) AS [Buildings In Winona]
FROM            Building
WHERE        (City = N'Winona')
-- 3. Average Rent of All Apartments
SELECT        AVG(Rent) AS [Avg Rent]
FROM            Apartment
-- 4. Total Rent
SELECT        SUM(Rent) AS [Total Rent in Building 1]
FROM            Apartment
WHERE        (BuildingId = 1)
-- 5. Cheapest rent
SELECT        MIN(Rent) AS [Cheapest Rent Building 2]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)
-- 6. Smallest size, avg size, largest size
SELECT        MIN(SquareFeet) AS MinSize, MAX(SquareFeet) AS MaxSize, AVG(SquareFeet) AS AvgSize
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)
-- 7. Cheapest price	
SELECT        MIN(Amount) AS [Cheapest Garage]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')
-- 8. Total amount billed	
SELECT        SUM(Amount) AS [Total Gas Amount]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')
-- 9. Total rent	
SELECT        SUM(LineItem.Amount) AS [Total Rent for October]
FROM            LineItem CROSS JOIN
                         Invoice
WHERE        (Invoice.DueDate = CONVERT(DATETIME, '2018-10-01 00:00:00', 102))