--USE master

--IF EXISTS (SELECT name FROM master.sys.databases WHERE name='SalesDB')
--DROP DATABASE SalesDB
--GO

--CREATE DATABASE SalesDB
--GO

USE SalesDB; 
GO

--CREATE TABLE Sellers 
--( 
--SellerID int PRIMARY KEY IDENTITY(1,1), 
--FullName nvarchar(100) NOT NULL,
--Email nvarchar(100) NOT NULL,
--Phone nvarchar(10) NOT NULL
--);

--CREATE TABLE Buyers
--( 
--BuyerID int PRIMARY KEY IDENTITY(1,1), 
--FullName nvarchar(100) NOT NULL,
--Email nvarchar(100) NOT NULL,
--Phone nvarchar(10) NOT NULL
--);

--CREATE TABLE Sale
--( 
--SaleID int PRIMARY KEY IDENTITY(1,1),
--SellerID int FOREIGN KEY REFERENCES Sellers(SellerID), 
--BuyerID int FOREIGN KEY REFERENCES Buyers(BuyerID), 
--ProductName nvarchar(100) NOT NULL,
--Price money NOT NULL,
--SaleDate date NOT NULL
--);
CREATE INDEX i_seller ON Sellers(FullName);
GO

CREATE INDEX i_buyer ON Buyers(FullName);
GO

CREATE NONCLUSTERED INDEX i_phone ON Buyers(Phone);
GO

CREATE INDEX i_sale ON Sale(SaleID, ProductName);
GO

CREATE NONCLUSTERED INDEX i_sale_all
ON Sale (SaleID)  
INCLUDE (SellerID, BuyerID, ProductName, Price, SaleDate); 
GO

CREATE NONCLUSTERED INDEX i_price_filter
ON Sale(Price)
WHERE Price >1000;
GO