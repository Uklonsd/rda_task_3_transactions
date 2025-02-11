USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
SELECT 1, '2023-01-01'
WHERE NOT EXISTS (SELECT 1 FROM Orders WHERE ID = 1);

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 5);

START TRANSACTION;
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
COMMIT;
