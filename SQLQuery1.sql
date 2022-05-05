
select * 
from nedbankproject..data
order by 2,4

--select *
--from nedbankproject..data
--order by 2,4

select Year, Product, [Total Profit] 
from NedbankProject..data
order by 3,2

-- calculating avearge profit by looking at unit sold & total profit

select Year, Product, [Total Profit], [Units Sold], ([Total Profit]/[Units Sold]) as Averageprofit
from NedbankProject..data
order by 3,2

--selecting products that are like 'okie'

select Year, Product, [Total Profit], [Units Sold], ([Total Profit]/[Units Sold]) as Averageprofit
from NedbankProject..data
Where Product  like '%okie%'

--looking at total cost vs turnover
--shows the difference between sales and cost

select Year, Product,Turnover,[Total Cost],([Turnover]-[Total Cost]) as profit
from NedbankProject..data
Group by Product, Year, Turnover, [Total Cost]
order by 3,2

--looking at the highest turnover between products over the years

select Product, MAX(Turnover) as highestsales,([Turnover]/[Units Sold]) as percentofsales
from NedbankProject..data
Group by Product,[Units Sold], Turnover
order by highestsales desc

--showing products with the highest turnover

select Product, MAX(cast(Turnover as int)) as highestsales
from NedbankProject..data
Group by Product
order by highestsales asc

select Price, MAX(cast(Turnover as int)) as highestsales
from NedbankProject..data
Group by Price
order by highestsales asc


--Total sales number 
select Year, SUM(cast(turnover as int)) as totalsales
from NedbankProject..data
Group by Year
order by 2 asc

Select *
from NedbankProject..sheet

--Joining tables

select *
From NedbankProject..data dat
Join NedbankProject..Sheet shee
    on dat.year = shee.year
	and dat.product = shee.product

--creating tables 

create table AudreyFoodies
(Product nvarchar (50),
Year datetime,
sales numeric,
costs numeric,
profit numeric
)

Insert into AudreyFoodies
select Product,Year,Turnover, [Total Cost],[Profit Margin ] 
from NedbankProject..data

select *
from AudreyFoodies
