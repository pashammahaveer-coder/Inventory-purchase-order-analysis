-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: supply_chain_analytics
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `inventory_snapshot`
--

DROP TABLE IF EXISTS `inventory_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_snapshot` (
  `Snapshot_Month` date NOT NULL,
  `Warehouse_ID` varchar(20) NOT NULL,
  `Product_ID` varchar(20) NOT NULL,
  `Stock_Units` int DEFAULT NULL,
  `Inventory_Value` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Snapshot_Month`,`Warehouse_ID`,`Product_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `inventory_snapshot_ibfk_1` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouses` (`Warehouse_ID`),
  CONSTRAINT `inventory_snapshot_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_suppliers`
--

DROP TABLE IF EXISTS `product_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_suppliers` (
  `Product_ID` varchar(20) NOT NULL,
  `Supplier_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`Product_ID`,`Supplier_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  CONSTRAINT `product_suppliers_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`),
  CONSTRAINT `product_suppliers_ibfk_2` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Product_ID` varchar(20) NOT NULL,
  `Product_Name` varchar(100) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Unit_Cost` decimal(10,2) DEFAULT NULL,
  `Unit_Price` decimal(10,2) DEFAULT NULL,
  `Reorder_Level` int DEFAULT NULL,
  `Lead_Time_Days` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_orders` (
  `Purchase_ID` varchar(20) NOT NULL,
  `Order_Date` date DEFAULT NULL,
  `Supplier_ID` varchar(20) DEFAULT NULL,
  `Warehouse_ID` varchar(20) DEFAULT NULL,
  `Product_ID` varchar(20) DEFAULT NULL,
  `Ordered_Units` int DEFAULT NULL,
  `Unit_Cost` decimal(10,2) DEFAULT NULL,
  `Expected_Delivery_Date` date DEFAULT NULL,
  `Delivery_Delay_Days` int DEFAULT NULL,
  `Actual_Delivery_Date` date DEFAULT NULL,
  `Received_Units` int DEFAULT NULL,
  `Purchase_Value` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Purchase_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `purchase_orders_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`),
  CONSTRAINT `purchase_orders_ibfk_2` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouses` (`Warehouse_ID`),
  CONSTRAINT `purchase_orders_ibfk_3` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_orders_staging`
--

DROP TABLE IF EXISTS `purchase_orders_staging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_orders_staging` (
  `Purchase_ID` varchar(20) NOT NULL,
  `Order_Date` date DEFAULT NULL,
  `Supplier_ID` varchar(20) DEFAULT NULL,
  `Warehouse_ID` varchar(20) DEFAULT NULL,
  `Product_ID` varchar(20) DEFAULT NULL,
  `Ordered_Units` int DEFAULT NULL,
  `Unit_Cost` decimal(10,2) DEFAULT NULL,
  `Expected_Delivery_Date` date DEFAULT NULL,
  `Delivery_Delay_Days` int DEFAULT NULL,
  `Actual_Delivery_Date` date DEFAULT NULL,
  `Received_Units` int DEFAULT NULL,
  `Purchase_Value` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Purchase_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  KEY `Product_ID` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_transactions`
--

DROP TABLE IF EXISTS `sales_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_transactions` (
  `Sale_ID` varchar(20) NOT NULL,
  `Sale_Date` date DEFAULT NULL,
  `Warehouse_ID` varchar(20) DEFAULT NULL,
  `Product_ID` varchar(20) DEFAULT NULL,
  `Quantity_Sold` int DEFAULT NULL,
  `Unit_Price` decimal(10,2) DEFAULT NULL,
  `Unit_Cost` decimal(10,2) DEFAULT NULL,
  `Discount_Pct` decimal(5,4) DEFAULT NULL,
  `Net_Sales` decimal(12,2) DEFAULT NULL,
  `Gross_Profit` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Sale_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `sales_transactions_ibfk_1` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouses` (`Warehouse_ID`),
  CONSTRAINT `sales_transactions_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `Supplier_ID` varchar(20) NOT NULL,
  `Supplier_Name` varchar(100) DEFAULT NULL,
  `Supplier_City` varchar(100) DEFAULT NULL,
  `Supplier_Rating` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `Warehouse_ID` varchar(20) NOT NULL,
  `Warehouse_Name` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Capacity_Units` int DEFAULT NULL,
  PRIMARY KEY (`Warehouse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-01 10:38:00
