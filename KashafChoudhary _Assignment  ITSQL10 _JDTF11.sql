CREATE SCHEMA Pw_assn;
SHOW DATABASES;
USE pw_assn;
CREATE TABLE Customers (
CustomerID INT,
CustomerName VARCHAR(50),
City VARCHAR(30),
JoinDate DATE
);
INSERT INTO Customers VALUES
(101,'Rahul Sharma','Bangalore','2023-01-15'),
(102,'Priya Mehta','Mumbai','2024-03-20'),
(103,'Arjun Nair','Chennai','2025-01-12'),
(104,'Sneha Gupta','Delhi','2022-07-10'),
(105,'Kavya Reddy','Hyderabad','2024-08-15'),
(106,'Amit Verma','Pune','2023-11-05'),
(107,'Rohan Singh','Kolkata','2024-05-18'),
(108,'Simran Kaur','Delhi','2025-02-01'),
(109,'Anjali Jain','Mumbai','2023-09-22'),
(110,'Vikram Patel','Ahmedabad','2022-12-30');
-- Orders
CREATE TABLE Orders (
OrderID INT,
CustomerID INT,
OrderDate DATE,
OrderAmount DECIMAL(10,2),
Status VARCHAR(20)
);
INSERT INTO Orders VALUES
(5001,101,'2025-01-05',12000,'Delivered'),
(5002,102,'2025-01-15',8500,'Pending'),
(5003,101,'2025-02-10',22000,'Delivered'),
(5004,104,'2025-02-15',4500,'Cancelled'),
(5005,103,'2025-03-01',17500,'Delivered'),
(5006,105,'2025-03-10',9800,'Pending'),
(5007,106,'2025-03-18',25000,'Delivered'),
(5008,107,'2025-04-02',14500,'Delivered'),
(5009,101,'2025-04-10',30000,'Delivered'),
(5010,109,'2025-04-15',6500,'Pending'),
(5011,110,'2025-05-01',42000,'Delivered'),
(5012,104,'2025-05-08',18000,'Delivered'),
(5013,106,'2025-05-15',7000,'Cancelled'),
(5014,102,'2025-05-20',27000,'Delivered'),
(5015,107,'2025-06-01',15500,'Pending');

-- Employees
CREATE TABLE Employees (
EmployeeID INT,
EmployeeName VARCHAR(50),
ManagerID INT,
Department VARCHAR(30),
JoiningDate DATE,
Salary DECIMAL(10,2)
);
INSERT INTO Employees VALUES
(1,'Rajesh Kumar',NULL,'Management','2018-01-10',150000),
(2,'Neha Sharma',1,'Sales','2020-03-15',90000),
(3,'Amit Gupta',1,'IT','2019-06-20',110000),
(4,'Priyanka Singh',2,'Sales','2022-01-12',65000),
(5,'Vikas Patel',2,'Sales','2021-09-18',70000),
(6,'Rohit Jain',3,'IT','2023-02-05',60000),
(7,'Anjali Verma',3,'IT','2022-11-10',62000),
(8,'Karan Mehta',1,'HR','2021-05-25',80000),
(9,'Sneha Kapoor',8,'HR','2024-01-05',50000),
(10,'Arjun Malhotra',3,'IT','2024-04-15',55000);

-- Q1
select * from customers;
select * from employees;
select * from orders;
use pw_assn;
SELECT c.CustomerName, o.OrderID, o.OrderAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderAmount DESC
LIMIT 5; 

-- Q2
SELECT c.CustomerName
FROM Customers c 
where c.CustomerName like ('A%')
UNION ALL
SELECT c.CustomerName
FROM Customers c 
where c.CustomerName like ('R%')
UNION ALL
SELECT c.CustomerName
FROM Customers c 
where c.CustomerName like ('s%');

-- Q3
select c.CustomerName, orders.OrderID, orders.OrderAmount, orders.status
from customers c
join orders 
on c.customerid=orders.customerid
WHERE OrderAmount>10000 and Status= 'pending';

-- Q4
select CustomerID, CustomerName, JoinDate, datediff(now(), joindate) as Days_of_working
from customers 
where (select datediff(curdate(), joindate))> 365;

-- Q5
select * from orders;
select orderid, OrderAmount, orderamount *0.18 as GST_Amount_of_18perc, 
orderamount + orderamount *0.18  as After_Gst,
date_add(OrderDate, interval 15 Day) as EST_Collection_Date
FROM orders;

-- Q6
select * from orders;


select * from (
select c.customerid, c.customername, o.orderid, o.orderamount
from customers c
JOIN orders o
ON c.customerid=o.customerid) as co
order by co.OrderAmount DESC
limit 10
offset 10;

-- Q7
select c.CustomerID, o.orderid, c.CustomerName, c.JoinDate, datediff(now(), c.joindate) as days_since_registration
from customers c 
LEFT JOIN Orders o 
on c.customerid=o.customerid
where o.orderid is null;

-- Q8
select * from employees;
select e.EmployeeName, m.employeename as managername, e.department
from employees e
Left join employees m
on m.employeeid=e.managerid;

-- Q9
select * from (
select
c.customername,c.joindate, o.orderdate, datediff(o.orderdate, c.joindate) as days_taken_for_firstorder
from customers c
inner join orders o
on c.customerid=o.customerid) as cotable
where cotable.days_taken_for_firstorder<=30;

-- Q10
use pw_assn;
select
c.customername, sum(o.orderamount) as total_purchasing_amnt, if(sum(o.orderamount)>50000,'premium', if( sum(o.orderamount)>=20000, 'gold','silver'))as spending_category,
if( year(o.status)>2024, 'loyal customer', 'new customer') as loyalty_status
from customers c
inner join orders o
on o.customerid=c.customerid
group by c.customerid, c.customername, o.status;


-- Q11
select c.customername, o.orderid, o.orderamount as greater_than_avg_amnt
from customers c
inner join orders o
on c.customerid=o.customerid
Group by c.customername, o.orderid, o.orderamount
Having o.orderamount> (select avg(orderamount) from orders);

-- Q12
select c.customername, o.orderid, o.orderamount
from customers c 
join orders o
on c.customerid=o.customerid
order by o.orderamount desc
limit 5
offset 1;

