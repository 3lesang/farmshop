CREATE DATABASE  IF NOT EXISTS `farmshop2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `farmshop2`;
-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: farmshop2
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'trai cay','trai-cay'),(2,'rau cu','rau-cu'),(3,'thit&trung','thit-trung');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_slider`
--

DROP TABLE IF EXISTS `image_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_slider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_slider_sliders1_idx` (`sliders_id`),
  CONSTRAINT `fk_image_slider_sliders1` FOREIGN KEY (`sliders_id`) REFERENCES `sliders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_slider`
--

LOCK TABLES `image_slider` WRITE;
/*!40000 ALTER TABLE `image_slider` DISABLE KEYS */;
INSERT INTO `image_slider` VALUES (1,'https://c8.alamy.com/comp/MAPC57/vector-cartoon-style-illustration-of-farm-product-shop-facade-with-bright-banner-store-building-exterior-isolated-on-white-background-showcase-prod-MAPC57.jpg',1),(2,'https://img.pikbest.com/templates/20210806/bg/3847bbbb29130.png',2),(3,'https://cdn2.vectorstock.com/i/1000x1000/97/46/farm-fresh-vegetables-banner-vector-25339746.jpg',3),(4,'https://cdn1.vectorstock.com/i/1000x1000/92/80/fruits-and-vegetables-vegetarian-banner-farm-shop-vector-20919280.jpg',4),(5,'https://c8.alamy.com/comp/2GG66W7/online-grocery-and-farm-internet-store-banner-farmer-offering-his-vegetables-from-mobile-phone-screen-eco-farm-online-market-grocery-or-supermarket-2GG66W7.jpg',NULL),(6,'https://cdn1.vectorstock.com/i/1000x1000/93/20/online-farm-market-shop-banner-poster-vector-24229320.jpg',NULL);
/*!40000 ALTER TABLE `image_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `unit_price` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `orders_id` int NOT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_detail_orders1_idx` (`orders_id`),
  KEY `fk_order_detail_products1_idx` (`products_id`),
  CONSTRAINT `fk_order_detail_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_detail_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `total_money` double DEFAULT NULL,
  `user` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ship` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `out_money` double DEFAULT NULL,
  `discount` enum('money','percent') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'percent',
  `pay_method` enum('cash','transfer') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'cash',
  `status` enum('pending','processing','delivery','cancel') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'pending',
  `cancel_cancel` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-11-16 21:45:47',900000,NULL,'0980808897','sang@gmail.com','an ngai tay','can than hang de vo',20000,10000,1200000,'percent','cash','pending',NULL,2),(8,NULL,333385,NULL,NULL,NULL,'An Ngai Tay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,229885,NULL,NULL,NULL,'An Ngai Tay',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,190785,NULL,NULL,NULL,'An Ngai Tay, Ba Tri',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_images_products1_idx` (`products_id`),
  CONSTRAINT `fk_product_images_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_display` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `related_images` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `review` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `bestseller` tinyint DEFAULT '0',
  `trending` tinyint DEFAULT '0',
  `new` tinyint DEFAULT '0',
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modify_at` datetime DEFAULT NULL,
  `supplier_id` int DEFAULT '1',
  `categories_id` int DEFAULT '1',
  `user_created_id` int DEFAULT '1',
  `user_updated_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_products_supplier_idx` (`supplier_id`),
  KEY `fk_products_categories1_idx` (`categories_id`),
  KEY `fk_products_users1_idx` (`user_created_id`),
  KEY `fk_products_users2_idx` (`user_updated_id`),
  CONSTRAINT `fk_products_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  CONSTRAINT `fk_products_users1` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_products_users2` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Việt Quất','viet-quat',NULL,'https://product.hstatic.net/1000282430/product/viet-quat_large.jpg','Quả việt quất là loại quả được yêu thích trên toàn thế giới không chỉ vì ngon mà còn vì loại quả này cung cấp nhiều chất dinh dưỡng cho cơ thể. Quả việt quất có thể ăn tươi, hay dùng để làm mứt, nghiền ăn kèm với kem, nước quả ép hay bánh hấp.',NULL,NULL,0,0,0,89900,NULL,NULL,NULL,1,1,1,NULL),(2,'Quýt 500G','quyt-500g',NULL,'https://product.hstatic.net/1000282430/product/quyt_large.jpg','Trái Quýt được tuyển chọn tại vườn ở Đồng Bằng Sông Cửu Long, quýt có vị ngọt thanh, vỏ căng bóng, đẹp và tươi.',NULL,NULL,0,0,0,89900,NULL,NULL,NULL,1,1,1,NULL),(3,'Kiwi vàng','kiwi-vang',NULL,'https://product.hstatic.net/1000282430/product/trai-kiwi-vang_large.jpg','Kiwi Vàng là kiwi lai tạo. Kiwi vàng New Zealand có đài ở đầu quả và quả thuôn dài hơn kiwi xanh. Chúng có vỏ màu nâu vàng, trơn nhẵn, không có lông xù xì như kiwi xanh. Kiwi vàng có thịt quả màu vàng trong rất đẹp mắt, với nhiều hạt đen tạo thành 1 vòng tròn xung quanh trục dọc của quả. Kiwi vàng có vị ngọt mát rất đặc trưng. Đây là loại quả ngon số 1 thế giới, với quy trình từ trồng, chăm bón đến thu, hái, vận chuyển được chính phủ New Zealand kiểm soát rất chặt chẽ để đảm bảo quả kiwi luôn đồng đều và đủ tiêu chuẩn.',NULL,NULL,0,0,0,100000,NULL,NULL,NULL,1,1,1,NULL),(4,'Kiwi xanh','kiwi-xanh',NULL,'https://product.hstatic.net/1000282430/product/trai-kiwi-xanh_large.jpg','Kiwi xanh là kiwi thuần chủng. Kiwi xanh có thịt quả màu xanh ngọc rất đẹp mắt, với nhiều hạt đen tạo thành 1 vòng tròn xung quanh trục dọc của quả. Kiwi xanh khi chín có vị rất ngọt, xanh có vị chua. Kiwi vàng vỏ trơn nhẵn và thịt quả màu vàng đẹp mắt, rất thơm ngọt khi chín.',NULL,NULL,0,0,0,74250,NULL,NULL,NULL,1,1,1,NULL),(5,'Ổi Phúc Lộc Thọ','oi-phuc-loc-tho',NULL,'https://product.hstatic.net/1000282430/product/oi-phuc-loc-tho_9a1f6289626b43a88da39041dd9977c3_large.jpg','null',NULL,NULL,0,0,0,47000,NULL,NULL,NULL,1,1,1,NULL),(6,'Xoài tượng da xanh','xoai-tuong-da-xanh',NULL,'https://product.hstatic.net/1000282430/product/xaxaxa_be885a1a52644b5bb617e06231314207_large.jpg','null',NULL,NULL,0,0,0,32000,NULL,NULL,NULL,1,1,1,NULL),(7,'Thơm tắc cậu ','thom-tat-cau',NULL,'https://product.hstatic.net/1000282430/product/d_a_large.jpg','Trái khóm (trái thơm) ở mỗi vùng có một đặc trưng riêng nhưng trái khóm trồng ở vùng Tắc Cậu thuộc Huyện Châu Thành, Kiên Giang được người tiêu dùng đánh giá sản phẩm khóm đạt chất lượng tốt, mang đậm đặc trưng của vùng đất miền Tây. Nhờ vào khí hậu và địa thế thuận lợi nên chất lượng trái khóm Tắc Cậu luôn ở mức cao.',NULL,NULL,0,0,0,49900,NULL,NULL,NULL,1,1,1,NULL),(8,'Đu đủ ','du-du',NULL,'https://product.hstatic.net/1000282430/product/du_d__large.jpg','Công dụng và giá trị dinh dưỡng của đu đủ. Đu đủ là trái cây tươi có nhiều dinh dưỡng và lợi ích đối với sức khỏe con người. Đu đủ là cây thân thảo to, không hoặc ít khi có nhánh, cao từ 3–10 m. Lá to hình chân vịt, cuống dài, đường kính 50–70 cm, có khoảng 7 khía. Hoa trắng hay xanh, đài nhỏ, vành to năm cánh.',NULL,NULL,0,0,0,39900,NULL,NULL,NULL,1,1,1,NULL),(9,'Dưa hấu không hạt ','dua-hau-khong-hat',NULL,'https://product.hstatic.net/1000282430/product/seedless-watermelon-around-2.5kg-whole-fruit_23a860613aa94413aca16b9d766f6291_large.jpg','Dưa hấu không hạt được lai tạo bằng cách dùng hai quả dưa hấu có gene khác nhau và lai với nhau, kết quả thu được là một quả dưa hấu có các tính chất khác nhưng quả dưa hấu này sẽ vô sinh và không thể sinh sản (tạo ra hạt) được. Bình thường dưa hấu có hai bộ nhiễm sắc thể. Bước đầu tiên trong việc tạo ra dưa hấu không hạt là sử dụng colchicine để nhân đôi số bộ nhiễm sắc thể trong dưa hấu từ hai lên bốn. Sau đó trồng loại dưa hấu có bốn bộ nhiễm sắc thể này xen lẫn với các cây dưa hấu bình thường. Quá trình thụ phấn xen kẽ giữa hai loại dưa hấu này sẽ tạo ra các quả dưa hấu có 3 bộ nhiễm sắc thể và không có hạt.',NULL,NULL,0,0,0,79000,NULL,NULL,NULL,1,1,1,NULL),(10,'Bơ Booth ','bo-booth',NULL,'https://product.hstatic.net/1000282430/product/bo_cuba_5ef79f78fed44ff281d5e1ac27eea7a7_large.jpg','Mô tả chung: Bơ BOOTH là một Giống bơ BOOTH là giống bơ cho năng suất cao và chất lượng ngon được ưa chuộng trên thị trường. Hiện đang được bà con trồng phổ biến ở các tỉnh Tây Nguyên.Thông tin chi tiết: Công dụng Bơ BOOTH là loại trái cây tươi có chứa rất nhiều beta-sitosterol, là một hợp chất làm giảm tỉ lệ cholesterol. Một nghiên cứu tiến hành trên 45 người đã cho thấy ăn một quả mỗi ngày sẽ giúp giảm tỉ lệ chất béo xuống khoảng 17% chỉ trong vòng một tuần. Bơ chứa rất nhiều glutathione - chất chống ôxy hóa rất quan trọng trong quá trình ngăn chặn sự lão hóa, ung thư và bệnh tim. Theo những nghiên cứu chưa chính thức bơ sáp chưa môt số chất có khả năng ngăn ngừa ung thư thận và ung thư vòm miệng Cách dùng:Bơ thường được dùng để ăn tươi hỗ trợ giảm cân rất tốt, ngoài ra còn chế biến được nhiều món ăn vặt ngon như kem, sinh tố, thạch...Bơ còn được dùng để nấu súp, làm sốt ăn kèm.Phụ nữ hay dùng bơ để đắp mặt, vừa dưỡng ẩm lại trị mụn không tồi.  Bảo quản: Bảo quản nơi khô ráo, thoáng mát',NULL,NULL,0,0,0,59000,NULL,NULL,NULL,1,1,1,NULL),(12,'Bơ sáp','bo-sap',NULL,'http://fujimart.vn/image/cache/catalog/B%C3%A1nh%20t%C6%B0%C6%A1i%20Fuji/bo%20sap-502x502.png','Bơ sáp Đắc Lắc là một trong những loại thương hiệu bơ sáp nổi tiếng với vùng đất cao nguyên bao la, hùng vĩ đã chắt lọc ra những trái bơ thơm ngon giàu dinh dưỡng. Hiện nay theo nghiên cứu của các chuyên gia thì đất ở vùng tây nguyên rất thích hợp để trồng bơ và cho ra những trái bơ ngon nhất.','https://matongtaynguyen.net/wp-content/uploads/2015/12/qua-bo-sap-daklak.jpg\nhttps://nongnghiep.farmvina.com/wp-content/uploads/2014/11/quabo_pmjm.jpg',NULL,0,0,0,100000,0,NULL,NULL,2,1,NULL,NULL),(14,'Xoài cát hòa lộc','xoai-cat-hoa-loc',NULL,'https://hoacanhquangvy.com/wp-content/uploads/2020/07/cach-trong-cay-xoai3.jpg','Xoài Hòa Lộc là giống xoài truyền thống ở Nam Bộ biết bao đời nay, có thể nói nó thuần chủng 100%. Khi quả chín đúng chuẩn sẽ lan toả hương thơm nồng nàn, thịt quả màu vàng mật rất đẹp mắt. Thịt quả ngọt đậm đà, nhiều nước, và không hề có xơ, ăn mềm mềm lại dai. Cảm giác miếng xoài Hòa Lộc tan trong miệng nhưng hương vị vẫn đọng lại nơi đầu lưỡi quả là chẳng thể chê vào đâu được.','https://nongsanhungmanh.com/uploads/san-pham/2017_12/xoai-cat-hoa-loc-3.jpg\nhttps://media.laodong.vn/Storage/NewsPortal/2017/12/21/582434/ND-Can_Opt.jpg',NULL,1,1,1,110000,0,NULL,NULL,3,1,NULL,NULL),(15,'Dưa lưới','dua-luoi',NULL,'https://sanvatphuongnam.vn/image/cache/catalog/products/1/dua-luoi-2-800x800.jpg','Dưa lưới ruột vàng được rất nhiều người tin dùng vì chất lượng ăn rất ngon và giá trị dinh dưỡng cao, hơn nữa dưa lưới yêu cầu kỹ thuật canh tác khá cao nên hiện tại đang được trồng và quản lý theo tiêu chuẩn VietGap và Gapglobal vì vậy hoàn toàn đảm bảo an toàn khi sử dụng.','https://vnn-imgs-f.vgcloud.vn/2018/06/13/14/da-mat-voi-nhung-khu-vuon-dua-luoi-o-nhat-4.jpg\nhttps://luankha.com/wp-content/uploads/2020/03/duoi-luoi-vo-vang-3f-fruits3-1-1000x800.png',NULL,1,1,0,100000,0,NULL,NULL,3,1,NULL,NULL),(17,'Cam sành','cam-sanh',NULL,'https://hoadepviet.com/wp-content/uploads/2019/04/cam-sanh-2430483_960_720.jpg','Cam sành là loại trái cây tươi giàu vitamin C, vitamin A, canxi, chất xơ… rất bổ dưỡng cho cơ thể phụ nữ mang thai. Vitamin B9 (axit folic) có trong cam sành vô cùng quan trọng, đặc biệt đối với bà bầu hoặc những người đang cố gắng thụ thai. Cam sành giúp ngăn ngừa một số loại khuyết tật bẩm sinh, tăng sức đề kháng và giúp sản xuất các tế bào máu khỏe mạnh. Ngoài ra chất limonoid trong nước cam giúp ngăn ngừa bệnh ung thư và có tác dụng giải độc, lợi tiểu. Phụ nữ mang thai thường ăn cam sành, hoặc các loại trái có họ hàng với cam như quýt, bưởi,… có tỉ lệ nhiễm các bệnh ung thư (phổi và dạ dày) khá thấp','https://vuacaygiong.com/wp-content/uploads/2017/03/cay_giong_cam_sanh_03.jpg\nhttps://buoctienshopping.vn/wp-content/uploads/2018/09/Cam-sanh-1.jpg',NULL,0,0,1,84000,0,NULL,NULL,2,1,NULL,NULL),(18,'Dưa hấu không hạt','dua-hau-khong-hat-2',NULL,'https://sieuthibecon.com/wp-content/uploads/2020/09/dua-khong-hat-6.jpg','Dưa hấu không hạt được lai tạo bằng cách dùng hai quả dưa hấu có gene khác nhau và lai với nhau, kết quả thu được là một quả dưa hấu có các tính chất khác nhưng quả dưa hấu này sẽ vô sinh và không thể sinh sản (tạo ra hạt) được. Bình thường dưa hấu có hai bộ nhiễm sắc thể. Bước đầu tiên trong việc tạo ra dưa hấu không hạt là sử dụng colchicine để nhân đôi số bộ nhiễm sắc thể trong dưa hấu từ hai lên bốn. Sau đó trồng loại dưa hấu có bốn bộ nhiễm sắc thể này xen lẫn với các cây dưa hấu bình thường. Quá trình thụ phấn xen kẽ giữa hai loại dưa hấu này sẽ tạo ra các quả dưa hấu có 3 bộ nhiễm sắc thể và không có hạt.','https://www.btaskee.com/wp-content/uploads/2020/10/cach-lua-dua-hau-221020.jpg\nhttps://img.docbao.vn/images/fullsize/2018/08/22/kinh-te/dua-hau-khong-hat.jpg',NULL,1,1,1,55000,0,NULL,NULL,1,1,NULL,NULL),(19,'Bưởi da xanh','buoi-da-xanh',NULL,'https://www.dongyvietnam.org/wp-content/uploads/2020/11/soi-than-nen-an-trai-cay-gi1.jpg','Bưởi da xanh là một trong những trái cây tươi chứa nhiều vitamin, nó không chỉ dễ ăn, vị ngọt mát mà còn chứa rất ít calorie, bưởi còn giúp bạn có được làn da đẹp và có tác dụng bổ dưỡng cơ thể, phòng và chữa một số bệnh như cao huyết áp, đau dạ dày, tiểu đường… Bưởi da xanh có chứa đường, phốt pho, sắt, caroten, vitamin B1, B2, C, PP và tinh dầu nằm ở vỏ, thành phần chủ yếu là xitronelol. Hạt bưởi chứa một loại este, dầu, prôtit, chất xơ… Chất glucôxit trong vỏ bưởi có tác dụng chống viêm, chống vi trùng; nước quả tươi có thể làm hạ đường trong máu.','https://hoadepviet.com/wp-content/uploads/2019/04/buoi-da-xanh-1.jpg\nhttps://kimnonggoldstar.vn/wp-content/uploads/2019/10/cach-nuoi-buoi-da-xanh-nhanh-lon-kimnong02.jpg',NULL,0,0,0,98000,0,NULL,NULL,2,1,NULL,NULL),(20,'Thanh long ruột đỏ','thanh-long-ruot-do',NULL,'https://sieuthiandam.vn/wp-content/uploads/2020/03/thanh-long-600x600.jpg','Thanh long ruột đỏ là một trong những loại trái cây tươi có thành phần dinh dưỡng phù hợp nhất cho việc giữ gìn dáng vóc và sắc đẹp, đặc biệt là với phụ nữ. Đặc biệt thành phần dinh dưỡng của thanh long ruột đỏ được đánh giá là gấp đôi thanh long ruột trắng.','http://vietflowerfruit.com/wp-content/uploads/2018/09/thanh-long-ruot-do.png\nhttps://csfood.vn/wp-content/uploads/2015/01/Thanh-Long-Ru%E1%BB%99t-%C4%90%E1%BB%8F-VietGap.jpg',NULL,1,1,0,80000,0,NULL,NULL,1,1,NULL,NULL),(21,'Chanh dây','chanh-day',NULL,'https://lmhtxdaknong.vn/wp-content/uploads/2018/06/chanh-d%C3%A2y.png','Chanh dây khi ra quả sẽ có vỏ màu xanh lục khi còn non. Đến khi chín vỏ quả chuyển sang màu ánh vàng hoặc màu tím sậm. Chanh dây có kích thước to hơn quả trứng gà một chút với hình cầu hoặc bầu dục, quả mọng có nhiều cùi thình hình ô van màu ánh vàng. Hương vị thịt quả ngọt, ngon và rất mát.','https://dalatxanh.vn/wp-content/uploads/2017/04/chanh-day.jpg\nhttp://traicaysaysafovi.com/wp-content/uploads/2018/06/chanh-day-hong-phuc-fruits-1.jpg',NULL,1,1,1,60000,0,NULL,NULL,3,1,NULL,NULL),(22,'Thanh long','thanh-long',NULL,'https://img.giaoduc.net.vn/w1050/uploaded/2019/vowkjqkp/2018_10_14/thanh_long.jpg','Thanh long ruột trắng có thành phần chất xơ rất cao, trung bình 100 gram chứa 0,7-0,9 gam chất xơ, rất tốt cho cơ thể, đặc biệt là cholesterol, tốt cho tiêu hóa, hạn chế táo bón giải độc cơ thể. Mỗi ngày một người nên ăn khoảng 20-30 gam chất xơ, đây là mức tối ưu có thể giúp ngăn ngừa nhiều loại bệnh nan y như ung thư, bệnh tim, tiểu đường ... Ngoài chất xơ, thanh long ruột trắng cũng giàu chất beta carotene, đây là một chất giúp cho cơ thể chuyển hóa thành vitamin provitamin, giúp loại bỏ các tế bào mà không dẫn đến nhiễm trùng','https://ucamart.com/wp-content/uploads/2018/10/480_crop__thanh_long_ruot_trang_xuat_khau.jpg\nhttps://media.ngoisao.vn/resize_580/news/2018/08/22/thanh-long1-ngoisao.vn-w580-h733.jpg',NULL,0,0,1,54000,0,NULL,NULL,3,1,NULL,NULL),(26,'Dưa lưới Hà Lan','dua-luoi-ha-lan',NULL,'http://product.hstatic.net/1000282430/product/aaa_grande.jpg','Dưa lưới giống Hà Lan được trồng theo công nghệ Israel với sự giám sát nghiêm ngặt đã tạo ra giống dưa lưới với độ đường cao, thịt chắc, ruột màu xanh, trái tròn đều, vị ngọt lâu hơn ở hậu.','https://unifarm.com.vn/wp-content/uploads/2017/05/dua-luoi-tron-ha-lan-2.jpg\nhttps://buoctienshopping.vn/wp-content/uploads/2018/10/Dua-luoi-Ha-Lan-2.jpg',NULL,1,1,0,88000,0,NULL,NULL,2,1,NULL,NULL),(28,'Ớt chuông xanh','ot-chuong-xanh',NULL,'http://dalatxanh.vn/wp-content/uploads/2019/03/55e841af7845ff0c34da82c9895ab524.jpg','Ớt chuông Đà Lạt hay còn gọi là Ớt tây có kích thước to với nhiều màu sắc khác nhau: xanh, vàng, đỏ... Ớt chuông không có vị cay gắt như các loại ớt thông thường khác. Ớt chuông có vị giòn nên thích hợp cho các món xào, ăn sống.','https://ucamart.com/wp-content/uploads/2018/10/ot.jpg\nhttps://laxas.com.vn/wp-content/uploads/2020/12/ot-chuong-da-lat-laxas-xanh.jpg',NULL,1,1,0,80000,0,NULL,NULL,5,2,NULL,NULL),(29,'Chanh vàng','chanh-vang',NULL,'https://thucphamdongxanh.com/wp-content/uploads/2019/09/cong-dung-chanh-vang.jpg','Chanh vàng Mỹ hay còn gọi là chanh tây, là loại hoa quả nhập khẩu từ Mỹ, có màu vàng, hình bầu dục, có vị chua nhẹ và mùi thơm rất đặc trưng. Chanh vàng vị chua dịu nhưng lại thơm hơn rất nhiều so với chanh ta. Do vậy, khi sử dụng chanh vàng làm nước uống, làm bánh sẽ ngon hơn rất nhiều, giảm được vị gắt, chát của chanh ta.','http://pic.trangvangvietnam.com/211730/mau-vang-chanh_769.jpg\nhttps://huphafood.vn/uploads/danhmuc/thumb/chanh-vang-img.jpg',NULL,0,0,1,200000,0,NULL,NULL,5,2,NULL,NULL),(31,'Khoai lang Đà Lạt','khoai-tay-da-lat',NULL,'https://sieuthiandam.vn/wp-content/uploads/2018/06/KHOAI-LANG-M%E1%BA%ACT-%C4%90%C3%80-L%E1%BA%A0T.jpg','Khoai lang Nhật Đà Lạt có hình dáng thon, dài. Vỏ màu tím, ruột vàng, hương vị dịu nhẹ, bùi, chiếm được cảm tình nhiều người. Đây là giống cây thích hợp trồng ở khí hậu cao nguyên, phát triển tốt trong môi trường giàu chất hữu cơ, đất tươi xốp.','https://www.fujimart.vn/image/cache/catalog/rau%20cu%20qua/186cfb2cb7a203903484e442d732a087-502x502.png\nhttps://giadinh.tv/wp-content/uploads/2016/12/khoai-lang.jpg',NULL,0,0,0,76000,0,NULL,NULL,4,2,NULL,NULL),(32,'Bí rợ','bi-ro',NULL,'https://dungcunongnghiep.vn/files/sanpham/643/1/jpg/bi-ro-f1-tn-400.jpg','Bí rợ mang lại nhiều lợi ích cho sức khỏe chúng ta, có thể kể đến như lợi cho tim mạch, phát triển não bộ, có tác dụng giảm cân, tăng cường hệ miễn dịch, tốt cho sự phát triển thai nhi, phòng ngừa ung thư, tốt cho xương, ngăn ngừa loét dạ dày tá tràng, tốt cho hệ hô hấp, tốt cho mắt, giúp làm đẹp da.','https://trangvikhang.com/wp-content/uploads/2015/06/9.jpg\nhttps://i.ytimg.com/vi/9jUQJCLuLes/maxresdefault.jpg',NULL,1,1,0,59000,0,NULL,NULL,4,2,NULL,NULL),(33,'Ớt chuông vàng','ot-chuong-vang',NULL,'https://ucamart.com/wp-content/uploads/2018/10/ot-vang.jpg','Ớt chuông Đà Lạt hay còn gọi là Ớt tây có kích thước to với nhiều màu sắc khác nhau: xanh, vàng, đỏ... Ớt chuông không có vị cay gắt như các loại ớt thông thường khác mà có vị giòn nên thích hợp cho các món xào, ăn sống.','https://vuonrau.com/hinh/sp/ot-chuong-vang/ot-chuong-vang_2_medium.jpg\nhttps://product.hstatic.net/1000191320/product/otchuongvangruasach_master_697494e2fea6471b9eeb7bdb78f7c0e4_grande.jpg',NULL,1,1,0,84000,0,NULL,NULL,5,2,NULL,NULL),(34,'Củ dền','cu-den',NULL,'https://thucphamdongxanh.com/wp-content/uploads/2019/09/cu-den-tn-23.jpg','Củ dền đỏ được trồng theo phương pháp không sử dụng phân bón hóa học, không sử dụng thuốc trừ sâu hóa học và hóa chất kích thích tăng trưởng nên an toàn cho sức khỏe người tiêu dùng.','http://trongraudothi.com/Uploads/rausach/rausach/avata/img/20151030213116cudendo.png\nhttps://hatgionggiare.com/asset/editor/ResponsiveFilemanager-master/source/san_pham/cu-den/hat-giong-cu-den%20%20(1).jpg',NULL,0,0,1,78900,0,NULL,NULL,5,2,NULL,NULL),(35,'Dưa leo','dua-leo',NULL,'https://manafood.vn/wp-content/uploads/2021/01/dualeothuong.jpg','Dưa leo chứa một hàm lượng “khủng” về nước, trong dưa leo, nước chiếm khoảng 96%, loại nước này là loại nước “siêu cất”, vốn quý hơn nhiều so với loại nước bình thường mà chúng ta uống. Da của dưa leo chứa rất nhiều vitamin A, tính kiềm của những khoáng tố có trong dưa leo có tác động trung hòa acid trong cơ thể và điều hòa, ổn định pH máu, dịch ép của dưa leo cũng có tác dụng làm dịu hệ tiêu hóa, hỗ trợ điều trị cho những bệnh nhân loét dạ dày, tá tràng.','https://asean2010.vn/wp-content/uploads/2020/04/dua-chuot.jpg\nhttp://vifood.vn/wp-content/uploads/2017/08/VF216-1.jpg',NULL,1,1,1,60000,0,NULL,NULL,4,2,NULL,NULL),(36,'Khoai môn','khoai-mon',NULL,'https://thucphamtantai.com/wp-content/uploads/2019/10/khoai-mon-so.jpg','Khoai môn có giá trị dinh dưỡng cao, giàu tinh bột và vitamin, rất thích hợp để bổ sung vào mùa đông. Nó có nhiều công dụng như bổ sung canxi, thúc đẩy sự hấp thụ canxi trong cơ thẻ, cải thiện khả năng miễn dịch, giảm cân, chữa táo bón','https://www.hoidaubepaau.com/wp-content/uploads/2019/08/cach-chon-khoai-mon.jpg\nhttps://media.tinmoi.vn/2015/09/25/khoai-mon-va-nhung-tac-dung-bat-ngo-cho-suc-khoe.jpg',NULL,1,1,0,79000,0,NULL,NULL,5,2,NULL,NULL),(37,'CHANH XANH KHÔNG HẠT HỮU CƠ 500G','chanh-xanh-khong-hat-huu-co-400g-86',NULL,'https://product.hstatic.net/1000282430/product/organic-seedless-lime_456e3363df7240c0a755876157124fde_large.jpg','Mô tả chung: CHANH XANH KHÔNG HẠT HỮU CƠ 400G ',NULL,NULL,0,0,0,39900,NULL,NULL,NULL,1,1,1,1),(41,'BÍ RỢ 1KG','bi-ngo-2304',NULL,'https://product.hstatic.net/1000282430/product/upload_54168c446e19486fbf0f50883fa0436b_large.jpg','Một số tác dụng của bí ngô (bí đỏ):  Lợi ích cho tim mạch: Những chất physterol và những axit béo omega 3, omega 6 là những chất có tác dụng làm giảm lượng cholesterol xấu, ngăn ngừa bệnh tim mạch và huyết áp. Và đặc biệt trong hạt bí đỏ rất giàu những chất này.  Phát triển não bộ: Bí đỏ chứa nhiều chất axit glutamine, chất cần thiết cho hoạt động não bộ. Chất này có vai trò quan trọng trong việc trợ giúp phản ứng chuyển hóa ở các tế bào thần kinh và não, bồi dưỡng não.  Tác dụng giảm cân: Bí đỏ là một thực phẩm giàu chất xơ,chứa hàm lượng calo và chất béo thấp. Tác dụng của bí đỏ chính là một thực phẩm lí tưởng cho những người muốn giảm cân hay những người thừa cân, béo phì.  Tăng cường hệ miễn dịch: Bí đỏ rất giàu hàm lượng vitamin C nên bí đỏ có tác dụng tăng cường sức đề kháng cho cơ thể, giúp hệ thống miễn dịch trở nên khỏe mạnh. Với hệ miễn dịch khỏe mạnh, cơ thể của chúng ta sẽ chống lại được các vi khuẩn, vi rút có hại cho cơ thể.  Tốt cho sự phát triển thai nhi: Những chất trong hạt và hoa bí ngô giúp cho thai nhi phát triển tế bào não, tăng cường sức sống cho thai nhi và giúp ngăn ngừa những chứng phù nề, tăng huyết áp, các biến chứng khác khi mang thai và phòng chống bệnh sốt xuất huyết sau khi sinh. Ngăn ngừa tiểu đường: Tác dụng của bí đỏ giúp hạ đường huyết trong máu nên giúp ngăn ngừa được bệnh tiểu đường. Hơn nữa, nó còn có giúp kiềm hãm khả năng phát triển bệnh thành mãn tính đối với những người đã bị bệnh tiểu đường.  Tẩy giun: Dùng bí đỏ ăn sống hoặc hạt bí đỏ rang chín kết hợp với việc dùng thuốc tẩy giun sẽ đem lại hiệu quả tẩy giun cao. Đặc biệt với trẻ nhỏ,ăn bí đỏ thường xuyên cũng giúp ngăn ngừa chứng giun sán.  Phòng ngừa ung thư: Những thực phẩm có màu vàng như bí đỏ, cà rốt, khoai lang có chứa nhiều chất chống oxy hóa và beta- carotene nên có tác dụng ngăn ngừa các căn bệnh ung thư.  Tốt cho xương: Bí đỏ còn chứa một lượng lớn các chất khoáng và canxi, natri, kali . Đặc biệt với người già và người bệnh huyết áp những chất này giúp ngăn ngừa loãng xương và tăng huyết áp. Ngoài ra, nó còn chứa magie, phốtpho, sắt, đồng, mangan, crôm và nhiều yếu tố khác giúp xương phát triển. Chống trầm cảm: Bí ngô giàu L-tryptophan, một loại chất giúp tăng cảm giác hạnh phúc. Chúng ta sẽ thấy chán nản khi mức L-tryptophan trong cơ thể thấp. Nước ép bí ngô giúp làm tăng mức L-tryptophan và làm chúng ta thấy thoải mái và hạnh phúc.  Ngăn ngừa loét dạ dày tá tràng: Nước ép bí đỏ giúp ruột tiêu hóa thức ăn nhanh và giúp loại bỏ độc tố ra khỏi đường tiêu hóa. Vì vậy mà nước ép bí có thể chữa lành vết loét dạ dày, tá tràng và các nhiễm trùng khác trong ruột.  Tốt cho hệ hô hấp: Chất chống oxy hóa và những chất có tính chất giảm đau trong nước ép bí đỏ giúp ngăn ngừa bệnh hen suyễn dị ứng và giảm dần mức nghiêm trọng của bệnh.  Tốt cho mắt: Ngoài cà rốt giúp bổ mắt, tác dụng của bí đỏ cũng giúp bồi bổ, tốt cho mắt,n hờ vào thành phần beta carotene và lutein mà bí đỏ giúp mắt sáng và ngừa đục thủy tinh thể hiệu quả.  Giúp làm đẹp da: Bí đỏ chứa hàm lượng vitamin C cao giúp chống lại các gốc tự do trong cơ thể, ngăn ngừa dấu hiệu lão hóa như nếp nhăn, các đốm nâu…bảo vệ làn da bạn chống lại các tác hại của ánh nắng mặt trời và ngăn ngừa tình trạng mất nước, khô da.',NULL,NULL,0,0,0,59900,NULL,NULL,NULL,1,1,1,1),(42,'NHO ĐEN KHÔNG HẠT 500G','nho-den-khong-hat-2051',NULL,'https://product.hstatic.net/1000282430/product/nho-den-khong-hat-_large.jpg','Nho đen không hạt Mỹ được trồng nhiều ở bang California , Washington là những nơi có khí hậu khô và ấm áp . Với đa dạng các chủng: Autumn royal, Midnight Beauty, Sugrathirteen, Summer Roya và loại Autumn royal là loại ngon hơn hẳn.',NULL,NULL,0,0,0,149900,NULL,NULL,NULL,1,1,1,1),(46,'Bông cải trắng AF 500G','bong-cai-trang-uc-500g',NULL,'https://product.hstatic.net/1000282430/product/bong-cai-trang-large_be2e12510579422f9385a6f4e2e448d1_large.jpg','Mô tả chung BÔNG CẢI TRẮNG ÚC 500G Thông tin chi tiết: Bông cải trắng hay còn gọi là súp lơ trắng là loại cây có phần bông trắng khít, xốp và mềm, bên ngoài có lá bao bọc xung quanh, phiến lá dày, cứng, phần bông được dùng để ăn còn phần lá dành cho gia súc. Công dụng: Bông cải trắng đã được biết đến từ lâu là mang lại giá trị dinh dưỡng và có lợi cho sức khỏe. Với hàm lượng calo và chất xơ ít (khoảng 25 calo và 2g chất xơ), đây là món ăn tuyệt vời cho người muốn giảm cân. Một số hoạt chất trong cải đã được chứng minh hoạt động rất hiệu quả trên hệ miễn dịch, tăng cường kháng viêm, chống vi trùng và vi khuẩn và điều trị chứng loạn sản cổ tử cung. Bông cải trắng cung cấp một lượng lớn vitamin C giúp chống oxy hóa đã được chứng minh giúp chống lại các gốc tự do có hại, tăng cường khả năng miễn dịch, ngăn ngừa các bệnh nhiễm trùng và ngừa ung thư. Bông cải trắng chứa nhiều khoáng chất như mangan, đồng, sắt và kali, các nguyên tố vi lượng này cũng là thành phần không thể thiếu cho hoạt động của các enzym trong cơ thể, góp phần bảo vệ khung xương, hồng cầu và điều hòa huyết áp. Bông cải trắng giúp làm bền các thành mạch máu. Một số vitamin khác giúp kích hoạt hoạt động chống viêm trong mao mạch và ngăn ngừa tổn thương mạch máu ... Hướng dẫn sử dụng: Từ bông cải trắng, ta có thể chế biến thành các món ăn như: súp lơ muối chua, súp lơ nướng, tôm súp lơ sốt nước cốt dừa .. Lưu ý: tốt nhất là nấu bông cải trắng cho vừa chín tới nếu không bông sẽ nhũn và có mùi rất nồng. Bảo quản: Nếu bạn chưa ăn ngay thì không rửa mà bọc bông cải bằng nilon hoặc cho vào túi nilon cũng được, sau đó cho vào tủ lạnh (hộp nhựa ngăn chứa rau củ). ',NULL,NULL,0,0,0,159000,NULL,NULL,NULL,1,1,1,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_tag`
--

DROP TABLE IF EXISTS `products_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tags_id` int NOT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_tag_tags1_idx` (`tags_id`),
  KEY `fk_products_tag_products1_idx` (`products_id`),
  CONSTRAINT `fk_products_tag_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_products_tag_tags1` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_tag`
--

LOCK TABLES `products_tag` WRITE;
/*!40000 ALTER TABLE `products_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `caption` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,NULL,NULL,NULL),(2,NULL,NULL,NULL),(3,NULL,NULL,NULL),(4,NULL,NULL,NULL),(5,NULL,NULL,NULL),(6,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Nam An Market','Nam-An-Market','21 Thảo Điền, Phường Thảo Điền, Thành phố Thủ Đức','94852144'),(2,'Nam An Market','Nam-An-Market','303 Nguyễn Văn Trỗi, Phường 1, Quận Tân Bình','94852144'),(3,'Nam An Market','Nam-An-Market','06 Nguyễn Thị Minh Khai, Phường Đakao ,Quận 1','94852144'),(4,'Nam An Market','Nam-An-Market','24 Thảo Điền, Phường Thảo Điền, Thành phố Thủ Đức','94852144'),(5,'Nam An Market','Nam-An-Market','303 Nguyễn Văn Trỗi, Phường 1, Quận Tân Bình','94852144'),(6,'Nam An Market','Nam-An-Market','26 Thảo Điền, Phường Thảo Điền, Thành phố Thủ Đức','94852144'),(7,'Nam An Market','Nam-An-Market','06 Nguyễn Thị Minh Khai, Phường Đakao ,Quận 1','94852144'),(8,'Nam An Market','Nam-An-Market','28 Thảo Điền, Phường Thảo Điền, Thành phố Thủ Đức','94852144');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_users1_idx` (`users_id`),
  CONSTRAINT `fk_user_role_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pw` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  `avatar` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'anonymous',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lsang','2403',NULL,NULL,NULL,NULL,1,NULL,'Sang'),(2,'vkhang','114',NULL,NULL,NULL,NULL,1,NULL,'khang'),(3,'minhtri','115',NULL,NULL,NULL,NULL,1,NULL,'tri'),(4,'laiphu','116',NULL,NULL,NULL,NULL,1,NULL,'phu'),(5,'va112','112',NULL,NULL,NULL,NULL,0,NULL,'Tran Van A'),(11,'vanb','2403',NULL,NULL,NULL,NULL,0,NULL,'tran van b');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 14:19:22
