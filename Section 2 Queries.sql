

use AdventureWorks2014


select
*
from Sales.Customer



select
*
from Sales.SalesOrderHeader


select
*
from Sales.SalesOrderDetail



select
sh.OrderDate,
sd.SalesOrderDetailID,
sd.OrderQty,
sd.ProductID,
sd.UnitPrice

from sales.SalesOrderHeader			as sh
Inner join sales.SalesOrderDetail	as sd	on sh.SalesOrderID = sd.SalesOrderID
where
sh.SalesOrderID = 43659


select
*
from Sales.SalesOrderDetail


select 
SalesOrderID, 
SalesOrderDetailID, 
LineTotal, 
(
	select avg(LineTotal)
	from sales.SalesOrderDetail as sd2
	where sd2.SalesOrderID = sd1.SalesOrderID
) as AVGLinetotal

from Sales.SalesOrderDetail as sd1


select 
SalesOrderID, 
SalesOrderDetailID, 
LineTotal, 
(
	select avg(LineTotal)
	from sales.SalesOrderDetail as sd2
	where sd2.SalesOrderDetailID = sd1.SalesOrderDetailID
) as AVGLinetotal

from Sales.SalesOrderDetail as sd1


------------------------------------------------------------------------------------------------------------



select
*
from Sales.SalesOrderHeader


select
*
from Sales.SalesOrderDetail
where SalesOrderID = 43659



select
SalesOrderID,
OrderDate,
TotalDue,
(
	select count(sd.SalesOrderDetailID)
	from Sales.SalesOrderDetail as sd
	where sd.SalesOrderID = sh.SalesOrderID
) as 'Count'

from Sales.SalesOrderHeader as sh

----------- COUNT OF SalesOrderID occurance in the detail table

select
SalesOrderID,
OrderDate,
TotalDue,
(
	select count(sd.SalesOrderID)
	from Sales.SalesOrderDetail as sd
	where sd.SalesOrderID = sh.SalesOrderID
) as 'Count'

from Sales.SalesOrderHeader as sh

----------- Sum OF Linetotal in the detail table

-- 20565.6206

select
soh.SalesOrderID,
soh.SalesOrderNumber,
soh.TotalDue,
soh.[SubTotal],
(
	select sum(sod.LineTotal)
	from Sales.SalesOrderDetail as sod
	where sod.SalesOrderID = soh.SalesOrderID
) as DocTotal,
(
	select count(sod.SalesOrderID)
	from Sales.SalesOrderDetail as sod
	where sod.SalesOrderID = soh.SalesOrderID
) as [Count],
(
	select avg(sod.LineTotal)
	from Sales.SalesOrderDetail as sod
	where sod.SalesOrderID = soh.SalesOrderID
) as Average

from Sales.SalesOrderHeader as soh


------------------------------------------------------------------------------------------------------------

