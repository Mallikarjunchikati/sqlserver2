CREATE TABLE TCustomers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    DateJoined DATE
);

-- Insert 10 sample records into the Customers table
INSERT INTO TCustomers (CustomerID, FirstName, LastName, Email, Phone, Address, DateJoined)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St, Cityville', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St, Townsville', '2023-02-20'),
(3, 'Sam', 'Brown', 'sam.brown@example.com', '555-8765', '789 Pine St, Villageburg', '2023-03-10'),
(4, 'Emily', 'Johnson', 'emily.johnson@example.com', '555-1122', '101 Maple St, Smalltown', '2023-04-25'),
(5, 'Michael', 'Davis', 'michael.davis@example.com', '555-3344', '202 Birch St, Countryside', '2023-05-15'),
(6, 'Sarah', 'Martinez', 'sarah.martinez@example.com', '555-5566', '303 Cedar St, Greenfield', '2023-06-22'),
(7, 'David', 'Lopez', 'david.lopez@example.com', '555-7788', '404 Redwood St, Riverside', '2023-07-09'),
(8, 'Laura', 'Wilson', 'laura.wilson@example.com', '555-9900', '505 Sequoia St, Lakeside', '2023-08-12'),
(9, 'James', 'Taylor', 'james.taylor@example.com', '555-2233', '606 Willow St, Hilltop', '2023-09-30'),
(10, 'Olivia', 'Anderson', 'olivia.anderson@example.com', '555-4455', '707 Aspen St, Beachwood', '2023-10-05');

-- Create the Plans table
CREATE TABLE Plans (
    PlanID INT PRIMARY KEY,
    PlanName VARCHAR(50),
    MonthlyFee DECIMAL(10, 2),
    DataLimit INT,  -- in GB
    TalkMinutes INT, -- per month
    TextLimit INT    -- per month
);

-- Insert 5 sample records into the Plans table
INSERT INTO Plans (PlanID, PlanName, MonthlyFee, DataLimit, TalkMinutes, TextLimit)
VALUES
(1, 'Basic Plan', 29.99, 5, 500, 1000),
(2, 'Standard Plan', 49.99, 20, 1000, 5000),
(3, 'Premium Plan', 79.99, 50, 2000, 10000),
(4, 'Unlimited Plan', 99.99, 100, 3000, 20000),
(5, 'Family Plan', 129.99, 150, 5000, 30000);

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    PlanID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES TCustomers(CustomerID),
    FOREIGN KEY (PlanID) REFERENCES Plans(PlanID)
);

-- Insert 10 sample records into the Transactions table
INSERT INTO Transactions (TransactionID, CustomerID, PlanID, TransactionDate, Amount)
VALUES
(1, 1, 1, '2023-01-15', 29.99),
(2, 2, 2, '2023-02-20', 49.99),
(3, 3, 3, '2023-03-10', 79.99),
(4, 4, 2, '2023-04-25', 49.99),
(5, 5, 1, '2023-05-15', 29.99),
(6, 6, 4, '2023-06-22', 99.99),
(7, 7, 3, '2023-07-09', 79.99),
(8, 8, 5, '2023-08-12', 129.99),
(9, 9, 2, '2023-09-30', 49.99),
(10, 10, 4, '2023-10-05', 99.99);

-- Create the NoSQL-like structure for MobileDevices (example for NoSQL usage)
CREATE TABLE MobileDevices (
    DeviceID INT PRIMARY KEY,
    CustomerID INT,
    DeviceModel VARCHAR(100),
    PurchaseDate DATE,
    Price DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES TCustomers(CustomerID)
);

-- Insert 5 sample records into the MobileDevices table
INSERT INTO MobileDevices (DeviceID, CustomerID, DeviceModel, PurchaseDate, Price)
VALUES
(1, 1, 'iPhone 13', '2023-01-22', 899.99),
(2, 2, 'Samsung Galaxy S21', '2023-02-25', 999.99),
(3, 3, 'Google Pixel 6', '2023-03-15', 599.99),
(4, 4, 'OnePlus 9', '2023-04-28', 729.99),
(5, 5, 'iPhone 12', '2023-05-18', 699.99),
(6, 6, 'iPhone 13', '2023-01-22', 899.99);



CREATE TABLE Customers_Orders (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    DateJoined DATE,
	PlanID INT,
    PlanName VARCHAR(50),
    MonthlyFee DECIMAL(10, 2),
    DataLimit INT,  -- in GB
    TalkMinutes INT, -- per month
    TextLimit INT,    -- per month
	TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
	DeviceID INT,
    DeviceModel VARCHAR(100),
    PurchaseDate DATE,
    Price DECIMAL(10, 2) 
);

insert into Customers_Orders
select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Phone,c.Address,c.DateJoined,p.PlanID,p.PlanName,p.MonthlyFee,
 p.DataLimit,p.TalkMinutes,p.TextLimit,t.TransactionID,t.TransactionDate,m.Price,m.DeviceID,m.DeviceModel,m.PurchaseDate,m.Price 
 from Transactions as t
 left join TCustomers as c on  t.customerID = c.CustomerID 
 left join Plans as p on t.PlanID = p.PlanID
 left join MobileDevices as m on t.PlanID = m.DeviceID


 select Email FROM TCustomers