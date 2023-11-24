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
create index i_seller on Sellers(FullName);
GO
create index i_buyer on Buyers(FullName);
GO
create nonclustered index i_phone on Buyers(Phone);
GO
create index i_sale on Sale(SaleID, ProductName);
GO