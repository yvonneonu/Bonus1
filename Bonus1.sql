SELECT TenantName
FROM Tenants
INNER JOIN
(SELECT TenantID FROM AptTenants GROUP BY TenantID HAVING COUNT(*) > 1) C
ON Tenants.TenanID = C.TenantID






SELECT BuildingNne, ISNULL(Count, 0) as 'Count'
FROM Buildings
LEFT JOIN
(SELECT Apartments.BuldingID, count(*) as 'Count'
FROM Requests INNER JOIN Apartments
ON Requests.AptID = Apartments.AptID
WHERE Requests.Status = 'Open'
GROUP BY Apartments.BuildingID) ReqCounts
ON ReqCounts.BuildingID = Buildings.BuidingID
