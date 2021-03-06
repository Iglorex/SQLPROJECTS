CREATE DATABASE SHOPRTVAGD
USE SHOPRTVAGD


CREATE TABLE PRODUCT (
	PROD_ID VARCHAR (10) PRIMARY KEY,
	PROD_NAME VARCHAR (50) NOT NULL,
	PROD_DESCRIPTION VARCHAR (500),
	PROD_PRICE MONEY CHECK (PROD_PRICE > 0),
	STOCK INT CHECK (STOCK > 0 OR STOCK = 0))


SELECT * FROM PRODUCT
INSERT INTO PRODUCT VALUES ('P001', 'XIAOMIMI10', 'NEW', 500, 100)
INSERT INTO PRODUCT VALUES ('P002', 'IPHONE5', 'NEW', 1500, 50)
INSERT INTO PRODUCT VALUES ('P003', 'MOTOROLA50', 'NEW', 300, 1000)
INSERT INTO PRODUCT VALUES ('P004', 'SOUNA24', 'NEW', 1000, 25)
INSERT INTO PRODUCT VALUES ('P005', 'BOSCHREF420', 'NEW', 350, 100)
INSERT INTO PRODUCT VALUES ('P006', 'DELLOBSCURE12', 'NEW', 5000, 500)
INSERT INTO PRODUCT VALUES ('P007', 'SAMSUNG TV X300', 'NEW', 3000, 200)
INSERT INTO PRODUCT VALUES ('P008', 'XIAOMI KETTLE NICE2', 'NEW', 300, 10) 


CREATE TABLE ORDERS (
	ORDER_ID VARCHAR (10) PRIMARY KEY,
	PROD_ID VARCHAR (10) FOREIGN KEY REFERENCES PRODUCT (PROD_ID),
	PROD_NAME VARCHAR (50) NOT NULL, 
	PROD_PRICE MONEY,
	CUSTOMER_NAME VARCHAR (50) NOT NULL,
	[ORDER_DATE] DATETIME,
	[SHIP_DATE] DATETIME,
	SHIP_CITY VARCHAR (15) NULL,
	SHIP_COUNTRY VARCHAR (15) NULL,
	QUANTITY INT CHECK (QUANTITY > 0))


SELECT * FROM ORDERS
INSERT INTO ORDERS VALUES ('O401', 'P001', 'XIAOMIMI10', 500, 'JAKE PAUL', '3/22/2020', '3/25/2020', 'LOS ANGELES', 'USA', 2)
INSERT INTO ORDERS VALUES ('O402', 'P002', 'IPHONE5', 1500, 'JOHN LENNON', '3/27/2020', '3/30/2020', 'LOS SONTOS', 'USA', 4)
INSERT INTO ORDERS VALUES ('O403', 'P003', 'MOTOROLA50', 300, 'GEORGE HARRISON', '4/10/2020', '4/13/2020', 'NEBRASKA', 'USA', 5)
INSERT INTO ORDERS VALUES ('O404', 'P004', 'SOUNA24', 1000, 'JAMES JOYCE', '4/15/2020', '4/18/2020', 'PENNSYLVANIA', 'USA', 10)
INSERT INTO ORDERS VALUES ('O405', 'P005', 'BOSCHREF420', 350, 'DION DIMUCCI', '5/4/2020', '5/7/2020', 'MILWAUKEE', 'USA', 10)
INSERT INTO ORDERS VALUES ('O406', 'P006', 'DELLOBSCURE12', 5000, 'ELISABETH HARMON', '5/10/2020', '5/13/2020', 'CRACOW', 'POLAND', 20)
INSERT INTO ORDERS VALUES ('O407', 'P007', 'SAMSUNG TV X300', 3000, 'ELVIS PRESLEY', '5/18/2020', '5/21/2020', 'WARSAW', 'POLAND', 20)
INSERT INTO ORDERS VALUES ('O408', 'P008', 'XIAOMI KETTLE NICE2', 300, 'TATIANA MASLANY', '6/6/2020', '6/9/2020', 'KATOWICE', 'POLAND', 2)


