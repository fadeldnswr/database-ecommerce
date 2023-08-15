CREATE DATABASE eCommerce;
-- Membuat Database E-Commerce yang terdiri dari tabel data Staff, Customer, Item, Item Type, Detail Transaksi,
-- dan Header Transaksi
USE eCommerce;
SHOW TABLES;

CREATE TABLE ItemType(
    ItemTypeID CHAR(5) PRIMARY KEY NOT NULL,
    ItemTypeName VARCHAR(50) NOT NULL
);

CREATE TABLE Item(
    ItemID CHAR(5) PRIMARY KEY,
    ItemTypeID CHAR(5) REFERENCES ItemType ON UPDATE CASCADE ON DELETE CASCADE,
    ItemName VARCHAR(50),
    Price NUMERIC(11,2),
    Quantity INT
);

CREATE TABLE HeaderSellTransaction(
    TransactionID CHAR(5) PRIMARY KEY,
    CustomerID CHAR(5) REFERENCES Customer ON UPDATE CASCADE ON DELETE CASCADE,
    StaffID CHAR(10) REFERENCES Staff ON UPDATE CASCADE ON DELETE CASCADE,
    TransactionDate DATE,
    PaymentType VARCHAR(20)
);

CREATE TABLE DetailSellTransaction(
    TransactionID CHAR(5) REFERENCES HeaderSellTransaction ON UPDATE CASCADE ON DELETE CASCADE,
    ItemID CHAR(5) REFERENCES Item ON UPDATE CASCADE ON DELETE CASCADE,
    SellQuantity INT,
    PRIMARY KEY(TransactionID, ItemID)
);

CREATE TABLE Customer(
    CustomerID CHAR(5) NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    CustomerGender VARCHAR(10),
    CustomerPhone VARCHAR(15),
    CustomerAddress VARCHAR(100),
    CONSTRAINT cekCustomerGender CHECK ( CustomerGender = 'Male' OR CustomerGender = 'Female')
);

CREATE TABLE Staff(
    StaffID CHAR(5) NOT NULL PRIMARY KEY,
    StaffName VARCHAR(50) NOT NULL,
    StaffGender VARCHAR(10),
    StaffPhone VARCHAR(15),
    StaffAddress VARCHAR(100),
    StaffSalary NUMERIC(11,2),
    StaffPosition VARCHAR(20),
    CONSTRAINT cekStaffGender CHECK ( StaffGender = 'Male' OR StaffGender = 'Female' )
);

-- Menampilkan Tabel Data dari Database E-Commerce
SELECT * FROM Customer;
SELECT * FROM Staff;
SELECT * FROM ItemType;
SELECT * FROM Item;
SELECT * FROM DetailSellTransaction;
SELECT * FROM HeaderSellTransaction;


