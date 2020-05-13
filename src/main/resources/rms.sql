/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : rms

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 17/02/2020 22:42:31
*/
SET sql_mode = '';
SET GLOBAL sql_mode = '';
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cus_dev_plan
-- ----------------------------
DROP TABLE IF EXISTS `cus_dev_plan`;
CREATE TABLE `cus_dev_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleChanceId` int(11) NULL DEFAULT NULL,
  `planItem` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `planDate` date NULL DEFAULT NULL,
  `exeAffect` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_cus_dev_plan`(`saleChanceId`) USING BTREE,
  CONSTRAINT `cus_dev_plan_ibfk_1` FOREIGN KEY (`saleChanceId`) REFERENCES `sale_chance` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cus_dev_plan
-- ----------------------------
INSERT INTO `cus_dev_plan` VALUES (1, 1, '测试计划项', '2011-01-01', '好');
INSERT INTO `cus_dev_plan` VALUES (4, 1, 'haha', '2015-05-20', 'en啊');
INSERT INTO `cus_dev_plan` VALUES (5, 1, 'ss', '2015-05-13', '');
INSERT INTO `cus_dev_plan` VALUES (6, 16, '2121', '2015-05-28', '');
INSERT INTO `cus_dev_plan` VALUES (7, 16, '21121', '2015-05-19', '');
INSERT INTO `cus_dev_plan` VALUES (8, 19, '21', '2015-05-28', '');
INSERT INTO `cus_dev_plan` VALUES (9, 2, '1', '2015-05-27', '2');
INSERT INTO `cus_dev_plan` VALUES (10, 2, '2', '2015-05-28', '');
INSERT INTO `cus_dev_plan` VALUES (11, 21, '好', '2015-06-09', '额');
INSERT INTO `cus_dev_plan` VALUES (12, 22, '联系客户，介绍产品', '2015-06-01', '有点效果');
INSERT INTO `cus_dev_plan` VALUES (13, 22, '请客户吃饭，洽谈', '2015-06-07', '成功了');
INSERT INTO `cus_dev_plan` VALUES (17, 23, '大手大脚', '2020-02-17', '大声点');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` bigint(19) NULL DEFAULT NULL,
  `seq` tinyint(2) NOT NULL DEFAULT 0,
  `createdate` datetime,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, '总经办', '', '01', 'define-depart', NULL, 0, '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES (3, '技术部', '', '02', 'define-depart', NULL, 1, '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES (5, '产品部', '', '03', 'define-depart', NULL, 2, '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES (6, '测试组', 'www.baidu.com', '04', 'define-group', 3, 0, '2015-12-06 13:12:18');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `store` int(11) NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '联想笔记本', 'Y450', '台', 4500, 120, '好');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` bigint(19) NULL DEFAULT NULL,
  `seq` tinyint(2) NOT NULL DEFAULT 0,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `resourcetype` tinyint(2) NOT NULL DEFAULT 0,
  `createdate` datetime,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 282 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '系统管理', '', NULL, '系统管理', 'icon-xitongguanli', NULL, 6, 0, 0, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (11, '资源管理', '/resource/manager', NULL, '资源管理', '', 223, 3, 0, 0, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (12, '角色管理', '/role/manager', NULL, '角色管理', '', 223, 2, 0, 0, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (13, '用户信息管理', '/user/manager', NULL, '用户管理', '', 223, 1, 0, 0, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (14, '部门资源', '/organization/manager', NULL, '部门管理', '', 223, 4, 0, 0, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (15, '产品信息管理', '/product/manager', NULL, '产品信息管理', '', 223, 4, 0, 0, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (111, '列表', '/resource/treeGrid', 'resource:list', '资源列表', 'define-list', 11, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (112, '添加', '/resource/add', 'resource:add', '资源添加', 'define-add', 11, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (113, '编辑', '/resource/edit', 'resource:edit', '资源编辑', 'define-edit', 11, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (114, '删除', '/resource/delete', 'resource:delete', '资源删除', 'define-del', 11, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (121, '列表', '/role/dataGrid', 'role:list', '角色列表', 'define-list', 12, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (122, '添加', '/role/add', 'role:add', '角色添加', 'define-add', 12, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (123, '编辑', '/role/edit', 'role:edit', '角色编辑', 'define-edit', 12, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (124, '删除', '/role/delete', 'role:delete', '角色删除', 'define-del', 12, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (125, '授权', '/role/grant', 'role:grant', '角色授权', 'define-true', 12, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (131, '列表', '/user/dataGrid', 'user:list', '用户列表', 'define-list', 13, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (132, '添加', '/user/add', 'user:add', '用户添加', 'define-add', 13, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (133, '编辑', '/user/edit', 'user:edit', '用户编辑', 'define-edit', 13, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (134, '删除', '/user/delete', 'user:delete', '用户删除', 'define-del', 13, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (141, '列表', '/organization/treeGrid', 'organization:list', '用户列表', 'define-list', 14, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (142, '添加', '/organization/add', 'organization:add', '部门添加', 'define-add', 14, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (143, '编辑', '/organization/edit', 'organization:edit', '部门编辑', 'define-edit', 14, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (144, '删除', '/organization/delete', 'organization:delete', '部门删除', 'define-del', 14, 0, 0, 1, '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES (221, '日志管理', '/log/manager', NULL, NULL, '', 1, 1, 0, 0, '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES (222, '后台首页', '/main', '', NULL, 'icon-houtai', NULL, 0, 0, 0, '2019-01-11 10:16:17');
INSERT INTO `resource` VALUES (223, '基础数据管理', '', NULL, NULL, 'icon-guanliyuan', NULL, 1, 0, 0, '2019-01-11 11:06:20');
INSERT INTO `resource` VALUES (224, '字典管理', '/dataDic/manager', '', NULL, '', 1, 0, 0, 0, '2019-01-23 09:43:19');
INSERT INTO `resource` VALUES (225, '批量删除', '/log/batchDelete', 'log:batchDelete', NULL, 'define-del', 221, 1, 0, 1, '2019-02-21 15:43:54');
INSERT INTO `resource` VALUES (226, '列表', '/log/dataGrid', 'log:list', NULL, 'define-list', 221, 0, 0, 1, '2019-02-22 11:31:37');
INSERT INTO `resource` VALUES (227, '营销管理', NULL, NULL, '营销管理', 'icon-xitonggonggao', NULL, 2, 0, 0, '2020-02-16 15:32:43');
INSERT INTO `resource` VALUES (228, '营销机会管理', '/saleChances/manager', NULL, '营销机会管理', NULL, 227, 1, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (229, '客户开发记录', '/cusDevPlan/cusDev', NULL, '客户开发记录', NULL, 227, 2, 0, 0, '2020-02-16 15:41:18');
INSERT INTO `resource` VALUES (230, '客户管理', NULL, NULL, '客户管理', 'icon-jiaoseguanli', NULL, 3, 0, 0, '2020-02-16 15:32:43');
INSERT INTO `resource` VALUES (231, '客户信息管理', '/customer/manager', NULL, '客户信息管理', NULL, 230, 1, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (232, '客户流失管理', '/customerLoss/manager', NULL, '客户流失管理', NULL, 230, 1, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (233, '服务管理', NULL, NULL, '服务管理', 'icon-ziyuanguanli1', NULL, 4, 0, 0, '2020-02-16 15:32:43');
INSERT INTO `resource` VALUES (234, '服务创建', '/customerService/serviceCreate', NULL, '服务创建', NULL, 233, 1, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (235, '服务分配', '/customerService/serviceFenPei', NULL, '服务分配', NULL, 233, 2, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (236, '服务处理', '/customerService/serviceHandler', NULL, '服务处理', NULL, 233, 3, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (237, '服务反馈', '/customerService/serviceFeedback', NULL, '服务反馈', NULL, 233, 4, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (238, '服务归档', '/customerService/serviceArchive', NULL, '服务归档', NULL, 233, 5, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (239, '报表统计', NULL, NULL, '报表统计', 'icon-rizhiguanli', NULL, 5, 0, 0, '2020-02-16 15:32:43');
INSERT INTO `resource` VALUES (240, '客户贡献分析', '/customer/clientGX', NULL, '客户贡献分析', NULL, 239, 1, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (241, '客户构成分析', '/customer/clienGc', NULL, '客户构成分析', NULL, 239, 2, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (242, '客户服务分析', '/customer/clienFw', NULL, '客户服务分析', NULL, 239, 3, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (243, '客户流失分析', '/customer/clientLoss', NULL, '客户流失分析', NULL, 239, 4, 0, 0, '2020-02-16 15:35:43');
INSERT INTO `resource` VALUES (244, '产品列表', '/product/list', 'product:list', '产品列表', '', 15, 0, 0, 1, '2020-02-16 20:00:36');
INSERT INTO `resource` VALUES (245, '销售机会列表', '/saleChances/listPage', 'saleChances:list', '销售机会列表', NULL, 228, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (246, '添加销售机会', '/saleChances/addSaleChance', 'saleChances:add', '添加销售机会', NULL, 228, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (247, '删除销售机会', '/saleChances/delete', 'saleChances:delete', '删除销售机会', NULL, 228, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (248, '编辑销售机会', '/saleChances/edit', 'saleChances:edit', '删除销售机会', NULL, 228, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (249, '开发计划列表', '/cusDevPlan/cusDev', 'cusDevPlan:devList', '开发计划列表', NULL, 229, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (250, '开发计划集合', '/cusDevPlan/list', 'cusDevPlan:list', '开发计划集合', NULL, 229, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (251, '开发计划详情', '/cusDevPlan/detailDev', 'cusDevPlan:detailDev', '开发计划详情', NULL, 229, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (252, '添加开发', '/cusDevPlan/detailAddDev', 'cusDevPlan:detailAddDev', '添加开发', NULL, 229, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (253, '添加开发计划', '/cusDevPlan/save', 'cusDevPlan:devPlanAdd', '添加开发计划', NULL, 229, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (254, '客户列表', '/customer/list', 'customer:list', '客户列表', NULL, 231, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (255, '添加客户', '/customer/save', 'customer:save', '添加客户', NULL, 231, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (257, '客户更新', '/customer/editDo', 'customer:editDo', '客户更新', NULL, 231, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (258, '客户删除', '/customer/delete', 'customer:delete', '客户删除', NULL, 231, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (259, '客户联系人查询', '/linkMan/list', 'customer:linkman', '客户联系人查询', NULL, 231, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (260, '客户交往记录查询', '/contact/list', 'customer:contact', '客户交往记录查询', NULL, 231, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (261, '查看历史订单', '/order/list', 'customer:order', '查看历史订单', NULL, 231, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (262, '客户流失列表', '/customerLoss/list', 'customerLoss:list', '客户流失列表', NULL, 232, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (263, '服务信息保存', '/customerService/save', 'customerService:serviceCreate', '服务信息保存', NULL, 234, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (264, '服务分配列表', '/customerService/list', 'customerService:serviceFenPei', '服务分配列表', NULL, 235, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (265, '服务分配删除', '/customerService/delete', 'customerService:delete', '服务分配删除', NULL, 235, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (266, '服务分配更新', '/customerService/update', 'customerService:fenpei', '服务分配更新', NULL, 235, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (267, '服务处理', '/customerService/serviceHandler', 'customerService:serviceHandler', '服务处理', NULL, 236, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (268, '服务处理更新', '/customerService/handle', 'customerService:fenpeiHandler', '服务处理更新', NULL, 236, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (269, '服务反馈', '/customerService/serviceFeedback', 'customerService:serviceFeedback', '服务反馈', NULL, 237, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (270, '服务反馈更新', '/customerService/feedback', 'customerService:feedbackUpdate', '服务反馈更新', NULL, 237, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (271, '服务归档', '/customerService/serviceArchive', 'customerService:serviceArchive', '服务归档', NULL, 238, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (272, '服务归档更新', '/customerService/archive', 'customerService:archive', '服务归档更新', NULL, 238, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (273, '客户贡献分析列表', '/customer/findCutomerGx', 'customer:clientGX', '客户贡献分析列表', NULL, 240, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (274, '客户流失分析列表', '/customer/clientLoss', 'customer:clientLoss', '客户流失分析列表', NULL, 243, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (275, '客户构成分析数据', '/customer/clienGc', 'customer:clienGc', '客户构成分析数据', NULL, 241, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (276, '客户服务分析数据', '/customer/clienFw', 'customer:clienFw', '客户服务分析数据', NULL, 242, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (277, '字典管理列表', '/dataDic/list', 'dataDic:list', '字典管理列表', NULL, 224, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (278, '字典管理增加', '/dataDic/save', 'dataDic:save', '字典管理增加', NULL, 224, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (279, '字典管理更新', '/dataDic/update', 'dataDic:update', '字典管理更新', NULL, 224, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (280, '字典管理删除', '/dataDic/delete', 'dataDic:delete', '字典管理删除', NULL, 224, 0, 0, 1, '2020-02-16 21:22:46');
INSERT INTO `resource` VALUES (281, '客户流失添加', '/customerLoss/save', 'customerLoss:save', '客户流失添加', NULL, 232, 0, 0, 1, '2020-02-16 21:22:46');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seq` tinyint(2) NOT NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 0, '超级管理员', 0);
INSERT INTO `role` VALUES (2, '销售主管', 0, '销售主管', 1);
INSERT INTO `role` VALUES (8, '测试账户', 0, '测试账户', 0);
INSERT INTO `role` VALUES (10, '客户经理', 0, '客户经理', 0);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(19) NOT NULL,
  `resource_id` bigint(19) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3758 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (1089, 8, 222);
INSERT INTO `role_resource` VALUES (1090, 8, 223);
INSERT INTO `role_resource` VALUES (1091, 8, 13);
INSERT INTO `role_resource` VALUES (1092, 8, 131);
INSERT INTO `role_resource` VALUES (1093, 8, 12);
INSERT INTO `role_resource` VALUES (1094, 8, 121);
INSERT INTO `role_resource` VALUES (1095, 8, 11);
INSERT INTO `role_resource` VALUES (1096, 8, 111);
INSERT INTO `role_resource` VALUES (1097, 8, 14);
INSERT INTO `role_resource` VALUES (1098, 8, 141);
INSERT INTO `role_resource` VALUES (1099, 8, 1);
INSERT INTO `role_resource` VALUES (1100, 8, 224);
INSERT INTO `role_resource` VALUES (1101, 8, 221);
INSERT INTO `role_resource` VALUES (1102, 8, 226);
INSERT INTO `role_resource` VALUES (1145, 10, 222);
INSERT INTO `role_resource` VALUES (1146, 10, 223);
INSERT INTO `role_resource` VALUES (1147, 10, 13);
INSERT INTO `role_resource` VALUES (1148, 10, 131);
INSERT INTO `role_resource` VALUES (1149, 10, 12);
INSERT INTO `role_resource` VALUES (1150, 10, 121);
INSERT INTO `role_resource` VALUES (1151, 10, 11);
INSERT INTO `role_resource` VALUES (1152, 10, 111);
INSERT INTO `role_resource` VALUES (1153, 10, 14);
INSERT INTO `role_resource` VALUES (1154, 10, 141);
INSERT INTO `role_resource` VALUES (1155, 10, 1);
INSERT INTO `role_resource` VALUES (1156, 10, 224);
INSERT INTO `role_resource` VALUES (1157, 10, 221);
INSERT INTO `role_resource` VALUES (1158, 10, 226);
INSERT INTO `role_resource` VALUES (3649, 1, 222);
INSERT INTO `role_resource` VALUES (3650, 1, 223);
INSERT INTO `role_resource` VALUES (3651, 1, 13);
INSERT INTO `role_resource` VALUES (3652, 1, 131);
INSERT INTO `role_resource` VALUES (3653, 1, 132);
INSERT INTO `role_resource` VALUES (3654, 1, 133);
INSERT INTO `role_resource` VALUES (3655, 1, 134);
INSERT INTO `role_resource` VALUES (3656, 1, 12);
INSERT INTO `role_resource` VALUES (3657, 1, 121);
INSERT INTO `role_resource` VALUES (3658, 1, 122);
INSERT INTO `role_resource` VALUES (3659, 1, 123);
INSERT INTO `role_resource` VALUES (3660, 1, 124);
INSERT INTO `role_resource` VALUES (3661, 1, 125);
INSERT INTO `role_resource` VALUES (3662, 1, 11);
INSERT INTO `role_resource` VALUES (3663, 1, 111);
INSERT INTO `role_resource` VALUES (3664, 1, 112);
INSERT INTO `role_resource` VALUES (3665, 1, 113);
INSERT INTO `role_resource` VALUES (3666, 1, 114);
INSERT INTO `role_resource` VALUES (3667, 1, 14);
INSERT INTO `role_resource` VALUES (3668, 1, 141);
INSERT INTO `role_resource` VALUES (3669, 1, 142);
INSERT INTO `role_resource` VALUES (3670, 1, 143);
INSERT INTO `role_resource` VALUES (3671, 1, 144);
INSERT INTO `role_resource` VALUES (3672, 1, 15);
INSERT INTO `role_resource` VALUES (3673, 1, 244);
INSERT INTO `role_resource` VALUES (3674, 1, 227);
INSERT INTO `role_resource` VALUES (3675, 1, 228);
INSERT INTO `role_resource` VALUES (3676, 1, 245);
INSERT INTO `role_resource` VALUES (3677, 1, 246);
INSERT INTO `role_resource` VALUES (3678, 1, 247);
INSERT INTO `role_resource` VALUES (3679, 1, 248);
INSERT INTO `role_resource` VALUES (3680, 1, 229);
INSERT INTO `role_resource` VALUES (3681, 1, 249);
INSERT INTO `role_resource` VALUES (3682, 1, 250);
INSERT INTO `role_resource` VALUES (3683, 1, 251);
INSERT INTO `role_resource` VALUES (3684, 1, 252);
INSERT INTO `role_resource` VALUES (3685, 1, 253);
INSERT INTO `role_resource` VALUES (3686, 1, 230);
INSERT INTO `role_resource` VALUES (3687, 1, 231);
INSERT INTO `role_resource` VALUES (3688, 1, 257);
INSERT INTO `role_resource` VALUES (3689, 1, 258);
INSERT INTO `role_resource` VALUES (3690, 1, 259);
INSERT INTO `role_resource` VALUES (3691, 1, 260);
INSERT INTO `role_resource` VALUES (3692, 1, 261);
INSERT INTO `role_resource` VALUES (3693, 1, 254);
INSERT INTO `role_resource` VALUES (3694, 1, 255);
INSERT INTO `role_resource` VALUES (3695, 1, 232);
INSERT INTO `role_resource` VALUES (3696, 1, 262);
INSERT INTO `role_resource` VALUES (3697, 1, 281);
INSERT INTO `role_resource` VALUES (3698, 1, 233);
INSERT INTO `role_resource` VALUES (3699, 1, 234);
INSERT INTO `role_resource` VALUES (3700, 1, 263);
INSERT INTO `role_resource` VALUES (3701, 1, 235);
INSERT INTO `role_resource` VALUES (3702, 1, 264);
INSERT INTO `role_resource` VALUES (3703, 1, 265);
INSERT INTO `role_resource` VALUES (3704, 1, 266);
INSERT INTO `role_resource` VALUES (3705, 1, 236);
INSERT INTO `role_resource` VALUES (3706, 1, 267);
INSERT INTO `role_resource` VALUES (3707, 1, 268);
INSERT INTO `role_resource` VALUES (3708, 1, 237);
INSERT INTO `role_resource` VALUES (3709, 1, 269);
INSERT INTO `role_resource` VALUES (3710, 1, 270);
INSERT INTO `role_resource` VALUES (3711, 1, 238);
INSERT INTO `role_resource` VALUES (3712, 1, 271);
INSERT INTO `role_resource` VALUES (3713, 1, 272);
INSERT INTO `role_resource` VALUES (3714, 1, 239);
INSERT INTO `role_resource` VALUES (3715, 1, 240);
INSERT INTO `role_resource` VALUES (3716, 1, 273);
INSERT INTO `role_resource` VALUES (3717, 1, 241);
INSERT INTO `role_resource` VALUES (3718, 1, 275);
INSERT INTO `role_resource` VALUES (3719, 1, 242);
INSERT INTO `role_resource` VALUES (3720, 1, 276);
INSERT INTO `role_resource` VALUES (3721, 1, 243);
INSERT INTO `role_resource` VALUES (3722, 1, 274);
INSERT INTO `role_resource` VALUES (3723, 1, 1);
INSERT INTO `role_resource` VALUES (3724, 1, 224);
INSERT INTO `role_resource` VALUES (3725, 1, 277);
INSERT INTO `role_resource` VALUES (3726, 1, 278);
INSERT INTO `role_resource` VALUES (3727, 1, 279);
INSERT INTO `role_resource` VALUES (3728, 1, 280);
INSERT INTO `role_resource` VALUES (3729, 1, 221);
INSERT INTO `role_resource` VALUES (3730, 1, 226);
INSERT INTO `role_resource` VALUES (3731, 1, 225);
INSERT INTO `role_resource` VALUES (3732, 2, 222);
INSERT INTO `role_resource` VALUES (3733, 2, 223);
INSERT INTO `role_resource` VALUES (3734, 2, 13);
INSERT INTO `role_resource` VALUES (3735, 2, 131);
INSERT INTO `role_resource` VALUES (3736, 2, 12);
INSERT INTO `role_resource` VALUES (3737, 2, 121);
INSERT INTO `role_resource` VALUES (3738, 2, 11);
INSERT INTO `role_resource` VALUES (3739, 2, 111);
INSERT INTO `role_resource` VALUES (3740, 2, 14);
INSERT INTO `role_resource` VALUES (3741, 2, 141);
INSERT INTO `role_resource` VALUES (3742, 2, 15);
INSERT INTO `role_resource` VALUES (3743, 2, 244);
INSERT INTO `role_resource` VALUES (3744, 2, 227);
INSERT INTO `role_resource` VALUES (3745, 2, 228);
INSERT INTO `role_resource` VALUES (3746, 2, 245);
INSERT INTO `role_resource` VALUES (3747, 2, 229);
INSERT INTO `role_resource` VALUES (3748, 2, 249);
INSERT INTO `role_resource` VALUES (3749, 2, 230);
INSERT INTO `role_resource` VALUES (3750, 2, 231);
INSERT INTO `role_resource` VALUES (3751, 2, 254);
INSERT INTO `role_resource` VALUES (3752, 2, 232);
INSERT INTO `role_resource` VALUES (3753, 2, 262);
INSERT INTO `role_resource` VALUES (3754, 2, 1);
INSERT INTO `role_resource` VALUES (3755, 2, 224);
INSERT INTO `role_resource` VALUES (3756, 2, 221);
INSERT INTO `role_resource` VALUES (3757, 2, 226);

-- ----------------------------
-- Table structure for sale_chance
-- ----------------------------
DROP TABLE IF EXISTS `sale_chance`;
CREATE TABLE `sale_chance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chanceSource` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cgjl` int(11) NULL DEFAULT NULL,
  `overview` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkMan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkPhone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createMan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `assignMan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignTime` datetime DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `devResult` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_chance
-- ----------------------------
INSERT INTO `sale_chance` VALUES (1, '主动来找的', '风软科技', 100, '采购笔记本意向111', '李先生', '137234576543', '', 'Jack', '2020-02-16 00:00:00', '4', '2020-02-16 00:00:00', 1, 2);
INSERT INTO `sale_chance` VALUES (2, '', '1', 12, '', '', '', '', '12', NULL, '3', '2015-05-25 11:21:00', 1, 2);
INSERT INTO `sale_chance` VALUES (11, '', '10', 1, '', '', '', '', '321', NULL, '', NULL, 0, 0);
INSERT INTO `sale_chance` VALUES (14, '2', '1', 5, '6', '3', '4', '7', '8', NULL, '3', NULL, 0, 0);
INSERT INTO `sale_chance` VALUES (15, '213', '112', 22, '', '', '', '', '221', '2013-01-01 11:20:00', '3', '2013-01-01 11:20:00', 1, 3);
INSERT INTO `sale_chance` VALUES (16, '22', '11', 55, '66', '33', '44', '77', '88', '2013-01-01 11:20:00', '4', '2013-01-01 11:20:00', 1, 3);
INSERT INTO `sale_chance` VALUES (17, '321', '121', 1, '321', '321', '213', '321', '321', '2015-05-22 11:23:00', '3', NULL, 0, 0);
INSERT INTO `sale_chance` VALUES (18, '321', '321', 11, '321', '321', '213', '321', 'Jack', '2015-05-22 11:43:00', '', NULL, 0, 0);
INSERT INTO `sale_chance` VALUES (19, '321', '213', 21, '21', '21', '321', '321', 'Jack', '2015-05-24 11:33:00', '3', '2015-05-24 11:34:00', 1, 3);
INSERT INTO `sale_chance` VALUES (20, '321', '213', 100, '321', '321', '321', '321', 'Jack', '2015-05-24 11:35:00', '', NULL, 0, 0);
INSERT INTO `sale_chance` VALUES (21, '行业介绍', '大鸟爱科技', 80, '阿凡达深刻理解', '张先生', '0231-321321', '发达放大空间发大水发大水了发', 'Jack', '2015-06-10 16:32:00', '4', '2015-06-10 16:33:00', 1, 3);
INSERT INTO `sale_chance` VALUES (22, '同行介绍', '鸟人科技', 90, '采购IBM服务器意向', '张三', '2321321321', ',...', 'Jack', '2015-06-11 08:35:00', '5', '2015-06-11 08:36:00', 1, 2);
INSERT INTO `sale_chance` VALUES (23, '主动来找的', '风软科技', 100, '采购笔记本意向', '张先生', '137234576543', '。。。', 's', '2020-01-07 22:22:00', '3', '2015-05-24 16:15:00', 1, 1);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operationName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作',
  `operationClass` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operationAddress` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行方法',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 735 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (83, '系统自动任务', '定时删除日志：1条', '', '', '', '', '2019-02-22 09:52:30');
INSERT INTO `syslog` VALUES (84, '系统自动任务', '定时删除日志：0条', '', '', '', '', '2019-02-22 10:41:32');
INSERT INTO `syslog` VALUES (85, '系统自动任务', '定时删除日志：0条', '', '', '', '', '2019-02-22 10:41:40');
INSERT INTO `syslog` VALUES (86, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 10:51:52');
INSERT INTO `syslog` VALUES (87, 'admin', '用户信息编辑', 'SystemManage.UserManage.controller.UserController', '/user/edit', 'id=16&loginname=admin&name=yongfeng.L&password=&sex=0&age=21&usertype=1&organizationId=1&roleIds=1&phone=18296633676&status=0&', '127.0.0.1', '2019-02-22 10:52:36');
INSERT INTO `syslog` VALUES (88, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '127.0.0.1', '2019-02-22 10:52:50');
INSERT INTO `syslog` VALUES (89, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/role/grant', 'id=10&resourceIds=222,223,13,131,1,221&', '127.0.0.1', '2019-02-22 10:52:57');
INSERT INTO `syslog` VALUES (90, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 10:53:00');
INSERT INTO `syslog` VALUES (91, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '127.0.0.1', '2019-02-22 10:53:00');
INSERT INTO `syslog` VALUES (92, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 11:00:53');
INSERT INTO `syslog` VALUES (93, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '127.0.0.1', '2019-02-22 11:00:57');
INSERT INTO `syslog` VALUES (94, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/resource/manager', '', '127.0.0.1', '2019-02-22 11:00:59');
INSERT INTO `syslog` VALUES (113, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/role/grant', 'id=8&resourceIds=222,223,13,131,12,121,11,111,1,224,221&', '127.0.0.1', '2019-02-22 11:37:16');
INSERT INTO `syslog` VALUES (116, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 11:37:18');
INSERT INTO `syslog` VALUES (132, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 12:49:05');
INSERT INTO `syslog` VALUES (134, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,1,224,221,226,225&', '127.0.0.1', '2019-02-22 12:49:16');
INSERT INTO `syslog` VALUES (135, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 12:49:18');
INSERT INTO `syslog` VALUES (136, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '127.0.0.1', '2019-02-22 12:49:18');
INSERT INTO `syslog` VALUES (137, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/role/grant', 'id=2&resourceIds=222,223,13,131,12,121,11,111,14,141,1,224,221,226&', '127.0.0.1', '2019-02-22 12:49:25');
INSERT INTO `syslog` VALUES (138, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '127.0.0.1', '2019-02-22 12:49:27');
INSERT INTO `syslog` VALUES (139, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 12:49:27');
INSERT INTO `syslog` VALUES (140, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/role/grant', 'id=10&resourceIds=222,223,13,131,12,121,11,111,14,141,1,224,221,226&', '127.0.0.1', '2019-02-22 12:50:05');
INSERT INTO `syslog` VALUES (141, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '127.0.0.1', '2019-02-22 12:50:07');
INSERT INTO `syslog` VALUES (142, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '127.0.0.1', '2019-02-22 12:50:07');
INSERT INTO `syslog` VALUES (143, 'admin', '角色信息编辑', 'SystemManage.RoleManage.controller.RoleController', '/role/edit', 'id=10&name=部门管理员&seq=0&status=0&description=管理相关部门&', '127.0.0.1', '2019-02-22 12:50:13');
INSERT INTO `syslog` VALUES (144, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '127.0.0.1', '2019-02-22 12:50:20');
INSERT INTO `syslog` VALUES (145, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/resource/manager', '', '127.0.0.1', '2019-02-22 12:50:39');
INSERT INTO `syslog` VALUES (146, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/organization/manager', '', '127.0.0.1', '2019-02-22 12:51:26');
INSERT INTO `syslog` VALUES (147, 'admin', '部门信息编辑', 'SystemManage.OrganizationManage.controller.OrganizationController', '/organization/edit', 'id=6&code=04&name=测试组&seq=0&icon=define-group&address=www.baidu.com&pid=3&', '127.0.0.1', '2019-02-22 12:51:37');
INSERT INTO `syslog` VALUES (148, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/log/manager', '', '127.0.0.1', '2019-02-22 12:51:46');
INSERT INTO `syslog` VALUES (149, 'admin', '日志信息批量删除', 'SystemManage.LogManage.controller.LogController', '/log/batchDelete', 'ids=112,111,110,109,108,107,106,105,104,102,103,101,100,99,98,97,96,95&', '127.0.0.1', '2019-02-22 12:52:13');
INSERT INTO `syslog` VALUES (150, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/log/manager', '', '127.0.0.1', '2019-02-22 12:52:15');
INSERT INTO `syslog` VALUES (151, 'admin', '日志信息批量删除', 'SystemManage.LogManage.controller.LogController', '/log/batchDelete', 'ids=133,131,130,129,128,127,126,125,123,124,122,121,120,119,118,117,114,115&', '127.0.0.1', '2019-02-22 12:53:05');
INSERT INTO `syslog` VALUES (152, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/log/manager', '', '127.0.0.1', '2019-02-22 12:53:06');
INSERT INTO `syslog` VALUES (153, 'test', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/log/manager', '', '127.0.0.1', '2019-02-22 12:54:14');
INSERT INTO `syslog` VALUES (154, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '117.44.235.8', '2019-02-22 13:15:09');
INSERT INTO `syslog` VALUES (155, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '117.44.235.8', '2019-02-22 13:15:13');
INSERT INTO `syslog` VALUES (156, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/resource/manager', '', '117.44.235.8', '2019-02-22 13:15:14');
INSERT INTO `syslog` VALUES (157, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/organization/manager', '', '117.44.235.8', '2019-02-22 13:15:16');
INSERT INTO `syslog` VALUES (158, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/log/manager', '', '117.44.235.8', '2019-02-22 13:15:21');
INSERT INTO `syslog` VALUES (159, 'test', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/user/manager', '', '117.44.235.8', '2019-02-22 13:15:55');
INSERT INTO `syslog` VALUES (160, 'test', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/role/manager', '', '117.44.235.8', '2019-02-22 13:16:04');
INSERT INTO `syslog` VALUES (161, 'test', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/resource/manager', '', '117.44.235.8', '2019-02-22 13:16:09');
INSERT INTO `syslog` VALUES (162, 'test', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/organization/manager', '', '117.44.235.8', '2019-02-22 13:16:19');
INSERT INTO `syslog` VALUES (163, 'test', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/log/manager', '', '117.44.235.8', '2019-02-22 13:16:23');
INSERT INTO `syslog` VALUES (164, 'test', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/log/manager', '', '117.44.235.8', '2019-02-22 13:17:28');
INSERT INTO `syslog` VALUES (165, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 14:13:48');
INSERT INTO `syslog` VALUES (166, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 14:13:55');
INSERT INTO `syslog` VALUES (167, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 14:13:55');
INSERT INTO `syslog` VALUES (168, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/RMS/resource/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 14:13:56');
INSERT INTO `syslog` VALUES (169, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/RMS/log/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:03:10');
INSERT INTO `syslog` VALUES (170, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:03:55');
INSERT INTO `syslog` VALUES (171, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/RMS/resource/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:04:00');
INSERT INTO `syslog` VALUES (172, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:04:05');
INSERT INTO `syslog` VALUES (173, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:04:07');
INSERT INTO `syslog` VALUES (174, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/RMS/log/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:04:25');
INSERT INTO `syslog` VALUES (175, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/RMS/log/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:05:48');
INSERT INTO `syslog` VALUES (176, 'test', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:21:19');
INSERT INTO `syslog` VALUES (177, 'test', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:21:26');
INSERT INTO `syslog` VALUES (178, 'test', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/RMS/resource/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:21:27');
INSERT INTO `syslog` VALUES (179, 'test', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:21:30');
INSERT INTO `syslog` VALUES (180, 'test', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/RMS/log/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:21:35');
INSERT INTO `syslog` VALUES (181, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:23:33');
INSERT INTO `syslog` VALUES (182, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:23:42');
INSERT INTO `syslog` VALUES (183, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/RMS/resource/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:23:55');
INSERT INTO `syslog` VALUES (184, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:23:58');
INSERT INTO `syslog` VALUES (185, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:56:06');
INSERT INTO `syslog` VALUES (186, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:56:52');
INSERT INTO `syslog` VALUES (187, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:56:57');
INSERT INTO `syslog` VALUES (188, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:57:33');
INSERT INTO `syslog` VALUES (189, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:58:14');
INSERT INTO `syslog` VALUES (190, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 15:59:59');
INSERT INTO `syslog` VALUES (191, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:00:34');
INSERT INTO `syslog` VALUES (192, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:00:37');
INSERT INTO `syslog` VALUES (193, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/RMS/resource/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:00:40');
INSERT INTO `syslog` VALUES (194, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:00:48');
INSERT INTO `syslog` VALUES (195, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,1,224,221,226,225,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243&', '0:0:0:0:0:0:0:1', '2020-02-16 16:01:23');
INSERT INTO `syslog` VALUES (196, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:01:24');
INSERT INTO `syslog` VALUES (197, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:01:50');
INSERT INTO `syslog` VALUES (198, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:03:32');
INSERT INTO `syslog` VALUES (199, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:03:34');
INSERT INTO `syslog` VALUES (200, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:09:50');
INSERT INTO `syslog` VALUES (201, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:13:18');
INSERT INTO `syslog` VALUES (202, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:13:24');
INSERT INTO `syslog` VALUES (203, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 16:13:34');
INSERT INTO `syslog` VALUES (204, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:01:34');
INSERT INTO `syslog` VALUES (205, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:02:25');
INSERT INTO `syslog` VALUES (206, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:15:31');
INSERT INTO `syslog` VALUES (207, 'admin', '资源信息查看', 'SystemManage.ResourceManage.controller.ResourceController', '/RMS/resource/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:16:44');
INSERT INTO `syslog` VALUES (208, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:16:48');
INSERT INTO `syslog` VALUES (209, 'admin', '部门信息查看', 'SystemManage.OrganizationManage.controller.OrganizationController', '/RMS/organization/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:16:58');
INSERT INTO `syslog` VALUES (210, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:18:04');
INSERT INTO `syslog` VALUES (211, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:27:39');
INSERT INTO `syslog` VALUES (212, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:27:43');
INSERT INTO `syslog` VALUES (213, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:27:47');
INSERT INTO `syslog` VALUES (214, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:28:50');
INSERT INTO `syslog` VALUES (215, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:29:27');
INSERT INTO `syslog` VALUES (216, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:29:30');
INSERT INTO `syslog` VALUES (217, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:37:34');
INSERT INTO `syslog` VALUES (218, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:40:24');
INSERT INTO `syslog` VALUES (219, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:41:28');
INSERT INTO `syslog` VALUES (220, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:41:36');
INSERT INTO `syslog` VALUES (221, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:41:37');
INSERT INTO `syslog` VALUES (222, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 17:41:51');
INSERT INTO `syslog` VALUES (223, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 19:48:33');
INSERT INTO `syslog` VALUES (224, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 19:49:19');
INSERT INTO `syslog` VALUES (225, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:00:43');
INSERT INTO `syslog` VALUES (226, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:03:03');
INSERT INTO `syslog` VALUES (227, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 20:03:15');
INSERT INTO `syslog` VALUES (228, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:03:17');
INSERT INTO `syslog` VALUES (229, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:03:27');
INSERT INTO `syslog` VALUES (230, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:03:35');
INSERT INTO `syslog` VALUES (231, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:25:04');
INSERT INTO `syslog` VALUES (232, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:25:12');
INSERT INTO `syslog` VALUES (233, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:27:20');
INSERT INTO `syslog` VALUES (234, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:28:06');
INSERT INTO `syslog` VALUES (235, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:28:56');
INSERT INTO `syslog` VALUES (236, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:29:26');
INSERT INTO `syslog` VALUES (237, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 20:29:54');
INSERT INTO `syslog` VALUES (238, 'admin', '�û���Ϣ�鿴', 'SystemManage.Product.controller.ProductController', '/RMS/product/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:05:57');
INSERT INTO `syslog` VALUES (239, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:27:14');
INSERT INTO `syslog` VALUES (240, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 21:27:29');
INSERT INTO `syslog` VALUES (241, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:27:31');
INSERT INTO `syslog` VALUES (242, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:34:48');
INSERT INTO `syslog` VALUES (243, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:36:00');
INSERT INTO `syslog` VALUES (244, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:36:40');
INSERT INTO `syslog` VALUES (245, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:37:48');
INSERT INTO `syslog` VALUES (246, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:41:03');
INSERT INTO `syslog` VALUES (247, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:41:10');
INSERT INTO `syslog` VALUES (248, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:43:38');
INSERT INTO `syslog` VALUES (249, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:45:33');
INSERT INTO `syslog` VALUES (250, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:49:22');
INSERT INTO `syslog` VALUES (251, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:49:30');
INSERT INTO `syslog` VALUES (252, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:49:48');
INSERT INTO `syslog` VALUES (253, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:54:37');
INSERT INTO `syslog` VALUES (254, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 21:54:44');
INSERT INTO `syslog` VALUES (255, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:55:08');
INSERT INTO `syslog` VALUES (256, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 21:55:10');
INSERT INTO `syslog` VALUES (257, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 21:55:15');
INSERT INTO `syslog` VALUES (258, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:56:25');
INSERT INTO `syslog` VALUES (259, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 21:56:28');
INSERT INTO `syslog` VALUES (260, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:57:59');
INSERT INTO `syslog` VALUES (261, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 21:58:01');
INSERT INTO `syslog` VALUES (262, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 21:59:34');
INSERT INTO `syslog` VALUES (263, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:59:39');
INSERT INTO `syslog` VALUES (264, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 21:59:52');
INSERT INTO `syslog` VALUES (265, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:59:54');
INSERT INTO `syslog` VALUES (266, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 21:59:54');
INSERT INTO `syslog` VALUES (267, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 21:59:59');
INSERT INTO `syslog` VALUES (268, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:00:02');
INSERT INTO `syslog` VALUES (269, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:00:02');
INSERT INTO `syslog` VALUES (270, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:00:07');
INSERT INTO `syslog` VALUES (271, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:01');
INSERT INTO `syslog` VALUES (272, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:01');
INSERT INTO `syslog` VALUES (273, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:09');
INSERT INTO `syslog` VALUES (274, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:11');
INSERT INTO `syslog` VALUES (275, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:35');
INSERT INTO `syslog` VALUES (276, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:41');
INSERT INTO `syslog` VALUES (277, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:42');
INSERT INTO `syslog` VALUES (278, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:19:49');
INSERT INTO `syslog` VALUES (279, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:20:01');
INSERT INTO `syslog` VALUES (280, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 22:20:13');
INSERT INTO `syslog` VALUES (281, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:20:15');
INSERT INTO `syslog` VALUES (282, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:20:15');
INSERT INTO `syslog` VALUES (283, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:21:01');
INSERT INTO `syslog` VALUES (284, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 22:21:02');
INSERT INTO `syslog` VALUES (285, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:21:48');
INSERT INTO `syslog` VALUES (286, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 22:21:50');
INSERT INTO `syslog` VALUES (287, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:22:27');
INSERT INTO `syslog` VALUES (288, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:23:50');
INSERT INTO `syslog` VALUES (289, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 22:23:52');
INSERT INTO `syslog` VALUES (290, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:24:47');
INSERT INTO `syslog` VALUES (291, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:27:36');
INSERT INTO `syslog` VALUES (292, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:27:41');
INSERT INTO `syslog` VALUES (293, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 22:27:43');
INSERT INTO `syslog` VALUES (294, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:29:52');
INSERT INTO `syslog` VALUES (295, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 22:29:55');
INSERT INTO `syslog` VALUES (296, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:32:21');
INSERT INTO `syslog` VALUES (297, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 22:32:22');
INSERT INTO `syslog` VALUES (298, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 22:32:34');
INSERT INTO `syslog` VALUES (299, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:34:05');
INSERT INTO `syslog` VALUES (300, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:34:12');
INSERT INTO `syslog` VALUES (301, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 22:34:16');
INSERT INTO `syslog` VALUES (302, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=11&', '0:0:0:0:0:0:0:1', '2020-02-16 22:34:24');
INSERT INTO `syslog` VALUES (303, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=15&', '0:0:0:0:0:0:0:1', '2020-02-16 22:34:29');
INSERT INTO `syslog` VALUES (304, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:34:51');
INSERT INTO `syslog` VALUES (305, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 22:34:53');
INSERT INTO `syslog` VALUES (306, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:35:36');
INSERT INTO `syslog` VALUES (307, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:35:42');
INSERT INTO `syslog` VALUES (308, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 22:35:46');
INSERT INTO `syslog` VALUES (309, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:35:52');
INSERT INTO `syslog` VALUES (310, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 22:35:54');
INSERT INTO `syslog` VALUES (311, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=20&', '0:0:0:0:0:0:0:1', '2020-02-16 22:36:03');
INSERT INTO `syslog` VALUES (312, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=2&', '0:0:0:0:0:0:0:1', '2020-02-16 22:36:13');
INSERT INTO `syslog` VALUES (313, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 22:36:21');
INSERT INTO `syslog` VALUES (314, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:36:27');
INSERT INTO `syslog` VALUES (315, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 22:36:31');
INSERT INTO `syslog` VALUES (316, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:36:37');
INSERT INTO `syslog` VALUES (317, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 22:36:44');
INSERT INTO `syslog` VALUES (318, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 22:59:29');
INSERT INTO `syslog` VALUES (319, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:02:57');
INSERT INTO `syslog` VALUES (320, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:03:01');
INSERT INTO `syslog` VALUES (321, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 23:03:07');
INSERT INTO `syslog` VALUES (322, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:03:09');
INSERT INTO `syslog` VALUES (323, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:04:51');
INSERT INTO `syslog` VALUES (324, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 23:04:56');
INSERT INTO `syslog` VALUES (325, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:04:59');
INSERT INTO `syslog` VALUES (326, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 23:05:04');
INSERT INTO `syslog` VALUES (327, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:05:06');
INSERT INTO `syslog` VALUES (328, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:05:24');
INSERT INTO `syslog` VALUES (329, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:05:32');
INSERT INTO `syslog` VALUES (330, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:05:50');
INSERT INTO `syslog` VALUES (331, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:06:39');
INSERT INTO `syslog` VALUES (332, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:08:29');
INSERT INTO `syslog` VALUES (333, 'admin', '添加销售机会', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-16 23:08:32');
INSERT INTO `syslog` VALUES (334, 'admin', '编辑销售', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/addOrEdit', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:08:35');
INSERT INTO `syslog` VALUES (335, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:08:55');
INSERT INTO `syslog` VALUES (336, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:09:07');
INSERT INTO `syslog` VALUES (337, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:12:24');
INSERT INTO `syslog` VALUES (338, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:13:32');
INSERT INTO `syslog` VALUES (339, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:18');
INSERT INTO `syslog` VALUES (340, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:24');
INSERT INTO `syslog` VALUES (341, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:27');
INSERT INTO `syslog` VALUES (342, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:27');
INSERT INTO `syslog` VALUES (343, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:34');
INSERT INTO `syslog` VALUES (344, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:35');
INSERT INTO `syslog` VALUES (345, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:35');
INSERT INTO `syslog` VALUES (346, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:37');
INSERT INTO `syslog` VALUES (347, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:37');
INSERT INTO `syslog` VALUES (348, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:46');
INSERT INTO `syslog` VALUES (349, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:53');
INSERT INTO `syslog` VALUES (350, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:16:54');
INSERT INTO `syslog` VALUES (351, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:17:08');
INSERT INTO `syslog` VALUES (352, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:17:13');
INSERT INTO `syslog` VALUES (353, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:28');
INSERT INTO `syslog` VALUES (354, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:29');
INSERT INTO `syslog` VALUES (355, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:32');
INSERT INTO `syslog` VALUES (356, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:34');
INSERT INTO `syslog` VALUES (357, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:41');
INSERT INTO `syslog` VALUES (358, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:42');
INSERT INTO `syslog` VALUES (359, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:42');
INSERT INTO `syslog` VALUES (360, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:43');
INSERT INTO `syslog` VALUES (361, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:43');
INSERT INTO `syslog` VALUES (362, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:51');
INSERT INTO `syslog` VALUES (363, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:55');
INSERT INTO `syslog` VALUES (364, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:21:59');
INSERT INTO `syslog` VALUES (365, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:22:02');
INSERT INTO `syslog` VALUES (366, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:22:03');
INSERT INTO `syslog` VALUES (367, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:22:03');
INSERT INTO `syslog` VALUES (368, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:22:51');
INSERT INTO `syslog` VALUES (369, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:22:53');
INSERT INTO `syslog` VALUES (370, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:22:58');
INSERT INTO `syslog` VALUES (371, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:24:15');
INSERT INTO `syslog` VALUES (372, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:24:18');
INSERT INTO `syslog` VALUES (373, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:25:45');
INSERT INTO `syslog` VALUES (374, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:25:49');
INSERT INTO `syslog` VALUES (375, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:27:06');
INSERT INTO `syslog` VALUES (376, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:27:08');
INSERT INTO `syslog` VALUES (377, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:27:11');
INSERT INTO `syslog` VALUES (378, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=22&', '0:0:0:0:0:0:0:1', '2020-02-16 23:27:16');
INSERT INTO `syslog` VALUES (379, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=19&', '0:0:0:0:0:0:0:1', '2020-02-16 23:27:20');
INSERT INTO `syslog` VALUES (380, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:27:52');
INSERT INTO `syslog` VALUES (381, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:28:56');
INSERT INTO `syslog` VALUES (382, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:31:58');
INSERT INTO `syslog` VALUES (383, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=19&', '0:0:0:0:0:0:0:1', '2020-02-16 23:32:03');
INSERT INTO `syslog` VALUES (384, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:33:13');
INSERT INTO `syslog` VALUES (385, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:33:16');
INSERT INTO `syslog` VALUES (386, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:33:20');
INSERT INTO `syslog` VALUES (387, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-16 23:43:59');
INSERT INTO `syslog` VALUES (388, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:44:04');
INSERT INTO `syslog` VALUES (389, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=15&', '0:0:0:0:0:0:0:1', '2020-02-16 23:45:27');
INSERT INTO `syslog` VALUES (390, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=16&', '0:0:0:0:0:0:0:1', '2020-02-16 23:59:22');
INSERT INTO `syslog` VALUES (391, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-16 23:59:27');
INSERT INTO `syslog` VALUES (392, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 00:02:07');
INSERT INTO `syslog` VALUES (393, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=22&', '0:0:0:0:0:0:0:1', '2020-02-17 00:02:17');
INSERT INTO `syslog` VALUES (394, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 13:04:43');
INSERT INTO `syslog` VALUES (395, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 13:04:50');
INSERT INTO `syslog` VALUES (396, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-17 13:07:52');
INSERT INTO `syslog` VALUES (397, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 13:09:03');
INSERT INTO `syslog` VALUES (398, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:24:17');
INSERT INTO `syslog` VALUES (399, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=22&', '0:0:0:0:0:0:0:1', '2020-02-17 14:24:21');
INSERT INTO `syslog` VALUES (400, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=22&', '0:0:0:0:0:0:0:1', '2020-02-17 14:24:32');
INSERT INTO `syslog` VALUES (401, 'admin', '开发详情', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailDev', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-17 14:24:37');
INSERT INTO `syslog` VALUES (402, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:23');
INSERT INTO `syslog` VALUES (403, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:30');
INSERT INTO `syslog` VALUES (404, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:31');
INSERT INTO `syslog` VALUES (405, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:31');
INSERT INTO `syslog` VALUES (406, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:37');
INSERT INTO `syslog` VALUES (407, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:42');
INSERT INTO `syslog` VALUES (408, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:43');
INSERT INTO `syslog` VALUES (409, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:44');
INSERT INTO `syslog` VALUES (410, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:44');
INSERT INTO `syslog` VALUES (411, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:45');
INSERT INTO `syslog` VALUES (412, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:27:51');
INSERT INTO `syslog` VALUES (413, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:28:01');
INSERT INTO `syslog` VALUES (414, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:28:03');
INSERT INTO `syslog` VALUES (415, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:28:17');
INSERT INTO `syslog` VALUES (416, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:29:35');
INSERT INTO `syslog` VALUES (417, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:29:58');
INSERT INTO `syslog` VALUES (418, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:30:00');
INSERT INTO `syslog` VALUES (419, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:30:40');
INSERT INTO `syslog` VALUES (420, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:30:46');
INSERT INTO `syslog` VALUES (421, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:31:11');
INSERT INTO `syslog` VALUES (422, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:31:40');
INSERT INTO `syslog` VALUES (423, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:42:00');
INSERT INTO `syslog` VALUES (424, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:42:01');
INSERT INTO `syslog` VALUES (425, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:42:03');
INSERT INTO `syslog` VALUES (426, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:42:24');
INSERT INTO `syslog` VALUES (427, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:43:55');
INSERT INTO `syslog` VALUES (428, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:43:57');
INSERT INTO `syslog` VALUES (429, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:43:59');
INSERT INTO `syslog` VALUES (430, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:25');
INSERT INTO `syslog` VALUES (431, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:30');
INSERT INTO `syslog` VALUES (432, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:35');
INSERT INTO `syslog` VALUES (433, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:37');
INSERT INTO `syslog` VALUES (434, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:39');
INSERT INTO `syslog` VALUES (435, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:40');
INSERT INTO `syslog` VALUES (436, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:43');
INSERT INTO `syslog` VALUES (437, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:56');
INSERT INTO `syslog` VALUES (438, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:49:56');
INSERT INTO `syslog` VALUES (439, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:50:00');
INSERT INTO `syslog` VALUES (440, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:50:16');
INSERT INTO `syslog` VALUES (441, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:50:18');
INSERT INTO `syslog` VALUES (442, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:50:30');
INSERT INTO `syslog` VALUES (443, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:50:32');
INSERT INTO `syslog` VALUES (444, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:55:25');
INSERT INTO `syslog` VALUES (445, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:55:27');
INSERT INTO `syslog` VALUES (446, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:55:37');
INSERT INTO `syslog` VALUES (447, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:55:50');
INSERT INTO `syslog` VALUES (448, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:55:59');
INSERT INTO `syslog` VALUES (449, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:06');
INSERT INTO `syslog` VALUES (450, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:09');
INSERT INTO `syslog` VALUES (451, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:25');
INSERT INTO `syslog` VALUES (452, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:28');
INSERT INTO `syslog` VALUES (453, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,253,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:36');
INSERT INTO `syslog` VALUES (454, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:38');
INSERT INTO `syslog` VALUES (455, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:38');
INSERT INTO `syslog` VALUES (456, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:42');
INSERT INTO `syslog` VALUES (457, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:44');
INSERT INTO `syslog` VALUES (458, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:45');
INSERT INTO `syslog` VALUES (459, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:52');
INSERT INTO `syslog` VALUES (460, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:53');
INSERT INTO `syslog` VALUES (461, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:53');
INSERT INTO `syslog` VALUES (462, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:53');
INSERT INTO `syslog` VALUES (463, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:56:57');
INSERT INTO `syslog` VALUES (464, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:06');
INSERT INTO `syslog` VALUES (465, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:14');
INSERT INTO `syslog` VALUES (466, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:19');
INSERT INTO `syslog` VALUES (467, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:21');
INSERT INTO `syslog` VALUES (468, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:21');
INSERT INTO `syslog` VALUES (469, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:22');
INSERT INTO `syslog` VALUES (470, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:22');
INSERT INTO `syslog` VALUES (471, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:23');
INSERT INTO `syslog` VALUES (472, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:23');
INSERT INTO `syslog` VALUES (473, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:46');
INSERT INTO `syslog` VALUES (474, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:46');
INSERT INTO `syslog` VALUES (475, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:47');
INSERT INTO `syslog` VALUES (476, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:47');
INSERT INTO `syslog` VALUES (477, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:57:59');
INSERT INTO `syslog` VALUES (478, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:58:00');
INSERT INTO `syslog` VALUES (479, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 14:59:37');
INSERT INTO `syslog` VALUES (480, 'admin', '添加开发', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/detailAddDev', 'id=23&', '0:0:0:0:0:0:0:1', '2020-02-17 14:59:44');
INSERT INTO `syslog` VALUES (481, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 15:50:33');
INSERT INTO `syslog` VALUES (482, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 15:50:35');
INSERT INTO `syslog` VALUES (483, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,254,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 15:50:43');
INSERT INTO `syslog` VALUES (484, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 15:50:44');
INSERT INTO `syslog` VALUES (485, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 15:53:37');
INSERT INTO `syslog` VALUES (486, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 15:54:26');
INSERT INTO `syslog` VALUES (487, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 15:59:50');
INSERT INTO `syslog` VALUES (488, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:02:29');
INSERT INTO `syslog` VALUES (489, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:05:33');
INSERT INTO `syslog` VALUES (490, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:07:49');
INSERT INTO `syslog` VALUES (491, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:10:29');
INSERT INTO `syslog` VALUES (492, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:11:41');
INSERT INTO `syslog` VALUES (493, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:12:53');
INSERT INTO `syslog` VALUES (494, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:04');
INSERT INTO `syslog` VALUES (495, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:21');
INSERT INTO `syslog` VALUES (496, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:27');
INSERT INTO `syslog` VALUES (497, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:34');
INSERT INTO `syslog` VALUES (498, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:36');
INSERT INTO `syslog` VALUES (499, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:38');
INSERT INTO `syslog` VALUES (500, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:46');
INSERT INTO `syslog` VALUES (501, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:53');
INSERT INTO `syslog` VALUES (502, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:31:58');
INSERT INTO `syslog` VALUES (503, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:32:03');
INSERT INTO `syslog` VALUES (504, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:32:07');
INSERT INTO `syslog` VALUES (505, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:32:39');
INSERT INTO `syslog` VALUES (506, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:32:55');
INSERT INTO `syslog` VALUES (507, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,254,255,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 16:33:02');
INSERT INTO `syslog` VALUES (508, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:33:04');
INSERT INTO `syslog` VALUES (509, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:33:04');
INSERT INTO `syslog` VALUES (510, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:33:16');
INSERT INTO `syslog` VALUES (511, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:33:22');
INSERT INTO `syslog` VALUES (512, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:33:27');
INSERT INTO `syslog` VALUES (513, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:33:56');
INSERT INTO `syslog` VALUES (514, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:35:30');
INSERT INTO `syslog` VALUES (515, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:37:15');
INSERT INTO `syslog` VALUES (516, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:39:28');
INSERT INTO `syslog` VALUES (517, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:40:29');
INSERT INTO `syslog` VALUES (518, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:40:49');
INSERT INTO `syslog` VALUES (519, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:40:50');
INSERT INTO `syslog` VALUES (520, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,254,255,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 16:40:59');
INSERT INTO `syslog` VALUES (521, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:41:00');
INSERT INTO `syslog` VALUES (522, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:41:00');
INSERT INTO `syslog` VALUES (523, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:41:03');
INSERT INTO `syslog` VALUES (524, 'admin', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:41:14');
INSERT INTO `syslog` VALUES (525, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:41:18');
INSERT INTO `syslog` VALUES (526, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:42:53');
INSERT INTO `syslog` VALUES (527, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:43:14');
INSERT INTO `syslog` VALUES (528, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:43:23');
INSERT INTO `syslog` VALUES (529, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:56:02');
INSERT INTO `syslog` VALUES (530, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:56:08');
INSERT INTO `syslog` VALUES (531, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,254,255,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 16:56:13');
INSERT INTO `syslog` VALUES (532, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:56:15');
INSERT INTO `syslog` VALUES (533, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:56:15');
INSERT INTO `syslog` VALUES (534, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 16:56:28');
INSERT INTO `syslog` VALUES (535, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:03:50');
INSERT INTO `syslog` VALUES (536, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:04:02');
INSERT INTO `syslog` VALUES (537, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,254,255,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 17:04:07');
INSERT INTO `syslog` VALUES (538, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:04:09');
INSERT INTO `syslog` VALUES (539, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:04:09');
INSERT INTO `syslog` VALUES (540, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:04:16');
INSERT INTO `syslog` VALUES (541, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:04:33');
INSERT INTO `syslog` VALUES (542, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:05:38');
INSERT INTO `syslog` VALUES (543, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:16:03');
INSERT INTO `syslog` VALUES (544, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:16:13');
INSERT INTO `syslog` VALUES (545, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 17:16:19');
INSERT INTO `syslog` VALUES (546, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:16:20');
INSERT INTO `syslog` VALUES (547, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:16:20');
INSERT INTO `syslog` VALUES (548, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:16:28');
INSERT INTO `syslog` VALUES (549, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:18:54');
INSERT INTO `syslog` VALUES (550, 'admin', '查看历史订单', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/order', 'id=16&', '0:0:0:0:0:0:0:1', '2020-02-17 17:18:58');
INSERT INTO `syslog` VALUES (551, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:22:06');
INSERT INTO `syslog` VALUES (552, 'admin', '查看历史订单', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/order', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-17 17:22:12');
INSERT INTO `syslog` VALUES (553, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:25:45');
INSERT INTO `syslog` VALUES (554, 'admin', '查看历史订单', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/order', 'id=1&', '0:0:0:0:0:0:0:1', '2020-02-17 17:25:49');
INSERT INTO `syslog` VALUES (555, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:26:33');
INSERT INTO `syslog` VALUES (556, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:26:35');
INSERT INTO `syslog` VALUES (557, 'admin', '查看历史订单', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/order', 'id=16&', '0:0:0:0:0:0:0:1', '2020-02-17 17:26:37');
INSERT INTO `syslog` VALUES (558, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:26:51');
INSERT INTO `syslog` VALUES (559, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/RMS/log/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:27:15');
INSERT INTO `syslog` VALUES (560, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:34:12');
INSERT INTO `syslog` VALUES (561, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 17:34:20');
INSERT INTO `syslog` VALUES (562, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:34:22');
INSERT INTO `syslog` VALUES (563, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:34:30');
INSERT INTO `syslog` VALUES (564, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 17:36:48');
INSERT INTO `syslog` VALUES (565, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:23:48');
INSERT INTO `syslog` VALUES (566, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:23:54');
INSERT INTO `syslog` VALUES (567, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:43:43');
INSERT INTO `syslog` VALUES (568, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 19:44:00');
INSERT INTO `syslog` VALUES (569, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:44:02');
INSERT INTO `syslog` VALUES (570, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:44:26');
INSERT INTO `syslog` VALUES (571, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:44:39');
INSERT INTO `syslog` VALUES (572, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:45:05');
INSERT INTO `syslog` VALUES (573, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:45:16');
INSERT INTO `syslog` VALUES (574, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:47:49');
INSERT INTO `syslog` VALUES (575, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:48:00');
INSERT INTO `syslog` VALUES (576, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 19:48:07');
INSERT INTO `syslog` VALUES (577, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:48:08');
INSERT INTO `syslog` VALUES (578, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:50:12');
INSERT INTO `syslog` VALUES (579, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 19:50:17');
INSERT INTO `syslog` VALUES (580, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:50:19');
INSERT INTO `syslog` VALUES (581, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:50:35');
INSERT INTO `syslog` VALUES (582, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:55:52');
INSERT INTO `syslog` VALUES (583, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 19:56:11');
INSERT INTO `syslog` VALUES (584, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:04:37');
INSERT INTO `syslog` VALUES (585, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:04:44');
INSERT INTO `syslog` VALUES (586, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:04:45');
INSERT INTO `syslog` VALUES (587, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:04:59');
INSERT INTO `syslog` VALUES (588, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:07:16');
INSERT INTO `syslog` VALUES (589, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:10:26');
INSERT INTO `syslog` VALUES (590, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:10:36');
INSERT INTO `syslog` VALUES (591, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:10:46');
INSERT INTO `syslog` VALUES (592, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:12:02');
INSERT INTO `syslog` VALUES (593, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:12:17');
INSERT INTO `syslog` VALUES (594, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:12:23');
INSERT INTO `syslog` VALUES (595, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:12:25');
INSERT INTO `syslog` VALUES (596, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:12:25');
INSERT INTO `syslog` VALUES (597, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:12:34');
INSERT INTO `syslog` VALUES (598, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:12:52');
INSERT INTO `syslog` VALUES (599, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:13:22');
INSERT INTO `syslog` VALUES (600, 'admin', '服务创建', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceCreate', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:13:46');
INSERT INTO `syslog` VALUES (601, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:13:57');
INSERT INTO `syslog` VALUES (602, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:25:42');
INSERT INTO `syslog` VALUES (603, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:25:55');
INSERT INTO `syslog` VALUES (604, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:26:03');
INSERT INTO `syslog` VALUES (605, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,267,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:27:03');
INSERT INTO `syslog` VALUES (606, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:27:05');
INSERT INTO `syslog` VALUES (607, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:27:05');
INSERT INTO `syslog` VALUES (608, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:27:42');
INSERT INTO `syslog` VALUES (609, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:27:44');
INSERT INTO `syslog` VALUES (610, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:27:44');
INSERT INTO `syslog` VALUES (611, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:28:16');
INSERT INTO `syslog` VALUES (612, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:28:18');
INSERT INTO `syslog` VALUES (613, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:28:18');
INSERT INTO `syslog` VALUES (614, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:28:29');
INSERT INTO `syslog` VALUES (615, 'admin', '服务处理', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceHandler', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:29:26');
INSERT INTO `syslog` VALUES (616, 'admin', '服务处理', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceHandler', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:31:52');
INSERT INTO `syslog` VALUES (617, 'admin', '服务处理', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceHandler', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:31:53');
INSERT INTO `syslog` VALUES (618, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:32:04');
INSERT INTO `syslog` VALUES (619, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:32:07');
INSERT INTO `syslog` VALUES (620, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:32:41');
INSERT INTO `syslog` VALUES (621, 'admin', '服务处理', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceHandler', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:32:43');
INSERT INTO `syslog` VALUES (622, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:32:43');
INSERT INTO `syslog` VALUES (623, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:32:43');
INSERT INTO `syslog` VALUES (624, 'admin', '服务处理', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceHandler', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:32:54');
INSERT INTO `syslog` VALUES (625, 'admin', '服务处理', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceHandler', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:33:08');
INSERT INTO `syslog` VALUES (626, 'admin', '服务分配', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFenPei', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:38:51');
INSERT INTO `syslog` VALUES (627, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:38:56');
INSERT INTO `syslog` VALUES (628, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:39:01');
INSERT INTO `syslog` VALUES (629, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:39:02');
INSERT INTO `syslog` VALUES (630, 'admin', '服务反馈', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFeedback', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:39:10');
INSERT INTO `syslog` VALUES (631, 'admin', '服务反馈', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFeedback', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:45:05');
INSERT INTO `syslog` VALUES (632, 'admin', '服务反馈', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFeedback', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:45:37');
INSERT INTO `syslog` VALUES (633, 'admin', '服务处理', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceHandler', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:45:50');
INSERT INTO `syslog` VALUES (634, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:45:58');
INSERT INTO `syslog` VALUES (635, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:46:03');
INSERT INTO `syslog` VALUES (636, 'admin', '服务反馈', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceFeedback', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:46:05');
INSERT INTO `syslog` VALUES (637, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:46:05');
INSERT INTO `syslog` VALUES (638, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:54:40');
INSERT INTO `syslog` VALUES (639, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 20:54:45');
INSERT INTO `syslog` VALUES (640, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:54:47');
INSERT INTO `syslog` VALUES (641, 'admin', '服务归档', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceArchive', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:54:57');
INSERT INTO `syslog` VALUES (642, 'admin', '服务归档', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceArchive', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:55:24');
INSERT INTO `syslog` VALUES (643, 'admin', '服务归档', 'SystemManage.Customer.controller.CustomerServiceController', '/RMS/customerService/serviceArchive', '', '0:0:0:0:0:0:0:1', '2020-02-17 20:56:02');
INSERT INTO `syslog` VALUES (644, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:05:55');
INSERT INTO `syslog` VALUES (645, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,273,241,242,243,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 21:06:39');
INSERT INTO `syslog` VALUES (646, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:06:40');
INSERT INTO `syslog` VALUES (647, 'admin', '客户贡献分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clientGX', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:07:09');
INSERT INTO `syslog` VALUES (648, 'admin', '客户贡献分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clientGX', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:08:18');
INSERT INTO `syslog` VALUES (649, 'admin', '客户贡献分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clientGX', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:14:40');
INSERT INTO `syslog` VALUES (650, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:15:30');
INSERT INTO `syslog` VALUES (651, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:15:36');
INSERT INTO `syslog` VALUES (652, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:15:43');
INSERT INTO `syslog` VALUES (653, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,273,241,242,243,274,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 21:15:48');
INSERT INTO `syslog` VALUES (654, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:15:49');
INSERT INTO `syslog` VALUES (655, 'admin', '客户流失分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clientLoss', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:16:42');
INSERT INTO `syslog` VALUES (656, 'admin', '开发记录列表', 'SystemManage.SaleChance.controller.CusDevPlanController', '/RMS/cusDevPlan/cusDev', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:16:45');
INSERT INTO `syslog` VALUES (657, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:16:48');
INSERT INTO `syslog` VALUES (658, 'admin', '客户流失分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clientLoss', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:18:03');
INSERT INTO `syslog` VALUES (659, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:29:53');
INSERT INTO `syslog` VALUES (660, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,273,241,275,242,243,274,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 21:29:59');
INSERT INTO `syslog` VALUES (661, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:30:00');
INSERT INTO `syslog` VALUES (662, 'admin', '客户构成分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clienGc', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:30:11');
INSERT INTO `syslog` VALUES (663, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:30:39');
INSERT INTO `syslog` VALUES (664, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:31:52');
INSERT INTO `syslog` VALUES (665, 'admin', '客户构成分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clienGc', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:31:57');
INSERT INTO `syslog` VALUES (666, 'admin', '客户构成分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clienGc', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:33:41');
INSERT INTO `syslog` VALUES (667, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:33:47');
INSERT INTO `syslog` VALUES (668, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,273,241,275,242,276,243,274,1,224,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 21:33:52');
INSERT INTO `syslog` VALUES (669, 'admin', '客户构成分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clienGc', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:33:53');
INSERT INTO `syslog` VALUES (670, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:33:53');
INSERT INTO `syslog` VALUES (671, 'admin', '客户服务分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clienFw', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:34:19');
INSERT INTO `syslog` VALUES (672, 'admin', '客户服务分析', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/clienFw', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:35:08');
INSERT INTO `syslog` VALUES (673, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/RMS/log/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:35:16');
INSERT INTO `syslog` VALUES (674, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:43:02');
INSERT INTO `syslog` VALUES (675, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,273,241,275,242,276,243,274,1,224,277,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 21:43:06');
INSERT INTO `syslog` VALUES (676, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:43:08');
INSERT INTO `syslog` VALUES (677, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:43:21');
INSERT INTO `syslog` VALUES (678, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:49:52');
INSERT INTO `syslog` VALUES (679, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:03');
INSERT INTO `syslog` VALUES (680, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,273,241,275,242,276,243,274,1,224,277,278,279,280,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:09');
INSERT INTO `syslog` VALUES (681, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:10');
INSERT INTO `syslog` VALUES (682, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:10');
INSERT INTO `syslog` VALUES (683, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:24');
INSERT INTO `syslog` VALUES (684, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:41');
INSERT INTO `syslog` VALUES (685, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:48');
INSERT INTO `syslog` VALUES (686, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:50:52');
INSERT INTO `syslog` VALUES (687, 'admin', '日志信息查看', 'SystemManage.LogManage.controller.LogController', '/RMS/log/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:51:08');
INSERT INTO `syslog` VALUES (688, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:51:22');
INSERT INTO `syslog` VALUES (689, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:52:40');
INSERT INTO `syslog` VALUES (690, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:53:11');
INSERT INTO `syslog` VALUES (691, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:53:11');
INSERT INTO `syslog` VALUES (692, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 21:53:11');
INSERT INTO `syslog` VALUES (693, 'admin', '字典管理', 'SystemManage.DataDic.controller.DataDicController', '/RMS/dataDic/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:17:47');
INSERT INTO `syslog` VALUES (694, 'admin', '客户信息列表', 'SystemManage.Customer.controller.CustomerController', '/RMS/customer/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:17:47');
INSERT INTO `syslog` VALUES (695, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:17:51');
INSERT INTO `syslog` VALUES (696, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:17:55');
INSERT INTO `syslog` VALUES (697, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:00');
INSERT INTO `syslog` VALUES (698, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=1&resourceIds=222,223,13,131,132,133,134,12,121,122,123,124,125,11,111,112,113,114,14,141,142,143,144,15,244,227,228,245,246,247,248,229,249,250,251,252,253,230,231,257,258,259,260,261,254,255,232,262,281,233,234,263,235,264,265,266,236,267,268,237,269,270,238,271,272,239,240,273,241,275,242,276,243,274,1,224,277,278,279,280,221,226,225&', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:08');
INSERT INTO `syslog` VALUES (699, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:09');
INSERT INTO `syslog` VALUES (700, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:09');
INSERT INTO `syslog` VALUES (701, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:18');
INSERT INTO `syslog` VALUES (702, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:19');
INSERT INTO `syslog` VALUES (703, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:24');
INSERT INTO `syslog` VALUES (704, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:54');
INSERT INTO `syslog` VALUES (705, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:18:56');
INSERT INTO `syslog` VALUES (706, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:19:18');
INSERT INTO `syslog` VALUES (707, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:25:06');
INSERT INTO `syslog` VALUES (708, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:25:09');
INSERT INTO `syslog` VALUES (709, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:25:19');
INSERT INTO `syslog` VALUES (710, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:25:25');
INSERT INTO `syslog` VALUES (711, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:27:22');
INSERT INTO `syslog` VALUES (712, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:27:25');
INSERT INTO `syslog` VALUES (713, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:27:37');
INSERT INTO `syslog` VALUES (714, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:28:04');
INSERT INTO `syslog` VALUES (715, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:28:19');
INSERT INTO `syslog` VALUES (716, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:28:46');
INSERT INTO `syslog` VALUES (717, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:29:00');
INSERT INTO `syslog` VALUES (718, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:30:55');
INSERT INTO `syslog` VALUES (719, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:30:56');
INSERT INTO `syslog` VALUES (720, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:31:06');
INSERT INTO `syslog` VALUES (721, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:34:20');
INSERT INTO `syslog` VALUES (722, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:35:00');
INSERT INTO `syslog` VALUES (723, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:35:12');
INSERT INTO `syslog` VALUES (724, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:35:24');
INSERT INTO `syslog` VALUES (725, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:37:21');
INSERT INTO `syslog` VALUES (726, 'admin', '客户流失添加', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/add', 'null', '0:0:0:0:0:0:0:1', '2020-02-17 22:37:24');
INSERT INTO `syslog` VALUES (727, 'admin', '客户流失管理', 'SystemManage.Customer.controller.CustomerLossController', '/RMS/customerLoss/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:37:52');
INSERT INTO `syslog` VALUES (728, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:38:15');
INSERT INTO `syslog` VALUES (729, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:38:22');
INSERT INTO `syslog` VALUES (730, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:38:33');
INSERT INTO `syslog` VALUES (731, 'admin', '角色授权', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/grant', 'id=2&resourceIds=222,223,13,131,12,121,11,111,14,141,15,244,227,228,245,229,249,230,231,254,232,262,1,224,221,226&', '0:0:0:0:0:0:0:1', '2020-02-17 22:39:42');
INSERT INTO `syslog` VALUES (732, 'admin', '角色信息查看', 'SystemManage.RoleManage.controller.RoleController', '/RMS/role/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:39:44');
INSERT INTO `syslog` VALUES (733, 'admin', '用户信息查看', 'SystemManage.UserManage.controller.UserController', '/RMS/user/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:40:08');
INSERT INTO `syslog` VALUES (734, 'feng', '销售机会信息查看', 'SystemManage.SaleChance.controller.SaleChanceController', '/RMS/saleChances/manager', '', '0:0:0:0:0:0:0:1', '2020-02-17 22:40:41');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `khno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cusManager` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `myd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `xyd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `webSite` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yyzzzch` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zczj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nyye` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `khyh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `khzh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dsdjh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gsdjh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, 'KH21321321', '北京大牛科技', '北京', '小明', '战略合作伙伴', '☆', '☆☆☆☆☆', '北京海淀区双榆树东里15号', '100027', '010-62263393', '010-62263393', 'www.daniu.com', '420103000057404', 'Java', '1000', '5000', '中国银行 ', '6225231243641', '4422214321321', '4104322332', 0);
INSERT INTO `t_customer` VALUES (16, 'KH20150526073022', '风驰科技', '北京', '小红', '大客户', '☆', '☆', '321', '21', '321', '321', '321', '321', '321', '', '21', '321', '321', '321', '3213', 0);
INSERT INTO `t_customer` VALUES (17, 'KH20150526073023', '巨人科技', NULL, '小丽', '普通客户', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_customer` VALUES (18, 'KH20150526073024', '新人科技', NULL, NULL, '重点开发客户', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_customer` VALUES (19, 'KH20150526073025', '好人集团', NULL, NULL, '合作伙伴', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_customer` VALUES (24, 'KH20200217093151', '大神', '北京', '小明', '战略合作伙伴', '☆☆☆', '☆☆☆☆', '北京', '10000', '1234', '1233', 'www', '484844', 'java', '10000', '500000', '中国银行', '1235166', '84448', '151515', 0);

-- ----------------------------
-- Table structure for t_customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_contact`;
CREATE TABLE `t_customer_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusId` int(11) NULL DEFAULT NULL,
  `contactTime` date NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overview` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_customer_contact`(`cusId`) USING BTREE,
  CONSTRAINT `t_customer_contact_ibfk_1` FOREIGN KEY (`cusId`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_contact
-- ----------------------------
INSERT INTO `t_customer_contact` VALUES (2, 1, '2015-05-06', '1', '2');
INSERT INTO `t_customer_contact` VALUES (3, 16, '2020-01-09', '北京', '多少点');
INSERT INTO `t_customer_contact` VALUES (4, 16, '2020-01-09', '上海', '大声点');
INSERT INTO `t_customer_contact` VALUES (6, 16, '2020-01-09', '大赛', 'dsad');

-- ----------------------------
-- Table structure for t_customer_linkman
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_linkman`;
CREATE TABLE `t_customer_linkman`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusId` int(11) NULL DEFAULT NULL,
  `linkName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zhiwei` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `officePhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_customer_linkman`(`cusId`) USING BTREE,
  CONSTRAINT `t_customer_linkman_ibfk_1` FOREIGN KEY (`cusId`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_linkman
-- ----------------------------
INSERT INTO `t_customer_linkman` VALUES (1, 1, '1', '男', '321', '321', '21321');
INSERT INTO `t_customer_linkman` VALUES (2, 1, '2', '女', '21', '321', '321');
INSERT INTO `t_customer_linkman` VALUES (4, 1, '3', '女', '4', '5', '6');
INSERT INTO `t_customer_linkman` VALUES (5, 1, '33', '男', '44', '55', '66');
INSERT INTO `t_customer_linkman` VALUES (6, 1, '张三', '男', '经理', '21321', '32132121');
INSERT INTO `t_customer_linkman` VALUES (13, 16, '大大发', '男', '大萨达', '15616', '15166156');
INSERT INTO `t_customer_linkman` VALUES (14, 16, '小明', '男', 'Java', '9527', '113');
INSERT INTO `t_customer_linkman` VALUES (20, 19, '撒大声地', '男', '撒大声地', '', '');
INSERT INTO `t_customer_linkman` VALUES (21, 17, '防守对方', '男', '防守对方', '4234', '313324');
INSERT INTO `t_customer_linkman` VALUES (22, 1, '爽肤水发送到', '男', '水电费水电费', '53453', '34545');
INSERT INTO `t_customer_linkman` VALUES (23, 1, '大声点', '男', '大声点', '3213123', '12323');
INSERT INTO `t_customer_linkman` VALUES (24, 1, 'java', '男', 'java', '123456', '123456');

-- ----------------------------
-- Table structure for t_customer_loss
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_loss`;
CREATE TABLE `t_customer_loss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusNo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cusName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cusManager` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastOrderTime` date NULL DEFAULT NULL,
  `confirmLossTime` date NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `lossreason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_loss
-- ----------------------------
INSERT INTO `t_customer_loss` VALUES (1, '1', '大风科技', '小张', '2015-02-01', '2014-05-01', 1, '11');
INSERT INTO `t_customer_loss` VALUES (3, 'KH20150526073022', '鸟人科技', '小红', '2014-02-02', '2014-05-01', 1, '公司迁地址');
INSERT INTO `t_customer_loss` VALUES (4, 'KH20150526073023', '321', '小丽', '2014-02-03', NULL, 1, NULL);
INSERT INTO `t_customer_loss` VALUES (12, 'bbc74e3a-c711-40c3-940c-7ed9a755098f', '留存客户', '小明', '2020-02-17', '2020-02-17', 0, '不玩了');

-- ----------------------------
-- Table structure for t_customer_order
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_order`;
CREATE TABLE `t_customer_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusId` int(11) NULL DEFAULT NULL,
  `orderNo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderDate` date NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_customer_order`(`cusId`) USING BTREE,
  CONSTRAINT `t_customer_order_ibfk_1` FOREIGN KEY (`cusId`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_order
-- ----------------------------
INSERT INTO `t_customer_order` VALUES (1, 1, 'DD11213', '2015-02-01', '11', 1);
INSERT INTO `t_customer_order` VALUES (2, 16, 'DD11212', '2014-01-02', '22', 1);
INSERT INTO `t_customer_order` VALUES (3, 16, 'DD21321', '2014-02-02', '22', 1);
INSERT INTO `t_customer_order` VALUES (4, 17, 'DD2121', '2014-02-03', 'ss', 1);

-- ----------------------------
-- Table structure for t_customer_reprieve
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_reprieve`;
CREATE TABLE `t_customer_reprieve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lossId` int(11) NULL DEFAULT NULL,
  `measure` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_customer_reprieve`(`lossId`) USING BTREE,
  CONSTRAINT `t_customer_reprieve_ibfk_1` FOREIGN KEY (`lossId`) REFERENCES `t_customer_loss` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_reprieve
-- ----------------------------
INSERT INTO `t_customer_reprieve` VALUES (1, 1, '打电话给客户，询问不卖我司产品原因2');
INSERT INTO `t_customer_reprieve` VALUES (2, 1, '发送我司最新产品给客户');
INSERT INTO `t_customer_reprieve` VALUES (3, 1, 's');
INSERT INTO `t_customer_reprieve` VALUES (4, 4, '多发');
INSERT INTO `t_customer_reprieve` VALUES (5, 4, '2121');

-- ----------------------------
-- Table structure for t_customer_service
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_service`;
CREATE TABLE `t_customer_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serveType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overview` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `servicerequest` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createPeople` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `assigner` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignTime` datetime DEFAULT NULL,
  `serviceProce` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serviceProcePeople` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serviceProceTime` datetime DEFAULT NULL,
  `serviceProceResult` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `myd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_service
-- ----------------------------
INSERT INTO `t_customer_service` VALUES (1, '咨询', '咨询下Think pad价格', '大浪技术', '已归档', '。。。测试', 'Jack', '2015-06-03 00:00:00', '小红', '2015-06-03 00:00:00', 's', 'Jack', '2015-06-04 00:00:00', 'OK', '☆☆☆☆');
INSERT INTO `t_customer_service` VALUES (2, '咨询', '321', '1', '已归档', '321', 'Jack', '2015-06-03 00:00:00', NULL, NULL, 'sss', 'Jack', '2015-06-04 00:00:00', 'OK', '☆☆☆');
INSERT INTO `t_customer_service` VALUES (3, '咨询', '21', '21', '已归档', '1', 'Jack', '2015-06-03 00:00:00', '小红', '2015-06-03 00:00:00', 'sds', 'Jack', '2015-06-04 00:00:00', 'OK', '☆☆☆☆');
INSERT INTO `t_customer_service` VALUES (6, '咨询', '321', '21', '已归档', '321', 'Jack', '2015-06-03 00:00:00', '小红', '2015-06-04 00:00:00', 'ds', 'Jack', '2015-06-04 00:00:00', 'OK', '☆☆☆');
INSERT INTO `t_customer_service` VALUES (7, '咨询', 's', '222', '已归档', 'ss', 'Jack', '2015-06-04 00:00:00', '小明', '2015-06-04 00:00:00', 'ss', 'Jack', '2015-06-04 00:00:00', 'OK', '☆☆');
INSERT INTO `t_customer_service` VALUES (8, '建议', '4', '3', '已归档', '5', 'Jack', '2015-06-04 00:00:00', '小张', '2015-06-04 00:00:00', '111', 'admin', '2015-06-04 00:00:00', 'ok', '☆☆☆☆');
INSERT INTO `t_customer_service` VALUES (9, '投诉', '2', '1', '已归档', '3', 'Jack', '2015-06-04 00:00:00', '小明', '2015-06-04 00:00:00', '333', 'Jack', '2015-06-04 00:00:00', 'OK', '☆☆☆☆☆');
INSERT INTO `t_customer_service` VALUES (10, '建议', '32', '32', '已处理', '32', 'Jack', '2015-06-04 00:00:00', '小明', '2020-01-09 00:00:00', 'Java你好', 'admin', '2020-01-10 00:00:00', NULL, NULL);
INSERT INTO `t_customer_service` VALUES (11, '建议', '21', '21', '已处理', '21', 'Jack', '2015-06-04 00:00:00', '小明', '2020-01-10 00:00:00', '你好啊', 'admin', '2020-01-10 00:00:00', NULL, NULL);
INSERT INTO `t_customer_service` VALUES (12, '建议', 'fda', '大牛科技', '已归档', 'fda', 'Jack', '2015-06-10 00:00:00', '小红', '2015-06-10 00:00:00', 'fda', 'Jack', '2015-06-10 00:00:00', 'good', '☆☆☆☆☆');
INSERT INTO `t_customer_service` VALUES (13, '咨询', '咨询下Think pad价格。。', '大众科技', '已归档', '发达龙卷风大。。。。', 'Jack', '2015-06-11 00:00:00', '小红', '2015-06-11 00:00:00', '。。。\r\n1，2\r\n，3。。。', 'Jack', '2015-06-11 00:00:00', 'OK', '☆☆☆☆☆');
INSERT INTO `t_customer_service` VALUES (23, '咨询', 'java', '大牛客户', '已处理', '学习Java', 'admin', '2020-01-10 00:00:00', '小明', '2020-01-10 00:00:00', 'java', 'admin', '2020-02-17 00:00:00', NULL, NULL);
INSERT INTO `t_customer_service` VALUES (26, '咨询', '发顺丰', '范德萨的', '已分配', '所得分', 'admin', '2020-01-10 00:00:00', '小明', '2020-01-10 00:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_customer_service` VALUES (28, '咨询', '大声点', '大赛', '新创建', '大赛', 'sada', '2020-02-17 19:56:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_customer_service` VALUES (29, '咨询', '滴滴滴', '阿里', '新创建', '分布式', 'admin', '2020-02-17 20:13:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_datadic
-- ----------------------------
DROP TABLE IF EXISTS `t_datadic`;
CREATE TABLE `t_datadic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataDicName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dataDicValue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_datadic`(`dataDicValue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_datadic
-- ----------------------------
INSERT INTO `t_datadic` VALUES (1, '客户等级', '普通客户');
INSERT INTO `t_datadic` VALUES (2, '客户等级', '重点开发客户');
INSERT INTO `t_datadic` VALUES (3, '客户等级', '大客户');
INSERT INTO `t_datadic` VALUES (4, '客户等级', '合作伙伴');
INSERT INTO `t_datadic` VALUES (5, '客户等级', '战略合作伙伴');
INSERT INTO `t_datadic` VALUES (6, '服务类型', '咨询');
INSERT INTO `t_datadic` VALUES (7, '服务类型', '建议');
INSERT INTO `t_datadic` VALUES (8, '服务类型', '投诉');

-- ----------------------------
-- Table structure for t_order_details
-- ----------------------------
DROP TABLE IF EXISTS `t_order_details`;
CREATE TABLE `t_order_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NULL DEFAULT NULL,
  `goodsName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsNum` int(11) NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `sum` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_order_details`(`orderId`) USING BTREE,
  CONSTRAINT `t_order_details_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `t_customer_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_details
-- ----------------------------
INSERT INTO `t_order_details` VALUES (1, 1, '联想笔记本', 2, '台', 4900, 9800);
INSERT INTO `t_order_details` VALUES (2, 1, '惠普音响', 4, '台', 200, 800);
INSERT INTO `t_order_details` VALUES (3, 2, '罗技键盘', 10, '个', 90, 900);
INSERT INTO `t_order_details` VALUES (4, 3, '艾利鼠标', 20, '个', 20, 400);
INSERT INTO `t_order_details` VALUES (5, 3, '东芝U盘', 5, '个', 105, 525);
INSERT INTO `t_order_details` VALUES (6, 4, '充电器', 1, '个', 30, 30);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` tinyint(2) NOT NULL DEFAULT 0,
  `age` tinyint(2) NULL DEFAULT 0,
  `usertype` tinyint(2) NOT NULL DEFAULT 0,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `organization_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `createdate` datetime,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (14, 'feng', 'feng', 'ada1be43ad606a0131b74c44b88c2dd2', 1, 25, 1, 0, '6', '2018-12-29 17:40:18', '18707173376');
INSERT INTO `user` VALUES (15, 'test', '测试账户', 'b0ce72ed0b24728785094ef90b6d00c3', 0, 6, 1, 0, '6', '2019-01-21 15:21:19', '18707173376');
INSERT INTO `user` VALUES (16, 'admin', '超级管理员', 'c41d7c66e1b8404545aa3a0ece2006ac', 0, 21, 1, 0, '1', '2019-02-18 09:01:08', '18296633676');
INSERT INTO `user` VALUES (18, 'test2', '测试账户2', '191dd868a777ff98f650c59d87ed6563', 1, 20, 1, 0, '3', '2019-02-18 00:34:47', '12306');
INSERT INTO `user` VALUES (19, 'test3', '测试账户3', '326f03ff1f335b2583041c6239c25777', 0, 14, 1, 0, '5', '2019-01-24 10:51:00', '12345609');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(19) NOT NULL,
  `role_id` bigint(19) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (164, 18, 8);
INSERT INTO `user_role` VALUES (176, 14, 2);
INSERT INTO `user_role` VALUES (182, 15, 8);
INSERT INTO `user_role` VALUES (183, 19, 8);
INSERT INTO `user_role` VALUES (184, 16, 1);
INSERT INTO `user_role` VALUES (185, 16, 2);
INSERT INTO `user_role` VALUES (186, 16, 8);
INSERT INTO `user_role` VALUES (187, 16, 10);

SET FOREIGN_KEY_CHECKS = 1;