CREATE TABLE CATEGORIES (
	CATEGORY_ID VARCHAR (10) PRIMARY KEY,
	CATEGORY_NAME VARCHAR (50) NOT NULL,
	PROD_ID VARCHAR (10) FOREIGN KEY REFERENCES PRODUCT (PROD_ID),
	PROD_NAME VARCHAR (50) NOT NULL,
	PROD_PRICE MONEY,
	CATEGORY_DESCRIPTION VARCHAR (500) NOT NULL,
	QUANTITY INT CHECK (QUANTITY > 0))


SELECT * FROM CATEGORIES
INSERT INTO CATEGORIES VALUES ('CATEGORY01', 'PHONES', 'P001', 'XIAOMIMI10', 500, 'A WELL KNOWN PHONE', 100)
INSERT INTO CATEGORIES VALUES ('CATEGORY02', 'APPLE PHONES', 'P002', 'IPHONE5', 1500, '64 GB SPACE PHONE', 50)
INSERT INTO CATEGORIES VALUES ('CATEGORY03', 'OLD PHONES', 'P003', 'MOTOROLA50', 300, 'OLD MODEL OF MOTOROLA PHONE', 1000)
INSERT INTO CATEGORIES VALUES ('CATEGORY04', 'KETTLES', 'P004', 'SOUNA24', 1000, 'TEMPERATURE REGULATION', 25)
INSERT INTO CATEGORIES VALUES ('CATEGORY05', 'REFRIGERATORS', 'P005', 'BOSCHREF420', 350, 'GREAT REFRIGERATOR', 100)
INSERT INTO CATEGORIES VALUES ('CATEGORY06', 'COMPUTERS', 'P006', 'DELLOBSCURE12', 5000, 'GREAT DELL LAPTOP', 500)
INSERT INTO CATEGORIES VALUES ('CATEGORY07', 'TELEVISIONS', 'P007', 'SAMSUNG TV X300', 3000, 'NICE LCD TV', 200)
INSERT INTO CATEGORIES VALUES ('CATEGORY08', 'CHINESE KETTLES', 'P008', 'XIAOMI KETTLE NICE2', 300, 'NO TEMPERATURE REGULATION', 10)


CREATE TABLE CUSTOMER (
	CUSTOMER_ID VARCHAR (10) PRIMARY KEY,
	CUSTOMER_NAME VARCHAR (50) NOT NULL,
	CUSTOMER_PHONE VARCHAR (11) NOT NULL,
	CUSTOMER_EAMIL VARCHAR (50) UNIQUE,
	CUSTOMER_ADRESS VARCHAR (100) NOT NULL)


SELECT * FROM CUSTOMER
INSERT INTO CUSTOMER VALUES ('CUS111', 'JAKE PAUL', '82045634511', 'JAKEPAUL@GMAIL.COM', 'LOS ANGELES')
INSERT INTO CUSTOMER VALUES ('CUS122', 'JOHN LENNON', '21367898743', 'JOHNLENNON@GMAIL.COM', 'LOS SONTOS')
INSERT INTO CUSTOMER VALUES ('CUS133', 'GEORGE HARRISON', '42567895412', 'GEORGEHARRISON@GMAIL.COM', 'NEBRASKA')
INSERT INTO CUSTOMER VALUES ('CUS144', 'JAMES JOYCE', '23454356790', 'JAMESJOYCE@GMAIL.COM', 'PENNSYLVANIA')
INSERT INTO CUSTOMER VALUES ('CUS155', 'DION DIMUCCI', '12045067034', 'DIONDIMUCCI@GMAIL.COM', 'MILWAUKEE')
INSERT INTO CUSTOMER VALUES ('CUS166', 'ELISABETH HARMON', '42045632069', 'ELISABETHHARMON@GMAIL.COM', 'CRACOW')
INSERT INTO CUSTOMER VALUES ('CUS177', 'ELVIS PRESLEY', '90889078677', 'ELVISPRESLEY@GMAIL.COM', 'WARSAW')
INSERT INTO CUSTOMER VALUES ('CUS188', 'TATIANA MASLANY', '30304040120', 'TATIANAMASLANY@GMAIL.COM', 'KATOWICE')


