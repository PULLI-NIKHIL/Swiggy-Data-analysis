CREATE DATABASE Swiggy_food_project

USE Swiggy_food_project
CREATE TABLE swiggy_new_project(
ID INT,
Area nvarchar(200),
City nvarchar(100),
Restaurent nvarchar(100),
Price INT,
Avg_rating nvarchar(100),
Total_rating nvarchar(100),
Food_type_1 nvarchar(200),
Food_type_2 nvarchar(100),
Food_type_3 nvarchar(100),
Food_type_5 nvarchar(100),
Food_type_6 nvarchar(100),
Food_type_7 nvarchar(100),
Food_type_8 nvarchar(100),
Food_type_9 nvarchar(100),
Food_type_10 nvarchar(100),
Food_type_11 nvarchar(100),
Food_type_12 nvarchar(100),
Food_type_13 nvarchar(100),
Food_type_14 nvarchar(100),
Food_type_15 nvarchar(100),
Food_type_16 nvarchar(100),
Delivery TIME(7) )

ALTER TABLE dbo.swiggy_new_project
ALTER Column Food_type_1 nvarchar(400)

BULK INSERT dbo.swiggy_new_project
FROM 'C:\Users\pulli\Downloads\archive (26)\swiggy new one 1805.csv'
WITH (
       FIRSTROW = 2,
	   FIELDTERMINATOR = ',',
	   TABLOCK
	)

select * from dbo.swiggy_new_project

--Location data
select count(city) as locations, city 
from dbo.swiggy_new_project
group by City

--Overall average rating in each city
select City, ROUND(AVG(Avg_rating),2) as rating_city
from [Swiggy_food_project].[dbo].[swiggy_new_project]
group by City

--Both rating and avg billing amount in each city
select City, ROUND(AVG(Avg_rating),1) as rating_city,avg(Price) as avg_billing_amount
from [Swiggy_food_project].[dbo].[swiggy_new_project]
group by City

-- AVG BILLING IN EACH CITY
select City,AVG(Price) as Average_billing_amount
from [Swiggy_food_project].[dbo].[swiggy_new_project]
group by City
ORDER BY Average_billing_amount desc

ALTER TABLE dbo.swiggy_new_project
ALTER Column  Avg_rating FLOAT

select * from dbo.swiggy_new_project

--TOP 10 Highest_ratings in each city
--1.Bangalore
select TOP 10  City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Bangalore'
order by Avg_rating DESC
--2.Hyderabad
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Hyderabad'
ORDER BY Avg_rating DESC
--3.Mumbai
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Mumbai'
ORDER BY Avg_rating DESC
--4.Chennai
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Chennai'
ORDER BY Avg_rating DESC
--Ahmedabad
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Ahmedabad'
ORDER BY Avg_rating DESC
--Surat
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Surat'
ORDER BY Avg_rating DESC
--Delhi
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Delhi'
ORDER BY Avg_rating DESC
--Pune
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Pune'
ORDER BY Avg_rating DESC
--Kolkata
select TOP 10 City,Restaurent,Area,Avg_rating
from [Swiggy_food_project].[dbo].[swiggy_new_project]
WHERE City = 'Kolkata'
ORDER BY Avg_rating DESC


--Highest_Rating Restaurent Areas in each city
--Hyderabad
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Hyderabad'
order by Avg_rating desc
) as tt

--2.Mumbai
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Mumbai'
order by Avg_rating desc
) as tt
--Chennai
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].dbo.swiggy_new_project
group by Area,City,Avg_rating
having City = 'Chennai'
order by Avg_rating desc
)AS N
--Ahmedabad
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Ahmedabad'
order by Avg_rating desc
)AS N

--Surat
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Surat'
order by Avg_rating desc
)AS N

--Bangalore
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Bangalore'
order by Avg_rating desc
)AS N

--Delhi
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Delhi'
order by Avg_rating desc
)AS N

--pune
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Pune'
order by Avg_rating desc
)AS N

--Kolkata
select Area,City,Avg_rating
from
(
SELECT TOP 10 Area,City,COUNT(Restaurent) as total_restaurents, Avg_rating
FROM [Swiggy_food_project].[dbo].[swiggy_new_project]
group by Area,City,Avg_rating
having City = 'Kolkata'
order by Avg_rating desc
)AS N

select * from dbo.swiggy_new_project

-- AVG BILLING IN EACH CITY
select City,AVG(Price) as Average_billing_amount
from [Swiggy_food_project].[dbo].[swiggy_new_project]
group by City
ORDER BY Average_billing_amount desc

--Highest TOP 10  Amount Spending food and their restaurent in each city
select TOP 10 city,Restaurent,price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
WHERE city = 'Hyderabad'
order by price desc
--2.Bangalore
select TOP 10 city,Restaurent, AVG(Price) AS price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by city,Restaurent,Food_type
having city = 'Bangalore'
order by price DESC

ALTER TABLE [swiggy_project].[dbo].[swiggy_11]
alter column price  int

--3.Mumbai

select TOP 10city,Restaurent,Price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
where city = 'Mumbai'
order by price desc

--4.Chennai
select TOP 10city,Restaurent,Price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
where city = 'Chennai'
order by price desc

--Ahmedabad
select TOP 10city,Restaurent,Price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
where city = 'Ahmedabad'
order by price desc

--Surat
select TOP 10city,Restaurent,Price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
where city = 'Surat'
order by price desc

