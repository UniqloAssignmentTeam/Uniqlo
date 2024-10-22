﻿DROP TABLE Payment;
DROP TABLE Delivery;
DROP TABLE Review;
DROP TABLE OrderList;
DROP TABLE Orders;
DROP TABLE WishlistItem;
DROP TABLE Quantity;
DROP TABLE Image;
DROP TABLE Discount;
DROP TABLE Product;
DROP TABLE Shipping_Address;
DROP TABLE Staff;
DROP TABLE Customer;
DROP TABLE Category;


CREATE TABLE Category(
	Category_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Gender CHAR(1) NOT NULL,
	
);

CREATE TABLE Customer(
    Customer_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(70) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Contact_No VARCHAR(20) NOT NULL,
    Address VARCHAR(70),
    State VARCHAR(30),
    City VARCHAR(30),
    Postcode VARCHAR(10),
    Country VARCHAR(30), 
    Email VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
);

CREATE TABLE Staff(
	Staff_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(70) NOT NULL,
	Gender CHAR(1) NOT NULL,
	Contact_No VARCHAR(20),
	Email VARCHAR(50),
	Password VARCHAR(50) NOT NULL,
	Role VARCHAR(50) NOT NULL
);


CREATE TABLE Shipping_Address(
	Address_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Address VARCHAR(70)  NOT NULL,
	State VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	Postcode VARCHAR(10) NOT NULL,
	Country VARCHAR(50) NOT NULL
);

