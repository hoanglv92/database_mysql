create database demo;
use demo;
create table Products(
id int  primary key ,
productCode int not null ,
productName nvarchar(50),
productPrice int (20),
productAmount int (4),
productDescription text ,
productStatus int(2)
);
CREATE UNIQUE INDEX ID_productCode
ON Products(productCode);
CREATE UNIQUE INDEX ID_id_productCode
ON Products(id,productCode);
select* from Products;
insert  Products values (1,9,"iphone 6",1000000,5,"iphone 6 cu ",1),
					(2,8,"iphone 7",2000000,4,"iphone 7 cu ",1),
                    (3,7,"iphone 5",500000,0,"iphone 5 cu ",0);
select  productName,id,productAmount,productPrice from Products where productCode=8;
SHOW INDEX FROM Products ;
explain select  productName,id,productAmount,productPrice from Products where productCode=8;
create view Products_view as select productCode,productName,productPrice,productStatus
from Products;
select*from Products_view;
insert  Products_view values (6,"iphone 8",10000000,1);
update Products_view set productName=concat(productName," new") where productPrice>1000000;
update Products_view set productName=concat(productName," old") where productPrice<=1000000;
select*from Products;
drop view Products_view;
DELIMITER //
create procedure sp_ChechValue()
   begin
   select*from Products;
   end;
   //
delimiter ;
drop procedure sp_ChechValue;

  call sp_ChechValue();

  DELIMITER //
  create procedure sp_showTable(IN 
  id int,
  productCode int  ,
productName nvarchar(50),
productPrice int (20),
productAmount int (4),
productDescription text ,
productStatus int(2) )
   begin
   insert into Products values(
   id,
   productCode,
   productName,
   productPrice ,
productAmount ,
productDescription  ,
productStatus
   );
   select*from Products;
   end;
   //
delimiter ;
drop procedure sp_showTable;
call sp_showTable(4,5,"iphone 10",20000000,2,"iphone 10 new ",1);
DELIMITER //
create procedure sp_edit(in id int,productName_new nvarchar(50))
   begin
   update Products set productName=productName_new where id=id;
   select*from Products;
   end;
   //
delimiter ;
call sp_edit(3,"iphone 12");
delimiter //
create procedure sp_delete( t int)
begin
delete from Products where id=t;
end;
 //

drop procedure sp_delete;
call sp_delete(1);
select*from Products;