--Delhi
select TOP 10city,Restaurent,Price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
where city = 'Delhi'
order by price desc

-- Pune
select TOP 10city,Restaurent,Price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
where city = 'Pune'
order by price desc

--Kolkata
select TOP 10city,Restaurent,Price, Food_type
from [swiggy_project].[dbo].[swiggy_11]
where city = 'Kolkata'
order by price desc

select * from dbo.swiggy_new_project

/*select City,COUNT(Food_type_1) as vv, Food_type_1
from dbo.swiggy_new_project
group by City,Food_type_1*/

/*select  TOP 1 City,Price,count(Food_type) as dd, Food_type,
ROW_NUMBER() OVER(PARTITION BY count(Food_type) order by City) AS GG
from [swiggy_project].[dbo].[swiggy_11]
Group by city,Price,Food_type
having city = 'Hyderabad'
ORDER BY dd desc*/

/*SELECT TOP 5 COUNT(Food_type) as pp,Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by city,Food_type
order by pp desc*/

/*SELECT TOP 10 City, Food_type_1,count(Food_type_1),Food_type_2,count(Food_type_2),Food_type_3,count(Food_type_3),Food_type_5,count(Food_type_5),
Food_type_6,count(Food_type_6),Food_type_7,count(Food_type_7),Food_type_8,count(Food_type_8),Food_type_9,count(Food_type_9)
FROM dbo.swiggy_new_project
group by City, Food_type_1,Food_type_2,Food_type_3,Food_type_5,Food_type_6,Food_type_7,Food_type_8,Food_type_9*/


--Most ordered food_types ON Each city and Avg Amount on each food_type_ordered.
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Hyderabad'
ORDER BY most_food_types_ordered desc

--MUMBAI
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Mumbai'
ORDER BY most_food_types_ordered desc
 
--Bangalore
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Bangalore'
ORDER BY most_food_types_ordered desc

--Chennai
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Chennai'
ORDER BY most_food_types_ordered desc

--Ahmedabad
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Ahmedabad'
ORDER BY most_food_types_ordered desc

--Delhi
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Delhi'
ORDER BY most_food_types_ordered desc

--surat
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'surat'
ORDER BY most_food_types_ordered desc

--Pune
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Pune'
ORDER BY most_food_types_ordered desc

--Kolkata
select TOP 10 city,avg(price) as avg_amount_spend,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Kolkata'
ORDER BY most_food_types_ordered desc

select count(city),city
from [swiggy_project].[dbo].[swiggy_11]
group by city

ALTER TABLE [swiggy_project].[dbo].[swiggy_11]
ALTER column price INT

/*select TOP 10 city,avg(price) as pp,COUNT(food_type) as most_food_types_ordered, Food_type
from [swiggy_project].[dbo].[swiggy_11]
group by Food_type,city
having COUNT(food_type) > 1 and city = 'Bangalore'
order by most_food_types_ordered,pp desc*/


select * from [swiggy_project].[dbo].[swiggy_11]

select * from [Swiggy_food_project].[dbo].[swiggy_new_project]

select TOP 10 City,count(Restaurent) as ress,Area,Restaurent,avg(Price) as nn
from [Swiggy_food_project].[dbo].[swiggy_new_project]
group by City,Restaurent,Area
having City = 'Hyderabad'
order by ress DESC

select TOP 10 city,count(Restaurent) as nn, Restaurent,avg(Price) as bb
from [Swiggy_food_project].[dbo].[swiggy_new_project]
group by City,Restaurent
 having city = 'Hyderabad'
 order by nn desc

 --Most ordering restaurents in each city with their avg amount spending
 --1.Hyderabad
 select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Hyderabad'
 order by Ordering_restaurents desc
 ) as bb

 --Mumabi
  select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Mumbai'
 order by Ordering_restaurents desc
 ) as bb

 --Bangalore
  select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Bangalore'
 order by Ordering_restaurents desc
 ) as bb

 --Chennai
select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Chennai'
 order by Ordering_restaurents desc
 ) as bb

 --Delhi
 select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Delhi'
 order by Ordering_restaurents desc
 ) as bb

 --pune
 select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'pune'
 order by Ordering_restaurents desc
 ) as bb

 --Kolkata
 select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Kolkata'
 order by Ordering_restaurents desc
 ) as bb

 --Surat
 select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'surat'
 order by Ordering_restaurents desc
 ) as bb

 --Ahmedabad
 select city,Restaurent,avg_amount_spend
 from
 (
 select TOP 10city,count(Restaurent) as Ordering_restaurents, Restaurent,avg(price) as avg_amount_spend
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Ahmedabad'
 order by Ordering_restaurents desc
 ) as bb

 select city,count(city)
 from [swiggy_project].[dbo].[swiggy_11]
 group by city

/*select TOP 10city,count(Restaurent) as pp, Restaurent,max(price) as nn
 from [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Hyderabad'
 order by pp desc*/

 /*select TOP 5 city,count(Restaurent) as nn,Restaurent,count(Food_type) as ne
 FROM [swiggy_project].[dbo].[swiggy_11]
 group by city,Restaurent
 having city = 'Hyderabad' 
 --and Restaurent = 'Haldirams'
 Order by ne desc*/

 select city,sum(price) as nn
 FROM [swiggy_project].[dbo].[swiggy_11]
 group by city




