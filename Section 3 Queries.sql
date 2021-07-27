
use AdventureWorks2014

select * 
from Sales.SalesOrderHeader

select * 
from Sales.SalesPerson

where SalesYTD > 3000000

select count(SalesOrderID) from sales.SalesOrderHeader

-- Total		31465
-- Exists		1864
-- Not Exists	29601

select
soh.SalesOrderID,
soh.SalesPersonID,
soh.RevisionNumber,
soh.OrderDate
from Sales.SalesOrderHeader as soh
where not exists (
	select 1
	from Sales.SalesPerson as sp
	where sp.SalesYTD > 3000000
	and soh.SalesPersonID = sp.BusinessEntityID
)
order by soh.SalesPersonID desc




select
soh.SalesOrderID,
soh.SalesPersonID,
soh.RevisionNumber,
soh.OrderDate
from Sales.SalesOrderHeader as soh
where exists (
	select Null
	from Sales.SalesPerson as sp
	where sp.SalesYTD > 3000000
	and soh.SalesPersonID = sp.BusinessEntityID
)
order by soh.SalesPersonID desc




------------ Grouping By the highest number of SalesOrder Done by PersonID using SubQuery


select
count(soh.SalesOrderID),
soh.SalesPersonID

from Sales.SalesOrderHeader as soh
where exists (
	select 1
	from Sales.SalesPerson as sp
	where sp.SalesYTD > 3000000
	and soh.SalesPersonID = sp.BusinessEntityID
)
group by
soh.SalesPersonID,
soh.RevisionNumber

order by count(soh.SalesOrderID) desc


select
count(soh.SalesOrderID),
soh.SalesPersonID

from Sales.SalesOrderHeader as soh
where exists (
	select 1
	from Sales.SalesPerson as sp
	where sp.SalesYTD > 3000000
	and soh.SalesPersonID = sp.BusinessEntityID
)
group by
soh.SalesPersonID,
soh.RevisionNumber

order by count(soh.SalesOrderID) desc

---- By using Inner join

select
count(soh.SalesOrderID),
soh.SalesPersonID

from Sales.SalesOrderHeader as soh
Inner join Sales.SalesPerson as sp	on soh.SalesPersonID = sp.BusinessEntityID

where sp.SalesYTD > 3000000

group by
soh.SalesPersonID,
soh.RevisionNumber

order by count(soh.SalesOrderID) desc



------------------------------------------------------------------------------------------------------------------------


select * from Sales.SalesOrderHeader as soh

select * from Sales.SalesPerson as sp




select 
soh.SalesOrderID,
soh.AccountNumber,
soh.CustomerID,
soh.SalesPersonID,
soh.TotalDue

from Sales.SalesOrderHeader as soh
where soh.SalesPersonID in
(
	select BusinessEntityID
	from Sales.SalesPerson as sp
	where sp.Bonus > 5000
	--and sp.BusinessEntityID = soh.SalesPersonID
)

order by SalesPersonID desc





select 
soh.SalesOrderID,
soh.AccountNumber,
soh.CustomerID,
soh.SalesPersonID,
soh.TotalDue

from Sales.SalesOrderHeader as soh
where soh.SalesPersonID in
(
	select BusinessEntityID
	from Sales.SalesPerson as sp
	where sp.SalesYTD > 3000000
	--and sp.BusinessEntityID = soh.SalesPersonID
)

order by SalesPersonID desc



----------------------------------------------------------------------------------------------------------------------------------------

select * 
from HumanResources.Employee 



select 
JobTitle,
avg(VacationHours)

from HumanResources.Employee 

group by 
JobTitle

having avg(VacationHours) > (	select avg(VacationHours) from HumanResources.Employee	)
order by avg(VacationHours) desc



select 
JobTitle,
MaritalStatus,
avg(VacationHours)

from HumanResources.Employee  as ov

group by 
JobTitle,
MaritalStatus

having avg(VacationHours) > (	
	
	select avg(VacationHours) 
	from HumanResources.Employee as sv
	where
	ov.MaritalStatus = sv.MaritalStatus
		)

order by avg(VacationHours) desc



