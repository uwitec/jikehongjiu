/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : jxc

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2010-07-16 00:44:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dep_info`
-- ----------------------------
DROP TABLE IF EXISTS `dep_info`;
CREATE TABLE `dep_info` (
  `dep_id` varchar(255) NOT NULL,
  `dep_name` varchar(255) NOT NULL,
  `dep_remark` varchar(255) default NULL,
  PRIMARY KEY  (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of dep_info
-- ----------------------------

-- ----------------------------
-- Table structure for `goods_info`
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `ida` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dep` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY  (`ida`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES ('001', '干红', 'xs', '1800');
INSERT INTO `goods_info` VALUES ('002', '干白', 'xs', '1750');
INSERT INTO `goods_info` VALUES ('003', '葡萄酒', 'xs', '1850');
INSERT INTO `goods_info` VALUES ('004', '毛苔', '把', '1204');

-- ----------------------------
-- Table structure for `im_bill`
-- ----------------------------
DROP TABLE IF EXISTS `im_bill`;
CREATE TABLE `im_bill` (
  `im_id` int(255) NOT NULL auto_increment,
  `im_dept` varchar(255) NOT NULL,
  `im_name` varchar(255) NOT NULL,
  `im_total` double NOT NULL,
  `im_date` date NOT NULL,
  `im_remark` varchar(255) default NULL,
  `im_company` varchar(255) NOT NULL,
  PRIMARY KEY  (`im_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of im_bill
-- ----------------------------
INSERT INTO `im_bill` VALUES ('15', '采购', '002', '4800', '2010-07-27', 'null', '毛苔');
INSERT INTO `im_bill` VALUES ('18', '采购', '006', '6000.00023841858', '2010-07-29', 'null', '红酒');
INSERT INTO `im_bill` VALUES ('19', '杭州', '002', '50000', '2010-07-31', 'null', '浙江');
INSERT INTO `im_bill` VALUES ('21', '昆明', '321', '30258', '2010-07-24', 'null', '云南');
INSERT INTO `im_bill` VALUES ('22', '123', '3', '30258', '2010-07-24', 'null', '123');
INSERT INTO `im_bill` VALUES ('23', '345', '345', '4165875', '2010-07-31', 'null', '345');
INSERT INTO `im_bill` VALUES ('24', '789', '789', '17220', '2010-07-31', 'null', '798');
INSERT INTO `im_bill` VALUES ('25', 'wer', 'wer', '30258', '2010-07-31', 'null', 'war');
INSERT INTO `im_bill` VALUES ('26', 'f', 'fe ', '2', '2010-07-23', 'null', 'fw ');
INSERT INTO `im_bill` VALUES ('27', '546', '546', '312', '2010-07-29', 'null', '文理');
INSERT INTO `im_bill` VALUES ('28', '计科', '罗涛', '6050.00013113022', '2010-07-31', 'null', '行健');

-- ----------------------------
-- Table structure for `im_goods`
-- ----------------------------
DROP TABLE IF EXISTS `im_goods`;
CREATE TABLE `im_goods` (
  `im_id` int(255) NOT NULL,
  `ida` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `number` double NOT NULL,
  `rat` float NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY  (`im_id`,`ida`),
  KEY `im_id` (`im_id`),
  KEY `ida` (`ida`),
  CONSTRAINT `im_goods_ibfk_1` FOREIGN KEY (`ida`) REFERENCES `goods_info` (`ida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `im_goods_ibfk_2` FOREIGN KEY (`im_id`) REFERENCES `im_bill` (`im_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of im_goods
-- ----------------------------
INSERT INTO `im_goods` VALUES ('15', '002', '100', '12', '1', '2400');
INSERT INTO `im_goods` VALUES ('15', '003', '100', '12', '1', '2400');
INSERT INTO `im_goods` VALUES ('18', '001', '100', '50', '0.2', '6000.00023841858');
INSERT INTO `im_goods` VALUES ('19', '003', '100', '100', '1', '20000');
INSERT INTO `im_goods` VALUES ('19', '004', '150', '100', '1', '30000');
INSERT INTO `im_goods` VALUES ('21', '002', '123', '123', '1', '30258');
INSERT INTO `im_goods` VALUES ('22', '004', '123', '123', '1', '30258');
INSERT INTO `im_goods` VALUES ('23', '001', '345', '345', '34', '4165875');
INSERT INTO `im_goods` VALUES ('24', '002', '123', '70', '1', '17220');
INSERT INTO `im_goods` VALUES ('25', '002', '123', '123', '1', '30258');
INSERT INTO `im_goods` VALUES ('26', '002', '1', '1', '1', '2');
INSERT INTO `im_goods` VALUES ('27', '002', '12', '13', '1', '312');
INSERT INTO `im_goods` VALUES ('28', '001', '110', '50', '0.1', '6050.00013113022');

-- ----------------------------
-- Table structure for `provider`
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `pro_id` varchar(255) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_person` varchar(255) default NULL,
  `pro_tel` varchar(255) NOT NULL,
  `pro_add` varchar(255) default NULL,
  PRIMARY KEY  (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of provider
-- ----------------------------

-- ----------------------------
-- Table structure for `re_bill`
-- ----------------------------
DROP TABLE IF EXISTS `re_bill`;
CREATE TABLE `re_bill` (
  `re_id` int(255) NOT NULL auto_increment,
  `im_id` int(11) NOT NULL,
  `re_dept` varchar(255) NOT NULL,
  `re_total` double NOT NULL,
  `re_name` varchar(255) NOT NULL,
  `re_date` date NOT NULL,
  `re_remark` varchar(255) default NULL,
  `re_company` varchar(255) default NULL,
  PRIMARY KEY  (`re_id`),
  KEY `im_id` (`im_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='InnoDB free: 3072 kB; (`im_id`) REFER `jxc/im_bill`(`im_id`)';

-- ----------------------------
-- Records of re_bill
-- ----------------------------
INSERT INTO `re_bill` VALUES ('10', '18', '成都', '12000.0004768372', '006', '2010-07-29', 'null', '四川');
INSERT INTO `re_bill` VALUES ('11', '19', '南充', '50000', '002', '2010-07-31', 'null', '成都');
INSERT INTO `re_bill` VALUES ('12', '19', '广西', '50000', '002', '2010-07-31', 'null', '南宁');
INSERT INTO `re_bill` VALUES ('13', '19', '销售', '20000', '002', '2010-07-31', 'null', '红酒');
INSERT INTO `re_bill` VALUES ('14', '26', 'f', '2', 'fe ', '2010-07-23', 'null', 'fw ');
INSERT INTO `re_bill` VALUES ('15', '28', '计科', '6050.00013113022', '罗涛', '2010-07-31', 'null', '行健');

-- ----------------------------
-- Table structure for `re_goods`
-- ----------------------------
DROP TABLE IF EXISTS `re_goods`;
CREATE TABLE `re_goods` (
  `re_id` int(11) NOT NULL,
  `ida` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `number` double NOT NULL,
  `rat` float NOT NULL,
  `total` double NOT NULL,
  `company` varchar(255) default NULL,
  PRIMARY KEY  (`re_id`,`ida`),
  KEY `ida` (`ida`),
  CONSTRAINT `re_goods_ibfk_1` FOREIGN KEY (`re_id`) REFERENCES `re_bill` (`re_id`),
  CONSTRAINT `re_goods_ibfk_2` FOREIGN KEY (`ida`) REFERENCES `goods_info` (`ida`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='InnoDB free: 3072 kB; (`ida`) REFER `jxc/goods_info`(`ida`);';

-- ----------------------------
-- Records of re_goods
-- ----------------------------
INSERT INTO `re_goods` VALUES ('10', '001', '100', '50', '0.2', '6000.00023841858', null);
INSERT INTO `re_goods` VALUES ('10', '002', '100', '50', '0.2', '6000.00023841858', null);
INSERT INTO `re_goods` VALUES ('11', '003', '100', '100', '1', '20000', null);
INSERT INTO `re_goods` VALUES ('11', '004', '150', '100', '1', '30000', null);
INSERT INTO `re_goods` VALUES ('12', '003', '100', '100', '1', '20000', null);
INSERT INTO `re_goods` VALUES ('12', '004', '150', '100', '1', '30000', null);
INSERT INTO `re_goods` VALUES ('13', '003', '100', '100', '1', '20000', null);
INSERT INTO `re_goods` VALUES ('14', '002', '1', '1', '1', '2', null);
INSERT INTO `re_goods` VALUES ('15', '001', '110', '50', '0.1', '6050.00013113022', null);
