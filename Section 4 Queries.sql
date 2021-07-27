 
use AdventureWorks2014

select
*
from sales.SalesPerson



select
TerritoryID,
avg(Bonus)
from sales.SalesPerson
group by
TerritoryID




select
TerritoryID,
AvgBonus
from
	(
	select
	TerritoryID,
	avg(Bonus) as AvgBonus
	
	from sales.SalesPerson
	group by
	TerritoryID 
	) as new



select * from sales.SalesPerson


(
	select
	territoryID,
	sum(SalesQuota) 

	from sales.SalesPerson
	group by
	TerritoryID
) as Quota
	
Inner join

(
	select
	soh.TerritoryID,
	sum(soh.TotalDue)

	from Sales.SalesOrderHeader as soh
	group by
	soh.TerritoryID
) as Sales




select * from Sales.SalesPerson

select
TerritoryID,
avg(Bonus)

from sales.SalesPerson

group by 
TerritoryID


------------------------------------------------------------------------------------


select * from Sales.SalesPerson

select * from Sales.SalesOrderHeader



select
Quota.TerritoryID,
Quota.SumSalesQuota,
soh.SumTotalDue,
soh.SumTotalDue - Quota.SumSalesQuota 

from
(
select
TerritoryID,
sum(SalesQuota) as SumSalesQuota

from Sales.SalesPerson 
group by TerritoryID
) as Quota

Inner join
(
select
TerritoryID,
sum(TotalDue) as SumTotalDue

from sales.SalesOrderHeader 
group by
TerritoryID
) as soh

on Quota.TerritoryID = soh.TerritoryID
