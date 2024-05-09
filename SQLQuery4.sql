DROP TABLE Payment;
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
	ProfileImage_Path VARCHAR(50)
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
	Address VARCHAR(70),
	State VARCHAR(50),
	City VARCHAR(50),
	Postcode INT,
	Country VARCHAR(50)
);

CREATE TABLE Product(
	Product_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Category_ID INT,
	Product_Name VARCHAR(150),
	Description VARCHAR(300),
	Price FLOAT,
	FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)

);

CREATE TABLE Discount(
	Discount_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Discount_Amount FLOAT NOT NULL,
	Status VARCHAR(20),
	Start_Date date NOT NULL,
	End_Date date NOT NULL,
	Product_ID INT NOT NULL,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Image(
	Image_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ImagePath VARCHAR(100),
);

CREATE TABLE Quantity(
	Quantity_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Product_ID INT NOT NULL,
	Image_ID INT NOT NULL,
	Color VARCHAR(30),
	Qty INT,
	Size VARCHAR(8),
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
	FOREIGN KEY (Image_ID) REFERENCES Image(Image_ID)
);




CREATE TABLE WishlistItem(
	WishlistItem_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Product_ID INT NOT NULL,
	Customer_ID INT NOT NULL,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)

	);

CREATE TABLE Orders(
	Order_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Customer_ID INT NOT NULL,
	Subtotal FLOAT,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
	);

CREATE TABLE OrderList(
	OrderList_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Quantity_ID INT NOT NULL,
	Order_ID INT NOT NULL,
	Quantity INT,
	Item_Price FLOAT,
	FOREIGN KEY (Quantity_ID) REFERENCES Quantity(Quantity_ID),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
	);

CREATE TABLE Review(
	Review_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	OrderList_ID INT NOT NULL,
	Rating INT,
	Review varchar(200),
	Date_Submitted DATE,
	FOREIGN KEY (OrderList_ID) REFERENCES OrderList(OrderList_ID)
	);

CREATE TABLE Delivery(
	Delivery_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Address_ID INT NOT NULL,
	Delivery_Note VARCHAR(300),
	Delivery_Status VARCHAR(50),
	FOREIGN KEY (Address_ID) REFERENCES Shipping_Address(Address_ID)
	);

CREATE TABLE Payment(
	Payment_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Delivery_ID INT, 
	Order_ID INT NOT NULL,
	Total_Payment Float,
	Shipping_Amount FLOAT,
	Payment_Method VARCHAR(20),
	Payment_Status VARCHAR(10),
	Payment_DateTime DATETIME,
	FOREIGN KEY (Delivery_ID) REFERENCES Delivery(Delivery_ID),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
	);