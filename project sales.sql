use salesdb

select * from Customers
select * from employees 
select * from Products
select * from Sales


-- how many distinct products are there 
select count(distinct(name))as total_products 
from Products
--- number of salespersons in the company 
select count(distinct(salespersonid)) as total_sales_persons
from sales
-- which product was purchased the max with respect to quantity 
select a.Name , b.Quantity
from Products as a
join sales as b 
on a.ProductID = b.ProductID
where b.Quantity = (select max(quantity) from sales)

--join  - get customer first name , last name , customer id , product id - of the customers purchase 
   select a.CustomerID,a.FirstName , a.LastName ,b.ProductID 
   from Customers as a 
   join sales as b 
   on a.CustomerID = b.CustomerID

-- join - get customer first name , last name , customer id , product id , product name - of the customer purchase 
	select a.CustomerID , a.FirstName , a.LastName , b.ProductID , c.Name 
	from Customers as a 
	join sales as b 
	on a.CustomerID = b.CustomerID
	join Products as c 
	on b.ProductID = c.ProductID

-- get the customer first name and last name and the employee who assisted the customer  
	 select * from Customers
	 select * from Employees
	 select * from Products
	 select * from Sales


	select a.firstname , a.LastName , c.FirstName , c.LastName 
	from Customers as a 
	join sales as b  
	on a.CustomerID = b.CustomerID
	join Employees as c 
	on b.SalesPersonID = c.SalesPersonID

-- get the customer firstname , last name and the product they purchased 

select * from Customers
select * from Employees
select * from Products
select * from Sales
	
select firstname , lastname , name 
from customers as a 
join Sales as b
on a.CustomerID = b.CustomerID
join Products as c 
on b.ProductID = c.ProductID

--- get the customer firstname , last name , the product , price  they purchased 
select firstname , lastname , name , price 
from customers as a 
join Sales as b
on a.CustomerID = b.CustomerID
join Products as c 
on b.ProductID = c.ProductID
order by price desc 
--get the customer firstname , last name , the product , price , quantity  they purchased 

select firstname , lastname , name ,Quantity,Price
from customers as a 
join Sales as b
on a.CustomerID = b.CustomerID
join Products as c 
on b.ProductID = c.ProductID
order by price desc

-- join function in a temp table 

select * from Customers
select * from Employees
select * from Products
select * from Sales

create table #temp_sales1 (firstname varchar(30) , lastname varchar (30) , 
salesfirstname varchar(30) , saleslastname varchar(30))


insert into #temp_sales1 
    select a.firstname , a.LastName , c.FirstName , c.LastName 
	from Customers as a 
	join sales as b  
	on a.CustomerID = b.CustomerID
	join Employees as c 
	on b.SalesPersonID = c.SalesPersonID

select * from #temp_sales1
-- select only first name , last name where middle name is not null 

select firstname , lastname 
from customers 
where MiddleInitial is not null
--- ADVANCED JOIN :
select * from Customers
select * from Employees
select * from Products
select * from Sales

select a.firstname , a.LastName , c.FirstName , c.LastName 
from Customers as a 
join sales as b  
on a.CustomerID = b.CustomerID
join Employees as c 
on b.SalesPersonID = c.SalesPersonID
where a.MiddleInitial is null 
	

-- Name and quantity of the product with maximum price 
select * from Products
select * from employees 
select * from Customers
select * from Sales


select a.ProductID , a.Name , a.Price ,b.Quantity
from products as a  
join sales as b 
on a.ProductID = b.ProductID 
where price = (select max(price) from products )




