CREATE TABLE Category(
	Category_ID INT NOT NULL PRIMARY KEY,
	Clothing VARCHAR(50) NOT NULL,
	Gender CHAR(1) NOT NULL,
);

CREATE TABLE Discount(
	Discount_ID INT NOT NULL PRIMARY KEY,
	Discount_Amount FLOAT NOT NULL,
);

CREATE TABLE Size(
	Size_ID INT NOT NULL PRIMARY KEY,
	Size CHAR(1) NOT NULL,
);

CREATE TABLE Customer(
	Customer_ID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL,
	Gender CHAR(1) NOT NULL,
	Contact_No INT,
	Address VARCHAR(70),
	State VARCHAR(50),
	City VARCHAR(50),
	Postcode INT,
	Country VARCHAR(50), 
	Email VARCHAR(50),
	Password VARCHAR(50)
);

CREATE TABLE Staff(
	Staff_ID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL,
	Gender CHAR(1) NOT NULL,
	Contact_No INT,
	Email VARCHAR(50),
	Password VARCHAR(50),
	Role VARCHAR(50),
);


CREATE TABLE Shipping_Address(
	Address_ID INT NOT NULL PRIMARY KEY,
	Address VARCHAR(70),
	State VARCHAR(50),
	City VARCHAR(50),
	Postcode INT,
	Country VARCHAR(50)
);

CREATE TABLE Product(
	Product_ID INT NOT NULL PRIMARY KEY,
	Discount_ID INT,
	Category_ID INT,
	Product_Name VARCHAR(150),
	Description VARCHAR(300),
	Price FLOAT,
	FOREIGN KEY (Discount_ID) REFERENCES Discount(Discount_ID),
	FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)

);

CREATE TABLE Images(
	Image_ID INT NOT NULL  PRIMARY KEY,
	Image VARCHAR(300),
	Product_ID INT,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE ProductSize(
	ProductSize_ID INT NOT NULL PRIMARY KEY,
	Size_ID INT,
	Product_ID INT,
	FOREIGN KEY (Size_ID) REFERENCES Size(Size_ID),
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Wishlist(
	Wishlist_ID INT NOT NULL PRIMARY KEY,
	Customer_ID INT,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)

	);

CREATE TABLE WishlistItem(
	WishlistItem_ID INT NOT NULL PRIMARY KEY,
	Product_ID INT,
	Wishlist_ID INT,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
	FOREIGN KEY (Wishlist_ID) REFERENCES Wishlist(Wishlist_ID)

	);

CREATE TABLE Orders(
	Order_ID INT NOT NULL PRIMARY KEY,
	Customer_ID INT,
	OrderNo INT,
	TotalPrice FLOAT,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
	);

CREATE TABLE OrderList(
	OrderList_ID INT NOT NULL PRIMARY KEY,
	Product_ID INT,
	Order_ID INT,
	Quantity INT,
	UnitPrice FLOAT,
	Subtotal FLOAT,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
	);

CREATE TABLE Review(
	Review_ID INT NOT NULL PRIMARY KEY,
	OrderList_ID INT,
	Rating INT,
	Date_Submitted DATE,
	FOREIGN KEY (OrderList_ID) REFERENCES OrderList(OrderList_ID)
	);

CREATE TABLE Delivery(
	Delivery_ID INT NOT NULL PRIMARY KEY,
	Address_ID INT,
	DeliveryNote VARCHAR(300),
	DeliveryStatus VARCHAR(50),
	FOREIGN KEY (Address_ID) REFERENCES Shipping_Address(Address_ID)
	);

CREATE TABLE Payment(
	Payment_ID INT NOT NULL PRIMARY KEY,
	Delivery_ID INT,
	Order_ID INT,
	Shipping_Amount FLOAT,
	DateTime DATETIME,
	FOREIGN KEY (Delivery_ID) REFERENCES Delivery(Delivery_ID),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
	);













