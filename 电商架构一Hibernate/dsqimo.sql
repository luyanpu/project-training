/*
 Navicat Premium Data Transfer

 Source Server         : mybatis
 Source Server Type    : MySQL
 Source Server Version : 50615
 Source Host           : localhost:3306
 Source Schema         : dsqimo

 Target Server Type    : MySQL
 Target Server Version : 50615
 File Encoding         : 65001

 Date: 05/07/2018 18:15:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for backuser
-- ----------------------------
DROP TABLE IF EXISTS `backuser`;
CREATE TABLE `backuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `intro` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of backuser
-- ----------------------------
INSERT INTO `backuser` VALUES (1, 'admin', 'admin', '超级管理员', 1, NULL);
INSERT INTO `backuser` VALUES (4, 'q', '123', '屌丝管理员', 1, NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (6, 13);
INSERT INTO `cart` VALUES (7, 10);
INSERT INTO `cart` VALUES (8, 43);
INSERT INTO `cart` VALUES (9, 44);

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proid` int(11) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `total` double(15, 3) NULL DEFAULT NULL,
  `cartid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cartid`(`cartid`) USING BTREE,
  CONSTRAINT `cartitem_fk` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ordertable
-- ----------------------------
DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `count` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `order_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ordertable
-- ----------------------------
INSERT INTO `ordertable` VALUES (1, 'lyp', '2018-06-01 11:00:54', 13, 1, '1,1,1,', '阿迪,Anta,nike,');
INSERT INTO `ordertable` VALUES (2, 'lyp', '2018-06-01 11:03:59', 13, 1, '1,1,', 'Anta,杰克琼斯,');
INSERT INTO `ordertable` VALUES (3, 'lyp', '2018-06-05 16:57:12', 13, 1, '1,1,', '鸿星尔克,nike,');
INSERT INTO `ordertable` VALUES (4, 'lyp', '2018-06-05 17:23:55', 13, 1, '1,1,', '12,阿迪,');
INSERT INTO `ordertable` VALUES (5, 'luyanpu', '2018-06-05 18:02:45', 44, 1, '1,1,', '亚瑟士,Anta,');
INSERT INTO `ordertable` VALUES (6, 'lyp', '2018-06-05 18:19:16', 13, 1, '1,', 'Anta,');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(15, 3) NULL DEFAULT NULL,
  `saleprice` double(15, 3) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'nike', 300.000, 240.000, 92);
INSERT INTO `product` VALUES (2, 'Anta', 10000.000, 800.000, 75);
INSERT INTO `product` VALUES (3, '鸿星尔克', 300.000, 150.000, 81);
INSERT INTO `product` VALUES (4, '阿迪', 800.000, 400.000, 97);
INSERT INTO `product` VALUES (5, '亚瑟士', 600.000, 300.000, 95);
INSERT INTO `product` VALUES (6, '鳄鱼', 30000.000, 29999.000, 98);
INSERT INTO `product` VALUES (7, '361', 700.000, 400.000, 100);
INSERT INTO `product` VALUES (8, '李宁', 500.000, 250.000, 100);
INSERT INTO `product` VALUES (9, '新百伦', 300.000, 200.000, 100);
INSERT INTO `product` VALUES (10, '阿迪王', 1000000.000, 60000.000, 100);
INSERT INTO `product` VALUES (11, '意尔康', 15.000, 0.000, 100);
INSERT INTO `product` VALUES (12, '七匹狼', 400.000, 0.000, 100);
INSERT INTO `product` VALUES (13, '杰克琼斯', 300.000, 0.000, 99);
INSERT INTO `product` VALUES (14, '七匹狼', 100.000, 0.000, 100);
INSERT INTO `product` VALUES (15, '七匹狼', 1.000, 0.000, 100);
INSERT INTO `product` VALUES (16, '七匹狼', 100.000, 10.000, 100);
INSERT INTO `product` VALUES (17, '12', 1.000, 0.000, 99);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `productid` int(11) NOT NULL,
  `producttypeid` int(11) NOT NULL,
  PRIMARY KEY (`productid`, `producttypeid`) USING BTREE,
  INDEX `productid`(`productid`) USING BTREE,
  INDEX `producttypeid`(`producttypeid`) USING BTREE,
  CONSTRAINT `product_type_fk` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_type_fk1` FOREIGN KEY (`producttypeid`) REFERENCES `producttype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (1, 1);
INSERT INTO `product_type` VALUES (2, 1);
INSERT INTO `product_type` VALUES (3, 1);
INSERT INTO `product_type` VALUES (4, 2);
INSERT INTO `product_type` VALUES (5, 1);
INSERT INTO `product_type` VALUES (6, 5);
INSERT INTO `product_type` VALUES (7, 5);
INSERT INTO `product_type` VALUES (8, 5);
INSERT INTO `product_type` VALUES (9, 5);
INSERT INTO `product_type` VALUES (10, 2);
INSERT INTO `product_type` VALUES (11, 1);
INSERT INTO `product_type` VALUES (12, 2);
INSERT INTO `product_type` VALUES (13, 5);
INSERT INTO `product_type` VALUES (14, 5);
INSERT INTO `product_type` VALUES (16, 2);
INSERT INTO `product_type` VALUES (17, 1);

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of producttype
-- ----------------------------
INSERT INTO `producttype` VALUES (1, '篮球鞋');
INSERT INTO `producttype` VALUES (2, '板鞋');
INSERT INTO `producttype` VALUES (5, '运动鞋');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (13, 'lyp', '123456', 'pu971954596@qq.com', 1);
INSERT INTO `user` VALUES (44, 'luyanpu', '123456', 'pu971954596@qq.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
