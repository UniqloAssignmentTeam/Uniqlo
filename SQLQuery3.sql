-- Insert data into Category table
INSERT INTO Category (Name, Gender) VALUES
('Top', 'M'),
('Bottom', 'M'),
('Top', 'W'),
('Bottom', 'W');

-- Insert data into Customer table
INSERT INTO Customer (Name, Gender, Contact_No, Address, State, City, Postcode, Country, Email, Password, ProfileImage_Path) VALUES
('John Doe', 'M', '01234567890', '123 Main St', 'Selangor', 'Petaling Jaya', '47301', 'Malaysia', 'john@example.com', '2a6478f1c5f661d2e47e97930daac9fc8f2ab1d', 'profile1.jpg'),
('Jane Smith', 'F', '01234567891', '456 Elm St', 'Kuala Lumpur', 'Kuala Lumpur', '57000', 'Malaysia', 'jane@example.com', '5f9436b185ae309531f2a31f9af1b864b5b973', 'profile2.jpg'),
('Alex Johnson', 'M', '01234567892', '789 Oak St', 'Penang', 'Georgetown', '10200', 'Malaysia', 'alex@example.com', '4a90b3f4d2061fc522000f87099f4f85e5', null),
('Emily Davis', 'F', '01234567893', '321 Pine St', 'Johor', 'Johor Bahru', '80000', 'Malaysia', 'emily@example.com', '60e53bc9e8db51f92ef865e62895d4', 'profile4.jpg'),
('Michael Brown', 'M', '01234567894', '654 Maple St', 'Perak', 'Ipoh', '30000', 'Malaysia', 'michael@example.com', '16b526e9d6db191c64b59e3de2', 'profile5.jpg');

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
INSERT INTO Product (Category_ID, Product_Name, Description, Price) VALUES
(1, 'AIRism Cotton Jersey Short Sleeve Skipper Polo Shirt', 'Smooth ''AIRism'' fabric with the look of cotton. Combines the light feel of a T-shirt and the elegance of a polo', 99.90),
(2, 'Miracle Air Pants (Cotton Like)', 'Amazingly lightweight and stretchy with a stay-fresh feel. Comfortable, high-performance pants for all occasions.', 149.90),
(4, 'Hello Kitty 50th Anniversary AIRism Easy Short', 'This collection celebrates Hello Kitty''s 50th anniversary, and is inspired by the 70''s, the era in which Hello Kitty was born.', 59.90),
(3, 'AIRism UV Protection High Neck Long Sleeve T-Shirt', 'High neckline provides sun protection. Quick-drying for stay-fresh comfort.', 59.90),
(1, 'Waffle Crew Neck Long Sleeve T-Shirt', 'Pre-washed for a soft, airy texture. Classic crew neck.', 79.90);

-- Insert data into Discount table
INSERT INTO Discount (Discount_Amount, Status, Start_Date, End_Date, Product_ID) VALUES
(10.00, 'Active', '2024-04-01', '2024-04-30', 1),
(15.00, 'Active', '2024-04-01', '2024-04-30', 2),
(20.00, 'Active', '2024-04-01', '2024-04-30', 3),
(15.00, 'Inactive', '2024-05-01', '2024-05-30', 4),
(10.00, 'Active', '2024-04-01', '2024-04-30', 5);

-- Insert data into Image table
INSERT INTO Image (ImagePath) VALUES
('/Images/Products/SweatCargoPants1.jpg'),
('/Images/Products/SweatCargoPants2.jpg'),
('/Images/Products/SweatCargoPants3.jpg'),
('/Images/Products/SweatCargoPants4.jpg'),
('/Images/Products/AIRismCottonShortSleeveT-Shirt1.jpg');

-- Insert data into Quantity table
INSERT INTO Quantity (Product_ID, Image_ID, Color, Size, Quantity) VALUES
(1, 1, 'Red', 'S', 100),
(1, 1, 'Red', 'M', 150),
(1, 1, 'Red', 'L', 200),
(1, 1, 'Red', 'XL', 120),
(2, 2, 'White', 'S', 100),
(2, 2, 'White', 'M', 150),
(2, 2, 'White', 'L', 200),
(2, 2, 'White', 'XL', 120),
(3, 3, 'Black', 'S', 100),
(3, 3, 'Black', 'M', 150),
(3, 3, 'Black', 'L', 200),
(3, 3, 'Black', 'XL', 120),
(4, 4, 'White', 'S', 100),
(4, 4, 'White', 'M', 150),
(4, 4, 'White', 'L', 200),
(4, 4, 'White', 'XL', 120),
(5, 5, 'White', 'S', 100),
(5, 5, 'White', 'M', 150),
(5, 5, 'White', 'L', 200),
(5, 5, 'White', 'XL', 120),
(5, 1, 'Grey', 'S', 100),
(5, 1, 'Grey', 'M', 150),
(5, 1, 'Grey', 'L', 200),
(5, 1, 'Grey', 'XL', 120);




-- Insert data into WishlistItem table
INSERT INTO WishlistItem (Product_ID, Customer_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert data into Orders table
INSERT INTO Orders (Customer_ID, Subtotal) VALUES
(1, 89.90),
(2, 119.90),
(3, 129.90),
(4, 59.90),
(5, 94.90);

-- Insert data into OrderList table
INSERT INTO OrderList (Product_ID, Order_ID, Qty, Item_Price) VALUES
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