-- --------------------------------------------------------
-- Host:                         145.239.255.230
-- Server version:               10.4.8-MariaDB-1:10.4.8+maria~bionic - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for test
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `test`;

-- Dumping structure for table test.KV_BankAccount
CREATE TABLE IF NOT EXISTS `KV_BankAccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountNumber` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  `retailerId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_BankAccount: ~0 rows (approximately)
DELETE FROM `KV_BankAccount`;
/*!40000 ALTER TABLE `KV_BankAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_BankAccount` ENABLE KEYS */;

-- Dumping structure for table test.KV_Branch
CREATE TABLE IF NOT EXISTS `KV_Branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retailerId` int(11) NOT NULL,
  `branchName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locationName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wardName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactNumber` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Branch: ~0 rows (approximately)
DELETE FROM `KV_Branch`;
/*!40000 ALTER TABLE `KV_Branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Branch` ENABLE KEYS */;

-- Dumping structure for table test.KV_Category
CREATE TABLE IF NOT EXISTS `KV_Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `categoryName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Category: ~0 rows (approximately)
DELETE FROM `KV_Category`;
/*!40000 ALTER TABLE `KV_Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Category` ENABLE KEYS */;

-- Dumping structure for table test.KV_Customer
CREATE TABLE IF NOT EXISTS `KV_Customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `contactNumber` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailerId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `locationName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wardName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `organization` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groups` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debt` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Customer: ~0 rows (approximately)
DELETE FROM `KV_Customer`;
/*!40000 ALTER TABLE `KV_Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Customer` ENABLE KEYS */;

-- Dumping structure for table test.KV_Invoice
CREATE TABLE IF NOT EXISTS `KV_Invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchaseDate` datetime NOT NULL,
  `branchId` int(11) NOT NULL,
  `soldById` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `orderCode` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `totalPayment` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `status` int(11) NOT NULL,
  `usingCod` tinyint(1) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Invoice: ~0 rows (approximately)
DELETE FROM `KV_Invoice`;
/*!40000 ALTER TABLE `KV_Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Invoice` ENABLE KEYS */;

-- Dumping structure for table test.KV_InvoiceDetail
CREATE TABLE IF NOT EXISTS `KV_InvoiceDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `productCode` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `subTotal` decimal(10,0) NOT NULL,
  `returnQuantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_InvoiceDetail: ~0 rows (approximately)
DELETE FROM `KV_InvoiceDetail`;
/*!40000 ALTER TABLE `KV_InvoiceDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_InvoiceDetail` ENABLE KEYS */;

-- Dumping structure for table test.KV_Order
CREATE TABLE IF NOT EXISTS `KV_Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchaseDate` datetime NOT NULL,
  `branchId` int(11) NOT NULL,
  `soldById` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `totalPayment` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `status` int(11) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `usingCod` tinyint(1) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Order: ~0 rows (approximately)
DELETE FROM `KV_Order`;
/*!40000 ALTER TABLE `KV_Order` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Order` ENABLE KEYS */;

-- Dumping structure for table test.KV_OrderDetail
CREATE TABLE IF NOT EXISTS `KV_OrderDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `productCode` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `discountRatio` decimal(10,0) NOT NULL,
  `orderId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_OrderDetail: ~0 rows (approximately)
DELETE FROM `KV_OrderDetail`;
/*!40000 ALTER TABLE `KV_OrderDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_OrderDetail` ENABLE KEYS */;

-- Dumping structure for table test.KV_Product
CREATE TABLE IF NOT EXISTS `KV_Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailerId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `allowsSale` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL,
  `hasVariants` tinyint(1) NOT NULL,
  `basePrice` decimal(10,0) NOT NULL,
  `weight` int(11) NOT NULL,
  `unit` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `masterProductId` int(11) NOT NULL,
  `conversionValue` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `isLotSerialControl` tinyint(1) NOT NULL,
  `isBatchExpireControl` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `discountRatio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Product: ~0 rows (approximately)
DELETE FROM `KV_Product`;
/*!40000 ALTER TABLE `KV_Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Product` ENABLE KEYS */;

