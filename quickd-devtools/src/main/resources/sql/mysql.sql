/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : quickd

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 15/10/2019 10:38:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_project
-- ----------------------------
DROP TABLE IF EXISTS `gen_project`;
CREATE TABLE `gen_project`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `project` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '项目名称',
  `sys_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '系统名称',
  `group_name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '项目分组',
  `copyright` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '项目版权',
  `author` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '项目作者',
  `db_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库地址',
  `db_port` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库端口',
  `db_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库名',
  `db_username` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库用户名',
  `db_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库密码',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(1) NOT NULL DEFAULT 1 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '项目生成表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_project
-- ----------------------------
INSERT INTO `gen_project` VALUES ('1178573674494222338', 'demo', '企业级快速开发平台', 'com.quickd', 'www.iquickd.com', 'quickd', '127.0.0.1', '3306', 'demo', 'root', '123456', NULL, '2019-09-30 15:33:55', NULL, NULL, NULL, '0', 1);
INSERT INTO `gen_project` VALUES ('1178575709067268098', 'demo', '企业级快速开发平台', 'com.quickd', 'www.iquickd.com', 'quickd', '127.0.0.1', '3306', 'demo', 'root', '123456', NULL, '2019-09-30 15:42:01', NULL, NULL, NULL, '0', 1);
INSERT INTO `gen_project` VALUES ('1178577517328150531', 'demo', '企业级快速开发平台', 'com.quickd', 'www.iquickd.com', 'quickd', '127.0.0.1', '3306', 'demo', 'root', '123456', NULL, '2019-09-30 15:49:12', NULL, NULL, NULL, '0', 1);
INSERT INTO `gen_project` VALUES ('1178579707631448067', 'demo', '企业级快速开发平台', 'com.quickd', 'www.iquickd.com', 'quickd', '127.0.0.1', '3306', 'demo', 'root', '123456', NULL, '2019-09-30 15:57:54', NULL, NULL, NULL, '0', 1);
INSERT INTO `gen_project` VALUES ('1178580570064236547', 'demo', '企业级快速开发平台', 'com.quickd', 'www.iquickd.com', 'quickd', '127.0.0.1', '3306', 'demo', 'root', '123456', NULL, '2019-09-30 16:01:20', NULL, NULL, NULL, '0', 1);
INSERT INTO `gen_project` VALUES ('1179174640088244226', 'demo', '企业级快速demo平台', 'com.quickd', 'www.iquickd.com', 'quickd', '127.0.0.1', '3306', 'demo', 'root', '123456', NULL, '2019-10-02 07:21:57', NULL, NULL, NULL, '0', 1);
INSERT INTO `gen_project` VALUES ('1179177173506486274', 'demo', '企业级快速demo平台', 'com.quickd', 'www.iquickd.com', 'quickd', '127.0.0.1', '3306', 'demo', 'root', '123456', NULL, '2019-10-02 07:32:01', NULL, NULL, NULL, '0', 1);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表外键',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `version` int(11) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `gen_table_name`(`table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `col_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `field_label` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述备注',
  `attr_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `col_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的数据类型',
  `attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `attr_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名大写',
  `primary_key` bit(1) NULL DEFAULT NULL COMMENT '是否主键',
  `is_unique` bit(1) NULL DEFAULT NULL COMMENT '是否唯一（1：是；0：否）',
  `is_not_null` bit(1) NULL DEFAULT b'1' COMMENT '是否可为空',
  `is_insert` bit(1) NULL DEFAULT b'0' COMMENT '是否为插入字段',
  `is_edit` bit(1) NULL DEFAULT b'0' COMMENT '是否编辑字段',
  `is_list` bit(1) NULL DEFAULT b'0' COMMENT '是否列表字段',
  `is_query` bit(1) NULL DEFAULT b'0' COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `form_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` int(1) NULL DEFAULT NULL COMMENT '排序（升序）',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `version` int(11) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `ref_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表',
  `ref_column` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联字段',
  `as_column` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示字段',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_table_column_name`(`col_name`) USING BTREE,
  INDEX `gen_table_column_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1181226517705469954', 'wms_flow', 'id', '流水ID', 'Long', 'bigint', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517705469955', 'wms_flow', 'type', '类型', 'Integer', 'int', 'type', 'Type', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517705469956', 'wms_flow', 'form_id', '单据号', 'Long', 'bigint', 'formId', 'FormId', b'0', NULL, b'0', b'0', b'0', b'1', b'0', 'cn', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517705469957', 'wms_flow', 'in_storage', '入库仓库号', 'String', 'varchar', 'inStorage', 'InStorage', b'0', NULL, b'0', b'0', b'0', b'1', b'0', 'cn', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517705469958', 'wms_flow', 'mi_storage', '盘点仓库', 'String', 'varchar', 'miStorage', 'MiStorage', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517705469959', 'wms_flow', 'out_storage', '出库仓库号', 'String', 'varchar', 'outStorage', 'OutStorage', b'0', NULL, b'0', b'0', b'0', b'1', b'0', 'cn', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517713858561', 'wms_flow', 'material_id', '货号', 'Long', 'bigint', 'materialId', 'MaterialId', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517713858562', 'wms_flow', 'material_name', '货物名称', 'String', 'varchar', 'materialName', 'MaterialName', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517713858563', 'wms_flow', 'quantity', '变动数量', 'Double', 'double', 'quantity', 'Quantity', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517713858565', 'wms_flow', 'worker', '作业人', 'Long', 'bigint', 'worker', 'Worker', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517713858566', 'wms_flow', 'operator', '操作人', 'String', 'varchar', 'operator', 'Operator', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181226517713858567', 'wms_flow', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'dateselect', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:15:23', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181229720702496770', 'wms_inventory', 'id', 'id', 'Long', 'bigint', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:16:58', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181229720702496771', 'wms_inventory', 'storage_id', '仓库', 'String', 'varchar', 'storageId', 'StorageId', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'eq', 'select', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:16:58', NULL, NULL, '0', NULL, 'wms_storage', 'id', NULL);
INSERT INTO `gen_table_column` VALUES ('1181229720702496772', 'wms_inventory', 'material_id', '货物', 'Long', 'bigint', 'materialId', 'MaterialId', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'cn', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:16:58', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181229720702496773', 'wms_inventory', 'quantity', '库存数量', 'Double', 'double', 'quantity', 'Quantity', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:16:58', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181229720702496774', 'wms_inventory', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'dateselect', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:16:58', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181230303022886914', 'wms_inventory_bin', 'id', 'id', 'Long', 'bigint', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:19:05', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181230303022886915', 'wms_inventory_bin', 'storage_id', '仓库号', 'String', 'varchar', 'storageId', 'StorageId', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'eq', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:19:05', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181230303022886916', 'wms_inventory_bin', 'storage_bin_id', '仓位Id', 'Long', 'bigint', 'storageBinId', 'StorageBinId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:19:05', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181230303022886917', 'wms_inventory_bin', 'storage_bin_code', '仓位编号', 'String', 'varchar', 'storageBinCode', 'StorageBinCode', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'eq', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:19:05', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181230303022886918', 'wms_inventory_bin', 'material_id', '货物', 'Long', 'bigint', 'materialId', 'MaterialId', b'0', NULL, b'0', b'0', b'0', b'1', b'1', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:19:05', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181230303022886919', 'wms_inventory_bin', 'quantity', '库存数量', 'Double', 'double', 'quantity', 'Quantity', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:19:05', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181230303022886920', 'wms_inventory_bin', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'dateselect', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:19:05', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294914', 'wms_form', 'id', '单据号', 'Long', 'bigint', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'1', b'1', 'cn', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294915', 'wms_form', 'type', '单据类型', 'Integer', 'int', 'type', 'Type', b'0', NULL, b'0', b'0', b'0', b'1', b'0', 'eq', 'select', 'form_type', NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294917', 'wms_form', 'worker', '作业人', 'Long', 'bigint', 'worker', 'Worker', b'0', NULL, b'0', b'1', b'1', b'1', b'0', '', 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294918', 'wms_form', 'optime', '业务发生时间', 'Date', 'datetime', 'optime', 'Optime', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'dateselect', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294919', 'wms_form', 'in_storage', '入库仓库', 'String', 'varchar', 'inStorage', 'InStorage', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, 'wms_storage', 'id', NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294920', 'wms_form', 'out_storage', '出库仓库', 'String', 'varchar', 'outStorage', 'OutStorage', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, 'wms_storage', 'id', NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294921', 'wms_form', 'mi_storage', '盘点仓库', 'String', 'varchar', 'miStorage', 'MiStorage', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, 'wms_storage', 'id', NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294922', 'wms_form', 'customer', '供应商/客户', 'String', 'varchar', 'customer', 'Customer', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, 'wms_customer', 'id', NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294923', 'wms_form', 'status', '状态', 'Integer', 'int', 'status', 'Status', b'0', NULL, b'0', b'1', b'1', b'1', b'0', 'eq', 'select', 'form_status', NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294924', 'wms_form', 'operator', '操作人', 'String', 'varchar', 'operator', 'Operator', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181233444032294925', 'wms_form', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'dateselect', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:14:15', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454825021441', 'wms_form_detail', 'id', '编号', 'Long', 'bigint', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992962', 'wms_form_detail', 'form_id', '所属单据', 'Long', 'bigint', 'formId', 'FormId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992963', 'wms_form_detail', 'material_id', '货物编号', 'Long', 'bigint', 'materialId', 'MaterialId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992964', 'wms_form_detail', 'material_name', '货物名称', 'String', 'varchar', 'materialName', 'MaterialName', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992965', 'wms_form_detail', 'quantity', '数量', 'Double', 'double', 'quantity', 'Quantity', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992966', 'wms_form_detail', 'in_storage_bin_id', '仓位Id', 'Long', 'bigint', 'inStorageBinId', 'InStorageBinId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992967', 'wms_form_detail', 'in_storage_bin_code', '仓位编号', 'String', 'varchar', 'inStorageBinCode', 'InStorageBinCode', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992968', 'wms_form_detail', 'out_storage_bin_id', '出库仓位I', 'Long', 'bigint', 'outStorageBinId', 'OutStorageBinId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992969', 'wms_form_detail', 'out_storage_bin_code', '出库仓位编号', 'String', 'varchar', 'outStorageBinCode', 'OutStorageBinCode', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992970', 'wms_form_detail', 'mi_storage_bin_id', '盘点仓位Id', 'Long', 'bigint', 'miStorageBinId', 'MiStorageBinId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992971', 'wms_form_detail', 'mi_storage_bin_code', '盘点仓位编号', 'String', 'varchar', 'miStorageBinCode', 'MiStorageBinCode', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992972', 'wms_form_detail', 'old_quantity', '原始数量', 'Double', 'double', 'oldQuantity', 'OldQuantity', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992973', 'wms_form_detail', 'balance', '差额（盘亏/盘赢）', 'Double', 'double', 'balance', 'Balance', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1181338454845992974', 'wms_form_detail', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'dateselect', NULL, NULL, 0, NULL, 'admin', '2019-10-07 23:11:33', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137149829122', 'wms_customer', 'id', '编码', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137158217729', 'wms_customer', 'code', '客户编号', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137166606338', 'wms_customer', 'name', '名称', 'String', 'varchar', 'name', 'Name', b'0', NULL, b'1', b'1', b'1', b'1', b'1', 'cn', 'input', NULL, NULL, 3, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137174994945', 'wms_customer', 'address', '地址', 'String', 'varchar', 'address', 'Address', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 4, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137183383554', 'wms_customer', 'contact_number', '联系电话', 'String', 'varchar', 'contactNumber', 'ContactNumber', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 5, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137200160770', 'wms_customer', 'contact_user', '联系人', 'String', 'varchar', 'contactUser', 'ContactUser', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 6, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137208549377', 'wms_customer', 'legal_person_name', '法人代表', 'String', 'varchar', 'legalPersonName', 'LegalPersonName', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 7, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137208549378', 'wms_customer', 'legal_person_mobile', '法人代表电话', 'String', 'varchar', 'legalPersonMobile', 'LegalPersonMobile', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 8, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137216937985', 'wms_customer', 'email', '邮箱', 'String', 'varchar', 'email', 'Email', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 9, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137216937986', 'wms_customer', 'remark', '备注', 'String', 'varchar', 'remark', 'Remark', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'textarea', NULL, NULL, 10, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137225326594', 'wms_customer', 'type', '类型（0供应商1客户）', 'Integer', 'int', 'type', 'Type', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, 'select', 'customer_type', NULL, 11, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541137229520898', 'wms_customer', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, '', NULL, NULL, 14, NULL, 'admin', '2019-10-11 14:19:12', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541473977606145', 'wms_employe', 'id', '编码', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 14:20:33', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541473985994754', 'wms_employe', 'code', '员工编码', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'0', 'cn', NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 14:20:33', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541473994383362', 'wms_employe', 'name', '名称', 'String', 'varchar', 'name', 'Name', b'0', NULL, b'0', b'1', b'1', b'1', b'0', 'cn', 'input', NULL, NULL, 3, NULL, 'admin', '2019-10-11 14:20:33', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541473994383363', 'wms_employe', 'store_code', '所属仓库', 'String', 'varchar', 'storeCode', 'StoreCode', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', NULL, NULL, 4, NULL, 'admin', '2019-10-11 14:20:33', NULL, NULL, '0', 1, 'wms_storage', 'code', NULL);
INSERT INTO `gen_table_column` VALUES ('1182541474011160578', 'wms_employe', 'mobile', '手机号', 'String', 'varchar', 'mobile', 'Mobile', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 5, NULL, 'admin', '2019-10-11 14:20:33', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182541474019549186', 'wms_employe', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, '', NULL, NULL, 8, NULL, 'admin', '2019-10-11 14:20:33', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882481180673', 'wms_material', 'id', '主键', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882481180674', 'wms_material', 'code', '物料编码', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'cn', NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882493763586', 'wms_material', 'bar_code', '物料条码', 'String', 'varchar', 'barCode', 'BarCode', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 3, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882497957889', 'wms_material', 'name', '物料名称', 'String', 'varchar', 'name', 'Name', b'0', NULL, b'1', b'1', b'1', b'1', b'1', 'cn', 'input', NULL, NULL, 4, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882497957890', 'wms_material', 'type', '类型', 'String', 'varchar', 'type', 'Type', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'select', 'material_type', NULL, 5, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882497957891', 'wms_material', 'unit', '单位', 'String', 'varchar', 'unit', 'Unit', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'select', 'unit', NULL, 6, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882506346497', 'wms_material', 'specification', '物料规格', 'String', 'varchar', 'specification', 'Specification', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 7, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882506346498', 'wms_material', 'attr', '物料属性', 'String', 'varchar', 'attr', 'Attr', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 8, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882506346499', 'wms_material', 'customer_code', '供应商编码', 'String', 'varchar', 'customerCode', 'CustomerCode', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 9, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882514735105', 'wms_material', 'customer_name', '供应商', 'String', 'varchar', 'customerName', 'CustomerName', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', NULL, NULL, 10, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, 'wms_customer', 'code', NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882514735106', 'wms_material', 'storage_type', '存储类型1 托盘 2 堆放', 'Integer', 'int', 'storageType', 'StorageType', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'select', 'storage_type', NULL, 11, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882523123713', 'wms_material', 'valid_day', '有效天', 'Integer', 'int', 'validDay', 'ValidDay', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 12, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882523123714', 'wms_material', 'weight', '重量', 'BigDecimal', 'decimal', 'weight', 'Weight', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 13, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882523123715', 'wms_material', 'volume', '体积', 'BigDecimal', 'decimal', 'volume', 'Volume', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 14, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882523123716', 'wms_material', 'quantity', '库存数量', 'BigDecimal', 'decimal', 'quantity', 'Quantity', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 15, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182543882531512322', 'wms_material', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, '', NULL, NULL, 18, NULL, 'admin', '2019-10-11 14:30:07', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434652913666', 'wms_storage', 'id', '仓库号', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434661302273', 'wms_storage', 'code', '仓库代码', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'cn', NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434661302274', 'wms_storage', 'name', '仓库名称', 'String', 'varchar', 'name', 'Name', b'0', NULL, b'0', b'1', b'1', b'1', b'1', 'cn', 'input', NULL, NULL, 3, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434669690882', 'wms_storage', 'type', '仓库类型', 'Integer', 'int', 'type', 'Type', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', 'store_type', NULL, 4, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434669690883', 'wms_storage', 'sys_org_code', '所属部门', 'String', 'varchar', 'sysOrgCode', 'SysOrgCode', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'orgselect', NULL, NULL, 5, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434678079489', 'wms_storage', 'contact_user', '联系人', 'String', 'varchar', 'contactUser', 'ContactUser', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 6, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434682273793', 'wms_storage', 'contact_number', '联系方式', 'String', 'varchar', 'contactNumber', 'ContactNumber', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 7, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434682273794', 'wms_storage', 'temperature', '储存温度', 'Integer', 'int', 'temperature', 'Temperature', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 8, NULL, 'admin', '2019-10-11 14:32:18', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434690662402', 'wms_storage', 'attr', '仓库属性', 'String', 'varchar', 'attr', 'Attr', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 9, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434690662403', 'wms_storage', 'area', '面积(平方米)', 'BigDecimal', 'decimal', 'area', 'Area', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 10, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434690662404', 'wms_storage', 'status', '状态', 'Integer', 'int', 'status', 'Status', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 11, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434699051010', 'wms_storage', 'logo', '仓库LOGO', 'String', 'varchar', 'logo', 'Logo', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 12, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434703245314', 'wms_storage', 'address', '地址', 'String', 'varchar', 'address', 'Address', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 13, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434703245315', 'wms_storage', 'lnglat', '经纬度', 'String', 'varchar', 'lnglat', 'Lnglat', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 14, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434711633921', 'wms_storage', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, '', NULL, NULL, 17, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182544434720022530', 'wms_storage', 'tenant_id', '租户id', 'String', 'varchar', 'tenantId', 'TenantId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 21, NULL, 'admin', '2019-10-11 14:32:19', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735872815105', 'wms_storage_bin', 'id', 'ID', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735881203714', 'wms_storage_bin', 'code', '货位编码', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'0', 'cn', NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735889592321', 'wms_storage_bin', 'store_code', '所属仓库编码', 'String', 'varchar', 'storeCode', 'StoreCode', b'0', NULL, b'1', b'1', b'1', b'1', b'0', 'eq', 'select', NULL, NULL, 3, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, 'wms_storage', 'code', NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735897980929', 'wms_storage_bin', 'bar_code', '货位条码', 'String', 'varchar', 'barCode', 'BarCode', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 4, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735906369537', 'wms_storage_bin', 'width', '长（cm）', 'BigDecimal', 'decimal', 'width', 'Width', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 5, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735910563842', 'wms_storage_bin', 'height', '宽（cm）', 'BigDecimal', 'decimal', 'height', 'Height', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 6, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735918952450', 'wms_storage_bin', 'length', '高（cm）', 'BigDecimal', 'decimal', 'length', 'Length', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 7, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735918952451', 'wms_storage_bin', 'cubage', '容积（m³）', 'BigDecimal', 'decimal', 'cubage', 'Cubage', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 8, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735927341058', 'wms_storage_bin', 'type', '货位类型', 'String', 'varchar', 'type', 'Type', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 9, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735931535362', 'wms_storage_bin', 'status', '货位状态', 'Integer', 'int', 'status', 'Status', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'select', 'status', NULL, 10, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735939923969', 'wms_storage_bin', 'goods_attribute', '货物属性', 'String', 'varchar', 'goodsAttribute', 'GoodsAttribute', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 11, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735939923970', 'wms_storage_bin', 'remark', '备注', 'String', 'varchar', 'remark', 'Remark', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'textarea', NULL, NULL, 13, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182545735948312578', 'wms_storage_bin', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'dateselect', NULL, NULL, 15, NULL, 'admin', '2019-10-11 14:37:29', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256015364098', 'wms_storage', 'id', '仓库号', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256048918529', 'wms_storage', 'code', '仓库代码', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'cn', NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256057307137', 'wms_storage', 'name', '仓库名称', 'String', 'varchar', 'name', 'Name', b'0', NULL, b'0', b'1', b'1', b'1', b'1', 'cn', 'input', NULL, NULL, 3, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256057307138', 'wms_storage', 'type', '仓库类型', 'Integer', 'int', 'type', 'Type', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', 'store_type', NULL, 4, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256074084353', 'wms_storage', 'sys_org_code', '所属部门', 'String', 'varchar', 'sysOrgCode', 'SysOrgCode', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'orgselect', NULL, NULL, 5, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256082472962', 'wms_storage', 'contact_user', '联系人', 'String', 'varchar', 'contactUser', 'ContactUser', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 6, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256082472963', 'wms_storage', 'contact_number', '联系方式', 'String', 'varchar', 'contactNumber', 'ContactNumber', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 7, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256090861570', 'wms_storage', 'temperature', '储存温度', 'Integer', 'int', 'temperature', 'Temperature', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, 'input', NULL, NULL, 8, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256099250178', 'wms_storage', 'attr', '仓库属性', 'String', 'varchar', 'attr', 'Attr', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 9, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256099250179', 'wms_storage', 'area', '面积(平方米)', 'BigDecimal', 'decimal', 'area', 'Area', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 10, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256099250180', 'wms_storage', 'status', '状态', 'Integer', 'int', 'status', 'Status', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 11, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256107638786', 'wms_storage', 'logo', '仓库LOGO', 'String', 'varchar', 'logo', 'Logo', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 12, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256116027394', 'wms_storage', 'address', '地址', 'String', 'varchar', 'address', 'Address', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 13, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256116027395', 'wms_storage', 'lnglat', '经纬度', 'String', 'varchar', 'lnglat', 'Lnglat', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 14, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256124416001', 'wms_storage', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, '', NULL, NULL, 17, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557256132804609', 'wms_storage', 'tenant_id', '租户id', 'String', 'varchar', 'tenantId', 'TenantId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 21, NULL, 'admin', '2019-10-11 15:23:15', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289385246721', 'wms_storage', 'id', '仓库号', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289385246722', 'wms_storage', 'code', '仓库代码', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'1', 'cn', NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289393635330', 'wms_storage', 'name', '仓库名称', 'String', 'varchar', 'name', 'Name', b'0', NULL, b'0', b'1', b'1', b'1', b'1', 'cn', 'input', NULL, NULL, 3, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289393635331', 'wms_storage', 'type', '仓库类型', 'Integer', 'int', 'type', 'Type', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', 'store_type', NULL, 4, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289402023937', 'wms_storage', 'sys_org_code', '所属部门', 'String', 'varchar', 'sysOrgCode', 'SysOrgCode', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'orgselect', NULL, NULL, 5, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289402023938', 'wms_storage', 'contact_user', '联系人', 'String', 'varchar', 'contactUser', 'ContactUser', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 6, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289410412545', 'wms_storage', 'contact_number', '联系方式', 'String', 'varchar', 'contactNumber', 'ContactNumber', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 7, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289410412546', 'wms_storage', 'temperature', '储存温度', 'Integer', 'int', 'temperature', 'Temperature', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 8, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289410412547', 'wms_storage', 'attr', '仓库属性', 'String', 'varchar', 'attr', 'Attr', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 9, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289410412548', 'wms_storage', 'area', '面积(平方米)', 'BigDecimal', 'decimal', 'area', 'Area', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 10, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289418801153', 'wms_storage', 'status', '状态', 'Integer', 'int', 'status', 'Status', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 11, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289418801154', 'wms_storage', 'logo', '仓库LOGO', 'String', 'varchar', 'logo', 'Logo', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 12, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289427189762', 'wms_storage', 'address', '地址', 'String', 'varchar', 'address', 'Address', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 13, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289427189763', 'wms_storage', 'lnglat', '经纬度', 'String', 'varchar', 'lnglat', 'Lnglat', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 14, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289435578369', 'wms_storage', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, '', NULL, NULL, 17, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557289443966978', 'wms_storage', 'tenant_id', '租户id', 'String', 'varchar', 'tenantId', 'TenantId', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 21, NULL, 'admin', '2019-10-11 15:23:23', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799412613121', 'wms_storage_bin', 'id', 'ID', 'String', 'varchar', 'id', 'Id', b'1', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 1, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799412613122', 'wms_storage_bin', 'code', '货位编码', 'String', 'varchar', 'code', 'Code', b'0', NULL, b'0', b'0', b'0', b'1', b'0', 'cn', NULL, NULL, NULL, 2, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799421001730', 'wms_storage_bin', 'store_code', '所属仓库编码', 'String', 'varchar', 'storeCode', 'StoreCode', b'0', NULL, b'1', b'1', b'1', b'1', b'0', 'eq', 'select', NULL, NULL, 3, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, 'wms_storage', 'code', NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799429390338', 'wms_storage_bin', 'bar_code', '货位条码', 'String', 'varchar', 'barCode', 'BarCode', b'0', NULL, b'0', b'0', b'0', b'1', b'0', NULL, NULL, NULL, NULL, 4, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799437778945', 'wms_storage_bin', 'width', '长（cm）', 'BigDecimal', 'decimal', 'width', 'Width', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 5, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799437778946', 'wms_storage_bin', 'height', '宽（cm）', 'BigDecimal', 'decimal', 'height', 'Height', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 6, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799437778947', 'wms_storage_bin', 'length', '高（cm）', 'BigDecimal', 'decimal', 'length', 'Length', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 7, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799437778948', 'wms_storage_bin', 'cubage', '容积（m³）', 'BigDecimal', 'decimal', 'cubage', 'Cubage', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'input', NULL, NULL, 8, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799446167553', 'wms_storage_bin', 'type', '货位类型', 'String', 'varchar', 'type', 'Type', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, 9, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799446167554', 'wms_storage_bin', 'status', '货位状态', 'Integer', 'int', 'status', 'Status', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'select', 'yn', NULL, 10, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799454556162', 'wms_storage_bin', 'goods_attribute', '货物属性', 'String', 'varchar', 'goodsAttribute', 'GoodsAttribute', b'0', NULL, b'0', b'1', b'1', b'1', b'0', NULL, 'input', NULL, NULL, 11, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799467139074', 'wms_storage_bin', 'remark', '备注', 'String', 'varchar', 'remark', 'Remark', b'0', NULL, b'0', b'1', b'1', b'0', b'0', NULL, 'textarea', NULL, NULL, 13, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES ('1182557799467139075', 'wms_storage_bin', 'create_time', '创建时间', 'Date', 'datetime', 'createTime', 'CreateTime', b'0', NULL, b'0', b'0', b'0', b'0', b'0', NULL, '', NULL, NULL, 15, NULL, 'admin', '2019-10-11 15:25:25', NULL, NULL, '0', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for onl_graphreport_head
-- ----------------------------
DROP TABLE IF EXISTS `onl_graphreport_head`;
CREATE TABLE `onl_graphreport_head`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图表名称',
  `code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图表编码',
  `cgr_sql` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '查询数据SQL',
  `xaxis_field` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'x轴数据字段',
  `yaxis_field` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'y轴数据字段',
  `display_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示模板',
  `yaxis_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'y轴文字描述',
  `data_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `graph_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标类型',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_show_list` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示明细',
  `extend_js` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展JS',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '软删',
  `version` int(1) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图表报告' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of onl_graphreport_head
-- ----------------------------
INSERT INTO `onl_graphreport_head` VALUES ('402881e64ca71152014ca71152480000', '用户操作统计', 'yhcztj', 'SELECT DATE_FORMAT(create_time, \'%Y-%m-%d\') AS `name`, count(*) AS `value` FROM sys_log_login  GROUP BY 	DATE_FORMAT(create_time, \'%Y-%m-%d\')', 'name', 'value', 'tab', '操作次数', 'SQL', 'bar,line,pie', '用户操作统计', 'Y', 'function getTotalRows(totalRows) {\r\n    return [\'ct\', \'login_count\'];\r\n}', NULL, NULL, '2019-09-25 10:58:02', 'admin', '0', NULL);

-- ----------------------------
-- Table structure for onl_graphreport_item
-- ----------------------------
DROP TABLE IF EXISTS `onl_graphreport_item`;
CREATE TABLE `onl_graphreport_item`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `graphreport_head_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主表ID',
  `field_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `field_txt` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段文本',
  `is_show` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表显示',
  `is_total` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否计算',
  `search_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询',
  `search_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询模式',
  `dict_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典Code',
  `field_href` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段href',
  `field_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `replace_val` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取值表达式',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '软删',
  `version` int(1) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_headid`(`graphreport_head_id`) USING BTREE,
  INDEX `index_isshow`(`is_show`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图表报告项' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of onl_graphreport_item
-- ----------------------------
INSERT INTO `onl_graphreport_item` VALUES ('402881e44cd2a0c2014cd2a0c29d0000', '402881e64ca71152014ca71152480000', 'value', '操作次数', 'Y', NULL, 'Y', 'single', '', NULL, 'Integer', 1, NULL, 'admin', '2019-04-11 19:32:32', NULL, NULL, '0', NULL);
INSERT INTO `onl_graphreport_item` VALUES ('402881e64ca71152014ca711527c0001', '402881e64ca71152014ca71152480000', 'name', '用户', 'Y', NULL, 'Y', 'single', 'select id \'key\', realname \'value\' from t_s_base_user', NULL, 'String', 0, NULL, 'admin', '2019-04-11 19:32:32', NULL, NULL, '0', NULL);
INSERT INTO `onl_graphreport_item` VALUES ('402881e64ca71152014ca71152a90002', '402881e64ca71152014ca71152480000', 'value', '登录次数', 'Y', NULL, 'N', 'group', '', NULL, 'Integer', 2, NULL, 'admin', '2019-04-11 19:32:32', NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('quickdScheduler', 'TASK_1067246875800000076', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('quickdScheduler', 'TASK_1067246875800000076', 'DEFAULT', NULL, 'com.quickd.quartz.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002C636F6D2E717569636B642E636F72652E6A6F622E656E746974792E5363686564756C654A6F62456E74697479B8F3DA2FA84E37580200054C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78720021636F6D2E717569636B642E636F72652E656E746974792E42617365456E74697479A225DC2470C254060200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0002696471007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C4C000776657273696F6E71007E000A787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016D6FEB59F078740001307400133130363732343638373538303030303030373674000561646D696E7371007E000F77080000016D6FEB793078737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000001740008746573745461736B74000E3020302F3330202A202A202A203F740006717569636B64740025E69C89E58F82E6B58BE8AF95EFBC8CE5A49AE4B8AAE58F82E695B0E4BDBFE794A86A736F6E7371007E0015000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('JeedcpScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quickdScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('JeedcpScheduler', 'LD-2018061113551568937444368', 1568937490224, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('quickdScheduler', 'LD-2018061113551570859337985', 1570861468620, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quickdScheduler', 'TASK_1067246875800000076', 'DEFAULT', 'TASK_1067246875800000076', 'DEFAULT', NULL, 1570861800000, 1570860000000, 5, 'WAITING', 'CRON', 1569541386000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002C636F6D2E717569636B642E636F72652E6A6F622E656E746974792E5363686564756C654A6F62456E74697479B8F3DA2FA84E37580200054C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78720021636F6D2E717569636B642E636F72652E656E746974792E42617365456E74697479A225DC2470C254060200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0002696471007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C4C000776657273696F6E71007E000A787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016D6FEB59F07874000130740013313036373234363837353830303030303037367070737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000001740008746573745461736B74000E3020302F3330202A202A202A203F740006717569636B64740025E69C89E58F82E6B58BE8AF95EFBC8CE5A49AE4B8AAE58F82E695B0E4BDBFE794A86A736F6E71007E00157800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '任务状态  0：暂停  1：正常',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '软删',
  `version` int(1) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1067246875800000076', 'testTask', 'quickd', '0 0/30 * * * ?', 1, '有参测试，多个参数使用json', 'admin', '2019-09-27 07:32:38', NULL, NULL, '0', 1);

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `job_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '任务状态    0：失败    1：成功',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '软删',
  `version` int(1) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id`(`job_id`) USING BTREE,
  INDEX `idx_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1177372965937500162', '1067246875800000076', 'testTask', 'quickd', 1, NULL, 12098, '2019-09-27 08:02:32', NULL, NULL, NULL, '0', NULL);
INSERT INTO `schedule_job_log` VALUES ('1177418560664412162', '1067246875800000076', 'testTask', 'quickd', 1, NULL, 3039, '2019-09-27 11:03:52', NULL, NULL, NULL, '0', NULL);
INSERT INTO `schedule_job_log` VALUES ('1177423791112511490', '1067246875800000076', 'testTask', 'quickd', 1, NULL, 0, '2019-09-27 11:24:42', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `schedule_job_log` VALUES ('1177425125412888577', '1067246875800000076', 'testTask', 'quickd', 1, NULL, 0, '2019-09-27 11:30:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `schedule_job_log` VALUES ('1178550038098010114', '1067246875800000076', 'testTask', 'quickd', 1, NULL, 0, '2019-09-30 14:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `schedule_job_log` VALUES ('1182898692418101249', '1067246875800000076', 'testTask', 'quickd', 1, NULL, 1, '2019-10-12 14:00:00', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行政区划名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '参数键',
  `config_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '参数值',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `version` int(1) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1067246875800000073', '云存储配置信息', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\"}', b'1', 'system', '2019-10-06 07:56:06', NULL, NULL, NULL, '0', 1);
INSERT INTO `sys_config` VALUES ('1067246875800000074', '短信配置信息', 'SMS_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"1\",\"aliyunAccessKeySecret\":\"1\",\"aliyunSignName\":\"1\",\"aliyunTemplateCode\":\"1\",\"qcloudAppId\":2,\"qcloudAppKey\":\"2\",\"qcloudSignName\":\"2\",\"qcloudTemplateId\":\"2\"}', b'1', 'system', '2019-10-06 07:56:06', NULL, NULL, NULL, '0', 1);
INSERT INTO `sys_config` VALUES ('1067246875800000075', '邮件配置信息', 'MAIL_CONFIG_KEY', '{\"smtp\":\"smtp.163.com\",\"port\":25,\"username\":\"renrenio_test@163.com\",\"password\":\"renren123456\"}', b'1', 'system', '2019-10-06 07:56:06', NULL, NULL, NULL, '0', 1);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父机构ID',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构/部门名称',
  `dept_name_en` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `dept_name_abbr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `dept_order` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `org_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型 1一级部门 2子部门',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `version` int(1) NULL DEFAULT 1 COMMENT '乐观锁版本号',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_dept_parent_id`(`pid`) USING BTREE,
  INDEX `index_dept_dept_order`(`dept_order`) USING BTREE,
  INDEX `index_dept_org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('4f1765520d6346f9bd9c79e2479e5b12', '57197590443c44f083d42ae24ef26a2c', '市场部', NULL, NULL, 0, NULL, '2', 'A02A01A02', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-20 17:15:34', 'admin', '2019-02-26 16:36:18', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('5159cde220114246b045e574adceafe9', '57197590443c44f083d42ae24ef26a2c', '销售部', NULL, NULL, 0, NULL, '2', 'A02A01A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-26 16:44:38', 'admin', '2019-03-07 09:36:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('57197590443c44f083d42ae24ef26a2c', '6d35e179cd814e3299bd588ea7daed3f', '华东分部', NULL, NULL, 0, NULL, '2', 'A01A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-21 16:14:41', 'admin', '2019-03-27 19:05:49', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('6d35e179cd814e3299bd588ea7daed3f', '', 'QuickD', NULL, NULL, 0, NULL, '1', 'A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-26 16:36:39', 'admin', '2019-03-22 16:47:25', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('743ba9dbdc114af8953a11022ef3096a', '6d35e179cd814e3299bd588ea7daed3f', '华南分部', NULL, NULL, 0, NULL, '2', 'A03A02', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-03-22 16:45:43', NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES ('a7d7e77e06c84325a40932163adcdaa6', '743ba9dbdc114af8953a11022ef3096a', '研发部', NULL, NULL, 0, NULL, '2', 'A02A02A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-26 16:36:47', 'admin', '2019-02-26 16:37:25', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('c6d7cb4deeac411cb3384b1b31278596', '743ba9dbdc114af8953a11022ef3096a', '财务部', NULL, NULL, 0, NULL, '2', 'A02A02A02', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-11 14:21:51', 'admin', '2019-03-22 16:47:19', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '字典类型0为string,1为number',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `indextable_dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0b5d19e1fce4b2e6647e6b4a17760c14', '通告类型', 'msg_category', '消息类型1:通知公告2:系统消息', 0, 'admin', '2019-04-22 18:01:35', 'admin', '2019-09-06 23:00:57', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('236e8a4baff0db8c62c00dd95632834f', '同步工作流引擎', 'activiti_sync', '同步工作流引擎', 0, 'admin', '2019-05-15 15:27:33', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('2e02df51611a4b9632828ab7e5338f00', '权限策略', 'perms_type', '权限策略', 0, 'admin', '2019-04-26 18:26:55', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('2f0320997ade5dd147c90130f7218c3e', '推送类别', 'msg_type', '', 0, 'admin', '2019-03-17 21:21:32', 'admin', '2019-03-26 19:57:45', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('3486f32803bb953e7155dab3513dc68b', '删除状态', 'del_flag', NULL, 0, 'admin', '2019-01-18 21:46:26', 'admin', '2019-03-30 11:17:11', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, 1, NULL, '2019-01-04 14:56:32', 'admin', '2019-03-30 11:28:27', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('4274efc2292239b6f000b153f50823ff', '全局权限策略', 'global_perms_type', '全局权限策略', 0, 'admin', '2019-05-10 17:54:05', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('4c03fca6bf1f0299c381213961566349', 'Online图表展示模板', 'online_graph_display_template', 'Online图表展示模板', 0, 'admin', '2019-04-12 17:28:50', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('4c753b5293304e7a445fd2741b46529d', '字典状态', 'dict_item_status', NULL, 1, 'admin', '2019-05-09 16:31:52', 'admin', '2019-03-30 19:33:52', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('4d7fec1a7799a436d26d02325eff295e', '优先级', 'priority', '优先级', 0, 'admin', '2019-03-16 17:03:34', 'admin', '2019-04-16 17:39:23', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('4e4602b3e3686f0911384e188dc7efb4', '条件规则', 'rule_conditions', '', 0, 'admin', '2019-04-01 10:15:03', 'admin', '2019-04-01 10:30:47', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('4f69be5f507accea8d5df5f11346181a', '发送消息类型', 'msgType', NULL, 0, 'admin', '2019-04-11 14:27:09', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('68168534ff5065a152bfab275c2136f8', '有效无效状态', 'valid_status', '有效无效状态', 0, 'admin', '2019-05-09 16:31:52', 'admin', '2019-04-26 19:21:23', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, 0, NULL, '2019-01-04 14:59:01', 'admin', '2019-03-18 23:28:18', '1', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('72cce0989df68887546746d8f09811aa', 'Online表单类型', 'cgform_table_type', '', 0, 'admin', '2019-01-27 10:13:02', 'admin', '2019-03-30 11:37:36', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('78bda155fe380b1b3f175f1e88c284c6', '流程状态', 'bpm_status', '流程状态', 0, 'admin', '2019-05-09 16:31:52', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('83bfb33147013cc81640d5fd9eda030c', '日志类型', 'log_type', NULL, 1, 'admin', '2019-03-18 23:22:19', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('845da5006c97754728bf48b6a10f79cc', '状态', 'status', NULL, 0, 'admin', '2019-03-18 21:45:25', 'admin', '2019-03-18 21:58:25', '1', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('8dfe32e2d29ea9430a988b3b558bf233', '发布状态', 'send_status', '发布状态', 0, 'admin', '2019-04-16 17:40:42', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('a7adbcd86c37f7dbc9b66945c82ef9e6', '1是0否', 'yn', '', 0, 'admin', '2019-05-22 19:29:29', NULL, NULL, '1', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('a9d9942bd0eccb6e89de92d130ec4c4a', '消息发送状态', 'msgSendStatus', NULL, 0, 'admin', '2019-04-12 18:18:17', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('ac2f7c0c5c5775fcea7e2387bcb22f01', '菜单类型', 'menu_type', NULL, 1, 'admin', '2019-05-09 16:31:52', 'admin', '2019-04-01 15:27:06', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('ad7c65ba97c20a6805d5dcdf13cdaf36', 'onlineT类型', 'ceshi_online', NULL, 0, 'admin', '2019-03-22 16:31:49', 'admin', '2019-03-22 16:34:16', '1', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('bd1b8bc28e65d6feefefb6f3c79f42fd', 'Online图表数据类型', 'online_graph_data_type', 'Online图表数据类型', 0, 'admin', '2019-04-12 17:24:24', 'admin', '2019-04-12 17:24:57', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('c36169beb12de8a71c8683ee7c28a503', '部门状态', 'depart_status', NULL, 0, 'admin', '2019-03-18 21:59:51', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('c5a14c75172783d72cbee6ee7f5df5d1', 'Online图表类型', 'online_graph_type', 'Online图表类型', 0, 'admin', '2019-04-12 17:04:06', NULL, NULL, '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('d6e1152968b02d69ff358c75b48a6ee1', '流程类型', 'bpm_process_type', NULL, 0, 'admin', '2019-05-09 16:31:52', 'admin', '2019-03-30 18:14:44', '0', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('fc6cd58fde2e8481db10d3a1e68ce70c', '用户状态', 'user_status', NULL, 1, 'admin', '2019-03-18 21:57:25', 'admin', '2019-03-18 23:11:58', '0', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项文本',
  `item_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort_order` int(10) NULL DEFAULT NULL COMMENT '排序',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_dict_id`(`dict_id`) USING BTREE,
  INDEX `index_table_sort_order`(`sort_order`) USING BTREE,
  INDEX `index_table_dict_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('0072d115e07c875d76c9b022e2179128', '4d7fec1a7799a436d26d02325eff295e', '低', 'L', '低', 3, 1, 'admin', '2019-04-16 17:04:59', NULL, NULL, '1', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('05a2e732ce7b00aa52141ecc3e330b4e', '3486f32803bb953e7155dab3513dc68b', '已删除', '1', NULL, NULL, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-03-28 22:23:20', '1', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('096c2e758d823def3855f6376bc736fb', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'SQL', 'sql', NULL, 1, 1, 'admin', '2019-04-12 17:26:26', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('0c9532916f5cd722017b46bc4d953e41', '2f0320997ade5dd147c90130f7218c3e', '指定用户', 'USER', NULL, NULL, 1, 'admin', '2019-03-17 21:22:19', 'admin', '2019-03-17 21:22:28', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('0ca4beba9efc4f9dd54af0911a946d5c', '72cce0989df68887546746d8f09811aa', '附表', '3', NULL, 3, 1, 'admin', '2019-03-27 10:13:43', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1030a2652608f5eac3b49d70458b8532', '2e02df51611a4b9632828ab7e5338f00', '禁用', '2', '禁用', 2, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-04-26 18:39:11', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1169169062705111042', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '0', '1111', 0, 0, NULL, NULL, NULL, NULL, '0', 3, NULL);
INSERT INTO `sys_dict_item` VALUES ('1169395221794574338', '0b5d19e1fce4b2e6647e6b4a17760c14', '333', '33', '33', 0, 1, 'admin', '2019-09-05 07:42:02', NULL, NULL, '1', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1169510725165539330', '0b5d19e1fce4b2e6647e6b4a17760c14', 'test', '1', '11', 2, 1, 'admin', '2019-09-05 15:21:00', NULL, NULL, '1', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1169988454575017986', '0b5d19e1fce4b2e6647e6b4a17760c14', '私信', '3', '', 3, 1, 'admin', '2019-09-06 22:59:20', NULL, NULL, '1', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1169989357793218563', '4d7fec1a7799a436d26d02325eff295e', '低', 'L', '', 0, 1, 'admin', '2019-09-06 23:02:55', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('147c48ff4b51545032a9119d13f3222a', 'd6e1152968b02d69ff358c75b48a6ee1', '测试流程', 'test', NULL, 1, 1, 'admin', '2019-03-22 19:27:05', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1543fe7e5e26fb97cdafe4981bedc0c8', '4c03fca6bf1f0299c381213961566349', '单排布局', 'single', NULL, 2, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-04-12 17:43:57', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1b8a6341163062dad8cb2fddd34e0c3b', '404a04a15f371566c658ee9ef9fc392a', '22', '222', NULL, 1, 1, 'admin', '2019-03-30 11:17:48', NULL, NULL, '0', 3, NULL);
INSERT INTO `sys_dict_item` VALUES ('1ce390c52453891f93514c1bd2795d44', 'ad7c65ba97c20a6805d5dcdf13cdaf36', '000', '00', NULL, 1, 1, 'admin', '2019-03-22 16:34:34', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('1db531bcff19649fa82a644c8a939dc4', '4c03fca6bf1f0299c381213961566349', '组合布局', 'combination', '', 4, 1, 'admin', '2019-05-11 16:07:08', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('222705e11ef0264d4214affff1fb4ff9', '4f69be5f507accea8d5df5f11346181a', '短信', '1', '', 1, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-04-28 10:58:11', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('23a5bb76004ed0e39414e928c4cde155', '4e4602b3e3686f0911384e188dc7efb4', '不等于', '!=', '不等于', 3, 1, 'admin', '2019-04-01 16:46:15', 'admin', '2019-04-01 17:48:40', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('25847e9cb661a7c711f9998452dc09e6', '4e4602b3e3686f0911384e188dc7efb4', '小于等于', '<=', '小于等于', 6, 1, 'admin', '2019-04-01 16:44:34', 'admin', '2019-04-01 17:49:10', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('2d51376643f220afdeb6d216a8ac2c01', '68168534ff5065a152bfab275c2136f8', '有效', '1', '有效', 2, 1, 'admin', '2019-04-26 19:22:01', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('308c8aadf0c37ecdde188b97ca9833f5', '8dfe32e2d29ea9430a988b3b558bf233', '已发布', '1', '已发布', 2, 1, 'admin', '2019-04-16 17:41:24', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('333e6b2196e01ef9a5f76d74e86a6e33', '8dfe32e2d29ea9430a988b3b558bf233', '未发布', '0', '未发布', 1, 1, 'admin', '2019-04-16 17:41:12', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('337ea1e401bda7233f6258c284ce4f50', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'JSON', 'json', NULL, 1, 1, 'admin', '2019-04-12 17:26:33', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('33bc9d9f753cf7dc40e70461e50fdc54', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送失败', '2', NULL, 3, 1, 'admin', '2019-04-12 18:20:02', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('3fbc03d6c994ae06d083751248037c0e', '78bda155fe380b1b3f175f1e88c284c6', '已完成', '3', '已完成', 3, 1, 'admin', '2019-05-09 16:33:25', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('41d7aaa40c9b61756ffb1f28da5ead8e', '0b5d19e1fce4b2e6647e6b4a17760c14', '通知公告', '1', NULL, 1, 1, 'admin', '2019-04-22 18:01:57', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('41fa1e9571505d643aea87aeb83d4d76', '4e4602b3e3686f0911384e188dc7efb4', '等于', '=', '等于', 4, 1, 'admin', '2019-04-01 16:45:24', 'admin', '2019-04-01 17:49:00', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('43d2295b8610adce9510ff196a49c6e9', '845da5006c97754728bf48b6a10f79cc', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 21:45:51', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('4f05fb5376f4c61502c5105f52e4dd2b', '83bfb33147013cc81640d5fd9eda030c', '操作日志', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:22:49', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('50223341bfb5ba30bf6319789d8d17fe', 'd6e1152968b02d69ff358c75b48a6ee1', '业务办理', 'business', NULL, 3, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-03-22 23:24:39', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('51222413e5906cdaf160bb5c86fb827c', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '是', '1', '', 1, 1, 'admin', '2019-05-22 19:29:45', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('538fca35afe004972c5f3947c039e766', '2e02df51611a4b9632828ab7e5338f00', '显示', '1', '显示', 1, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-04-26 18:39:07', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('5584c21993bde231bbde2b966f2633ac', '4e4602b3e3686f0911384e188dc7efb4', '自定义SQL表达式', 'USE_SQL_RULES', '自定义SQL表达式', 9, 1, 'admin', '2019-04-01 10:45:24', 'admin', '2019-04-01 17:49:27', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('58b73b344305c99b9d8db0fc056bbc0a', '72cce0989df68887546746d8f09811aa', '主表', '2', NULL, 2, 1, 'admin', '2019-03-27 10:13:36', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('5b65a88f076b32e8e69d19bbaadb52d5', '2f0320997ade5dd147c90130f7218c3e', '全体用户', 'ALL', NULL, NULL, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-03-28 22:17:09', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', NULL, 2, 1, NULL, '2019-01-04 14:56:56', NULL, '2019-01-04 17:38:12', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('66c952ae2c3701a993e7db58f3baf55e', '4e4602b3e3686f0911384e188dc7efb4', '大于', '>', '大于', 1, 1, 'admin', '2019-04-01 10:45:46', 'admin', '2019-04-01 17:48:29', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('6937c5dde8f92e9a00d4e2ded9198694', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'easyui', '3', NULL, 1, 1, 'admin', '2019-03-22 16:32:15', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('69cacf64e244100289ddd4aa9fa3b915', 'a9d9942bd0eccb6e89de92d130ec4c4a', '未发送', '0', NULL, 1, 1, 'admin', '2019-04-12 18:19:23', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('6a7a9e1403a7943aba69e54ebeff9762', '4f69be5f507accea8d5df5f11346181a', '邮件', '2', '', 2, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-04-28 10:59:03', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('6c682d78ddf1715baf79a1d52d2aa8c2', '72cce0989df68887546746d8f09811aa', '单表', '1', NULL, 1, 1, 'admin', '2019-03-27 10:13:29', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('6d404fd2d82311fbc87722cd302a28bc', '4e4602b3e3686f0911384e188dc7efb4', '模糊', 'LIKE', '模糊', 7, 1, 'admin', '2019-04-01 16:46:02', 'admin', '2019-04-01 17:49:20', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('6d4e26e78e1a09699182e08516c49fc4', '4d7fec1a7799a436d26d02325eff295e', '高', 'H', '高', 1, 1, 'admin', '2019-04-16 17:04:24', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '非管理员', '0', NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('7050c1522702bac3be40e3b7d2e1dfd8', 'c5a14c75172783d72cbee6ee7f5df5d1', '柱状图', 'bar', NULL, 1, 1, 'admin', '2019-04-12 17:05:17', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('71b924faa93805c5c1579f12e001c809', 'd6e1152968b02d69ff358c75b48a6ee1', 'OA办公', 'oa', NULL, 2, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-03-22 23:24:36', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('75b260d7db45a39fc7f21badeabdb0ed', 'c36169beb12de8a71c8683ee7c28a503', '不启用', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:29:41', 'admin', '2019-03-18 23:29:54', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('7688469db4a3eba61e6e35578dc7c2e5', 'c36169beb12de8a71c8683ee7c28a503', '启用', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:29:28', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('78ea6cadac457967a4b1c4eb7aaa418c', 'fc6cd58fde2e8481db10d3a1e68ce70c', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:30:28', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('7ccf7b80c70ee002eceb3116854b75cb', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '按钮权限', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:25:40', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('81fb2bb0e838dc68b43f96cc309f8257', 'fc6cd58fde2e8481db10d3a1e68ce70c', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:30:37', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('83250269359855501ec4e9c0b7e21596', '4274efc2292239b6f000b153f50823ff', '显示/访问(授权后显示/可访问)', '1', '', 1, 1, 'admin', '2019-05-10 17:54:51', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('84778d7e928bc843ad4756db1322301f', '4e4602b3e3686f0911384e188dc7efb4', '大于等于', '>=', '大于等于', 5, 1, 'admin', '2019-04-01 10:46:02', 'admin', '2019-04-01 17:49:05', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('848d4da35ebd93782029c57b103e5b36', 'c5a14c75172783d72cbee6ee7f5df5d1', '饼图', 'pie', NULL, 3, 1, 'admin', '2019-04-12 17:05:49', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('84dfc178dd61b95a72900fcdd624c471', '78bda155fe380b1b3f175f1e88c284c6', '处理中', '2', '处理中', 2, 1, 'admin', '2019-05-09 16:33:01', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('86f19c7e0a73a0bae451021ac05b99dd', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '子菜单', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:25:27', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('8bccb963e1cd9e8d42482c54cc609ca2', '4f69be5f507accea8d5df5f11346181a', '微信', '3', NULL, 3, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-04-11 14:29:31', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('8c618902365ca681ebbbe1e28f11a548', '4c753b5293304e7a445fd2741b46529d', '启用', '1', '', 0, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-05-17 14:51:18', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('8cdf08045056671efd10677b8456c999', '4274efc2292239b6f000b153f50823ff', '可编辑(未授权时禁用)', '2', '', 2, 1, 'admin', '2019-05-10 17:55:38', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('8ff48e657a7c5090d4f2a59b37d1b878', '4d7fec1a7799a436d26d02325eff295e', '中', 'M', '中', 2, 1, 'admin', '2019-04-16 17:04:40', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('9a96c4a4e4c5c9b4e4d0cbf6eb3243cc', '4c753b5293304e7a445fd2741b46529d', '不启用', '0', NULL, 1, 1, 'admin', '2019-03-18 23:19:53', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('a2321496db6febc956a6c70fab94cb0c', '404a04a15f371566c658ee9ef9fc392a', '3', '3', NULL, 1, 1, 'admin', '2019-03-30 11:18:18', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('a2be752dd4ec980afaec1efd1fb589af', '8dfe32e2d29ea9430a988b3b558bf233', '已撤销', '2', '已撤销', 3, 1, 'admin', '2019-04-16 17:41:39', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('aa0d8a8042a18715a17f0a888d360aa4', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '一级菜单', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:24:52', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('adcf2a1fe93bb99a84833043f475fe0b', '4e4602b3e3686f0911384e188dc7efb4', '包含', 'IN', '包含', 8, 1, 'admin', '2019-04-01 16:45:47', 'admin', '2019-04-01 17:49:24', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('b029a41a851465332ee4ee69dcf0a4c2', '0b5d19e1fce4b2e6647e6b4a17760c14', '系统消息', '2', NULL, 1, 1, 'admin', '2019-02-22 18:02:08', 'admin', '2019-04-22 18:02:13', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('b2a8b4bb2c8e66c2c4b1bb086337f393', '3486f32803bb953e7155dab3513dc68b', '正常', '0', NULL, NULL, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-03-28 22:22:20', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '系统管理员', '1', NULL, NULL, 0, 'admin', '2019-02-21 19:59:43', 'admin', '2019-03-11 21:23:27', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('b5f3bd5f66bb9a83fecd89228c0d93d1', '68168534ff5065a152bfab275c2136f8', '无效', '0', '无效', 1, 1, 'admin', '2019-04-26 19:21:49', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('b9fbe2a3602d4a27b45c100ac5328484', '78bda155fe380b1b3f175f1e88c284c6', '待提交', '1', '待提交', 1, 1, 'admin', '2019-05-09 16:32:35', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('ba27737829c6e0e582e334832703d75e', '236e8a4baff0db8c62c00dd95632834f', '同步', '1', '同步', 1, 1, 'admin', '2019-05-15 15:28:15', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('c5700a71ad08994d18ad1dacc37a71a9', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '否', '0', '', 1, 1, 'admin', '2019-05-22 19:29:55', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('cbfcc5b88fc3a90975df23ffc8cbe29c', 'c5a14c75172783d72cbee6ee7f5df5d1', '曲线图', 'line', NULL, 2, 1, 'admin', '2019-05-12 17:05:30', 'admin', '2019-04-12 17:06:06', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('d217592908ea3e00ff986ce97f24fb98', 'c5a14c75172783d72cbee6ee7f5df5d1', '数据列表', 'table', NULL, 4, 1, 'admin', '2019-04-12 17:05:56', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', NULL, 1, 1, NULL, '2019-05-10 17:54:51', 'admin', '2019-03-23 22:44:44', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('e6329e3a66a003819e2eb830b0ca2ea0', '4e4602b3e3686f0911384e188dc7efb4', '小于', '<', '小于', 2, 1, 'admin', '2019-04-01 16:44:15', 'admin', '2019-04-01 17:48:34', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('e94eb7af89f1dbfa0d823580a7a6e66a', '236e8a4baff0db8c62c00dd95632834f', '不同步', '0', '不同步', 2, 1, 'admin', '2019-05-15 15:28:28', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('f0162f4cc572c9273f3e26b2b4d8c082', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'booostrap', '1', NULL, 1, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-03-22 16:33:57', '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('f16c5706f3ae05c57a53850c64ce7c45', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送成功', '1', NULL, 2, 1, 'admin', '2019-04-12 18:19:43', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('f2a7920421f3335afdf6ad2b342f6b5d', '845da5006c97754728bf48b6a10f79cc', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 21:46:02', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('f37f90c496ec9841c4c326b065e00bb2', '83bfb33147013cc81640d5fd9eda030c', '登录日志', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:22:37', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('f753aff60ff3931c0ecb4812d8b5e643', '4c03fca6bf1f0299c381213961566349', '双排布局', 'double', NULL, 3, 1, 'admin', '2019-04-12 17:43:51', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('fcec03570f68a175e1964808dc3f1c91', '4c03fca6bf1f0299c381213961566349', 'Tab风格', 'tab', NULL, 1, 1, 'admin', '2019-04-12 17:43:31', NULL, NULL, '0', 1, NULL);
INSERT INTO `sys_dict_item` VALUES ('fe50b23ae5e68434def76f67cef35d2d', '78bda155fe380b1b3f175f1e88c284c6', '已作废', '4', '已作废', 4, 1, 'admin', '2019-05-10 17:54:51', 'admin', '2019-05-09 16:34:40', '0', 1, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `enabled` bit(1) NOT NULL COMMENT '是否启用',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `dept_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新人',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '软删',
  `version` int(1) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKmvhj0rogastlctflsxf1d6k3i`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('10', '产品经理', b'0', 4, '2', '2019-03-29 14:55:51', NULL, NULL, NULL, '0', 1);
INSERT INTO `sys_job` VALUES ('11', '全栈开发', b'1', 6, '2', '2019-03-31 13:39:30', NULL, NULL, NULL, '0', 1);
INSERT INTO `sys_job` VALUES ('12', '软件测试', b'1', 5, '2', '2019-03-31 13:39:43', NULL, NULL, NULL, '0', 1);
INSERT INTO `sys_job` VALUES ('19', '董事长', b'1', 1, '1', '2019-03-31 14:58:15', NULL, NULL, NULL, '0', 1);
INSERT INTO `sys_job` VALUES ('2', '董事长秘书', b'1', 2, '1', '2019-03-29 14:01:30', NULL, NULL, NULL, '0', 1);
INSERT INTO `sys_job` VALUES ('8', '人事专员', b'1', 3, '11', '2019-03-29 14:52:28', NULL, NULL, NULL, '0', 1);

-- ----------------------------
-- Table structure for sys_log_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_api`;
CREATE TABLE `sys_log_api`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器环境',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `remote_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作提交的数据',
  `time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_error
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_error`;
CREATE TABLE `sys_log_error`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `request_uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `request_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `user_agent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `error_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '异常日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `operation` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '用户操作   0：用户登录   1：用户退出',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '状态  0：失败    1：成功    2：账号已锁定',
  `user_agent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `tenant_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES ('1177367340297957378', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', NULL, 'admin', '2019-09-27 07:40:23', NULL);
INSERT INTO `sys_log_login` VALUES ('1177412905316532226', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', NULL, 'admin', '2019-09-27 10:41:27', NULL);
INSERT INTO `sys_log_login` VALUES ('1177482429751554050', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', NULL, 'admin', '2019-09-27 15:17:42', NULL);
INSERT INTO `sys_log_login` VALUES ('1178204510847991810', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 15:07:00', NULL);
INSERT INTO `sys_log_login` VALUES ('1178211694205960194', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 15:35:33', NULL);
INSERT INTO `sys_log_login` VALUES ('1178217451261493251', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 15:58:25', NULL);
INSERT INTO `sys_log_login` VALUES ('1178224725338013699', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 16:27:22', NULL);
INSERT INTO `sys_log_login` VALUES ('1178228842093527043', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 16:43:41', NULL);
INSERT INTO `sys_log_login` VALUES ('1178230663402958850', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 16:50:55', NULL);
INSERT INTO `sys_log_login` VALUES ('1178231365374230530', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 16:53:43', NULL);
INSERT INTO `sys_log_login` VALUES ('1178237272367726595', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-09-29 17:17:13', NULL);
INSERT INTO `sys_log_login` VALUES ('1178846837367046146', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-01 09:39:23', NULL);
INSERT INTO `sys_log_login` VALUES ('1178954810149457922', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-01 16:48:25', NULL);
INSERT INTO `sys_log_login` VALUES ('1182845344784515075', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:28:01', NULL);
INSERT INTO `sys_log_login` VALUES ('1182845370222968834', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:28:07', NULL);
INSERT INTO `sys_log_login` VALUES ('1182845467576958979', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:28:30', NULL);
INSERT INTO `sys_log_login` VALUES ('1182845671575322626', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:29:19', NULL);
INSERT INTO `sys_log_login` VALUES ('1182845948906897410', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:30:25', NULL);
INSERT INTO `sys_log_login` VALUES ('1182846170361954307', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:31:18', NULL);
INSERT INTO `sys_log_login` VALUES ('1182846608679305218', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:33:02', NULL);
INSERT INTO `sys_log_login` VALUES ('1182846793631326210', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:33:46', NULL);
INSERT INTO `sys_log_login` VALUES ('1182847086959976451', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:34:56', NULL);
INSERT INTO `sys_log_login` VALUES ('1182847297786679298', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:35:47', NULL);
INSERT INTO `sys_log_login` VALUES ('1182847400060588035', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:36:11', NULL);
INSERT INTO `sys_log_login` VALUES ('1182847658391965699', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:37:13', NULL);
INSERT INTO `sys_log_login` VALUES ('1182847680273649667', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 10:37:18', NULL);
INSERT INTO `sys_log_login` VALUES ('1182907751431094274', 0, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '127.0.0.1', '内网IP', 'admin', '2019-10-12 14:36:00', NULL);

-- ----------------------------
-- Table structure for sys_log_operation
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operation`;
CREATE TABLE `sys_log_operation`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `request_uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `request_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `request_time` int(10) UNSIGNED NOT NULL COMMENT '请求时长(毫秒)',
  `user_agent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '状态  0：失败   1：成功',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log_operation
-- ----------------------------
INSERT INTO `sys_log_operation` VALUES ('1178228622802731009', 'admin', '修改密码', '/quickd/sys/user/password', 'POST', '{\"newPassword\":\"VFZSSmVrNUVWVEpPZW1jOQ==\",\"password\":\"VFZSSmVrNUVWVEk9\"}', 90, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 1, 'admin', '2019-09-29 16:42:49', NULL);
INSERT INTO `sys_log_operation` VALUES ('1178229310005886978', 'admin', '修改密码', '/quickd/sys/user/password', 'POST', '{\"newPassword\":\"VFZSSmVrNUVWVEpPZW1jOQ==\",\"password\":\"VFZSSmVrNUVWVEk9\"}', 92778, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 1, 'admin', '2019-09-29 16:45:33', NULL);
INSERT INTO `sys_log_operation` VALUES ('1178229347809148930', 'admin', '修改密码', '/quickd/sys/user/password', 'POST', '{\"newPassword\":\"VFZSSmVrNUVWVEpPZW1jOQ==\",\"password\":\"VFZSSmVrNUVWVEk9\"}', 9000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 1, 'admin', '2019-09-29 16:45:42', NULL);
INSERT INTO `sys_log_operation` VALUES ('1178229347809148932', 'admin', '修改密码', '/quickd/sys/user/password', 'POST', '{\"newPassword\":\"VFZSSmVrNUVWVEpPZW1jOQ==\",\"password\":\"VFZSSmVrNUVWVEk9\"}', 2251, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 1, 'admin', '2019-09-29 16:45:42', NULL);
INSERT INTO `sys_log_operation` VALUES ('1178230532398067714', 'admin', '修改密码', '/quickd/sys/user/password', 'POST', '{\"newPassword\":\"VFZSSmVrNUVWVEpPZW1jOQ==\",\"password\":\"VFZSSmVrNUVWVEk9\"}', 3837, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 1, 'admin', '2019-09-29 16:50:24', NULL);
INSERT INTO `sys_log_operation` VALUES ('1178231300698062851', 'admin', '修改密码', '/quickd/sys/user/password', 'POST', '{\"newPassword\":\"VFZSSmVrNUVWVEpPZW1jOQ==\",\"password\":\"VFZSSmVrNUVWVEk9\"}', 2867, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '127.0.0.1', '内网IP', 1, 'admin', '2019-09-29 16:53:27', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级菜单跳转地址',
  `type` int(11) NULL DEFAULT NULL COMMENT '菜单类型(0:一级菜单,1:子菜单:2:按钮权限)',
  `permissions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码',
  `perms_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '权限策略1显示2禁用',
  `sort` int(10) NULL DEFAULT NULL COMMENT '菜单排序',
  `always_show` tinyint(1) NULL DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `is_route` tinyint(1) NULL DEFAULT 1 COMMENT '是否路由菜单: 0:不是  1:是（默认值1）',
  `is_leaf` tinyint(1) NULL DEFAULT NULL COMMENT '是否叶子节点:    1:是   0:不是',
  `is_uniapp` tinyint(1) NULL DEFAULT 0 COMMENT '是否uniapp菜单:    1:是   0:不是',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存该页面:    1:是   0:不是',
  `hidden` int(2) NULL DEFAULT 0 COMMENT '是否隐藏路由: 0否,1是',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态 0正常 1已删除',
  `rule_flag` int(3) NULL DEFAULT 0 COMMENT '是否添加数据权限1是0否',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮权限状态(0无效1有效)',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_prem_pid`(`pid`) USING BTREE,
  INDEX `index_prem_is_route`(`is_route`) USING BTREE,
  INDEX `index_prem_is_leaf`(`is_leaf`) USING BTREE,
  INDEX `index_prem_sort_no`(`sort`) USING BTREE,
  INDEX `index_prem_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', 'sys', 'Layout', NULL, 0, NULL, '0', 100, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('10', '2', '查看', NULL, NULL, NULL, 2, 'sys:user:page', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('1001', '18', '任务执行日志', 'schedulelog', 'modules/sys/schedule/schedulelog', NULL, 1, NULL, '0', 1, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('1090', '1', '系统配置', 'setting', 'modules/sys/config/index', NULL, 1, NULL, '0', 300, NULL, 'user', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('11', '1', '字典管理', 'dict', 'modules/sys/dict', NULL, 1, NULL, '0', 15, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('1111', '0', '系统监控', NULL, 'Layout', NULL, 0, NULL, '0', 100, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('111111', '1111', 'SQL监控', 'sql', 'modules/monitor/sql/index', '', 1, NULL, '0', 1, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('111112', '1111', '在线文档', 'swagger', 'modules/monitor/swagger/index', '', 1, NULL, '0', 1, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('12', '2', '修改', NULL, NULL, NULL, 2, 'sys:user:update', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('13', '2', '删除', NULL, NULL, NULL, 2, 'sys:user:delete', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('131', '0', '大屏管理', 'datav', 'Layout', NULL, 0, NULL, '0', 290, NULL, 'excel', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('132', '131', '全部大屏', 'project', 'modules/datav/Manage', NULL, 1, NULL, '0', 15, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('133', '131', '模板管理', 'template', 'modules/datav/Template', NULL, 1, NULL, '0', 10, NULL, 'table', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('134', '131', '数据管理', 'material', 'modules/datav/Material', NULL, 1, NULL, '0', 4, NULL, 'documentation', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('14', '2', '添加', NULL, NULL, NULL, 2, 'sys:user:save', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('15', '1', '系统通告', 'notice', 'modules/sys/notice/notice', NULL, 1, NULL, '0', 16, NULL, 'notice', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('18', '0', '日志管理', 'log', 'Layout', NULL, 0, NULL, '0', 150, NULL, 'documentation', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2', '1', '用户管理', 'user', 'modules/sys/user/user', NULL, 1, NULL, '0', 1, NULL, 'user', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('201', '1111', '定时任务', 'schedule', 'modules/sys/schedule/schedule', NULL, 1, NULL, '0', 1, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2011', '201', '查看', NULL, NULL, NULL, 2, 'sys:job:info', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2012', '201', '修改', NULL, NULL, NULL, 2, 'sys:job:update', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2013', '201', '删除', NULL, NULL, NULL, 2, 'sys:job:delete', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2014', '201', '添加', NULL, NULL, NULL, 2, 'sys:job:save', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2015', '201', '暂停', NULL, NULL, NULL, 2, 'sys:job:pause', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2016', '201', '恢复', NULL, NULL, NULL, 2, 'sys:job:resume', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('2017', '201', '运行', NULL, NULL, NULL, 2, 'sys:job:run', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('210', '3', '查看', NULL, NULL, NULL, 2, 'sys:role:info', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('212', '3', '修改', NULL, NULL, NULL, 2, 'sys:role:update', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('213', '3', '删除', NULL, NULL, NULL, 2, 'sys:role:delete', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('214', '3', '添加', NULL, NULL, NULL, 2, 'sys:role:save', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('22', '1', '职位管理', 'job', 'modules/sys/job/job', NULL, 1, NULL, '0', 6, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('28', '0', '报表设计', 'report', 'Layout', NULL, 0, NULL, '0', 190, NULL, 'chart', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('29', '28', 'Online图表配置', 'single-chart', 'modules/report/single-chart', NULL, 1, NULL, '0', 15, NULL, 'chart', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'role', 'modules/sys/role/role', NULL, 1, NULL, '0', 2, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('31', '0', '代码生成', 'gen', 'Layout', NULL, 0, NULL, '0', 190, NULL, 'example', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('310', '4', '查看', NULL, NULL, NULL, 2, 'sys:menu:info', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('312', '4', '修改', NULL, NULL, NULL, 2, 'sys:menu:update', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('313', '4', '删除', NULL, NULL, NULL, 2, 'sys:menu:delete', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('314', '4', '添加', NULL, NULL, NULL, 2, 'sys:menu:save', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('34', '31', '模块生成', 'gen-table', 'modules/gen/table', NULL, 1, NULL, '0', 17, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'menu', 'modules/sys/menu/menu', NULL, 1, NULL, '0', 3, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('410', '9', '查看', NULL, NULL, NULL, 2, 'sys:dept:info', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('412', '9', '修改', NULL, NULL, NULL, 2, 'sys:dept:update', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('413', '9', '删除', NULL, NULL, NULL, 2, 'sys:dept:delete', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('414', '9', '添加', NULL, NULL, NULL, 2, 'sys:dept:save', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('5', '18', '登录日志', 'log-login', 'modules/sys/log/log-login', NULL, 1, NULL, '0', 10, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('510', '11', '查看', NULL, NULL, NULL, 2, 'sys:dict:info', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('512', '11', '修改', NULL, NULL, NULL, 2, 'sys:dict:update', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('513', '11', '删除', NULL, NULL, NULL, 2, 'sys:dict:delete', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('514', '11', '添加', NULL, NULL, NULL, 2, 'sys:dict:save', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('6', '18', '错误日志', 'log-error', 'modules/sys/log/log-error', NULL, 1, NULL, '0', 10, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('610', '15', '查看', NULL, NULL, NULL, 2, 'sys:notice:info', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('612', '15', '修改', NULL, NULL, NULL, 2, 'sys:notice:update', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('613', '15', '删除', NULL, NULL, NULL, 2, 'sys:notice:delete', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('614', '15', '添加', NULL, NULL, NULL, 2, 'sys:notice:save', '0', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('7', '18', '操作日志', 'log-operation', 'modules/sys/log/log-operation', NULL, 1, NULL, '0', 15, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES ('9', '1', '部门管理', 'dept', 'modules/sys/dept/dept', NULL, 1, NULL, '0', 6, NULL, 'list', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', 0, NULL, 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '消息类型1:通知公告2:系统消息',
  `msg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  `version` int(1) NULL DEFAULT NULL COMMENT '乐观锁',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1169881651432087555', '通报批评测试', '', '2019-09-06 00:00:00', '2019-09-25 00:00:00', NULL, 'H', '2', 'ALL', '1', '2019-09-06 19:10:23', NULL, '0', 'admin', '2019-09-06 15:54:56', NULL, NULL, '[]', 1, NULL);

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(1) NULL DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '软删'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通告阅读标记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice_read
-- ----------------------------
INSERT INTO `sys_notice_read` VALUES ('1', '1169881651432087555', '10000', '0', '2019-09-27 15:22:22', 'admin', '2019-09-27 15:22:02', 'admin', '2019-09-27 15:22:06', 1, '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '软删',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `version` int(1) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region`  (
  `ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名',
  `PID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父ID',
  `NAME_EN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文名',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_region
-- ----------------------------
INSERT INTO `sys_region` VALUES ('1', '中国', '0', 'Zhong Guo');
INSERT INTO `sys_region` VALUES ('10', '上海市', '1', 'Shanghai Shi');
INSERT INTO `sys_region` VALUES ('100', '伊春市', '9', 'Yichun Shi');
INSERT INTO `sys_region` VALUES ('1000', '前郭尔罗斯蒙古族自治县', '91', 'Qian Gorlos Mongolzu Zizhixian');
INSERT INTO `sys_region` VALUES ('1001', '长岭县', '91', 'Changling Xian');
INSERT INTO `sys_region` VALUES ('1002', '乾安县', '91', 'Qian,an Xian');
INSERT INTO `sys_region` VALUES ('1003', '扶余县', '91', 'Fuyu Xian');
INSERT INTO `sys_region` VALUES ('1004', '市辖区', '92', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1005', '洮北区', '92', 'Taobei Qu');
INSERT INTO `sys_region` VALUES ('1006', '镇赉县', '92', 'Zhenlai Xian');
INSERT INTO `sys_region` VALUES ('1007', '通榆县', '92', 'Tongyu Xian');
INSERT INTO `sys_region` VALUES ('1008', '洮南市', '92', 'Taonan Shi');
INSERT INTO `sys_region` VALUES ('1009', '大安市', '92', 'Da,an Shi');
INSERT INTO `sys_region` VALUES ('101', '佳木斯市', '9', 'Jiamusi Shi');
INSERT INTO `sys_region` VALUES ('1010', '延吉市', '93', 'Yanji Shi');
INSERT INTO `sys_region` VALUES ('1011', '图们市', '93', 'Tumen Shi');
INSERT INTO `sys_region` VALUES ('1012', '敦化市', '93', 'Dunhua Shi');
INSERT INTO `sys_region` VALUES ('1013', '珲春市', '93', 'Hunchun Shi');
INSERT INTO `sys_region` VALUES ('1014', '龙井市', '93', 'Longjing Shi');
INSERT INTO `sys_region` VALUES ('1015', '和龙市', '93', 'Helong Shi');
INSERT INTO `sys_region` VALUES ('1016', '汪清县', '93', 'Wangqing Xian');
INSERT INTO `sys_region` VALUES ('1017', '安图县', '93', 'Antu Xian');
INSERT INTO `sys_region` VALUES ('1018', '市辖区', '94', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1019', '道里区', '94', 'Daoli Qu');
INSERT INTO `sys_region` VALUES ('102', '七台河市', '9', 'Qitaihe Shi');
INSERT INTO `sys_region` VALUES ('1020', '南岗区', '94', 'Nangang Qu');
INSERT INTO `sys_region` VALUES ('1021', '道外区', '94', 'Daowai Qu');
INSERT INTO `sys_region` VALUES ('1022', '香坊区', '94', 'Xiangfang Qu');
INSERT INTO `sys_region` VALUES ('1024', '平房区', '94', 'Pingfang Qu');
INSERT INTO `sys_region` VALUES ('1025', '松北区', '94', 'Songbei Qu');
INSERT INTO `sys_region` VALUES ('1026', '呼兰区', '94', 'Hulan Qu');
INSERT INTO `sys_region` VALUES ('1027', '依兰县', '94', 'Yilan Xian');
INSERT INTO `sys_region` VALUES ('1028', '方正县', '94', 'Fangzheng Xian');
INSERT INTO `sys_region` VALUES ('1029', '宾县', '94', 'Bin Xian');
INSERT INTO `sys_region` VALUES ('103', '牡丹江市', '9', 'Mudanjiang Shi');
INSERT INTO `sys_region` VALUES ('1030', '巴彦县', '94', 'Bayan Xian');
INSERT INTO `sys_region` VALUES ('1031', '木兰县', '94', 'Mulan Xian ');
INSERT INTO `sys_region` VALUES ('1032', '通河县', '94', 'Tonghe Xian');
INSERT INTO `sys_region` VALUES ('1033', '延寿县', '94', 'Yanshou Xian');
INSERT INTO `sys_region` VALUES ('1034', '阿城区', '94', 'Acheng Shi');
INSERT INTO `sys_region` VALUES ('1035', '双城市', '94', 'Shuangcheng Shi');
INSERT INTO `sys_region` VALUES ('1036', '尚志市', '94', 'Shangzhi Shi');
INSERT INTO `sys_region` VALUES ('1037', '五常市', '94', 'Wuchang Shi');
INSERT INTO `sys_region` VALUES ('1038', '市辖区', '95', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1039', '龙沙区', '95', 'Longsha Qu');
INSERT INTO `sys_region` VALUES ('104', '黑河市', '9', 'Heihe Shi');
INSERT INTO `sys_region` VALUES ('1040', '建华区', '95', 'Jianhua Qu');
INSERT INTO `sys_region` VALUES ('1041', '铁锋区', '95', 'Tiefeng Qu');
INSERT INTO `sys_region` VALUES ('1042', '昂昂溪区', '95', 'Ang,angxi Qu');
INSERT INTO `sys_region` VALUES ('1043', '富拉尔基区', '95', 'Hulan Ergi Qu');
INSERT INTO `sys_region` VALUES ('1044', '碾子山区', '95', 'Nianzishan Qu');
INSERT INTO `sys_region` VALUES ('1045', '梅里斯达斡尔族区', '95', 'Meilisidawoerzu Qu');
INSERT INTO `sys_region` VALUES ('1046', '龙江县', '95', 'Longjiang Xian');
INSERT INTO `sys_region` VALUES ('1047', '依安县', '95', 'Yi,an Xian');
INSERT INTO `sys_region` VALUES ('1048', '泰来县', '95', 'Tailai Xian');
INSERT INTO `sys_region` VALUES ('1049', '甘南县', '95', 'Gannan Xian');
INSERT INTO `sys_region` VALUES ('105', '绥化市', '9', 'Suihua Shi');
INSERT INTO `sys_region` VALUES ('1050', '富裕县', '95', 'Fuyu Xian');
INSERT INTO `sys_region` VALUES ('1051', '克山县', '95', 'Keshan Xian');
INSERT INTO `sys_region` VALUES ('1052', '克东县', '95', 'Kedong Xian');
INSERT INTO `sys_region` VALUES ('1053', '拜泉县', '95', 'Baiquan Xian');
INSERT INTO `sys_region` VALUES ('1054', '讷河市', '95', 'Nehe Shi');
INSERT INTO `sys_region` VALUES ('1055', '市辖区', '96', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1056', '鸡冠区', '96', 'Jiguan Qu');
INSERT INTO `sys_region` VALUES ('1057', '恒山区', '96', 'Hengshan Qu');
INSERT INTO `sys_region` VALUES ('1058', '滴道区', '96', 'Didao Qu');
INSERT INTO `sys_region` VALUES ('1059', '梨树区', '96', 'Lishu Qu');
INSERT INTO `sys_region` VALUES ('106', '大兴安岭地区', '9', 'Da Hinggan Ling Diqu');
INSERT INTO `sys_region` VALUES ('1060', '城子河区', '96', 'Chengzihe Qu');
INSERT INTO `sys_region` VALUES ('1061', '麻山区', '96', 'Mashan Qu');
INSERT INTO `sys_region` VALUES ('1062', '鸡东县', '96', 'Jidong Xian');
INSERT INTO `sys_region` VALUES ('1063', '虎林市', '96', 'Hulin Shi');
INSERT INTO `sys_region` VALUES ('1064', '密山市', '96', 'Mishan Shi');
INSERT INTO `sys_region` VALUES ('1065', '市辖区', '97', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1066', '向阳区', '97', 'Xiangyang  Qu ');
INSERT INTO `sys_region` VALUES ('1067', '工农区', '97', 'Gongnong Qu');
INSERT INTO `sys_region` VALUES ('1068', '南山区', '97', 'Nanshan Qu');
INSERT INTO `sys_region` VALUES ('1069', '兴安区', '97', 'Xing,an Qu');
INSERT INTO `sys_region` VALUES ('107', '市辖区', '10', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1070', '东山区', '97', 'Dongshan Qu');
INSERT INTO `sys_region` VALUES ('1071', '兴山区', '97', 'Xingshan Qu');
INSERT INTO `sys_region` VALUES ('1072', '萝北县', '97', 'Luobei Xian');
INSERT INTO `sys_region` VALUES ('1073', '绥滨县', '97', 'Suibin Xian');
INSERT INTO `sys_region` VALUES ('1074', '市辖区', '98', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1075', '尖山区', '98', 'Jianshan Qu');
INSERT INTO `sys_region` VALUES ('1076', '岭东区', '98', 'Lingdong Qu');
INSERT INTO `sys_region` VALUES ('1077', '四方台区', '98', 'Sifangtai Qu');
INSERT INTO `sys_region` VALUES ('1078', '宝山区', '98', 'Baoshan Qu');
INSERT INTO `sys_region` VALUES ('1079', '集贤县', '98', 'Jixian Xian');
INSERT INTO `sys_region` VALUES ('108', '县', '10', 'Xian');
INSERT INTO `sys_region` VALUES ('1080', '友谊县', '98', 'Youyi Xian');
INSERT INTO `sys_region` VALUES ('1081', '宝清县', '98', 'Baoqing Xian');
INSERT INTO `sys_region` VALUES ('1082', '饶河县', '98', 'Raohe Xian ');
INSERT INTO `sys_region` VALUES ('1083', '市辖区', '99', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1084', '萨尔图区', '99', 'Sairt Qu');
INSERT INTO `sys_region` VALUES ('1085', '龙凤区', '99', 'Longfeng Qu');
INSERT INTO `sys_region` VALUES ('1086', '让胡路区', '99', 'Ranghulu Qu');
INSERT INTO `sys_region` VALUES ('1087', '红岗区', '99', 'Honggang Qu');
INSERT INTO `sys_region` VALUES ('1088', '大同区', '99', 'Datong Qu');
INSERT INTO `sys_region` VALUES ('1089', '肇州县', '99', 'Zhaozhou Xian');
INSERT INTO `sys_region` VALUES ('109', '南京市', '11', 'Nanjing Shi');
INSERT INTO `sys_region` VALUES ('1090', '肇源县', '99', 'Zhaoyuan Xian');
INSERT INTO `sys_region` VALUES ('1091', '林甸县', '99', 'Lindian Xian ');
INSERT INTO `sys_region` VALUES ('1092', '杜尔伯特蒙古族自治县', '99', 'Dorbod Mongolzu Zizhixian');
INSERT INTO `sys_region` VALUES ('1093', '市辖区', '100', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1094', '伊春区', '100', 'Yichun Qu');
INSERT INTO `sys_region` VALUES ('1095', '南岔区', '100', 'Nancha Qu');
INSERT INTO `sys_region` VALUES ('1096', '友好区', '100', 'Youhao Qu');
INSERT INTO `sys_region` VALUES ('1097', '西林区', '100', 'Xilin Qu');
INSERT INTO `sys_region` VALUES ('1098', '翠峦区', '100', 'Cuiluan Qu');
INSERT INTO `sys_region` VALUES ('1099', '新青区', '100', 'Xinqing Qu');
INSERT INTO `sys_region` VALUES ('11', '江苏省', '1', 'Jiangsu Sheng');
INSERT INTO `sys_region` VALUES ('110', '无锡市', '11', 'Wuxi Shi');
INSERT INTO `sys_region` VALUES ('1100', '美溪区', '100', 'Meixi Qu');
INSERT INTO `sys_region` VALUES ('1101', '金山屯区', '100', 'Jinshantun Qu');
INSERT INTO `sys_region` VALUES ('1102', '五营区', '100', 'Wuying Qu');
INSERT INTO `sys_region` VALUES ('1103', '乌马河区', '100', 'Wumahe Qu');
INSERT INTO `sys_region` VALUES ('1104', '汤旺河区', '100', 'Tangwanghe Qu');
INSERT INTO `sys_region` VALUES ('1105', '带岭区', '100', 'Dailing Qu');
INSERT INTO `sys_region` VALUES ('1106', '乌伊岭区', '100', 'Wuyiling Qu');
INSERT INTO `sys_region` VALUES ('1107', '红星区', '100', 'Hongxing Qu');
INSERT INTO `sys_region` VALUES ('1108', '上甘岭区', '100', 'Shangganling Qu');
INSERT INTO `sys_region` VALUES ('1109', '嘉荫县', '100', 'Jiayin Xian');
INSERT INTO `sys_region` VALUES ('111', '徐州市', '11', 'Xuzhou Shi');
INSERT INTO `sys_region` VALUES ('1110', '铁力市', '100', 'Tieli Shi');
INSERT INTO `sys_region` VALUES ('1111', '市辖区', '101', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1113', '向阳区', '101', 'Xiangyang  Qu ');
INSERT INTO `sys_region` VALUES ('1114', '前进区', '101', 'Qianjin Qu');
INSERT INTO `sys_region` VALUES ('1115', '东风区', '101', 'Dongfeng Qu');
INSERT INTO `sys_region` VALUES ('1116', '郊区', '101', 'Jiaoqu');
INSERT INTO `sys_region` VALUES ('1117', '桦南县', '101', 'Huanan Xian');
INSERT INTO `sys_region` VALUES ('1118', '桦川县', '101', 'Huachuan Xian');
INSERT INTO `sys_region` VALUES ('1119', '汤原县', '101', 'Tangyuan Xian');
INSERT INTO `sys_region` VALUES ('112', '常州市', '11', 'Changzhou Shi');
INSERT INTO `sys_region` VALUES ('1120', '抚远县', '101', 'Fuyuan Xian');
INSERT INTO `sys_region` VALUES ('1121', '同江市', '101', 'Tongjiang Shi');
INSERT INTO `sys_region` VALUES ('1122', '富锦市', '101', 'Fujin Shi');
INSERT INTO `sys_region` VALUES ('1123', '市辖区', '102', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1124', '新兴区', '102', 'Xinxing Qu');
INSERT INTO `sys_region` VALUES ('1125', '桃山区', '102', 'Taoshan Qu');
INSERT INTO `sys_region` VALUES ('1126', '茄子河区', '102', 'Qiezihe Qu');
INSERT INTO `sys_region` VALUES ('1127', '勃利县', '102', 'Boli Xian');
INSERT INTO `sys_region` VALUES ('1128', '市辖区', '103', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1129', '东安区', '103', 'Dong,an Qu');
INSERT INTO `sys_region` VALUES ('113', '苏州市', '11', 'Suzhou Shi');
INSERT INTO `sys_region` VALUES ('1130', '阳明区', '103', 'Yangming Qu');
INSERT INTO `sys_region` VALUES ('1131', '爱民区', '103', 'Aimin Qu');
INSERT INTO `sys_region` VALUES ('1132', '西安区', '103', 'Xi,an Qu');
INSERT INTO `sys_region` VALUES ('1133', '东宁县', '103', 'Dongning Xian');
INSERT INTO `sys_region` VALUES ('1134', '林口县', '103', 'Linkou Xian');
INSERT INTO `sys_region` VALUES ('1135', '绥芬河市', '103', 'Suifenhe Shi');
INSERT INTO `sys_region` VALUES ('1136', '海林市', '103', 'Hailin Shi');
INSERT INTO `sys_region` VALUES ('1137', '宁安市', '103', 'Ning,an Shi');
INSERT INTO `sys_region` VALUES ('1138', '穆棱市', '103', 'Muling Shi');
INSERT INTO `sys_region` VALUES ('1139', '市辖区', '104', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('114', '南通市', '11', 'Nantong Shi');
INSERT INTO `sys_region` VALUES ('1140', '爱辉区', '104', 'Aihui Qu');
INSERT INTO `sys_region` VALUES ('1141', '嫩江县', '104', 'Nenjiang Xian');
INSERT INTO `sys_region` VALUES ('1142', '逊克县', '104', 'Xunke Xian');
INSERT INTO `sys_region` VALUES ('1143', '孙吴县', '104', 'Sunwu Xian');
INSERT INTO `sys_region` VALUES ('1144', '北安市', '104', 'Bei,an Shi');
INSERT INTO `sys_region` VALUES ('1145', '五大连池市', '104', 'Wudalianchi Shi');
INSERT INTO `sys_region` VALUES ('1146', '市辖区', '105', '1');
INSERT INTO `sys_region` VALUES ('1147', '北林区', '105', 'Beilin Qu');
INSERT INTO `sys_region` VALUES ('1148', '望奎县', '105', 'Wangkui Xian');
INSERT INTO `sys_region` VALUES ('1149', '兰西县', '105', 'Lanxi Xian');
INSERT INTO `sys_region` VALUES ('115', '连云港市', '11', 'Lianyungang Shi');
INSERT INTO `sys_region` VALUES ('1150', '青冈县', '105', 'Qinggang Xian');
INSERT INTO `sys_region` VALUES ('1151', '庆安县', '105', 'Qing,an Xian');
INSERT INTO `sys_region` VALUES ('1152', '明水县', '105', 'Mingshui Xian');
INSERT INTO `sys_region` VALUES ('1153', '绥棱县', '105', 'Suileng Xian');
INSERT INTO `sys_region` VALUES ('1154', '安达市', '105', 'Anda Shi');
INSERT INTO `sys_region` VALUES ('1155', '肇东市', '105', 'Zhaodong Shi');
INSERT INTO `sys_region` VALUES ('1156', '海伦市', '105', 'Hailun Shi');
INSERT INTO `sys_region` VALUES ('1157', '呼玛县', '106', 'Huma Xian');
INSERT INTO `sys_region` VALUES ('1158', '塔河县', '106', 'Tahe Xian');
INSERT INTO `sys_region` VALUES ('1159', '漠河县', '106', 'Mohe Xian');
INSERT INTO `sys_region` VALUES ('116', '淮安市', '11', 'Huai,an Xian');
INSERT INTO `sys_region` VALUES ('1160', '黄浦区', '107', 'Huangpu Qu');
INSERT INTO `sys_region` VALUES ('1161', '卢湾区', '107', 'Luwan Qu');
INSERT INTO `sys_region` VALUES ('1162', '徐汇区', '107', 'Xuhui Qu');
INSERT INTO `sys_region` VALUES ('1163', '长宁区', '107', 'Changning Qu');
INSERT INTO `sys_region` VALUES ('1164', '静安区', '107', 'Jing,an Qu');
INSERT INTO `sys_region` VALUES ('1165', '普陀区', '107', 'Putuo Qu');
INSERT INTO `sys_region` VALUES ('1166', '闸北区', '107', 'Zhabei Qu');
INSERT INTO `sys_region` VALUES ('1167', '虹口区', '107', 'Hongkou Qu');
INSERT INTO `sys_region` VALUES ('1168', '杨浦区', '107', 'Yangpu Qu');
INSERT INTO `sys_region` VALUES ('1169', '闵行区', '107', 'Minhang Qu');
INSERT INTO `sys_region` VALUES ('117', '盐城市', '11', 'Yancheng Shi');
INSERT INTO `sys_region` VALUES ('1170', '宝山区', '107', 'Baoshan Qu');
INSERT INTO `sys_region` VALUES ('1171', '嘉定区', '107', 'Jiading Qu');
INSERT INTO `sys_region` VALUES ('1172', '浦东新区', '107', 'Pudong Xinqu');
INSERT INTO `sys_region` VALUES ('1173', '金山区', '107', 'Jinshan Qu');
INSERT INTO `sys_region` VALUES ('1174', '松江区', '107', 'Songjiang Qu');
INSERT INTO `sys_region` VALUES ('1175', '青浦区', '107', 'Qingpu  Qu');
INSERT INTO `sys_region` VALUES ('1177', '奉贤区', '107', 'Fengxian Qu');
INSERT INTO `sys_region` VALUES ('1178', '崇明县', '108', 'Chongming Xian');
INSERT INTO `sys_region` VALUES ('1179', '市辖区', '109', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('118', '扬州市', '11', 'Yangzhou Shi');
INSERT INTO `sys_region` VALUES ('1180', '玄武区', '109', 'Xuanwu Qu');
INSERT INTO `sys_region` VALUES ('1181', '白下区', '109', 'Baixia Qu');
INSERT INTO `sys_region` VALUES ('1182', '秦淮区', '109', 'Qinhuai Qu');
INSERT INTO `sys_region` VALUES ('1183', '建邺区', '109', 'Jianye Qu');
INSERT INTO `sys_region` VALUES ('1184', '鼓楼区', '109', 'Gulou Qu');
INSERT INTO `sys_region` VALUES ('1185', '下关区', '109', 'Xiaguan Qu');
INSERT INTO `sys_region` VALUES ('1186', '浦口区', '109', 'Pukou Qu');
INSERT INTO `sys_region` VALUES ('1187', '栖霞区', '109', 'Qixia Qu');
INSERT INTO `sys_region` VALUES ('1188', '雨花台区', '109', 'Yuhuatai Qu');
INSERT INTO `sys_region` VALUES ('1189', '江宁区', '109', 'Jiangning Qu');
INSERT INTO `sys_region` VALUES ('119', '镇江市', '11', 'Zhenjiang Shi');
INSERT INTO `sys_region` VALUES ('1190', '六合区', '109', 'Liuhe Qu');
INSERT INTO `sys_region` VALUES ('1191', '溧水县', '109', 'Lishui Xian');
INSERT INTO `sys_region` VALUES ('1192', '高淳县', '109', 'Gaochun Xian');
INSERT INTO `sys_region` VALUES ('1193', '市辖区', '110', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1194', '崇安区', '110', 'Chong,an Qu');
INSERT INTO `sys_region` VALUES ('1195', '南长区', '110', 'Nanchang Qu');
INSERT INTO `sys_region` VALUES ('1196', '北塘区', '110', 'Beitang Qu');
INSERT INTO `sys_region` VALUES ('1197', '锡山区', '110', 'Xishan Qu');
INSERT INTO `sys_region` VALUES ('1198', '惠山区', '110', 'Huishan Qu');
INSERT INTO `sys_region` VALUES ('1199', '滨湖区', '110', 'Binhu Qu');
INSERT INTO `sys_region` VALUES ('12', '浙江省', '1', 'Zhejiang Sheng');
INSERT INTO `sys_region` VALUES ('120', '泰州市', '11', 'Taizhou Shi');
INSERT INTO `sys_region` VALUES ('1200', '江阴市', '110', 'Jiangyin Shi');
INSERT INTO `sys_region` VALUES ('1201', '宜兴市', '110', 'Yixing Shi');
INSERT INTO `sys_region` VALUES ('1202', '市辖区', '111', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1203', '鼓楼区', '111', 'Gulou Qu');
INSERT INTO `sys_region` VALUES ('1204', '云龙区', '111', 'Yunlong Qu');
INSERT INTO `sys_region` VALUES ('1206', '贾汪区', '111', 'Jiawang Qu');
INSERT INTO `sys_region` VALUES ('1207', '泉山区', '111', 'Quanshan Qu');
INSERT INTO `sys_region` VALUES ('1208', '丰县', '111', 'Feng Xian');
INSERT INTO `sys_region` VALUES ('1209', '沛县', '111', 'Pei Xian');
INSERT INTO `sys_region` VALUES ('121', '宿迁市', '11', 'Suqian Shi');
INSERT INTO `sys_region` VALUES ('1210', '铜山区', '111', 'Tongshan Xian');
INSERT INTO `sys_region` VALUES ('1211', '睢宁县', '111', 'Suining Xian');
INSERT INTO `sys_region` VALUES ('1212', '新沂市', '111', 'Xinyi Shi');
INSERT INTO `sys_region` VALUES ('1213', '邳州市', '111', 'Pizhou Shi');
INSERT INTO `sys_region` VALUES ('1214', '市辖区', '112', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1215', '天宁区', '112', 'Tianning Qu');
INSERT INTO `sys_region` VALUES ('1216', '钟楼区', '112', 'Zhonglou Qu');
INSERT INTO `sys_region` VALUES ('1217', '戚墅堰区', '112', 'Qishuyan Qu');
INSERT INTO `sys_region` VALUES ('1218', '新北区', '112', 'Xinbei Qu');
INSERT INTO `sys_region` VALUES ('1219', '武进区', '112', 'Wujin Qu');
INSERT INTO `sys_region` VALUES ('122', '杭州市', '12', 'Hangzhou Shi');
INSERT INTO `sys_region` VALUES ('1220', '溧阳市', '112', 'Liyang Shi');
INSERT INTO `sys_region` VALUES ('1221', '金坛市', '112', 'Jintan Shi');
INSERT INTO `sys_region` VALUES ('1222', '市辖区', '113', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1223', '沧浪区', '113', 'Canglang Qu');
INSERT INTO `sys_region` VALUES ('1224', '平江区', '113', 'Pingjiang Qu');
INSERT INTO `sys_region` VALUES ('1225', '金阊区', '113', 'Jinchang Qu');
INSERT INTO `sys_region` VALUES ('1226', '虎丘区', '113', 'Huqiu Qu');
INSERT INTO `sys_region` VALUES ('1227', '吴中区', '113', 'Wuzhong Qu');
INSERT INTO `sys_region` VALUES ('1228', '相城区', '113', 'Xiangcheng Qu');
INSERT INTO `sys_region` VALUES ('1229', '常熟市', '113', 'Changshu Shi');
INSERT INTO `sys_region` VALUES ('123', '宁波市', '12', 'Ningbo Shi');
INSERT INTO `sys_region` VALUES ('1230', '张家港市', '113', 'Zhangjiagang Shi ');
INSERT INTO `sys_region` VALUES ('1231', '昆山市', '113', 'Kunshan Shi');
INSERT INTO `sys_region` VALUES ('1232', '吴江市', '113', 'Wujiang Shi');
INSERT INTO `sys_region` VALUES ('1233', '太仓市', '113', 'Taicang Shi');
INSERT INTO `sys_region` VALUES ('1234', '市辖区', '114', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1235', '崇川区', '114', 'Chongchuan Qu');
INSERT INTO `sys_region` VALUES ('1236', '港闸区', '114', 'Gangzha Qu');
INSERT INTO `sys_region` VALUES ('1237', '海安县', '114', 'Hai,an Xian');
INSERT INTO `sys_region` VALUES ('1238', '如东县', '114', 'Rudong Xian');
INSERT INTO `sys_region` VALUES ('1239', '启东市', '114', 'Qidong Shi');
INSERT INTO `sys_region` VALUES ('124', '温州市', '12', 'Wenzhou Shi');
INSERT INTO `sys_region` VALUES ('1240', '如皋市', '114', 'Rugao Shi');
INSERT INTO `sys_region` VALUES ('1241', '通州区', '114', 'Tongzhou Shi');
INSERT INTO `sys_region` VALUES ('1242', '海门市', '114', 'Haimen Shi');
INSERT INTO `sys_region` VALUES ('1243', '市辖区', '115', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1244', '连云区', '115', 'Lianyun Qu');
INSERT INTO `sys_region` VALUES ('1245', '新浦区', '115', 'Xinpu Qu');
INSERT INTO `sys_region` VALUES ('1246', '海州区', '115', 'Haizhou Qu');
INSERT INTO `sys_region` VALUES ('1247', '赣榆县', '115', 'Ganyu Xian');
INSERT INTO `sys_region` VALUES ('1248', '东海县', '115', 'Donghai Xian');
INSERT INTO `sys_region` VALUES ('1249', '灌云县', '115', 'Guanyun Xian');
INSERT INTO `sys_region` VALUES ('125', '嘉兴市', '12', 'Jiaxing Shi');
INSERT INTO `sys_region` VALUES ('1250', '灌南县', '115', 'Guannan Xian');
INSERT INTO `sys_region` VALUES ('1251', '市辖区', '116', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1252', '清河区', '116', 'Qinghe Qu');
INSERT INTO `sys_region` VALUES ('1253', '楚州区', '116', 'Chuzhou Qu');
INSERT INTO `sys_region` VALUES ('1254', '淮阴区', '116', 'Huaiyin Qu');
INSERT INTO `sys_region` VALUES ('1255', '清浦区', '116', 'Qingpu Qu');
INSERT INTO `sys_region` VALUES ('1256', '涟水县', '116', 'Lianshui Xian');
INSERT INTO `sys_region` VALUES ('1257', '洪泽县', '116', 'Hongze Xian');
INSERT INTO `sys_region` VALUES ('1258', '盱眙县', '116', 'Xuyi Xian');
INSERT INTO `sys_region` VALUES ('1259', '金湖县', '116', 'Jinhu Xian');
INSERT INTO `sys_region` VALUES ('126', '湖州市', '12', 'Huzhou Shi ');
INSERT INTO `sys_region` VALUES ('1260', '市辖区', '117', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1261', '亭湖区', '117', 'Tinghu Qu');
INSERT INTO `sys_region` VALUES ('1262', '盐都区', '117', 'Yandu Qu');
INSERT INTO `sys_region` VALUES ('1263', '响水县', '117', 'Xiangshui Xian');
INSERT INTO `sys_region` VALUES ('1264', '滨海县', '117', 'Binhai Xian');
INSERT INTO `sys_region` VALUES ('1265', '阜宁县', '117', 'Funing Xian');
INSERT INTO `sys_region` VALUES ('1266', '射阳县', '117', 'Sheyang Xian');
INSERT INTO `sys_region` VALUES ('1267', '建湖县', '117', 'Jianhu Xian');
INSERT INTO `sys_region` VALUES ('1268', '东台市', '117', 'Dongtai Shi');
INSERT INTO `sys_region` VALUES ('1269', '大丰市', '117', 'Dafeng Shi');
INSERT INTO `sys_region` VALUES ('127', '绍兴市', '12', 'Shaoxing Shi');
INSERT INTO `sys_region` VALUES ('1270', '市辖区', '118', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1271', '广陵区', '118', 'Guangling Qu');
INSERT INTO `sys_region` VALUES ('1272', '邗江区', '118', 'Hanjiang Qu');
INSERT INTO `sys_region` VALUES ('1273', '维扬区', '118', 'Weiyang Qu');
INSERT INTO `sys_region` VALUES ('1274', '宝应县', '118', 'Baoying Xian ');
INSERT INTO `sys_region` VALUES ('1275', '仪征市', '118', 'Yizheng Shi');
INSERT INTO `sys_region` VALUES ('1276', '高邮市', '118', 'Gaoyou Shi');
INSERT INTO `sys_region` VALUES ('1277', '江都市', '118', 'Jiangdu Shi');
INSERT INTO `sys_region` VALUES ('1278', '市辖区', '119', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1279', '京口区', '119', 'Jingkou Qu');
INSERT INTO `sys_region` VALUES ('128', '金华市', '12', 'Jinhua Shi');
INSERT INTO `sys_region` VALUES ('1280', '润州区', '119', 'Runzhou Qu');
INSERT INTO `sys_region` VALUES ('1281', '丹徒区', '119', 'Dantu Qu');
INSERT INTO `sys_region` VALUES ('1282', '丹阳市', '119', 'Danyang Xian');
INSERT INTO `sys_region` VALUES ('1283', '扬中市', '119', 'Yangzhong Shi');
INSERT INTO `sys_region` VALUES ('1284', '句容市', '119', 'Jurong Shi');
INSERT INTO `sys_region` VALUES ('1285', '市辖区', '120', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1286', '海陵区', '120', 'Hailing Qu');
INSERT INTO `sys_region` VALUES ('1287', '高港区', '120', 'Gaogang Qu');
INSERT INTO `sys_region` VALUES ('1288', '兴化市', '120', 'Xinghua Shi');
INSERT INTO `sys_region` VALUES ('1289', '靖江市', '120', 'Jingjiang Shi');
INSERT INTO `sys_region` VALUES ('129', '衢州市', '12', 'Quzhou Shi');
INSERT INTO `sys_region` VALUES ('1290', '泰兴市', '120', 'Taixing Shi');
INSERT INTO `sys_region` VALUES ('1291', '姜堰市', '120', 'Jiangyan Shi');
INSERT INTO `sys_region` VALUES ('1292', '市辖区', '121', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1293', '宿城区', '121', 'Sucheng Qu');
INSERT INTO `sys_region` VALUES ('1294', '宿豫区', '121', 'Suyu Qu');
INSERT INTO `sys_region` VALUES ('1295', '沭阳县', '121', 'Shuyang Xian');
INSERT INTO `sys_region` VALUES ('1296', '泗阳县', '121', 'Siyang Xian ');
INSERT INTO `sys_region` VALUES ('1297', '泗洪县', '121', 'Sihong Xian');
INSERT INTO `sys_region` VALUES ('1298', '市辖区', '122', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1299', '上城区', '122', 'Shangcheng Qu');
INSERT INTO `sys_region` VALUES ('13', '安徽省', '1', 'Anhui Sheng');
INSERT INTO `sys_region` VALUES ('130', '舟山市', '12', 'Zhoushan Shi');
INSERT INTO `sys_region` VALUES ('1300', '下城区', '122', 'Xiacheng Qu');
INSERT INTO `sys_region` VALUES ('1301', '江干区', '122', 'Jianggan Qu');
INSERT INTO `sys_region` VALUES ('1302', '拱墅区', '122', 'Gongshu Qu');
INSERT INTO `sys_region` VALUES ('1303', '西湖区', '122', 'Xihu Qu ');
INSERT INTO `sys_region` VALUES ('1304', '滨江区', '122', 'Binjiang Qu');
INSERT INTO `sys_region` VALUES ('1305', '萧山区', '122', 'Xiaoshan Qu');
INSERT INTO `sys_region` VALUES ('1306', '余杭区', '122', 'Yuhang Qu');
INSERT INTO `sys_region` VALUES ('1307', '桐庐县', '122', 'Tonglu Xian');
INSERT INTO `sys_region` VALUES ('1308', '淳安县', '122', 'Chun,an Xian');
INSERT INTO `sys_region` VALUES ('1309', '建德市', '122', 'Jiande Shi');
INSERT INTO `sys_region` VALUES ('131', '台州市', '12', 'Taizhou Shi');
INSERT INTO `sys_region` VALUES ('1310', '富阳市', '122', 'Fuyang Shi');
INSERT INTO `sys_region` VALUES ('1311', '临安市', '122', 'Lin,an Shi');
INSERT INTO `sys_region` VALUES ('1312', '市辖区', '123', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1313', '海曙区', '123', 'Haishu Qu');
INSERT INTO `sys_region` VALUES ('1314', '江东区', '123', 'Jiangdong Qu');
INSERT INTO `sys_region` VALUES ('1315', '江北区', '123', 'Jiangbei Qu');
INSERT INTO `sys_region` VALUES ('1316', '北仑区', '123', 'Beilun Qu');
INSERT INTO `sys_region` VALUES ('1317', '镇海区', '123', 'Zhenhai Qu');
INSERT INTO `sys_region` VALUES ('1318', '鄞州区', '123', 'Yinzhou Qu');
INSERT INTO `sys_region` VALUES ('1319', '象山县', '123', 'Xiangshan Xian');
INSERT INTO `sys_region` VALUES ('132', '丽水市', '12', 'Lishui Shi');
INSERT INTO `sys_region` VALUES ('1320', '宁海县', '123', 'Ninghai Xian');
INSERT INTO `sys_region` VALUES ('1321', '余姚市', '123', 'Yuyao Shi');
INSERT INTO `sys_region` VALUES ('1322', '慈溪市', '123', 'Cixi Shi');
INSERT INTO `sys_region` VALUES ('1323', '奉化市', '123', 'Fenghua Shi');
INSERT INTO `sys_region` VALUES ('1324', '市辖区', '124', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1325', '鹿城区', '124', 'Lucheng Qu');
INSERT INTO `sys_region` VALUES ('1326', '龙湾区', '124', 'Longwan Qu');
INSERT INTO `sys_region` VALUES ('1327', '瓯海区', '124', 'Ouhai Qu');
INSERT INTO `sys_region` VALUES ('1328', '洞头县', '124', 'Dongtou Xian');
INSERT INTO `sys_region` VALUES ('1329', '永嘉县', '124', 'Yongjia Xian');
INSERT INTO `sys_region` VALUES ('133', '合肥市', '13', 'Hefei Shi');
INSERT INTO `sys_region` VALUES ('1330', '平阳县', '124', 'Pingyang Xian');
INSERT INTO `sys_region` VALUES ('1331', '苍南县', '124', 'Cangnan Xian');
INSERT INTO `sys_region` VALUES ('1332', '文成县', '124', 'Wencheng Xian');
INSERT INTO `sys_region` VALUES ('1333', '泰顺县', '124', 'Taishun Xian');
INSERT INTO `sys_region` VALUES ('1334', '瑞安市', '124', 'Rui,an Xian');
INSERT INTO `sys_region` VALUES ('1335', '乐清市', '124', 'Yueqing Shi');
INSERT INTO `sys_region` VALUES ('1336', '市辖区', '125', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1338', '秀洲区', '125', 'Xiuzhou Qu');
INSERT INTO `sys_region` VALUES ('1339', '嘉善县', '125', 'Jiashan Xian');
INSERT INTO `sys_region` VALUES ('134', '芜湖市', '13', 'Wuhu Shi');
INSERT INTO `sys_region` VALUES ('1340', '海盐县', '125', 'Haiyan Xian');
INSERT INTO `sys_region` VALUES ('1341', '海宁市', '125', 'Haining Shi');
INSERT INTO `sys_region` VALUES ('1342', '平湖市', '125', 'Pinghu Shi');
INSERT INTO `sys_region` VALUES ('1343', '桐乡市', '125', 'Tongxiang Shi');
INSERT INTO `sys_region` VALUES ('1344', '市辖区', '126', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1345', '吴兴区', '126', 'Wuxing Qu');
INSERT INTO `sys_region` VALUES ('1346', '南浔区', '126', 'Nanxun Qu');
INSERT INTO `sys_region` VALUES ('1347', '德清县', '126', 'Deqing Xian');
INSERT INTO `sys_region` VALUES ('1348', '长兴县', '126', 'Changxing Xian');
INSERT INTO `sys_region` VALUES ('1349', '安吉县', '126', 'Anji Xian');
INSERT INTO `sys_region` VALUES ('135', '蚌埠市', '13', 'Bengbu Shi');
INSERT INTO `sys_region` VALUES ('1350', '市辖区', '127', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1351', '越城区', '127', 'Yuecheng Qu');
INSERT INTO `sys_region` VALUES ('1352', '绍兴县', '127', 'Shaoxing Xian');
INSERT INTO `sys_region` VALUES ('1353', '新昌县', '127', 'Xinchang Xian');
INSERT INTO `sys_region` VALUES ('1354', '诸暨市', '127', 'Zhuji Shi');
INSERT INTO `sys_region` VALUES ('1355', '上虞市', '127', 'Shangyu Shi');
INSERT INTO `sys_region` VALUES ('1356', '嵊州市', '127', 'Shengzhou Shi');
INSERT INTO `sys_region` VALUES ('1357', '市辖区', '128', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1358', '婺城区', '128', 'Wucheng Qu');
INSERT INTO `sys_region` VALUES ('1359', '金东区', '128', 'Jindong Qu');
INSERT INTO `sys_region` VALUES ('136', '淮南市', '13', 'Huainan Shi');
INSERT INTO `sys_region` VALUES ('1360', '武义县', '128', 'Wuyi Xian');
INSERT INTO `sys_region` VALUES ('1361', '浦江县', '128', 'Pujiang Xian ');
INSERT INTO `sys_region` VALUES ('1362', '磐安县', '128', 'Pan,an Xian');
INSERT INTO `sys_region` VALUES ('1363', '兰溪市', '128', 'Lanxi Shi');
INSERT INTO `sys_region` VALUES ('1364', '义乌市', '128', 'Yiwu Shi');
INSERT INTO `sys_region` VALUES ('1365', '东阳市', '128', 'Dongyang Shi');
INSERT INTO `sys_region` VALUES ('1366', '永康市', '128', 'Yongkang Shi');
INSERT INTO `sys_region` VALUES ('1367', '市辖区', '129', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1368', '柯城区', '129', 'Kecheng Qu');
INSERT INTO `sys_region` VALUES ('1369', '衢江区', '129', 'Qujiang Qu');
INSERT INTO `sys_region` VALUES ('137', '马鞍山市', '13', 'Ma,anshan Shi');
INSERT INTO `sys_region` VALUES ('1370', '常山县', '129', 'Changshan Xian');
INSERT INTO `sys_region` VALUES ('1371', '开化县', '129', 'Kaihua Xian');
INSERT INTO `sys_region` VALUES ('1372', '龙游县', '129', 'Longyou Xian ');
INSERT INTO `sys_region` VALUES ('1373', '江山市', '129', 'Jiangshan Shi');
INSERT INTO `sys_region` VALUES ('1374', '市辖区', '130', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1375', '定海区', '130', 'Dinghai Qu');
INSERT INTO `sys_region` VALUES ('1376', '普陀区', '130', 'Putuo Qu');
INSERT INTO `sys_region` VALUES ('1377', '岱山县', '130', 'Daishan Xian');
INSERT INTO `sys_region` VALUES ('1378', '嵊泗县', '130', 'Shengsi Xian');
INSERT INTO `sys_region` VALUES ('1379', '市辖区', '131', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('138', '淮北市', '13', 'Huaibei Shi');
INSERT INTO `sys_region` VALUES ('1380', '椒江区', '131', 'Jiaojiang Qu');
INSERT INTO `sys_region` VALUES ('1381', '黄岩区', '131', 'Huangyan Qu');
INSERT INTO `sys_region` VALUES ('1382', '路桥区', '131', 'Luqiao Qu');
INSERT INTO `sys_region` VALUES ('1383', '玉环县', '131', 'Yuhuan Xian');
INSERT INTO `sys_region` VALUES ('1384', '三门县', '131', 'Sanmen Xian');
INSERT INTO `sys_region` VALUES ('1385', '天台县', '131', 'Tiantai Xian');
INSERT INTO `sys_region` VALUES ('1386', '仙居县', '131', 'Xianju Xian');
INSERT INTO `sys_region` VALUES ('1387', '温岭市', '131', 'Wenling Shi');
INSERT INTO `sys_region` VALUES ('1388', '临海市', '131', 'Linhai Shi');
INSERT INTO `sys_region` VALUES ('1389', '市辖区', '132', '1');
INSERT INTO `sys_region` VALUES ('139', '铜陵市', '13', 'Tongling Shi');
INSERT INTO `sys_region` VALUES ('1390', '莲都区', '132', 'Liandu Qu');
INSERT INTO `sys_region` VALUES ('1391', '青田县', '132', 'Qingtian Xian');
INSERT INTO `sys_region` VALUES ('1392', '缙云县', '132', 'Jinyun Xian');
INSERT INTO `sys_region` VALUES ('1393', '遂昌县', '132', 'Suichang Xian');
INSERT INTO `sys_region` VALUES ('1394', '松阳县', '132', 'Songyang Xian');
INSERT INTO `sys_region` VALUES ('1395', '云和县', '132', 'Yunhe Xian');
INSERT INTO `sys_region` VALUES ('1396', '庆元县', '132', 'Qingyuan Xian');
INSERT INTO `sys_region` VALUES ('1397', '景宁畲族自治县', '132', 'Jingning Shezu Zizhixian');
INSERT INTO `sys_region` VALUES ('1398', '龙泉市', '132', 'Longquan Shi');
INSERT INTO `sys_region` VALUES ('1399', '市辖区', '133', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('14', '福建省', '1', 'Fujian Sheng ');
INSERT INTO `sys_region` VALUES ('140', '安庆市', '13', 'Anqing Shi');
INSERT INTO `sys_region` VALUES ('1400', '瑶海区', '133', 'Yaohai Qu');
INSERT INTO `sys_region` VALUES ('1401', '庐阳区', '133', 'Luyang Qu');
INSERT INTO `sys_region` VALUES ('1402', '蜀山区', '133', 'Shushan Qu');
INSERT INTO `sys_region` VALUES ('1403', '包河区', '133', 'Baohe Qu');
INSERT INTO `sys_region` VALUES ('1404', '长丰县', '133', 'Changfeng Xian');
INSERT INTO `sys_region` VALUES ('1405', '肥东县', '133', 'Feidong Xian');
INSERT INTO `sys_region` VALUES ('1406', '肥西县', '133', 'Feixi Xian');
INSERT INTO `sys_region` VALUES ('1407', '市辖区', '1412', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1408', '镜湖区', '1412', 'Jinghu Qu');
INSERT INTO `sys_region` VALUES ('1409', '三山区', '1412', 'Matang Qu');
INSERT INTO `sys_region` VALUES ('141', '黄山市', '13', 'Huangshan Shi');
INSERT INTO `sys_region` VALUES ('1410', '弋江区', '1412', 'Xinwu Qu');
INSERT INTO `sys_region` VALUES ('1411', '鸠江区', '1412', 'Jiujiang Qu');
INSERT INTO `sys_region` VALUES ('1412', '芜湖市', '134', 'Wuhu Shi');
INSERT INTO `sys_region` VALUES ('1413', '繁昌县', '1412', 'Fanchang Xian');
INSERT INTO `sys_region` VALUES ('1414', '南陵县', '1412', 'Nanling Xian');
INSERT INTO `sys_region` VALUES ('1415', '市辖区', '135', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1416', '龙子湖区', '135', 'Longzihu Qu');
INSERT INTO `sys_region` VALUES ('1417', '蚌山区', '135', 'Bangshan Qu');
INSERT INTO `sys_region` VALUES ('1418', '禹会区', '135', 'Yuhui Qu');
INSERT INTO `sys_region` VALUES ('1419', '淮上区', '135', 'Huaishang Qu');
INSERT INTO `sys_region` VALUES ('142', '滁州市', '13', 'Chuzhou Shi');
INSERT INTO `sys_region` VALUES ('1420', '怀远县', '135', 'Huaiyuan Qu');
INSERT INTO `sys_region` VALUES ('1421', '五河县', '135', 'Wuhe Xian');
INSERT INTO `sys_region` VALUES ('1422', '固镇县', '135', 'Guzhen Xian');
INSERT INTO `sys_region` VALUES ('1423', '市辖区', '136', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1424', '大通区', '136', 'Datong Qu');
INSERT INTO `sys_region` VALUES ('1425', '田家庵区', '136', 'Tianjia,an Qu');
INSERT INTO `sys_region` VALUES ('1426', '谢家集区', '136', 'Xiejiaji Qu');
INSERT INTO `sys_region` VALUES ('1427', '八公山区', '136', 'Bagongshan Qu');
INSERT INTO `sys_region` VALUES ('1428', '潘集区', '136', 'Panji Qu');
INSERT INTO `sys_region` VALUES ('1429', '凤台县', '136', 'Fengtai Xian');
INSERT INTO `sys_region` VALUES ('143', '阜阳市', '13', 'Fuyang Shi');
INSERT INTO `sys_region` VALUES ('1430', '市辖区', '137', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1431', '金家庄区', '137', 'Jinjiazhuang Qu');
INSERT INTO `sys_region` VALUES ('1432', '花山区', '137', 'Huashan Qu');
INSERT INTO `sys_region` VALUES ('1433', '雨山区', '137', 'Yushan Qu');
INSERT INTO `sys_region` VALUES ('1434', '当涂县', '137', 'Dangtu Xian');
INSERT INTO `sys_region` VALUES ('1435', '市辖区', '138', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1436', '杜集区', '138', 'Duji Qu');
INSERT INTO `sys_region` VALUES ('1437', '相山区', '138', 'Xiangshan Qu');
INSERT INTO `sys_region` VALUES ('1438', '烈山区', '138', 'Lieshan Qu');
INSERT INTO `sys_region` VALUES ('1439', '濉溪县', '138', 'Suixi Xian');
INSERT INTO `sys_region` VALUES ('144', '宿州市', '13', 'Suzhou Shi');
INSERT INTO `sys_region` VALUES ('1440', '市辖区', '139', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1441', '铜官山区', '139', 'Tongguanshan Qu');
INSERT INTO `sys_region` VALUES ('1442', '狮子山区', '139', 'Shizishan Qu');
INSERT INTO `sys_region` VALUES ('1443', '郊区', '139', 'Jiaoqu');
INSERT INTO `sys_region` VALUES ('1444', '铜陵县', '139', 'Tongling Xian');
INSERT INTO `sys_region` VALUES ('1445', '市辖区', '140', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1446', '迎江区', '140', 'Yingjiang Qu');
INSERT INTO `sys_region` VALUES ('1447', '大观区', '140', 'Daguan Qu');
INSERT INTO `sys_region` VALUES ('1448', '宜秀区', '140', 'Yixiu Qu');
INSERT INTO `sys_region` VALUES ('1449', '怀宁县', '140', 'Huaining Xian');
INSERT INTO `sys_region` VALUES ('145', '巢湖市', '13', 'Chaohu Shi');
INSERT INTO `sys_region` VALUES ('1450', '枞阳县', '140', 'Zongyang Xian');
INSERT INTO `sys_region` VALUES ('1451', '潜山县', '140', 'Qianshan Xian');
INSERT INTO `sys_region` VALUES ('1452', '太湖县', '140', 'Taihu Xian');
INSERT INTO `sys_region` VALUES ('1453', '宿松县', '140', 'Susong Xian');
INSERT INTO `sys_region` VALUES ('1454', '望江县', '140', 'Wangjiang Xian');
INSERT INTO `sys_region` VALUES ('1455', '岳西县', '140', 'Yuexi Xian');
INSERT INTO `sys_region` VALUES ('1456', '桐城市', '140', 'Tongcheng Shi');
INSERT INTO `sys_region` VALUES ('1457', '市辖区', '141', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1458', '屯溪区', '141', 'Tunxi Qu');
INSERT INTO `sys_region` VALUES ('1459', '黄山区', '141', 'Huangshan Qu');
INSERT INTO `sys_region` VALUES ('146', '六安市', '13', 'Liu,an Shi');
INSERT INTO `sys_region` VALUES ('1460', '徽州区', '141', 'Huizhou Qu');
INSERT INTO `sys_region` VALUES ('1461', '歙县', '141', 'She Xian');
INSERT INTO `sys_region` VALUES ('1462', '休宁县', '141', 'Xiuning Xian');
INSERT INTO `sys_region` VALUES ('1463', '黟县', '141', 'Yi Xian');
INSERT INTO `sys_region` VALUES ('1464', '祁门县', '141', 'Qimen Xian');
INSERT INTO `sys_region` VALUES ('1465', '市辖区', '142', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1466', '琅琊区', '142', 'Langya Qu');
INSERT INTO `sys_region` VALUES ('1467', '南谯区', '142', 'Nanqiao Qu');
INSERT INTO `sys_region` VALUES ('1468', '来安县', '142', 'Lai,an Xian');
INSERT INTO `sys_region` VALUES ('1469', '全椒县', '142', 'Quanjiao Xian');
INSERT INTO `sys_region` VALUES ('147', '亳州市', '13', 'Bozhou Shi');
INSERT INTO `sys_region` VALUES ('1470', '定远县', '142', 'Dingyuan Xian');
INSERT INTO `sys_region` VALUES ('1471', '凤阳县', '142', 'Fengyang Xian');
INSERT INTO `sys_region` VALUES ('1472', '天长市', '142', 'Tianchang Shi');
INSERT INTO `sys_region` VALUES ('1473', '明光市', '142', 'Mingguang Shi');
INSERT INTO `sys_region` VALUES ('1474', '市辖区', '143', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1475', '颍州区', '143', 'Yingzhou Qu');
INSERT INTO `sys_region` VALUES ('1476', '颍东区', '143', 'Yingdong Qu');
INSERT INTO `sys_region` VALUES ('1477', '颍泉区', '143', 'Yingquan Qu');
INSERT INTO `sys_region` VALUES ('1478', '临泉县', '143', 'Linquan Xian');
INSERT INTO `sys_region` VALUES ('1479', '太和县', '143', 'Taihe Xian');
INSERT INTO `sys_region` VALUES ('148', '池州市', '13', 'Chizhou Shi');
INSERT INTO `sys_region` VALUES ('1480', '阜南县', '143', 'Funan Xian');
INSERT INTO `sys_region` VALUES ('1481', '颍上县', '143', 'Yingshang Xian');
INSERT INTO `sys_region` VALUES ('1482', '界首市', '143', 'Jieshou Shi');
INSERT INTO `sys_region` VALUES ('1483', '市辖区', '144', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1484', '埇桥区', '144', 'Yongqiao Qu');
INSERT INTO `sys_region` VALUES ('1485', '砀山县', '144', 'Dangshan Xian');
INSERT INTO `sys_region` VALUES ('1486', '萧县', '144', 'Xiao Xian');
INSERT INTO `sys_region` VALUES ('1487', '灵璧县', '144', 'Lingbi Xian');
INSERT INTO `sys_region` VALUES ('1488', '泗县', '144', 'Si Xian ');
INSERT INTO `sys_region` VALUES ('1489', '市辖区', '145', '1');
INSERT INTO `sys_region` VALUES ('149', '宣城市', '13', 'Xuancheng Shi');
INSERT INTO `sys_region` VALUES ('1490', '居巢区', '145', 'Juchao Qu');
INSERT INTO `sys_region` VALUES ('1491', '庐江县', '145', 'Lujiang Xian');
INSERT INTO `sys_region` VALUES ('1492', '无为县', '145', 'Wuwei Xian');
INSERT INTO `sys_region` VALUES ('1493', '含山县', '145', 'Hanshan Xian');
INSERT INTO `sys_region` VALUES ('1494', '和县', '145', 'He Xian ');
INSERT INTO `sys_region` VALUES ('1495', '市辖区', '146', '1');
INSERT INTO `sys_region` VALUES ('1496', '金安区', '146', 'Jinan Qu');
INSERT INTO `sys_region` VALUES ('1497', '裕安区', '146', 'Yuan Qu');
INSERT INTO `sys_region` VALUES ('1498', '寿县', '146', 'Shou Xian');
INSERT INTO `sys_region` VALUES ('1499', '霍邱县', '146', 'Huoqiu Xian');
INSERT INTO `sys_region` VALUES ('15', '江西省', '1', 'Jiangxi Sheng');
INSERT INTO `sys_region` VALUES ('150', '福州市', '14', 'Fuzhou Shi');
INSERT INTO `sys_region` VALUES ('1500', '舒城县', '146', 'Shucheng Xian');
INSERT INTO `sys_region` VALUES ('1501', '金寨县', '146', 'Jingzhai Xian');
INSERT INTO `sys_region` VALUES ('1502', '霍山县', '146', 'Huoshan Xian');
INSERT INTO `sys_region` VALUES ('1503', '市辖区', '147', '1');
INSERT INTO `sys_region` VALUES ('1504', '谯城区', '147', 'Qiaocheng Qu');
INSERT INTO `sys_region` VALUES ('1505', '涡阳县', '147', 'Guoyang Xian');
INSERT INTO `sys_region` VALUES ('1506', '蒙城县', '147', 'Mengcheng Xian');
INSERT INTO `sys_region` VALUES ('1507', '利辛县', '147', 'Lixin Xian');
INSERT INTO `sys_region` VALUES ('1508', '市辖区', '148', '1');
INSERT INTO `sys_region` VALUES ('1509', '贵池区', '148', 'Guichi Qu');
INSERT INTO `sys_region` VALUES ('151', '厦门市', '14', 'Xiamen Shi');
INSERT INTO `sys_region` VALUES ('1510', '东至县', '148', 'Dongzhi Xian');
INSERT INTO `sys_region` VALUES ('1511', '石台县', '148', 'Shitai Xian');
INSERT INTO `sys_region` VALUES ('1512', '青阳县', '148', 'Qingyang Xian');
INSERT INTO `sys_region` VALUES ('1513', '市辖区', '149', '1');
INSERT INTO `sys_region` VALUES ('1514', '宣州区', '149', 'Xuanzhou Qu');
INSERT INTO `sys_region` VALUES ('1515', '郎溪县', '149', 'Langxi Xian');
INSERT INTO `sys_region` VALUES ('1516', '广德县', '149', 'Guangde Xian');
INSERT INTO `sys_region` VALUES ('1517', '泾县', '149', 'Jing Xian');
INSERT INTO `sys_region` VALUES ('1518', '绩溪县', '149', 'Jixi Xian');
INSERT INTO `sys_region` VALUES ('1519', '旌德县', '149', 'Jingde Xian');
INSERT INTO `sys_region` VALUES ('152', '莆田市', '14', 'Putian Shi');
INSERT INTO `sys_region` VALUES ('1520', '宁国市', '149', 'Ningguo Shi');
INSERT INTO `sys_region` VALUES ('1521', '市辖区', '150', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1522', '鼓楼区', '150', 'Gulou Qu');
INSERT INTO `sys_region` VALUES ('1523', '台江区', '150', 'Taijiang Qu');
INSERT INTO `sys_region` VALUES ('1524', '仓山区', '150', 'Cangshan Qu');
INSERT INTO `sys_region` VALUES ('1525', '马尾区', '150', 'Mawei Qu');
INSERT INTO `sys_region` VALUES ('1526', '晋安区', '150', 'Jin,an Qu');
INSERT INTO `sys_region` VALUES ('1527', '闽侯县', '150', 'Minhou Qu');
INSERT INTO `sys_region` VALUES ('1528', '连江县', '150', 'Lianjiang Xian');
INSERT INTO `sys_region` VALUES ('1529', '罗源县', '150', 'Luoyuan Xian');
INSERT INTO `sys_region` VALUES ('153', '三明市', '14', 'Sanming Shi');
INSERT INTO `sys_region` VALUES ('1530', '闽清县', '150', 'Minqing Xian');
INSERT INTO `sys_region` VALUES ('1531', '永泰县', '150', 'Yongtai Xian');
INSERT INTO `sys_region` VALUES ('1532', '平潭县', '150', 'Pingtan Xian');
INSERT INTO `sys_region` VALUES ('1533', '福清市', '150', 'Fuqing Shi');
INSERT INTO `sys_region` VALUES ('1534', '长乐市', '150', 'Changle Shi');
INSERT INTO `sys_region` VALUES ('1535', '市辖区', '151', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1536', '思明区', '151', 'Siming Qu');
INSERT INTO `sys_region` VALUES ('1537', '海沧区', '151', 'Haicang Qu');
INSERT INTO `sys_region` VALUES ('1538', '湖里区', '151', 'Huli Qu');
INSERT INTO `sys_region` VALUES ('1539', '集美区', '151', 'Jimei Qu');
INSERT INTO `sys_region` VALUES ('154', '泉州市', '14', 'Quanzhou Shi');
INSERT INTO `sys_region` VALUES ('1540', '同安区', '151', 'Tong,an Qu');
INSERT INTO `sys_region` VALUES ('1541', '翔安区', '151', 'Xiangan Qu');
INSERT INTO `sys_region` VALUES ('1542', '市辖区', '152', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1543', '城厢区', '152', 'Chengxiang Qu');
INSERT INTO `sys_region` VALUES ('1544', '涵江区', '152', 'Hanjiang Qu');
INSERT INTO `sys_region` VALUES ('1545', '荔城区', '152', 'Licheng Qu');
INSERT INTO `sys_region` VALUES ('1546', '秀屿区', '152', 'Xiuyu Qu');
INSERT INTO `sys_region` VALUES ('1547', '仙游县', '152', 'Xianyou Xian');
INSERT INTO `sys_region` VALUES ('1548', '市辖区', '153', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1549', '梅列区', '153', 'Meilie Qu');
INSERT INTO `sys_region` VALUES ('155', '漳州市', '14', 'Zhangzhou Shi');
INSERT INTO `sys_region` VALUES ('1550', '三元区', '153', 'Sanyuan Qu');
INSERT INTO `sys_region` VALUES ('1551', '明溪县', '153', 'Mingxi Xian');
INSERT INTO `sys_region` VALUES ('1552', '清流县', '153', 'Qingliu Xian');
INSERT INTO `sys_region` VALUES ('1553', '宁化县', '153', 'Ninghua Xian');
INSERT INTO `sys_region` VALUES ('1554', '大田县', '153', 'Datian Xian');
INSERT INTO `sys_region` VALUES ('1555', '尤溪县', '153', 'Youxi Xian');
INSERT INTO `sys_region` VALUES ('1556', '沙县', '153', 'Sha Xian');
INSERT INTO `sys_region` VALUES ('1557', '将乐县', '153', 'Jiangle Xian');
INSERT INTO `sys_region` VALUES ('1558', '泰宁县', '153', 'Taining Xian');
INSERT INTO `sys_region` VALUES ('1559', '建宁县', '153', 'Jianning Xian');
INSERT INTO `sys_region` VALUES ('156', '南平市', '14', 'Nanping Shi');
INSERT INTO `sys_region` VALUES ('1560', '永安市', '153', 'Yong,an Shi');
INSERT INTO `sys_region` VALUES ('1561', '市辖区', '154', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1562', '鲤城区', '154', 'Licheng Qu');
INSERT INTO `sys_region` VALUES ('1563', '丰泽区', '154', 'Fengze Qu');
INSERT INTO `sys_region` VALUES ('1564', '洛江区', '154', 'Luojiang Qu');
INSERT INTO `sys_region` VALUES ('1565', '泉港区', '154', 'Quangang Qu');
INSERT INTO `sys_region` VALUES ('1566', '惠安县', '154', 'Hui,an Xian');
INSERT INTO `sys_region` VALUES ('1567', '安溪县', '154', 'Anxi Xian');
INSERT INTO `sys_region` VALUES ('1568', '永春县', '154', 'Yongchun Xian');
INSERT INTO `sys_region` VALUES ('1569', '德化县', '154', 'Dehua Xian');
INSERT INTO `sys_region` VALUES ('157', '龙岩市', '14', 'Longyan Shi');
INSERT INTO `sys_region` VALUES ('1570', '金门县', '154', 'Jinmen Xian');
INSERT INTO `sys_region` VALUES ('1571', '石狮市', '154', 'Shishi Shi');
INSERT INTO `sys_region` VALUES ('1572', '晋江市', '154', 'Jinjiang Shi');
INSERT INTO `sys_region` VALUES ('1573', '南安市', '154', 'Nan,an Shi');
INSERT INTO `sys_region` VALUES ('1574', '市辖区', '155', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1575', '芗城区', '155', 'Xiangcheng Qu');
INSERT INTO `sys_region` VALUES ('1576', '龙文区', '155', 'Longwen Qu');
INSERT INTO `sys_region` VALUES ('1577', '云霄县', '155', 'Yunxiao Xian');
INSERT INTO `sys_region` VALUES ('1578', '漳浦县', '155', 'Zhangpu Xian');
INSERT INTO `sys_region` VALUES ('1579', '诏安县', '155', 'Zhao,an Xian');
INSERT INTO `sys_region` VALUES ('158', '宁德市', '14', 'Ningde Shi');
INSERT INTO `sys_region` VALUES ('1580', '长泰县', '155', 'Changtai Xian');
INSERT INTO `sys_region` VALUES ('1581', '东山县', '155', 'Dongshan Xian');
INSERT INTO `sys_region` VALUES ('1582', '南靖县', '155', 'Nanjing Xian');
INSERT INTO `sys_region` VALUES ('1583', '平和县', '155', 'Pinghe Xian');
INSERT INTO `sys_region` VALUES ('1584', '华安县', '155', 'Hua,an Xian');
INSERT INTO `sys_region` VALUES ('1585', '龙海市', '155', 'Longhai Shi');
INSERT INTO `sys_region` VALUES ('1586', '市辖区', '156', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1587', '延平区', '156', 'Yanping Qu');
INSERT INTO `sys_region` VALUES ('1588', '顺昌县', '156', 'Shunchang Xian');
INSERT INTO `sys_region` VALUES ('1589', '浦城县', '156', 'Pucheng Xian');
INSERT INTO `sys_region` VALUES ('159', '南昌市', '15', 'Nanchang Shi');
INSERT INTO `sys_region` VALUES ('1590', '光泽县', '156', 'Guangze Xian');
INSERT INTO `sys_region` VALUES ('1591', '松溪县', '156', 'Songxi Xian');
INSERT INTO `sys_region` VALUES ('1592', '政和县', '156', 'Zhenghe Xian');
INSERT INTO `sys_region` VALUES ('1593', '邵武市', '156', 'Shaowu Shi');
INSERT INTO `sys_region` VALUES ('1594', '武夷山市', '156', 'Wuyishan Shi');
INSERT INTO `sys_region` VALUES ('1595', '建瓯市', '156', 'Jian,ou Shi');
INSERT INTO `sys_region` VALUES ('1596', '建阳市', '156', 'Jianyang Shi');
INSERT INTO `sys_region` VALUES ('1597', '市辖区', '157', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1598', '新罗区', '157', 'Xinluo Qu');
INSERT INTO `sys_region` VALUES ('1599', '长汀县', '157', 'Changting Xian');
INSERT INTO `sys_region` VALUES ('16', '山东省', '1', 'Shandong Sheng ');
INSERT INTO `sys_region` VALUES ('160', '景德镇市', '15', 'Jingdezhen Shi');
INSERT INTO `sys_region` VALUES ('1600', '永定县', '157', 'Yongding Xian');
INSERT INTO `sys_region` VALUES ('1601', '上杭县', '157', 'Shanghang Xian');
INSERT INTO `sys_region` VALUES ('1602', '武平县', '157', 'Wuping Xian');
INSERT INTO `sys_region` VALUES ('1603', '连城县', '157', 'Liancheng Xian');
INSERT INTO `sys_region` VALUES ('1604', '漳平市', '157', 'Zhangping Xian');
INSERT INTO `sys_region` VALUES ('1605', '市辖区', '158', '1');
INSERT INTO `sys_region` VALUES ('1606', '蕉城区', '158', 'Jiaocheng Qu');
INSERT INTO `sys_region` VALUES ('1607', '霞浦县', '158', 'Xiapu Xian');
INSERT INTO `sys_region` VALUES ('1608', '古田县', '158', 'Gutian Xian');
INSERT INTO `sys_region` VALUES ('1609', '屏南县', '158', 'Pingnan Xian');
INSERT INTO `sys_region` VALUES ('161', '萍乡市', '15', 'Pingxiang Shi');
INSERT INTO `sys_region` VALUES ('1610', '寿宁县', '158', 'Shouning Xian');
INSERT INTO `sys_region` VALUES ('1611', '周宁县', '158', 'Zhouning Xian');
INSERT INTO `sys_region` VALUES ('1612', '柘荣县', '158', 'Zherong Xian');
INSERT INTO `sys_region` VALUES ('1613', '福安市', '158', 'Fu,an Shi');
INSERT INTO `sys_region` VALUES ('1614', '福鼎市', '158', 'Fuding Shi');
INSERT INTO `sys_region` VALUES ('1615', '市辖区', '159', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1616', '东湖区', '159', 'Donghu Qu');
INSERT INTO `sys_region` VALUES ('1617', '西湖区', '159', 'Xihu Qu ');
INSERT INTO `sys_region` VALUES ('1618', '青云谱区', '159', 'Qingyunpu Qu');
INSERT INTO `sys_region` VALUES ('1619', '湾里区', '159', 'Wanli Qu');
INSERT INTO `sys_region` VALUES ('162', '九江市', '15', 'Jiujiang Shi');
INSERT INTO `sys_region` VALUES ('1620', '青山湖区', '159', 'Qingshanhu Qu');
INSERT INTO `sys_region` VALUES ('1621', '南昌县', '159', 'Nanchang Xian');
INSERT INTO `sys_region` VALUES ('1622', '新建县', '159', 'Xinjian Xian');
INSERT INTO `sys_region` VALUES ('1623', '安义县', '159', 'Anyi Xian');
INSERT INTO `sys_region` VALUES ('1624', '进贤县', '159', 'Jinxian Xian');
INSERT INTO `sys_region` VALUES ('1625', '市辖区', '160', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1626', '昌江区', '160', 'Changjiang Qu');
INSERT INTO `sys_region` VALUES ('1627', '珠山区', '160', 'Zhushan Qu');
INSERT INTO `sys_region` VALUES ('1628', '浮梁县', '160', 'Fuliang Xian');
INSERT INTO `sys_region` VALUES ('1629', '乐平市', '160', 'Leping Shi');
INSERT INTO `sys_region` VALUES ('163', '新余市', '15', 'Xinyu Shi');
INSERT INTO `sys_region` VALUES ('1630', '市辖区', '161', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1631', '安源区', '161', 'Anyuan Qu');
INSERT INTO `sys_region` VALUES ('1632', '湘东区', '161', 'Xiangdong Qu');
INSERT INTO `sys_region` VALUES ('1633', '莲花县', '161', 'Lianhua Xian');
INSERT INTO `sys_region` VALUES ('1634', '上栗县', '161', 'Shangli Xian');
INSERT INTO `sys_region` VALUES ('1635', '芦溪县', '161', 'Lixi Xian');
INSERT INTO `sys_region` VALUES ('1636', '市辖区', '162', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1637', '庐山区', '162', 'Lushan Qu');
INSERT INTO `sys_region` VALUES ('1638', '浔阳区', '162', 'Xunyang Qu');
INSERT INTO `sys_region` VALUES ('1639', '九江县', '162', 'Jiujiang Xian');
INSERT INTO `sys_region` VALUES ('164', '鹰潭市', '15', 'Yingtan Shi');
INSERT INTO `sys_region` VALUES ('1640', '武宁县', '162', 'Wuning Xian');
INSERT INTO `sys_region` VALUES ('1641', '修水县', '162', 'Xiushui Xian');
INSERT INTO `sys_region` VALUES ('1642', '永修县', '162', 'Yongxiu Xian');
INSERT INTO `sys_region` VALUES ('1643', '德安县', '162', 'De,an Xian');
INSERT INTO `sys_region` VALUES ('1644', '星子县', '162', 'Xingzi Xian');
INSERT INTO `sys_region` VALUES ('1645', '都昌县', '162', 'Duchang Xian');
INSERT INTO `sys_region` VALUES ('1646', '湖口县', '162', 'Hukou Xian');
INSERT INTO `sys_region` VALUES ('1647', '彭泽县', '162', 'Pengze Xian');
INSERT INTO `sys_region` VALUES ('1648', '瑞昌市', '162', 'Ruichang Shi');
INSERT INTO `sys_region` VALUES ('1649', '市辖区', '163', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('165', '赣州市', '15', 'Ganzhou Shi');
INSERT INTO `sys_region` VALUES ('1650', '渝水区', '163', 'Yushui Qu');
INSERT INTO `sys_region` VALUES ('1651', '分宜县', '163', 'Fenyi Xian');
INSERT INTO `sys_region` VALUES ('1652', '市辖区', '164', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1653', '月湖区', '164', 'Yuehu Qu');
INSERT INTO `sys_region` VALUES ('1654', '余江县', '164', 'Yujiang Xian');
INSERT INTO `sys_region` VALUES ('1655', '贵溪市', '164', 'Guixi Shi');
INSERT INTO `sys_region` VALUES ('1656', '市辖区', '165', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1657', '章贡区', '165', 'Zhanggong Qu');
INSERT INTO `sys_region` VALUES ('1658', '赣县', '165', 'Gan Xian');
INSERT INTO `sys_region` VALUES ('1659', '信丰县', '165', 'Xinfeng Xian ');
INSERT INTO `sys_region` VALUES ('166', '吉安市', '15', 'Ji,an Shi');
INSERT INTO `sys_region` VALUES ('1660', '大余县', '165', 'Dayu Xian');
INSERT INTO `sys_region` VALUES ('1661', '上犹县', '165', 'Shangyou Xian');
INSERT INTO `sys_region` VALUES ('1662', '崇义县', '165', 'Chongyi Xian');
INSERT INTO `sys_region` VALUES ('1663', '安远县', '165', 'Anyuan Xian');
INSERT INTO `sys_region` VALUES ('1664', '龙南县', '165', 'Longnan Xian');
INSERT INTO `sys_region` VALUES ('1665', '定南县', '165', 'Dingnan Xian');
INSERT INTO `sys_region` VALUES ('1666', '全南县', '165', 'Quannan Xian');
INSERT INTO `sys_region` VALUES ('1667', '宁都县', '165', 'Ningdu Xian');
INSERT INTO `sys_region` VALUES ('1668', '于都县', '165', 'Yudu Xian');
INSERT INTO `sys_region` VALUES ('1669', '兴国县', '165', 'Xingguo Xian');
INSERT INTO `sys_region` VALUES ('167', '宜春市', '15', 'Yichun Shi');
INSERT INTO `sys_region` VALUES ('1670', '会昌县', '165', 'Huichang Xian');
INSERT INTO `sys_region` VALUES ('1671', '寻乌县', '165', 'Xunwu Xian');
INSERT INTO `sys_region` VALUES ('1672', '石城县', '165', 'Shicheng Xian');
INSERT INTO `sys_region` VALUES ('1673', '瑞金市', '165', 'Ruijin Shi');
INSERT INTO `sys_region` VALUES ('1674', '南康市', '165', 'Nankang Shi');
INSERT INTO `sys_region` VALUES ('1675', '市辖区', '166', '1');
INSERT INTO `sys_region` VALUES ('1676', '吉州区', '166', 'Jizhou Qu');
INSERT INTO `sys_region` VALUES ('1677', '青原区', '166', 'Qingyuan Qu');
INSERT INTO `sys_region` VALUES ('1678', '吉安县', '166', 'Ji,an Xian');
INSERT INTO `sys_region` VALUES ('1679', '吉水县', '166', 'Jishui Xian');
INSERT INTO `sys_region` VALUES ('168', '抚州市', '15', 'Wuzhou Shi');
INSERT INTO `sys_region` VALUES ('1680', '峡江县', '166', 'Xiajiang Xian');
INSERT INTO `sys_region` VALUES ('1681', '新干县', '166', 'Xingan Xian');
INSERT INTO `sys_region` VALUES ('1682', '永丰县', '166', 'Yongfeng Xian');
INSERT INTO `sys_region` VALUES ('1683', '泰和县', '166', 'Taihe Xian');
INSERT INTO `sys_region` VALUES ('1684', '遂川县', '166', 'Suichuan Xian');
INSERT INTO `sys_region` VALUES ('1685', '万安县', '166', 'Wan,an Xian');
INSERT INTO `sys_region` VALUES ('1686', '安福县', '166', 'Anfu Xian');
INSERT INTO `sys_region` VALUES ('1687', '永新县', '166', 'Yongxin Xian ');
INSERT INTO `sys_region` VALUES ('1688', '井冈山市', '166', 'Jinggangshan Shi');
INSERT INTO `sys_region` VALUES ('1689', '市辖区', '167', '1');
INSERT INTO `sys_region` VALUES ('169', '上饶市', '15', 'Shangrao Shi');
INSERT INTO `sys_region` VALUES ('1690', '袁州区', '167', 'Yuanzhou Qu');
INSERT INTO `sys_region` VALUES ('1691', '奉新县', '167', 'Fengxin Xian');
INSERT INTO `sys_region` VALUES ('1692', '万载县', '167', 'Wanzai Xian');
INSERT INTO `sys_region` VALUES ('1693', '上高县', '167', 'Shanggao Xian');
INSERT INTO `sys_region` VALUES ('1694', '宜丰县', '167', 'Yifeng Xian');
INSERT INTO `sys_region` VALUES ('1695', '靖安县', '167', 'Jing,an Xian');
INSERT INTO `sys_region` VALUES ('1696', '铜鼓县', '167', 'Tonggu Xian');
INSERT INTO `sys_region` VALUES ('1697', '丰城市', '167', 'Fengcheng Shi');
INSERT INTO `sys_region` VALUES ('1698', '樟树市', '167', 'Zhangshu Shi');
INSERT INTO `sys_region` VALUES ('1699', '高安市', '167', 'Gao,an Shi');
INSERT INTO `sys_region` VALUES ('17', '河南省', '1', 'Henan Sheng');
INSERT INTO `sys_region` VALUES ('170', '济南市', '16', 'Jinan Shi');
INSERT INTO `sys_region` VALUES ('1700', '市辖区', '168', '1');
INSERT INTO `sys_region` VALUES ('1701', '临川区', '168', 'Linchuan Qu');
INSERT INTO `sys_region` VALUES ('1702', '南城县', '168', 'Nancheng Xian');
INSERT INTO `sys_region` VALUES ('1703', '黎川县', '168', 'Lichuan Xian');
INSERT INTO `sys_region` VALUES ('1704', '南丰县', '168', 'Nanfeng Xian');
INSERT INTO `sys_region` VALUES ('1705', '崇仁县', '168', 'Chongren Xian');
INSERT INTO `sys_region` VALUES ('1706', '乐安县', '168', 'Le,an Xian');
INSERT INTO `sys_region` VALUES ('1707', '宜黄县', '168', 'Yihuang Xian');
INSERT INTO `sys_region` VALUES ('1708', '金溪县', '168', 'Jinxi Xian');
INSERT INTO `sys_region` VALUES ('1709', '资溪县', '168', 'Zixi Xian');
INSERT INTO `sys_region` VALUES ('171', '青岛市', '16', 'Qingdao Shi');
INSERT INTO `sys_region` VALUES ('1710', '东乡县', '168', 'Dongxiang Xian');
INSERT INTO `sys_region` VALUES ('1711', '广昌县', '168', 'Guangchang Xian');
INSERT INTO `sys_region` VALUES ('1712', '市辖区', '169', '1');
INSERT INTO `sys_region` VALUES ('1713', '信州区', '169', 'Xinzhou Qu');
INSERT INTO `sys_region` VALUES ('1714', '上饶县', '169', 'Shangrao Xian ');
INSERT INTO `sys_region` VALUES ('1715', '广丰县', '169', 'Guangfeng Xian');
INSERT INTO `sys_region` VALUES ('1716', '玉山县', '169', 'Yushan Xian');
INSERT INTO `sys_region` VALUES ('1717', '铅山县', '169', 'Qianshan Xian');
INSERT INTO `sys_region` VALUES ('1718', '横峰县', '169', 'Hengfeng Xian');
INSERT INTO `sys_region` VALUES ('1719', '弋阳县', '169', 'Yiyang Xian');
INSERT INTO `sys_region` VALUES ('172', '淄博市', '16', 'Zibo Shi');
INSERT INTO `sys_region` VALUES ('1720', '余干县', '169', 'Yugan Xian');
INSERT INTO `sys_region` VALUES ('1721', '鄱阳县', '169', 'Poyang Xian');
INSERT INTO `sys_region` VALUES ('1722', '万年县', '169', 'Wannian Xian');
INSERT INTO `sys_region` VALUES ('1723', '婺源县', '169', 'Wuyuan Xian');
INSERT INTO `sys_region` VALUES ('1724', '德兴市', '169', 'Dexing Shi');
INSERT INTO `sys_region` VALUES ('1725', '市辖区', '170', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1726', '历下区', '170', 'Lixia Qu');
INSERT INTO `sys_region` VALUES ('1727', '市中区', '170', 'Shizhong Qu');
INSERT INTO `sys_region` VALUES ('1728', '槐荫区', '170', 'Huaiyin Qu');
INSERT INTO `sys_region` VALUES ('1729', '天桥区', '170', 'Tianqiao Qu');
INSERT INTO `sys_region` VALUES ('173', '枣庄市', '16', 'Zaozhuang Shi');
INSERT INTO `sys_region` VALUES ('1730', '历城区', '170', 'Licheng Qu');
INSERT INTO `sys_region` VALUES ('1731', '长清区', '170', 'Changqing Qu');
INSERT INTO `sys_region` VALUES ('1732', '平阴县', '170', 'Pingyin Xian');
INSERT INTO `sys_region` VALUES ('1733', '济阳县', '170', 'Jiyang Xian');
INSERT INTO `sys_region` VALUES ('1734', '商河县', '170', 'Shanghe Xian');
INSERT INTO `sys_region` VALUES ('1735', '章丘市', '170', 'Zhangqiu Shi');
INSERT INTO `sys_region` VALUES ('1736', '市辖区', '171', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1737', '市南区', '171', 'Shinan Qu');
INSERT INTO `sys_region` VALUES ('1738', '市北区', '171', 'Shibei Qu');
INSERT INTO `sys_region` VALUES ('1739', '四方区', '171', 'Sifang Qu');
INSERT INTO `sys_region` VALUES ('174', '东营市', '16', 'Dongying Shi');
INSERT INTO `sys_region` VALUES ('1740', '黄岛区', '171', 'Huangdao Qu');
INSERT INTO `sys_region` VALUES ('1741', '崂山区', '171', 'Laoshan Qu');
INSERT INTO `sys_region` VALUES ('1742', '李沧区', '171', 'Licang Qu');
INSERT INTO `sys_region` VALUES ('1743', '城阳区', '171', 'Chengyang Qu');
INSERT INTO `sys_region` VALUES ('1744', '胶州市', '171', 'Jiaozhou Shi');
INSERT INTO `sys_region` VALUES ('1745', '即墨市', '171', 'Jimo Shi');
INSERT INTO `sys_region` VALUES ('1746', '平度市', '171', 'Pingdu Shi');
INSERT INTO `sys_region` VALUES ('1747', '胶南市', '171', 'Jiaonan Shi');
INSERT INTO `sys_region` VALUES ('1748', '莱西市', '171', 'Laixi Shi');
INSERT INTO `sys_region` VALUES ('1749', '市辖区', '172', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('175', '烟台市', '16', 'Yantai Shi');
INSERT INTO `sys_region` VALUES ('1750', '淄川区', '172', 'Zichuan Qu');
INSERT INTO `sys_region` VALUES ('1751', '张店区', '172', 'Zhangdian Qu');
INSERT INTO `sys_region` VALUES ('1752', '博山区', '172', 'Boshan Qu');
INSERT INTO `sys_region` VALUES ('1753', '临淄区', '172', 'Linzi Qu');
INSERT INTO `sys_region` VALUES ('1754', '周村区', '172', 'Zhoucun Qu');
INSERT INTO `sys_region` VALUES ('1755', '桓台县', '172', 'Huantai Xian');
INSERT INTO `sys_region` VALUES ('1756', '高青县', '172', 'Gaoqing Xian');
INSERT INTO `sys_region` VALUES ('1757', '沂源县', '172', 'Yiyuan Xian');
INSERT INTO `sys_region` VALUES ('1758', '市辖区', '173', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1759', '市中区', '173', 'Shizhong Qu');
INSERT INTO `sys_region` VALUES ('176', '潍坊市', '16', 'Weifang Shi');
INSERT INTO `sys_region` VALUES ('1760', '薛城区', '173', 'Xuecheng Qu');
INSERT INTO `sys_region` VALUES ('1761', '峄城区', '173', 'Yicheng Qu');
INSERT INTO `sys_region` VALUES ('1762', '台儿庄区', '173', 'Tai,erzhuang Qu');
INSERT INTO `sys_region` VALUES ('1763', '山亭区', '173', 'Shanting Qu');
INSERT INTO `sys_region` VALUES ('1764', '滕州市', '173', 'Tengzhou Shi');
INSERT INTO `sys_region` VALUES ('1765', '市辖区', '174', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1766', '东营区', '174', 'Dongying Qu');
INSERT INTO `sys_region` VALUES ('1767', '河口区', '174', 'Hekou Qu');
INSERT INTO `sys_region` VALUES ('1768', '垦利县', '174', 'Kenli Xian');
INSERT INTO `sys_region` VALUES ('1769', '利津县', '174', 'Lijin Xian');
INSERT INTO `sys_region` VALUES ('177', '济宁市', '16', 'Jining Shi');
INSERT INTO `sys_region` VALUES ('1770', '广饶县', '174', 'Guangrao Xian ');
INSERT INTO `sys_region` VALUES ('1771', '市辖区', '175', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1772', '芝罘区', '175', 'Zhifu Qu');
INSERT INTO `sys_region` VALUES ('1773', '福山区', '175', 'Fushan Qu');
INSERT INTO `sys_region` VALUES ('1774', '牟平区', '175', 'Muping Qu');
INSERT INTO `sys_region` VALUES ('1775', '莱山区', '175', 'Laishan Qu');
INSERT INTO `sys_region` VALUES ('1776', '长岛县', '175', 'Changdao Xian');
INSERT INTO `sys_region` VALUES ('1777', '龙口市', '175', 'Longkou Shi');
INSERT INTO `sys_region` VALUES ('1778', '莱阳市', '175', 'Laiyang Shi');
INSERT INTO `sys_region` VALUES ('1779', '莱州市', '175', 'Laizhou Shi');
INSERT INTO `sys_region` VALUES ('178', '泰安市', '16', 'Tai,an Shi');
INSERT INTO `sys_region` VALUES ('1780', '蓬莱市', '175', 'Penglai Shi');
INSERT INTO `sys_region` VALUES ('1781', '招远市', '175', 'Zhaoyuan Shi');
INSERT INTO `sys_region` VALUES ('1782', '栖霞市', '175', 'Qixia Shi');
INSERT INTO `sys_region` VALUES ('1783', '海阳市', '175', 'Haiyang Shi');
INSERT INTO `sys_region` VALUES ('1784', '市辖区', '176', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1785', '潍城区', '176', 'Weicheng Qu');
INSERT INTO `sys_region` VALUES ('1786', '寒亭区', '176', 'Hanting Qu');
INSERT INTO `sys_region` VALUES ('1787', '坊子区', '176', 'Fangzi Qu');
INSERT INTO `sys_region` VALUES ('1788', '奎文区', '176', 'Kuiwen Qu');
INSERT INTO `sys_region` VALUES ('1789', '临朐县', '176', 'Linqu Xian');
INSERT INTO `sys_region` VALUES ('179', '威海市', '16', 'Weihai Shi');
INSERT INTO `sys_region` VALUES ('1790', '昌乐县', '176', 'Changle Xian');
INSERT INTO `sys_region` VALUES ('1791', '青州市', '176', 'Qingzhou Shi');
INSERT INTO `sys_region` VALUES ('1792', '诸城市', '176', 'Zhucheng Shi');
INSERT INTO `sys_region` VALUES ('1793', '寿光市', '176', 'Shouguang Shi');
INSERT INTO `sys_region` VALUES ('1794', '安丘市', '176', 'Anqiu Shi');
INSERT INTO `sys_region` VALUES ('1795', '高密市', '176', 'Gaomi Shi');
INSERT INTO `sys_region` VALUES ('1796', '昌邑市', '176', 'Changyi Shi');
INSERT INTO `sys_region` VALUES ('1797', '市辖区', '177', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1798', '市中区', '177', 'Shizhong Qu');
INSERT INTO `sys_region` VALUES ('1799', '任城区', '177', 'Rencheng Qu');
INSERT INTO `sys_region` VALUES ('18', '湖北省', '1', 'Hubei Sheng');
INSERT INTO `sys_region` VALUES ('180', '日照市', '16', 'Rizhao Shi');
INSERT INTO `sys_region` VALUES ('1800', '微山县', '177', 'Weishan Xian');
INSERT INTO `sys_region` VALUES ('1801', '鱼台县', '177', 'Yutai Xian');
INSERT INTO `sys_region` VALUES ('1802', '金乡县', '177', 'Jinxiang Xian');
INSERT INTO `sys_region` VALUES ('1803', '嘉祥县', '177', 'Jiaxiang Xian');
INSERT INTO `sys_region` VALUES ('1804', '汶上县', '177', 'Wenshang Xian');
INSERT INTO `sys_region` VALUES ('1805', '泗水县', '177', 'Sishui Xian');
INSERT INTO `sys_region` VALUES ('1806', '梁山县', '177', 'Liangshan Xian');
INSERT INTO `sys_region` VALUES ('1807', '曲阜市', '177', 'Qufu Shi');
INSERT INTO `sys_region` VALUES ('1808', '兖州市', '177', 'Yanzhou Shi');
INSERT INTO `sys_region` VALUES ('1809', '邹城市', '177', 'Zoucheng Shi');
INSERT INTO `sys_region` VALUES ('181', '莱芜市', '16', 'Laiwu Shi');
INSERT INTO `sys_region` VALUES ('1810', '市辖区', '178', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1811', '泰山区', '178', 'Taishan Qu');
INSERT INTO `sys_region` VALUES ('1812', '岱岳区', '178', 'Daiyue Qu');
INSERT INTO `sys_region` VALUES ('1813', '宁阳县', '178', 'Ningyang Xian');
INSERT INTO `sys_region` VALUES ('1814', '东平县', '178', 'Dongping Xian');
INSERT INTO `sys_region` VALUES ('1815', '新泰市', '178', 'Xintai Shi');
INSERT INTO `sys_region` VALUES ('1816', '肥城市', '178', 'Feicheng Shi');
INSERT INTO `sys_region` VALUES ('1817', '市辖区', '179', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1818', '环翠区', '179', 'Huancui Qu');
INSERT INTO `sys_region` VALUES ('1819', '文登市', '179', 'Wendeng Shi');
INSERT INTO `sys_region` VALUES ('182', '临沂市', '16', 'Linyi Shi');
INSERT INTO `sys_region` VALUES ('1820', '荣成市', '179', 'Rongcheng Shi');
INSERT INTO `sys_region` VALUES ('1821', '乳山市', '179', 'Rushan Shi');
INSERT INTO `sys_region` VALUES ('1822', '市辖区', '180', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1823', '东港区', '180', 'Donggang Qu');
INSERT INTO `sys_region` VALUES ('1824', '岚山区', '180', 'Lanshan Qu');
INSERT INTO `sys_region` VALUES ('1825', '五莲县', '180', 'Wulian Xian');
INSERT INTO `sys_region` VALUES ('1826', '莒县', '180', 'Ju Xian');
INSERT INTO `sys_region` VALUES ('1827', '市辖区', '181', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1828', '莱城区', '181', 'Laicheng Qu');
INSERT INTO `sys_region` VALUES ('1829', '钢城区', '181', 'Gangcheng Qu');
INSERT INTO `sys_region` VALUES ('183', '德州市', '16', 'Dezhou Shi');
INSERT INTO `sys_region` VALUES ('1830', '市辖区', '182', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1831', '兰山区', '182', 'Lanshan Qu');
INSERT INTO `sys_region` VALUES ('1832', '罗庄区', '182', 'Luozhuang Qu');
INSERT INTO `sys_region` VALUES ('1833', '河东区', '182', 'Hedong Qu');
INSERT INTO `sys_region` VALUES ('1834', '沂南县', '182', 'Yinan Xian');
INSERT INTO `sys_region` VALUES ('1835', '郯城县', '182', 'Tancheng Xian');
INSERT INTO `sys_region` VALUES ('1836', '沂水县', '182', 'Yishui Xian');
INSERT INTO `sys_region` VALUES ('1837', '苍山县', '182', 'Cangshan Xian');
INSERT INTO `sys_region` VALUES ('1838', '费县', '182', 'Fei Xian');
INSERT INTO `sys_region` VALUES ('1839', '平邑县', '182', 'Pingyi Xian');
INSERT INTO `sys_region` VALUES ('184', '聊城市', '16', 'Liaocheng Shi');
INSERT INTO `sys_region` VALUES ('1840', '莒南县', '182', 'Junan Xian');
INSERT INTO `sys_region` VALUES ('1841', '蒙阴县', '182', 'Mengyin Xian');
INSERT INTO `sys_region` VALUES ('1842', '临沭县', '182', 'Linshu Xian');
INSERT INTO `sys_region` VALUES ('1843', '市辖区', '183', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1844', '德城区', '183', 'Decheng Qu');
INSERT INTO `sys_region` VALUES ('1845', '陵县', '183', 'Ling Xian');
INSERT INTO `sys_region` VALUES ('1846', '宁津县', '183', 'Ningjin Xian');
INSERT INTO `sys_region` VALUES ('1847', '庆云县', '183', 'Qingyun Xian');
INSERT INTO `sys_region` VALUES ('1848', '临邑县', '183', 'Linyi xian');
INSERT INTO `sys_region` VALUES ('1849', '齐河县', '183', 'Qihe Xian');
INSERT INTO `sys_region` VALUES ('185', '滨州市', '16', 'Binzhou Shi');
INSERT INTO `sys_region` VALUES ('1850', '平原县', '183', 'Pingyuan Xian');
INSERT INTO `sys_region` VALUES ('1851', '夏津县', '183', 'Xiajin Xian');
INSERT INTO `sys_region` VALUES ('1852', '武城县', '183', 'Wucheng Xian');
INSERT INTO `sys_region` VALUES ('1853', '乐陵市', '183', 'Leling Shi');
INSERT INTO `sys_region` VALUES ('1854', '禹城市', '183', 'Yucheng Shi');
INSERT INTO `sys_region` VALUES ('1855', '市辖区', '184', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1856', '东昌府区', '184', 'Dongchangfu Qu');
INSERT INTO `sys_region` VALUES ('1857', '阳谷县', '184', 'Yanggu Xian ');
INSERT INTO `sys_region` VALUES ('1858', '莘县', '184', 'Shen Xian');
INSERT INTO `sys_region` VALUES ('1859', '茌平县', '184', 'Chiping Xian ');
INSERT INTO `sys_region` VALUES ('186', '菏泽市', '16', 'Heze Shi');
INSERT INTO `sys_region` VALUES ('1860', '东阿县', '184', 'Dong,e Xian');
INSERT INTO `sys_region` VALUES ('1861', '冠县', '184', 'Guan Xian');
INSERT INTO `sys_region` VALUES ('1862', '高唐县', '184', 'Gaotang Xian');
INSERT INTO `sys_region` VALUES ('1863', '临清市', '184', 'Linqing Xian');
INSERT INTO `sys_region` VALUES ('1864', '市辖区', '185', '1');
INSERT INTO `sys_region` VALUES ('1865', '滨城区', '185', 'Bincheng Qu');
INSERT INTO `sys_region` VALUES ('1866', '惠民县', '185', 'Huimin Xian');
INSERT INTO `sys_region` VALUES ('1867', '阳信县', '185', 'Yangxin Xian');
INSERT INTO `sys_region` VALUES ('1868', '无棣县', '185', 'Wudi Xian');
INSERT INTO `sys_region` VALUES ('1869', '沾化县', '185', 'Zhanhua Xian');
INSERT INTO `sys_region` VALUES ('187', '郑州市', '17', 'Zhengzhou Shi');
INSERT INTO `sys_region` VALUES ('1870', '博兴县', '185', 'Boxing Xian');
INSERT INTO `sys_region` VALUES ('1871', '邹平县', '185', 'Zouping Xian');
INSERT INTO `sys_region` VALUES ('1873', '牡丹区', '186', 'Mudan Qu');
INSERT INTO `sys_region` VALUES ('1874', '曹县', '186', 'Cao Xian');
INSERT INTO `sys_region` VALUES ('1875', '单县', '186', 'Shan Xian');
INSERT INTO `sys_region` VALUES ('1876', '成武县', '186', 'Chengwu Xian');
INSERT INTO `sys_region` VALUES ('1877', '巨野县', '186', 'Juye Xian');
INSERT INTO `sys_region` VALUES ('1878', '郓城县', '186', 'Yuncheng Xian');
INSERT INTO `sys_region` VALUES ('1879', '鄄城县', '186', 'Juancheng Xian');
INSERT INTO `sys_region` VALUES ('188', '开封市', '17', 'Kaifeng Shi');
INSERT INTO `sys_region` VALUES ('1880', '定陶县', '186', 'Dingtao Xian');
INSERT INTO `sys_region` VALUES ('1881', '东明县', '186', 'Dongming Xian');
INSERT INTO `sys_region` VALUES ('1882', '市辖区', '187', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1883', '中原区', '187', 'Zhongyuan Qu');
INSERT INTO `sys_region` VALUES ('1884', '二七区', '187', 'Erqi Qu');
INSERT INTO `sys_region` VALUES ('1885', '管城回族区', '187', 'Guancheng Huizu Qu');
INSERT INTO `sys_region` VALUES ('1886', '金水区', '187', 'Jinshui Qu');
INSERT INTO `sys_region` VALUES ('1887', '上街区', '187', 'Shangjie Qu');
INSERT INTO `sys_region` VALUES ('1888', '惠济区', '187', 'Mangshan Qu');
INSERT INTO `sys_region` VALUES ('1889', '中牟县', '187', 'Zhongmou Xian');
INSERT INTO `sys_region` VALUES ('189', '洛阳市', '17', 'Luoyang Shi');
INSERT INTO `sys_region` VALUES ('1890', '巩义市', '187', 'Gongyi Shi');
INSERT INTO `sys_region` VALUES ('1891', '荥阳市', '187', 'Xingyang Shi');
INSERT INTO `sys_region` VALUES ('1892', '新密市', '187', 'Xinmi Shi');
INSERT INTO `sys_region` VALUES ('1893', '新郑市', '187', 'Xinzheng Shi');
INSERT INTO `sys_region` VALUES ('1894', '登封市', '187', 'Dengfeng Shi');
INSERT INTO `sys_region` VALUES ('1895', '市辖区', '188', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1896', '龙亭区', '188', 'Longting Qu');
INSERT INTO `sys_region` VALUES ('1897', '顺河回族区', '188', 'Shunhe Huizu Qu');
INSERT INTO `sys_region` VALUES ('1898', '鼓楼区', '188', 'Gulou Qu');
INSERT INTO `sys_region` VALUES ('1899', '禹王台区', '188', 'Yuwangtai Qu');
INSERT INTO `sys_region` VALUES ('19', '湖南省', '1', 'Hunan Sheng');
INSERT INTO `sys_region` VALUES ('190', '平顶山市', '17', 'Pingdingshan Shi');
INSERT INTO `sys_region` VALUES ('1900', '金明区', '188', 'Jinming Qu');
INSERT INTO `sys_region` VALUES ('1901', '杞县', '188', 'Qi Xian');
INSERT INTO `sys_region` VALUES ('1902', '通许县', '188', 'Tongxu Xian');
INSERT INTO `sys_region` VALUES ('1903', '尉氏县', '188', 'Weishi Xian');
INSERT INTO `sys_region` VALUES ('1904', '开封县', '188', 'Kaifeng Xian');
INSERT INTO `sys_region` VALUES ('1905', '兰考县', '188', 'Lankao Xian');
INSERT INTO `sys_region` VALUES ('1906', '市辖区', '189', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1907', '老城区', '189', 'Laocheng Qu');
INSERT INTO `sys_region` VALUES ('1908', '西工区', '189', 'Xigong Qu');
INSERT INTO `sys_region` VALUES ('1909', '瀍河回族区', '189', 'Chanhehuizu Qu');
INSERT INTO `sys_region` VALUES ('191', '安阳市', '17', 'Anyang Shi');
INSERT INTO `sys_region` VALUES ('1910', '涧西区', '189', 'Jianxi Qu');
INSERT INTO `sys_region` VALUES ('1911', '吉利区', '189', 'Jili Qu');
INSERT INTO `sys_region` VALUES ('1912', '洛龙区', '189', 'Luolong Qu');
INSERT INTO `sys_region` VALUES ('1913', '孟津县', '189', 'Mengjin Xian');
INSERT INTO `sys_region` VALUES ('1914', '新安县', '189', 'Xin,an Xian');
INSERT INTO `sys_region` VALUES ('1915', '栾川县', '189', 'Luanchuan Xian');
INSERT INTO `sys_region` VALUES ('1916', '嵩县', '189', 'Song Xian');
INSERT INTO `sys_region` VALUES ('1917', '汝阳县', '189', 'Ruyang Xian');
INSERT INTO `sys_region` VALUES ('1918', '宜阳县', '189', 'Yiyang Xian');
INSERT INTO `sys_region` VALUES ('1919', '洛宁县', '189', 'Luoning Xian');
INSERT INTO `sys_region` VALUES ('192', '鹤壁市', '17', 'Hebi Shi');
INSERT INTO `sys_region` VALUES ('1920', '伊川县', '189', 'Yichuan Xian');
INSERT INTO `sys_region` VALUES ('1921', '偃师市', '189', 'Yanshi Shi');
INSERT INTO `sys_region` VALUES ('1922', '市辖区', '190', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1923', '新华区', '190', 'Xinhua Qu');
INSERT INTO `sys_region` VALUES ('1924', '卫东区', '190', 'Weidong Qu');
INSERT INTO `sys_region` VALUES ('1925', '石龙区', '190', 'Shilong Qu');
INSERT INTO `sys_region` VALUES ('1926', '湛河区', '190', 'Zhanhe Qu');
INSERT INTO `sys_region` VALUES ('1927', '宝丰县', '190', 'Baofeng Xian');
INSERT INTO `sys_region` VALUES ('1928', '叶县', '190', 'Ye Xian');
INSERT INTO `sys_region` VALUES ('1929', '鲁山县', '190', 'Lushan Xian');
INSERT INTO `sys_region` VALUES ('193', '新乡市', '17', 'Xinxiang Shi');
INSERT INTO `sys_region` VALUES ('1930', '郏县', '190', 'Jia Xian');
INSERT INTO `sys_region` VALUES ('1931', '舞钢市', '190', 'Wugang Shi');
INSERT INTO `sys_region` VALUES ('1932', '汝州市', '190', 'Ruzhou Shi');
INSERT INTO `sys_region` VALUES ('1933', '市辖区', '191', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1934', '文峰区', '191', 'Wenfeng Qu');
INSERT INTO `sys_region` VALUES ('1935', '北关区', '191', 'Beiguan Qu');
INSERT INTO `sys_region` VALUES ('1936', '殷都区', '191', 'Yindu Qu');
INSERT INTO `sys_region` VALUES ('1937', '龙安区', '191', 'Longan Qu');
INSERT INTO `sys_region` VALUES ('1938', '安阳县', '191', 'Anyang Xian');
INSERT INTO `sys_region` VALUES ('1939', '汤阴县', '191', 'Tangyin Xian');
INSERT INTO `sys_region` VALUES ('194', '焦作市', '17', 'Jiaozuo Shi');
INSERT INTO `sys_region` VALUES ('1940', '滑县', '191', 'Hua Xian');
INSERT INTO `sys_region` VALUES ('1941', '内黄县', '191', 'Neihuang Xian');
INSERT INTO `sys_region` VALUES ('1942', '林州市', '191', 'Linzhou Shi');
INSERT INTO `sys_region` VALUES ('1943', '市辖区', '192', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1944', '鹤山区', '192', 'Heshan Qu');
INSERT INTO `sys_region` VALUES ('1945', '山城区', '192', 'Shancheng Qu');
INSERT INTO `sys_region` VALUES ('1946', '淇滨区', '192', 'Qibin Qu');
INSERT INTO `sys_region` VALUES ('1947', '浚县', '192', 'Xun Xian');
INSERT INTO `sys_region` VALUES ('1948', '淇县', '192', 'Qi Xian');
INSERT INTO `sys_region` VALUES ('1949', '市辖区', '193', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('195', '濮阳市', '17', 'Puyang Shi');
INSERT INTO `sys_region` VALUES ('1950', '红旗区', '193', 'Hongqi Qu');
INSERT INTO `sys_region` VALUES ('1951', '卫滨区', '193', 'Weibin Qu');
INSERT INTO `sys_region` VALUES ('1952', '凤泉区', '193', 'Fengquan Qu');
INSERT INTO `sys_region` VALUES ('1953', '牧野区', '193', 'Muye Qu');
INSERT INTO `sys_region` VALUES ('1954', '新乡县', '193', 'Xinxiang Xian');
INSERT INTO `sys_region` VALUES ('1955', '获嘉县', '193', 'Huojia Xian');
INSERT INTO `sys_region` VALUES ('1956', '原阳县', '193', 'Yuanyang Xian');
INSERT INTO `sys_region` VALUES ('1957', '延津县', '193', 'Yanjin Xian');
INSERT INTO `sys_region` VALUES ('1958', '封丘县', '193', 'Fengqiu Xian');
INSERT INTO `sys_region` VALUES ('1959', '长垣县', '193', 'Changyuan Xian');
INSERT INTO `sys_region` VALUES ('196', '许昌市', '17', 'Xuchang Shi');
INSERT INTO `sys_region` VALUES ('1960', '卫辉市', '193', 'Weihui Shi');
INSERT INTO `sys_region` VALUES ('1961', '辉县市', '193', 'Huixian Shi');
INSERT INTO `sys_region` VALUES ('1962', '市辖区', '194', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1963', '解放区', '194', 'Jiefang Qu');
INSERT INTO `sys_region` VALUES ('1964', '中站区', '194', 'Zhongzhan Qu');
INSERT INTO `sys_region` VALUES ('1965', '马村区', '194', 'Macun Qu');
INSERT INTO `sys_region` VALUES ('1966', '山阳区', '194', 'Shanyang Qu');
INSERT INTO `sys_region` VALUES ('1967', '修武县', '194', 'Xiuwu Xian');
INSERT INTO `sys_region` VALUES ('1968', '博爱县', '194', 'Bo,ai Xian');
INSERT INTO `sys_region` VALUES ('1969', '武陟县', '194', 'Wuzhi Xian');
INSERT INTO `sys_region` VALUES ('197', '漯河市', '17', 'Luohe Shi');
INSERT INTO `sys_region` VALUES ('1970', '温县', '194', 'Wen Xian');
INSERT INTO `sys_region` VALUES ('1971', '济源市', '194', 'Jiyuan Shi');
INSERT INTO `sys_region` VALUES ('1972', '沁阳市', '194', 'Qinyang Shi');
INSERT INTO `sys_region` VALUES ('1973', '孟州市', '194', 'Mengzhou Shi');
INSERT INTO `sys_region` VALUES ('1974', '市辖区', '195', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1975', '华龙区', '195', 'Hualong Qu');
INSERT INTO `sys_region` VALUES ('1976', '清丰县', '195', 'Qingfeng Xian');
INSERT INTO `sys_region` VALUES ('1977', '南乐县', '195', 'Nanle Xian');
INSERT INTO `sys_region` VALUES ('1978', '范县', '195', 'Fan Xian');
INSERT INTO `sys_region` VALUES ('1979', '台前县', '195', 'Taiqian Xian');
INSERT INTO `sys_region` VALUES ('198', '三门峡市', '17', 'Sanmenxia Shi');
INSERT INTO `sys_region` VALUES ('1980', '濮阳县', '195', 'Puyang Xian');
INSERT INTO `sys_region` VALUES ('1981', '市辖区', '196', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1982', '魏都区', '196', 'Weidu Qu');
INSERT INTO `sys_region` VALUES ('1983', '许昌县', '196', 'Xuchang Xian');
INSERT INTO `sys_region` VALUES ('1984', '鄢陵县', '196', 'Yanling Xian');
INSERT INTO `sys_region` VALUES ('1985', '襄城县', '196', 'Xiangcheng Xian');
INSERT INTO `sys_region` VALUES ('1986', '禹州市', '196', 'Yuzhou Shi');
INSERT INTO `sys_region` VALUES ('1987', '长葛市', '196', 'Changge Shi');
INSERT INTO `sys_region` VALUES ('1988', '市辖区', '197', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1989', '源汇区', '197', 'Yuanhui Qu');
INSERT INTO `sys_region` VALUES ('199', '南阳市', '17', 'Nanyang Shi');
INSERT INTO `sys_region` VALUES ('1990', '郾城区', '197', 'Yancheng Qu');
INSERT INTO `sys_region` VALUES ('1991', '召陵区', '197', 'Zhaoling Qu');
INSERT INTO `sys_region` VALUES ('1992', '舞阳县', '197', 'Wuyang Xian');
INSERT INTO `sys_region` VALUES ('1993', '临颍县', '197', 'Linying Xian');
INSERT INTO `sys_region` VALUES ('1994', '市辖区', '198', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('1995', '湖滨区', '198', 'Hubin Qu');
INSERT INTO `sys_region` VALUES ('1996', '渑池县', '198', 'Mianchi Xian');
INSERT INTO `sys_region` VALUES ('1997', '陕县', '198', 'Shan Xian');
INSERT INTO `sys_region` VALUES ('1998', '卢氏县', '198', 'Lushi Xian');
INSERT INTO `sys_region` VALUES ('1999', '义马市', '198', 'Yima Shi');
INSERT INTO `sys_region` VALUES ('2', '北京市', '1', 'Beijing Shi');
INSERT INTO `sys_region` VALUES ('20', '广东省', '1', 'Guangdong Sheng');
INSERT INTO `sys_region` VALUES ('200', '商丘市', '17', 'Shangqiu Shi');
INSERT INTO `sys_region` VALUES ('2000', '灵宝市', '198', 'Lingbao Shi');
INSERT INTO `sys_region` VALUES ('2001', '市辖区', '199', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2002', '宛城区', '199', 'Wancheng Qu');
INSERT INTO `sys_region` VALUES ('2003', '卧龙区', '199', 'Wolong Qu');
INSERT INTO `sys_region` VALUES ('2004', '南召县', '199', 'Nanzhao Xian');
INSERT INTO `sys_region` VALUES ('2005', '方城县', '199', 'Fangcheng Xian');
INSERT INTO `sys_region` VALUES ('2006', '西峡县', '199', 'Xixia Xian');
INSERT INTO `sys_region` VALUES ('2007', '镇平县', '199', 'Zhenping Xian');
INSERT INTO `sys_region` VALUES ('2008', '内乡县', '199', 'Neixiang Xian');
INSERT INTO `sys_region` VALUES ('2009', '淅川县', '199', 'Xichuan Xian');
INSERT INTO `sys_region` VALUES ('201', '信阳市', '17', 'Xinyang Shi');
INSERT INTO `sys_region` VALUES ('2010', '社旗县', '199', 'Sheqi Xian');
INSERT INTO `sys_region` VALUES ('2011', '唐河县', '199', 'Tanghe Xian');
INSERT INTO `sys_region` VALUES ('2012', '新野县', '199', 'Xinye Xian');
INSERT INTO `sys_region` VALUES ('2013', '桐柏县', '199', 'Tongbai Xian');
INSERT INTO `sys_region` VALUES ('2014', '邓州市', '199', 'Dengzhou Shi');
INSERT INTO `sys_region` VALUES ('2015', '市辖区', '200', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2016', '梁园区', '200', 'Liangyuan Qu');
INSERT INTO `sys_region` VALUES ('2017', '睢阳区', '200', 'Suiyang Qu');
INSERT INTO `sys_region` VALUES ('2018', '民权县', '200', 'Minquan Xian');
INSERT INTO `sys_region` VALUES ('2019', '睢县', '200', 'Sui Xian');
INSERT INTO `sys_region` VALUES ('202', '周口市', '17', 'Zhoukou Shi');
INSERT INTO `sys_region` VALUES ('2020', '宁陵县', '200', 'Ningling Xian');
INSERT INTO `sys_region` VALUES ('2021', '柘城县', '200', 'Zhecheng Xian');
INSERT INTO `sys_region` VALUES ('2022', '虞城县', '200', 'Yucheng Xian');
INSERT INTO `sys_region` VALUES ('2023', '夏邑县', '200', 'Xiayi Xian');
INSERT INTO `sys_region` VALUES ('2024', '永城市', '200', 'Yongcheng Shi');
INSERT INTO `sys_region` VALUES ('2025', '市辖区', '201', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2026', '浉河区', '201', 'Shihe Qu');
INSERT INTO `sys_region` VALUES ('2027', '平桥区', '201', 'Pingqiao Qu');
INSERT INTO `sys_region` VALUES ('2028', '罗山县', '201', 'Luoshan Xian');
INSERT INTO `sys_region` VALUES ('2029', '光山县', '201', 'Guangshan Xian');
INSERT INTO `sys_region` VALUES ('203', '驻马店市', '17', 'Zhumadian Shi');
INSERT INTO `sys_region` VALUES ('2030', '新县', '201', 'Xin Xian');
INSERT INTO `sys_region` VALUES ('2031', '商城县', '201', 'Shangcheng Xian');
INSERT INTO `sys_region` VALUES ('2032', '固始县', '201', 'Gushi Xian');
INSERT INTO `sys_region` VALUES ('2033', '潢川县', '201', 'Huangchuan Xian');
INSERT INTO `sys_region` VALUES ('2034', '淮滨县', '201', 'Huaibin Xian');
INSERT INTO `sys_region` VALUES ('2035', '息县', '201', 'Xi Xian');
INSERT INTO `sys_region` VALUES ('2036', '市辖区', '202', '1');
INSERT INTO `sys_region` VALUES ('2037', '川汇区', '202', 'Chuanhui Qu');
INSERT INTO `sys_region` VALUES ('2038', '扶沟县', '202', 'Fugou Xian');
INSERT INTO `sys_region` VALUES ('2039', '西华县', '202', 'Xihua Xian');
INSERT INTO `sys_region` VALUES ('204', '武汉市', '18', 'Wuhan Shi');
INSERT INTO `sys_region` VALUES ('2040', '商水县', '202', 'Shangshui Xian');
INSERT INTO `sys_region` VALUES ('2041', '沈丘县', '202', 'Shenqiu Xian');
INSERT INTO `sys_region` VALUES ('2042', '郸城县', '202', 'Dancheng Xian');
INSERT INTO `sys_region` VALUES ('2043', '淮阳县', '202', 'Huaiyang Xian');
INSERT INTO `sys_region` VALUES ('2044', '太康县', '202', 'Taikang Xian');
INSERT INTO `sys_region` VALUES ('2045', '鹿邑县', '202', 'Luyi Xian');
INSERT INTO `sys_region` VALUES ('2046', '项城市', '202', 'Xiangcheng Shi');
INSERT INTO `sys_region` VALUES ('2047', '市辖区', '203', '1');
INSERT INTO `sys_region` VALUES ('2048', '驿城区', '203', 'Yicheng Qu');
INSERT INTO `sys_region` VALUES ('2049', '西平县', '203', 'Xiping Xian');
INSERT INTO `sys_region` VALUES ('205', '黄石市', '18', 'Huangshi Shi');
INSERT INTO `sys_region` VALUES ('2050', '上蔡县', '203', 'Shangcai Xian');
INSERT INTO `sys_region` VALUES ('2051', '平舆县', '203', 'Pingyu Xian');
INSERT INTO `sys_region` VALUES ('2052', '正阳县', '203', 'Zhengyang Xian');
INSERT INTO `sys_region` VALUES ('2053', '确山县', '203', 'Queshan Xian');
INSERT INTO `sys_region` VALUES ('2054', '泌阳县', '203', 'Biyang Xian');
INSERT INTO `sys_region` VALUES ('2055', '汝南县', '203', 'Runan Xian');
INSERT INTO `sys_region` VALUES ('2056', '遂平县', '203', 'Suiping Xian');
INSERT INTO `sys_region` VALUES ('2057', '新蔡县', '203', 'Xincai Xian');
INSERT INTO `sys_region` VALUES ('2058', '市辖区', '204', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2059', '江岸区', '204', 'Jiang,an Qu');
INSERT INTO `sys_region` VALUES ('206', '十堰市', '18', 'Shiyan Shi');
INSERT INTO `sys_region` VALUES ('2060', '江汉区', '204', 'Jianghan Qu');
INSERT INTO `sys_region` VALUES ('2061', '硚口区', '204', 'Qiaokou Qu');
INSERT INTO `sys_region` VALUES ('2062', '汉阳区', '204', 'Hanyang Qu');
INSERT INTO `sys_region` VALUES ('2063', '武昌区', '204', 'Wuchang Qu');
INSERT INTO `sys_region` VALUES ('2064', '青山区', '204', 'Qingshan Qu');
INSERT INTO `sys_region` VALUES ('2065', '洪山区', '204', 'Hongshan Qu');
INSERT INTO `sys_region` VALUES ('2066', '东西湖区', '204', 'Dongxihu Qu');
INSERT INTO `sys_region` VALUES ('2067', '汉南区', '204', 'Hannan Qu');
INSERT INTO `sys_region` VALUES ('2068', '蔡甸区', '204', 'Caidian Qu');
INSERT INTO `sys_region` VALUES ('2069', '江夏区', '204', 'Jiangxia Qu');
INSERT INTO `sys_region` VALUES ('207', '宜昌市', '18', 'Yichang Shi');
INSERT INTO `sys_region` VALUES ('2070', '黄陂区', '204', 'Huangpi Qu');
INSERT INTO `sys_region` VALUES ('2071', '新洲区', '204', 'Xinzhou Qu');
INSERT INTO `sys_region` VALUES ('2072', '市辖区', '205', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2073', '黄石港区', '205', 'Huangshigang Qu');
INSERT INTO `sys_region` VALUES ('2074', '西塞山区', '205', 'Xisaishan Qu');
INSERT INTO `sys_region` VALUES ('2075', '下陆区', '205', 'Xialu Qu');
INSERT INTO `sys_region` VALUES ('2076', '铁山区', '205', 'Tieshan Qu');
INSERT INTO `sys_region` VALUES ('2077', '阳新县', '205', 'Yangxin Xian');
INSERT INTO `sys_region` VALUES ('2078', '大冶市', '205', 'Daye Shi');
INSERT INTO `sys_region` VALUES ('2079', '市辖区', '206', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('208', '襄樊市', '18', 'Xiangfan Shi');
INSERT INTO `sys_region` VALUES ('2080', '茅箭区', '206', 'Maojian Qu');
INSERT INTO `sys_region` VALUES ('2081', '张湾区', '206', 'Zhangwan Qu');
INSERT INTO `sys_region` VALUES ('2082', '郧县', '206', 'Yun Xian');
INSERT INTO `sys_region` VALUES ('2083', '郧西县', '206', 'Yunxi Xian');
INSERT INTO `sys_region` VALUES ('2084', '竹山县', '206', 'Zhushan Xian');
INSERT INTO `sys_region` VALUES ('2085', '竹溪县', '206', 'Zhuxi Xian');
INSERT INTO `sys_region` VALUES ('2086', '房县', '206', 'Fang Xian');
INSERT INTO `sys_region` VALUES ('2087', '丹江口市', '206', 'Danjiangkou Shi');
INSERT INTO `sys_region` VALUES ('2088', '市辖区', '207', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2089', '西陵区', '207', 'Xiling Qu');
INSERT INTO `sys_region` VALUES ('209', '鄂州市', '18', 'Ezhou Shi');
INSERT INTO `sys_region` VALUES ('2090', '伍家岗区', '207', 'Wujiagang Qu');
INSERT INTO `sys_region` VALUES ('2091', '点军区', '207', 'Dianjun Qu');
INSERT INTO `sys_region` VALUES ('2092', '猇亭区', '207', 'Xiaoting Qu');
INSERT INTO `sys_region` VALUES ('2093', '夷陵区', '207', 'Yiling Qu');
INSERT INTO `sys_region` VALUES ('2094', '远安县', '207', 'Yuan,an Xian');
INSERT INTO `sys_region` VALUES ('2095', '兴山县', '207', 'Xingshan Xian');
INSERT INTO `sys_region` VALUES ('2096', '秭归县', '207', 'Zigui Xian');
INSERT INTO `sys_region` VALUES ('2097', '长阳土家族自治县', '207', 'Changyang Tujiazu Zizhixian');
INSERT INTO `sys_region` VALUES ('2098', '五峰土家族自治县', '207', 'Wufeng Tujiazu Zizhixian');
INSERT INTO `sys_region` VALUES ('2099', '宜都市', '207', 'Yidu Shi');
INSERT INTO `sys_region` VALUES ('21', '广西壮族自治区', '1', 'Guangxi Zhuangzu Zizhiqu');
INSERT INTO `sys_region` VALUES ('210', '荆门市', '18', 'Jingmen Shi');
INSERT INTO `sys_region` VALUES ('2100', '当阳市', '207', 'Dangyang Shi');
INSERT INTO `sys_region` VALUES ('2101', '枝江市', '207', 'Zhijiang Shi');
INSERT INTO `sys_region` VALUES ('2102', '市辖区', '208', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2103', '襄城区', '208', 'Xiangcheng Qu');
INSERT INTO `sys_region` VALUES ('2104', '樊城区', '208', 'Fancheng Qu');
INSERT INTO `sys_region` VALUES ('2105', '襄阳区', '208', 'Xiangyang Qu');
INSERT INTO `sys_region` VALUES ('2106', '南漳县', '208', 'Nanzhang Xian');
INSERT INTO `sys_region` VALUES ('2107', '谷城县', '208', 'Gucheng Xian');
INSERT INTO `sys_region` VALUES ('2108', '保康县', '208', 'Baokang Xian');
INSERT INTO `sys_region` VALUES ('2109', '老河口市', '208', 'Laohekou Shi');
INSERT INTO `sys_region` VALUES ('211', '孝感市', '18', 'Xiaogan Shi');
INSERT INTO `sys_region` VALUES ('2110', '枣阳市', '208', 'Zaoyang Shi');
INSERT INTO `sys_region` VALUES ('2111', '宜城市', '208', 'Yicheng Shi');
INSERT INTO `sys_region` VALUES ('2112', '市辖区', '209', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2113', '梁子湖区', '209', 'Liangzihu Qu');
INSERT INTO `sys_region` VALUES ('2114', '华容区', '209', 'Huarong Qu');
INSERT INTO `sys_region` VALUES ('2115', '鄂城区', '209', 'Echeng Qu');
INSERT INTO `sys_region` VALUES ('2116', '市辖区', '210', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2117', '东宝区', '210', 'Dongbao Qu');
INSERT INTO `sys_region` VALUES ('2118', '掇刀区', '210', 'Duodao Qu');
INSERT INTO `sys_region` VALUES ('2119', '京山县', '210', 'Jingshan Xian');
INSERT INTO `sys_region` VALUES ('212', '荆州市', '18', 'Jingzhou Shi');
INSERT INTO `sys_region` VALUES ('2120', '沙洋县', '210', 'Shayang Xian');
INSERT INTO `sys_region` VALUES ('2121', '钟祥市', '210', 'Zhongxiang Shi');
INSERT INTO `sys_region` VALUES ('2122', '市辖区', '211', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2123', '孝南区', '211', 'Xiaonan Qu');
INSERT INTO `sys_region` VALUES ('2124', '孝昌县', '211', 'Xiaochang Xian');
INSERT INTO `sys_region` VALUES ('2125', '大悟县', '211', 'Dawu Xian');
INSERT INTO `sys_region` VALUES ('2126', '云梦县', '211', 'Yunmeng Xian');
INSERT INTO `sys_region` VALUES ('2127', '应城市', '211', 'Yingcheng Shi');
INSERT INTO `sys_region` VALUES ('2128', '安陆市', '211', 'Anlu Shi');
INSERT INTO `sys_region` VALUES ('2129', '汉川市', '211', 'Hanchuan Shi');
INSERT INTO `sys_region` VALUES ('213', '黄冈市', '18', 'Huanggang Shi');
INSERT INTO `sys_region` VALUES ('2130', '市辖区', '212', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2131', '沙市区', '212', 'Shashi Qu');
INSERT INTO `sys_region` VALUES ('2132', '荆州区', '212', 'Jingzhou Qu');
INSERT INTO `sys_region` VALUES ('2133', '公安县', '212', 'Gong,an Xian');
INSERT INTO `sys_region` VALUES ('2134', '监利县', '212', 'Jianli Xian');
INSERT INTO `sys_region` VALUES ('2135', '江陵县', '212', 'Jiangling Xian');
INSERT INTO `sys_region` VALUES ('2136', '石首市', '212', 'Shishou Shi');
INSERT INTO `sys_region` VALUES ('2137', '洪湖市', '212', 'Honghu Shi');
INSERT INTO `sys_region` VALUES ('2138', '松滋市', '212', 'Songzi Shi');
INSERT INTO `sys_region` VALUES ('2139', '市辖区', '213', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('214', '咸宁市', '18', 'Xianning Xian');
INSERT INTO `sys_region` VALUES ('2140', '黄州区', '213', 'Huangzhou Qu');
INSERT INTO `sys_region` VALUES ('2141', '团风县', '213', 'Tuanfeng Xian');
INSERT INTO `sys_region` VALUES ('2142', '红安县', '213', 'Hong,an Xian');
INSERT INTO `sys_region` VALUES ('2143', '罗田县', '213', 'Luotian Xian');
INSERT INTO `sys_region` VALUES ('2144', '英山县', '213', 'Yingshan Xian');
INSERT INTO `sys_region` VALUES ('2145', '浠水县', '213', 'Xishui Xian');
INSERT INTO `sys_region` VALUES ('2146', '蕲春县', '213', 'Qichun Xian');
INSERT INTO `sys_region` VALUES ('2147', '黄梅县', '213', 'Huangmei Xian');
INSERT INTO `sys_region` VALUES ('2148', '麻城市', '213', 'Macheng Shi');
INSERT INTO `sys_region` VALUES ('2149', '武穴市', '213', 'Wuxue Shi');
INSERT INTO `sys_region` VALUES ('215', '随州市', '18', 'Suizhou Shi');
INSERT INTO `sys_region` VALUES ('2150', '市辖区', '214', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2151', '咸安区', '214', 'Xian,an Qu');
INSERT INTO `sys_region` VALUES ('2152', '嘉鱼县', '214', 'Jiayu Xian');
INSERT INTO `sys_region` VALUES ('2153', '通城县', '214', 'Tongcheng Xian');
INSERT INTO `sys_region` VALUES ('2154', '崇阳县', '214', 'Chongyang Xian');
INSERT INTO `sys_region` VALUES ('2155', '通山县', '214', 'Tongshan Xian');
INSERT INTO `sys_region` VALUES ('2156', '赤壁市', '214', 'Chibi Shi');
INSERT INTO `sys_region` VALUES ('2157', '市辖区', '215', '1');
INSERT INTO `sys_region` VALUES ('2158', '曾都区', '215', 'Zengdu Qu');
INSERT INTO `sys_region` VALUES ('2159', '广水市', '215', 'Guangshui Shi');
INSERT INTO `sys_region` VALUES ('216', '恩施土家族苗族自治州', '18', 'Enshi Tujiazu Miaozu Zizhizhou');
INSERT INTO `sys_region` VALUES ('2160', '恩施市', '216', 'Enshi Shi');
INSERT INTO `sys_region` VALUES ('2161', '利川市', '216', 'Lichuan Shi');
INSERT INTO `sys_region` VALUES ('2162', '建始县', '216', 'Jianshi Xian');
INSERT INTO `sys_region` VALUES ('2163', '巴东县', '216', 'Badong Xian');
INSERT INTO `sys_region` VALUES ('2164', '宣恩县', '216', 'Xuan,en Xian');
INSERT INTO `sys_region` VALUES ('2165', '咸丰县', '216', 'Xianfeng Xian');
INSERT INTO `sys_region` VALUES ('2166', '来凤县', '216', 'Laifeng Xian');
INSERT INTO `sys_region` VALUES ('2167', '鹤峰县', '216', 'Hefeng Xian');
INSERT INTO `sys_region` VALUES ('2168', '仙桃市', '217', 'Xiantao Shi');
INSERT INTO `sys_region` VALUES ('2169', '潜江市', '217', 'Qianjiang Shi');
INSERT INTO `sys_region` VALUES ('217', '省直辖县级行政区划', '18', 'shengzhixiaxianjixingzhengquhua');
INSERT INTO `sys_region` VALUES ('2170', '天门市', '217', 'Tianmen Shi');
INSERT INTO `sys_region` VALUES ('2171', '神农架林区', '217', 'Shennongjia Linqu');
INSERT INTO `sys_region` VALUES ('2172', '市辖区', '218', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2173', '芙蓉区', '218', 'Furong Qu');
INSERT INTO `sys_region` VALUES ('2174', '天心区', '218', 'Tianxin Qu');
INSERT INTO `sys_region` VALUES ('2175', '岳麓区', '218', 'Yuelu Qu');
INSERT INTO `sys_region` VALUES ('2176', '开福区', '218', 'Kaifu Qu');
INSERT INTO `sys_region` VALUES ('2177', '雨花区', '218', 'Yuhua Qu');
INSERT INTO `sys_region` VALUES ('2178', '长沙县', '218', 'Changsha Xian');
INSERT INTO `sys_region` VALUES ('2179', '望城县', '218', 'Wangcheng Xian');
INSERT INTO `sys_region` VALUES ('218', '长沙市', '19', 'Changsha Shi');
INSERT INTO `sys_region` VALUES ('2180', '宁乡县', '218', 'Ningxiang Xian');
INSERT INTO `sys_region` VALUES ('2181', '浏阳市', '218', 'Liuyang Shi');
INSERT INTO `sys_region` VALUES ('2182', '市辖区', '219', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2183', '荷塘区', '219', 'Hetang Qu');
INSERT INTO `sys_region` VALUES ('2184', '芦淞区', '219', 'Lusong Qu');
INSERT INTO `sys_region` VALUES ('2185', '石峰区', '219', 'Shifeng Qu');
INSERT INTO `sys_region` VALUES ('2186', '天元区', '219', 'Tianyuan Qu');
INSERT INTO `sys_region` VALUES ('2187', '株洲县', '219', 'Zhuzhou Xian');
INSERT INTO `sys_region` VALUES ('2188', '攸县', '219', 'You Xian');
INSERT INTO `sys_region` VALUES ('2189', '茶陵县', '219', 'Chaling Xian');
INSERT INTO `sys_region` VALUES ('219', '株洲市', '19', 'Zhuzhou Shi');
INSERT INTO `sys_region` VALUES ('2190', '炎陵县', '219', 'Yanling Xian');
INSERT INTO `sys_region` VALUES ('2191', '醴陵市', '219', 'Liling Shi');
INSERT INTO `sys_region` VALUES ('2192', '市辖区', '220', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2193', '雨湖区', '220', 'Yuhu Qu');
INSERT INTO `sys_region` VALUES ('2194', '岳塘区', '220', 'Yuetang Qu');
INSERT INTO `sys_region` VALUES ('2195', '湘潭县', '220', 'Xiangtan Qu');
INSERT INTO `sys_region` VALUES ('2196', '湘乡市', '220', 'Xiangxiang Shi');
INSERT INTO `sys_region` VALUES ('2197', '韶山市', '220', 'Shaoshan Shi');
INSERT INTO `sys_region` VALUES ('2198', '市辖区', '221', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2199', '珠晖区', '221', 'Zhuhui Qu');
INSERT INTO `sys_region` VALUES ('22', '海南省', '1', 'Hainan Sheng');
INSERT INTO `sys_region` VALUES ('220', '湘潭市', '19', 'Xiangtan Shi');
INSERT INTO `sys_region` VALUES ('2200', '雁峰区', '221', 'Yanfeng Qu');
INSERT INTO `sys_region` VALUES ('2201', '石鼓区', '221', 'Shigu Qu');
INSERT INTO `sys_region` VALUES ('2202', '蒸湘区', '221', 'Zhengxiang Qu');
INSERT INTO `sys_region` VALUES ('2203', '南岳区', '221', 'Nanyue Qu');
INSERT INTO `sys_region` VALUES ('2204', '衡阳县', '221', 'Hengyang Xian');
INSERT INTO `sys_region` VALUES ('2205', '衡南县', '221', 'Hengnan Xian');
INSERT INTO `sys_region` VALUES ('2206', '衡山县', '221', 'Hengshan Xian');
INSERT INTO `sys_region` VALUES ('2207', '衡东县', '221', 'Hengdong Xian');
INSERT INTO `sys_region` VALUES ('2208', '祁东县', '221', 'Qidong Xian');
INSERT INTO `sys_region` VALUES ('2209', '耒阳市', '221', 'Leiyang Shi');
INSERT INTO `sys_region` VALUES ('221', '衡阳市', '19', 'Hengyang Shi');
INSERT INTO `sys_region` VALUES ('2210', '常宁市', '221', 'Changning Shi');
INSERT INTO `sys_region` VALUES ('2211', '市辖区', '222', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2212', '双清区', '222', 'Shuangqing Qu');
INSERT INTO `sys_region` VALUES ('2213', '大祥区', '222', 'Daxiang Qu');
INSERT INTO `sys_region` VALUES ('2214', '北塔区', '222', 'Beita Qu');
INSERT INTO `sys_region` VALUES ('2215', '邵东县', '222', 'Shaodong Xian');
INSERT INTO `sys_region` VALUES ('2216', '新邵县', '222', 'Xinshao Xian');
INSERT INTO `sys_region` VALUES ('2217', '邵阳县', '222', 'Shaoyang Xian');
INSERT INTO `sys_region` VALUES ('2218', '隆回县', '222', 'Longhui Xian');
INSERT INTO `sys_region` VALUES ('2219', '洞口县', '222', 'Dongkou Xian');
INSERT INTO `sys_region` VALUES ('222', '邵阳市', '19', 'Shaoyang Shi');
INSERT INTO `sys_region` VALUES ('2220', '绥宁县', '222', 'Suining Xian');
INSERT INTO `sys_region` VALUES ('2221', '新宁县', '222', 'Xinning Xian');
INSERT INTO `sys_region` VALUES ('2222', '城步苗族自治县', '222', 'Chengbu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2223', '武冈市', '222', 'Wugang Shi');
INSERT INTO `sys_region` VALUES ('2224', '市辖区', '223', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2225', '岳阳楼区', '223', 'Yueyanglou Qu');
INSERT INTO `sys_region` VALUES ('2226', '云溪区', '223', 'Yunxi Qu');
INSERT INTO `sys_region` VALUES ('2227', '君山区', '223', 'Junshan Qu');
INSERT INTO `sys_region` VALUES ('2228', '岳阳县', '223', 'Yueyang Xian');
INSERT INTO `sys_region` VALUES ('2229', '华容县', '223', 'Huarong Xian');
INSERT INTO `sys_region` VALUES ('223', '岳阳市', '19', 'Yueyang Shi');
INSERT INTO `sys_region` VALUES ('2230', '湘阴县', '223', 'Xiangyin Xian');
INSERT INTO `sys_region` VALUES ('2231', '平江县', '223', 'Pingjiang Xian');
INSERT INTO `sys_region` VALUES ('2232', '汨罗市', '223', 'Miluo Shi');
INSERT INTO `sys_region` VALUES ('2233', '临湘市', '223', 'Linxiang Shi');
INSERT INTO `sys_region` VALUES ('2234', '市辖区', '224', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2235', '武陵区', '224', 'Wuling Qu');
INSERT INTO `sys_region` VALUES ('2236', '鼎城区', '224', 'Dingcheng Qu');
INSERT INTO `sys_region` VALUES ('2237', '安乡县', '224', 'Anxiang Xian');
INSERT INTO `sys_region` VALUES ('2238', '汉寿县', '224', 'Hanshou Xian');
INSERT INTO `sys_region` VALUES ('2239', '澧县', '224', 'Li Xian');
INSERT INTO `sys_region` VALUES ('224', '常德市', '19', 'Changde Shi');
INSERT INTO `sys_region` VALUES ('2240', '临澧县', '224', 'Linli Xian');
INSERT INTO `sys_region` VALUES ('2241', '桃源县', '224', 'Taoyuan Xian');
INSERT INTO `sys_region` VALUES ('2242', '石门县', '224', 'Shimen Xian');
INSERT INTO `sys_region` VALUES ('2243', '津市市', '224', 'Jinshi Shi');
INSERT INTO `sys_region` VALUES ('2244', '市辖区', '225', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2245', '永定区', '225', 'Yongding Qu');
INSERT INTO `sys_region` VALUES ('2246', '武陵源区', '225', 'Wulingyuan Qu');
INSERT INTO `sys_region` VALUES ('2247', '慈利县', '225', 'Cili Xian');
INSERT INTO `sys_region` VALUES ('2248', '桑植县', '225', 'Sangzhi Xian');
INSERT INTO `sys_region` VALUES ('2249', '市辖区', '226', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('225', '张家界市', '19', 'Zhangjiajie Shi');
INSERT INTO `sys_region` VALUES ('2250', '资阳区', '226', 'Ziyang Qu');
INSERT INTO `sys_region` VALUES ('2251', '赫山区', '226', 'Heshan Qu');
INSERT INTO `sys_region` VALUES ('2252', '南县', '226', 'Nan Xian');
INSERT INTO `sys_region` VALUES ('2253', '桃江县', '226', 'Taojiang Xian');
INSERT INTO `sys_region` VALUES ('2254', '安化县', '226', 'Anhua Xian');
INSERT INTO `sys_region` VALUES ('2255', '沅江市', '226', 'Yuanjiang Shi');
INSERT INTO `sys_region` VALUES ('2256', '市辖区', '227', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2257', '北湖区', '227', 'Beihu Qu');
INSERT INTO `sys_region` VALUES ('2258', '苏仙区', '227', 'Suxian Qu');
INSERT INTO `sys_region` VALUES ('2259', '桂阳县', '227', 'Guiyang Xian');
INSERT INTO `sys_region` VALUES ('226', '益阳市', '19', 'Yiyang Shi');
INSERT INTO `sys_region` VALUES ('2260', '宜章县', '227', 'yizhang Xian');
INSERT INTO `sys_region` VALUES ('2261', '永兴县', '227', 'Yongxing Xian');
INSERT INTO `sys_region` VALUES ('2262', '嘉禾县', '227', 'Jiahe Xian');
INSERT INTO `sys_region` VALUES ('2263', '临武县', '227', 'Linwu Xian');
INSERT INTO `sys_region` VALUES ('2264', '汝城县', '227', 'Rucheng Xian');
INSERT INTO `sys_region` VALUES ('2265', '桂东县', '227', 'Guidong Xian');
INSERT INTO `sys_region` VALUES ('2266', '安仁县', '227', 'Anren Xian');
INSERT INTO `sys_region` VALUES ('2267', '资兴市', '227', 'Zixing Shi');
INSERT INTO `sys_region` VALUES ('2268', '市辖区', '228', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('227', '郴州市', '19', 'Chenzhou Shi');
INSERT INTO `sys_region` VALUES ('2270', '冷水滩区', '228', 'Lengshuitan Qu');
INSERT INTO `sys_region` VALUES ('2271', '祁阳县', '228', 'Qiyang Xian');
INSERT INTO `sys_region` VALUES ('2272', '东安县', '228', 'Dong,an Xian');
INSERT INTO `sys_region` VALUES ('2273', '双牌县', '228', 'Shuangpai Xian');
INSERT INTO `sys_region` VALUES ('2274', '道县', '228', 'Dao Xian');
INSERT INTO `sys_region` VALUES ('2275', '江永县', '228', 'Jiangyong Xian');
INSERT INTO `sys_region` VALUES ('2276', '宁远县', '228', 'Ningyuan Xian');
INSERT INTO `sys_region` VALUES ('2277', '蓝山县', '228', 'Lanshan Xian');
INSERT INTO `sys_region` VALUES ('2278', '新田县', '228', 'Xintian Xian');
INSERT INTO `sys_region` VALUES ('2279', '江华瑶族自治县', '228', 'Jianghua Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('228', '永州市', '19', 'Yongzhou Shi');
INSERT INTO `sys_region` VALUES ('2280', '市辖区', '229', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2281', '鹤城区', '229', 'Hecheng Qu');
INSERT INTO `sys_region` VALUES ('2282', '中方县', '229', 'Zhongfang Xian');
INSERT INTO `sys_region` VALUES ('2283', '沅陵县', '229', 'Yuanling Xian');
INSERT INTO `sys_region` VALUES ('2284', '辰溪县', '229', 'Chenxi Xian');
INSERT INTO `sys_region` VALUES ('2285', '溆浦县', '229', 'Xupu Xian');
INSERT INTO `sys_region` VALUES ('2286', '会同县', '229', 'Huitong Xian');
INSERT INTO `sys_region` VALUES ('2287', '麻阳苗族自治县', '229', 'Mayang Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2288', '新晃侗族自治县', '229', 'Xinhuang Dongzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2289', '芷江侗族自治县', '229', 'Zhijiang Dongzu Zizhixian');
INSERT INTO `sys_region` VALUES ('229', '怀化市', '19', 'Huaihua Shi');
INSERT INTO `sys_region` VALUES ('2290', '靖州苗族侗族自治县', '229', 'Jingzhou Miaozu Dongzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2291', '通道侗族自治县', '229', 'Tongdao Dongzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2292', '洪江市', '229', 'Hongjiang Shi');
INSERT INTO `sys_region` VALUES ('2293', '市辖区', '230', '1');
INSERT INTO `sys_region` VALUES ('2294', '娄星区', '230', 'Louxing Qu');
INSERT INTO `sys_region` VALUES ('2295', '双峰县', '230', 'Shuangfeng Xian');
INSERT INTO `sys_region` VALUES ('2296', '新化县', '230', 'Xinhua Xian');
INSERT INTO `sys_region` VALUES ('2297', '冷水江市', '230', 'Lengshuijiang Shi');
INSERT INTO `sys_region` VALUES ('2298', '涟源市', '230', 'Lianyuan Shi');
INSERT INTO `sys_region` VALUES ('2299', '吉首市', '231', 'Jishou Shi');
INSERT INTO `sys_region` VALUES ('23', '重庆市', '1', 'Chongqing Shi');
INSERT INTO `sys_region` VALUES ('230', '娄底市', '19', 'Loudi Shi');
INSERT INTO `sys_region` VALUES ('2300', '泸溪县', '231', 'Luxi Xian');
INSERT INTO `sys_region` VALUES ('2301', '凤凰县', '231', 'Fenghuang Xian');
INSERT INTO `sys_region` VALUES ('2302', '花垣县', '231', 'Huayuan Xian');
INSERT INTO `sys_region` VALUES ('2303', '保靖县', '231', 'Baojing Xian');
INSERT INTO `sys_region` VALUES ('2304', '古丈县', '231', 'Guzhang Xian');
INSERT INTO `sys_region` VALUES ('2305', '永顺县', '231', 'Yongshun Xian');
INSERT INTO `sys_region` VALUES ('2306', '龙山县', '231', 'Longshan Xian');
INSERT INTO `sys_region` VALUES ('2307', '市辖区', '232', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2308', '南沙区', '232', 'Nansha Qu');
INSERT INTO `sys_region` VALUES ('2309', '荔湾区', '232', 'Liwan Qu');
INSERT INTO `sys_region` VALUES ('231', '湘西土家族苗族自治州', '19', 'Xiangxi Tujiazu Miaozu Zizhizhou ');
INSERT INTO `sys_region` VALUES ('2310', '越秀区', '232', 'Yuexiu Qu');
INSERT INTO `sys_region` VALUES ('2311', '海珠区', '232', 'Haizhu Qu');
INSERT INTO `sys_region` VALUES ('2312', '天河区', '232', 'Tianhe Qu');
INSERT INTO `sys_region` VALUES ('2313', '萝岗区', '232', 'Luogang Qu');
INSERT INTO `sys_region` VALUES ('2314', '白云区', '232', 'Baiyun Qu');
INSERT INTO `sys_region` VALUES ('2315', '黄埔区', '232', 'Huangpu Qu');
INSERT INTO `sys_region` VALUES ('2316', '番禺区', '232', 'Panyu Qu');
INSERT INTO `sys_region` VALUES ('2317', '花都区', '232', 'Huadu Qu');
INSERT INTO `sys_region` VALUES ('2318', '增城市', '232', 'Zengcheng Shi');
INSERT INTO `sys_region` VALUES ('2319', '从化市', '232', 'Conghua Shi');
INSERT INTO `sys_region` VALUES ('232', '广州市', '20', 'Guangzhou Shi');
INSERT INTO `sys_region` VALUES ('2320', '市辖区', '233', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2321', '武江区', '233', 'Wujiang Qu');
INSERT INTO `sys_region` VALUES ('2322', '浈江区', '233', 'Zhenjiang Qu');
INSERT INTO `sys_region` VALUES ('2323', '曲江区', '233', 'Qujiang Qu');
INSERT INTO `sys_region` VALUES ('2324', '始兴县', '233', 'Shixing Xian');
INSERT INTO `sys_region` VALUES ('2325', '仁化县', '233', 'Renhua Xian');
INSERT INTO `sys_region` VALUES ('2326', '翁源县', '233', 'Wengyuan Xian');
INSERT INTO `sys_region` VALUES ('2327', '乳源瑶族自治县', '233', 'Ruyuan Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2328', '新丰县', '233', 'Xinfeng Xian');
INSERT INTO `sys_region` VALUES ('2329', '乐昌市', '233', 'Lechang Shi');
INSERT INTO `sys_region` VALUES ('233', '韶关市', '20', 'Shaoguan Shi');
INSERT INTO `sys_region` VALUES ('2330', '南雄市', '233', 'Nanxiong Shi');
INSERT INTO `sys_region` VALUES ('2331', '市辖区', '234', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2332', '罗湖区', '234', 'Luohu Qu');
INSERT INTO `sys_region` VALUES ('2333', '福田区', '234', 'Futian Qu');
INSERT INTO `sys_region` VALUES ('2334', '南山区', '234', 'Nanshan Qu');
INSERT INTO `sys_region` VALUES ('2335', '宝安区', '234', 'Bao,an Qu');
INSERT INTO `sys_region` VALUES ('2336', '龙岗区', '234', 'Longgang Qu');
INSERT INTO `sys_region` VALUES ('2337', '盐田区', '234', 'Yan Tian Qu');
INSERT INTO `sys_region` VALUES ('2338', '市辖区', '235', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2339', '香洲区', '235', 'Xiangzhou Qu');
INSERT INTO `sys_region` VALUES ('234', '深圳市', '20', 'Shenzhen Shi');
INSERT INTO `sys_region` VALUES ('2340', '斗门区', '235', 'Doumen Qu');
INSERT INTO `sys_region` VALUES ('2341', '金湾区', '235', 'Jinwan Qu');
INSERT INTO `sys_region` VALUES ('2342', '市辖区', '236', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2343', '龙湖区', '236', 'Longhu Qu');
INSERT INTO `sys_region` VALUES ('2344', '金平区', '236', 'Jinping Qu');
INSERT INTO `sys_region` VALUES ('2345', '濠江区', '236', 'Haojiang Qu');
INSERT INTO `sys_region` VALUES ('2346', '潮阳区', '236', 'Chaoyang  Qu');
INSERT INTO `sys_region` VALUES ('2347', '潮南区', '236', 'Chaonan Qu');
INSERT INTO `sys_region` VALUES ('2348', '澄海区', '236', 'Chenghai QU');
INSERT INTO `sys_region` VALUES ('2349', '南澳县', '236', 'Nan,ao Xian');
INSERT INTO `sys_region` VALUES ('235', '珠海市', '20', 'Zhuhai Shi');
INSERT INTO `sys_region` VALUES ('2350', '市辖区', '237', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2351', '禅城区', '237', 'Chancheng Qu');
INSERT INTO `sys_region` VALUES ('2352', '南海区', '237', 'Nanhai Shi');
INSERT INTO `sys_region` VALUES ('2353', '顺德区', '237', 'Shunde Shi');
INSERT INTO `sys_region` VALUES ('2354', '三水区', '237', 'Sanshui Shi');
INSERT INTO `sys_region` VALUES ('2355', '高明区', '237', 'Gaoming Shi');
INSERT INTO `sys_region` VALUES ('2356', '市辖区', '238', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2357', '蓬江区', '238', 'Pengjiang Qu');
INSERT INTO `sys_region` VALUES ('2358', '江海区', '238', 'Jianghai Qu');
INSERT INTO `sys_region` VALUES ('2359', '新会区', '238', 'Xinhui Shi');
INSERT INTO `sys_region` VALUES ('236', '汕头市', '20', 'Shantou Shi');
INSERT INTO `sys_region` VALUES ('2360', '台山市', '238', 'Taishan Shi');
INSERT INTO `sys_region` VALUES ('2361', '开平市', '238', 'Kaiping Shi');
INSERT INTO `sys_region` VALUES ('2362', '鹤山市', '238', 'Heshan Shi');
INSERT INTO `sys_region` VALUES ('2363', '恩平市', '238', 'Enping Shi');
INSERT INTO `sys_region` VALUES ('2364', '市辖区', '239', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2365', '赤坎区', '239', 'Chikan Qu');
INSERT INTO `sys_region` VALUES ('2366', '霞山区', '239', 'Xiashan Qu');
INSERT INTO `sys_region` VALUES ('2367', '坡头区', '239', 'Potou Qu');
INSERT INTO `sys_region` VALUES ('2368', '麻章区', '239', 'Mazhang Qu');
INSERT INTO `sys_region` VALUES ('2369', '遂溪县', '239', 'Suixi Xian');
INSERT INTO `sys_region` VALUES ('237', '佛山市', '20', 'Foshan Shi');
INSERT INTO `sys_region` VALUES ('2370', '徐闻县', '239', 'Xuwen Xian');
INSERT INTO `sys_region` VALUES ('2371', '廉江市', '239', 'Lianjiang Shi');
INSERT INTO `sys_region` VALUES ('2372', '雷州市', '239', 'Leizhou Shi');
INSERT INTO `sys_region` VALUES ('2373', '吴川市', '239', 'Wuchuan Shi');
INSERT INTO `sys_region` VALUES ('2374', '市辖区', '240', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2375', '茂南区', '240', 'Maonan Qu');
INSERT INTO `sys_region` VALUES ('2376', '茂港区', '240', 'Maogang Qu');
INSERT INTO `sys_region` VALUES ('2377', '电白县', '240', 'Dianbai Xian');
INSERT INTO `sys_region` VALUES ('2378', '高州市', '240', 'Gaozhou Shi');
INSERT INTO `sys_region` VALUES ('2379', '化州市', '240', 'Huazhou Shi');
INSERT INTO `sys_region` VALUES ('238', '江门市', '20', 'Jiangmen Shi');
INSERT INTO `sys_region` VALUES ('2380', '信宜市', '240', 'Xinyi Shi');
INSERT INTO `sys_region` VALUES ('2381', '市辖区', '241', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2382', '端州区', '241', 'Duanzhou Qu');
INSERT INTO `sys_region` VALUES ('2383', '鼎湖区', '241', 'Dinghu Qu');
INSERT INTO `sys_region` VALUES ('2384', '广宁县', '241', 'Guangning Xian');
INSERT INTO `sys_region` VALUES ('2385', '怀集县', '241', 'Huaiji Xian');
INSERT INTO `sys_region` VALUES ('2386', '封开县', '241', 'Fengkai Xian');
INSERT INTO `sys_region` VALUES ('2387', '德庆县', '241', 'Deqing Xian');
INSERT INTO `sys_region` VALUES ('2388', '高要市', '241', 'Gaoyao Xian');
INSERT INTO `sys_region` VALUES ('2389', '四会市', '241', 'Sihui Shi');
INSERT INTO `sys_region` VALUES ('239', '湛江市', '20', 'Zhanjiang Shi');
INSERT INTO `sys_region` VALUES ('2390', '市辖区', '242', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2391', '惠城区', '242', 'Huicheng Qu');
INSERT INTO `sys_region` VALUES ('2392', '惠阳区', '242', 'Huiyang Shi');
INSERT INTO `sys_region` VALUES ('2393', '博罗县', '242', 'Boluo Xian');
INSERT INTO `sys_region` VALUES ('2394', '惠东县', '242', 'Huidong Xian');
INSERT INTO `sys_region` VALUES ('2395', '龙门县', '242', 'Longmen Xian');
INSERT INTO `sys_region` VALUES ('2396', '市辖区', '243', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2397', '梅江区', '243', 'Meijiang Qu');
INSERT INTO `sys_region` VALUES ('2398', '梅县', '243', 'Mei Xian');
INSERT INTO `sys_region` VALUES ('2399', '大埔县', '243', 'Dabu Xian');
INSERT INTO `sys_region` VALUES ('24', '四川省', '1', 'Sichuan Sheng');
INSERT INTO `sys_region` VALUES ('240', '茂名市', '20', 'Maoming Shi');
INSERT INTO `sys_region` VALUES ('2400', '丰顺县', '243', 'Fengshun Xian');
INSERT INTO `sys_region` VALUES ('2401', '五华县', '243', 'Wuhua Xian');
INSERT INTO `sys_region` VALUES ('2402', '平远县', '243', 'Pingyuan Xian');
INSERT INTO `sys_region` VALUES ('2403', '蕉岭县', '243', 'Jiaoling Xian');
INSERT INTO `sys_region` VALUES ('2404', '兴宁市', '243', 'Xingning Shi');
INSERT INTO `sys_region` VALUES ('2405', '市辖区', '244', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2406', '城区', '244', 'Chengqu');
INSERT INTO `sys_region` VALUES ('2407', '海丰县', '244', 'Haifeng Xian');
INSERT INTO `sys_region` VALUES ('2408', '陆河县', '244', 'Luhe Xian');
INSERT INTO `sys_region` VALUES ('2409', '陆丰市', '244', 'Lufeng Shi');
INSERT INTO `sys_region` VALUES ('241', '肇庆市', '20', 'Zhaoqing Shi');
INSERT INTO `sys_region` VALUES ('2410', '市辖区', '245', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2411', '源城区', '245', 'Yuancheng Qu');
INSERT INTO `sys_region` VALUES ('2412', '紫金县', '245', 'Zijin Xian');
INSERT INTO `sys_region` VALUES ('2413', '龙川县', '245', 'Longchuan Xian');
INSERT INTO `sys_region` VALUES ('2414', '连平县', '245', 'Lianping Xian');
INSERT INTO `sys_region` VALUES ('2415', '和平县', '245', 'Heping Xian');
INSERT INTO `sys_region` VALUES ('2416', '东源县', '245', 'Dongyuan Xian');
INSERT INTO `sys_region` VALUES ('2417', '市辖区', '246', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2418', '江城区', '246', 'Jiangcheng Qu');
INSERT INTO `sys_region` VALUES ('2419', '阳西县', '246', 'Yangxi Xian');
INSERT INTO `sys_region` VALUES ('242', '惠州市', '20', 'Huizhou Shi');
INSERT INTO `sys_region` VALUES ('2420', '阳东县', '246', 'Yangdong Xian');
INSERT INTO `sys_region` VALUES ('2421', '阳春市', '246', 'Yangchun Shi');
INSERT INTO `sys_region` VALUES ('2422', '市辖区', '247', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2423', '清城区', '247', 'Qingcheng Qu');
INSERT INTO `sys_region` VALUES ('2424', '佛冈县', '247', 'Fogang Xian');
INSERT INTO `sys_region` VALUES ('2425', '阳山县', '247', 'Yangshan Xian');
INSERT INTO `sys_region` VALUES ('2426', '连山壮族瑶族自治县', '247', 'Lianshan Zhuangzu Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2427', '连南瑶族自治县', '247', 'Liannanyaozuzizhi Qu');
INSERT INTO `sys_region` VALUES ('2428', '清新县', '247', 'Qingxin Xian');
INSERT INTO `sys_region` VALUES ('2429', '英德市', '247', 'Yingde Shi');
INSERT INTO `sys_region` VALUES ('243', '梅州市', '20', 'Meizhou Shi');
INSERT INTO `sys_region` VALUES ('2430', '连州市', '247', 'Lianzhou Shi');
INSERT INTO `sys_region` VALUES ('2431', '市辖区', '250', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2432', '湘桥区', '250', 'Xiangqiao Qu');
INSERT INTO `sys_region` VALUES ('2433', '潮安县', '250', 'Chao,an Xian');
INSERT INTO `sys_region` VALUES ('2434', '饶平县', '250', 'Raoping Xian');
INSERT INTO `sys_region` VALUES ('2435', '市辖区', '251', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2436', '榕城区', '251', 'Rongcheng Qu');
INSERT INTO `sys_region` VALUES ('2437', '揭东县', '251', 'Jiedong Xian');
INSERT INTO `sys_region` VALUES ('2438', '揭西县', '251', 'Jiexi Xian');
INSERT INTO `sys_region` VALUES ('2439', '惠来县', '251', 'Huilai Xian');
INSERT INTO `sys_region` VALUES ('244', '汕尾市', '20', 'Shanwei Shi');
INSERT INTO `sys_region` VALUES ('2440', '普宁市', '251', 'Puning Shi');
INSERT INTO `sys_region` VALUES ('2441', '市辖区', '252', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2442', '云城区', '252', 'Yuncheng Qu');
INSERT INTO `sys_region` VALUES ('2443', '新兴县', '252', 'Xinxing Xian');
INSERT INTO `sys_region` VALUES ('2444', '郁南县', '252', 'Yunan Xian');
INSERT INTO `sys_region` VALUES ('2445', '云安县', '252', 'Yun,an Xian');
INSERT INTO `sys_region` VALUES ('2446', '罗定市', '252', 'Luoding Shi');
INSERT INTO `sys_region` VALUES ('2447', '市辖区', '253', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2448', '兴宁区', '253', 'Xingning Qu');
INSERT INTO `sys_region` VALUES ('2449', '青秀区', '253', 'Qingxiu Qu');
INSERT INTO `sys_region` VALUES ('245', '河源市', '20', 'Heyuan Shi');
INSERT INTO `sys_region` VALUES ('2450', '江南区', '253', 'Jiangnan Qu');
INSERT INTO `sys_region` VALUES ('2451', '西乡塘区', '253', 'Xixiangtang Qu');
INSERT INTO `sys_region` VALUES ('2452', '良庆区', '253', 'Liangqing Qu');
INSERT INTO `sys_region` VALUES ('2453', '邕宁区', '253', 'Yongning Qu');
INSERT INTO `sys_region` VALUES ('2454', '武鸣县', '253', 'Wuming Xian');
INSERT INTO `sys_region` VALUES ('2455', '隆安县', '253', 'Long,an Xian');
INSERT INTO `sys_region` VALUES ('2456', '马山县', '253', 'Mashan Xian');
INSERT INTO `sys_region` VALUES ('2457', '上林县', '253', 'Shanglin Xian');
INSERT INTO `sys_region` VALUES ('2458', '宾阳县', '253', 'Binyang Xian');
INSERT INTO `sys_region` VALUES ('2459', '横县', '253', 'Heng Xian');
INSERT INTO `sys_region` VALUES ('246', '阳江市', '20', 'Yangjiang Shi');
INSERT INTO `sys_region` VALUES ('2460', '市辖区', '254', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2461', '城中区', '254', 'Chengzhong Qu');
INSERT INTO `sys_region` VALUES ('2462', '鱼峰区', '254', 'Yufeng Qu');
INSERT INTO `sys_region` VALUES ('2463', '柳南区', '254', 'Liunan Qu');
INSERT INTO `sys_region` VALUES ('2464', '柳北区', '254', 'Liubei Qu');
INSERT INTO `sys_region` VALUES ('2465', '柳江县', '254', 'Liujiang Xian');
INSERT INTO `sys_region` VALUES ('2466', '柳城县', '254', 'Liucheng Xian');
INSERT INTO `sys_region` VALUES ('2467', '鹿寨县', '254', 'Luzhai Xian');
INSERT INTO `sys_region` VALUES ('2468', '融安县', '254', 'Rong,an Xian');
INSERT INTO `sys_region` VALUES ('2469', '融水苗族自治县', '254', 'Rongshui Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('247', '清远市', '20', 'Qingyuan Shi');
INSERT INTO `sys_region` VALUES ('2470', '三江侗族自治县', '254', 'Sanjiang Dongzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2471', '市辖区', '255', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2472', '秀峰区', '255', 'Xiufeng Qu');
INSERT INTO `sys_region` VALUES ('2473', '叠彩区', '255', 'Diecai Qu');
INSERT INTO `sys_region` VALUES ('2474', '象山区', '255', 'Xiangshan Qu');
INSERT INTO `sys_region` VALUES ('2475', '七星区', '255', 'Qixing Qu');
INSERT INTO `sys_region` VALUES ('2476', '雁山区', '255', 'Yanshan Qu');
INSERT INTO `sys_region` VALUES ('2477', '阳朔县', '255', 'Yangshuo Xian');
INSERT INTO `sys_region` VALUES ('2478', '临桂县', '255', 'Lingui Xian');
INSERT INTO `sys_region` VALUES ('2479', '灵川县', '255', 'Lingchuan Xian');
INSERT INTO `sys_region` VALUES ('248', '东莞市', '20', 'Dongguan Shi');
INSERT INTO `sys_region` VALUES ('2480', '全州县', '255', 'Quanzhou Xian');
INSERT INTO `sys_region` VALUES ('2481', '兴安县', '255', 'Xing,an Xian');
INSERT INTO `sys_region` VALUES ('2482', '永福县', '255', 'Yongfu Xian');
INSERT INTO `sys_region` VALUES ('2483', '灌阳县', '255', 'Guanyang Xian');
INSERT INTO `sys_region` VALUES ('2484', '龙胜各族自治县', '255', 'Longsheng Gezu Zizhixian');
INSERT INTO `sys_region` VALUES ('2485', '资源县', '255', 'Ziyuan Xian');
INSERT INTO `sys_region` VALUES ('2486', '平乐县', '255', 'Pingle Xian');
INSERT INTO `sys_region` VALUES ('2487', '荔蒲县', '255', 'Lipu Xian');
INSERT INTO `sys_region` VALUES ('2488', '恭城瑶族自治县', '255', 'Gongcheng Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2489', '市辖区', '256', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('249', '中山市', '20', 'Zhongshan Shi');
INSERT INTO `sys_region` VALUES ('2490', '万秀区', '256', 'Wanxiu Qu');
INSERT INTO `sys_region` VALUES ('2491', '蝶山区', '256', 'Dieshan Qu');
INSERT INTO `sys_region` VALUES ('2492', '长洲区', '256', 'Changzhou Qu');
INSERT INTO `sys_region` VALUES ('2493', '苍梧县', '256', 'Cangwu Xian');
INSERT INTO `sys_region` VALUES ('2494', '藤县', '256', 'Teng Xian');
INSERT INTO `sys_region` VALUES ('2495', '蒙山县', '256', 'Mengshan Xian');
INSERT INTO `sys_region` VALUES ('2496', '岑溪市', '256', 'Cenxi Shi');
INSERT INTO `sys_region` VALUES ('2497', '市辖区', '257', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2498', '海城区', '257', 'Haicheng Qu');
INSERT INTO `sys_region` VALUES ('2499', '银海区', '257', 'Yinhai Qu');
INSERT INTO `sys_region` VALUES ('25', '贵州省', '1', 'Guizhou Sheng');
INSERT INTO `sys_region` VALUES ('250', '潮州市', '20', 'Chaozhou Shi');
INSERT INTO `sys_region` VALUES ('2500', '铁山港区', '257', 'Tieshangangqu ');
INSERT INTO `sys_region` VALUES ('2501', '合浦县', '257', 'Hepu Xian');
INSERT INTO `sys_region` VALUES ('2502', '市辖区', '258', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2503', '港口区', '258', 'Gangkou Qu');
INSERT INTO `sys_region` VALUES ('2504', '防城区', '258', 'Fangcheng Qu');
INSERT INTO `sys_region` VALUES ('2505', '上思县', '258', 'Shangsi Xian');
INSERT INTO `sys_region` VALUES ('2506', '东兴市', '258', 'Dongxing Shi');
INSERT INTO `sys_region` VALUES ('2507', '市辖区', '259', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2508', '钦南区', '259', 'Qinnan Qu');
INSERT INTO `sys_region` VALUES ('2509', '钦北区', '259', 'Qinbei Qu');
INSERT INTO `sys_region` VALUES ('251', '揭阳市', '20', 'Jieyang Shi');
INSERT INTO `sys_region` VALUES ('2510', '灵山县', '259', 'Lingshan Xian');
INSERT INTO `sys_region` VALUES ('2511', '浦北县', '259', 'Pubei Xian');
INSERT INTO `sys_region` VALUES ('2512', '市辖区', '260', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2513', '港北区', '260', 'Gangbei Qu');
INSERT INTO `sys_region` VALUES ('2514', '港南区', '260', 'Gangnan Qu');
INSERT INTO `sys_region` VALUES ('2515', '覃塘区', '260', 'Tantang Qu');
INSERT INTO `sys_region` VALUES ('2516', '平南县', '260', 'Pingnan Xian');
INSERT INTO `sys_region` VALUES ('2517', '桂平市', '260', 'Guiping Shi');
INSERT INTO `sys_region` VALUES ('2518', '市辖区', '261', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2519', '玉州区', '261', 'Yuzhou Qu');
INSERT INTO `sys_region` VALUES ('252', '云浮市', '20', 'Yunfu Shi');
INSERT INTO `sys_region` VALUES ('2520', '容县', '261', 'Rong Xian');
INSERT INTO `sys_region` VALUES ('2521', '陆川县', '261', 'Luchuan Xian');
INSERT INTO `sys_region` VALUES ('2522', '博白县', '261', 'Bobai Xian');
INSERT INTO `sys_region` VALUES ('2523', '兴业县', '261', 'Xingye Xian');
INSERT INTO `sys_region` VALUES ('2524', '北流市', '261', 'Beiliu Shi');
INSERT INTO `sys_region` VALUES ('2525', '市辖区', '262', '1');
INSERT INTO `sys_region` VALUES ('2526', '右江区', '262', 'Youjiang Qu');
INSERT INTO `sys_region` VALUES ('2527', '田阳县', '262', 'Tianyang Xian');
INSERT INTO `sys_region` VALUES ('2528', '田东县', '262', 'Tiandong Xian');
INSERT INTO `sys_region` VALUES ('2529', '平果县', '262', 'Pingguo Xian');
INSERT INTO `sys_region` VALUES ('253', '南宁市', '21', 'Nanning Shi');
INSERT INTO `sys_region` VALUES ('2530', '德保县', '262', 'Debao Xian');
INSERT INTO `sys_region` VALUES ('2531', '靖西县', '262', 'Jingxi Xian');
INSERT INTO `sys_region` VALUES ('2532', '那坡县', '262', 'Napo Xian');
INSERT INTO `sys_region` VALUES ('2533', '凌云县', '262', 'Lingyun Xian');
INSERT INTO `sys_region` VALUES ('2534', '乐业县', '262', 'Leye Xian');
INSERT INTO `sys_region` VALUES ('2535', '田林县', '262', 'Tianlin Xian');
INSERT INTO `sys_region` VALUES ('2536', '西林县', '262', 'Xilin Xian');
INSERT INTO `sys_region` VALUES ('2537', '隆林各族自治县', '262', 'Longlin Gezu Zizhixian');
INSERT INTO `sys_region` VALUES ('2538', '市辖区', '263', '1');
INSERT INTO `sys_region` VALUES ('2539', '八步区', '263', 'Babu Qu');
INSERT INTO `sys_region` VALUES ('254', '柳州市', '21', 'Liuzhou Shi');
INSERT INTO `sys_region` VALUES ('2540', '昭平县', '263', 'Zhaoping Xian');
INSERT INTO `sys_region` VALUES ('2541', '钟山县', '263', 'Zhongshan Xian');
INSERT INTO `sys_region` VALUES ('2542', '富川瑶族自治县', '263', 'Fuchuan Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2543', '市辖区', '264', '1');
INSERT INTO `sys_region` VALUES ('2544', '金城江区', '264', 'Jinchengjiang Qu');
INSERT INTO `sys_region` VALUES ('2545', '南丹县', '264', 'Nandan Xian');
INSERT INTO `sys_region` VALUES ('2546', '天峨县', '264', 'Tian,e Xian');
INSERT INTO `sys_region` VALUES ('2547', '凤山县', '264', 'Fengshan Xian');
INSERT INTO `sys_region` VALUES ('2548', '东兰县', '264', 'Donglan Xian');
INSERT INTO `sys_region` VALUES ('2549', '罗城仫佬族自治县', '264', 'Luocheng Mulaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('255', '桂林市', '21', 'Guilin Shi');
INSERT INTO `sys_region` VALUES ('2550', '环江毛南族自治县', '264', 'Huanjiang Maonanzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2551', '巴马瑶族自治县', '264', 'Bama Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2552', '都安瑶族自治县', '264', 'Du,an Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2553', '大化瑶族自治县', '264', 'Dahua Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2554', '宜州市', '264', 'Yizhou Shi');
INSERT INTO `sys_region` VALUES ('2555', '市辖区', '265', '1');
INSERT INTO `sys_region` VALUES ('2556', '兴宾区', '265', 'Xingbin Qu');
INSERT INTO `sys_region` VALUES ('2557', '忻城县', '265', 'Xincheng Xian');
INSERT INTO `sys_region` VALUES ('2558', '象州县', '265', 'Xiangzhou Xian');
INSERT INTO `sys_region` VALUES ('2559', '武宣县', '265', 'Wuxuan Xian');
INSERT INTO `sys_region` VALUES ('256', '梧州市', '21', 'Wuzhou Shi');
INSERT INTO `sys_region` VALUES ('2560', '金秀瑶族自治县', '265', 'Jinxiu Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2561', '合山市', '265', 'Heshan Shi');
INSERT INTO `sys_region` VALUES ('2562', '市辖区', '266', '1');
INSERT INTO `sys_region` VALUES ('2563', '江洲区', '266', 'Jiangzhou Qu');
INSERT INTO `sys_region` VALUES ('2564', '扶绥县', '266', 'Fusui Xian');
INSERT INTO `sys_region` VALUES ('2565', '宁明县', '266', 'Ningming Xian');
INSERT INTO `sys_region` VALUES ('2566', '龙州县', '266', 'Longzhou Xian');
INSERT INTO `sys_region` VALUES ('2567', '大新县', '266', 'Daxin Xian');
INSERT INTO `sys_region` VALUES ('2568', '天等县', '266', 'Tiandeng Xian');
INSERT INTO `sys_region` VALUES ('2569', '凭祥市', '266', 'Pingxiang Shi');
INSERT INTO `sys_region` VALUES ('257', '北海市', '21', 'Beihai Shi');
INSERT INTO `sys_region` VALUES ('2570', '市辖区', '267', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2571', '秀英区', '267', 'Xiuying Qu');
INSERT INTO `sys_region` VALUES ('2572', '龙华区', '267', 'LongHua Qu');
INSERT INTO `sys_region` VALUES ('2573', '琼山区', '267', 'QiongShan Qu');
INSERT INTO `sys_region` VALUES ('2574', '美兰区', '267', 'MeiLan Qu');
INSERT INTO `sys_region` VALUES ('2575', '市辖区', '268', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2576', '五指山市', '269', 'Wuzhishan Qu');
INSERT INTO `sys_region` VALUES ('2577', '琼海市', '269', 'Qionghai Shi');
INSERT INTO `sys_region` VALUES ('2578', '儋州市', '269', 'Danzhou Shi');
INSERT INTO `sys_region` VALUES ('2579', '文昌市', '269', 'Wenchang Shi');
INSERT INTO `sys_region` VALUES ('258', '防城港市', '21', 'Fangchenggang Shi');
INSERT INTO `sys_region` VALUES ('2580', '万宁市', '269', 'Wanning Shi');
INSERT INTO `sys_region` VALUES ('2581', '东方市', '269', 'Dongfang Shi');
INSERT INTO `sys_region` VALUES ('2582', '定安县', '269', 'Ding,an Xian');
INSERT INTO `sys_region` VALUES ('2583', '屯昌县', '269', 'Tunchang Xian');
INSERT INTO `sys_region` VALUES ('2584', '澄迈县', '269', 'Chengmai Xian');
INSERT INTO `sys_region` VALUES ('2585', '临高县', '269', 'Lingao Xian');
INSERT INTO `sys_region` VALUES ('2586', '白沙黎族自治县', '269', 'Baisha Lizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2587', '昌江黎族自治县', '269', 'Changjiang Lizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2588', '乐东黎族自治县', '269', 'Ledong Lizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2589', '陵水黎族自治县', '269', 'Lingshui Lizu Zizhixian');
INSERT INTO `sys_region` VALUES ('259', '钦州市', '21', 'Qinzhou Shi');
INSERT INTO `sys_region` VALUES ('2590', '保亭黎族苗族自治县', '269', 'Baoting Lizu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2591', '琼中黎族苗族自治县', '269', 'Qiongzhong Lizu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2592', '西沙群岛', '269', 'Xisha Qundao');
INSERT INTO `sys_region` VALUES ('2593', '南沙群岛', '269', 'Nansha Qundao');
INSERT INTO `sys_region` VALUES ('2594', '中沙群岛的岛礁及其海域', '269', 'Zhongsha Qundao de Daojiao Jiqi Haiyu');
INSERT INTO `sys_region` VALUES ('2595', '万州区', '270', 'Wanzhou Qu');
INSERT INTO `sys_region` VALUES ('2596', '涪陵区', '270', 'Fuling Qu');
INSERT INTO `sys_region` VALUES ('2597', '渝中区', '270', 'Yuzhong Qu');
INSERT INTO `sys_region` VALUES ('2598', '大渡口区', '270', 'Dadukou Qu');
INSERT INTO `sys_region` VALUES ('2599', '江北区', '270', 'Jiangbei Qu');
INSERT INTO `sys_region` VALUES ('26', '云南省', '1', 'Yunnan Sheng');
INSERT INTO `sys_region` VALUES ('260', '贵港市', '21', 'Guigang Shi');
INSERT INTO `sys_region` VALUES ('2600', '沙坪坝区', '270', 'Shapingba Qu');
INSERT INTO `sys_region` VALUES ('2601', '九龙坡区', '270', 'Jiulongpo Qu');
INSERT INTO `sys_region` VALUES ('2602', '南岸区', '270', 'Nan,an Qu');
INSERT INTO `sys_region` VALUES ('2603', '北碚区', '270', 'Beibei Qu');
INSERT INTO `sys_region` VALUES ('2604', '万盛区', '270', 'Wansheng Qu');
INSERT INTO `sys_region` VALUES ('2605', '双桥区', '270', 'Shuangqiao Qu');
INSERT INTO `sys_region` VALUES ('2606', '渝北区', '270', 'Yubei Qu');
INSERT INTO `sys_region` VALUES ('2607', '巴南区', '270', 'Banan Qu');
INSERT INTO `sys_region` VALUES ('2608', '黔江区', '270', 'Qianjiang Qu');
INSERT INTO `sys_region` VALUES ('2609', '长寿区', '270', 'Changshou Qu');
INSERT INTO `sys_region` VALUES ('261', '玉林市', '21', 'Yulin Shi');
INSERT INTO `sys_region` VALUES ('2610', '綦江县', '271', 'Qijiang Xian');
INSERT INTO `sys_region` VALUES ('2611', '潼南县', '271', 'Tongnan Xian');
INSERT INTO `sys_region` VALUES ('2612', '铜梁县', '271', 'Tongliang Xian');
INSERT INTO `sys_region` VALUES ('2613', '大足县', '271', 'Dazu Xian');
INSERT INTO `sys_region` VALUES ('2614', '荣昌县', '271', 'Rongchang Xian');
INSERT INTO `sys_region` VALUES ('2615', '璧山县', '271', 'Bishan Xian');
INSERT INTO `sys_region` VALUES ('2616', '梁平县', '271', 'Liangping Xian');
INSERT INTO `sys_region` VALUES ('2617', '城口县', '271', 'Chengkou Xian');
INSERT INTO `sys_region` VALUES ('2618', '丰都县', '271', 'Fengdu Xian');
INSERT INTO `sys_region` VALUES ('2619', '垫江县', '271', 'Dianjiang Xian');
INSERT INTO `sys_region` VALUES ('262', '百色市', '21', 'Baise Shi');
INSERT INTO `sys_region` VALUES ('2620', '武隆县', '271', 'Wulong Xian');
INSERT INTO `sys_region` VALUES ('2621', '忠县', '271', 'Zhong Xian');
INSERT INTO `sys_region` VALUES ('2622', '开县', '271', 'Kai Xian');
INSERT INTO `sys_region` VALUES ('2623', '云阳县', '271', 'Yunyang Xian');
INSERT INTO `sys_region` VALUES ('2624', '奉节县', '271', 'Fengjie Xian');
INSERT INTO `sys_region` VALUES ('2625', '巫山县', '271', 'Wushan Xian');
INSERT INTO `sys_region` VALUES ('2626', '巫溪县', '271', 'Wuxi Xian');
INSERT INTO `sys_region` VALUES ('2627', '石柱土家族自治县', '271', 'Shizhu Tujiazu Zizhixian');
INSERT INTO `sys_region` VALUES ('2628', '秀山土家族苗族自治县', '271', 'Xiushan Tujiazu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2629', '酉阳土家族苗族自治县', '271', 'Youyang Tujiazu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('263', '贺州市', '21', 'Hezhou Shi');
INSERT INTO `sys_region` VALUES ('2630', '彭水苗族土家族自治县', '271', 'Pengshui Miaozu Tujiazu Zizhixian');
INSERT INTO `sys_region` VALUES ('2635', '市辖区', '273', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2636', '锦江区', '273', 'Jinjiang Qu');
INSERT INTO `sys_region` VALUES ('2637', '青羊区', '273', 'Qingyang Qu');
INSERT INTO `sys_region` VALUES ('2638', '金牛区', '273', 'Jinniu Qu');
INSERT INTO `sys_region` VALUES ('2639', '武侯区', '273', 'Wuhou Qu');
INSERT INTO `sys_region` VALUES ('264', '河池市', '21', 'Hechi Shi');
INSERT INTO `sys_region` VALUES ('2640', '成华区', '273', 'Chenghua Qu');
INSERT INTO `sys_region` VALUES ('2641', '龙泉驿区', '273', 'Longquanyi Qu');
INSERT INTO `sys_region` VALUES ('2642', '青白江区', '273', 'Qingbaijiang Qu');
INSERT INTO `sys_region` VALUES ('2643', '新都区', '273', 'Xindu Qu');
INSERT INTO `sys_region` VALUES ('2644', '温江区', '273', 'Wenjiang Qu');
INSERT INTO `sys_region` VALUES ('2645', '金堂县', '273', 'Jintang Xian');
INSERT INTO `sys_region` VALUES ('2646', '双流县', '273', 'Shuangliu Xian');
INSERT INTO `sys_region` VALUES ('2647', '郫县', '273', 'Pi Xian');
INSERT INTO `sys_region` VALUES ('2648', '大邑县', '273', 'Dayi Xian');
INSERT INTO `sys_region` VALUES ('2649', '蒲江县', '273', 'Pujiang Xian');
INSERT INTO `sys_region` VALUES ('265', '来宾市', '21', 'Laibin Shi');
INSERT INTO `sys_region` VALUES ('2650', '新津县', '273', 'Xinjin Xian');
INSERT INTO `sys_region` VALUES ('2651', '都江堰市', '273', 'Dujiangyan Shi');
INSERT INTO `sys_region` VALUES ('2652', '彭州市', '273', 'Pengzhou Shi');
INSERT INTO `sys_region` VALUES ('2653', '邛崃市', '273', 'Qionglai Shi');
INSERT INTO `sys_region` VALUES ('2654', '崇州市', '273', 'Chongzhou Shi');
INSERT INTO `sys_region` VALUES ('2655', '市辖区', '274', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2656', '自流井区', '274', 'Ziliujing Qu');
INSERT INTO `sys_region` VALUES ('2657', '贡井区', '274', 'Gongjing Qu');
INSERT INTO `sys_region` VALUES ('2658', '大安区', '274', 'Da,an Qu');
INSERT INTO `sys_region` VALUES ('2659', '沿滩区', '274', 'Yantan Qu');
INSERT INTO `sys_region` VALUES ('266', '崇左市', '21', 'Chongzuo Shi');
INSERT INTO `sys_region` VALUES ('2660', '荣县', '274', 'Rong Xian');
INSERT INTO `sys_region` VALUES ('2661', '富顺县', '274', 'Fushun Xian');
INSERT INTO `sys_region` VALUES ('2662', '市辖区', '275', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2663', '东区', '275', 'Dong Qu');
INSERT INTO `sys_region` VALUES ('2664', '西区', '275', 'Xi Qu');
INSERT INTO `sys_region` VALUES ('2665', '仁和区', '275', 'Renhe Qu');
INSERT INTO `sys_region` VALUES ('2666', '米易县', '275', 'Miyi Xian');
INSERT INTO `sys_region` VALUES ('2667', '盐边县', '275', 'Yanbian Xian');
INSERT INTO `sys_region` VALUES ('2668', '市辖区', '276', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2669', '江阳区', '276', 'Jiangyang Qu');
INSERT INTO `sys_region` VALUES ('267', '海口市', '22', 'Haikou Shi');
INSERT INTO `sys_region` VALUES ('2670', '纳溪区', '276', 'Naxi Qu');
INSERT INTO `sys_region` VALUES ('2671', '龙马潭区', '276', 'Longmatan Qu');
INSERT INTO `sys_region` VALUES ('2672', '泸县', '276', 'Lu Xian');
INSERT INTO `sys_region` VALUES ('2673', '合江县', '276', 'Hejiang Xian');
INSERT INTO `sys_region` VALUES ('2674', '叙永县', '276', 'Xuyong Xian');
INSERT INTO `sys_region` VALUES ('2675', '古蔺县', '276', 'Gulin Xian');
INSERT INTO `sys_region` VALUES ('2676', '市辖区', '277', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2677', '旌阳区', '277', 'Jingyang Qu');
INSERT INTO `sys_region` VALUES ('2678', '中江县', '277', 'Zhongjiang Xian');
INSERT INTO `sys_region` VALUES ('2679', '罗江县', '277', 'Luojiang Xian');
INSERT INTO `sys_region` VALUES ('268', '三亚市', '22', 'Sanya Shi');
INSERT INTO `sys_region` VALUES ('2680', '广汉市', '277', 'Guanghan Shi');
INSERT INTO `sys_region` VALUES ('2681', '什邡市', '277', 'Shifang Shi');
INSERT INTO `sys_region` VALUES ('2682', '绵竹市', '277', 'Jinzhou Shi');
INSERT INTO `sys_region` VALUES ('2683', '市辖区', '278', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2684', '涪城区', '278', 'Fucheng Qu');
INSERT INTO `sys_region` VALUES ('2685', '游仙区', '278', 'Youxian Qu');
INSERT INTO `sys_region` VALUES ('2686', '三台县', '278', 'Santai Xian');
INSERT INTO `sys_region` VALUES ('2687', '盐亭县', '278', 'Yanting Xian');
INSERT INTO `sys_region` VALUES ('2688', '安县', '278', 'An Xian');
INSERT INTO `sys_region` VALUES ('2689', '梓潼县', '278', 'Zitong Xian');
INSERT INTO `sys_region` VALUES ('269', '省直辖县级行政区划', '22', 'shengzhixiaxianjixingzhengquhua');
INSERT INTO `sys_region` VALUES ('2690', '北川羌族自治县', '278', 'Beichuanqiangzuzizhi Qu');
INSERT INTO `sys_region` VALUES ('2691', '平武县', '278', 'Pingwu Xian');
INSERT INTO `sys_region` VALUES ('2692', '江油市', '278', 'Jiangyou Shi');
INSERT INTO `sys_region` VALUES ('2693', '市辖区', '279', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2694', '市中区', '279', 'Shizhong Qu');
INSERT INTO `sys_region` VALUES ('2695', '元坝区', '279', 'Yuanba Qu');
INSERT INTO `sys_region` VALUES ('2696', '朝天区', '279', 'Chaotian Qu');
INSERT INTO `sys_region` VALUES ('2697', '旺苍县', '279', 'Wangcang Xian');
INSERT INTO `sys_region` VALUES ('2698', '青川县', '279', 'Qingchuan Xian');
INSERT INTO `sys_region` VALUES ('2699', '剑阁县', '279', 'Jiange Xian');
INSERT INTO `sys_region` VALUES ('27', '西藏自治区', '1', 'Xizang Zizhiqu');
INSERT INTO `sys_region` VALUES ('270', '市辖区', '23', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2700', '苍溪县', '279', 'Cangxi Xian');
INSERT INTO `sys_region` VALUES ('2701', '市辖区', '280', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2702', '船山区', '280', 'Chuanshan Qu');
INSERT INTO `sys_region` VALUES ('2703', '安居区', '280', 'Anju Qu');
INSERT INTO `sys_region` VALUES ('2704', '蓬溪县', '280', 'Pengxi Xian');
INSERT INTO `sys_region` VALUES ('2705', '射洪县', '280', 'Shehong Xian');
INSERT INTO `sys_region` VALUES ('2706', '大英县', '280', 'Daying Xian');
INSERT INTO `sys_region` VALUES ('2707', '市辖区', '281', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2708', '市中区', '281', 'Shizhong Qu');
INSERT INTO `sys_region` VALUES ('2709', '东兴区', '281', 'Dongxing Qu');
INSERT INTO `sys_region` VALUES ('271', '县', '23', 'Xian');
INSERT INTO `sys_region` VALUES ('2710', '威远县', '281', 'Weiyuan Xian');
INSERT INTO `sys_region` VALUES ('2711', '资中县', '281', 'Zizhong Xian');
INSERT INTO `sys_region` VALUES ('2712', '隆昌县', '281', 'Longchang Xian');
INSERT INTO `sys_region` VALUES ('2713', '市辖区', '282', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2714', '市中区', '282', 'Shizhong Qu');
INSERT INTO `sys_region` VALUES ('2715', '沙湾区', '282', 'Shawan Qu');
INSERT INTO `sys_region` VALUES ('2716', '五通桥区', '282', 'Wutongqiao Qu');
INSERT INTO `sys_region` VALUES ('2717', '金口河区', '282', 'Jinkouhe Qu');
INSERT INTO `sys_region` VALUES ('2718', '犍为县', '282', 'Qianwei Xian');
INSERT INTO `sys_region` VALUES ('2719', '井研县', '282', 'Jingyan Xian');
INSERT INTO `sys_region` VALUES ('2720', '夹江县', '282', 'Jiajiang Xian');
INSERT INTO `sys_region` VALUES ('2721', '沐川县', '282', 'Muchuan Xian');
INSERT INTO `sys_region` VALUES ('2722', '峨边彝族自治县', '282', 'Ebian Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2723', '马边彝族自治县', '282', 'Mabian Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2724', '峨眉山市', '282', 'Emeishan Shi');
INSERT INTO `sys_region` VALUES ('2725', '市辖区', '283', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2726', '顺庆区', '283', 'Shunqing Xian');
INSERT INTO `sys_region` VALUES ('2727', '高坪区', '283', 'Gaoping Qu');
INSERT INTO `sys_region` VALUES ('2728', '嘉陵区', '283', 'Jialing Qu');
INSERT INTO `sys_region` VALUES ('2729', '南部县', '283', 'Nanbu Xian');
INSERT INTO `sys_region` VALUES ('273', '成都市', '24', 'Chengdu Shi');
INSERT INTO `sys_region` VALUES ('2730', '营山县', '283', 'Yingshan Xian');
INSERT INTO `sys_region` VALUES ('2731', '蓬安县', '283', 'Peng,an Xian');
INSERT INTO `sys_region` VALUES ('2732', '仪陇县', '283', 'Yilong Xian');
INSERT INTO `sys_region` VALUES ('2733', '西充县', '283', 'Xichong Xian');
INSERT INTO `sys_region` VALUES ('2734', '阆中市', '283', 'Langzhong Shi');
INSERT INTO `sys_region` VALUES ('2735', '市辖区', '284', '1');
INSERT INTO `sys_region` VALUES ('2736', '东坡区', '284', 'Dongpo Qu');
INSERT INTO `sys_region` VALUES ('2737', '仁寿县', '284', 'Renshou Xian');
INSERT INTO `sys_region` VALUES ('2738', '彭山县', '284', 'Pengshan Xian');
INSERT INTO `sys_region` VALUES ('2739', '洪雅县', '284', 'Hongya Xian');
INSERT INTO `sys_region` VALUES ('274', '自贡市', '24', 'Zigong Shi');
INSERT INTO `sys_region` VALUES ('2740', '丹棱县', '284', 'Danling Xian');
INSERT INTO `sys_region` VALUES ('2741', '青神县', '284', 'Qingshen Xian');
INSERT INTO `sys_region` VALUES ('2742', '市辖区', '285', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2743', '翠屏区', '285', 'Cuiping Qu');
INSERT INTO `sys_region` VALUES ('2744', '宜宾县', '285', 'Yibin Xian');
INSERT INTO `sys_region` VALUES ('2745', '南溪县', '285', 'Nanxi Xian');
INSERT INTO `sys_region` VALUES ('2746', '江安县', '285', 'Jiang,an Xian');
INSERT INTO `sys_region` VALUES ('2747', '长宁县', '285', 'Changning Xian');
INSERT INTO `sys_region` VALUES ('2748', '高县', '285', 'Gao Xian');
INSERT INTO `sys_region` VALUES ('2749', '珙县', '285', 'Gong Xian');
INSERT INTO `sys_region` VALUES ('275', '攀枝花市', '24', 'Panzhihua Shi');
INSERT INTO `sys_region` VALUES ('2750', '筠连县', '285', 'Junlian Xian');
INSERT INTO `sys_region` VALUES ('2751', '兴文县', '285', 'Xingwen Xian');
INSERT INTO `sys_region` VALUES ('2752', '屏山县', '285', 'Pingshan Xian');
INSERT INTO `sys_region` VALUES ('2753', '市辖区', '286', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2754', '广安区', '286', 'Guang,an Qu');
INSERT INTO `sys_region` VALUES ('2755', '岳池县', '286', 'Yuechi Xian');
INSERT INTO `sys_region` VALUES ('2756', '武胜县', '286', 'Wusheng Xian');
INSERT INTO `sys_region` VALUES ('2757', '邻水县', '286', 'Linshui Xian');
INSERT INTO `sys_region` VALUES ('2759', '市辖区', '287', '1');
INSERT INTO `sys_region` VALUES ('276', '泸州市', '24', 'Luzhou Shi');
INSERT INTO `sys_region` VALUES ('2760', '通川区', '287', 'Tongchuan Qu');
INSERT INTO `sys_region` VALUES ('2761', '达县', '287', 'Da Xian');
INSERT INTO `sys_region` VALUES ('2762', '宣汉县', '287', 'Xuanhan Xian');
INSERT INTO `sys_region` VALUES ('2763', '开江县', '287', 'Kaijiang Xian');
INSERT INTO `sys_region` VALUES ('2764', '大竹县', '287', 'Dazhu Xian');
INSERT INTO `sys_region` VALUES ('2765', '渠县', '287', 'Qu Xian');
INSERT INTO `sys_region` VALUES ('2766', '万源市', '287', 'Wanyuan Shi');
INSERT INTO `sys_region` VALUES ('2767', '市辖区', '288', '1');
INSERT INTO `sys_region` VALUES ('2768', '雨城区', '288', 'Yucheg Qu');
INSERT INTO `sys_region` VALUES ('2769', '名山县', '288', 'Mingshan Xian');
INSERT INTO `sys_region` VALUES ('277', '德阳市', '24', 'Deyang Shi');
INSERT INTO `sys_region` VALUES ('2770', '荥经县', '288', 'Yingjing Xian');
INSERT INTO `sys_region` VALUES ('2771', '汉源县', '288', 'Hanyuan Xian');
INSERT INTO `sys_region` VALUES ('2772', '石棉县', '288', 'Shimian Xian');
INSERT INTO `sys_region` VALUES ('2773', '天全县', '288', 'Tianquan Xian');
INSERT INTO `sys_region` VALUES ('2774', '芦山县', '288', 'Lushan Xian');
INSERT INTO `sys_region` VALUES ('2775', '宝兴县', '288', 'Baoxing Xian');
INSERT INTO `sys_region` VALUES ('2776', '市辖区', '289', '1');
INSERT INTO `sys_region` VALUES ('2777', '巴州区', '289', 'Bazhou Qu');
INSERT INTO `sys_region` VALUES ('2778', '通江县', '289', 'Tongjiang Xian');
INSERT INTO `sys_region` VALUES ('2779', '南江县', '289', 'Nanjiang Xian');
INSERT INTO `sys_region` VALUES ('278', '绵阳市', '24', 'Mianyang Shi');
INSERT INTO `sys_region` VALUES ('2780', '平昌县', '289', 'Pingchang Xian');
INSERT INTO `sys_region` VALUES ('2781', '市辖区', '290', '1');
INSERT INTO `sys_region` VALUES ('2782', '雁江区', '290', 'Yanjiang Qu');
INSERT INTO `sys_region` VALUES ('2783', '安岳县', '290', 'Anyue Xian');
INSERT INTO `sys_region` VALUES ('2784', '乐至县', '290', 'Lezhi Xian');
INSERT INTO `sys_region` VALUES ('2785', '简阳市', '290', 'Jianyang Shi');
INSERT INTO `sys_region` VALUES ('2786', '汶川县', '291', 'Wenchuan Xian');
INSERT INTO `sys_region` VALUES ('2787', '理县', '291', 'Li Xian');
INSERT INTO `sys_region` VALUES ('2788', '茂县', '291', 'Mao Xian');
INSERT INTO `sys_region` VALUES ('2789', '松潘县', '291', 'Songpan Xian');
INSERT INTO `sys_region` VALUES ('279', '广元市', '24', 'Guangyuan Shi');
INSERT INTO `sys_region` VALUES ('2790', '九寨沟县', '291', 'Jiuzhaigou Xian');
INSERT INTO `sys_region` VALUES ('2791', '金川县', '291', 'Jinchuan Xian');
INSERT INTO `sys_region` VALUES ('2792', '小金县', '291', 'Xiaojin Xian');
INSERT INTO `sys_region` VALUES ('2793', '黑水县', '291', 'Heishui Xian');
INSERT INTO `sys_region` VALUES ('2794', '马尔康县', '291', 'Barkam Xian');
INSERT INTO `sys_region` VALUES ('2795', '壤塘县', '291', 'Zamtang Xian');
INSERT INTO `sys_region` VALUES ('2796', '阿坝县', '291', 'Aba(Ngawa) Xian');
INSERT INTO `sys_region` VALUES ('2797', '若尔盖县', '291', 'ZoigeXian');
INSERT INTO `sys_region` VALUES ('2798', '红原县', '291', 'Hongyuan Xian');
INSERT INTO `sys_region` VALUES ('2799', '康定县', '292', 'Kangding(Dardo) Xian');
INSERT INTO `sys_region` VALUES ('28', '陕西省', '1', 'Shanxi Sheng ');
INSERT INTO `sys_region` VALUES ('280', '遂宁市', '24', 'Suining Shi');
INSERT INTO `sys_region` VALUES ('2800', '泸定县', '292', 'Luding(Jagsamka) Xian');
INSERT INTO `sys_region` VALUES ('2801', '丹巴县', '292', 'Danba(Rongzhag) Xian');
INSERT INTO `sys_region` VALUES ('2802', '九龙县', '292', 'Jiulong(Gyaisi) Xian');
INSERT INTO `sys_region` VALUES ('2803', '雅江县', '292', 'Yajiang(Nyagquka) Xian');
INSERT INTO `sys_region` VALUES ('2804', '道孚县', '292', 'Dawu Xian');
INSERT INTO `sys_region` VALUES ('2805', '炉霍县', '292', 'Luhuo(Zhaggo) Xian');
INSERT INTO `sys_region` VALUES ('2806', '甘孜县', '292', 'Garze Xian');
INSERT INTO `sys_region` VALUES ('2807', '新龙县', '292', 'Xinlong(Nyagrong) Xian');
INSERT INTO `sys_region` VALUES ('2808', '德格县', '292', 'DegeXian');
INSERT INTO `sys_region` VALUES ('2809', '白玉县', '292', 'Baiyu Xian');
INSERT INTO `sys_region` VALUES ('281', '内江市', '24', 'Neijiang Shi');
INSERT INTO `sys_region` VALUES ('2810', '石渠县', '292', 'Serxv Xian');
INSERT INTO `sys_region` VALUES ('2811', '色达县', '292', 'Sertar Xian');
INSERT INTO `sys_region` VALUES ('2812', '理塘县', '292', 'Litang Xian');
INSERT INTO `sys_region` VALUES ('2813', '巴塘县', '292', 'Batang Xian');
INSERT INTO `sys_region` VALUES ('2814', '乡城县', '292', 'Xiangcheng(Qagcheng) Xian');
INSERT INTO `sys_region` VALUES ('2815', '稻城县', '292', 'Daocheng(Dabba) Xian');
INSERT INTO `sys_region` VALUES ('2816', '得荣县', '292', 'Derong Xian');
INSERT INTO `sys_region` VALUES ('2817', '西昌市', '293', 'Xichang Shi');
INSERT INTO `sys_region` VALUES ('2818', '木里藏族自治县', '293', 'Muli Zangzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2819', '盐源县', '293', 'Yanyuan Xian');
INSERT INTO `sys_region` VALUES ('282', '乐山市', '24', 'Leshan Shi');
INSERT INTO `sys_region` VALUES ('2820', '德昌县', '293', 'Dechang Xian');
INSERT INTO `sys_region` VALUES ('2821', '会理县', '293', 'Huili Xian');
INSERT INTO `sys_region` VALUES ('2822', '会东县', '293', 'Huidong Xian');
INSERT INTO `sys_region` VALUES ('2823', '宁南县', '293', 'Ningnan Xian');
INSERT INTO `sys_region` VALUES ('2824', '普格县', '293', 'Puge Xian');
INSERT INTO `sys_region` VALUES ('2825', '布拖县', '293', 'Butuo Xian');
INSERT INTO `sys_region` VALUES ('2826', '金阳县', '293', 'Jinyang Xian');
INSERT INTO `sys_region` VALUES ('2827', '昭觉县', '293', 'Zhaojue Xian');
INSERT INTO `sys_region` VALUES ('2828', '喜德县', '293', 'Xide Xian');
INSERT INTO `sys_region` VALUES ('2829', '冕宁县', '293', 'Mianning Xian');
INSERT INTO `sys_region` VALUES ('283', '南充市', '24', 'Nanchong Shi');
INSERT INTO `sys_region` VALUES ('2830', '越西县', '293', 'Yuexi Xian');
INSERT INTO `sys_region` VALUES ('2831', '甘洛县', '293', 'Ganluo Xian');
INSERT INTO `sys_region` VALUES ('2832', '美姑县', '293', 'Meigu Xian');
INSERT INTO `sys_region` VALUES ('2833', '雷波县', '293', 'Leibo Xian');
INSERT INTO `sys_region` VALUES ('2834', '市辖区', '294', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2835', '南明区', '294', 'Nanming Qu');
INSERT INTO `sys_region` VALUES ('2836', '云岩区', '294', 'Yunyan Qu');
INSERT INTO `sys_region` VALUES ('2837', '花溪区', '294', 'Huaxi Qu');
INSERT INTO `sys_region` VALUES ('2838', '乌当区', '294', 'Wudang Qu');
INSERT INTO `sys_region` VALUES ('2839', '白云区', '294', 'Baiyun Qu');
INSERT INTO `sys_region` VALUES ('284', '眉山市', '24', 'Meishan Shi');
INSERT INTO `sys_region` VALUES ('2840', '小河区', '294', 'Xiaohe Qu');
INSERT INTO `sys_region` VALUES ('2841', '开阳县', '294', 'Kaiyang Xian');
INSERT INTO `sys_region` VALUES ('2842', '息烽县', '294', 'Xifeng Xian');
INSERT INTO `sys_region` VALUES ('2843', '修文县', '294', 'Xiuwen Xian');
INSERT INTO `sys_region` VALUES ('2844', '清镇市', '294', 'Qingzhen Shi');
INSERT INTO `sys_region` VALUES ('2845', '钟山区', '295', 'Zhongshan Qu');
INSERT INTO `sys_region` VALUES ('2846', '六枝特区', '295', 'Liuzhi Tequ');
INSERT INTO `sys_region` VALUES ('2847', '水城县', '295', 'Shuicheng Xian');
INSERT INTO `sys_region` VALUES ('2848', '盘县', '295', 'Pan Xian');
INSERT INTO `sys_region` VALUES ('2849', '市辖区', '296', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('285', '宜宾市', '24', 'Yibin Shi');
INSERT INTO `sys_region` VALUES ('2850', '红花岗区', '296', 'Honghuagang Qu');
INSERT INTO `sys_region` VALUES ('2851', '汇川区', '296', 'Huichuan Qu');
INSERT INTO `sys_region` VALUES ('2852', '遵义县', '296', 'Zunyi Xian');
INSERT INTO `sys_region` VALUES ('2853', '桐梓县', '296', 'Tongzi Xian');
INSERT INTO `sys_region` VALUES ('2854', '绥阳县', '296', 'Suiyang Xian');
INSERT INTO `sys_region` VALUES ('2855', '正安县', '296', 'Zhengan Xan');
INSERT INTO `sys_region` VALUES ('2856', '道真仡佬族苗族自治县', '296', 'Daozhen Gelaozu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2857', '务川仡佬族苗族自治县', '296', 'Wuchuan Gelaozu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2858', '凤冈县', '296', 'Fenggang Xian');
INSERT INTO `sys_region` VALUES ('2859', '湄潭县', '296', 'Meitan Xian');
INSERT INTO `sys_region` VALUES ('286', '广安市', '24', 'Guang,an Shi');
INSERT INTO `sys_region` VALUES ('2860', '余庆县', '296', 'Yuqing Xian');
INSERT INTO `sys_region` VALUES ('2861', '习水县', '296', 'Xishui Xian');
INSERT INTO `sys_region` VALUES ('2862', '赤水市', '296', 'Chishui Shi');
INSERT INTO `sys_region` VALUES ('2863', '仁怀市', '296', 'Renhuai Shi');
INSERT INTO `sys_region` VALUES ('2864', '市辖区', '297', '1');
INSERT INTO `sys_region` VALUES ('2865', '西秀区', '297', 'Xixiu Qu');
INSERT INTO `sys_region` VALUES ('2866', '平坝县', '297', 'Pingba Xian');
INSERT INTO `sys_region` VALUES ('2867', '普定县', '297', 'Puding Xian');
INSERT INTO `sys_region` VALUES ('2868', '镇宁布依族苗族自治县', '297', 'Zhenning Buyeizu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2869', '关岭布依族苗族自治县', '297', 'Guanling Buyeizu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('287', '达州市', '24', 'Dazhou Shi');
INSERT INTO `sys_region` VALUES ('2870', '紫云苗族布依族自治县', '297', 'Ziyun Miaozu Buyeizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2871', '铜仁市', '298', 'Tongren Shi');
INSERT INTO `sys_region` VALUES ('2872', '江口县', '298', 'Jiangkou Xian');
INSERT INTO `sys_region` VALUES ('2873', '玉屏侗族自治县', '298', 'Yuping Dongzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2874', '石阡县', '298', 'Shiqian Xian');
INSERT INTO `sys_region` VALUES ('2875', '思南县', '298', 'Sinan Xian');
INSERT INTO `sys_region` VALUES ('2876', '印江土家族苗族自治县', '298', 'Yinjiang Tujiazu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2877', '德江县', '298', 'Dejiang Xian');
INSERT INTO `sys_region` VALUES ('2878', '沿河土家族自治县', '298', 'Yanhe Tujiazu Zizhixian');
INSERT INTO `sys_region` VALUES ('2879', '松桃苗族自治县', '298', 'Songtao Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('288', '雅安市', '24', 'Ya,an Shi');
INSERT INTO `sys_region` VALUES ('2880', '万山特区', '298', 'Wanshan Tequ');
INSERT INTO `sys_region` VALUES ('2881', '兴义市', '299', 'Xingyi Shi');
INSERT INTO `sys_region` VALUES ('2882', '兴仁县', '299', 'Xingren Xian');
INSERT INTO `sys_region` VALUES ('2883', '普安县', '299', 'Pu,an Xian');
INSERT INTO `sys_region` VALUES ('2884', '晴隆县', '299', 'Qinglong Xian');
INSERT INTO `sys_region` VALUES ('2885', '贞丰县', '299', 'Zhenfeng Xian');
INSERT INTO `sys_region` VALUES ('2886', '望谟县', '299', 'Wangmo Xian');
INSERT INTO `sys_region` VALUES ('2887', '册亨县', '299', 'Ceheng Xian');
INSERT INTO `sys_region` VALUES ('2888', '安龙县', '299', 'Anlong Xian');
INSERT INTO `sys_region` VALUES ('2889', '毕节市', '300', 'Bijie Shi');
INSERT INTO `sys_region` VALUES ('289', '巴中市', '24', 'Bazhong Shi');
INSERT INTO `sys_region` VALUES ('2890', '大方县', '300', 'Dafang Xian');
INSERT INTO `sys_region` VALUES ('2891', '黔西县', '300', 'Qianxi Xian');
INSERT INTO `sys_region` VALUES ('2892', '金沙县', '300', 'Jinsha Xian');
INSERT INTO `sys_region` VALUES ('2893', '织金县', '300', 'Zhijin Xian');
INSERT INTO `sys_region` VALUES ('2894', '纳雍县', '300', 'Nayong Xian');
INSERT INTO `sys_region` VALUES ('2895', '威宁彝族回族苗族自治县', '300', 'Weining Yizu Huizu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2896', '赫章县', '300', 'Hezhang Xian');
INSERT INTO `sys_region` VALUES ('2897', '凯里市', '301', 'Kaili Shi');
INSERT INTO `sys_region` VALUES ('2898', '黄平县', '301', 'Huangping Xian');
INSERT INTO `sys_region` VALUES ('2899', '施秉县', '301', 'Shibing Xian');
INSERT INTO `sys_region` VALUES ('29', '甘肃省', '1', 'Gansu Sheng');
INSERT INTO `sys_region` VALUES ('290', '资阳市', '24', 'Ziyang Shi');
INSERT INTO `sys_region` VALUES ('2900', '三穗县', '301', 'Sansui Xian');
INSERT INTO `sys_region` VALUES ('2901', '镇远县', '301', 'Zhenyuan Xian');
INSERT INTO `sys_region` VALUES ('2902', '岑巩县', '301', 'Cengong Xian');
INSERT INTO `sys_region` VALUES ('2903', '天柱县', '301', 'Tianzhu Xian');
INSERT INTO `sys_region` VALUES ('2904', '锦屏县', '301', 'Jinping Xian');
INSERT INTO `sys_region` VALUES ('2905', '剑河县', '301', 'Jianhe Xian');
INSERT INTO `sys_region` VALUES ('2906', '台江县', '301', 'Taijiang Xian');
INSERT INTO `sys_region` VALUES ('2907', '黎平县', '301', 'Liping Xian');
INSERT INTO `sys_region` VALUES ('2908', '榕江县', '301', 'Rongjiang Xian');
INSERT INTO `sys_region` VALUES ('2909', '从江县', '301', 'Congjiang Xian');
INSERT INTO `sys_region` VALUES ('291', '阿坝藏族羌族自治州', '24', 'Aba(Ngawa) Zangzu Qiangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('2910', '雷山县', '301', 'Leishan Xian');
INSERT INTO `sys_region` VALUES ('2911', '麻江县', '301', 'Majiang Xian');
INSERT INTO `sys_region` VALUES ('2912', '丹寨县', '301', 'Danzhai Xian');
INSERT INTO `sys_region` VALUES ('2913', '都匀市', '302', 'Duyun Shi');
INSERT INTO `sys_region` VALUES ('2914', '福泉市', '302', 'Fuquan Shi');
INSERT INTO `sys_region` VALUES ('2915', '荔波县', '302', 'Libo Xian');
INSERT INTO `sys_region` VALUES ('2916', '贵定县', '302', 'Guiding Xian');
INSERT INTO `sys_region` VALUES ('2917', '瓮安县', '302', 'Weng,an Xian');
INSERT INTO `sys_region` VALUES ('2918', '独山县', '302', 'Dushan Xian');
INSERT INTO `sys_region` VALUES ('2919', '平塘县', '302', 'Pingtang Xian');
INSERT INTO `sys_region` VALUES ('292', '甘孜藏族自治州', '24', 'Garze Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('2920', '罗甸县', '302', 'Luodian Xian');
INSERT INTO `sys_region` VALUES ('2921', '长顺县', '302', 'Changshun Xian');
INSERT INTO `sys_region` VALUES ('2922', '龙里县', '302', 'Longli Xian');
INSERT INTO `sys_region` VALUES ('2923', '惠水县', '302', 'Huishui Xian');
INSERT INTO `sys_region` VALUES ('2924', '三都水族自治县', '302', 'Sandu Suizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2925', '市辖区', '303', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2926', '五华区', '303', 'Wuhua Qu');
INSERT INTO `sys_region` VALUES ('2927', '盘龙区', '303', 'Panlong Qu');
INSERT INTO `sys_region` VALUES ('2928', '官渡区', '303', 'Guandu Qu');
INSERT INTO `sys_region` VALUES ('2929', '西山区', '303', 'Xishan Qu');
INSERT INTO `sys_region` VALUES ('293', '凉山彝族自治州', '24', 'Liangshan Yizu Zizhizhou');
INSERT INTO `sys_region` VALUES ('2930', '东川区', '303', 'Dongchuan Qu');
INSERT INTO `sys_region` VALUES ('2931', '呈贡县', '303', 'Chenggong Xian');
INSERT INTO `sys_region` VALUES ('2932', '晋宁县', '303', 'Jinning Xian');
INSERT INTO `sys_region` VALUES ('2933', '富民县', '303', 'Fumin Xian');
INSERT INTO `sys_region` VALUES ('2934', '宜良县', '303', 'Yiliang Xian');
INSERT INTO `sys_region` VALUES ('2935', '石林彝族自治县', '303', 'Shilin Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2936', '嵩明县', '303', 'Songming Xian');
INSERT INTO `sys_region` VALUES ('2937', '禄劝彝族苗族自治县', '303', 'Luchuan Yizu Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('2938', '寻甸回族彝族自治县', '303', 'Xundian Huizu Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2939', '安宁市', '303', 'Anning Shi');
INSERT INTO `sys_region` VALUES ('294', '贵阳市', '25', 'Guiyang Shi');
INSERT INTO `sys_region` VALUES ('2940', '市辖区', '304', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2941', '麒麟区', '304', 'Qilin Xian');
INSERT INTO `sys_region` VALUES ('2942', '马龙县', '304', 'Malong Xian');
INSERT INTO `sys_region` VALUES ('2943', '陆良县', '304', 'Luliang Xian');
INSERT INTO `sys_region` VALUES ('2944', '师宗县', '304', 'Shizong Xian');
INSERT INTO `sys_region` VALUES ('2945', '罗平县', '304', 'Luoping Xian');
INSERT INTO `sys_region` VALUES ('2946', '富源县', '304', 'Fuyuan Xian');
INSERT INTO `sys_region` VALUES ('2947', '会泽县', '304', 'Huize Xian');
INSERT INTO `sys_region` VALUES ('2948', '沾益县', '304', 'Zhanyi Xian');
INSERT INTO `sys_region` VALUES ('2949', '宣威市', '304', 'Xuanwei Shi');
INSERT INTO `sys_region` VALUES ('295', '六盘水市', '25', 'Liupanshui Shi');
INSERT INTO `sys_region` VALUES ('2950', '市辖区', '305', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('2951', '红塔区', '305', 'Hongta Qu');
INSERT INTO `sys_region` VALUES ('2952', '江川县', '305', 'Jiangchuan Xian');
INSERT INTO `sys_region` VALUES ('2953', '澄江县', '305', 'Chengjiang Xian');
INSERT INTO `sys_region` VALUES ('2954', '通海县', '305', 'Tonghai Xian');
INSERT INTO `sys_region` VALUES ('2955', '华宁县', '305', 'Huaning Xian');
INSERT INTO `sys_region` VALUES ('2956', '易门县', '305', 'Yimen Xian');
INSERT INTO `sys_region` VALUES ('2957', '峨山彝族自治县', '305', 'Eshan Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2958', '新平彝族傣族自治县', '305', 'Xinping Yizu Daizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2959', '元江哈尼族彝族傣族自治县', '305', 'Yuanjiang Hanizu Yizu Daizu Zizhixian');
INSERT INTO `sys_region` VALUES ('296', '遵义市', '25', 'Zunyi Shi');
INSERT INTO `sys_region` VALUES ('2960', '市辖区', '306', '1');
INSERT INTO `sys_region` VALUES ('2961', '隆阳区', '306', 'Longyang Qu');
INSERT INTO `sys_region` VALUES ('2962', '施甸县', '306', 'Shidian Xian');
INSERT INTO `sys_region` VALUES ('2963', '腾冲县', '306', 'Tengchong Xian');
INSERT INTO `sys_region` VALUES ('2964', '龙陵县', '306', 'Longling Xian');
INSERT INTO `sys_region` VALUES ('2965', '昌宁县', '306', 'Changning Xian');
INSERT INTO `sys_region` VALUES ('2966', '市辖区', '307', '1');
INSERT INTO `sys_region` VALUES ('2967', '昭阳区', '307', 'Zhaoyang Qu');
INSERT INTO `sys_region` VALUES ('2968', '鲁甸县', '307', 'Ludian Xian');
INSERT INTO `sys_region` VALUES ('2969', '巧家县', '307', 'Qiaojia Xian');
INSERT INTO `sys_region` VALUES ('297', '安顺市', '25', 'Anshun Xian');
INSERT INTO `sys_region` VALUES ('2970', '盐津县', '307', 'Yanjin Xian');
INSERT INTO `sys_region` VALUES ('2971', '大关县', '307', 'Daguan Xian');
INSERT INTO `sys_region` VALUES ('2972', '永善县', '307', 'Yongshan Xian');
INSERT INTO `sys_region` VALUES ('2973', '绥江县', '307', 'Suijiang Xian');
INSERT INTO `sys_region` VALUES ('2974', '镇雄县', '307', 'Zhenxiong Xian');
INSERT INTO `sys_region` VALUES ('2975', '彝良县', '307', 'Yiliang Xian');
INSERT INTO `sys_region` VALUES ('2976', '威信县', '307', 'Weixin Xian');
INSERT INTO `sys_region` VALUES ('2977', '水富县', '307', 'Shuifu Xian ');
INSERT INTO `sys_region` VALUES ('2978', '市辖区', '308', '1');
INSERT INTO `sys_region` VALUES ('2979', '古城区', '308', 'Gucheng Qu');
INSERT INTO `sys_region` VALUES ('298', '铜仁地区', '25', 'Tongren Diqu');
INSERT INTO `sys_region` VALUES ('2980', '玉龙纳西族自治县', '308', 'Yulongnaxizuzizhi Xian');
INSERT INTO `sys_region` VALUES ('2981', '永胜县', '308', 'Yongsheng Xian');
INSERT INTO `sys_region` VALUES ('2982', '华坪县', '308', 'Huaping Xian');
INSERT INTO `sys_region` VALUES ('2983', '宁蒗彝族自治县', '308', 'Ninglang Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2984', '市辖区', '309', '1');
INSERT INTO `sys_region` VALUES ('2985', '思茅区', '309', 'Simao Qu');
INSERT INTO `sys_region` VALUES ('2986', '宁洱哈尼族彝族自治县', '309', 'Pu,er Hanizu Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2987', '墨江哈尼族自治县', '309', 'Mojiang Hanizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2988', '景东彝族自治县', '309', 'Jingdong Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2989', '景谷傣族彝族自治县', '309', 'Jinggu Daizu Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('299', '黔西南布依族苗族自治州', '25', 'Qianxinan Buyeizu Zizhizhou');
INSERT INTO `sys_region` VALUES ('2990', '镇沅彝族哈尼族拉祜族自治县', '309', 'Zhenyuan Yizu Hanizu Lahuzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2991', '江城哈尼族彝族自治县', '309', 'Jiangcheng Hanizu Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('2992', '孟连傣族拉祜族佤族自治县', '309', 'Menglian Daizu Lahuzu Vazu Zizixian');
INSERT INTO `sys_region` VALUES ('2993', '澜沧拉祜族自治县', '309', 'Lancang Lahuzu Zizhixian');
INSERT INTO `sys_region` VALUES ('2994', '西盟佤族自治县', '309', 'Ximeng Vazu Zizhixian');
INSERT INTO `sys_region` VALUES ('2995', '市辖区', '310', '1');
INSERT INTO `sys_region` VALUES ('2996', '临翔区', '310', 'Linxiang Qu');
INSERT INTO `sys_region` VALUES ('2997', '凤庆县', '310', 'Fengqing Xian');
INSERT INTO `sys_region` VALUES ('2998', '云县', '310', 'Yun Xian');
INSERT INTO `sys_region` VALUES ('2999', '永德县', '310', 'Yongde Xian');
INSERT INTO `sys_region` VALUES ('3', '天津市', '1', 'Tianjin Shi');
INSERT INTO `sys_region` VALUES ('30', '青海省', '1', 'Qinghai Sheng');
INSERT INTO `sys_region` VALUES ('300', '毕节地区', '25', 'Bijie Diqu');
INSERT INTO `sys_region` VALUES ('3000', '镇康县', '310', 'Zhenkang Xian');
INSERT INTO `sys_region` VALUES ('3001', '双江拉祜族佤族布朗族傣族自治县', '310', 'Shuangjiang Lahuzu Vazu Bulangzu Daizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3002', '耿马傣族佤族自治县', '310', 'Gengma Daizu Vazu Zizhixian');
INSERT INTO `sys_region` VALUES ('3003', '沧源佤族自治县', '310', 'Cangyuan Vazu Zizhixian');
INSERT INTO `sys_region` VALUES ('3004', '楚雄市', '311', 'Chuxiong Shi');
INSERT INTO `sys_region` VALUES ('3005', '双柏县', '311', 'Shuangbai Xian');
INSERT INTO `sys_region` VALUES ('3006', '牟定县', '311', 'Mouding Xian');
INSERT INTO `sys_region` VALUES ('3007', '南华县', '311', 'Nanhua Xian');
INSERT INTO `sys_region` VALUES ('3008', '姚安县', '311', 'Yao,an Xian');
INSERT INTO `sys_region` VALUES ('3009', '大姚县', '311', 'Dayao Xian');
INSERT INTO `sys_region` VALUES ('301', '黔东南苗族侗族自治州', '25', 'Qiandongnan Miaozu Dongzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3010', '永仁县', '311', 'Yongren Xian');
INSERT INTO `sys_region` VALUES ('3011', '元谋县', '311', 'Yuanmou Xian');
INSERT INTO `sys_region` VALUES ('3012', '武定县', '311', 'Wuding Xian');
INSERT INTO `sys_region` VALUES ('3013', '禄丰县', '311', 'Lufeng Xian');
INSERT INTO `sys_region` VALUES ('3014', '个旧市', '312', 'Gejiu Shi');
INSERT INTO `sys_region` VALUES ('3015', '开远市', '312', 'Kaiyuan Shi');
INSERT INTO `sys_region` VALUES ('3016', '蒙自市', '312', 'Mengzi Xian');
INSERT INTO `sys_region` VALUES ('3017', '屏边苗族自治县', '312', 'Pingbian Miaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('3018', '建水县', '312', 'Jianshui Xian');
INSERT INTO `sys_region` VALUES ('3019', '石屏县', '312', 'Shiping Xian');
INSERT INTO `sys_region` VALUES ('302', '黔南布依族苗族自治州', '25', 'Qiannan Buyeizu Miaozu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3020', '弥勒县', '312', 'Mile Xian');
INSERT INTO `sys_region` VALUES ('3021', '泸西县', '312', 'Luxi Xian');
INSERT INTO `sys_region` VALUES ('3022', '元阳县', '312', 'Yuanyang Xian');
INSERT INTO `sys_region` VALUES ('3023', '红河县', '312', 'Honghe Xian');
INSERT INTO `sys_region` VALUES ('3024', '金平苗族瑶族傣族自治县', '312', 'Jinping Miaozu Yaozu Daizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3025', '绿春县', '312', 'Lvchun Xian');
INSERT INTO `sys_region` VALUES ('3026', '河口瑶族自治县', '312', 'Hekou Yaozu Zizhixian');
INSERT INTO `sys_region` VALUES ('3027', '文山县', '313', 'Wenshan Xian');
INSERT INTO `sys_region` VALUES ('3028', '砚山县', '313', 'Yanshan Xian');
INSERT INTO `sys_region` VALUES ('3029', '西畴县', '313', 'Xichou Xian');
INSERT INTO `sys_region` VALUES ('303', '昆明市', '26', 'Kunming Shi');
INSERT INTO `sys_region` VALUES ('3030', '麻栗坡县', '313', 'Malipo Xian');
INSERT INTO `sys_region` VALUES ('3031', '马关县', '313', 'Maguan Xian');
INSERT INTO `sys_region` VALUES ('3032', '丘北县', '313', 'Qiubei Xian');
INSERT INTO `sys_region` VALUES ('3033', '广南县', '313', 'Guangnan Xian');
INSERT INTO `sys_region` VALUES ('3034', '富宁县', '313', 'Funing Xian');
INSERT INTO `sys_region` VALUES ('3035', '景洪市', '314', 'Jinghong Shi');
INSERT INTO `sys_region` VALUES ('3036', '勐海县', '314', 'Menghai Xian');
INSERT INTO `sys_region` VALUES ('3037', '勐腊县', '314', 'Mengla Xian');
INSERT INTO `sys_region` VALUES ('3038', '大理市', '315', 'Dali Shi');
INSERT INTO `sys_region` VALUES ('3039', '漾濞彝族自治县', '315', 'Yangbi Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('304', '曲靖市', '26', 'Qujing Shi');
INSERT INTO `sys_region` VALUES ('3040', '祥云县', '315', 'Xiangyun Xian');
INSERT INTO `sys_region` VALUES ('3041', '宾川县', '315', 'Binchuan Xian');
INSERT INTO `sys_region` VALUES ('3042', '弥渡县', '315', 'Midu Xian');
INSERT INTO `sys_region` VALUES ('3043', '南涧彝族自治县', '315', 'Nanjian Yizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3044', '巍山彝族回族自治县', '315', 'Weishan Yizu Huizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3045', '永平县', '315', 'Yongping Xian');
INSERT INTO `sys_region` VALUES ('3046', '云龙县', '315', 'Yunlong Xian');
INSERT INTO `sys_region` VALUES ('3047', '洱源县', '315', 'Eryuan Xian');
INSERT INTO `sys_region` VALUES ('3048', '剑川县', '315', 'Jianchuan Xian');
INSERT INTO `sys_region` VALUES ('3049', '鹤庆县', '315', 'Heqing Xian');
INSERT INTO `sys_region` VALUES ('305', '玉溪市', '26', 'Yuxi Shi');
INSERT INTO `sys_region` VALUES ('3050', '瑞丽市', '316', 'Ruili Shi');
INSERT INTO `sys_region` VALUES ('3051', '芒市', '316', 'Luxi Shi');
INSERT INTO `sys_region` VALUES ('3052', '梁河县', '316', 'Lianghe Xian');
INSERT INTO `sys_region` VALUES ('3053', '盈江县', '316', 'Yingjiang Xian');
INSERT INTO `sys_region` VALUES ('3054', '陇川县', '316', 'Longchuan Xian');
INSERT INTO `sys_region` VALUES ('3055', '泸水县', '317', 'Lushui Xian');
INSERT INTO `sys_region` VALUES ('3056', '福贡县', '317', 'Fugong Xian');
INSERT INTO `sys_region` VALUES ('3057', '贡山独龙族怒族自治县', '317', 'Gongshan Dulongzu Nuzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3058', '兰坪白族普米族自治县', '317', 'Lanping Baizu Pumizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3059', '香格里拉县', '318', 'Xianggelila Xian');
INSERT INTO `sys_region` VALUES ('306', '保山市', '26', 'Baoshan Shi');
INSERT INTO `sys_region` VALUES ('3060', '德钦县', '318', 'Deqen Xian');
INSERT INTO `sys_region` VALUES ('3061', '维西傈僳族自治县', '318', 'Weixi Lisuzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3062', '市辖区', '319', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3063', '城关区', '319', 'Chengguang Qu');
INSERT INTO `sys_region` VALUES ('3064', '林周县', '319', 'Lhvnzhub Xian');
INSERT INTO `sys_region` VALUES ('3065', '当雄县', '319', 'Damxung Xian');
INSERT INTO `sys_region` VALUES ('3066', '尼木县', '319', 'Nyemo Xian');
INSERT INTO `sys_region` VALUES ('3067', '曲水县', '319', 'Qvxv Xian');
INSERT INTO `sys_region` VALUES ('3068', '堆龙德庆县', '319', 'Doilungdeqen Xian');
INSERT INTO `sys_region` VALUES ('3069', '达孜县', '319', 'Dagze Xian');
INSERT INTO `sys_region` VALUES ('307', '昭通市', '26', 'Zhaotong Shi');
INSERT INTO `sys_region` VALUES ('3070', '墨竹工卡县', '319', 'Maizhokunggar Xian');
INSERT INTO `sys_region` VALUES ('3071', '昌都县', '320', 'Qamdo Xian');
INSERT INTO `sys_region` VALUES ('3072', '江达县', '320', 'Jomda Xian');
INSERT INTO `sys_region` VALUES ('3073', '贡觉县', '320', 'Konjo Xian');
INSERT INTO `sys_region` VALUES ('3074', '类乌齐县', '320', 'Riwoqe Xian');
INSERT INTO `sys_region` VALUES ('3075', '丁青县', '320', 'Dengqen Xian');
INSERT INTO `sys_region` VALUES ('3076', '察雅县', '320', 'Chagyab Xian');
INSERT INTO `sys_region` VALUES ('3077', '八宿县', '320', 'Baxoi Xian');
INSERT INTO `sys_region` VALUES ('3078', '左贡县', '320', 'Zogang Xian');
INSERT INTO `sys_region` VALUES ('3079', '芒康县', '320', 'Mangkam Xian');
INSERT INTO `sys_region` VALUES ('308', '丽江市', '26', 'Lijiang Shi');
INSERT INTO `sys_region` VALUES ('3080', '洛隆县', '320', 'Lhorong Xian');
INSERT INTO `sys_region` VALUES ('3081', '边坝县', '320', 'Banbar Xian');
INSERT INTO `sys_region` VALUES ('3082', '乃东县', '321', 'Nedong Xian');
INSERT INTO `sys_region` VALUES ('3083', '扎囊县', '321', 'Chanang(Chatang) Xian');
INSERT INTO `sys_region` VALUES ('3084', '贡嘎县', '321', 'Gonggar Xian');
INSERT INTO `sys_region` VALUES ('3085', '桑日县', '321', 'Sangri Xian');
INSERT INTO `sys_region` VALUES ('3086', '琼结县', '321', 'Qonggyai Xian');
INSERT INTO `sys_region` VALUES ('3087', '曲松县', '321', 'Qusum Xian');
INSERT INTO `sys_region` VALUES ('3088', '措美县', '321', 'Comai Xian');
INSERT INTO `sys_region` VALUES ('3089', '洛扎县', '321', 'Lhozhag Xian');
INSERT INTO `sys_region` VALUES ('309', '普洱市', '26', 'Simao Shi');
INSERT INTO `sys_region` VALUES ('3090', '加查县', '321', 'Gyaca Xian');
INSERT INTO `sys_region` VALUES ('3091', '隆子县', '321', 'Lhvnze Xian');
INSERT INTO `sys_region` VALUES ('3092', '错那县', '321', 'Cona Xian');
INSERT INTO `sys_region` VALUES ('3093', '浪卡子县', '321', 'Nagarze Xian');
INSERT INTO `sys_region` VALUES ('3094', '日喀则市', '322', 'Xigaze Shi');
INSERT INTO `sys_region` VALUES ('3095', '南木林县', '322', 'Namling Xian');
INSERT INTO `sys_region` VALUES ('3096', '江孜县', '322', 'Gyangze Xian');
INSERT INTO `sys_region` VALUES ('3097', '定日县', '322', 'Tingri Xian');
INSERT INTO `sys_region` VALUES ('3098', '萨迦县', '322', 'Sa,gya Xian');
INSERT INTO `sys_region` VALUES ('3099', '拉孜县', '322', 'Lhaze Xian');
INSERT INTO `sys_region` VALUES ('31', '宁夏回族自治区', '1', 'Ningxia Huizu Zizhiqu');
INSERT INTO `sys_region` VALUES ('310', '临沧市', '26', 'Lincang Shi');
INSERT INTO `sys_region` VALUES ('3100', '昂仁县', '322', 'Ngamring Xian');
INSERT INTO `sys_region` VALUES ('3101', '谢通门县', '322', 'Xaitongmoin Xian');
INSERT INTO `sys_region` VALUES ('3102', '白朗县', '322', 'Bainang Xian');
INSERT INTO `sys_region` VALUES ('3103', '仁布县', '322', 'Rinbung Xian');
INSERT INTO `sys_region` VALUES ('3104', '康马县', '322', 'Kangmar Xian');
INSERT INTO `sys_region` VALUES ('3105', '定结县', '322', 'Dinggye Xian');
INSERT INTO `sys_region` VALUES ('3106', '仲巴县', '322', 'Zhongba Xian');
INSERT INTO `sys_region` VALUES ('3107', '亚东县', '322', 'Yadong(Chomo) Xian');
INSERT INTO `sys_region` VALUES ('3108', '吉隆县', '322', 'Gyirong Xian');
INSERT INTO `sys_region` VALUES ('3109', '聂拉木县', '322', 'Nyalam Xian');
INSERT INTO `sys_region` VALUES ('311', '楚雄彝族自治州', '26', 'Chuxiong Yizu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3110', '萨嘎县', '322', 'Saga Xian');
INSERT INTO `sys_region` VALUES ('3111', '岗巴县', '322', 'Gamba Xian');
INSERT INTO `sys_region` VALUES ('3112', '那曲县', '323', 'Nagqu Xian');
INSERT INTO `sys_region` VALUES ('3113', '嘉黎县', '323', 'Lhari Xian');
INSERT INTO `sys_region` VALUES ('3114', '比如县', '323', 'Biru Xian');
INSERT INTO `sys_region` VALUES ('3115', '聂荣县', '323', 'Nyainrong Xian');
INSERT INTO `sys_region` VALUES ('3116', '安多县', '323', 'Amdo Xian');
INSERT INTO `sys_region` VALUES ('3117', '申扎县', '323', 'Xainza Xian');
INSERT INTO `sys_region` VALUES ('3118', '索县', '323', 'Sog Xian');
INSERT INTO `sys_region` VALUES ('3119', '班戈县', '323', 'Bangoin Xian');
INSERT INTO `sys_region` VALUES ('312', '红河哈尼族彝族自治州', '26', 'Honghe Hanizu Yizu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3120', '巴青县', '323', 'Baqen Xian');
INSERT INTO `sys_region` VALUES ('3121', '尼玛县', '323', 'Nyima Xian');
INSERT INTO `sys_region` VALUES ('3122', '普兰县', '324', 'Burang Xian');
INSERT INTO `sys_region` VALUES ('3123', '札达县', '324', 'Zanda Xian');
INSERT INTO `sys_region` VALUES ('3124', '噶尔县', '324', 'Gar Xian');
INSERT INTO `sys_region` VALUES ('3125', '日土县', '324', 'Rutog Xian');
INSERT INTO `sys_region` VALUES ('3126', '革吉县', '324', 'Ge,gyai Xian');
INSERT INTO `sys_region` VALUES ('3127', '改则县', '324', 'Gerze Xian');
INSERT INTO `sys_region` VALUES ('3128', '措勤县', '324', 'Coqen Xian');
INSERT INTO `sys_region` VALUES ('3129', '林芝县', '325', 'Nyingchi Xian');
INSERT INTO `sys_region` VALUES ('313', '文山壮族苗族自治州', '26', 'Wenshan Zhuangzu Miaozu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3130', '工布江达县', '325', 'Gongbo,gyamda Xian');
INSERT INTO `sys_region` VALUES ('3131', '米林县', '325', 'Mainling Xian');
INSERT INTO `sys_region` VALUES ('3132', '墨脱县', '325', 'Metog Xian');
INSERT INTO `sys_region` VALUES ('3133', '波密县', '325', 'Bomi(Bowo) Xian');
INSERT INTO `sys_region` VALUES ('3134', '察隅县', '325', 'Zayv Xian');
INSERT INTO `sys_region` VALUES ('3135', '朗县', '325', 'Nang Xian');
INSERT INTO `sys_region` VALUES ('3136', '市辖区', '326', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3137', '新城区', '326', 'Xincheng Qu');
INSERT INTO `sys_region` VALUES ('3138', '碑林区', '326', 'Beilin Qu');
INSERT INTO `sys_region` VALUES ('3139', '莲湖区', '326', 'Lianhu Qu');
INSERT INTO `sys_region` VALUES ('314', '西双版纳傣族自治州', '26', 'Xishuangbanna Daizu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3140', '灞桥区', '326', 'Baqiao Qu');
INSERT INTO `sys_region` VALUES ('3141', '未央区', '326', 'Weiyang Qu');
INSERT INTO `sys_region` VALUES ('3142', '雁塔区', '326', 'Yanta Qu');
INSERT INTO `sys_region` VALUES ('3143', '阎良区', '326', 'Yanliang Qu');
INSERT INTO `sys_region` VALUES ('3144', '临潼区', '326', 'Lintong Qu');
INSERT INTO `sys_region` VALUES ('3145', '长安区', '326', 'Changan Qu');
INSERT INTO `sys_region` VALUES ('3146', '蓝田县', '326', 'Lantian Xian');
INSERT INTO `sys_region` VALUES ('3147', '周至县', '326', 'Zhouzhi Xian');
INSERT INTO `sys_region` VALUES ('3148', '户县', '326', 'Hu Xian');
INSERT INTO `sys_region` VALUES ('3149', '高陵县', '326', 'Gaoling Xian');
INSERT INTO `sys_region` VALUES ('315', '大理白族自治州', '26', 'Dali Baizu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3150', '市辖区', '327', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3151', '王益区', '327', 'Wangyi Qu');
INSERT INTO `sys_region` VALUES ('3152', '印台区', '327', 'Yintai Qu');
INSERT INTO `sys_region` VALUES ('3153', '耀州区', '327', 'Yaozhou Qu');
INSERT INTO `sys_region` VALUES ('3154', '宜君县', '327', 'Yijun Xian');
INSERT INTO `sys_region` VALUES ('3155', '市辖区', '328', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3156', '渭滨区', '328', 'Weibin Qu');
INSERT INTO `sys_region` VALUES ('3157', '金台区', '328', 'Jintai Qu');
INSERT INTO `sys_region` VALUES ('3158', '陈仓区', '328', 'Chencang Qu');
INSERT INTO `sys_region` VALUES ('3159', '凤翔县', '328', 'Fengxiang Xian');
INSERT INTO `sys_region` VALUES ('316', '德宏傣族景颇族自治州', '26', 'Dehong Daizu Jingpozu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3160', '岐山县', '328', 'Qishan Xian');
INSERT INTO `sys_region` VALUES ('3161', '扶风县', '328', 'Fufeng Xian');
INSERT INTO `sys_region` VALUES ('3162', '眉县', '328', 'Mei Xian');
INSERT INTO `sys_region` VALUES ('3163', '陇县', '328', 'Long Xian');
INSERT INTO `sys_region` VALUES ('3164', '千阳县', '328', 'Qianyang Xian');
INSERT INTO `sys_region` VALUES ('3165', '麟游县', '328', 'Linyou Xian');
INSERT INTO `sys_region` VALUES ('3166', '凤县', '328', 'Feng Xian');
INSERT INTO `sys_region` VALUES ('3167', '太白县', '328', 'Taibai Xian');
INSERT INTO `sys_region` VALUES ('3168', '市辖区', '329', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3169', '秦都区', '329', 'Qindu Qu');
INSERT INTO `sys_region` VALUES ('317', '怒江傈僳族自治州', '26', 'Nujiang Lisuzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3170', '杨陵区', '329', 'Yangling Qu');
INSERT INTO `sys_region` VALUES ('3171', '渭城区', '329', 'Weicheng Qu');
INSERT INTO `sys_region` VALUES ('3172', '三原县', '329', 'Sanyuan Xian');
INSERT INTO `sys_region` VALUES ('3173', '泾阳县', '329', 'Jingyang Xian');
INSERT INTO `sys_region` VALUES ('3174', '乾县', '329', 'Qian Xian');
INSERT INTO `sys_region` VALUES ('3175', '礼泉县', '329', 'Liquan Xian');
INSERT INTO `sys_region` VALUES ('3176', '永寿县', '329', 'Yongshou Xian');
INSERT INTO `sys_region` VALUES ('3177', '彬县', '329', 'Bin Xian');
INSERT INTO `sys_region` VALUES ('3178', '长武县', '329', 'Changwu Xian');
INSERT INTO `sys_region` VALUES ('3179', '旬邑县', '329', 'Xunyi Xian');
INSERT INTO `sys_region` VALUES ('318', '迪庆藏族自治州', '26', 'Deqen Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3180', '淳化县', '329', 'Chunhua Xian');
INSERT INTO `sys_region` VALUES ('3181', '武功县', '329', 'Wugong Xian');
INSERT INTO `sys_region` VALUES ('3182', '兴平市', '329', 'Xingping Shi');
INSERT INTO `sys_region` VALUES ('3183', '市辖区', '330', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3184', '临渭区', '330', 'Linwei Qu');
INSERT INTO `sys_region` VALUES ('3185', '华县', '330', 'Hua Xian');
INSERT INTO `sys_region` VALUES ('3186', '潼关县', '330', 'Tongguan Xian');
INSERT INTO `sys_region` VALUES ('3187', '大荔县', '330', 'Dali Xian');
INSERT INTO `sys_region` VALUES ('3188', '合阳县', '330', 'Heyang Xian');
INSERT INTO `sys_region` VALUES ('3189', '澄城县', '330', 'Chengcheng Xian');
INSERT INTO `sys_region` VALUES ('319', '拉萨市', '27', 'Lhasa Shi');
INSERT INTO `sys_region` VALUES ('3190', '蒲城县', '330', 'Pucheng Xian');
INSERT INTO `sys_region` VALUES ('3191', '白水县', '330', 'Baishui Xian');
INSERT INTO `sys_region` VALUES ('3192', '富平县', '330', 'Fuping Xian');
INSERT INTO `sys_region` VALUES ('3193', '韩城市', '330', 'Hancheng Shi');
INSERT INTO `sys_region` VALUES ('3194', '华阴市', '330', 'Huayin Shi');
INSERT INTO `sys_region` VALUES ('3195', '市辖区', '331', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3196', '宝塔区', '331', 'Baota Qu');
INSERT INTO `sys_region` VALUES ('3197', '延长县', '331', 'Yanchang Xian');
INSERT INTO `sys_region` VALUES ('3198', '延川县', '331', 'Yanchuan Xian');
INSERT INTO `sys_region` VALUES ('3199', '子长县', '331', 'Zichang Xian');
INSERT INTO `sys_region` VALUES ('32', '新疆维吾尔自治区', '1', 'Xinjiang Uygur Zizhiqu');
INSERT INTO `sys_region` VALUES ('320', '昌都地区', '27', 'Qamdo Diqu');
INSERT INTO `sys_region` VALUES ('3200', '安塞县', '331', 'Ansai Xian');
INSERT INTO `sys_region` VALUES ('3201', '志丹县', '331', 'Zhidan Xian');
INSERT INTO `sys_region` VALUES ('3202', '吴起县', '331', 'Wuqi Xian');
INSERT INTO `sys_region` VALUES ('3203', '甘泉县', '331', 'Ganquan Xian');
INSERT INTO `sys_region` VALUES ('3204', '富县', '331', 'Fu Xian');
INSERT INTO `sys_region` VALUES ('3205', '洛川县', '331', 'Luochuan Xian');
INSERT INTO `sys_region` VALUES ('3206', '宜川县', '331', 'Yichuan Xian');
INSERT INTO `sys_region` VALUES ('3207', '黄龙县', '331', 'Huanglong Xian');
INSERT INTO `sys_region` VALUES ('3208', '黄陵县', '331', 'Huangling Xian');
INSERT INTO `sys_region` VALUES ('3209', '市辖区', '332', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('321', '山南地区', '27', 'Shannan Diqu');
INSERT INTO `sys_region` VALUES ('3210', '汉台区', '332', 'Hantai Qu');
INSERT INTO `sys_region` VALUES ('3211', '南郑县', '332', 'Nanzheng Xian');
INSERT INTO `sys_region` VALUES ('3212', '城固县', '332', 'Chenggu Xian');
INSERT INTO `sys_region` VALUES ('3213', '洋县', '332', 'Yang Xian');
INSERT INTO `sys_region` VALUES ('3214', '西乡县', '332', 'Xixiang Xian');
INSERT INTO `sys_region` VALUES ('3215', '勉县', '332', 'Mian Xian');
INSERT INTO `sys_region` VALUES ('3216', '宁强县', '332', 'Ningqiang Xian');
INSERT INTO `sys_region` VALUES ('3217', '略阳县', '332', 'Lueyang Xian');
INSERT INTO `sys_region` VALUES ('3218', '镇巴县', '332', 'Zhenba Xian');
INSERT INTO `sys_region` VALUES ('3219', '留坝县', '332', 'Liuba Xian');
INSERT INTO `sys_region` VALUES ('322', '日喀则地区', '27', 'Xigaze Diqu');
INSERT INTO `sys_region` VALUES ('3220', '佛坪县', '332', 'Foping Xian');
INSERT INTO `sys_region` VALUES ('3221', '市辖区', '333', '1');
INSERT INTO `sys_region` VALUES ('3222', '榆阳区', '333', 'Yuyang Qu');
INSERT INTO `sys_region` VALUES ('3223', '神木县', '333', 'Shenmu Xian');
INSERT INTO `sys_region` VALUES ('3224', '府谷县', '333', 'Fugu Xian');
INSERT INTO `sys_region` VALUES ('3225', '横山县', '333', 'Hengshan Xian');
INSERT INTO `sys_region` VALUES ('3226', '靖边县', '333', 'Jingbian Xian');
INSERT INTO `sys_region` VALUES ('3227', '定边县', '333', 'Dingbian Xian');
INSERT INTO `sys_region` VALUES ('3228', '绥德县', '333', 'Suide Xian');
INSERT INTO `sys_region` VALUES ('3229', '米脂县', '333', 'Mizhi Xian');
INSERT INTO `sys_region` VALUES ('323', '那曲地区', '27', 'Nagqu Diqu');
INSERT INTO `sys_region` VALUES ('3230', '佳县', '333', 'Jia Xian');
INSERT INTO `sys_region` VALUES ('3231', '吴堡县', '333', 'Wubu Xian');
INSERT INTO `sys_region` VALUES ('3232', '清涧县', '333', 'Qingjian Xian');
INSERT INTO `sys_region` VALUES ('3233', '子洲县', '333', 'Zizhou Xian');
INSERT INTO `sys_region` VALUES ('3234', '市辖区', '334', '1');
INSERT INTO `sys_region` VALUES ('3235', '汉滨区', '334', 'Hanbin Qu');
INSERT INTO `sys_region` VALUES ('3236', '汉阴县', '334', 'Hanyin Xian');
INSERT INTO `sys_region` VALUES ('3237', '石泉县', '334', 'Shiquan Xian');
INSERT INTO `sys_region` VALUES ('3238', '宁陕县', '334', 'Ningshan Xian');
INSERT INTO `sys_region` VALUES ('3239', '紫阳县', '334', 'Ziyang Xian');
INSERT INTO `sys_region` VALUES ('324', '阿里地区', '27', 'Ngari Diqu');
INSERT INTO `sys_region` VALUES ('3240', '岚皋县', '334', 'Langao Xian');
INSERT INTO `sys_region` VALUES ('3241', '平利县', '334', 'Pingli Xian');
INSERT INTO `sys_region` VALUES ('3242', '镇坪县', '334', 'Zhenping Xian');
INSERT INTO `sys_region` VALUES ('3243', '旬阳县', '334', 'Xunyang Xian');
INSERT INTO `sys_region` VALUES ('3244', '白河县', '334', 'Baihe Xian');
INSERT INTO `sys_region` VALUES ('3245', '市辖区', '335', '1');
INSERT INTO `sys_region` VALUES ('3246', '商州区', '335', 'Shangzhou Qu');
INSERT INTO `sys_region` VALUES ('3247', '洛南县', '335', 'Luonan Xian');
INSERT INTO `sys_region` VALUES ('3248', '丹凤县', '335', 'Danfeng Xian');
INSERT INTO `sys_region` VALUES ('3249', '商南县', '335', 'Shangnan Xian');
INSERT INTO `sys_region` VALUES ('325', '林芝地区', '27', 'Nyingchi Diqu');
INSERT INTO `sys_region` VALUES ('3250', '山阳县', '335', 'Shanyang Xian');
INSERT INTO `sys_region` VALUES ('3251', '镇安县', '335', 'Zhen,an Xian');
INSERT INTO `sys_region` VALUES ('3252', '柞水县', '335', 'Zhashui Xian');
INSERT INTO `sys_region` VALUES ('3253', '市辖区', '336', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3254', '城关区', '336', 'Chengguan Qu');
INSERT INTO `sys_region` VALUES ('3255', '七里河区', '336', 'Qilihe Qu');
INSERT INTO `sys_region` VALUES ('3256', '西固区', '336', 'Xigu Qu');
INSERT INTO `sys_region` VALUES ('3257', '安宁区', '336', 'Anning Qu');
INSERT INTO `sys_region` VALUES ('3258', '红古区', '336', 'Honggu Qu');
INSERT INTO `sys_region` VALUES ('3259', '永登县', '336', 'Yongdeng Xian');
INSERT INTO `sys_region` VALUES ('326', '西安市', '28', 'Xi,an Shi');
INSERT INTO `sys_region` VALUES ('3260', '皋兰县', '336', 'Gaolan Xian');
INSERT INTO `sys_region` VALUES ('3261', '榆中县', '336', 'Yuzhong Xian');
INSERT INTO `sys_region` VALUES ('3262', '市辖区', '337', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3263', '市辖区', '338', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3264', '金川区', '338', 'Jinchuan Qu');
INSERT INTO `sys_region` VALUES ('3265', '永昌县', '338', 'Yongchang Xian');
INSERT INTO `sys_region` VALUES ('3266', '市辖区', '339', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3267', '白银区', '339', 'Baiyin Qu');
INSERT INTO `sys_region` VALUES ('3268', '平川区', '339', 'Pingchuan Qu');
INSERT INTO `sys_region` VALUES ('3269', '靖远县', '339', 'Jingyuan Xian');
INSERT INTO `sys_region` VALUES ('327', '铜川市', '28', 'Tongchuan Shi');
INSERT INTO `sys_region` VALUES ('3270', '会宁县', '339', 'Huining xian');
INSERT INTO `sys_region` VALUES ('3271', '景泰县', '339', 'Jingtai Xian');
INSERT INTO `sys_region` VALUES ('3272', '市辖区', '340', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3274', '秦州区', '340', 'Beidao Qu');
INSERT INTO `sys_region` VALUES ('3275', '清水县', '340', 'Qingshui Xian');
INSERT INTO `sys_region` VALUES ('3276', '秦安县', '340', 'Qin,an Xian');
INSERT INTO `sys_region` VALUES ('3277', '甘谷县', '340', 'Gangu Xian');
INSERT INTO `sys_region` VALUES ('3278', '武山县', '340', 'Wushan Xian');
INSERT INTO `sys_region` VALUES ('3279', '张家川回族自治县', '340', 'Zhangjiachuan Huizu Zizhixian');
INSERT INTO `sys_region` VALUES ('328', '宝鸡市', '28', 'Baoji Shi');
INSERT INTO `sys_region` VALUES ('3280', '市辖区', '341', '1');
INSERT INTO `sys_region` VALUES ('3281', '凉州区', '341', 'Liangzhou Qu');
INSERT INTO `sys_region` VALUES ('3282', '民勤县', '341', 'Minqin Xian');
INSERT INTO `sys_region` VALUES ('3283', '古浪县', '341', 'Gulang Xian');
INSERT INTO `sys_region` VALUES ('3284', '天祝藏族自治县', '341', 'Tianzhu Zangzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3285', '市辖区', '342', '1');
INSERT INTO `sys_region` VALUES ('3286', '甘州区', '342', 'Ganzhou Qu');
INSERT INTO `sys_region` VALUES ('3287', '肃南裕固族自治县', '342', 'Sunan Yugurzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3288', '民乐县', '342', 'Minle Xian');
INSERT INTO `sys_region` VALUES ('3289', '临泽县', '342', 'Linze Xian');
INSERT INTO `sys_region` VALUES ('329', '咸阳市', '28', 'Xianyang Shi');
INSERT INTO `sys_region` VALUES ('3290', '高台县', '342', 'Gaotai Xian');
INSERT INTO `sys_region` VALUES ('3291', '山丹县', '342', 'Shandan Xian');
INSERT INTO `sys_region` VALUES ('3292', '市辖区', '343', '1');
INSERT INTO `sys_region` VALUES ('3293', '崆峒区', '343', 'Kongdong Qu');
INSERT INTO `sys_region` VALUES ('3294', '泾川县', '343', 'Jingchuan Xian');
INSERT INTO `sys_region` VALUES ('3295', '灵台县', '343', 'Lingtai Xian');
INSERT INTO `sys_region` VALUES ('3296', '崇信县', '343', 'Chongxin Xian');
INSERT INTO `sys_region` VALUES ('3297', '华亭县', '343', 'Huating Xian');
INSERT INTO `sys_region` VALUES ('3298', '庄浪县', '343', 'Zhuanglang Xian');
INSERT INTO `sys_region` VALUES ('3299', '静宁县', '343', 'Jingning Xian');
INSERT INTO `sys_region` VALUES ('33', '市辖区', '2', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('330', '渭南市', '28', 'Weinan Shi');
INSERT INTO `sys_region` VALUES ('3300', '市辖区', '344', '1');
INSERT INTO `sys_region` VALUES ('3301', '肃州区', '344', 'Suzhou Qu');
INSERT INTO `sys_region` VALUES ('3302', '金塔县', '344', 'Jinta Xian');
INSERT INTO `sys_region` VALUES ('3304', '肃北蒙古族自治县', '344', 'Subei Monguzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3305', '阿克塞哈萨克族自治县', '344', 'Aksay Kazakzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3306', '玉门市', '344', 'Yumen Shi');
INSERT INTO `sys_region` VALUES ('3307', '敦煌市', '344', 'Dunhuang Shi');
INSERT INTO `sys_region` VALUES ('3308', '市辖区', '345', '1');
INSERT INTO `sys_region` VALUES ('3309', '西峰区', '345', 'Xifeng Qu');
INSERT INTO `sys_region` VALUES ('331', '延安市', '28', 'Yan,an Shi');
INSERT INTO `sys_region` VALUES ('3310', '庆城县', '345', 'Qingcheng Xian');
INSERT INTO `sys_region` VALUES ('3311', '环县', '345', 'Huan Xian');
INSERT INTO `sys_region` VALUES ('3312', '华池县', '345', 'Huachi Xian');
INSERT INTO `sys_region` VALUES ('3313', '合水县', '345', 'Heshui Xian');
INSERT INTO `sys_region` VALUES ('3314', '正宁县', '345', 'Zhengning Xian');
INSERT INTO `sys_region` VALUES ('3315', '宁县', '345', 'Ning Xian');
INSERT INTO `sys_region` VALUES ('3316', '镇原县', '345', 'Zhenyuan Xian');
INSERT INTO `sys_region` VALUES ('3317', '市辖区', '346', '1');
INSERT INTO `sys_region` VALUES ('3318', '安定区', '346', 'Anding Qu');
INSERT INTO `sys_region` VALUES ('3319', '通渭县', '346', 'Tongwei Xian');
INSERT INTO `sys_region` VALUES ('332', '汉中市', '28', 'Hanzhong Shi');
INSERT INTO `sys_region` VALUES ('3320', '陇西县', '346', 'Longxi Xian');
INSERT INTO `sys_region` VALUES ('3321', '渭源县', '346', 'Weiyuan Xian');
INSERT INTO `sys_region` VALUES ('3322', '临洮县', '346', 'Lintao Xian');
INSERT INTO `sys_region` VALUES ('3323', '漳县', '346', 'Zhang Xian');
INSERT INTO `sys_region` VALUES ('3324', '岷县', '346', 'Min Xian');
INSERT INTO `sys_region` VALUES ('3325', '市辖区', '347', '1');
INSERT INTO `sys_region` VALUES ('3326', '武都区', '347', 'Wudu Qu');
INSERT INTO `sys_region` VALUES ('3327', '成县', '347', 'Cheng Xian');
INSERT INTO `sys_region` VALUES ('3328', '文县', '347', 'Wen Xian');
INSERT INTO `sys_region` VALUES ('3329', '宕昌县', '347', 'Dangchang Xian');
INSERT INTO `sys_region` VALUES ('333', '榆林市', '28', 'Yulin Shi');
INSERT INTO `sys_region` VALUES ('3330', '康县', '347', 'Kang Xian');
INSERT INTO `sys_region` VALUES ('3331', '西和县', '347', 'Xihe Xian');
INSERT INTO `sys_region` VALUES ('3332', '礼县', '347', 'Li Xian');
INSERT INTO `sys_region` VALUES ('3333', '徽县', '347', 'Hui Xian');
INSERT INTO `sys_region` VALUES ('3334', '两当县', '347', 'Liangdang Xian');
INSERT INTO `sys_region` VALUES ('3335', '临夏市', '348', 'Linxia Shi');
INSERT INTO `sys_region` VALUES ('3336', '临夏县', '348', 'Linxia Xian');
INSERT INTO `sys_region` VALUES ('3337', '康乐县', '348', 'Kangle Xian');
INSERT INTO `sys_region` VALUES ('3338', '永靖县', '348', 'Yongjing Xian');
INSERT INTO `sys_region` VALUES ('3339', '广河县', '348', 'Guanghe Xian');
INSERT INTO `sys_region` VALUES ('334', '安康市', '28', 'Ankang Shi');
INSERT INTO `sys_region` VALUES ('3340', '和政县', '348', 'Hezheng Xian');
INSERT INTO `sys_region` VALUES ('3341', '东乡族自治县', '348', 'Dongxiangzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3342', '积石山保安族东乡族撒拉族自治县', '348', 'Jishishan Bonanzu Dongxiangzu Salarzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3343', '合作市', '349', 'Hezuo Shi');
INSERT INTO `sys_region` VALUES ('3344', '临潭县', '349', 'Lintan Xian');
INSERT INTO `sys_region` VALUES ('3345', '卓尼县', '349', 'Jone');
INSERT INTO `sys_region` VALUES ('3346', '舟曲县', '349', 'Zhugqu Xian');
INSERT INTO `sys_region` VALUES ('3347', '迭部县', '349', 'Tewo Xian');
INSERT INTO `sys_region` VALUES ('3348', '玛曲县', '349', 'Maqu Xian');
INSERT INTO `sys_region` VALUES ('3349', '碌曲县', '349', 'Luqu Xian');
INSERT INTO `sys_region` VALUES ('335', '商洛市', '28', 'Shangluo Shi');
INSERT INTO `sys_region` VALUES ('3350', '夏河县', '349', 'Xiahe Xian');
INSERT INTO `sys_region` VALUES ('3351', '市辖区', '350', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3352', '城东区', '350', 'Chengdong Qu');
INSERT INTO `sys_region` VALUES ('3353', '城中区', '350', 'Chengzhong Qu');
INSERT INTO `sys_region` VALUES ('3354', '城西区', '350', 'Chengxi Qu');
INSERT INTO `sys_region` VALUES ('3355', '城北区', '350', 'Chengbei Qu');
INSERT INTO `sys_region` VALUES ('3356', '大通回族土族自治县', '350', 'Datong Huizu Tuzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3357', '湟中县', '350', 'Huangzhong Xian');
INSERT INTO `sys_region` VALUES ('3358', '湟源县', '350', 'Huangyuan Xian');
INSERT INTO `sys_region` VALUES ('3359', '平安县', '351', 'Ping,an Xian');
INSERT INTO `sys_region` VALUES ('336', '兰州市', '29', 'Lanzhou Shi');
INSERT INTO `sys_region` VALUES ('3360', '民和回族土族自治县', '351', 'Minhe Huizu Tuzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3361', '乐都县', '351', 'Ledu Xian');
INSERT INTO `sys_region` VALUES ('3362', '互助土族自治县', '351', 'Huzhu Tuzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3363', '化隆回族自治县', '351', 'Hualong Huizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3364', '循化撒拉族自治县', '351', 'Xunhua Salazu Zizhixian');
INSERT INTO `sys_region` VALUES ('3365', '门源回族自治县', '352', 'Menyuan Huizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3366', '祁连县', '352', 'Qilian Xian');
INSERT INTO `sys_region` VALUES ('3367', '海晏县', '352', 'Haiyan Xian');
INSERT INTO `sys_region` VALUES ('3368', '刚察县', '352', 'Gangca Xian');
INSERT INTO `sys_region` VALUES ('3369', '同仁县', '353', 'Tongren Xian');
INSERT INTO `sys_region` VALUES ('337', '嘉峪关市', '29', 'Jiayuguan Shi');
INSERT INTO `sys_region` VALUES ('3370', '尖扎县', '353', 'Jainca Xian');
INSERT INTO `sys_region` VALUES ('3371', '泽库县', '353', 'Zekog Xian');
INSERT INTO `sys_region` VALUES ('3372', '河南蒙古族自治县', '353', 'Henan Mongolzu Zizhixian');
INSERT INTO `sys_region` VALUES ('3373', '共和县', '354', 'Gonghe Xian');
INSERT INTO `sys_region` VALUES ('3374', '同德县', '354', 'Tongde Xian');
INSERT INTO `sys_region` VALUES ('3375', '贵德县', '354', 'Guide Xian');
INSERT INTO `sys_region` VALUES ('3376', '兴海县', '354', 'Xinghai Xian');
INSERT INTO `sys_region` VALUES ('3377', '贵南县', '354', 'Guinan Xian');
INSERT INTO `sys_region` VALUES ('3378', '玛沁县', '355', 'Maqen Xian');
INSERT INTO `sys_region` VALUES ('3379', '班玛县', '355', 'Baima Xian');
INSERT INTO `sys_region` VALUES ('338', '金昌市', '29', 'Jinchang Shi');
INSERT INTO `sys_region` VALUES ('3380', '甘德县', '355', 'Gade Xian');
INSERT INTO `sys_region` VALUES ('3381', '达日县', '355', 'Tarlag Xian');
INSERT INTO `sys_region` VALUES ('3382', '久治县', '355', 'Jigzhi Xian');
INSERT INTO `sys_region` VALUES ('3383', '玛多县', '355', 'Madoi Xian');
INSERT INTO `sys_region` VALUES ('3384', '玉树县', '356', 'Yushu Xian');
INSERT INTO `sys_region` VALUES ('3385', '杂多县', '356', 'Zadoi Xian');
INSERT INTO `sys_region` VALUES ('3386', '称多县', '356', 'Chindu Xian');
INSERT INTO `sys_region` VALUES ('3387', '治多县', '356', 'Zhidoi Xian');
INSERT INTO `sys_region` VALUES ('3388', '囊谦县', '356', 'Nangqen Xian');
INSERT INTO `sys_region` VALUES ('3389', '曲麻莱县', '356', 'Qumarleb Xian');
INSERT INTO `sys_region` VALUES ('339', '白银市', '29', 'Baiyin Shi');
INSERT INTO `sys_region` VALUES ('3390', '格尔木市', '357', 'Golmud Shi');
INSERT INTO `sys_region` VALUES ('3391', '德令哈市', '357', 'Delhi Shi');
INSERT INTO `sys_region` VALUES ('3392', '乌兰县', '357', 'Ulan Xian');
INSERT INTO `sys_region` VALUES ('3393', '都兰县', '357', 'Dulan Xian');
INSERT INTO `sys_region` VALUES ('3394', '天峻县', '357', 'Tianjun Xian');
INSERT INTO `sys_region` VALUES ('3395', '市辖区', '358', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3396', '兴庆区', '358', 'Xingqing Qu');
INSERT INTO `sys_region` VALUES ('3397', '西夏区', '358', 'Xixia Qu');
INSERT INTO `sys_region` VALUES ('3398', '金凤区', '358', 'Jinfeng Qu');
INSERT INTO `sys_region` VALUES ('3399', '永宁县', '358', 'Yongning Xian');
INSERT INTO `sys_region` VALUES ('34', '县', '2', 'Xian');
INSERT INTO `sys_region` VALUES ('340', '天水市', '29', 'Tianshui Shi');
INSERT INTO `sys_region` VALUES ('3400', '贺兰县', '358', 'Helan Xian');
INSERT INTO `sys_region` VALUES ('3401', '灵武市', '358', 'Lingwu Shi');
INSERT INTO `sys_region` VALUES ('3402', '市辖区', '359', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3403', '大武口区', '359', 'Dawukou Qu');
INSERT INTO `sys_region` VALUES ('3404', '惠农区', '359', 'Huinong Qu');
INSERT INTO `sys_region` VALUES ('3405', '平罗县', '359', 'Pingluo Xian');
INSERT INTO `sys_region` VALUES ('3406', '市辖区', '360', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3407', '利通区', '360', 'Litong Qu');
INSERT INTO `sys_region` VALUES ('3408', '盐池县', '360', 'Yanchi Xian');
INSERT INTO `sys_region` VALUES ('3409', '同心县', '360', 'Tongxin Xian');
INSERT INTO `sys_region` VALUES ('341', '武威市', '29', 'Wuwei Shi');
INSERT INTO `sys_region` VALUES ('3410', '青铜峡市', '360', 'Qingtongxia Xian');
INSERT INTO `sys_region` VALUES ('3411', '市辖区', '361', '1');
INSERT INTO `sys_region` VALUES ('3412', '原州区', '361', 'Yuanzhou Qu');
INSERT INTO `sys_region` VALUES ('3413', '西吉县', '361', 'Xiji Xian');
INSERT INTO `sys_region` VALUES ('3414', '隆德县', '361', 'Longde Xian');
INSERT INTO `sys_region` VALUES ('3415', '泾源县', '361', 'Jingyuan Xian');
INSERT INTO `sys_region` VALUES ('3416', '彭阳县', '361', 'Pengyang Xian');
INSERT INTO `sys_region` VALUES ('3417', '市辖区', '362', '1');
INSERT INTO `sys_region` VALUES ('3418', '沙坡头区', '362', 'Shapotou Qu');
INSERT INTO `sys_region` VALUES ('3419', '中宁县', '362', 'Zhongning Xian');
INSERT INTO `sys_region` VALUES ('342', '张掖市', '29', 'Zhangye Shi');
INSERT INTO `sys_region` VALUES ('3420', '海原县', '362', 'Haiyuan Xian');
INSERT INTO `sys_region` VALUES ('3421', '市辖区', '363', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3422', '天山区', '363', 'Tianshan Qu');
INSERT INTO `sys_region` VALUES ('3423', '沙依巴克区', '363', 'Saybag Qu');
INSERT INTO `sys_region` VALUES ('3424', '新市区', '363', 'Xinshi Qu');
INSERT INTO `sys_region` VALUES ('3425', '水磨沟区', '363', 'Shuimogou Qu');
INSERT INTO `sys_region` VALUES ('3426', '头屯河区', '363', 'Toutunhe Qu');
INSERT INTO `sys_region` VALUES ('3427', '达坂城区', '363', 'Dabancheng Qu');
INSERT INTO `sys_region` VALUES ('3428', '米东区', '363', 'Midong Qu');
INSERT INTO `sys_region` VALUES ('3429', '乌鲁木齐县', '363', 'Urumqi Xian');
INSERT INTO `sys_region` VALUES ('343', '平凉市', '29', 'Pingliang Shi');
INSERT INTO `sys_region` VALUES ('3430', '市辖区', '364', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('3431', '独山子区', '364', 'Dushanzi Qu');
INSERT INTO `sys_region` VALUES ('3432', '克拉玛依区', '364', 'Karamay Qu');
INSERT INTO `sys_region` VALUES ('3433', '白碱滩区', '364', 'Baijiantan Qu');
INSERT INTO `sys_region` VALUES ('3434', '乌尔禾区', '364', 'Orku Qu');
INSERT INTO `sys_region` VALUES ('3435', '吐鲁番市', '365', 'Turpan Shi');
INSERT INTO `sys_region` VALUES ('3436', '鄯善县', '365', 'Shanshan(piqan) Xian');
INSERT INTO `sys_region` VALUES ('3437', '托克逊县', '365', 'Toksun Xian');
INSERT INTO `sys_region` VALUES ('3438', '哈密市', '366', 'Hami(kumul) Shi');
INSERT INTO `sys_region` VALUES ('3439', '巴里坤哈萨克自治县', '366', 'Barkol Kazak Zizhixian');
INSERT INTO `sys_region` VALUES ('344', '酒泉市', '29', 'Jiuquan Shi');
INSERT INTO `sys_region` VALUES ('3440', '伊吾县', '366', 'Yiwu(Araturuk) Xian');
INSERT INTO `sys_region` VALUES ('3441', '昌吉市', '367', 'Changji Shi');
INSERT INTO `sys_region` VALUES ('3442', '阜康市', '367', 'Fukang Shi');
INSERT INTO `sys_region` VALUES ('3444', '呼图壁县', '367', 'Hutubi Xian');
INSERT INTO `sys_region` VALUES ('3445', '玛纳斯县', '367', 'Manas Xian');
INSERT INTO `sys_region` VALUES ('3446', '奇台县', '367', 'Qitai Xian');
INSERT INTO `sys_region` VALUES ('3447', '吉木萨尔县', '367', 'Jimsar Xian');
INSERT INTO `sys_region` VALUES ('3448', '木垒哈萨克自治县', '367', 'Mori Kazak Zizhixian');
INSERT INTO `sys_region` VALUES ('3449', '博乐市', '368', 'Bole(Bortala) Shi');
INSERT INTO `sys_region` VALUES ('345', '庆阳市', '29', 'Qingyang Shi');
INSERT INTO `sys_region` VALUES ('3450', '精河县', '368', 'Jinghe(Jing) Xian');
INSERT INTO `sys_region` VALUES ('3451', '温泉县', '368', 'Wenquan(Arixang) Xian');
INSERT INTO `sys_region` VALUES ('3452', '库尔勒市', '369', 'Korla Shi');
INSERT INTO `sys_region` VALUES ('3453', '轮台县', '369', 'Luntai(Bugur) Xian');
INSERT INTO `sys_region` VALUES ('3454', '尉犁县', '369', 'Yuli(Lopnur) Xian');
INSERT INTO `sys_region` VALUES ('3455', '若羌县', '369', 'Ruoqiang(Qakilik) Xian');
INSERT INTO `sys_region` VALUES ('3456', '且末县', '369', 'Qiemo(Qarqan) Xian');
INSERT INTO `sys_region` VALUES ('3457', '焉耆回族自治县', '369', 'Yanqi Huizu Zizhixian');
INSERT INTO `sys_region` VALUES ('3458', '和静县', '369', 'Hejing Xian');
INSERT INTO `sys_region` VALUES ('3459', '和硕县', '369', 'Hoxud Xian');
INSERT INTO `sys_region` VALUES ('346', '定西市', '29', 'Dingxi Shi');
INSERT INTO `sys_region` VALUES ('3460', '博湖县', '369', 'Bohu(Bagrax) Xian');
INSERT INTO `sys_region` VALUES ('3461', '阿克苏市', '370', 'Aksu Shi');
INSERT INTO `sys_region` VALUES ('3462', '温宿县', '370', 'Wensu Xian');
INSERT INTO `sys_region` VALUES ('3463', '库车县', '370', 'Kuqa Xian');
INSERT INTO `sys_region` VALUES ('3464', '沙雅县', '370', 'Xayar Xian');
INSERT INTO `sys_region` VALUES ('3465', '新和县', '370', 'Xinhe(Toksu) Xian');
INSERT INTO `sys_region` VALUES ('3466', '拜城县', '370', 'Baicheng(Bay) Xian');
INSERT INTO `sys_region` VALUES ('3467', '乌什县', '370', 'Wushi(Uqturpan) Xian');
INSERT INTO `sys_region` VALUES ('3468', '阿瓦提县', '370', 'Awat Xian');
INSERT INTO `sys_region` VALUES ('3469', '柯坪县', '370', 'Kalpin Xian');
INSERT INTO `sys_region` VALUES ('347', '陇南市', '29', 'Longnan Shi');
INSERT INTO `sys_region` VALUES ('3470', '阿图什市', '371', 'Artux Shi');
INSERT INTO `sys_region` VALUES ('3471', '阿克陶县', '371', 'Akto Xian');
INSERT INTO `sys_region` VALUES ('3472', '阿合奇县', '371', 'Akqi Xian');
INSERT INTO `sys_region` VALUES ('3473', '乌恰县', '371', 'Wuqia(Ulugqat) Xian');
INSERT INTO `sys_region` VALUES ('3474', '喀什市', '372', 'Kashi (Kaxgar) Shi');
INSERT INTO `sys_region` VALUES ('3475', '疏附县', '372', 'Shufu Xian');
INSERT INTO `sys_region` VALUES ('3476', '疏勒县', '372', 'Shule Xian');
INSERT INTO `sys_region` VALUES ('3477', '英吉沙县', '372', 'Yengisar Xian');
INSERT INTO `sys_region` VALUES ('3478', '泽普县', '372', 'Zepu(Poskam) Xian');
INSERT INTO `sys_region` VALUES ('3479', '莎车县', '372', 'Shache(Yarkant) Xian');
INSERT INTO `sys_region` VALUES ('348', '临夏回族自治州', '29', 'Linxia Huizu Zizhizhou ');
INSERT INTO `sys_region` VALUES ('3480', '叶城县', '372', 'Yecheng(Kargilik) Xian');
INSERT INTO `sys_region` VALUES ('3481', '麦盖提县', '372', 'Markit Xian');
INSERT INTO `sys_region` VALUES ('3482', '岳普湖县', '372', 'Yopurga Xian');
INSERT INTO `sys_region` VALUES ('3483', '伽师县', '372', 'Jiashi(Payzawat) Xian');
INSERT INTO `sys_region` VALUES ('3484', '巴楚县', '372', 'Bachu(Maralbexi) Xian');
INSERT INTO `sys_region` VALUES ('3485', '塔什库尔干塔吉克自治县', '372', 'Taxkorgan Tajik Zizhixian');
INSERT INTO `sys_region` VALUES ('3486', '和田市', '373', 'Hotan Shi');
INSERT INTO `sys_region` VALUES ('3487', '和田县', '373', 'Hotan Xian');
INSERT INTO `sys_region` VALUES ('3488', '墨玉县', '373', 'Moyu(Karakax) Xian');
INSERT INTO `sys_region` VALUES ('3489', '皮山县', '373', 'Pishan(Guma) Xian');
INSERT INTO `sys_region` VALUES ('349', '甘南藏族自治州', '29', 'Gannan Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3490', '洛浦县', '373', 'Lop Xian');
INSERT INTO `sys_region` VALUES ('3491', '策勒县', '373', 'Qira Xian');
INSERT INTO `sys_region` VALUES ('3492', '于田县', '373', 'Yutian(Keriya) Xian');
INSERT INTO `sys_region` VALUES ('3493', '民丰县', '373', 'Minfeng(Niya) Xian');
INSERT INTO `sys_region` VALUES ('3494', '伊宁市', '374', 'Yining(Gulja) Shi');
INSERT INTO `sys_region` VALUES ('3495', '奎屯市', '374', 'Kuytun Shi');
INSERT INTO `sys_region` VALUES ('3496', '伊宁县', '374', 'Yining(Gulja) Xian');
INSERT INTO `sys_region` VALUES ('3497', '察布查尔锡伯自治县', '374', 'Qapqal Xibe Zizhixian');
INSERT INTO `sys_region` VALUES ('3498', '霍城县', '374', 'Huocheng Xin');
INSERT INTO `sys_region` VALUES ('3499', '巩留县', '374', 'Gongliu(Tokkuztara) Xian');
INSERT INTO `sys_region` VALUES ('35', '市辖区', '3', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('350', '西宁市', '30', 'Xining Shi');
INSERT INTO `sys_region` VALUES ('3500', '新源县', '374', 'Xinyuan(Kunes) Xian');
INSERT INTO `sys_region` VALUES ('3501', '昭苏县', '374', 'Zhaosu(Mongolkure) Xian');
INSERT INTO `sys_region` VALUES ('3502', '特克斯县', '374', 'Tekes Xian');
INSERT INTO `sys_region` VALUES ('3503', '尼勒克县', '374', 'Nilka Xian');
INSERT INTO `sys_region` VALUES ('3504', '塔城市', '375', 'Tacheng(Qoqek) Shi');
INSERT INTO `sys_region` VALUES ('3505', '乌苏市', '375', 'Usu Shi');
INSERT INTO `sys_region` VALUES ('3506', '额敏县', '375', 'Emin(Dorbiljin) Xian');
INSERT INTO `sys_region` VALUES ('3507', '沙湾县', '375', 'Shawan Xian');
INSERT INTO `sys_region` VALUES ('3508', '托里县', '375', 'Toli Xian');
INSERT INTO `sys_region` VALUES ('3509', '裕民县', '375', 'Yumin(Qagantokay) Xian');
INSERT INTO `sys_region` VALUES ('351', '海东地区', '30', 'Haidong Diqu');
INSERT INTO `sys_region` VALUES ('3510', '和布克赛尔蒙古自治县', '375', 'Hebukesaiermengguzizhi Xian');
INSERT INTO `sys_region` VALUES ('3511', '阿勒泰市', '376', 'Altay Shi');
INSERT INTO `sys_region` VALUES ('3512', '布尔津县', '376', 'Burqin Xian');
INSERT INTO `sys_region` VALUES ('3513', '富蕴县', '376', 'Fuyun(Koktokay) Xian');
INSERT INTO `sys_region` VALUES ('3514', '福海县', '376', 'Fuhai(Burultokay) Xian');
INSERT INTO `sys_region` VALUES ('3515', '哈巴河县', '376', 'Habahe(Kaba) Xian');
INSERT INTO `sys_region` VALUES ('3516', '青河县', '376', 'Qinghe(Qinggil) Xian');
INSERT INTO `sys_region` VALUES ('3517', '吉木乃县', '376', 'Jeminay Xian');
INSERT INTO `sys_region` VALUES ('3518', '石河子市', '377', 'Shihezi Shi');
INSERT INTO `sys_region` VALUES ('3519', '阿拉尔市', '377', 'Alaer Shi');
INSERT INTO `sys_region` VALUES ('352', '海北藏族自治州', '30', 'Haibei Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('3520', '图木舒克市', '377', 'Tumushuke Shi');
INSERT INTO `sys_region` VALUES ('3521', '五家渠市', '377', 'Wujiaqu Shi');
INSERT INTO `sys_region` VALUES ('353', '黄南藏族自治州', '30', 'Huangnan Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('354', '海南藏族自治州', '30', 'Hainan Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('355', '果洛藏族自治州', '30', 'Golog Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('356', '玉树藏族自治州', '30', 'Yushu Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('357', '海西蒙古族藏族自治州', '30', 'Haixi Mongolzu Zangzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('358', '银川市', '31', 'Yinchuan Shi');
INSERT INTO `sys_region` VALUES ('359', '石嘴山市', '31', 'Shizuishan Shi');
INSERT INTO `sys_region` VALUES ('36', '县', '3', 'Xian');
INSERT INTO `sys_region` VALUES ('360', '吴忠市', '31', 'Wuzhong Shi');
INSERT INTO `sys_region` VALUES ('361', '固原市', '31', 'Guyuan Shi');
INSERT INTO `sys_region` VALUES ('362', '中卫市', '31', 'Zhongwei Shi');
INSERT INTO `sys_region` VALUES ('363', '乌鲁木齐市', '32', 'Urumqi Shi');
INSERT INTO `sys_region` VALUES ('364', '克拉玛依市', '32', 'Karamay Shi');
INSERT INTO `sys_region` VALUES ('365', '吐鲁番地区', '32', 'Turpan Diqu');
INSERT INTO `sys_region` VALUES ('366', '哈密地区', '32', 'Hami(kumul) Diqu');
INSERT INTO `sys_region` VALUES ('367', '昌吉回族自治州', '32', 'Changji Huizu Zizhizhou');
INSERT INTO `sys_region` VALUES ('368', '博尔塔拉蒙古自治州', '32', 'Bortala Monglo Zizhizhou');
INSERT INTO `sys_region` VALUES ('369', '巴音郭楞蒙古自治州', '32', 'bayinguolengmengguzizhizhou');
INSERT INTO `sys_region` VALUES ('37', '石家庄市', '4', 'Shijiazhuang Shi');
INSERT INTO `sys_region` VALUES ('370', '阿克苏地区', '32', 'Aksu Diqu');
INSERT INTO `sys_region` VALUES ('371', '克孜勒苏柯尔克孜自治州', '32', 'Kizilsu Kirgiz Zizhizhou');
INSERT INTO `sys_region` VALUES ('372', '喀什地区', '32', 'Kashi(Kaxgar) Diqu');
INSERT INTO `sys_region` VALUES ('373', '和田地区', '32', 'Hotan Diqu');
INSERT INTO `sys_region` VALUES ('374', '伊犁哈萨克自治州', '32', 'Ili Kazak Zizhizhou');
INSERT INTO `sys_region` VALUES ('375', '塔城地区', '32', 'Tacheng(Qoqek) Diqu');
INSERT INTO `sys_region` VALUES ('376', '阿勒泰地区', '32', 'Altay Diqu');
INSERT INTO `sys_region` VALUES ('377', '自治区直辖县级行政区划', '32', 'zizhiquzhixiaxianjixingzhengquhua');
INSERT INTO `sys_region` VALUES ('378', '东城区', '33', 'Dongcheng Qu');
INSERT INTO `sys_region` VALUES ('379', '西城区', '33', 'Xicheng Qu');
INSERT INTO `sys_region` VALUES ('38', '唐山市', '4', 'Tangshan Shi');
INSERT INTO `sys_region` VALUES ('382', '朝阳区', '33', 'Chaoyang Qu');
INSERT INTO `sys_region` VALUES ('383', '丰台区', '33', 'Fengtai Qu');
INSERT INTO `sys_region` VALUES ('384', '石景山区', '33', 'Shijingshan Qu');
INSERT INTO `sys_region` VALUES ('385', '海淀区', '33', 'Haidian Qu');
INSERT INTO `sys_region` VALUES ('386', '门头沟区', '33', 'Mentougou Qu');
INSERT INTO `sys_region` VALUES ('387', '房山区', '33', 'Fangshan Qu');
INSERT INTO `sys_region` VALUES ('388', '通州区', '33', 'Tongzhou Qu');
INSERT INTO `sys_region` VALUES ('389', '顺义区', '33', 'Shunyi Qu');
INSERT INTO `sys_region` VALUES ('39', '秦皇岛市', '4', 'Qinhuangdao Shi');
INSERT INTO `sys_region` VALUES ('390', '昌平区', '33', 'Changping Qu');
INSERT INTO `sys_region` VALUES ('391', '大兴区', '33', 'Daxing Qu');
INSERT INTO `sys_region` VALUES ('392', '怀柔区', '33', 'Huairou Qu');
INSERT INTO `sys_region` VALUES ('393', '平谷区', '33', 'Pinggu Qu');
INSERT INTO `sys_region` VALUES ('394', '密云县', '34', 'Miyun Xian ');
INSERT INTO `sys_region` VALUES ('395', '延庆县', '34', 'Yanqing Xian');
INSERT INTO `sys_region` VALUES ('396', '和平区', '35', 'Heping Qu');
INSERT INTO `sys_region` VALUES ('397', '河东区', '35', 'Hedong Qu');
INSERT INTO `sys_region` VALUES ('398', '河西区', '35', 'Hexi Qu');
INSERT INTO `sys_region` VALUES ('399', '南开区', '35', 'Nankai Qu');
INSERT INTO `sys_region` VALUES ('4', '河北省', '1', 'Hebei Sheng');
INSERT INTO `sys_region` VALUES ('40', '邯郸市', '4', 'Handan Shi');
INSERT INTO `sys_region` VALUES ('400', '河北区', '35', 'Hebei Qu');
INSERT INTO `sys_region` VALUES ('4000', '麦积区', '340', 'Maiji Qu');
INSERT INTO `sys_region` VALUES ('4001', '江津区', '270', 'Jiangjin Qu');
INSERT INTO `sys_region` VALUES ('4002', '合川区', '270', 'Hechuan Qu');
INSERT INTO `sys_region` VALUES ('4003', '永川区', '270', 'Yongchuan Qu');
INSERT INTO `sys_region` VALUES ('4004', '南川区', '270', 'Nanchuan Qu');
INSERT INTO `sys_region` VALUES ('4006', '芜湖县', '1412', 'Wuhu Xian');
INSERT INTO `sys_region` VALUES ('401', '红桥区', '35', 'Hongqiao Qu');
INSERT INTO `sys_region` VALUES ('404', '滨海新区', '35', 'Dagang Qu');
INSERT INTO `sys_region` VALUES ('405', '东丽区', '35', 'Dongli Qu');
INSERT INTO `sys_region` VALUES ('406', '西青区', '35', 'Xiqing Qu');
INSERT INTO `sys_region` VALUES ('407', '津南区', '35', 'Jinnan Qu');
INSERT INTO `sys_region` VALUES ('408', '北辰区', '35', 'Beichen Qu');
INSERT INTO `sys_region` VALUES ('409', '武清区', '35', 'Wuqing Qu');
INSERT INTO `sys_region` VALUES ('41', '邢台市', '4', 'Xingtai Shi');
INSERT INTO `sys_region` VALUES ('410', '宝坻区', '35', 'Baodi Qu');
INSERT INTO `sys_region` VALUES ('4100', '加格达奇区', '106', 'Jiagedaqi Qu');
INSERT INTO `sys_region` VALUES ('4101', '松岭区', '106', 'Songling Qu');
INSERT INTO `sys_region` VALUES ('4102', '新林区', '106', 'Xinlin Qu');
INSERT INTO `sys_region` VALUES ('4103', '呼中区', '106', 'Huzhong Qu');
INSERT INTO `sys_region` VALUES ('411', '宁河县', '36', 'Ninghe Xian');
INSERT INTO `sys_region` VALUES ('412', '静海县', '36', 'Jinghai Xian');
INSERT INTO `sys_region` VALUES ('413', '蓟县', '36', 'Ji Xian');
INSERT INTO `sys_region` VALUES ('414', '市辖区', '37', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('415', '长安区', '37', 'Chang,an Qu');
INSERT INTO `sys_region` VALUES ('416', '桥东区', '37', 'Qiaodong Qu');
INSERT INTO `sys_region` VALUES ('417', '桥西区', '37', 'Qiaoxi Qu');
INSERT INTO `sys_region` VALUES ('418', '新华区', '37', 'Xinhua Qu');
INSERT INTO `sys_region` VALUES ('419', '井陉矿区', '37', 'Jingxing Kuangqu');
INSERT INTO `sys_region` VALUES ('42', '保定市', '4', 'Baoding Shi');
INSERT INTO `sys_region` VALUES ('420', '裕华区', '37', 'Yuhua Qu');
INSERT INTO `sys_region` VALUES ('4200', '南湖区', '125', 'Nanhu Qu');
INSERT INTO `sys_region` VALUES ('421', '井陉县', '37', 'Jingxing Xian');
INSERT INTO `sys_region` VALUES ('422', '正定县', '37', 'Zhengding Xian');
INSERT INTO `sys_region` VALUES ('423', '栾城县', '37', 'Luancheng Xian');
INSERT INTO `sys_region` VALUES ('424', '行唐县', '37', 'Xingtang Xian');
INSERT INTO `sys_region` VALUES ('425', '灵寿县', '37', 'Lingshou Xian ');
INSERT INTO `sys_region` VALUES ('426', '高邑县', '37', 'Gaoyi Xian');
INSERT INTO `sys_region` VALUES ('427', '深泽县', '37', 'Shenze Xian');
INSERT INTO `sys_region` VALUES ('428', '赞皇县', '37', 'Zanhuang Xian');
INSERT INTO `sys_region` VALUES ('429', '无极县', '37', 'Wuji Xian');
INSERT INTO `sys_region` VALUES ('43', '张家口市', '4', 'Zhangjiakou Shi ');
INSERT INTO `sys_region` VALUES ('430', '平山县', '37', 'Pingshan Xian');
INSERT INTO `sys_region` VALUES ('4300', '共青城市', '162', 'Gongqingcheng Shi');
INSERT INTO `sys_region` VALUES ('431', '元氏县', '37', 'Yuanshi Xian');
INSERT INTO `sys_region` VALUES ('432', '赵县', '37', 'Zhao Xian');
INSERT INTO `sys_region` VALUES ('433', '辛集市', '37', 'Xinji Shi');
INSERT INTO `sys_region` VALUES ('434', '藁城市', '37', 'Gaocheng Shi');
INSERT INTO `sys_region` VALUES ('435', '晋州市', '37', 'Jinzhou Shi');
INSERT INTO `sys_region` VALUES ('436', '新乐市', '37', 'Xinle Shi');
INSERT INTO `sys_region` VALUES ('437', '鹿泉市', '37', 'Luquan Shi');
INSERT INTO `sys_region` VALUES ('438', '市辖区', '38', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('439', '路南区', '38', 'Lunan Qu');
INSERT INTO `sys_region` VALUES ('44', '承德市', '4', 'Chengde Shi');
INSERT INTO `sys_region` VALUES ('440', '路北区', '38', 'Lubei Qu');
INSERT INTO `sys_region` VALUES ('4400', '红寺堡区', '360', 'Hongsibao Qu');
INSERT INTO `sys_region` VALUES ('441', '古冶区', '38', 'Guye Qu');
INSERT INTO `sys_region` VALUES ('442', '开平区', '38', 'Kaiping Qu');
INSERT INTO `sys_region` VALUES ('443', '丰南区', '38', 'Fengnan Qu');
INSERT INTO `sys_region` VALUES ('444', '丰润区', '38', 'Fengrun Qu');
INSERT INTO `sys_region` VALUES ('445', '滦县', '38', 'Luan Xian');
INSERT INTO `sys_region` VALUES ('446', '滦南县', '38', 'Luannan Xian');
INSERT INTO `sys_region` VALUES ('447', '乐亭县', '38', 'Leting Xian');
INSERT INTO `sys_region` VALUES ('448', '迁西县', '38', 'Qianxi Xian');
INSERT INTO `sys_region` VALUES ('449', '玉田县', '38', 'Yutian Xian');
INSERT INTO `sys_region` VALUES ('45', '沧州市', '4', 'Cangzhou Shi');
INSERT INTO `sys_region` VALUES ('450', '唐海县', '38', 'Tanghai Xian ');
INSERT INTO `sys_region` VALUES ('4500', '瓜州县', '344', 'Guazhou Xian');
INSERT INTO `sys_region` VALUES ('451', '遵化市', '38', 'Zunhua Shi');
INSERT INTO `sys_region` VALUES ('452', '迁安市', '38', 'Qian,an Shi');
INSERT INTO `sys_region` VALUES ('453', '市辖区', '39', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('454', '海港区', '39', 'Haigang Qu');
INSERT INTO `sys_region` VALUES ('455', '山海关区', '39', 'Shanhaiguan Qu');
INSERT INTO `sys_region` VALUES ('456', '北戴河区', '39', 'Beidaihe Qu');
INSERT INTO `sys_region` VALUES ('457', '青龙满族自治县', '39', 'Qinglong Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('458', '昌黎县', '39', 'Changli Xian');
INSERT INTO `sys_region` VALUES ('459', '抚宁县', '39', 'Funing Xian ');
INSERT INTO `sys_region` VALUES ('46', '廊坊市', '4', 'Langfang Shi');
INSERT INTO `sys_region` VALUES ('460', '卢龙县', '39', 'Lulong Xian');
INSERT INTO `sys_region` VALUES ('4600', '随县', '215', 'Sui Xian');
INSERT INTO `sys_region` VALUES ('461', '市辖区', '40', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('462', '邯山区', '40', 'Hanshan Qu');
INSERT INTO `sys_region` VALUES ('463', '丛台区', '40', 'Congtai Qu');
INSERT INTO `sys_region` VALUES ('464', '复兴区', '40', 'Fuxing Qu');
INSERT INTO `sys_region` VALUES ('465', '峰峰矿区', '40', 'Fengfeng Kuangqu');
INSERT INTO `sys_region` VALUES ('466', '邯郸县', '40', 'Handan Xian ');
INSERT INTO `sys_region` VALUES ('467', '临漳县', '40', 'Linzhang Xian ');
INSERT INTO `sys_region` VALUES ('468', '成安县', '40', 'Cheng,an Xian');
INSERT INTO `sys_region` VALUES ('469', '大名县', '40', 'Daming Xian');
INSERT INTO `sys_region` VALUES ('47', '衡水市', '4', 'Hengshui Shi ');
INSERT INTO `sys_region` VALUES ('470', '涉县', '40', 'She Xian');
INSERT INTO `sys_region` VALUES ('4700', '零陵区', '228', 'Lingling Qu');
INSERT INTO `sys_region` VALUES ('471', '磁县', '40', 'Ci Xian');
INSERT INTO `sys_region` VALUES ('472', '肥乡县', '40', 'Feixiang Xian');
INSERT INTO `sys_region` VALUES ('473', '永年县', '40', 'Yongnian Xian');
INSERT INTO `sys_region` VALUES ('474', '邱县', '40', 'Qiu Xian');
INSERT INTO `sys_region` VALUES ('475', '鸡泽县', '40', 'Jize Xian');
INSERT INTO `sys_region` VALUES ('476', '广平县', '40', 'Guangping Xian ');
INSERT INTO `sys_region` VALUES ('477', '馆陶县', '40', 'Guantao Xian');
INSERT INTO `sys_region` VALUES ('478', '魏县', '40', 'Wei Xian ');
INSERT INTO `sys_region` VALUES ('479', '曲周县', '40', 'Quzhou Xian ');
INSERT INTO `sys_region` VALUES ('48', '太原市', '5', 'Taiyuan Shi');
INSERT INTO `sys_region` VALUES ('480', '武安市', '40', 'Wu,an Shi');
INSERT INTO `sys_region` VALUES ('4800', '平桂管理区', '263', 'Pingguiguanli Qu');
INSERT INTO `sys_region` VALUES ('481', '市辖区', '41', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('482', '桥东区', '41', 'Qiaodong Qu');
INSERT INTO `sys_region` VALUES ('483', '桥西区', '41', 'Qiaoxi Qu');
INSERT INTO `sys_region` VALUES ('484', '邢台县', '41', 'Xingtai Xian');
INSERT INTO `sys_region` VALUES ('485', '临城县', '41', 'Lincheng Xian ');
INSERT INTO `sys_region` VALUES ('486', '内丘县', '41', 'Neiqiu Xian ');
INSERT INTO `sys_region` VALUES ('487', '柏乡县', '41', 'Baixiang Xian');
INSERT INTO `sys_region` VALUES ('488', '隆尧县', '41', 'Longyao Xian');
INSERT INTO `sys_region` VALUES ('489', '任县', '41', 'Ren Xian');
INSERT INTO `sys_region` VALUES ('49', '大同市', '5', 'Datong Shi ');
INSERT INTO `sys_region` VALUES ('490', '南和县', '41', 'Nanhe Xian');
INSERT INTO `sys_region` VALUES ('4900', '利州区', '279', 'Lizhou Qu');
INSERT INTO `sys_region` VALUES ('491', '宁晋县', '41', 'Ningjin Xian');
INSERT INTO `sys_region` VALUES ('492', '巨鹿县', '41', 'Julu Xian');
INSERT INTO `sys_region` VALUES ('493', '新河县', '41', 'Xinhe Xian ');
INSERT INTO `sys_region` VALUES ('494', '广宗县', '41', 'Guangzong Xian ');
INSERT INTO `sys_region` VALUES ('495', '平乡县', '41', 'Pingxiang Xian');
INSERT INTO `sys_region` VALUES ('496', '威县', '41', 'Wei Xian ');
INSERT INTO `sys_region` VALUES ('497', '清河县', '41', 'Qinghe Xian');
INSERT INTO `sys_region` VALUES ('498', '临西县', '41', 'Linxi Xian');
INSERT INTO `sys_region` VALUES ('499', '南宫市', '41', 'Nangong Shi');
INSERT INTO `sys_region` VALUES ('5', '山西省', '1', 'Shanxi Sheng ');
INSERT INTO `sys_region` VALUES ('50', '阳泉市', '5', 'Yangquan Shi');
INSERT INTO `sys_region` VALUES ('500', '沙河市', '41', 'Shahe Shi');
INSERT INTO `sys_region` VALUES ('5000', '华蓥市', '286', 'Huaying Shi');
INSERT INTO `sys_region` VALUES ('501', '市辖区', '42', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('502', '新市区', '42', 'Xinshi Qu');
INSERT INTO `sys_region` VALUES ('503', '北市区', '42', 'Beishi Qu');
INSERT INTO `sys_region` VALUES ('504', '南市区', '42', 'Nanshi Qu');
INSERT INTO `sys_region` VALUES ('505', '满城县', '42', 'Mancheng Xian ');
INSERT INTO `sys_region` VALUES ('506', '清苑县', '42', 'Qingyuan Xian');
INSERT INTO `sys_region` VALUES ('507', '涞水县', '42', 'Laishui Xian');
INSERT INTO `sys_region` VALUES ('508', '阜平县', '42', 'Fuping Xian ');
INSERT INTO `sys_region` VALUES ('509', '徐水县', '42', 'Xushui Xian ');
INSERT INTO `sys_region` VALUES ('51', '长治市', '5', 'Changzhi Shi');
INSERT INTO `sys_region` VALUES ('510', '定兴县', '42', 'Dingxing Xian ');
INSERT INTO `sys_region` VALUES ('511', '唐县', '42', 'Tang Xian ');
INSERT INTO `sys_region` VALUES ('512', '高阳县', '42', 'Gaoyang Xian ');
INSERT INTO `sys_region` VALUES ('513', '容城县', '42', 'Rongcheng Xian ');
INSERT INTO `sys_region` VALUES ('514', '涞源县', '42', 'Laiyuan Xian ');
INSERT INTO `sys_region` VALUES ('515', '望都县', '42', 'Wangdu Xian ');
INSERT INTO `sys_region` VALUES ('516', '安新县', '42', 'Anxin Xian ');
INSERT INTO `sys_region` VALUES ('517', '易县', '42', 'Yi Xian');
INSERT INTO `sys_region` VALUES ('518', '曲阳县', '42', 'Quyang Xian ');
INSERT INTO `sys_region` VALUES ('519', '蠡县', '42', 'Li Xian');
INSERT INTO `sys_region` VALUES ('52', '晋城市', '5', 'Jincheng Shi ');
INSERT INTO `sys_region` VALUES ('520', '顺平县', '42', 'Shunping Xian ');
INSERT INTO `sys_region` VALUES ('521', '博野县', '42', 'Boye Xian ');
INSERT INTO `sys_region` VALUES ('522', '雄县', '42', 'Xiong Xian');
INSERT INTO `sys_region` VALUES ('523', '涿州市', '42', 'Zhuozhou Shi');
INSERT INTO `sys_region` VALUES ('524', '定州市', '42', 'Dingzhou Shi ');
INSERT INTO `sys_region` VALUES ('525', '安国市', '42', 'Anguo Shi ');
INSERT INTO `sys_region` VALUES ('526', '高碑店市', '42', 'Gaobeidian Shi');
INSERT INTO `sys_region` VALUES ('527', '市辖区', '43', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('528', '桥东区', '43', 'Qiaodong Qu');
INSERT INTO `sys_region` VALUES ('529', '桥西区', '43', 'Qiaoxi Qu');
INSERT INTO `sys_region` VALUES ('53', '朔州市', '5', 'Shuozhou Shi ');
INSERT INTO `sys_region` VALUES ('530', '宣化区', '43', 'Xuanhua Qu');
INSERT INTO `sys_region` VALUES ('531', '下花园区', '43', 'Xiahuayuan Qu ');
INSERT INTO `sys_region` VALUES ('532', '宣化县', '43', 'Xuanhua Xian ');
INSERT INTO `sys_region` VALUES ('533', '张北县', '43', 'Zhangbei Xian ');
INSERT INTO `sys_region` VALUES ('534', '康保县', '43', 'Kangbao Xian');
INSERT INTO `sys_region` VALUES ('535', '沽源县', '43', 'Guyuan Xian');
INSERT INTO `sys_region` VALUES ('536', '尚义县', '43', 'Shangyi Xian');
INSERT INTO `sys_region` VALUES ('537', '蔚县', '43', 'Yu Xian');
INSERT INTO `sys_region` VALUES ('538', '阳原县', '43', 'Yangyuan Xian');
INSERT INTO `sys_region` VALUES ('539', '怀安县', '43', 'Huai,an Xian');
INSERT INTO `sys_region` VALUES ('54', '晋中市', '5', 'Jinzhong Shi');
INSERT INTO `sys_region` VALUES ('540', '万全县', '43', 'Wanquan Xian ');
INSERT INTO `sys_region` VALUES ('541', '怀来县', '43', 'Huailai Xian');
INSERT INTO `sys_region` VALUES ('542', '涿鹿县', '43', 'Zhuolu Xian ');
INSERT INTO `sys_region` VALUES ('543', '赤城县', '43', 'Chicheng Xian');
INSERT INTO `sys_region` VALUES ('544', '崇礼县', '43', 'Chongli Xian');
INSERT INTO `sys_region` VALUES ('545', '市辖区', '44', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('546', '双桥区', '44', 'Shuangqiao Qu ');
INSERT INTO `sys_region` VALUES ('547', '双滦区', '44', 'Shuangluan Qu');
INSERT INTO `sys_region` VALUES ('548', '鹰手营子矿区', '44', 'Yingshouyingzi Kuangqu');
INSERT INTO `sys_region` VALUES ('549', '承德县', '44', 'Chengde Xian');
INSERT INTO `sys_region` VALUES ('55', '运城市', '5', 'Yuncheng Shi');
INSERT INTO `sys_region` VALUES ('550', '兴隆县', '44', 'Xinglong Xian');
INSERT INTO `sys_region` VALUES ('551', '平泉县', '44', 'Pingquan Xian');
INSERT INTO `sys_region` VALUES ('552', '滦平县', '44', 'Luanping Xian ');
INSERT INTO `sys_region` VALUES ('553', '隆化县', '44', 'Longhua Xian');
INSERT INTO `sys_region` VALUES ('554', '丰宁满族自治县', '44', 'Fengning Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('555', '宽城满族自治县', '44', 'Kuancheng Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('556', '围场满族蒙古族自治县', '44', 'Weichang Manzu Menggolzu Zizhixian');
INSERT INTO `sys_region` VALUES ('557', '市辖区', '45', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('558', '新华区', '45', 'Xinhua Qu');
INSERT INTO `sys_region` VALUES ('559', '运河区', '45', 'Yunhe Qu');
INSERT INTO `sys_region` VALUES ('56', '忻州市', '5', 'Xinzhou Shi');
INSERT INTO `sys_region` VALUES ('560', '沧县', '45', 'Cang Xian');
INSERT INTO `sys_region` VALUES ('561', '青县', '45', 'Qing Xian');
INSERT INTO `sys_region` VALUES ('562', '东光县', '45', 'Dongguang Xian ');
INSERT INTO `sys_region` VALUES ('563', '海兴县', '45', 'Haixing Xian');
INSERT INTO `sys_region` VALUES ('564', '盐山县', '45', 'Yanshan Xian');
INSERT INTO `sys_region` VALUES ('565', '肃宁县', '45', 'Suning Xian ');
INSERT INTO `sys_region` VALUES ('566', '南皮县', '45', 'Nanpi Xian');
INSERT INTO `sys_region` VALUES ('567', '吴桥县', '45', 'Wuqiao Xian ');
INSERT INTO `sys_region` VALUES ('568', '献县', '45', 'Xian Xian ');
INSERT INTO `sys_region` VALUES ('569', '孟村回族自治县', '45', 'Mengcun Huizu Zizhixian');
INSERT INTO `sys_region` VALUES ('57', '临汾市', '5', 'Linfen Shi');
INSERT INTO `sys_region` VALUES ('570', '泊头市', '45', 'Botou Shi ');
INSERT INTO `sys_region` VALUES ('571', '任丘市', '45', 'Renqiu Shi');
INSERT INTO `sys_region` VALUES ('572', '黄骅市', '45', 'Huanghua Shi');
INSERT INTO `sys_region` VALUES ('573', '河间市', '45', 'Hejian Shi');
INSERT INTO `sys_region` VALUES ('574', '市辖区', '46', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('575', '安次区', '46', 'Anci Qu');
INSERT INTO `sys_region` VALUES ('576', '广阳区', '46', 'Guangyang Qu');
INSERT INTO `sys_region` VALUES ('577', '固安县', '46', 'Gu,an Xian');
INSERT INTO `sys_region` VALUES ('578', '永清县', '46', 'Yongqing Xian ');
INSERT INTO `sys_region` VALUES ('579', '香河县', '46', 'Xianghe Xian');
INSERT INTO `sys_region` VALUES ('58', '吕梁市', '5', 'Lvliang Shi');
INSERT INTO `sys_region` VALUES ('580', '大城县', '46', 'Dacheng Xian');
INSERT INTO `sys_region` VALUES ('581', '文安县', '46', 'Wen,an Xian');
INSERT INTO `sys_region` VALUES ('582', '大厂回族自治县', '46', 'Dachang Huizu Zizhixian');
INSERT INTO `sys_region` VALUES ('583', '霸州市', '46', 'Bazhou Shi');
INSERT INTO `sys_region` VALUES ('584', '三河市', '46', 'Sanhe Shi');
INSERT INTO `sys_region` VALUES ('585', '市辖区', '47', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('586', '桃城区', '47', 'Taocheng Qu');
INSERT INTO `sys_region` VALUES ('587', '枣强县', '47', 'Zaoqiang Xian ');
INSERT INTO `sys_region` VALUES ('588', '武邑县', '47', 'Wuyi Xian');
INSERT INTO `sys_region` VALUES ('589', '武强县', '47', 'Wuqiang Xian ');
INSERT INTO `sys_region` VALUES ('59', '呼和浩特市', '6', 'Hohhot Shi');
INSERT INTO `sys_region` VALUES ('590', '饶阳县', '47', 'Raoyang Xian');
INSERT INTO `sys_region` VALUES ('591', '安平县', '47', 'Anping Xian');
INSERT INTO `sys_region` VALUES ('592', '故城县', '47', 'Gucheng Xian');
INSERT INTO `sys_region` VALUES ('593', '景县', '47', 'Jing Xian ');
INSERT INTO `sys_region` VALUES ('594', '阜城县', '47', 'Fucheng Xian ');
INSERT INTO `sys_region` VALUES ('595', '冀州市', '47', 'Jizhou Shi ');
INSERT INTO `sys_region` VALUES ('596', '深州市', '47', 'Shenzhou Shi');
INSERT INTO `sys_region` VALUES ('597', '市辖区', '48', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('598', '小店区', '48', 'Xiaodian Qu');
INSERT INTO `sys_region` VALUES ('599', '迎泽区', '48', 'Yingze Qu');
INSERT INTO `sys_region` VALUES ('6', '内蒙古自治区', '1', 'Nei Mongol Zizhiqu');
INSERT INTO `sys_region` VALUES ('60', '包头市', '6', 'Baotou Shi ');
INSERT INTO `sys_region` VALUES ('600', '杏花岭区', '48', 'Xinghualing Qu');
INSERT INTO `sys_region` VALUES ('601', '尖草坪区', '48', 'Jiancaoping Qu');
INSERT INTO `sys_region` VALUES ('602', '万柏林区', '48', 'Wanbailin Qu');
INSERT INTO `sys_region` VALUES ('603', '晋源区', '48', 'Jinyuan Qu');
INSERT INTO `sys_region` VALUES ('604', '清徐县', '48', 'Qingxu Xian ');
INSERT INTO `sys_region` VALUES ('605', '阳曲县', '48', 'Yangqu Xian ');
INSERT INTO `sys_region` VALUES ('606', '娄烦县', '48', 'Loufan Xian');
INSERT INTO `sys_region` VALUES ('607', '古交市', '48', 'Gujiao Shi');
INSERT INTO `sys_region` VALUES ('608', '市辖区', '49', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('609', '城区', '49', 'Chengqu');
INSERT INTO `sys_region` VALUES ('61', '乌海市', '6', 'Wuhai Shi');
INSERT INTO `sys_region` VALUES ('610', '矿区', '49', 'Kuangqu');
INSERT INTO `sys_region` VALUES ('611', '南郊区', '49', 'Nanjiao Qu');
INSERT INTO `sys_region` VALUES ('612', '新荣区', '49', 'Xinrong Qu');
INSERT INTO `sys_region` VALUES ('613', '阳高县', '49', 'Yanggao Xian ');
INSERT INTO `sys_region` VALUES ('614', '天镇县', '49', 'Tianzhen Xian ');
INSERT INTO `sys_region` VALUES ('615', '广灵县', '49', 'Guangling Xian ');
INSERT INTO `sys_region` VALUES ('616', '灵丘县', '49', 'Lingqiu Xian ');
INSERT INTO `sys_region` VALUES ('617', '浑源县', '49', 'Hunyuan Xian');
INSERT INTO `sys_region` VALUES ('618', '左云县', '49', 'Zuoyun Xian');
INSERT INTO `sys_region` VALUES ('619', '大同县', '49', 'Datong Xian ');
INSERT INTO `sys_region` VALUES ('62', '赤峰市', '6', 'Chifeng (Ulanhad)Shi');
INSERT INTO `sys_region` VALUES ('620', '市辖区', '50', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('621', '城区', '50', 'Chengqu');
INSERT INTO `sys_region` VALUES ('622', '矿区', '50', 'Kuangqu');
INSERT INTO `sys_region` VALUES ('623', '郊区', '50', 'Jiaoqu');
INSERT INTO `sys_region` VALUES ('624', '平定县', '50', 'Pingding Xian');
INSERT INTO `sys_region` VALUES ('625', '盂县', '50', 'Yu Xian');
INSERT INTO `sys_region` VALUES ('626', '市辖区', '51', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('627', '城区', '51', 'Chengqu ');
INSERT INTO `sys_region` VALUES ('628', '郊区', '51', 'Jiaoqu');
INSERT INTO `sys_region` VALUES ('629', '长治县', '51', 'Changzhi Xian');
INSERT INTO `sys_region` VALUES ('63', '通辽市', '6', 'Tongliao Shi');
INSERT INTO `sys_region` VALUES ('630', '襄垣县', '51', 'Xiangyuan Xian');
INSERT INTO `sys_region` VALUES ('631', '屯留县', '51', 'Tunliu Xian');
INSERT INTO `sys_region` VALUES ('632', '平顺县', '51', 'Pingshun Xian');
INSERT INTO `sys_region` VALUES ('633', '黎城县', '51', 'Licheng Xian');
INSERT INTO `sys_region` VALUES ('634', '壶关县', '51', 'Huguan Xian');
INSERT INTO `sys_region` VALUES ('635', '长子县', '51', 'Zhangzi Xian ');
INSERT INTO `sys_region` VALUES ('636', '武乡县', '51', 'Wuxiang Xian');
INSERT INTO `sys_region` VALUES ('637', '沁县', '51', 'Qin Xian');
INSERT INTO `sys_region` VALUES ('638', '沁源县', '51', 'Qinyuan Xian ');
INSERT INTO `sys_region` VALUES ('639', '潞城市', '51', 'Lucheng Shi');
INSERT INTO `sys_region` VALUES ('64', '鄂尔多斯市', '6', 'Eerduosi Shi');
INSERT INTO `sys_region` VALUES ('640', '市辖区', '52', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('641', '城区', '52', 'Chengqu ');
INSERT INTO `sys_region` VALUES ('642', '沁水县', '52', 'Qinshui Xian');
INSERT INTO `sys_region` VALUES ('643', '阳城县', '52', 'Yangcheng Xian ');
INSERT INTO `sys_region` VALUES ('644', '陵川县', '52', 'Lingchuan Xian');
INSERT INTO `sys_region` VALUES ('645', '泽州县', '52', 'Zezhou Xian');
INSERT INTO `sys_region` VALUES ('646', '高平市', '52', 'Gaoping Shi ');
INSERT INTO `sys_region` VALUES ('647', '市辖区', '53', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('648', '朔城区', '53', 'Shuocheng Qu');
INSERT INTO `sys_region` VALUES ('649', '平鲁区', '53', 'Pinglu Qu');
INSERT INTO `sys_region` VALUES ('65', '呼伦贝尔市', '6', 'Hulunbeier Shi ');
INSERT INTO `sys_region` VALUES ('650', '山阴县', '53', 'Shanyin Xian');
INSERT INTO `sys_region` VALUES ('651', '应县', '53', 'Ying Xian');
INSERT INTO `sys_region` VALUES ('652', '右玉县', '53', 'Youyu Xian ');
INSERT INTO `sys_region` VALUES ('653', '怀仁县', '53', 'Huairen Xian');
INSERT INTO `sys_region` VALUES ('654', '市辖区', '54', '1');
INSERT INTO `sys_region` VALUES ('655', '榆次区', '54', 'Yuci Qu');
INSERT INTO `sys_region` VALUES ('656', '榆社县', '54', 'Yushe Xian');
INSERT INTO `sys_region` VALUES ('657', '左权县', '54', 'Zuoquan Xian');
INSERT INTO `sys_region` VALUES ('658', '和顺县', '54', 'Heshun Xian');
INSERT INTO `sys_region` VALUES ('659', '昔阳县', '54', 'Xiyang Xian');
INSERT INTO `sys_region` VALUES ('66', '巴彦淖尔市', '6', 'Bayannaoer Shi');
INSERT INTO `sys_region` VALUES ('660', '寿阳县', '54', 'Shouyang Xian');
INSERT INTO `sys_region` VALUES ('661', '太谷县', '54', 'Taigu Xian');
INSERT INTO `sys_region` VALUES ('662', '祁县', '54', 'Qi Xian');
INSERT INTO `sys_region` VALUES ('663', '平遥县', '54', 'Pingyao Xian');
INSERT INTO `sys_region` VALUES ('664', '灵石县', '54', 'Lingshi Xian');
INSERT INTO `sys_region` VALUES ('665', '介休市', '54', 'Jiexiu Shi');
INSERT INTO `sys_region` VALUES ('666', '市辖区', '55', '1');
INSERT INTO `sys_region` VALUES ('667', '盐湖区', '55', 'Yanhu Qu');
INSERT INTO `sys_region` VALUES ('668', '临猗县', '55', 'Linyi Xian');
INSERT INTO `sys_region` VALUES ('669', '万荣县', '55', 'Wanrong Xian');
INSERT INTO `sys_region` VALUES ('67', '乌兰察布市', '6', 'Wulanchabu Shi');
INSERT INTO `sys_region` VALUES ('670', '闻喜县', '55', 'Wenxi Xian');
INSERT INTO `sys_region` VALUES ('671', '稷山县', '55', 'Jishan Xian');
INSERT INTO `sys_region` VALUES ('672', '新绛县', '55', 'Xinjiang Xian');
INSERT INTO `sys_region` VALUES ('673', '绛县', '55', 'Jiang Xian');
INSERT INTO `sys_region` VALUES ('674', '垣曲县', '55', 'Yuanqu Xian');
INSERT INTO `sys_region` VALUES ('675', '夏县', '55', 'Xia Xian ');
INSERT INTO `sys_region` VALUES ('676', '平陆县', '55', 'Pinglu Xian');
INSERT INTO `sys_region` VALUES ('677', '芮城县', '55', 'Ruicheng Xian');
INSERT INTO `sys_region` VALUES ('678', '永济市', '55', 'Yongji Shi ');
INSERT INTO `sys_region` VALUES ('679', '河津市', '55', 'Hejin Shi');
INSERT INTO `sys_region` VALUES ('68', '兴安盟', '6', 'Hinggan Meng');
INSERT INTO `sys_region` VALUES ('680', '市辖区', '56', '1');
INSERT INTO `sys_region` VALUES ('681', '忻府区', '56', 'Xinfu Qu');
INSERT INTO `sys_region` VALUES ('682', '定襄县', '56', 'Dingxiang Xian');
INSERT INTO `sys_region` VALUES ('683', '五台县', '56', 'Wutai Xian');
INSERT INTO `sys_region` VALUES ('684', '代县', '56', 'Dai Xian');
INSERT INTO `sys_region` VALUES ('685', '繁峙县', '56', 'Fanshi Xian');
INSERT INTO `sys_region` VALUES ('686', '宁武县', '56', 'Ningwu Xian');
INSERT INTO `sys_region` VALUES ('687', '静乐县', '56', 'Jingle Xian');
INSERT INTO `sys_region` VALUES ('688', '神池县', '56', 'Shenchi Xian');
INSERT INTO `sys_region` VALUES ('689', '五寨县', '56', 'Wuzhai Xian');
INSERT INTO `sys_region` VALUES ('69', '锡林郭勒盟', '6', 'Xilin Gol Meng');
INSERT INTO `sys_region` VALUES ('690', '岢岚县', '56', 'Kelan Xian');
INSERT INTO `sys_region` VALUES ('691', '河曲县', '56', 'Hequ Xian ');
INSERT INTO `sys_region` VALUES ('692', '保德县', '56', 'Baode Xian');
INSERT INTO `sys_region` VALUES ('693', '偏关县', '56', 'Pianguan Xian');
INSERT INTO `sys_region` VALUES ('694', '原平市', '56', 'Yuanping Shi');
INSERT INTO `sys_region` VALUES ('695', '市辖区', '57', '1');
INSERT INTO `sys_region` VALUES ('696', '尧都区', '57', 'Yaodu Qu');
INSERT INTO `sys_region` VALUES ('697', '曲沃县', '57', 'Quwo Xian ');
INSERT INTO `sys_region` VALUES ('698', '翼城县', '57', 'Yicheng Xian');
INSERT INTO `sys_region` VALUES ('699', '襄汾县', '57', 'Xiangfen Xian');
INSERT INTO `sys_region` VALUES ('7', '辽宁省', '1', 'Liaoning Sheng');
INSERT INTO `sys_region` VALUES ('70', '阿拉善盟', '6', 'Alxa Meng');
INSERT INTO `sys_region` VALUES ('700', '洪洞县', '57', 'Hongtong Xian');
INSERT INTO `sys_region` VALUES ('701', '古县', '57', 'Gu Xian');
INSERT INTO `sys_region` VALUES ('702', '安泽县', '57', 'Anze Xian');
INSERT INTO `sys_region` VALUES ('703', '浮山县', '57', 'Fushan Xian ');
INSERT INTO `sys_region` VALUES ('704', '吉县', '57', 'Ji Xian');
INSERT INTO `sys_region` VALUES ('705', '乡宁县', '57', 'Xiangning Xian');
INSERT INTO `sys_region` VALUES ('706', '大宁县', '57', 'Daning Xian');
INSERT INTO `sys_region` VALUES ('707', '隰县', '57', 'Xi Xian');
INSERT INTO `sys_region` VALUES ('708', '永和县', '57', 'Yonghe Xian');
INSERT INTO `sys_region` VALUES ('709', '蒲县', '57', 'Pu Xian');
INSERT INTO `sys_region` VALUES ('71', '沈阳市', '7', 'Shenyang Shi');
INSERT INTO `sys_region` VALUES ('710', '汾西县', '57', 'Fenxi Xian');
INSERT INTO `sys_region` VALUES ('711', '侯马市', '57', 'Houma Shi ');
INSERT INTO `sys_region` VALUES ('712', '霍州市', '57', 'Huozhou Shi ');
INSERT INTO `sys_region` VALUES ('713', '市辖区', '58', '1');
INSERT INTO `sys_region` VALUES ('714', '离石区', '58', 'Lishi Qu');
INSERT INTO `sys_region` VALUES ('715', '文水县', '58', 'Wenshui Xian');
INSERT INTO `sys_region` VALUES ('716', '交城县', '58', 'Jiaocheng Xian');
INSERT INTO `sys_region` VALUES ('717', '兴县', '58', 'Xing Xian');
INSERT INTO `sys_region` VALUES ('718', '临县', '58', 'Lin Xian ');
INSERT INTO `sys_region` VALUES ('719', '柳林县', '58', 'Liulin Xian');
INSERT INTO `sys_region` VALUES ('72', '大连市', '7', 'Dalian Shi');
INSERT INTO `sys_region` VALUES ('720', '石楼县', '58', 'Shilou Xian');
INSERT INTO `sys_region` VALUES ('721', '岚县', '58', 'Lan Xian');
INSERT INTO `sys_region` VALUES ('722', '方山县', '58', 'Fangshan Xian');
INSERT INTO `sys_region` VALUES ('723', '中阳县', '58', 'Zhongyang Xian');
INSERT INTO `sys_region` VALUES ('724', '交口县', '58', 'Jiaokou Xian');
INSERT INTO `sys_region` VALUES ('725', '孝义市', '58', 'Xiaoyi Shi');
INSERT INTO `sys_region` VALUES ('726', '汾阳市', '58', 'Fenyang Shi');
INSERT INTO `sys_region` VALUES ('727', '市辖区', '59', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('728', '新城区', '59', 'Xincheng Qu');
INSERT INTO `sys_region` VALUES ('729', '回民区', '59', 'Huimin Qu');
INSERT INTO `sys_region` VALUES ('73', '鞍山市', '7', 'AnShan Shi');
INSERT INTO `sys_region` VALUES ('730', '玉泉区', '59', 'Yuquan Qu');
INSERT INTO `sys_region` VALUES ('731', '赛罕区', '59', 'Saihan Qu');
INSERT INTO `sys_region` VALUES ('732', '土默特左旗', '59', 'Tumd Zuoqi');
INSERT INTO `sys_region` VALUES ('733', '托克托县', '59', 'Togtoh Xian');
INSERT INTO `sys_region` VALUES ('734', '和林格尔县', '59', 'Horinger Xian');
INSERT INTO `sys_region` VALUES ('735', '清水河县', '59', 'Qingshuihe Xian');
INSERT INTO `sys_region` VALUES ('736', '武川县', '59', 'Wuchuan Xian');
INSERT INTO `sys_region` VALUES ('737', '市辖区', '60', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('738', '东河区', '60', 'Donghe Qu');
INSERT INTO `sys_region` VALUES ('739', '昆都仑区', '60', 'Kundulun Qu');
INSERT INTO `sys_region` VALUES ('74', '抚顺市', '7', 'Fushun Shi');
INSERT INTO `sys_region` VALUES ('740', '青山区', '60', 'Qingshan Qu');
INSERT INTO `sys_region` VALUES ('741', '石拐区', '60', 'Shiguai Qu');
INSERT INTO `sys_region` VALUES ('742', '白云鄂博矿区', '60', 'Baiyun Kuangqu');
INSERT INTO `sys_region` VALUES ('743', '九原区', '60', 'Jiuyuan Qu');
INSERT INTO `sys_region` VALUES ('744', '土默特右旗', '60', 'Tumd Youqi');
INSERT INTO `sys_region` VALUES ('745', '固阳县', '60', 'Guyang Xian');
INSERT INTO `sys_region` VALUES ('746', '达尔罕茂明安联合旗', '60', 'Darhan Muminggan Lianheqi');
INSERT INTO `sys_region` VALUES ('747', '市辖区', '61', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('748', '海勃湾区', '61', 'Haibowan Qu');
INSERT INTO `sys_region` VALUES ('749', '海南区', '61', 'Hainan Qu');
INSERT INTO `sys_region` VALUES ('75', '本溪市', '7', 'Benxi Shi');
INSERT INTO `sys_region` VALUES ('750', '乌达区', '61', 'Ud Qu');
INSERT INTO `sys_region` VALUES ('751', '市辖区', '62', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('752', '红山区', '62', 'Hongshan Qu');
INSERT INTO `sys_region` VALUES ('753', '元宝山区', '62', 'Yuanbaoshan Qu');
INSERT INTO `sys_region` VALUES ('754', '松山区', '62', 'Songshan Qu');
INSERT INTO `sys_region` VALUES ('755', '阿鲁科尔沁旗', '62', 'Ar Horqin Qi');
INSERT INTO `sys_region` VALUES ('756', '巴林左旗', '62', 'Bairin Zuoqi');
INSERT INTO `sys_region` VALUES ('757', '巴林右旗', '62', 'Bairin Youqi');
INSERT INTO `sys_region` VALUES ('758', '林西县', '62', 'Linxi Xian');
INSERT INTO `sys_region` VALUES ('759', '克什克腾旗', '62', 'Hexigten Qi');
INSERT INTO `sys_region` VALUES ('76', '丹东市', '7', 'Dandong Shi');
INSERT INTO `sys_region` VALUES ('760', '翁牛特旗', '62', 'Ongniud Qi');
INSERT INTO `sys_region` VALUES ('761', '喀喇沁旗', '62', 'Harqin Qi');
INSERT INTO `sys_region` VALUES ('762', '宁城县', '62', 'Ningcheng Xian');
INSERT INTO `sys_region` VALUES ('763', '敖汉旗', '62', 'Aohan Qi');
INSERT INTO `sys_region` VALUES ('764', '市辖区', '63', '1');
INSERT INTO `sys_region` VALUES ('765', '科尔沁区', '63', 'Keermi Qu');
INSERT INTO `sys_region` VALUES ('766', '科尔沁左翼中旗', '63', 'Horqin Zuoyi Zhongqi');
INSERT INTO `sys_region` VALUES ('767', '科尔沁左翼后旗', '63', 'Horqin Zuoyi Houqi');
INSERT INTO `sys_region` VALUES ('768', '开鲁县', '63', 'Kailu Xian');
INSERT INTO `sys_region` VALUES ('769', '库伦旗', '63', 'Hure Qi');
INSERT INTO `sys_region` VALUES ('77', '锦州市', '7', 'Jinzhou Shi');
INSERT INTO `sys_region` VALUES ('770', '奈曼旗', '63', 'Naiman Qi');
INSERT INTO `sys_region` VALUES ('771', '扎鲁特旗', '63', 'Jarud Qi');
INSERT INTO `sys_region` VALUES ('772', '霍林郭勒市', '63', 'Holingol Shi');
INSERT INTO `sys_region` VALUES ('773', '东胜区', '64', 'Dongsheng Qu');
INSERT INTO `sys_region` VALUES ('774', '达拉特旗', '64', 'Dalad Qi');
INSERT INTO `sys_region` VALUES ('775', '准格尔旗', '64', 'Jungar Qi');
INSERT INTO `sys_region` VALUES ('776', '鄂托克前旗', '64', 'Otog Qianqi');
INSERT INTO `sys_region` VALUES ('777', '鄂托克旗', '64', 'Otog Qi');
INSERT INTO `sys_region` VALUES ('778', '杭锦旗', '64', 'Hanggin Qi');
INSERT INTO `sys_region` VALUES ('779', '乌审旗', '64', 'Uxin Qi');
INSERT INTO `sys_region` VALUES ('78', '营口市', '7', 'Yingkou Shi');
INSERT INTO `sys_region` VALUES ('780', '伊金霍洛旗', '64', 'Ejin Horo Qi');
INSERT INTO `sys_region` VALUES ('781', '市辖区', '65', '1');
INSERT INTO `sys_region` VALUES ('782', '海拉尔区', '65', 'Hailaer Qu');
INSERT INTO `sys_region` VALUES ('783', '阿荣旗', '65', 'Arun Qi');
INSERT INTO `sys_region` VALUES ('784', '莫力达瓦达斡尔族自治旗', '65', 'Morin Dawa Daurzu Zizhiqi');
INSERT INTO `sys_region` VALUES ('785', '鄂伦春自治旗', '65', 'Oroqen Zizhiqi');
INSERT INTO `sys_region` VALUES ('786', '鄂温克族自治旗', '65', 'Ewenkizu Zizhiqi');
INSERT INTO `sys_region` VALUES ('787', '陈巴尔虎旗', '65', 'Chen Barag Qi');
INSERT INTO `sys_region` VALUES ('788', '新巴尔虎左旗', '65', 'Xin Barag Zuoqi');
INSERT INTO `sys_region` VALUES ('789', '新巴尔虎右旗', '65', 'Xin Barag Youqi');
INSERT INTO `sys_region` VALUES ('79', '阜新市', '7', 'Fuxin Shi');
INSERT INTO `sys_region` VALUES ('790', '满洲里市', '65', 'Manzhouli Shi');
INSERT INTO `sys_region` VALUES ('791', '牙克石市', '65', 'Yakeshi Shi');
INSERT INTO `sys_region` VALUES ('792', '扎兰屯市', '65', 'Zalantun Shi');
INSERT INTO `sys_region` VALUES ('793', '额尔古纳市', '65', 'Ergun Shi');
INSERT INTO `sys_region` VALUES ('794', '根河市', '65', 'Genhe Shi');
INSERT INTO `sys_region` VALUES ('795', '市辖区', '66', '1');
INSERT INTO `sys_region` VALUES ('796', '临河区', '66', 'Linhe Qu');
INSERT INTO `sys_region` VALUES ('797', '五原县', '66', 'Wuyuan Xian');
INSERT INTO `sys_region` VALUES ('798', '磴口县', '66', 'Dengkou Xian');
INSERT INTO `sys_region` VALUES ('799', '乌拉特前旗', '66', 'Urad Qianqi');
INSERT INTO `sys_region` VALUES ('8', '吉林省', '1', 'Jilin Sheng');
INSERT INTO `sys_region` VALUES ('80', '辽阳市', '7', 'Liaoyang Shi');
INSERT INTO `sys_region` VALUES ('800', '乌拉特中旗', '66', 'Urad Zhongqi');
INSERT INTO `sys_region` VALUES ('801', '乌拉特后旗', '66', 'Urad Houqi');
INSERT INTO `sys_region` VALUES ('802', '杭锦后旗', '66', 'Hanggin Houqi');
INSERT INTO `sys_region` VALUES ('803', '市辖区', '67', '1');
INSERT INTO `sys_region` VALUES ('804', '集宁区', '67', 'Jining Qu');
INSERT INTO `sys_region` VALUES ('805', '卓资县', '67', 'Zhuozi Xian');
INSERT INTO `sys_region` VALUES ('806', '化德县', '67', 'Huade Xian');
INSERT INTO `sys_region` VALUES ('807', '商都县', '67', 'Shangdu Xian');
INSERT INTO `sys_region` VALUES ('808', '兴和县', '67', 'Xinghe Xian');
INSERT INTO `sys_region` VALUES ('809', '凉城县', '67', 'Liangcheng Xian');
INSERT INTO `sys_region` VALUES ('81', '盘锦市', '7', 'Panjin Shi');
INSERT INTO `sys_region` VALUES ('810', '察哈尔右翼前旗', '67', 'Qahar Youyi Qianqi');
INSERT INTO `sys_region` VALUES ('811', '察哈尔右翼中旗', '67', 'Qahar Youyi Zhongqi');
INSERT INTO `sys_region` VALUES ('812', '察哈尔右翼后旗', '67', 'Qahar Youyi Houqi');
INSERT INTO `sys_region` VALUES ('813', '四子王旗', '67', 'Dorbod Qi');
INSERT INTO `sys_region` VALUES ('814', '丰镇市', '67', 'Fengzhen Shi');
INSERT INTO `sys_region` VALUES ('815', '乌兰浩特市', '68', 'Ulan Hot Shi');
INSERT INTO `sys_region` VALUES ('816', '阿尔山市', '68', 'Arxan Shi');
INSERT INTO `sys_region` VALUES ('817', '科尔沁右翼前旗', '68', 'Horqin Youyi Qianqi');
INSERT INTO `sys_region` VALUES ('818', '科尔沁右翼中旗', '68', 'Horqin Youyi Zhongqi');
INSERT INTO `sys_region` VALUES ('819', '扎赉特旗', '68', 'Jalaid Qi');
INSERT INTO `sys_region` VALUES ('82', '铁岭市', '7', 'Tieling Shi');
INSERT INTO `sys_region` VALUES ('820', '突泉县', '68', 'Tuquan Xian');
INSERT INTO `sys_region` VALUES ('821', '二连浩特市', '69', 'Erenhot Shi');
INSERT INTO `sys_region` VALUES ('822', '锡林浩特市', '69', 'Xilinhot Shi');
INSERT INTO `sys_region` VALUES ('823', '阿巴嘎旗', '69', 'Abag Qi');
INSERT INTO `sys_region` VALUES ('824', '苏尼特左旗', '69', 'Sonid Zuoqi');
INSERT INTO `sys_region` VALUES ('825', '苏尼特右旗', '69', 'Sonid Youqi');
INSERT INTO `sys_region` VALUES ('826', '东乌珠穆沁旗', '69', 'Dong Ujimqin Qi');
INSERT INTO `sys_region` VALUES ('827', '西乌珠穆沁旗', '69', 'Xi Ujimqin Qi');
INSERT INTO `sys_region` VALUES ('828', '太仆寺旗', '69', 'Taibus Qi');
INSERT INTO `sys_region` VALUES ('829', '镶黄旗', '69', 'Xianghuang(Hobot Xar) Qi');
INSERT INTO `sys_region` VALUES ('83', '朝阳市', '7', 'Chaoyang Shi');
INSERT INTO `sys_region` VALUES ('830', '正镶白旗', '69', 'Zhengxiangbai(Xulun Hobot Qagan)Qi');
INSERT INTO `sys_region` VALUES ('831', '正蓝旗', '69', 'Zhenglan(Xulun Hoh)Qi');
INSERT INTO `sys_region` VALUES ('832', '多伦县', '69', 'Duolun (Dolonnur)Xian');
INSERT INTO `sys_region` VALUES ('833', '阿拉善左旗', '70', 'Alxa Zuoqi');
INSERT INTO `sys_region` VALUES ('834', '阿拉善右旗', '70', 'Alxa Youqi');
INSERT INTO `sys_region` VALUES ('835', '额济纳旗', '70', 'Ejin Qi');
INSERT INTO `sys_region` VALUES ('836', '市辖区', '71', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('837', '和平区', '71', 'Heping Qu');
INSERT INTO `sys_region` VALUES ('838', '沈河区', '71', 'Shenhe Qu ');
INSERT INTO `sys_region` VALUES ('839', '大东区', '71', 'Dadong Qu ');
INSERT INTO `sys_region` VALUES ('84', '葫芦岛市', '7', 'Huludao Shi');
INSERT INTO `sys_region` VALUES ('840', '皇姑区', '71', 'Huanggu Qu');
INSERT INTO `sys_region` VALUES ('841', '铁西区', '71', 'Tiexi Qu');
INSERT INTO `sys_region` VALUES ('842', '苏家屯区', '71', 'Sujiatun Qu');
INSERT INTO `sys_region` VALUES ('843', '东陵区', '71', 'Dongling Qu ');
INSERT INTO `sys_region` VALUES ('844', '沈北新区', '71', 'Xinchengzi Qu');
INSERT INTO `sys_region` VALUES ('845', '于洪区', '71', 'Yuhong Qu ');
INSERT INTO `sys_region` VALUES ('846', '辽中县', '71', 'Liaozhong Xian');
INSERT INTO `sys_region` VALUES ('847', '康平县', '71', 'Kangping Xian');
INSERT INTO `sys_region` VALUES ('848', '法库县', '71', 'Faku Xian');
INSERT INTO `sys_region` VALUES ('849', '新民市', '71', 'Xinmin Shi');
INSERT INTO `sys_region` VALUES ('85', '长春市', '8', 'Changchun Shi ');
INSERT INTO `sys_region` VALUES ('850', '市辖区', '72', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('851', '中山区', '72', 'Zhongshan Qu');
INSERT INTO `sys_region` VALUES ('852', '西岗区', '72', 'Xigang Qu');
INSERT INTO `sys_region` VALUES ('853', '沙河口区', '72', 'Shahekou Qu');
INSERT INTO `sys_region` VALUES ('854', '甘井子区', '72', 'Ganjingzi Qu');
INSERT INTO `sys_region` VALUES ('855', '旅顺口区', '72', 'Lvshunkou Qu ');
INSERT INTO `sys_region` VALUES ('856', '金州区', '72', 'Jinzhou Qu');
INSERT INTO `sys_region` VALUES ('857', '长海县', '72', 'Changhai Xian');
INSERT INTO `sys_region` VALUES ('858', '瓦房店市', '72', 'Wafangdian Shi');
INSERT INTO `sys_region` VALUES ('859', '普兰店市', '72', 'Pulandian Shi');
INSERT INTO `sys_region` VALUES ('86', '吉林市', '8', 'Jilin Shi ');
INSERT INTO `sys_region` VALUES ('860', '庄河市', '72', 'Zhuanghe Shi');
INSERT INTO `sys_region` VALUES ('861', '市辖区', '73', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('862', '铁东区', '73', 'Tiedong Qu ');
INSERT INTO `sys_region` VALUES ('863', '铁西区', '73', 'Tiexi Qu');
INSERT INTO `sys_region` VALUES ('864', '立山区', '73', 'Lishan Qu');
INSERT INTO `sys_region` VALUES ('865', '千山区', '73', 'Qianshan Qu ');
INSERT INTO `sys_region` VALUES ('866', '台安县', '73', 'Tai,an Xian');
INSERT INTO `sys_region` VALUES ('867', '岫岩满族自治县', '73', 'Xiuyan Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('868', '海城市', '73', 'Haicheng Shi');
INSERT INTO `sys_region` VALUES ('869', '市辖区', '74', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('87', '四平市', '8', 'Siping Shi');
INSERT INTO `sys_region` VALUES ('870', '新抚区', '74', 'Xinfu Qu');
INSERT INTO `sys_region` VALUES ('871', '东洲区', '74', 'Dongzhou Qu');
INSERT INTO `sys_region` VALUES ('872', '望花区', '74', 'Wanghua Qu');
INSERT INTO `sys_region` VALUES ('873', '顺城区', '74', 'Shuncheng Qu');
INSERT INTO `sys_region` VALUES ('874', '抚顺县', '74', 'Fushun Xian');
INSERT INTO `sys_region` VALUES ('875', '新宾满族自治县', '74', 'Xinbinmanzuzizhi Xian');
INSERT INTO `sys_region` VALUES ('876', '清原满族自治县', '74', 'Qingyuanmanzuzizhi Xian');
INSERT INTO `sys_region` VALUES ('877', '市辖区', '75', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('878', '平山区', '75', 'Pingshan Qu');
INSERT INTO `sys_region` VALUES ('879', '溪湖区', '75', 'Xihu Qu ');
INSERT INTO `sys_region` VALUES ('88', '辽源市', '8', 'Liaoyuan Shi');
INSERT INTO `sys_region` VALUES ('880', '明山区', '75', 'Mingshan Qu');
INSERT INTO `sys_region` VALUES ('881', '南芬区', '75', 'Nanfen Qu');
INSERT INTO `sys_region` VALUES ('882', '本溪满族自治县', '75', 'Benxi Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('883', '桓仁满族自治县', '75', 'Huanren Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('884', '市辖区', '76', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('885', '元宝区', '76', 'Yuanbao Qu');
INSERT INTO `sys_region` VALUES ('886', '振兴区', '76', 'Zhenxing Qu ');
INSERT INTO `sys_region` VALUES ('887', '振安区', '76', 'Zhen,an Qu');
INSERT INTO `sys_region` VALUES ('888', '宽甸满族自治县', '76', 'Kuandian Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('889', '东港市', '76', 'Donggang Shi');
INSERT INTO `sys_region` VALUES ('89', '通化市', '8', 'Tonghua Shi');
INSERT INTO `sys_region` VALUES ('890', '凤城市', '76', 'Fengcheng Shi');
INSERT INTO `sys_region` VALUES ('891', '市辖区', '77', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('892', '古塔区', '77', 'Guta Qu');
INSERT INTO `sys_region` VALUES ('893', '凌河区', '77', 'Linghe Qu');
INSERT INTO `sys_region` VALUES ('894', '太和区', '77', 'Taihe Qu');
INSERT INTO `sys_region` VALUES ('895', '黑山县', '77', 'Heishan Xian');
INSERT INTO `sys_region` VALUES ('896', '义县', '77', 'Yi Xian');
INSERT INTO `sys_region` VALUES ('897', '凌海市', '77', 'Linghai Shi ');
INSERT INTO `sys_region` VALUES ('898', '北镇市', '77', 'Beining Shi');
INSERT INTO `sys_region` VALUES ('899', '市辖区', '78', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('9', '黑龙江省', '1', 'Heilongjiang Sheng');
INSERT INTO `sys_region` VALUES ('90', '白山市', '8', 'Baishan Shi');
INSERT INTO `sys_region` VALUES ('900', '站前区', '78', 'Zhanqian Qu');
INSERT INTO `sys_region` VALUES ('901', '西市区', '78', 'Xishi Qu');
INSERT INTO `sys_region` VALUES ('902', '鲅鱼圈区', '78', 'Bayuquan Qu');
INSERT INTO `sys_region` VALUES ('903', '老边区', '78', 'Laobian Qu');
INSERT INTO `sys_region` VALUES ('904', '盖州市', '78', 'Gaizhou Shi');
INSERT INTO `sys_region` VALUES ('905', '大石桥市', '78', 'Dashiqiao Shi');
INSERT INTO `sys_region` VALUES ('906', '市辖区', '79', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('907', '海州区', '79', 'Haizhou Qu');
INSERT INTO `sys_region` VALUES ('908', '新邱区', '79', 'Xinqiu Qu');
INSERT INTO `sys_region` VALUES ('909', '太平区', '79', 'Taiping Qu');
INSERT INTO `sys_region` VALUES ('91', '松原市', '8', 'Songyuan Shi');
INSERT INTO `sys_region` VALUES ('910', '清河门区', '79', 'Qinghemen Qu');
INSERT INTO `sys_region` VALUES ('911', '细河区', '79', 'Xihe Qu');
INSERT INTO `sys_region` VALUES ('912', '阜新蒙古族自治县', '79', 'Fuxin Mongolzu Zizhixian');
INSERT INTO `sys_region` VALUES ('913', '彰武县', '79', 'Zhangwu Xian');
INSERT INTO `sys_region` VALUES ('914', '市辖区', '80', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('915', '白塔区', '80', 'Baita Qu');
INSERT INTO `sys_region` VALUES ('916', '文圣区', '80', 'Wensheng Qu');
INSERT INTO `sys_region` VALUES ('917', '宏伟区', '80', 'Hongwei Qu');
INSERT INTO `sys_region` VALUES ('918', '弓长岭区', '80', 'Gongchangling Qu');
INSERT INTO `sys_region` VALUES ('919', '太子河区', '80', 'Taizihe Qu');
INSERT INTO `sys_region` VALUES ('92', '白城市', '8', 'Baicheng Shi');
INSERT INTO `sys_region` VALUES ('920', '辽阳县', '80', 'Liaoyang Xian');
INSERT INTO `sys_region` VALUES ('921', '灯塔市', '80', 'Dengta Shi');
INSERT INTO `sys_region` VALUES ('922', '市辖区', '81', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('923', '双台子区', '81', 'Shuangtaizi Qu');
INSERT INTO `sys_region` VALUES ('924', '兴隆台区', '81', 'Xinglongtai Qu');
INSERT INTO `sys_region` VALUES ('925', '大洼县', '81', 'Dawa Xian');
INSERT INTO `sys_region` VALUES ('926', '盘山县', '81', 'Panshan Xian');
INSERT INTO `sys_region` VALUES ('927', '市辖区', '82', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('928', '银州区', '82', 'Yinzhou Qu');
INSERT INTO `sys_region` VALUES ('929', '清河区', '82', 'Qinghe Qu');
INSERT INTO `sys_region` VALUES ('93', '延边朝鲜族自治州', '8', 'Yanbian Chosenzu Zizhizhou');
INSERT INTO `sys_region` VALUES ('930', '铁岭县', '82', 'Tieling Xian');
INSERT INTO `sys_region` VALUES ('931', '西丰县', '82', 'Xifeng Xian');
INSERT INTO `sys_region` VALUES ('932', '昌图县', '82', 'Changtu Xian');
INSERT INTO `sys_region` VALUES ('933', '调兵山市', '82', 'Diaobingshan Shi');
INSERT INTO `sys_region` VALUES ('934', '开原市', '82', 'Kaiyuan Shi');
INSERT INTO `sys_region` VALUES ('935', '市辖区', '83', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('936', '双塔区', '83', 'Shuangta Qu');
INSERT INTO `sys_region` VALUES ('937', '龙城区', '83', 'Longcheng Qu');
INSERT INTO `sys_region` VALUES ('938', '朝阳县', '83', 'Chaoyang Xian');
INSERT INTO `sys_region` VALUES ('939', '建平县', '83', 'Jianping Xian');
INSERT INTO `sys_region` VALUES ('94', '哈尔滨市', '9', 'Harbin Shi');
INSERT INTO `sys_region` VALUES ('940', '喀喇沁左翼蒙古族自治县', '83', 'Harqin Zuoyi Mongolzu Zizhixian');
INSERT INTO `sys_region` VALUES ('941', '北票市', '83', 'Beipiao Shi');
INSERT INTO `sys_region` VALUES ('942', '凌源市', '83', 'Lingyuan Shi');
INSERT INTO `sys_region` VALUES ('943', '市辖区', '84', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('944', '连山区', '84', 'Lianshan Qu');
INSERT INTO `sys_region` VALUES ('945', '龙港区', '84', 'Longgang Qu');
INSERT INTO `sys_region` VALUES ('946', '南票区', '84', 'Nanpiao Qu');
INSERT INTO `sys_region` VALUES ('947', '绥中县', '84', 'Suizhong Xian');
INSERT INTO `sys_region` VALUES ('948', '建昌县', '84', 'Jianchang Xian');
INSERT INTO `sys_region` VALUES ('949', '兴城市', '84', 'Xingcheng Shi');
INSERT INTO `sys_region` VALUES ('95', '齐齐哈尔市', '9', 'Qiqihar Shi');
INSERT INTO `sys_region` VALUES ('950', '市辖区', '85', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('951', '南关区', '85', 'Nanguan Qu');
INSERT INTO `sys_region` VALUES ('952', '宽城区', '85', 'Kuancheng Qu');
INSERT INTO `sys_region` VALUES ('953', '朝阳区', '85', 'Chaoyang Qu ');
INSERT INTO `sys_region` VALUES ('954', '二道区', '85', 'Erdao Qu');
INSERT INTO `sys_region` VALUES ('955', '绿园区', '85', 'Lvyuan Qu');
INSERT INTO `sys_region` VALUES ('956', '双阳区', '85', 'Shuangyang Qu');
INSERT INTO `sys_region` VALUES ('957', '农安县', '85', 'Nong,an Xian ');
INSERT INTO `sys_region` VALUES ('958', '九台市', '85', 'Jiutai Shi');
INSERT INTO `sys_region` VALUES ('959', '榆树市', '85', 'Yushu Shi');
INSERT INTO `sys_region` VALUES ('96', '鸡西市', '9', 'Jixi Shi');
INSERT INTO `sys_region` VALUES ('960', '德惠市', '85', 'Dehui Shi');
INSERT INTO `sys_region` VALUES ('961', '市辖区', '86', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('962', '昌邑区', '86', 'Changyi Qu');
INSERT INTO `sys_region` VALUES ('963', '龙潭区', '86', 'Longtan Qu');
INSERT INTO `sys_region` VALUES ('964', '船营区', '86', 'Chuanying Qu');
INSERT INTO `sys_region` VALUES ('965', '丰满区', '86', 'Fengman Qu');
INSERT INTO `sys_region` VALUES ('966', '永吉县', '86', 'Yongji Xian');
INSERT INTO `sys_region` VALUES ('967', '蛟河市', '86', 'Jiaohe Shi');
INSERT INTO `sys_region` VALUES ('968', '桦甸市', '86', 'Huadian Shi');
INSERT INTO `sys_region` VALUES ('969', '舒兰市', '86', 'Shulan Shi');
INSERT INTO `sys_region` VALUES ('97', '鹤岗市', '9', 'Hegang Shi');
INSERT INTO `sys_region` VALUES ('970', '磐石市', '86', 'Panshi Shi');
INSERT INTO `sys_region` VALUES ('971', '市辖区', '87', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('972', '铁西区', '87', 'Tiexi Qu');
INSERT INTO `sys_region` VALUES ('973', '铁东区', '87', 'Tiedong Qu ');
INSERT INTO `sys_region` VALUES ('974', '梨树县', '87', 'Lishu Xian');
INSERT INTO `sys_region` VALUES ('975', '伊通满族自治县', '87', 'Yitong Manzu Zizhixian');
INSERT INTO `sys_region` VALUES ('976', '公主岭市', '87', 'Gongzhuling Shi');
INSERT INTO `sys_region` VALUES ('977', '双辽市', '87', 'Shuangliao Shi');
INSERT INTO `sys_region` VALUES ('978', '市辖区', '88', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('979', '龙山区', '88', 'Longshan Qu');
INSERT INTO `sys_region` VALUES ('98', '双鸭山市', '9', 'Shuangyashan Shi');
INSERT INTO `sys_region` VALUES ('980', '西安区', '88', 'Xi,an Qu');
INSERT INTO `sys_region` VALUES ('981', '东丰县', '88', 'Dongfeng Xian');
INSERT INTO `sys_region` VALUES ('982', '东辽县', '88', 'Dongliao Xian ');
INSERT INTO `sys_region` VALUES ('983', '市辖区', '89', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('984', '东昌区', '89', 'Dongchang Qu');
INSERT INTO `sys_region` VALUES ('985', '二道江区', '89', 'Erdaojiang Qu');
INSERT INTO `sys_region` VALUES ('986', '通化县', '89', 'Tonghua Xian ');
INSERT INTO `sys_region` VALUES ('987', '辉南县', '89', 'Huinan Xian ');
INSERT INTO `sys_region` VALUES ('988', '柳河县', '89', 'Liuhe Xian ');
INSERT INTO `sys_region` VALUES ('989', '梅河口市', '89', 'Meihekou Shi');
INSERT INTO `sys_region` VALUES ('99', '大庆市', '9', 'Daqing Shi');
INSERT INTO `sys_region` VALUES ('990', '集安市', '89', 'Ji,an Shi');
INSERT INTO `sys_region` VALUES ('991', '市辖区', '90', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('992', '八道江区', '90', 'Badaojiang Qu');
INSERT INTO `sys_region` VALUES ('993', '抚松县', '90', 'Fusong Xian');
INSERT INTO `sys_region` VALUES ('994', '靖宇县', '90', 'Jingyu Xian');
INSERT INTO `sys_region` VALUES ('995', '长白朝鲜族自治县', '90', 'Changbaichaoxianzuzizhi Xian');
INSERT INTO `sys_region` VALUES ('996', '江源区', '90', 'Jiangyuan Xian');
INSERT INTO `sys_region` VALUES ('997', '临江市', '90', 'Linjiang Shi');
INSERT INTO `sys_region` VALUES ('998', '市辖区', '91', 'Shixiaqu');
INSERT INTO `sys_region` VALUES ('999', '宁江区', '91', 'Ningjiang Qu');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT 1 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '全部', '超级管理员', '0', 'system', '2019-08-25 06:55:48', 'system', '2019-08-25 06:55:48', 1);
INSERT INTO `sys_role` VALUES ('2', '普通用户', 'common', '自定义', '用于测试菜单与权限', '0', 'system', '2019-08-25 06:55:48', 'system', '2019-09-05 14:41:21', 4);
INSERT INTO `sys_role` VALUES ('3', '普通管理员', 'ladmin', '自定义', '普通管理员级别为2，使用该角色新增用户时只能赋予比普通管理员级别低的角色', '0', 'system', '2019-09-29 17:09:57', 'system', '2019-09-29 17:09:59', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_role_menu_id`(`role_id`, `menu_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE,
  INDEX `index_group_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1169437618557612034', '2', '1', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618570194947', '2', '11', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618570194949', '2', '15', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618578583554', '2', '2', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618578583556', '2', '10', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618578583558', '2', '12', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618578583560', '2', '13', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618578583562', '2', '14', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618578583564', '2', '3', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618586972163', '2', '4', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618586972165', '2', '8', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169437618586972167', '2', '9', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169440076302315532', '2', '19', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169440076302315534', '2', '20', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169440076302315536', '2', '21', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169440076302315538', '2', '22', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169521030406889475', '1', '1', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169521030419472386', '1', '11', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169521098383974403', '1', '1', NULL);
INSERT INTO `sys_role_menu` VALUES ('1169521098388168706', '1', '11', NULL);

-- ----------------------------
-- Table structure for sys_role_scope
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_scope`;
CREATE TABLE `sys_role_scope`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `scope_category` int(2) NULL DEFAULT NULL COMMENT '权限类型(1:数据权限、2:接口权限)',
  `scope_id` bigint(64) NULL DEFAULT NULL COMMENT '权限id',
  `role_id` bigint(64) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色数据权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_scope_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_scope_api`;
CREATE TABLE `sys_scope_api`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `menu_id` bigint(64) NULL DEFAULT NULL COMMENT '菜单主键',
  `resource_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编号',
  `scope_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口权限名',
  `scope_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口权限地址',
  `scope_type` int(2) NULL DEFAULT NULL COMMENT '接口权限类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口权限备注',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  `version` int(1) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_scope_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_scope_data`;
CREATE TABLE `sys_scope_data`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `menu_id` bigint(64) NULL DEFAULT NULL COMMENT '菜单主键',
  `resource_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编号',
  `scope_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据权限名称',
  `scope_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据权限字段',
  `scope_class` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据权限类名',
  `scope_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据权限字段',
  `scope_type` int(2) NULL DEFAULT NULL COMMENT '数据权限类型',
  `scope_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据权限值域',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据权限备注',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  `version` int(1) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0正常 9-冻结',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '北京分公司', '1', '2019-05-15 00:00:00', '2020-05-15 00:00:00', '0', '0', '2019-05-15 15:44:57', '2019-05-18 14:47:30');

-- ----------------------------
-- Table structure for sys_top_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_top_menu`;
CREATE TABLE `sys_top_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶部菜单编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶部菜单名',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶部菜单资源',
  `sort` int(2) NULL DEFAULT NULL COMMENT '顶部菜单排序',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(1) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '顶部菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `org_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门code',
  `mgr_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员类型（0非管理员 1系统管理员  2二级管理员）',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态(1：正常  2：冻结 ）',
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像路径',
  `sign` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `wx_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的微信号',
  `mobile_imei` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的手机串号',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态（0，正常，1已删除）',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `version` int(11) NULL DEFAULT 1 COMMENT '乐观锁',
  `client_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端类型',
  `client_id` int(11) NULL DEFAULT NULL COMMENT '个推id',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`username`) USING BTREE,
  INDEX `index_user_status`(`status`) USING BTREE,
  INDEX `index_user_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('10000', 'admin', '管理员', '116117663cd95a0821372827f1409cd1', 'PLBs9PiF', '633049326@qq.com', '17868161521', 'A01', '1', 1, NULL, NULL, NULL, NULL, '0', 'quickd', NULL, NULL, 'system', '2019-09-05 13:34:17', 'admin', '2019-09-29 16:53:27', '0', NULL, 2, NULL, NULL, '000000');
INSERT INTO `sys_user` VALUES ('1169483869655289859', 'demo', '演示', '116117663cd95a0821372827f1409cd1', 'PLBs9PiF', '633049326@qq.com', '17868161521', 'A01', '0', 1, NULL, NULL, NULL, NULL, '0', 'quickd', NULL, NULL, 'admin', '2019-09-05 13:34:17', NULL, '2019-09-05 13:34:17', '0', NULL, 1, NULL, NULL, '100000');

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `dep_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_depart_groupk_userid`(`user_id`) USING BTREE,
  INDEX `index_depart_groupkorgid`(`dep_id`) USING BTREE,
  INDEX `index_depart_groupk_uidanddid`(`user_id`, `dep_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index2_groupuu_user_id`(`user_id`) USING BTREE,
  INDEX `index2_groupuu_ole_id`(`role_id`) USING BTREE,
  INDEX `index2_groupuu_useridandroleid`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1169483870028582914', '1169483869655289859', '1');
INSERT INTO `sys_user_role` VALUES ('1169485328140726274', '1169485327893262338', '2');

-- ----------------------------
-- Table structure for t_app_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_app_menu`;
CREATE TABLE `t_app_menu`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程状态',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `functionurl` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `sortno` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序顺序',
  `pagename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `iconcolor` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标颜色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_app_menu
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
