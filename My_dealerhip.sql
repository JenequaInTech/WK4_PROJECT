CREATE TABLE Salesperson (
    SalespersonID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
    HireDate DATE
);

CREATE TABLE Car (
    CarID INT PRIMARY KEY,
    SerialNumber VARCHAR(255),
    Make VARCHAR(255),
    Model VARCHAR(255),
    Year INT,
    NewOrUsed BOOLEAN,
    SalespersonID INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Date DATE,
    SalespersonID INT,
    CustomerID INT,
    CarID INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE Mechanic (
    MechanicID INT PRIMARY KEY,
    CustomerName VARCHAR(225),
    CarID INT,
    CarMake VARCHAR(225),
    CarModel VARCHAR(225),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE ServiceHistory (
    ServiceID INT PRIMARY KEY,
    ServiceType VARCHAR(225),
    MechanicID INT,
    CustomerName VARCHAR(225),
    ServiceTicketID INT,
    FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID),
    FOREIGN KEY (ServiceTicketID) REFERENCES ServiceTicket(ServiceTicketID)
);

CREATE TABLE ServiceTicket (
    ServiceTicketID INT PRIMARY KEY,
    Date DATE,
    Description VARCHAR(225),
    CarID INT,
    CustomerName VARCHAR(225),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);