CREATE TABLE INVOICE (
	INVOICE_ID VARCHAR (10) PRIMARY KEY,
	CUSTOMER_ID VARCHAR (10) FOREIGN KEY REFERENCES CUSTOMER (CUSTOMER_ID),
	[DATE] DATETIME)


SELECT * FROM INVOICE
INSERT INTO INVOICE VALUES ('I161', 'CUS111', '3/22/2020')
INSERT INTO INVOICE VALUES ('I162', 'CUS122', '3/27/2020')
INSERT INTO INVOICE VALUES ('I163', 'CUS133', '4/10/2020')
INSERT INTO INVOICE VALUES ('I164', 'CUS144', '4/15/2020')
INSERT INTO INVOICE VALUES ('I165', 'CUS155', '5/4/2020')
INSERT INTO INVOICE VALUES ('I166', 'CUS166', '5/10/2020')
INSERT INTO INVOICE VALUES ('I167', 'CUS177', '5/18/2020')
INSERT INTO INVOICE VALUES ('I168', 'CUS188', '6/6/2020')


CREATE TABLE INVOICE_PRODUCT (
	INVOICE_ID VARCHAR (10) FOREIGN KEY REFERENCES INVOICE (INVOICE_ID),
	PROD_ID VARCHAR (10) FOREIGN KEY REFERENCES PRODUCT (PROD_ID),
	QUANTITY INT CHECK (QUANTITY > 0))


SELECT * FROM INVOICE_PRODUCT
INSERT INTO INVOICE_PRODUCT VALUES ('I161', 'P001', 100)
INSERT INTO INVOICE_PRODUCT VALUES ('I162', 'P002', 50)
INSERT INTO INVOICE_PRODUCT VALUES ('I163', 'P003', 1000)
INSERT INTO INVOICE_PRODUCT VALUES ('I164', 'P004', 25)
INSERT INTO INVOICE_PRODUCT VALUES ('I165', 'P005', 100)
INSERT INTO INVOICE_PRODUCT VALUES ('I166', 'P006', 500)
INSERT INTO INVOICE_PRODUCT VALUES ('I167', 'P007', 200)
INSERT INTO INVOICE_PRODUCT VALUES ('I168', 'P008', 10)

CREATE TABLE PRODUCT_STORAGE (
	PRODUCT_STORAGE_ID VARCHAR (5) PRIMARY KEY,
	PROD_ID VARCHAR (10) FOREIGN KEY REFERENCES PRODUCT (PROD_ID),
	PROD_NAME VARCHAR (50),
	STOCK INT CHECK (STOCK > 0 OR STOCK = 0))

SELECT * FROM PRODUCT_STORAGE
INSERT INTO PRODUCT_STORAGE VALUES ('P01', 'P001', 'XIAOMIMI10', 100)
INSERT INTO PRODUCT_STORAGE VALUES ('P02', 'P002', 'IPHONE5', 50)
INSERT INTO PRODUCT_STORAGE VALUES ('P03', 'P003', 'MOTOROLA50', 1000)
INSERT INTO PRODUCT_STORAGE VALUES ('P04', 'P004', 'SOUNA24', 25)
INSERT INTO PRODUCT_STORAGE VALUES ('P05', 'P005', 'BOSCHREF420', 100)
INSERT INTO PRODUCT_STORAGE VALUES ('P06', 'P006', 'DELLOBSCURE12', 500)
INSERT INTO PRODUCT_STORAGE VALUES ('P07', 'P007', 'SAMSUNG TV X300', 200)
INSERT INTO PRODUCT_STORAGE VALUES ('P08', 'P008', 'XIAOMI KETTLE NICE2', 10)


CREATE TABLE FEEDBACK (
	PROD_ID VARCHAR (10) FOREIGN KEY REFERENCES PRODUCT (PROD_ID),
	CUSTOMER_ID VARCHAR (10) FOREIGN KEY REFERENCES CUSTOMER (CUSTOMER_ID),
	CUSTOMER_NAME VARCHAR (50) NOT NULL,
	COMMENT VARCHAR (300) UNIQUE,
	[DATE] DATETIME)


