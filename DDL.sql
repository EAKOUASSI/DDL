-- Table CUSTOMER
CREATE TABLE Customer (
  Customer_id   VARCHAR2(20) PRIMARY KEY,
  Customer_Name VARCHAR2(20) NOT NULL,
  Customer_Tel  NUMBER
);

-- Table PRODUCT
CREATE TABLE Product (
  Product_id   VARCHAR2(20) PRIMARY KEY,
  Product_Name VARCHAR2(20) NOT NULL,
  Price        NUMBER CHECK (Price > 0)
);

-- Table ORDERS
CREATE TABLE Orders (
  Customer_id   VARCHAR2(20),
  Product_id    VARCHAR2(20),
  Quantity      NUMBER,
  Total_amount  NUMBER,
  CONSTRAINT pk_orders PRIMARY KEY (Customer_id, Product_id),
  CONSTRAINT fk_customer FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
  CONSTRAINT fk_product FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

-- Ajouter une colonne Category dans la table Product
ALTER TABLE Product
ADD Category VARCHAR2(20);

-- Ajouter une colonne OrderDate dans la table Orders avec une valeur par défaut
ALTER TABLE Orders
ADD OrderDate DATE DEFAULT SYSDATE;
