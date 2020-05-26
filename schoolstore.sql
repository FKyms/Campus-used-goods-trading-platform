/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : schoolstore

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 26/05/2020 15:22:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `specificaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`addressID`) USING BTREE,
  INDEX `address_user_UserID_fk`(`userID`) USING BTREE,
  CONSTRAINT `address_user_UserID_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, '江干区', '小白龙', '65479812124');
INSERT INTO `address` VALUES (2, 2, '武大信部', '小铭', '12364031579');
INSERT INTO `address` VALUES (5, 2, '下沙', '赵日天', '12345678910');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminID` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `adminName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员昵称',
  `adminPW` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `adminPhone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminEmail` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminID`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`adminName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `cartsID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `goodsID` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`cartsID`) USING BTREE,
  UNIQUE INDEX `myUnique`(`userID`, `goodsID`) USING BTREE,
  INDEX `UserID`(`userID`) USING BTREE,
  INDEX `carts_ibfk_2`(`goodsID`) USING BTREE,
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`goodsID`) REFERENCES `goods` (`goodsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodsID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `goodsName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goodsClass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类别',
  `goodsDetail` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `goodsPrice` decimal(8, 2) NOT NULL COMMENT '商品单价',
  `goodsSeller` int(11) NOT NULL COMMENT '商品卖家',
  `goodsNumber` int(11) NOT NULL COMMENT '商品库存量',
  `goodsPicturePath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`goodsID`) USING BTREE,
  UNIQUE INDEX `goodsSellerID`(`goodsSeller`, `goodsName`) USING BTREE,
  INDEX `GoodsSeller`(`goodsSeller`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`goodsSeller`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (40, '苹果手机', '数码产品', '苹果xs 258g 原价6400元', 1200.00, 1, -2, 'images/imageUpload/2020_5_26_1893344984.jpg');
INSERT INTO `goods` VALUES (41, '天然玛瑙小饰品', '其他', '天然玛瑙(原价70元)', 55.00, 1, 1, 'images/imageUpload/2020_5_26_387574652.jpg');
INSERT INTO `goods` VALUES (42, '珍珠膏，美白淡斑，可当隔离霜，素颜霜', '日常用品', '珍珠膏美白淡斑去黄细腻毛孔隔离霜素颜霜', 88.00, 1, 2, 'images/imageUpload/2020_5_26_973988686.jpg');
INSERT INTO `goods` VALUES (43, '抖音网红卸妆水', '日常用品', '网红卸妆水(原价89元)', 49.00, 1, 4, 'images/imageUpload/2020_5_26_1021733579.jpg');
INSERT INTO `goods` VALUES (44, '董欣口红唇釉', '日常用品', '董欣口红唇釉全是当下最火的颜色可食用孕妇小孩可用(原价88元)', 88.00, 1, 4, 'images/imageUpload/2020_5_26_2123859312.jpg');
INSERT INTO `goods` VALUES (45, 'oreo 作品合集', '虚拟产品', 'oreo 作品合集 CG3D 超稀有精品素材', 10.00, 1, 1, 'images/imageUpload/2020_5_26_319611790.jpeg');
INSERT INTO `goods` VALUES (47, '石英6针商务机械手表', '家用电器', '瑞之缘精钢壳钢带多功能钢表圆形正品石英6针商务机械手表', 108.00, 1, 10, 'images/imageUpload/2020_5_26_218781515.jpg');
INSERT INTO `goods` VALUES (48, 'MJ手办', '手工设计', 'MJ手办', 199.00, 1, 1, 'images/imageUpload/2020_5_26_1446898061.jpg');
INSERT INTO `goods` VALUES (49, '全新耳饰还有项链，s925银的', '衣帽鞋伞', '超好看的，全新的', 18.00, 1, 100, 'images/imageUpload/2020_5_26_99140703.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单-商品连接ID',
  `orderGID` int(11) NOT NULL COMMENT '买家账户id',
  `goodsID` int(11) NOT NULL COMMENT '商品id',
  `count` int(11) NOT NULL,
  `orderStatus` int(11) NOT NULL,
  `orderPrice` decimal(14, 2) NOT NULL,
  PRIMARY KEY (`orderID`) USING BTREE,
  INDEX `goodsID`(`goodsID`) USING BTREE,
  INDEX `myUni`(`orderGID`, `goodsID`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orderGID`) REFERENCES `ordersgroup` (`orderGID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`goodsID`) REFERENCES `goods` (`goodsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (61, 33, 40, 1, -2, 1200.00);
INSERT INTO `orders` VALUES (62, 33, 42, 2, -2, 176.00);
INSERT INTO `orders` VALUES (63, 34, 40, 1, -2, 1200.00);
INSERT INTO `orders` VALUES (64, 34, 41, 1, -2, 55.00);
INSERT INTO `orders` VALUES (65, 35, 40, 1, -1, 1200.00);
INSERT INTO `orders` VALUES (66, 35, 41, 1, -1, 55.00);
INSERT INTO `orders` VALUES (67, 36, 41, 1, -2, 55.00);
INSERT INTO `orders` VALUES (68, 37, 41, 1, -2, 55.00);

-- ----------------------------
-- Table structure for ordersgroup
-- ----------------------------
DROP TABLE IF EXISTS `ordersgroup`;
CREATE TABLE `ordersgroup`  (
  `orderGID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `userID` int(11) NOT NULL COMMENT '买家账户',
  `orderDateTime` datetime(0) NOT NULL COMMENT '订单日期',
  `orderGPrice` decimal(12, 2) NOT NULL COMMENT '订单总价',
  `addrID` int(11) NOT NULL COMMENT '买家收货地址',
  PRIMARY KEY (`orderGID`) USING BTREE,
  INDEX `orders_ibfk_1`(`userID`) USING BTREE,
  INDEX `orders_ibfk_2`(`addrID`) USING BTREE,
  CONSTRAINT `ordersgroup_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordersgroup_ibfk_2` FOREIGN KEY (`addrID`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordersgroup
-- ----------------------------
INSERT INTO `ordersgroup` VALUES (23, 2, '2020-05-23 18:19:06', 209.80, 2);
INSERT INTO `ordersgroup` VALUES (24, 1, '2020-05-24 01:00:40', 211.20, 1);
INSERT INTO `ordersgroup` VALUES (25, 1, '2020-05-24 01:01:05', 125.00, 1);
INSERT INTO `ordersgroup` VALUES (26, 1, '2020-05-25 11:40:34', 23.40, 1);
INSERT INTO `ordersgroup` VALUES (27, 1, '2020-05-25 11:40:47', 23.40, 1);
INSERT INTO `ordersgroup` VALUES (28, 1, '2020-05-25 12:04:01', 23.40, 1);
INSERT INTO `ordersgroup` VALUES (29, 1, '2020-05-25 12:10:06', 23.40, 1);
INSERT INTO `ordersgroup` VALUES (30, 1, '2020-05-26 02:06:45', 548.70, 1);
INSERT INTO `ordersgroup` VALUES (31, 1, '2020-05-26 02:10:48', 25.60, 1);
INSERT INTO `ordersgroup` VALUES (32, 1, '2020-05-26 02:10:55', 25.60, 1);
INSERT INTO `ordersgroup` VALUES (33, 1, '2020-05-26 14:45:06', 1376.00, 1);
INSERT INTO `ordersgroup` VALUES (34, 1, '2020-05-26 14:51:28', 1255.00, 1);
INSERT INTO `ordersgroup` VALUES (35, 1, '2020-05-26 14:58:57', 1255.00, 1);
INSERT INTO `ordersgroup` VALUES (36, 1, '2020-05-26 15:03:19', 55.00, 1);
INSERT INTO `ordersgroup` VALUES (37, 1, '2020-05-26 15:06:47', 55.00, 1);

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `pictureID` int(11) NOT NULL AUTO_INCREMENT,
  `goodsID` int(11) NOT NULL,
  `picurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pictureID`) USING BTREE,
  INDEX `picture_ibfk_1`(`goodsID`) USING BTREE,
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`goodsID`) REFERENCES `goods` (`goodsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (26, 41, 'images/imageUpload/2020_5_26_1518130151.jpg');
INSERT INTO `picture` VALUES (27, 41, 'images/imageUpload/2020_5_26_1506620345.jpg');
INSERT INTO `picture` VALUES (28, 42, 'images/imageUpload/2020_5_26_471740019.jpg');
INSERT INTO `picture` VALUES (29, 42, 'images/imageUpload/2020_5_26_945583844.jpg');
INSERT INTO `picture` VALUES (30, 43, 'images/imageUpload/2020_5_26_1823867681.jpg');
INSERT INTO `picture` VALUES (31, 43, 'images/imageUpload/2020_5_26_1798010486.jpg');
INSERT INTO `picture` VALUES (32, 44, 'images/imageUpload/2020_5_26_547473284.jpg');
INSERT INTO `picture` VALUES (33, 44, 'images/imageUpload/2020_5_26_1038844646.jpg');
INSERT INTO `picture` VALUES (34, 45, 'images/imageUpload/2020_5_26_1118892268.jpeg');
INSERT INTO `picture` VALUES (35, 45, 'images/imageUpload/2020_5_26_848832323.jpeg');
INSERT INTO `picture` VALUES (38, 47, 'images/imageUpload/2020_5_26_39399829.jpg');
INSERT INTO `picture` VALUES (39, 47, 'images/imageUpload/2020_5_26_1912718278.jpg');
INSERT INTO `picture` VALUES (40, 48, 'images/imageUpload/2020_5_26_463112330.jpg');
INSERT INTO `picture` VALUES (41, 48, 'images/imageUpload/2020_5_26_1610567937.jpg');
INSERT INTO `picture` VALUES (42, 49, 'images/imageUpload/2020_5_26_1605280047.jpg');
INSERT INTO `picture` VALUES (43, 49, 'images/imageUpload/2020_5_26_1634872136.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `userPW` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `userPhone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `userEmail` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`userID`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`userEmail`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 450 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '小明', '123456', '13264031579', '123456@qq.com');
INSERT INTO `user` VALUES (2, 'boss', '1246', '17740631579', '17740631579@qq.com');
INSERT INTO `user` VALUES (449, 'AAA', '123456', NULL, '1098717970@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