SELECT * FROM FEEDBACK
INSERT INTO FEEDBACK VALUES ('P001', 'CUS111', 'JAKE PAUL', 'GREAT DEVICES!', '3/27/2020')
INSERT INTO FEEDBACK VALUES ('P002', 'CUS122', 'JOHN LENNON', 'COULD HAVE BEEN BETTER...', '4/2/2020')
INSERT INTO FEEDBACK VALUES ('P003', 'CUS133', 'GEORGE HARRISON', 'NICE ONE!', '4/17/2020')
INSERT INTO FEEDBACK VALUES ('P004', 'CUS144', 'JAMES JOYCE', 'I HAVE NO COMPLAINTS TO THE SHIPPING PROCESS', '4/23/2020')
INSERT INTO FEEDBACK VALUES ('P005', 'CUS155', 'DION DIMUCCI', 'WELL, I RECEIVED A BROKEN ONES..', '5/12/2020')
INSERT INTO FEEDBACK VALUES ('P006', 'CUS166', 'ELISABETH HARMON', 'I ACCEPT IT', '5/18/2020')
INSERT INTO FEEDBACK VALUES ('P007', 'CUS177', 'ELVIS PRESLEY', 'EVERYTHING PERFECT!', '5/28/2020')
INSERT INTO FEEDBACK VALUES ('P008', 'CUS188', 'TATIANA MASLANY', 'NO COMPLAINTS SO FAR, GREAT CUSTOMER SERVICE!', '6/14/2020')


CREATE TABLE MANAGEACCOUNT (
	ACC_NAME VARCHAR (30) NOT NULL,
	ACC_PASS VARCHAR (20) NOT NULL,
	ACC_PHONE VARCHAR (11) NOT NULL,
	ACC_ADDRESS VARCHAR (50) NOT NULL,
	ACC_EMAIL VARCHAR (50) UNIQUE,
	[STATUS] VARCHAR (20) CHECK ([STATUS] = 'ACTIVATE' OR [STATUS] = 'DEACTIVATE'))


SELECT * FROM MANAGEACCOUNT
INSERT INTO MANAGEACCOUNT VALUES ('JAKEPAUL410', 'LUEXPOL32', '82045634511', 'LOS ANGELES', 'JAKEPAUL410@GMAIL.COM', 'ACTIVATE')
INSERT INTO MANAGEACCOUNT VALUES ('JOHNLENNY908', 'IHN1020', '21367898743', 'LOS SONTOS', 'JOHNILENNY@GMAIL.COM', 'ACTIVATE')
INSERT INTO MANAGEACCOUNT VALUES ('GEORGEHARROS23', 'POLKIERROE2', '42567895412', 'NEBRASKA', 'GEORGEHARROS@GMAIL.COM', 'ACTIVATE')
INSERT INTO MANAGEACCOUNT VALUES ('JAMIEJOYCEULISSES20', 'NAMATSU2314', '23454356790', 'PENNSYLVANIA', 'JAMESJOYCE20@GMAIL.COM', 'ACTIVATE')
INSERT INTO MANAGEACCOUNT VALUES ('DIONDIONDIMUCICI20', 'OLIFRLAME234', '12045067034', 'MILWAUKEE', 'DIONMUCCI@GMAIL.COM', 'ACTIVATE')
INSERT INTO MANAGEACCOUNT VALUES ('ELAHARMONES40', 'DESPACITOEFD56', '42045632069', 'CRACOW', 'ELAHARMS203@GMAIL.COM', 'ACTIVATE')
INSERT INTO MANAGEACCOUNT VALUES ('ELVISPELVIS20', 'MONKEWE456', '90889078677', 'WARSAW', 'PELVISELVIS20@GMAIL.COM', 'ACTIVATE')
INSERT INTO MANAGEACCOUNT VALUES ('TATIANAOFTHE10', 'POUID40', '30304040120', 'KATOWICE', 'TATIANATHEMAN30@GMAIL.COM', 'ACTIVATE')





