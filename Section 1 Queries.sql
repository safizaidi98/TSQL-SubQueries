
use AdventureWorks2014

select * from HumanResources.Employee

select * from Production.Product

select
	ProductID,
	Name,
	Color,
	ListPrice,
	( select avg(ListPrice) from Production.Product ) as 'AvgListPrice'

from Production.Product
where [Weight] > 0

----------------------------------------------------------------------------------------
select
	ProductID,
	Name,
	Color,
	ListPrice,
	(	select AVG(ListPrice) from Production.Product	) 'AvgListPrice',
	ListPrice - (	select AVG(ListPrice) from Production.Product	) 'PriceDifference'

from Production.Product
where
	[Weight] > 0


----------------------------------------------------------------------------------------

select
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	(	select AVG(LineTotal) 
		from Sales.SalesOrderDetail as SODInner
		where SODInner.SalesOrderID = SODOuter.SalesOrderID	) as 'AvgLineTotal'

from Sales.SalesOrderDetail as SODOuter

---------------------------------------------------------------------------------------------------

select
*
from Sales.SalesOrderDetail


select * from sales.SalesOrderHeader



select
SalesOrderID,
OrderDate,
TotalDue,
(	select count(SalesOrderDetailID)
	from Sales.SalesOrderDetail as SOD
	where SOD.SalesOrderID = SOH.SalesOrderID
	) as lineCount

from Sales.SalesOrderHeader as SOH


select * from sales.SalesOrderDetail
where SalesOrderID = 43659


