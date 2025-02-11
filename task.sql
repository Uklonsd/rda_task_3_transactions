USE ShopDB;
START TRANSACTION;

INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

SELECT WarehouseAmount FROM Products WHERE ID = 1 FOR UPDATE;

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1 AND WarehouseAmount >= 1;

SELECT WarehouseAmount INTO @Stock FROM Products WHERE ID = 1;
COMMIT;