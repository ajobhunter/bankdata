# 1. Select all the data from the products, including all the data for each product's manufacturer. 

SELECT * 
FROM Products, Manufacturers 
WHERE Products.Manufacturer = Manufacturers.Code; 

SELECT * 
FROM Products INNER JOIN Manufacturers 
ON Products.Manufacturer = Manufacturers.Code;

# 2. Select the product name, price, and manufacturer name of all the products. 

SELECT Products.Name, Price, Manufacturers.Name 
FROM Products, Manufacturers 
WHERE Products.Manufacturer = Manufacturers.Code; 

SELECT Products.Name, Price, Manufacturers.Name 
FROM Products 
INNER JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code;

# 3. Select the average price of each manufacturer's products, showing only the manufacturer's code. 

SELECT AVG(Price), Manufacturer 
FROM Products 
GROUP BY Manufacturer;

# 4. Select the average price of each manufacturer's products, showing the manufacturer's name. 

SELECT AVG(Price), Manufacturers.Name 
FROM Products, Manufacturers 
WHERE Products.Manufacturer = Manufacturers.Code 
GROUP BY Manufacturers.Name; 

SELECT AVG(Price), Manufacturers.Name 
FROM Products 
INNER JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code 
GROUP BY Manufacturers.Name;

# 5. Select the names of manufacturer whose products have an average price larger than or equal to $150. 

SELECT AVG(Price), Manufacturers.Name 
FROM Products, Manufacturers 
WHERE Products.Manufacturer = Manufacturers.Code 
GROUP BY Manufacturers.Name 
HAVING AVG(Price) >= 150; 

SELECT AVG(Price), Manufacturers.Name 
FROM Products 
INNER JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code GROUP BY Manufacturers.Name 
HAVING AVG(Price) >= 150;

# 6. Select the name and price of the cheapest product. 

SELECT Name, Price 
FROM Products 
WHERE Price = (SELECT MIN(Price) FROM Products);

# 7. Select the name of each manufacturer along with the name and price of its most expensive product. 

SELECT A.Name, A.Price, F.Name 
FROM Products A, Manufacturers F 
WHERE A.Manufacturer = F.Code AND A.Price = 
( SELECT MAX(A.Price) 
FROM Products A 
WHERE A.Manufacturer = F.Code ); 

SELECT A.Name, A.Price, F.Name 
FROM Products A 
INNER JOIN Manufacturers F ON A.Manufacturer = F.Code AND A.Price = ( 
SELECT MAX(A.Price) FROM Products A WHERE A.Manufacturer = F.Code );

CREATE VIEW MINPRICEPRODUCT AS
SELECT Name, Price 
FROM Products 
WHERE Price = (SELECT MIN(Price) FROM Products);

select * from MINPRICEPRODUCT;


