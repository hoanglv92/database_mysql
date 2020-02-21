use C1119h1DB;
create table Customers(
customers_number int(20) not null,
fullname varchar(50) not null,
address varchar(100) not null,
email varchar(40)not null,
phone int(10) not null,
constraint primary key(customers_number)
);
create table accounts(
account_number int (15) not null,
account_type varchar(30) not null,
account_date_start date not null,
account_blance int(50) not null,
customer_number int(20),
constraint primary key(account_number),
constraint FK_accounts_Customers foreign key(customer_number) references Customers(customers_number)
);
create table Transactions(
tran_number int(20) not null,
account_number int (15),
transactions_date date,
amounts int (10)  not null,
descriptions varchar(255) not null,
TSaccount_number int(15),
constraint FK_Transactions_accounts foreign key(TSaccount_number)references accounts(account_number)
);
insert into C1119h1DB.Customers (customers_number,fullname,address,email,phone)
values(123456,"Le Van Hoang"," khoai chau hung yen","hoanglv92@gmail.com",0987654321);
insert into C1119h1DB.accounts (
account_number,account_type,account_date_start,account_blance,customer_number)
values(01,"nomal","2020/01/01",100,123456
);
use classicmodels;
select productCode, productName, buyprice, quantityInStock from products
where buyprice > 56.76 and quantityInStock > 10;
SELECT productCode,productName, buyprice, textDescription
FROM products
INNER JOIN productlines
ON products.productline = productlines.productline
WHERE buyprice > 56.76 AND buyprice < 95.59;
select productCode, productName, buyprice, quantityInStock, productVendor, productLine 
from products 
where productLine = 'Classic Cars' or productVendor = 'Min Lin Diecast';
select customers.customerNumber, customerName, phone, paymentDate, amount from customers
inner join payments
on customers.customerNumber = payments.customerNumber
where city = 'Las Vegas';
select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers
left join orders
on customers.customerNumber = orders.customerNumber ;