-- Dumping structure for table test.KV_ProductAttribute
CREATE TABLE IF NOT EXISTS `KV_ProductAttribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `attributeName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributeValue` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_ProductAttribute: ~0 rows (approximately)
DELETE FROM `KV_ProductAttribute`;
/*!40000 ALTER TABLE `KV_ProductAttribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_ProductAttribute` ENABLE KEYS */;

-- Dumping structure for table test.KV_ProductImage
CREATE TABLE IF NOT EXISTS `KV_ProductImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `imageUrl` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_ProductImage: ~0 rows (approximately)
DELETE FROM `KV_ProductImage`;
/*!40000 ALTER TABLE `KV_ProductImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_ProductImage` ENABLE KEYS */;

-- Dumping structure for table test.KV_ProductInventory
CREATE TABLE IF NOT EXISTS `KV_ProductInventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchId` int(11) NOT NULL,
  `branchName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` decimal(10,0) NOT NULL,
  `onHand` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_ProductInventory: ~0 rows (approximately)
DELETE FROM `KV_ProductInventory`;
/*!40000 ALTER TABLE `KV_ProductInventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_ProductInventory` ENABLE KEYS */;

-- Dumping structure for table test.KV_PurchaseOrder
CREATE TABLE IF NOT EXISTS `KV_PurchaseOrder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailerId` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchId` int(11) NOT NULL,
  `purchaseDate` datetime NOT NULL,
  `discountRatio` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `totalPayment` decimal(10,0) NOT NULL,
  `status` int(11) NOT NULL,
  `createdDate` datetime NOT NULL,
  `supplierId` int(11) NOT NULL,
  `purchaseById` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Nhập hàng';

-- Dumping data for table test.KV_PurchaseOrder: ~0 rows (approximately)
DELETE FROM `KV_PurchaseOrder`;
/*!40000 ALTER TABLE `KV_PurchaseOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_PurchaseOrder` ENABLE KEYS */;

-- Dumping structure for table test.KV_PurchaseOrderDetail
CREATE TABLE IF NOT EXISTS `KV_PurchaseOrderDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `productCode` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `purchaseOrderId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chi tiết nhập hàng';

-- Dumping data for table test.KV_PurchaseOrderDetail: ~0 rows (approximately)
DELETE FROM `KV_PurchaseOrderDetail`;
/*!40000 ALTER TABLE `KV_PurchaseOrderDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_PurchaseOrderDetail` ENABLE KEYS */;

-- Dumping structure for table test.KV_Retailer
CREATE TABLE IF NOT EXISTS `KV_Retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retailerName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Retailer: ~0 rows (approximately)
DELETE FROM `KV_Retailer`;
/*!40000 ALTER TABLE `KV_Retailer` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Retailer` ENABLE KEYS */;

-- Dumping structure for table test.KV_Supplier
CREATE TABLE IF NOT EXISTS `KV_Supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Supplier: ~0 rows (approximately)
DELETE FROM `KV_Supplier`;
/*!40000 ALTER TABLE `KV_Supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Supplier` ENABLE KEYS */;

-- Dumping structure for table test.KV_Surcharge
CREATE TABLE IF NOT EXISTS `KV_Surcharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surchargeCode` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surchargeName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailerId` int(11) NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `createdDate` datetime NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Surcharge: ~0 rows (approximately)
DELETE FROM `KV_Surcharge`;
/*!40000 ALTER TABLE `KV_Surcharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Surcharge` ENABLE KEYS */;

-- Dumping structure for table test.KV_User
CREATE TABLE IF NOT EXISTS `KV_User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retailerId` int(11) NOT NULL,
  `userName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `givenName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobilePhone` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_User: ~0 rows (approximately)
DELETE FROM `KV_User`;
/*!40000 ALTER TABLE `KV_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_User` ENABLE KEYS */;

-- Dumping structure for table test.KV_Webhook
CREATE TABLE IF NOT EXISTS `KV_Webhook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test.KV_Webhook: ~0 rows (approximately)
DELETE FROM `KV_Webhook`;
/*!40000 ALTER TABLE `KV_Webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `KV_Webhook` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
