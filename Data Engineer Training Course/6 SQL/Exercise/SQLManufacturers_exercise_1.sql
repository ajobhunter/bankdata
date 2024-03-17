DROP DATABASE IF EXISTS manufacturers;
CREATE DATABASE manufacturers;
use manufacturers;

CREATE TABLE manufacturers (
code int NOT NULL auto_increment,
name varchar(255) NOT NULL,
PRIMARY KEY(code));

CREATE TABLE products 
(code int NOT NULL auto_increment,
name varchar(255) NOT NULL,
price real NOT NULL,
manufacturer int NOT NULL,
PRIMARY KEY(code),
FOREIGN KEY (manufacturer) 
	REFERENCES manufacturers(code));

insert into manufacturers (NAME) VALUES
('Sony'),
('Creative Labs'),
('Hewlett-Packard'),
('Iomega'),
('Fujitsu'),
('Winchester');

insert into products (NAME, PRICE, MANUFACTURER) VALUES
('Hard drive', 240, 5),
('Memory', 120, 6),
('Zip drive', 150, 4),
('Floppy disk', 5, 6),
('Monitor', 240, 1),
('DVD Drive', 180, 2),
('CD Drive', 90, 2),
('Printer', 270, 3),
('Toner Cartridge', 66, 3),
('DVD Burner', 180, 2);

# 1. Select the names of all the products in the store.
SELECT name FROM products;

# 2. Select the names and the prices of all the products in the store.
SELECT name, price FROM products;

# 3. Select the name of the products with a price less than or equal to $200.
SELECT name FROM products WHERE price <= 200;

# 4. Select all the products with a price between $60 and $120.
SELECT * FROM products WHERE price BETWEEN 60 AND 120;

# 5. Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT name, price * 100 AS price_in_cents FROM products;

# 6. Compute the average price of all the products.
SELECT AVG(price) AS average_price FROM products;

# 7. Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(price) AS average_price FROM products WHERE manufacturer = 2;

# 8. Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) AS product_count FROM products WHERE price >= 180;

# 9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT name, price FROM products WHERE price >= 180 ORDER BY price DESC, name ASC;

# 10. Select the name and price of the cheapest product.
SELECT name, price FROM products ORDER BY price ASC LIMIT 1;

# 11. Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO products (name, price, manufacturer) VALUES ('Loudspeakers', 70, 2);

# 12. Update the name of product 8 to "Laser Printer".
UPDATE products SET name = 'Laser Printer' WHERE code = 8;

# 13. Apply a 10% discount to all products.
UPDATE products SET price = price * 0.9;

# 14. Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE products SET price = price * 0.9 WHERE price >= 120;

# 15. Delete the product which have price less than $20.
DELETE FROM products WHERE price < 20;
