/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : bookstore-sh

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-08-25 15:13:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) DEFAULT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1号系统管理员', 'admin', '123456');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  `lsbn` char(32) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `currPrice` double(8,2) DEFAULT NULL,
  `discount` double(3,1) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publishtime` char(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `wordNum` int(11) DEFAULT NULL,
  `printtime` char(10) DEFAULT NULL,
  `booksize` int(11) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `imageW` varchar(100) DEFAULT NULL,
  `imageB` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `username` varchar(50) DEFAULT '自营',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '图书卖家',
  PRIMARY KEY (`lsbn`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_book_t_category` (`cid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('16', '000A18FDB38F470DBE9CD0972BADB23F', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）', '计算机技术', '贾蓓', '79.80', '55.10', '6.9', '清华大学出版社', '2013-7-1', '1', '640', '1030000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23268958-1_w.jpg', '23268958-1_b.jpg', '无', '李四', '2');
INSERT INTO `book` VALUES ('58', '0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', '计算机技术', 'Richard', '99.00', '68.30', '6.9', '人民邮电出版社', '2013-1-1', '1', '468', '721000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22938396-1_w.jpg', '22938396-1_b.jpg', '无', '李四', '2');
INSERT INTO `book` VALUES ('12', '0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '计算机技术', '昊斯特曼', '98.00', '67.60', '6.9', '机械工业出版社', '2008-6-1', '1', '694', '0', '2008-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20285763-1_w.jpg', '20285763-1_b.jpg', '无', '李四', '2');
INSERT INTO `book` VALUES ('94', '113D0D1BB9174DD19A7DE7E2B37F677F', 'Java7入门经典（跟编程导师Ivor Horton学Java 预计到货日期9月初）', '计算机技术', '霍尔顿', '118.00', '81.40', '6.9', '清华大学出版社', '2012-8-1', '1', '1124', '1918000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22813026-1_w.jpg', '22813026-1_b.jpg', '无', '李四', '2');
INSERT INTO `book` VALUES ('65', '1286B13F0EA54E4CB75434762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', '计算机技术', '霍斯特曼', '109.00', '75.20', '6.9', '人民邮电出版社', '2013-7-1', '1', '0', '1197000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23280479-1_w.jpg', '23280479-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('83', '13EBF9B1FDE346A683A1C45BD6773ECB', 'Java开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '计算机技术', '无', '99.00', '68.30', '6.9', '清华大学出版社', '0', '1', '0', '1754000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21110930-1_w_1.jpg', '21110930-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('86', '1A15DC5E8A014A58862ED741D579B530', 'Java深入解析——透析Java本质的36个话题', '计算机技术', '梁勇', '49.00', '33.80', '6.9', '电子工业出版社', '2013-11-1', '1', '298', '424000', '2013-11-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23363997-1_w_1.jpg', '23363997-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('93', '210A3DCA429049C78B623C3986BEB136', 'JavaScript经典教程套装：JavaScript高级程序设计(第3版)+JavaScript DOM编程艺术(第2版)(套装共2册)(超值附赠《码农》光盘1张)', '计算机技术', 'Nicholas C. Zakas', '148.00', '88.80', '6.0', '人民邮电出版社', '2013-4-1', '1', '1048', '0', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23224089-1_w.jpg', '23224089-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('20', '22234CECF15F4ECB813F0B433DDA5365', 'JavaScript从入门到精通（附光盘1张）（连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库）', '计算机技术', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', '1', '532', '939000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22862057-1_w.jpg', '22862057-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('56', '230A00EC22BF4A1DBA87C64800B54C8D', 'Struts2技术内幕：深入解析Struts架构设计与实现原理', '计算机技术', '陆舟', '69.00', '47.60', '6.9', '机械工业出版社', '2012-1-1', '1', '379', '0', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22577578-1_w.jpg', '22577578-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('74', '260F8A3594F741C1B0EB69616F65045B', 'Tomcat与Java Web开发技术详解（第2版）(含光盘1张)', '计算机技术', '孙卫琴', '79.50', '54.90', '6.9', '电子工业出版社', '2009-1-1', '1', '734', '1216000', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20420983-1_w.jpg', '20420983-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('18', '28A03D28BAD449659A77330BE35FCD65', 'JAVA核心技术卷II：高级特性（原书第8版）', '计算机技术', '霍斯特曼', '118.00', '81.40', '6.9', '机械工业出版社', '2008-12-1', '1', '852', '0', '2008-12-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20446562-1_w.jpg', '20446562-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('54', '2EE1A20A6AF742E387E18619D7E3BB94', 'Java虚拟机并发编程(Java并发编程领域的里程碑之作，资深Java技术专家、并发编程专家、敏捷开发专家和Jolt大奖得主撰写，Amazon五星畅销书)', '计算机技术', 'Venkat Subramaniam', '59.00', '40.70', '6.9', '机械工业出版社', '2013-5-1', '1', '215', '0', '2013-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23239786-1_w.jpg', '23239786-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('34', '33ACF97A9A374352AE9F5E89BB791262', '基于MVC的JavaScript Web富应用开发', '计算机技术', '麦卡劳', '59.00', '40.70', '6.9', '电子工业出版社', '2012-5-1', '1', '282', '462000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22757564-1_w.jpg', '22757564-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('32', '37F75BEAE1FE46F2B14674923F1E7987', '数据结构与算法分析Java语言描述 第2版', '计算机技术', '韦斯', '55.00', '38.00', '6.9', '机械工业出版社', '2009-1-1', '2', '440', '0', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20417467-1_w.jpg', '20417467-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('36', '39F1D0803E8F4592AE1245CACE683214', 'Java程序员修炼之道', '计算机技术', '埃文斯', '89.00', '61.40', '6.9', '人民邮电出版社', '2013-8-1', '1', '395', '658000', '2013-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23301847-1_w_1.jpg', '23301847-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('66', '3AE5C8B976B6448A9D3A155C1BDE12BC', '深入理解Java虚拟机:JVM高级特性与最佳实践（超级畅销书，6个月5次印刷，从实践角度解析JVM工作原理，Java程序员必备）', '计算机技术', '周志明', '69.00', '47.60', '6.9', '机械工业出版社', '0', '1', '0', '0', '2011-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21108671-1_w_1.jpg', '21108671-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('9', '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '计算机技术', '霍斯特曼，科内尔', '119.00', '82.10', '6.9', '机械工业出版社', '2014-1-1', '1', '704', '0', '2014-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23362142-1_w_1.jpg', '23362142-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('25', '3E1990E19989422E9DA735978CB1E4CE', 'Effective Java中文版(第2版)', '计算机技术', '布洛克', '52.00', '35.90', '6.9', '机械工业出版社', '2009-1-1', '2', '287', '0', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20459091-1_w.jpg', '20459091-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('88', '400D94DE5A0742B3A618FC76DF107183', 'JavaScript宝典（第7版）（配光盘）', '计算机技术', '古德曼', '128.00', '88.30', '6.9', '清华大学出版社', '2013-1-1', '1', '1012', '1657000', '2013-1-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23169892-1_w.jpg', '23169892-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('48', '4491EA4832E04B8B94F334B71E871983', 'Java语言程序设计：进阶篇（原书第8版）', '计算机技术', '梁勇', '79.00', '54.50', '6.9', '机械工业出版社', '2011-6-1', '1', '507', '0', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21117631-1_w_1.jpg', '21117631-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('4', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '计算机技术', '弗兰纳根', '139.00', '95.30', '6.9', '机械工业出版社', '2012-4-1', '1', '1004', '0', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22722790-1_w.jpg', '22722790-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('51', '49D98E7916B94232862F7DCD1B0BAB66', 'HTML5+JavaScript动画基础', '计算机技术', '兰贝塔', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-6-1', '1', '393', '553000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23266633-1_w.jpg', '23266633-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('11', '4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '计算机技术', 'Craig Walls', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-6-1', '1', '374', '487000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23254532-1_w.jpg', '23254532-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('23', '4BF6D97DD18A4B77B8DED9B057577F8F', 'Java Web从入门到精通（附光盘1张）（连续8月Java类全国零售排行前2名，27小时视频，951个经典实例、369项面试真题、596项测试史上最全资源库）', '计算机技术', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', '1', '547', '979000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22862056-1_w.jpg', '22862056-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('17', '4C3331CAD5A5453787A94B8D7CCEAA29', 'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘', '计算机技术', '刘京华', '99.80', '68.90', '6.9', '清华大学出版社', '2010-1-1', '1', '1010', '1368000', '2010-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20756351-1_w_1.jpg', '20756351-1_b_1.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('79', '4D20D2450B084113A331D909FF4975EB', 'jQuery实战(第2版)(畅销书升级版，掌握Web开发利器必修宝典)', '计算机技术', 'Bear Bibeault　Yehuda Katz', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-3-1', '1', '394', '617000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22638286-1_w.jpg', '22638286-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('68', '4E44405DAFB7413E8A13BBFFBEE73AC7', 'JavaScript经典实例', '计算机技术', '鲍尔斯', '78.00', '53.80', '6.9', '中国电力出版社', '2012-3-1', '1', '512', '625000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22692811-1_w.jpg', '22692811-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('71', '504FB999B0444B339907090927FDBE8A', '深入浅出Ext JS(第3版)', '计算机技术', '徐会生', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-10-1', '3', '413', '642000', '2013-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23351049-1_w_1.jpg', '23351049-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('52', '52077C8423B645A9BADA96A5E0B14422', 'Spring源码深度解析', '计算机技术', '郝佳', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-9-1', '1', '386', '545000', '2013-8-30', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23329703-1_w_1.jpg', '23329703-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('81', '52B0EDFF966E4A058BDA5B18EEC698C4', '亮剑Java Web项目开发案例导航(含DVD光盘1张)', '计算机技术', '朱雪琴', '69.00', '41.40', '6.0', '电子工业出版社', '2012-3-1', '1', '526', '875000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22623766-1_w.jpg', '22623766-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('24', '5315DA60D24042889400AD4C93A37501', 'Spring 3.x企业应用开发实战(含CD光盘1张)', '计算机技术', '陈雄华', '90.00', '62.10', '6.9', '电子工业出版社', '2012-2-1', '1', '710', '1158000', '2012-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22605701-1_w.jpg', '22605701-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('89', '56B1B7D8CD8740B098677C7216A673C4', '疯狂 Java 程序员的基本修养（《疯狂Java讲义》最佳拍档，扫清知识死角，夯实基本功）', '计算机技术', '李刚', '59.00', '40.70', '6.9', '电子工业出版社', '2013-1-1', '1', '484', '7710000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23042420-1_w.jpg', '23042420-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('8', '57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', '计算机技术', 'Guillermo Rauch', '79.00', '54.50', '6.9', '电子工业出版社', '2014-1-1', '1', '292', '436000', '2014-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23368351-1_w_2.jpg', '23368351-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('1', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', null, '明日科技', '59.80', '41.30', '6.9', '清华大学出版社', '2012-9-1', '3', '564', '1013000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22862060-1_w.jpg', '22862060-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('5', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '计算机技术', 'Nicholas C. Zakas', '99.00', '68.30', '6.9', '人民邮电出版社', '2012-3-1', '1', '730', '1092000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22628333-1_w.jpg', '22628333-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('27', '5EDB981339C342ED8DB17D5A198D50DC', 'Java程序性能优化', null, '葛一鸣', '59.00', '40.70', '6.9', '清华大学出版社', '2012-10-1', '1', '400', '649000', '2012-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22881618-1_w.jpg', '22881618-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('40', '6398A7BA400D40258796BCBB2B256068', 'JavaScript设计模式', '计算机技术', 'Addy Osmani', '49.00', '33.80', '6.9', '人民邮电出版社', '2013-6-1', '1', '241', '301000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23266635-1_w.jpg', '23266635-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('42', '676B56A612AF4E968CF0F6FFE289269D', 'JavaScript和jQuery实战手册（原书第2版）', null, '麦克法兰', '99.00', '68.30', '6.9', '机械工业出版社', '2013-3-11', '1', '504', '0', '2013-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23201813-1_w.jpg', '23201813-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('64', '7917F5B19A0948FD9551932909328E4E', 'Java项目开发案例全程实录（第2版）（配光盘）（软件项目开发全程实录丛书）', '计算机技术', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2011-1-1', '2', '605', '1037000', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20991549-1_w_1.jpg', '20991549-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('50', '7C0C785FFBEC4DEC802FA36E8B0BC87E', '深入分析Java Web技术内幕', null, '许令波', '69.00', '47.60', '6.9', '电子工业出版社', '2012-9-1', '1', '442', '746000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22881803-1_w.jpg', '22881803-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('44', '7CD79C20258F477AB841518D9312E843', 'Java程序员面试宝典（第三版）', '计算机技术', '欧立奇', '49.00', '33.80', '6.9', '电子工业出版社', '2013-9-1', '1', '359', '446400', '2013-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23348683-1_w_1.jpg', '23348683-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('46', '7D7FE81293124793BDB2C6FF1F1C943D', '21天学通Java(第6版)（中文版累计销量超30000册）', null, 'Rogers Cadenhead', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '1', '410', '781000', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23219731-1_w.jpg', '23219731-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('35', '7FD7F50B15F74248AA769798909F8653', 'Java网络编程（第3版）——O’Reilly Java系列', '计算机技术', '哈诺德', '85.00', '51.00', '6.0', '中国电力出版社', '2005-11-1', '1', '718', '668000', '2005-11-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '9062293-1_w.jpg', '9062293-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('91', '819FF56E4423462394E6F83882F78975', '学通Java Web的24堂课（配光盘）（软件开发羊皮卷）', null, '陈丹丹', '79.80', '55.10', '6.9', '清华大学出版社', '2011-6-1', '1', '718', '1488000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21118835-1_w_1.jpg', '21118835-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('85', '81FADA99309342F4978D5C680B0C6E8C', 'Java入门很简单（配光盘）（入门很简单丛书）（打开Java编程之门 Java技术网推荐）', '计算机技术', '李世民', '59.80', '41.30', '6.9', '清华大学出版社', '2012-8-1', '1', '459', '745000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22839309-1_w.jpg', '22839309-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('73', '89A57D099EA14026A5C3D10CFC10C22C', 'Java 2实用教程（第4版）（21世纪高等学校计算机基础实用规划教材）', null, '耿祥义', '39.50', '31.60', '8.0', '清华大学出版社', '2012-8-1', '4', '479', '782000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22844118-1_w.jpg', '22844118-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('57', '8A5B4042D5B14D6B87A34DABF327387F', 'Java核心技术 卷II：高级特性(第9版·英文版)(上、下册)', '计算机技术', '霍斯特曼', '119.00', '82.10', '6.9', '人民邮电出版社', '2013-7-1', '1', '1118', '1370000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23280478-1_w.jpg', '23280478-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('75', '8DD0ADF2665B40899E09ED2983DC3F7B', 'jQuery权威指南（被公认的权威的、易学的jQuery实战教程，多次重印，热销中）', null, '陶国荣', '59.00', '40.70', '6.9', '机械工业出版社', '2011-1-1', '1', '385', '0', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21006995-1_w_1.jpg', '21006995-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('6', '8E16D59BA4C34374A68029AE877613C4', '轻量级Java EE企业应用实战（第3版）：Struts 2＋Spring 3＋Hibernate整合开发(含CD光盘1张)', '计算机技术', '李刚', '99.00', '68.30', '6.9', '电子工业出版社', '2012-4-1', '1', '816', '1440000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22685703-1_w.jpg', '22685703-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('49', '8F1520F2CED94C679433B9C109E791CB', 'Java从入门到精通（实例版）（附光盘1张）（连续8月Java类全国零售排行前2名，14小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', null, '明日科技', '69.80', '47.60', '6.9', '清华大学出版社', '2012-9-1', '1', '548', '986000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22862061-1_w.jpg', '22862061-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('45', '90E423DBE56042838806673DB3E86BD3', '《Spring技术内幕（第2版）》（畅销书全新升级，Spring类图书销量桂冠，从宏观和微观两个角度解析Spring架构设计和实现原理）', '计算机技术', '计文柯', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '2', '399', '0', '2012-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22606836-1_w.jpg', '22606836-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('70', '926B8F31C5D04F61A72F66679A0CCFFD', 'JavaScript编程精解（华章程序员书库）（JavaScript之父高度评价并强力推荐，系统学习JS首选！）', null, '哈弗贝克', '49.00', '33.80', '6.9', '械工业出版社', '2012-9-1', '1', '162', '0', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22873894-1_w.jpg', '22873894-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('13', '95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', '计算机技术', '塞若', '79.00', '47.40', '6.0', '中国电力出版社', '2007-2-1', '1', '689', '983000', '2001-7-2', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '9265169-1_w.jpg', '9265169-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('3', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '计算机技术', '刘西杰', '49.00', '32.90', '6.7', '人民邮电出版社', '2012-12-24', '1', '450', '705000', '2012-12-24', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22928649-1_w.jpg', '22928649-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('28', '9923901FBF124623BC707920D8936BC8', 'JavaScript DOM编程艺术(第2版)', null, '基思', '49.00', '33.80', '6.9', '人民邮电出版社', '2011-4-1', '1', '286', '443000', '2011-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21049601-1_w_1.jpg', '21049601-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('78', '99BF63AC12AD48FCB673F1820888964E', 'Java Web开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '计算机技术', '无', '99.00', '67.40', '6.8', '清华大学出版社', '0', '0', '0', '1746000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21110929-1_w_1.jpg', '21110929-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('53', '9D257176A6934CB79427CEC37E69249F', '疯狂Ajax讲义（第3版）--jQuery/Ext JS/Prototype/DWR企业应用前端开发实战(含CD光盘1张)（畅销书升级版，企业应用前端开发实战指南）', '计算机技术', '李刚', '79.00', '54.50', '6.9', '电子工业出版社', '2013-2-1', '1', '624', '997000', '2013-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23184673-1_w.jpg', '23184673-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('31', '9FF423101836438F874035A48498CF45', 'Java编程思想（英文版·第4版）', '计算机技术', '埃克尔', '79.00', '54.50', '6.9', '机械工业出版社', '2007-4-1', '1', '1482', '0', '2007-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '9288920-1_w.jpg', '9288920-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('60', 'A3D464D1D1344ED5983920B472826730', 'Java Web开发详解：XML+DTD+XML Schema+XSLT+Servlet 3 0+JSP 2 2深入剖析与实例应用(含CD光盘1张)', null, '孙鑫', '119.00', '61.30', '5.2', '电子工业出版社', '2012-5-1', '1', '889', '1760000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22788412-1_w.jpg', '22788412-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('90', 'A46A0F48A4F649AE9008B38EA48FAEBA', 'Java编程全能词典(含DVD光盘2张)', '计算机技术', '明日科技', '98.00', '65.70', '6.7', '电子工业出版社', '2010-3-1', '1', '486', '496000', '2010-3-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20813806-1_w_1.jpg', '20813806-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('61', 'A5A6F27DCD174614850B26633A0B4605', 'JavaScript模式', null, '斯特凡洛夫', '38.00', '22.80', '6.0', '中国电力出版社', '2012-7-1', '1', '208', '253000', '2012-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22819430-1_w.jpg', '22819430-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('77', 'A7220EF174704012830E066FDFAAD4AD', 'Spring 3.0就这么简单（国内原创的Java敏捷开发图书，展现作者Spring原创开源项目ROP开发的全过程，所有项目工程均以Maven组织）', '计算机技术', '陈雄华', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-1-1', '1', '380', '530000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22938474-1_w.jpg', '22938474-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('92', 'A7EFD99367C9434682A790635D3C5FDF', 'Java Web技术整合应用与项目实战（JSP+Servlet+Struts2+Hibernate+Spring3）', null, '张志锋', '98.00', '67.60', '6.9', '清华大学出版社', '2013-6-1', '1', '878', '0', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23266270-1_w.jpg', '23266270-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('30', 'A8EF76FD21A645109538614DEA85F3F7', 'Java语言程序设计：基础篇（原书第8版）', '计算机技术', '梁勇', '75.00', '51.80', '6.9', '机械工业出版社', '2011-6-1', '1', '586', '0', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '21122188-1_w_1.jpg', '21122188-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('38', 'AD6EA79CCB8240AAAF5B292AD7E5DCAA', 'jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）', '计算机技术', '陶国荣', '59.00', '40.70', '6.9', '机械工业出版社', '2012-8-1', '1', '249', '0', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22847009-1_w.jpg', '22847009-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('37', 'AE0935F13A214436B8599DE285A86220', 'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)', '计算机技术', 'Tom Negrino　Dori Smith', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-4-1', '1', '392', '694000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22717349-1_w.jpg', '22717349-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('55', 'AF28ED8F692C4288B32CF411CBDBFC23', '经典Java EE企业应用实战——基于WebLogic/JBoss的JSF+EJB 3+JPA整合开发(含CD光盘1张)', null, '无', '79.00', '54.50', '6.9', '电子工业出版社', '2010-8-1', '1', '0', '0', '2010-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20928547-1_w_1.jpg', '20928547-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('22', 'B329A14DDEF8455F82B3FDF25821D2BB', '名师讲坛——Java Web开发实战经典基础篇（JSP、Servlet、Struts、Ajax）（32小时全真课堂培训，视频超级给力！390项实例及分析，北京魔乐科技培训中心Java Web全部精华）', '计算机技术', '李兴华', '69.80', '48.20', '6.9', '清华大学出版社', '2010-8-1', '1', '554', '819000', '2010-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20915948-1_w_3.jpg', '20915948-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('10', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '计算机技术', '单东林', '49.00', '33.80', '6.9', '人民邮电出版社', '2012-7-1', '2', '380', '598000', '2012-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22786088-1_w.jpg', '22786088-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('63', 'BD1CB005E4A04DCA881DA8689E21D4D0', 'jQuery UI开发指南', null, 'Eric Sarrion', '39.00', '26.90', '6.9', '人民邮电出版社', '2012-12-1', '1', '212', '286000', '2012-12-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22910975-1_w.jpg', '22910975-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('95', 'C23E6E8A6DB94E27B6E2ABD39DC21AF5', 'JavaScript:The Good Parts(影印版）', '程序设计', '克罗克福特', '28.00', '19.30', '6.9', '东南大学出版社', '2009-1-1', '1', '153', '181000', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20412979-1_w.jpg', '20412979-1_b.jpg', '测试，这是一本javascript的书测试测试测试', '自营', '0');
INSERT INTO `book` VALUES ('29', 'C3CF52B3ED2D4187A16754551488D733', 'Java从入门到精通（附光盘）', null, '魔乐科技', '59.00', '35.40', '6.0', '人民邮电出版社', '2010-4-1', '1', '519', '884000', '2010-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20810282-1_w_1.jpg', '20810282-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('84', 'C86D3F6FACB449BEBD940D9307ED4A47', '编写高质量代码：改善Java程序的151个建议(从语法、程序设计和架构、工具和框架、编码风格、编程思想5个方面探讨编写高质量Java代码的技巧、禁忌和最佳实践)', '计算机技术', '秦小波', '59.00', '40.70', '6.9', '机械工业出版社', '2012-1-1', '1', '303', '0', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22579686-1_w.jpg', '22579686-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('33', 'CB0AB3654945411EA69F368D0EA91A00', 'JavaScript语言精粹（修订版）', null, '道格拉斯·克罗克福德', '49.00', '39.20', '8.0', '电子工业出版社', '2012-9-1', '1', '155', '258000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22872884-1_w.jpg', '22872884-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('19', 'CD913617EE964D0DBAF20C60076D32FB', '名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）', '计算机技术', '李兴华', '79.80', '55.10', '6.9', '清华大学出版社', '2009-8-1', '1', '831', '1222000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20637368-1_w_2.jpg', '20637368-1_b_2.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('2', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', null, '布鲁斯.艾克尔', '108.00', '74.50', '6.9', '机械工业出版社', '2007-6-1', '1', '880', '0', '2007-6-1', '0', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '9317290-1_w.jpg', '9317290-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('43', 'CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '计算机技术', '袁江', '79.80', '55.10', '6.9', '清华大学出版社', '2013-6-1', '1', '619', '1109000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23263012-1_w.jpg', '23263012-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('26', 'D0DA36CEE42549FFB299B7C7129761D5', 'Java应用架构设计：模块化模式与OSGi(全球资深Java技术专家的力作，系统、全面地讲解如何将模块化设计思想引入开发中，涵盖18个有助于实现模块化软件架构的模式)', null, '克内恩席尔德', '69.00', '47.60', '6.9', '机械工业出版社', '2013-9-1', '1', '251', '0', '2013-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23339643-1_w.jpg', '23339643-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('15', 'D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', '计算机技术', 'Brian Goetz', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '1', '290', '0', '2012-2-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22606835-1_w.jpg', '22606835-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('62', 'D2ABA8B06C524632846F27C34568F3CE', 'Java 经典实例', null, '达尔文', '98.00', '67.60', '6.9', '中国电力出版社', '2009-2-1', '1', '784', '805000', '2009-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20500255-1_w.jpg', '20500255-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('14', 'D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '计算机技术', '周志明', '79.00', '54.50', '6.9', '机械工业出版社', '2013-6-1', '2', '433', '0', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23259731-1_w.jpg', '23259731-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('72', 'DC36FD53A1514312A0A9ADD53A583886', 'JavaScript异步编程：设计快速响应的网络应用【掌握JavaScript异步编程必杀技，让代码更具响应度！ 】', '计算机技术', 'Trevor Burnham', '32.00', '22.10', '6.9', '人民邮电出版社', '2013-6-1', '1', '118', '98000', '2013-5-23', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23252196-1_w.jpg', '23252196-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('76', 'DCB64DF0084E486EBF173F729A3A630A', 'Java设计模式(第2版)', null, 'Steven John Metsker', '75.00', '51.80', '6.9', '电子工业出版社', '2012-9-1', '1', '0', '0', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22868759-1_w.jpg', '22868759-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('21', 'DEE7BDC7E0E343149E3C3601D2658171', '疯狂HTML 5/CSS 3/JavaScript讲义(含CD光盘1张)', '计算机技术', '李刚', '69.00', '47.60', '6.9', '电子工业出版社', '2012-5-1', '1', '500', '819000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22783904-1_w.jpg', '22783904-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('39', 'DF4E74EEE89B43229BB8212F0B858C38', '精通Hibernate：Java对象持久化技术详解（第2版）(含光盘1张)', '计算机技术', '孙卫琴', '75.00', '51.80', '6.9', '电子工业出版社', '2010-2-1', '1', '695', '1148800', '2010-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20773347-1_w_1.jpg', '20773347-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('7', 'E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', null, '李刚', '109.00', '75.20', '6.9', '电子工业出版社', '2012-1-1', '1', '844', '1747000', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22588603-1_w.jpg', '22588603-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('59', 'EA695342393C4BE48B831FA5E6B0E5C4', '编写可维护的JavaScript《JavaScript高级程序设计》作者Nicholas Zakas最新力作，构建编码风格手册，帮助开发团队从“游击队”走向“正规军”）', '计算机技术', 'Nicholas C. Zakas', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '1', '227', '400000', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23200995-1_w.jpg', '23200995-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('87', 'F0E34313BF304CCEBF198BD4E05307B8', 'jQuery Cookbook中文版（jQuery之父鼎力推荐，社区数十位专家倾情力作', null, 'jQuery社区专家组', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-5-1', '1', '425', '573000', '2013-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23219358-1_w.jpg', '23219358-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('80', 'F6162799E913423EA5CB57BEC65AB1E9', 'JUnit实战(第2版)', '计算机技术', '塔凯文', '79.00', '54.50', '6.9', '人民邮电出版社', '2012-4-1', '1', '442', '640000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22633574-1_w.jpg', '22633574-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('41', 'F693239BC3B3444C8538ABE7411BB38E', 'Java Web典型模块与项目实战大全（配光盘）', '计算机技术', '常建功', '99.50', '68.70', '6.9', '清华大学出版社', '2011-1-1', '1', '922', '1473000', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '20988080-1_w_1.jpg', '20988080-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('69', 'F78C94641DB4475BBA1E72A07DF9B3AE', 'JAVA面向对象编程', null, '孙卫琴', '65.80', '45.40', '6.9', '电子工业出版社', '2006-7-1', '1', '625', '1030400', '2006-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '9186890-1_w.jpg', '9186890-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('67', 'FC232CD9B6E6411BBBB1A5B781D2C3C9', 'Java与模式(含盘)（超多实例和习题，详解设计原则与设计模式）', '计算机技术', '阎宏', '88.00', '60.70', '6.9', '电子工业出版社', '2002-10-1', '1', '1024', '16704000', '2002-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '696673-1_w.jpg', '696673-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('82', 'FEC3740CF30E442A94021911A25EF0D7', 'Spring攻略(第2版)(Spring攻略(第2版))', null, 'Gary Mak　Josh Long　Daniel Rubio', '128.00', '88.30', '6.9', '人民邮电出版社', '2012-3-1', '1', '938', '1322000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '22623020-1_w.jpg', '22623020-1_b.jpg', '无', '自营', '0');
INSERT INTO `book` VALUES ('47', 'FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '计算机技术', '周志明', '79.00', '54.50', '6.9', '机械工业出版社', '2013-2-1', '1', '414', '0', '2013-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', '23179003-1_w.jpg', '23179003-1_b.jpg', '无', '自营', '0');

-- ----------------------------
-- Table structure for `cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartitemid` int(11) NOT NULL AUTO_INCREMENT,
  `lsbn` char(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`cartitemid`),
  KEY `fk_userid` (`userid`),
  KEY `fk_lsbn` (`lsbn`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('2', '0BE0707984014E66BD9F34F534FCE0F7', '2', '1');
INSERT INTO `cartitem` VALUES ('8', '113D0D1BB9174DD19A7DE7E2B37F677F', '3', '2');
INSERT INTO `cartitem` VALUES ('9', 'A7EFD99367C9434682A790635D3C5FDF', '3', '1');
INSERT INTO `cartitem` VALUES ('14', 'C23E6E8A6DB94E27B6E2ABD39DC21AF5', '3', '1');
INSERT INTO `cartitem` VALUES ('16', '43232234sdada', '3', '3');
INSERT INTO `cartitem` VALUES ('19', 'EA695342393C4BE48B831FA5E6B0E5C4', '3', '2');
INSERT INTO `cartitem` VALUES ('20', 'AF28ED8F692C4288B32CF411CBDBFC23', '3', '2');
INSERT INTO `cartitem` VALUES ('21', '210A3DCA429049C78B623C3986BEB136', '3', '1');
INSERT INTO `cartitem` VALUES ('23', '676B56A612AF4E968CF0F6FFE289269D', '3', '1');
INSERT INTO `cartitem` VALUES ('24', '49D98E7916B94232862F7DCD1B0BAB66', '3', '1');
INSERT INTO `cartitem` VALUES ('25', '22234CECF15F4ECB813F0B433DDA5365', '3', '1');
INSERT INTO `cartitem` VALUES ('26', '9923901FBF124623BC707920D8936BC8', '3', '1');
INSERT INTO `cartitem` VALUES ('27', '57B6FF1B89C843C38BA39C717FA557D6', '3', '2');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderid` varchar(50) NOT NULL,
  `lsbn` varchar(32) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`,`lsbn`),
  KEY `fk_lsbn` (`lsbn`),
  CONSTRAINT `fk_lsbn` FOREIGN KEY (`lsbn`) REFERENCES `book` (`lsbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('04CAE55D26514F8998243D3377519CD8', '113D0D1BB9174DD19A7DE7E2B37F677F', '3');
INSERT INTO `orderitem` VALUES ('1F1C85A7DC694FDF988ABD52AF2FA85E', 'A7EFD99367C9434682A790635D3C5FDF', '3');
INSERT INTO `orderitem` VALUES ('1F1C85A7DC694FDF988ABD52AF2FA85E', 'C23E6E8A6DB94E27B6E2ABD39DC21AF5', '1');
INSERT INTO `orderitem` VALUES ('2463FD9B8102401C8109FB7531446287', '22234CECF15F4ECB813F0B433DDA5365', '1');
INSERT INTO `orderitem` VALUES ('2463FD9B8102401C8109FB7531446287', '9923901FBF124623BC707920D8936BC8', '1');
INSERT INTO `orderitem` VALUES ('3EC8B0852A60449C92056251A18424AC', '113D0D1BB9174DD19A7DE7E2B37F677F', '3');
INSERT INTO `orderitem` VALUES ('3EC8B0852A60449C92056251A18424AC', 'A46A0F48A4F649AE9008B38EA48FAEBA', '1');
INSERT INTO `orderitem` VALUES ('4554097261D44CF48BCDDC22669EE012', '99BF63AC12AD48FCB673F1820888964E', '1');
INSERT INTO `orderitem` VALUES ('4554097261D44CF48BCDDC22669EE012', 'EA695342393C4BE48B831FA5E6B0E5C4', '2');
INSERT INTO `orderitem` VALUES ('6BC9887F43014281A0F781D5E6F0E006', '49D98E7916B94232862F7DCD1B0BAB66', '1');
INSERT INTO `orderitem` VALUES ('6BC9887F43014281A0F781D5E6F0E006', '676B56A612AF4E968CF0F6FFE289269D', '1');
INSERT INTO `orderitem` VALUES ('7C0BA9AB843C45629AEFA13645A17AA3', '22234CECF15F4ECB813F0B433DDA5365', '2');
INSERT INTO `orderitem` VALUES ('7C0BA9AB843C45629AEFA13645A17AA3', '49D98E7916B94232862F7DCD1B0BAB66', '1');
INSERT INTO `orderitem` VALUES ('95640E8BFDCD42E09F164845BCCC6D15', '113D0D1BB9174DD19A7DE7E2B37F677F', '3');
INSERT INTO `orderitem` VALUES ('A4A4355F434846A789703EBA5B41B38D', '99BF63AC12AD48FCB673F1820888964E', '1');
INSERT INTO `orderitem` VALUES ('A4A4355F434846A789703EBA5B41B38D', 'A46A0F48A4F649AE9008B38EA48FAEBA', '2');
INSERT INTO `orderitem` VALUES ('A4A4355F434846A789703EBA5B41B38D', 'C23E6E8A6DB94E27B6E2ABD39DC21AF5', '2');
INSERT INTO `orderitem` VALUES ('BD60493902764D139C7BDE8EC42DB0A4', 'AF28ED8F692C4288B32CF411CBDBFC23', '1');
INSERT INTO `orderitem` VALUES ('BD60493902764D139C7BDE8EC42DB0A4', 'EA695342393C4BE48B831FA5E6B0E5C4', '2');
INSERT INTO `orderitem` VALUES ('C2B5EE35C6D14D47A14F05C2C089CB11', '4E44405DAFB7413E8A13BBFFBEE73AC7', '2');
INSERT INTO `orderitem` VALUES ('C2B5EE35C6D14D47A14F05C2C089CB11', 'AF28ED8F692C4288B32CF411CBDBFC23', '2');
INSERT INTO `orderitem` VALUES ('C46582EA54E046F0821158A327060984', '57B6FF1B89C843C38BA39C717FA557D6', '2');
INSERT INTO `orderitem` VALUES ('C46582EA54E046F0821158A327060984', '9923901FBF124623BC707920D8936BC8', '1');
INSERT INTO `orderitem` VALUES ('D2EF397F6D04402B94E5E9E7FE3F45AD', '400D94DE5A0742B3A618FC76DF107183', '1');
INSERT INTO `orderitem` VALUES ('D2EF397F6D04402B94E5E9E7FE3F45AD', 'C23E6E8A6DB94E27B6E2ABD39DC21AF5', '9');
INSERT INTO `orderitem` VALUES ('DE94B8D2536740C7AABB7F77E963E8D9', 'A7EFD99367C9434682A790635D3C5FDF', '1');
INSERT INTO `orderitem` VALUES ('DE94B8D2536740C7AABB7F77E963E8D9', 'C23E6E8A6DB94E27B6E2ABD39DC21AF5', '1');
INSERT INTO `orderitem` VALUES ('F0F6CE6EEBC24C91A949231E706902B3', '99BF63AC12AD48FCB673F1820888964E', '1');
INSERT INTO `orderitem` VALUES ('F0F6CE6EEBC24C91A949231E706902B3', 'A46A0F48A4F649AE9008B38EA48FAEBA', '2');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) NOT NULL COMMENT '图书买家',
  `username` varchar(50) DEFAULT NULL COMMENT '图书买家',
  `userid` int(11) NOT NULL,
  `ordertime` datetime NOT NULL,
  `status` char(20) DEFAULT NULL,
  `total` double(11,2) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userid` (`userid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('17', '04CAE55D26514F8998243D3377519CD8', '王五', '4', '2018-04-10 15:55:22', '未付款', '254.20', '广东省广州市');
