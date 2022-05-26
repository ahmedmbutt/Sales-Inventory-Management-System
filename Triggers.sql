--drop trigger CheckPasswordLength
create trigger CheckPasswordLength
on Employee
instead of Insert
as
	declare @EID Int
	select @EID = EID from inserted
	declare @EmpFirstName varchar(50)
	select @EmpFirstName = EmpFirstName from inserted
	declare @EmpLastName varchar(50)
	select @EmpLastName = EmpLastName from inserted
	declare @EmpSalary decimal
	select @EmpSalary = EmpSalary from inserted
	declare @EmpEmail varchar(100)
	select @EmpEmail = EmpEmail from inserted
	declare @EmpPassword  varchar(50)
	select @EmpPassword = EmpPassword from inserted
	declare @AID int
	select @AID = AID from inserted
	if (len(@EmpPassword) >= 8)
		insert into Employee values (@EID, @EmpFirstName, @EmpLastName, @EmpSalary, @EmpEmail, @EmpPassword, @AID)
	else
		print'Error! Try Again'
go

--drop trigger setsubtotal
Create trigger setsubtotal 
ON OrderProduct 
for insert
as
BEGIN
declare @price as decimal
declare @pid as int
select @pid = pid from inserted 
select @price = ProdSalePrice from products where pid = @pid
declare @quantity as int 
Select @quantity =  Quantity from inserted
declare @sub as decimal
Select @sub = @quantity * @price
declare @oid as int
Select @oid= oid from inserted
declare @totals decimal
select @totals = sum(@sub) from OrderProduct where OID = @oid
update orderproduct set SubTotal = @sub where pid=@pid
update orders set OrdTotalAmount = @totals  where OID= @oid
update products set ProdStock = ProdStock-@quantity where pid=@pid
END
go