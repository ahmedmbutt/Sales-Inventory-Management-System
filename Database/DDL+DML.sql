/*Drop Table Employee
Drop Table Orders
Drop Table OrderProduct
Drop Table Products
Drop Table Category*/

Create Table Employee (
EID Int Primary Key,
EmpFirstName varchar(50),
EmpLastName varchar(50),
EmpSalary decimal,
EmpEmail varchar(100),
EmpPassword  varchar(50),
AID int,
constraint fk_AID  Foreign Key (AID) references Employee)

insert into Employee values 
(001, 'Ahmed', 'Mujtaba', 50000, 'ahmedbutt@gmail.com', 'abcdef', NULL),
(002, 'Muhammad', 'Waqas', 50000, 'raiwaqas@gmail.com', 'abc', 001),
(003, 'Hashaam', 'Ejaz', 50000, 'hashaamejaz@gmail.com', 'hbe', 001),
(004, 'Hassaan', 'Ayaz', 50000, 'hassaanayaz@gmail.com', 'strongPass', 001),
(005, 'Imran', 'Khan', 100000, 'imrankhan@gmail.com', 'Tabdeeli', 001)

Create Table Category(
CID int Primary Key,
CatName varchar(50))

insert into Category values
(1, 'Food'),
(2, 'Drinks'),
(3, 'Detergents'),
(4, 'Electronics'),
(5, 'Stationary')

create table Orders(
OID Int Primary Key,
EID int,
OrdDate datetime,
OrdTotalAmount decimal,
constraint fk_EID  Foreign Key (EID) references Employee)

insert into Orders values 
(001, 001, '20-jan-2021', 500),
(002, 001, '10-feb-2021' , 160),
(003, 005, '11-feb-2021', 400),
(004, 005, '12-feb-2021', 1600)

Create Table Products(
PID int Primary Key,
EID int,
ProdName varchar(50),
ProdCostPrice decimal,
ProdSalePrice decimal,
ProdStock int,
CID Int,
constraint fk_EID1  Foreign Key (EID) references Employee,
constraint fk_CID  Foreign Key (CID) references Category)

insert into Products values
(001, 001, 'Cupcake',  5, 20, 100, 1 ),
(002, 001, '7-up',  40, 50, 100, 2 ),
(003, 001, 'Coke',  40, 50, 100, 2 ),
(004, 001, 'Mirinda',  40, 50, 100, 2 ),
(005, 001, 'Flour',  500, 800, 50, 1 ),
(006, 001, 'Markers',  5, 10, 100, 5 ),
(007, 001, 'Pen',  5, 20, 100, 5 ),
(008, 001, 'Pencil',  5, 10, 100, 5 ),
(009, 001, 'Stapler',  5, 50, 10, 5 ),
(010, 001, 'Biscuit',  5, 20, 55, 1 ),
(011, 001, 'Usb-C Cable',  200, 300, 10, 4 ),
(012, 001, 'Iphone Charger',  250, 350, 10, 4 ),
(013, 001, 'Car-Charger',  200, 400, 10, 4 ),
(014, 001, 'Ariel',  50, 80, 50, 3 ),
(015, 001, 'Surf Express',  50, 80, 50, 3 )

Create Table OrderProduct(
OID int,
PID int,
Quantity int,
SubTotal decimal,
constraint fk_OID  Foreign Key (OID) references Orders,
constraint fk_PID  Foreign Key (PID) references Products)

insert into OrderProduct values
(001, 001, 10, 200),
(001, 002, 4, 200),
(001, 010, 5, 100),
(002, 014, 2, 160),
(003, 011, 1, 300),
(003, 008, 10, 100),
(004, 005, 2, 1600)