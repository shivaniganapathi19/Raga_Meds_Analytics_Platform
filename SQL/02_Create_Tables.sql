use Raga_Meds_Analytics;

create table Categories(
    Category_ID int primary key auto_increment,
    Category_Name varchar(100));

create table Suppliers(
    Supplier_ID int primary key auto_increment,
    Supplier_Name varchar(100),
    Contact_Number varchar(15),
    City varchar(50));

create table Medicines(
    Medicine_ID int primary key auto_increment,
    Medicine_Name varchar(150),
    Category_ID int,
    Supplier_ID int,
    Cost_Price decimal(10,2),
    Selling_Price decimal(10,2),
    Expiry_Date date,
    foreign key(Category_ID) references Categories(Category_ID),
    foreign key(Supplier_ID) references Suppliers(Supplier_ID));

create table Customers(
    Customer_ID int primary key auto_increment,
    Customer_Name varchar(100),
    Phone_Number varchar(15),
    Gender varchar(10),
    Age int,
    City varchar(50));

create table Employees(
    Employee_ID int primary key auto_increment,
    Employee_Name varchar(100),
    Role varchar(50),
    Phone_Number varchar(15),
    Salary decimal(10,2));

create table Sales(
    Sale_ID int primary key auto_increment,
    Customer_ID int,
    Employee_ID int,
    Sale_Date date,
    Total_Amount decimal(10,2),
    Payment_Method varchar(30),
    foreign key (Customer_ID) references Customers(Customer_ID),
    foreign key (Employee_ID) references Employees(Employee_ID));

create table Sale_Details(
    Sale_Detail_ID int primary key auto_increment,
    Sale_ID int,
    Medicine_ID int,
    Quantity int,
    Selling_Price decimal(10,2),
    Sub_Total decimal(10,2),
    foreign key (Sale_ID) references Sales(Sale_ID),
    foreign key (Medicine_ID) references Medicines(Medicine_ID));

create table Inventory(
    Inventory_ID int primary key auto_increment,
    Medicine_ID int,
    Stock_Quantity int,
    Reorder_Level int,
    Last_Updated date,
    foreign key (Medicine_ID) references Medicines(Medicine_ID));

create table Purchases(
    Purchase_ID int primary key auto_increment,
    Supplier_ID int,
    Purchase_Date date,
    Total_Cost decimal(10,2),
    foreign key (Supplier_ID) references Suppliers(Supplier_ID));

create table Purchase_Details(
    Purchase_Detail_ID int primary key auto_increment,
    Purchase_ID int,
    Medicine_ID int,
    Quantity int,
    Cost_Price decimal(10,2),
    foreign key (Purchase_ID) references Purchases(Purchase_ID),
    foreign key (Medicine_ID) references Medicines(Medicine_ID));