CREATE TABLE Product(
	Product_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Category_ID INT NOT NULL,
	Product_Name VARCHAR(150) NOT NULL,
	Description VARCHAR(300) NOT NULL,
	Price FLOAT NOT NULL,
	IsDeleted BIT NOT NULL,
	FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

CREATE TABLE Discount(
	Discount_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Discount_Amount FLOAT NOT NULL,
	Status VARCHAR(20) NOT NULL,
	Start_Date date NOT NULL,
	End_Date date NOT NULL,
	Product_ID INT NOT NULL,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Image(
	Image_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ProductImage VARBINARY(MAX) NOT NULL
);

CREATE TABLE Quantity(
	Quantity_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Product_ID INT NOT NULL,
	Image_ID INT NOT NULL,
	Color VARCHAR(30) NOT NULL,
	Qty INT NOT NULL,
	Size VARCHAR(8) NOT NULL,
	IsDeleted BIT NOT NULL,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
	FOREIGN KEY (Image_ID) REFERENCES Image(Image_ID)
);




CREATE TABLE WishlistItem(
	WishlistItem_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Quantity_ID INT NOT NULL,
	Customer_ID INT NOT NULL,
	FOREIGN KEY (Quantity_ID) REFERENCES Quantity(Quantity_ID),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)

	);

CREATE TABLE Orders(
	Order_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Customer_ID INT NOT NULL,
	Subtotal FLOAT NOT NULL,
	IsDeleted BIT NOT NULL,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
	);

CREATE TABLE OrderList(
	OrderList_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Quantity_ID INT NOT NULL,
	Order_ID INT NOT NULL,
	Qty INT NOT NULL,
	Item_Price FLOAT NOT NULL,
	FOREIGN KEY (Quantity_ID) REFERENCES Quantity(Quantity_ID),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
	);

CREATE TABLE Review(
	Review_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	OrderList_ID INT NOT NULL,
	Rating INT NOT NULL,
	Review varchar(200) NOT NULL,
	Date_Submitted DATE NOT NULL,
	FOREIGN KEY (OrderList_ID) REFERENCES OrderList(OrderList_ID)
	);

CREATE TABLE Delivery(
	Delivery_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Address_ID INT,
	Delivery_Note VARCHAR(300),
	Delivery_Status VARCHAR(50) NOT NULL,
	FOREIGN KEY (Address_ID) REFERENCES Shipping_Address(Address_ID)
	);

CREATE TABLE Payment(
	Payment_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Delivery_ID INT, 
	Order_ID INT NOT NULL,
	Total_Payment Float NOT NULL,
	Shipping_Amount FLOAT NOT NULL,
	Payment_Method VARCHAR(20) NOT NULL,
	Payment_Status VARCHAR(10) NOT NULL,
	Payment_DateTime DATETIME NOT NULL,
	FOREIGN KEY (Delivery_ID) REFERENCES Delivery(Delivery_ID),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
	);
	
-- Insert data into Category table
INSERT INTO Category (Name, Gender) VALUES
('Top', 'M'),
('Bottom', 'M'),
('Top', 'W'),
('Bottom', 'W');

-- Insert data into Customer table
INSERT INTO Customer (Name, Gender, Contact_No, Address, State, City, Postcode, Country, Email, Password) VALUES
('John Doe', 'M', '01234567890', '123 Main St', 'Selangor', 'Petaling Jaya', '47301', 'Malaysia', 'john@example.com', '2a6478f1c5f661d2e47e97930daac9fc8f2ab1d'),
('Jane Smith', 'F', '01234567891', '456 Elm St', 'Kuala Lumpur', 'Kuala Lumpur', '57000', 'Malaysia', 'jane@example.com', '5f9436b185ae309531f2a31f9af1b864b5b973'),
('Alex Johnson', 'M', '01234567892', '789 Oak St', 'Penang', 'Georgetown', '10200', 'Malaysia', 'alex@example.com', '4a90b3f4d2061fc522000f87099f4f85e5'),
('Emily Davis', 'F', '01234567893', '321 Pine St', 'Johor', 'Johor Bahru', '80000', 'Malaysia', 'emily@example.com', '60e53bc9e8db51f92ef865e62895d4'),
('Michael Brown', 'M', '01234567894', '654 Maple St', 'Perak', 'Ipoh', '30000', 'Malaysia', 'michael@example.com', '16b526e9d6db191c64b59e3de2');

-- Insert data into Staff table
INSERT INTO Staff (Name, Gender, Contact_No, Email, Password, Role) VALUES
('Jeffer Ooi', 'M', '01655123456', 'Jeffer@example.com', 'e9d6db191c64b59e3de2', 'Admin'),
('Beng Yee', 'M', '0169876543', 'BengYee@example.com', '191c64bc64b59e3de2', 'Manager'),
('Janice Lee', 'F', '0165555555', 'JaniceLee@example.com', '6db191ce3de264b59', 'Staff');

-- Insert data into Shipping_Address table
INSERT INTO Shipping_Address (Address, State, City, Postcode, Country) VALUES
('123 Main St', 'Selangor', 'Petaling Jaya', '47301', 'Malaysia'),
('456 Elm St', 'Kuala Lumpur', 'Kuala Lumpur', '57000', 'Malaysia'),
('789 Oak St', 'Penang', 'Georgetown', '10200', 'Malaysia'),
('321 Pine St', 'Johor', 'Johor Bahru', '80000', 'Malaysia'),
('654 Maple St', 'Perak', 'Ipoh', '30000', 'Malaysia');

-- Insert data into Product table
INSERT INTO Product (Category_ID, Product_Name, Description, Price, IsDeleted) VALUES
(1, 'AIRism Cotton Jersey Short Sleeve Skipper Polo Shirt', 'Smooth ''AIRism'' fabric with the look of cotton. Combines the light feel of a T-shirt and the elegance of a polo', 99.90, 0),
(2, 'Miracle Air Pants (Cotton Like)', 'Amazingly lightweight and stretchy with a stay-fresh feel. Comfortable, high-performance pants for all occasions.', 149.90, 0),
(4, 'Hello Kitty 50th Anniversary AIRism Easy Short', 'This collection celebrates Hello Kitty''s 50th anniversary, and is inspired by the 70''s, the era in which Hello Kitty was born.', 59.90, 0),
(3, 'AIRism UV Protection High Neck Long Sleeve T-Shirt', 'High neckline provides sun protection. Quick-drying for stay-fresh comfort.', 59.90, 0),
(1, 'Waffle Crew Neck Long Sleeve T-Shirt', 'Pre-washed for a soft, airy texture. Classic crew neck.', 79.90, 0);

-- Insert data into Discount table
INSERT INTO Discount (Discount_Amount, Status, Start_Date, End_Date, Product_ID) VALUES
(10.00, 'Active', '2024-04-01', '2024-04-30', 1),
(15.00, 'Active', '2024-04-01', '2024-04-30', 2),
(20.00, 'Active', '2024-04-01', '2024-04-30', 3),
(15.00, 'Inactive', '2024-05-01', '2024-05-30', 4),
(10.00, 'Active', '2024-04-01', '2024-04-30', 5);

-- Insert data into Image table
INSERT INTO Image (ProductImage) VALUES
(CONVERT(varbinary(max), 0xFFD8FFE000104A46494600010101006000600000FFDB00430006040506050406060506070706080A100A0A0909070A0C084C0E0D0C0E0C0A0C0C0D0E12100E0F11110D0C13151416171817161415160A0C0D0E0D0C, 2)),
(CONVERT(varbinary(max), 0x89504E470D0A1A0A0000000D4948445200000010000000100802000000073A7B0A1C000000097048597300000B1300000B1301009A9C180000000774494D4507E104030F173534F9F2190000001D69444154789C636060240001000585030D40000000, 2)),
(CONVERT(varbinary(max), 0x424D462A00000000000036040000280A00002003000040020000180800000100080000000000001000000000000000000000000000000000000000000000000000FFFFFF00FF00FF00FFFF00, 2)),
(CONVERT(varbinary(max), 0xFFD8FFE000104A46494600010100000100010000FFDB0084000906070608050607050A0808070A0E140E0D0D0E1C13100F161C1A1618181A1A1A1315171D1F1D1A1F1C1A1A1A1A2022282420202222281C1A1E2823222422221E1, 2)),
(CONVERT(varbinary(max), 0x89504E470D0A1A0A0000000D4948445200000010000000100806000000FD503EDF0000001974455874536F667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000002749444154789CAD56DB0E800C00210E6044041FB6887BC106488CD49836E924E00D1C57685318D1E0A58A610000000049454E44AE426082, 2));

-- Insert data into Quantity table
INSERT INTO Quantity (Product_ID, Image_ID, Color, Size, Qty, IsDeleted) VALUES
(1, 1, 'Red', 'S', 100, 0),
(1, 1, 'Red', 'M', 150, 0),
(1, 1, 'Red', 'L', 200, 0),
(1, 1, 'Red', 'XL', 120, 0),
(2, 2, 'White', 'S', 100, 0),
(2, 2, 'White', 'M', 150, 0),
(2, 2, 'White', 'L', 200, 0),
(2, 2, 'White', 'XL', 120, 0),
(3, 3, 'Black', 'S', 100, 0),
(3, 3, 'Black', 'M', 150, 0),
(3, 3, 'Black', 'L', 200, 0),
(3, 3, 'Black', 'XL', 120, 0),
(4, 4, 'White', 'S', 100, 0),
(4, 4, 'White', 'M', 150, 0),
(4, 4, 'White', 'L', 200, 0),
(4, 4, 'White', 'XL', 120, 0),
(5, 5, 'White', 'S', 100, 0),
(5, 5, 'White', 'M', 150, 0),
(5, 5, 'White', 'L', 200, 0),
(5, 5, 'White', 'XL', 120, 0),
(5, 1, 'Grey', 'S', 100, 0),
(5, 1, 'Grey', 'M', 150, 0),
(5, 1, 'Grey', 'L', 200, 0),
(5, 1, 'Grey', 'XL', 120, 0);




-- Insert data into WishlistItem table
INSERT INTO WishlistItem (Quantity_ID, Customer_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert data into Orders table
INSERT INTO Orders (Customer_ID, Subtotal, IsDeleted) VALUES
(1, 89.90 , 0),
(2, 119.90, 0),
(3, 129.90, 0),
(4, 59.90, 0),
(5, 94.90, 0);

-- Insert data into OrderList table
INSERT INTO OrderList (Quantity_ID, Order_ID, Qty, Item_Price) VALUES
(1, 1, 3, 29.90),
(2, 2, 2, 59.90),
(3, 3, 1, 109.90),
(4, 4, 2, 34.90),
(5, 5, 3, 34.90);

-- Insert data into Review table
INSERT INTO Review (OrderList_ID, Rating, Review, Date_Submitted) VALUES
(1, 5, 'The AIRism Cotton Jersey Short Sleeve Skipper Polo Shirt is amazing! Fits perfectly and feels very comfortable. Will definitely buy more!', '2024-04-05'),
(2, 4, 'The Miracle Air Pants (Cotton Like) are very comfortable and stylish. Love the quality and fit.', '2024-04-10'),
(3, 4, 'The Hello Kitty 50th Anniversary AIRism Easy Short is so cute and comfortable to wear. Perfect for casual outings.', '2024-04-15'),
(4, 3, 'The AIRism UV Protection High Neck Long Sleeve T-Shirt is decent. Provides good sun protection, but the material could be softer.', '2024-04-20'),
(5, 5, 'The Waffle Crew Neck Long Sleeve T-Shirt is excellent! Love the texture and fit. Will buy more colors soon.', '2024-04-25');

-- Insert data into Delivery table
INSERT INTO Delivery (Address_ID, Delivery_Note, Delivery_Status) VALUES
(1, 'Leave at front door if no one is home.', 'Pending'),
(2, 'Call upon arrival for delivery.', 'In Transit'),
(3, 'Deliver to back entrance.', 'Delivered'),
(4, 'Handle with care.', 'Pending'),
(5, 'Fragile, please do not drop.', 'In Transit');

-- Insert data into Payment table
INSERT INTO Payment (Delivery_ID, Order_ID, Total_Payment, Shipping_Amount, Payment_Method, Payment_Status, Payment_DateTime) VALUES
(1, 1, 104.89, 15.00, 'Credit Card', 'Paid', '2024-04-07 10:30:00'),
(2, 2, 154.89, 15.00, 'Credit Card', 'Paid', '2024-04-12 11:45:00'),
(3, 3, 174.89, 15.00, 'Credit Card', 'Paid', '2024-04-17 09:15:00'),
(4, 4, 94.89, 15.00, 'Debit Card', 'Paid', '2024-04-22 13:20:00'),
(5, 5, 129.89, 15.00, 'Credit Card', 'Paid', '2024-04-27 14:55:00');