INSERT INTO `orders` VALUES ('18', '95640E8BFDCD42E09F164845BCCC6D15', '张三', '3', '2018-04-10 15:56:19', '已发货', '244.20', '广东省佛山市');
INSERT INTO `orders` VALUES ('20', 'D2EF397F6D04402B94E5E9E7FE3F45AD', '李四', '2', '2018-04-10 15:57:30', '已发货', '262.00', '广东省广州市');
INSERT INTO `orders` VALUES ('21', '3EC8B0852A60449C92056251A18424AC', '张三', '3', '2018-04-10 16:04:41', '等待确认', '309.90', '广东省汕头市');
INSERT INTO `orders` VALUES ('22', '1F1C85A7DC694FDF988ABD52AF2FA85E', '赵四', '5', '2018-04-11 10:41:00', '等待确认', '237.10', '广东省广州市番禺区广州大学城');
INSERT INTO `orders` VALUES ('23', 'F0F6CE6EEBC24C91A949231E706902B3', '黑龙', '6', '2018-04-11 10:42:51', '交易成功', '198.80', '广东省广州市');
INSERT INTO `orders` VALUES ('24', 'BD60493902764D139C7BDE8EC42DB0A4', '张三', '3', '2018-04-11 10:44:50', '未付款', '130.50', '广东省广州市');
INSERT INTO `orders` VALUES ('25', 'A4A4355F434846A789703EBA5B41B38D', '张三', '3', '2018-04-13 21:01:56', '已发货', '237.40', '广东省');
INSERT INTO `orders` VALUES ('26', '4554097261D44CF48BCDDC22669EE012', '张三', '3', '2018-04-20 11:02:07', '交易成功', '143.40', '广东省');
INSERT INTO `orders` VALUES ('27', 'DE94B8D2536740C7AABB7F77E963E8D9', '张三', '3', '2018-05-27 16:18:20', '未付款', '86.90', '广东省广州市番禺区广东工业大学');
INSERT INTO `orders` VALUES ('28', 'C2B5EE35C6D14D47A14F05C2C089CB11', '张三', '3', '2018-05-27 16:44:36', '交易成功', '216.60', '广东工业大学');
INSERT INTO `orders` VALUES ('29', '6BC9887F43014281A0F781D5E6F0E006', '张三', '3', '2018-05-27 16:50:44', '交易成功', '115.90', '广东省广州市');
INSERT INTO `orders` VALUES ('30', '7C0BA9AB843C45629AEFA13645A17AA3', '张三', '3', '2018-05-27 16:55:12', '未付款', '144.00', '广东省广州市');
INSERT INTO `orders` VALUES ('31', '2463FD9B8102401C8109FB7531446287', '张三', '3', '2018-05-27 16:58:36', '未付款', '82.00', '广东省广州市');
INSERT INTO `orders` VALUES ('32', 'C46582EA54E046F0821158A327060984', '张三', '3', '2018-05-27 17:08:37', '等待确认', '142.80', '广东省广州市番禺区广东工业大学');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '程序设计', '程序设计相关');
INSERT INTO `type` VALUES ('3', '计算机技术', '计算机相关');
INSERT INTO `type` VALUES ('4', '电子商务', '电子商务相关电子商务相关电子商务相关电子商务相关电子商务相关电子商务相关电子商务相关电子商务相关电子商务相关电子商务相关');
INSERT INTO `type` VALUES ('6', '哲学宗教', '哲学宗教');
INSERT INTO `type` VALUES ('7', '养生', '养生介绍');
INSERT INTO `type` VALUES ('12', '科幻小说', '这是科幻小说');
INSERT INTO `type` VALUES ('13', '经济', '经济学理论');
INSERT INTO `type` VALUES ('14', '心理学', '心理学研究');
INSERT INTO `type` VALUES ('15', '传记', '人物传记');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `loginName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `addressCode` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `identity` char(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1号管理员', 'admin', '123456', null, null, null, null, 'admin');
INSERT INTO `user` VALUES ('2', '李四', 'LiSi', '123456', '广东省广州市番禺区大学城广东工业大学', '50001', 'LiSi@qq.com', '15587654321', 'user');
INSERT INTO `user` VALUES ('3', '张三', 'ZhangSan', '123456', '广东省广州市番禺区大学城广东工业大学', '50000', 'zhangsan@qq.com', '15512345678', 'user');
INSERT INTO `user` VALUES ('4', '王五', 'WangWu', '123456', '广东省佛山市', '51515', 'WangWu@163.com', '1552103212', 'user');
INSERT INTO `user` VALUES ('5', '赵四', 'ZhaoSi', '123456', '广东省汕头市', '50101', 'ZhaoSi@162.com', '15532145678', 'user');
INSERT INTO `user` VALUES ('6', '黑龙', 'HeiLong', '123456', '广东省汕头市', '53100', 'HeiLong@qq.com', '13532476890', 'user');
INSERT INTO `user` VALUES ('7', '鹏', 'peng', '123456', null, null, null, null, 'user');
