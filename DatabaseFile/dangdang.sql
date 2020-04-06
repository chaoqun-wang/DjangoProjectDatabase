/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : dangdang

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 06/04/2020 14:30:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add t address', 7, 'add_taddress');
INSERT INTO `auth_permission` VALUES (20, 'Can change t address', 7, 'change_taddress');
INSERT INTO `auth_permission` VALUES (21, 'Can delete t address', 7, 'delete_taddress');
INSERT INTO `auth_permission` VALUES (22, 'Can add t book classification', 8, 'add_tbookclassification');
INSERT INTO `auth_permission` VALUES (23, 'Can change t book classification', 8, 'change_tbookclassification');
INSERT INTO `auth_permission` VALUES (24, 'Can delete t book classification', 8, 'delete_tbookclassification');
INSERT INTO `auth_permission` VALUES (25, 'Can add t books', 9, 'add_tbooks');
INSERT INTO `auth_permission` VALUES (26, 'Can change t books', 9, 'change_tbooks');
INSERT INTO `auth_permission` VALUES (27, 'Can delete t books', 9, 'delete_tbooks');
INSERT INTO `auth_permission` VALUES (28, 'Can add t order', 10, 'add_torder');
INSERT INTO `auth_permission` VALUES (29, 'Can change t order', 10, 'change_torder');
INSERT INTO `auth_permission` VALUES (30, 'Can delete t order', 10, 'delete_torder');
INSERT INTO `auth_permission` VALUES (31, 'Can add t order detail', 11, 'add_torderdetail');
INSERT INTO `auth_permission` VALUES (32, 'Can change t order detail', 11, 'change_torderdetail');
INSERT INTO `auth_permission` VALUES (33, 'Can delete t order detail', 11, 'delete_torderdetail');
INSERT INTO `auth_permission` VALUES (34, 'Can add t shopping cart', 12, 'add_tshoppingcart');
INSERT INTO `auth_permission` VALUES (35, 'Can change t shopping cart', 12, 'change_tshoppingcart');
INSERT INTO `auth_permission` VALUES (36, 'Can delete t shopping cart', 12, 'delete_tshoppingcart');
INSERT INTO `auth_permission` VALUES (37, 'Can add t user', 13, 'add_tuser');
INSERT INTO `auth_permission` VALUES (38, 'Can change t user', 13, 'change_tuser');
INSERT INTO `auth_permission` VALUES (39, 'Can delete t user', 13, 'delete_tuser');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'home', 'taddress');
INSERT INTO `django_content_type` VALUES (8, 'home', 'tbookclassification');
INSERT INTO `django_content_type` VALUES (9, 'home', 'tbooks');
INSERT INTO `django_content_type` VALUES (10, 'home', 'torder');
INSERT INTO `django_content_type` VALUES (11, 'home', 'torderdetail');
INSERT INTO `django_content_type` VALUES (12, 'home', 'tshoppingcart');
INSERT INTO `django_content_type` VALUES (13, 'home', 'tuser');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-03-03 12:42:54.726061');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-03-03 12:42:56.150075');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-03-03 12:42:56.593463');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-03-03 12:42:56.644328');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2020-03-03 12:42:56.972251');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2020-03-03 12:42:57.130828');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2020-03-03 12:42:57.218593');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2020-03-03 12:42:57.240534');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2020-03-03 12:42:57.357222');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2020-03-03 12:42:57.364205');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2020-03-03 12:42:57.386147');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2020-03-03 12:42:57.549708');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2020-03-03 12:42:57.828963');
INSERT INTO `django_migrations` VALUES (14, 'home', '0001_initial', '2020-03-03 12:42:57.850940');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2020-03-03 12:42:57.935711');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('729lz3inkvesgv9n5f32yspx3fpkjx5b', 'NTEzNWY2OWRmN2ZjMTQxMGQ3NDYzMWU0OTg2ODRmMjViODk5ODVhNDqABJUqAAAAAAAAAH2UKIwDdXJslIwUL2NhcnQvc2hvcHBpbmdfY2FydC+UjARmbGFnlIh1Lg==', '2020-03-17 15:29:16.535061');
INSERT INTO `django_session` VALUES ('73qu7zctf4gp61vcevugcgau6gd6eg38', 'ODFlNTZkZDQxYmRiNjgzNmViMjBkMDA2MzQ1N2U5ZjVhOWZmOGQ0NjqABJWVAAAAAAAAAH2UKIwDdXJslIwTL29yZGVyL2luZGVudF9wYWdlL5SMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCzE4MzIyMDExMTExlIwLdG90YWxfcHJpY2WUSwCMBW9yZGVylIwJY2FydC5jYXJ0lIwEQ2FydJSTlCmBlH2UjApib29rX2l0ZW1zlF2Uc2KMBGZsYWeUiHUu', '2020-03-18 12:31:11.569669');
INSERT INTO `django_session` VALUES ('8i0acdnhyfr3n5872nbkxr6i2zprznwv', 'M2YyYzQzYWEwMTA5YTMwYzQ3ZThmNTcxNGJiMDU1ZTUzZWM2ZThkMzqABJVLAgAAAAAAAH2UKIwDdXJslIwUL2NhcnQvc2hvcHBpbmdfY2FydC+UjARmbGFnlIiMBGNvZGWUjAVsZjhLNJSMBGNhcnSUjAljYXJ0LmNhcnSUjARDYXJ0lJOUKYGUfZSMCmJvb2tfaXRlbXOUXZQoaAeMBEJvb2uUk5QpgZR9lCiMB2Jvb2tfaWSUSyeMCWJvb2tfbmFtZZSMCeW3qOWptOWbvZSMCmJvb2tfcHJpY2WUjAdkZWNpbWFslIwHRGVjaW1hbJSTlIwFNDUuMDCUhZRSlIwLYm9va19udW1iZXKUSwqMDGJvb2tfcGljdHVyZZSMG2ltYWdlcy8xOTAwNjQ2MTA1LTFfbF8yLmpwZ5SMC3RvdGFsX3ByaWNllGgYjAY0NTAuMDCUhZRSlIwJcHVibGlzaGVylIwV6auY562J5pWZ6IKy5Ye654mI56S+lHViaA8pgZR9lChoEksGaBOMBDI2NjaUaBVoGIwFNDUuMDCUhZRSlGgcS3toHYwZaW1hZ2VzLzIyNTM5NTYwLTFfbF8xLmpwZ5RoH2gYjAc1NTM1LjAwlIWUUpRoI4wV6auY562J5pWZ6IKy5Ye654mI56S+lHViaA8pgZR9lChoEksOaBOMGOS7juS9oOeahOWFqOS4lueVjOi3r+i/h5RoFWgYjAU0NS4wMJSFlFKUaBxLAmgdjBdpbWFnZXMvMjMzNTMzNDItMV9sLmpwZ5RoH2gYjAU5MC4wMJSFlFKUaCOMFemrmOetieaVmeiCsuWHuueJiOekvpR1YmVzYnUu', '2020-03-18 17:22:09.473467');
INSERT INTO `django_session` VALUES ('8ylmfyr87f4zbve7jq2q0mks26ahnlc4', 'YzdjYzQ0NmIxMzY0ODQ3ZWM5NWFhYzgzNzBhOTQzOWYzNTI5NThiMzqABJVMAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2xpc3RfcGFnZS+UjARmbGFnlIiMBGNvZGWUjAVFb1dQZpSMAmlklIwBMZSMBWxldmVslGgHdS4=', '2020-03-19 09:40:36.133567');
INSERT INTO `django_session` VALUES ('9jiks4oosil48k5mmj39bg54snmywmhp', 'N2M2ZGQzZjgyZjA0YTIyNDE4NWMyZjczMGVmOGEyNjFiYmFmNGNhOTqABJVTAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCzE4MzIyMDExMTExlHUu', '2020-03-18 11:48:25.347171');
INSERT INTO `django_session` VALUES ('bm7p8tp0ql1kmrh2rqoczpbuhcx0v765', 'OTU4ZTQ2MGM4MjVmMTdjNjc2MWZlNjZlNjY5ZWQxZTljNTEwYjVjODqABJVhAAAAAAAAAH2UKIwDdXJslIwUL2NhcnQvc2hvcHBpbmdfY2FydC+UjARmbGFnlIiMBGNvZGWUjAVqdmdFZZSMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCjEyM0BxcS5jb22UdS4=', '2020-03-18 09:48:50.482957');
INSERT INTO `django_session` VALUES ('bo5v9q5fxa4pbunaowodd6qcut1zia12', 'MmMzZjdlMmIwNGU4ZmY4MzhmMDMwYzE2YTU1Nzk4MmI0ODhmZDc4ZDqABJVUAQAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2xpc3RfcGFnZS+UjARmbGFnlIiMBGNhcnSUjAljYXJ0LmNhcnSUjARDYXJ0lJOUKYGUfZSMCmJvb2tfaXRlbXOUXZRoBYwEQm9va5STlCmBlH2UKIwHYm9va19pZJRLJ4wJYm9va19uYW1llIwJ5beo5am05Zu9lIwKYm9va19wcmljZZSMB2RlY2ltYWyUjAdEZWNpbWFslJOUjAU0NS4wMJSFlFKUjAtib29rX251bWJlcpRLBIwMYm9va19waWN0dXJllIwbaW1hZ2VzLzE5MDA2NDYxMDUtMV9sXzIuanBnlIwLdG90YWxfcHJpY2WUaBaMBjE4MC4wMJSFlFKUjAlwdWJsaXNoZXKUjBXpq5jnrYnmlZnogrLlh7rniYjnpL6UdWJhc2KMAmlklIwBMZSMBWxldmVslGgkdS4=', '2020-03-18 13:13:09.657201');
INSERT INTO `django_session` VALUES ('crr1d92z2wpnpe1ckz8z4jgb8iep94ol', 'N2M2ZGQzZjgyZjA0YTIyNDE4NWMyZjczMGVmOGEyNjFiYmFmNGNhOTqABJVTAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCzE4MzIyMDExMTExlHUu', '2020-03-18 12:15:41.284059');
INSERT INTO `django_session` VALUES ('ctrwwowl2czb3nhrf7xwjk53xn5yegpi', 'MWUyMWMyZjRkMjk5NWQ4ODA5YzEyNmMwNDI0NmZhMDk1YTFmNGFiNDqABJVzAAAAAAAAAH2UKIwDdXJslIw0L2RhbmdkYW5nL2RldGFpbHNfcGFnZS8/Ym9va19pZD1hc2Rhc2Rha2ZoYnNkYWZqYXNmYpSMBGZsYWeUiIwMbG9naW5fc3RhdHVzlIiMCHVzZXJuYW1llIwLMTgzMjIwMTExMTGUdS4=', '2020-03-18 12:12:41.739925');
INSERT INTO `django_session` VALUES ('hgdihdocgss3ejhuu29xe4le1x6pyv2i', 'NjQ5MzI2YmZhMTA2MTYyMDliMmFjNzQ2M2IwOTY5YWJhNTQzZDQwMTqABJUqAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIh1Lg==', '2020-03-18 01:42:39.540148');
INSERT INTO `django_session` VALUES ('k1ovyjjk6665qvpys866uqy0kayimgc1', 'ZGE0MDdjN2NhNmY3YjMzYzM1ZWMzNTk5Mjk0OWVmYTFkNmRiODcyMDqABJWYAAAAAAAAAH2UKIwDdXJslIwUL2NhcnQvc2hvcHBpbmdfY2FydC+UjARmbGFnlIiMBGNvZGWUjAVPaGFRdZSMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMDDEyMzQ1QHFxLmNvbZSMC3JhbmRvbV9jb2RllIwkYzIwM2Y4MmQtZDM4OS00YjA5LTlkNjUtZjhhYTQ1MGY0MjBllHUu', '2020-03-18 07:08:04.205375');
INSERT INTO `django_session` VALUES ('kh69x5j9fmuh4clmua7bd2ddh72qc1y1', 'NjQ5MzI2YmZhMTA2MTYyMDliMmFjNzQ2M2IwOTY5YWJhNTQzZDQwMTqABJUqAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIh1Lg==', '2020-03-19 07:12:50.330623');
INSERT INTO `django_session` VALUES ('kkc3elahzltd0n0yxe664jr0yap3elc2', 'NjQ5MzI2YmZhMTA2MTYyMDliMmFjNzQ2M2IwOTY5YWJhNTQzZDQwMTqABJUqAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIh1Lg==', '2020-03-18 11:30:06.514568');
INSERT INTO `django_session` VALUES ('nkdjneqqtr886sutavn2xefwoqw3432z', 'MmYxZDhhMzJmMTI4MzVhZjk4NDE1YmYzYzYwNTE0ODU5ZjFhMTMwMDqABJXYAAAAAAAAAH2UKIwDdXJslIwUL2NhcnQvc2hvcHBpbmdfY2FydC+UjARmbGFnlIiMBGNvZGWUjAV2ZFZET5SMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCjEyM0BxcS5jb22UjAt0b3RhbF9wcmljZZSMB2RlY2ltYWyUjAdEZWNpbWFslJOUjAYyNzIuMDCUhZRSlIwCaWSUjAExlIwFbGV2ZWyUaBGMBW9yZGVylIwJY2FydC5jYXJ0lIwEQ2FydJSTlCmBlH2UjApib29rX2l0ZW1zlF2Uc2J1Lg==', '2020-03-17 14:56:33.353114');
INSERT INTO `django_session` VALUES ('p738tc7jj1p581jjh3edegj506sl0blb', 'YWQ2NTM4YTVmYzVjYzlkMWUzOTFmODg0OTM2OTM0ZDFkOWFmOWJkNjqABJWRAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMBGNvZGWUjAVUTDhLNpSMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCjEyM0BxcS5jb22UjAt0b3RhbF9wcmljZZSMB2RlY2ltYWyUjAdEZWNpbWFslJOUjAU0NS4wMJSFlFKUdS4=', '2020-03-19 08:41:45.969625');
INSERT INTO `django_session` VALUES ('pihu8rfrjb8r0noz42ie1ak6dk2qyzsl', 'ZGUyNzVlZDdiZGE4ZWI4YmY3YzRhMTc3MzM4ODZlNTUyYzM4YWEzNjqABJV2AAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMBGNvZGWUjAVaeXVKaJSMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCnFhekBxcS5jb22UjAtyYW5kb21fY29kZZSMBDY2NjaUdS4=', '2020-03-17 18:23:40.685517');
INSERT INTO `django_session` VALUES ('plgj21lu1ydzimm9hcykdhoyx1i2jqmz', 'OTViZTIyYjY2MzM0ZGVmZTI3OWFiM2Q2MTA1OWUxYmQ4YzViMGE1YTqABJU5AAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMBGNvZGWUjAVVemNuV5R1Lg==', '2020-03-19 09:46:44.345266');
INSERT INTO `django_session` VALUES ('txy7v319sfy046brjyxk0c6rsl76zyeo', 'NjMzNjIyMDNhN2Q2ZWY2MTRiMTk2NTgyODZiNTU1MDY4MjAzZjZhYzqABJU5AAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMBGNvZGWUjAVPd0c2VZR1Lg==', '2020-03-20 03:12:03.805347');
INSERT INTO `django_session` VALUES ('ud03s3qif9ql1a6fec6zkohuma15ocys', 'NGIzNTMwYzk5ZjgzY2RhMjI1NzAxNmVjNGRjZjE0N2RjODdmNTQ0YTqABJVmAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2xpc3RfcGFnZS+UjARmbGFnlIiMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCzE4MzIyMDExMTExlIwCaWSUjAExlIwFbGV2ZWyUaAh1Lg==', '2020-03-18 11:35:36.374373');
INSERT INTO `django_session` VALUES ('uusudhkd52dv1bg1lbfq3s2x39nufsm6', 'MDg3ZmZlMmI0MjY2NzQ4OTMzZDJhY2NhZDQwOThiNGUxZDkzN2FiZTqABJWlAAAAAAAAAH2UKIwDdXJslIwUL2NhcnQvc2hvcHBpbmdfY2FydC+UjARmbGFnlIiMAmlklIwBMZSMBWxldmVslGgFjARjb2RllIwFQlNvR0uUjAxsb2dpbl9zdGF0dXOUiIwIdXNlcm5hbWWUjAoxMjNAcXEuY29tlIwLdG90YWxfcHJpY2WUjAdkZWNpbWFslIwHRGVjaW1hbJSTlIwGMjI1LjAwlIWUUpR1Lg==', '2020-03-18 16:06:07.825000');
INSERT INTO `django_session` VALUES ('uxv8c291s2a3suq607sor5oa3gwzuf7c', 'ZjIwMzY4M2ViOTliNjI1ODhiMTg0NGNmYTY3YmQyNGM2MmI0ZmNiZjqABJWVAAAAAAAAAH2UKIwDdXJslIwTL29yZGVyL2luZGVudF9wYWdlL5SMBGZsYWeUiIwMbG9naW5fc3RhdHVzlIiMCHVzZXJuYW1llIwLMTgzMjIwMTExMTGUjAt0b3RhbF9wcmljZZRLAIwFb3JkZXKUjAljYXJ0LmNhcnSUjARDYXJ0lJOUKYGUfZSMCmJvb2tfaXRlbXOUXZRzYnUu', '2020-03-18 12:25:52.873284');
INSERT INTO `django_session` VALUES ('wemr19rp0mg79gq13tpiyrw7xo83e319', 'N2M2ZGQzZjgyZjA0YTIyNDE4NWMyZjczMGVmOGEyNjFiYmFmNGNhOTqABJVTAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCzE4MzIyMDExMTExlHUu', '2020-03-18 11:49:05.922505');
INSERT INTO `django_session` VALUES ('wk3uv34ozc1l4b8rpsgvy5nk2qvfrqvw', 'YTQzNjRiZWQ0ZTNhMmU2NzM1YThmMTAzM2I5MzQwODYzMjY2ODEyNzqABJVgAAAAAAAAAH2UKIwDdXJslIwhL2RhbmdkYW5nL2RldGFpbHNfcGFnZS8/Ym9va19pZD0xlIwEZmxhZ5SIjAxsb2dpbl9zdGF0dXOUiIwIdXNlcm5hbWWUjAsxODMyMjAxMTExMZR1Lg==', '2020-03-18 11:48:03.810235');
INSERT INTO `django_session` VALUES ('y21u89qcqbisj7j5rk0oweh1z1cewdiw', 'MmNkNmMyMWJiNDc1OWYxOTA3MDc1ZjJmYTkyMWM5MDliNTg0YTE3ODqABJVzAAAAAAAAAH2UKIwDdXJslIwhL2RhbmdkYW5nL2RldGFpbHNfcGFnZS8/Ym9va19pZD0xlIwEZmxhZ5SIjAxsb2dpbl9zdGF0dXOUiIwIdXNlcm5hbWWUjAsxODMyMjAxMTExMZSMAmlklIwBMZSMBWxldmVslGgIdS4=', '2020-03-18 11:36:05.021712');
INSERT INTO `django_session` VALUES ('ypphgs2itskg6w4348hyqnis4jmv34qb', 'ZGE0OWFhNjk2NmQzYTEyMDFhODRmZWQ5ZWRkMDc0Zjc2MmE5M2MxNzqABJViAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMBGNvZGWUjAVpeTJ2cpSMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCzE4MzIyMDExMTExlHUu', '2020-03-18 11:35:08.300193');
INSERT INTO `django_session` VALUES ('zo79ndyba0xg0b7sm7tvbz8k4e212u6x', 'N2M2ZGQzZjgyZjA0YTIyNDE4NWMyZjczMGVmOGEyNjFiYmFmNGNhOTqABJVTAAAAAAAAAH2UKIwDdXJslIwUL2RhbmdkYW5nL2hvbWVfcGFnZS+UjARmbGFnlIiMDGxvZ2luX3N0YXR1c5SIjAh1c2VybmFtZZSMCzE4MzIyMDExMTExlHUu', '2020-03-18 12:13:21.522452');

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `consignee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (4, '呵呵哒', '中国北京市朝阳区', '300000', '13922231231', '', 14);
INSERT INTO `t_address` VALUES (5, '哈USD和', '中国天津市武清区', '300000', '13922231231', '', 14);

-- ----------------------------
-- Table structure for t_book_classification
-- ----------------------------
DROP TABLE IF EXISTS `t_book_classification`;
CREATE TABLE `t_book_classification`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `level` int(0) NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  `category_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_9`(`parent_id`) USING BTREE,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`parent_id`) REFERENCES `t_book_classification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book_classification
-- ----------------------------
INSERT INTO `t_book_classification` VALUES (1, 1, NULL, '教育');
INSERT INTO `t_book_classification` VALUES (2, 1, NULL, '电子书 /当当阅读器');
INSERT INTO `t_book_classification` VALUES (3, 1, NULL, '小说');
INSERT INTO `t_book_classification` VALUES (4, 1, NULL, '文艺');
INSERT INTO `t_book_classification` VALUES (5, 1, NULL, '青春文学 /动漫・幽默 ');
INSERT INTO `t_book_classification` VALUES (6, 1, NULL, '童书');
INSERT INTO `t_book_classification` VALUES (7, 1, NULL, '生活');
INSERT INTO `t_book_classification` VALUES (8, 1, NULL, '人文社科');
INSERT INTO `t_book_classification` VALUES (9, 1, NULL, '经营');
INSERT INTO `t_book_classification` VALUES (10, 1, NULL, '励志/成功');
INSERT INTO `t_book_classification` VALUES (11, 1, NULL, '科技');
INSERT INTO `t_book_classification` VALUES (12, 1, NULL, '英文原版书 港台图书');
INSERT INTO `t_book_classification` VALUES (13, 1, NULL, '当当出版');
INSERT INTO `t_book_classification` VALUES (14, 1, NULL, '期刊');
INSERT INTO `t_book_classification` VALUES (15, 1, NULL, '文化礼品/工艺品');
INSERT INTO `t_book_classification` VALUES (16, 2, 1, '教材');
INSERT INTO `t_book_classification` VALUES (17, 2, 1, '外语');
INSERT INTO `t_book_classification` VALUES (18, 2, 1, '考试');
INSERT INTO `t_book_classification` VALUES (19, 2, 1, '中小学教辅');
INSERT INTO `t_book_classification` VALUES (20, 2, 1, '工具书');
INSERT INTO `t_book_classification` VALUES (21, 2, 4, '文学');
INSERT INTO `t_book_classification` VALUES (22, 2, 4, '传记');
INSERT INTO `t_book_classification` VALUES (23, 2, 4, '艺术');
INSERT INTO `t_book_classification` VALUES (24, 2, 4, '摄影');
INSERT INTO `t_book_classification` VALUES (25, 2, 6, '0-2');
INSERT INTO `t_book_classification` VALUES (26, 2, 6, '3-6');
INSERT INTO `t_book_classification` VALUES (27, 2, 6, '7-10');
INSERT INTO `t_book_classification` VALUES (28, 2, 6, '11-14');
INSERT INTO `t_book_classification` VALUES (29, 2, 6, '科普/百科');
INSERT INTO `t_book_classification` VALUES (30, 2, 6, '绘本');
INSERT INTO `t_book_classification` VALUES (31, 2, 6, '文学');
INSERT INTO `t_book_classification` VALUES (32, 2, 6, '英语');
INSERT INTO `t_book_classification` VALUES (33, 2, 7, '孕期');
INSERT INTO `t_book_classification` VALUES (34, 2, 7, '两性');
INSERT INTO `t_book_classification` VALUES (35, 2, 7, '育儿/早教');
INSERT INTO `t_book_classification` VALUES (36, 2, 7, '亲子/家教');
INSERT INTO `t_book_classification` VALUES (37, 2, 7, '保健');
INSERT INTO `t_book_classification` VALUES (38, 2, 7, '运动');
INSERT INTO `t_book_classification` VALUES (39, 2, 7, '美妆');
INSERT INTO `t_book_classification` VALUES (40, 2, 7, '手工/DIY');
INSERT INTO `t_book_classification` VALUES (41, 2, 7, '美食');
INSERT INTO `t_book_classification` VALUES (42, 2, 7, '旅游');
INSERT INTO `t_book_classification` VALUES (43, 2, 7, '休闲');
INSERT INTO `t_book_classification` VALUES (44, 2, 7, '家庭/家居');
INSERT INTO `t_book_classification` VALUES (45, 2, 7, '风水/占卜');
INSERT INTO `t_book_classification` VALUES (46, 2, 8, '历史');
INSERT INTO `t_book_classification` VALUES (47, 2, 8, '古籍');
INSERT INTO `t_book_classification` VALUES (48, 2, 8, '哲学/宗教');
INSERT INTO `t_book_classification` VALUES (49, 2, 8, '文化');
INSERT INTO `t_book_classification` VALUES (50, 2, 8, '政治/军事');
INSERT INTO `t_book_classification` VALUES (51, 2, 8, '法律');
INSERT INTO `t_book_classification` VALUES (52, 2, 8, '社会科学');
INSERT INTO `t_book_classification` VALUES (53, 2, 8, '心理学');
INSERT INTO `t_book_classification` VALUES (54, 2, 9, '管理');
INSERT INTO `t_book_classification` VALUES (55, 2, 9, '理财投资');
INSERT INTO `t_book_classification` VALUES (56, 2, 9, '经济');
INSERT INTO `t_book_classification` VALUES (57, 2, 9, '音像');
INSERT INTO `t_book_classification` VALUES (58, 2, 11, '科普');
INSERT INTO `t_book_classification` VALUES (59, 2, 11, '建筑');
INSERT INTO `t_book_classification` VALUES (60, 2, 11, '医学');
INSERT INTO `t_book_classification` VALUES (61, 2, 11, '计算机');
INSERT INTO `t_book_classification` VALUES (62, 2, 11, '农林');
INSERT INTO `t_book_classification` VALUES (63, 2, 11, '自然科学');
INSERT INTO `t_book_classification` VALUES (64, 2, 11, '工业');

-- ----------------------------
-- Table structure for t_books
-- ----------------------------
DROP TABLE IF EXISTS `t_books`;
CREATE TABLE `t_books`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `category_id` int(0) NULL DEFAULT NULL COMMENT '分类id',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书名',
  `picture_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图一',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出版社',
  `publishing_time` datetime(0) NULL DEFAULT NULL COMMENT '出版时间',
  `commentnum` int(0) NULL DEFAULT NULL COMMENT '评论数',
  `dang_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '当当价',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '定价',
  `edition` int(0) NULL DEFAULT NULL COMMENT '版次',
  `pages` int(0) NULL DEFAULT NULL COMMENT '页数',
  `words` int(0) NULL DEFAULT NULL COMMENT '字数',
  `printing_time` datetime(0) NULL DEFAULT NULL COMMENT '印刷时间',
  `book_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开本',
  `paper_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '纸张',
  `Impression` int(0) NULL DEFAULT NULL COMMENT '印次',
  `packaging_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '包装',
  `is_set` int(0) NULL DEFAULT NULL COMMENT '是否套装',
  `ISBN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国际标准书号ISBN',
  `advertise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '宣传标题',
  `recommend` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '编辑推荐',
  `content_recommendation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容推荐',
  `about_author` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '作者简介',
  `catalogue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '目录',
  `media_reviews` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '媒体评论',
  `read_online` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '在线试读部分章节',
  `picture_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图二',
  `picture_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图三',
  `picture_four` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图四',
  `picture_five` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图五',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '上架时间',
  `sales` int(0) NULL DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_8`(`category_id`) USING BTREE,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`category_id`) REFERENCES `t_book_classification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_books
-- ----------------------------
INSERT INTO `t_books` VALUES (1, 16, '家常菜精选', 'images/9224823-1_l_3.jpg', '同济大学数学系', '高等教育出版社', '2014-07-24 20:13:08', 56777, 47.00, 47.60, 7, 200, 10000, '2014-08-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040396638', '同济大学经典教材，考研参考教材，40年畅销不衰', '高等数学课程包括微积分、微分方程、向量代数与空间解析几何、无穷级数等内容。从17世纪60年代牛顿、莱布尼茨创立微积分起，逐步形成了一门逻辑严密、系统完整的学科，它不仅成为其他许多数学分支的重要基础，而且在自然科学、工程技术、生命科学、社会科学、经济管理等众多领域都获得了十分广泛的应用。由同济大学数学教研室主编的《高等数学》于1978年出版，后根据各个时期的教学实际不断修订，至今已出第七版，几十年来畅销不衰，广受读者欢迎。它是全国使用面*广、影响*的一本高等数学教材，同时也是教育部考试中心研究生入学考试指定参考教材，第三版于1997年获普通高等学校*教学成果一等奖，曾被评为2008年度普通高等教育精品教材，在我国大学数学课程教学中发挥了重要的历史作用。《高等数学（第七版）》分上、下两册出版。上册以函数的知识作为过渡，以运动和变化的观点引出极限，再以极限研究函数的变化率，形成一元函数微分学；从面积问题引出定积分，并与微积分互为逆运算建立联系，形成微积分的基本定理，构成一元函数积分学。下册通过空间解析几何和向量代数，进一步把一元函数微积分学推广到多元函数微积分学上。此外，一元函数微积分学有两个重要应用：微分方程和无穷级数，分别在教材的上册和下册介绍。《高等数学（第七版）》入选“十二五”普通高等教育本科*规划教材，线上线下资源配套更加齐备，书后提供的数字课程网站，不仅包括知识讲解、典型例题视频、在线测试，还精选了美国微积分精粹作为阅读材料。同时，以《高等数学（第七版）》教材为蓝本，由同济大学一线教师倾力打造的MOOC课程正在中国大学MOOC（爱课程网站）上线。课程共分为四个部分，提供了微视频、在线测试和讨论区等类型丰富的多种教学内容。其中，高等数学（一）介绍了一元函数的极限、连续、导数和微分及其应用，高等数学（二）讲述了不定积分、定积分及其应用和常微分方程，这两部分与《高等数学》（上册）相对应；而高等数学（三）介绍了空间解析几何、多元函数微分学，高等数学（四）讲述了重积分、曲线曲面积分、无穷级数，这两部分与《高等数学》（下册）相配套。你可以通过在线课程随时随地学习，以更加立体的方式，更透彻地理解教材，掌握高等数学的精髓。期待和你一起相会在高等数学的世界！', '本书是同济大学数学系编的《高等数学》第七版，从整体上说与第六版没有大的变化，内容深广度符合“工科类本科数学基础课程教学基本要求”，适合高等院校工科类各专业学生使用。\r\n\r\n本次修订遵循“坚持改革、不断锤炼、打造精品”的要求，对第六版中个别概念的定义，少量定理、公式的证明及定理的假设条件作了一些重要修改；对全书的文字表达、记号的采用进行了仔细推敲；个别内容的安排作了一些调整，习题配置予以进一步充实、丰富，对少量习题作了更换。所有这些修订都是为了使本书更加完善，更好地满足教学需要。\r\n\r\n本书分上、下两册出版，上册包括函数与极限、导数与微分、微分中值定理与导数的应用、不定积分、定积分及其应用、微分方程等内容，书末还附有二阶和三阶行列式简介、基本初等函数的图形、几种常用的曲线、积分表、习题答案与提示。', '无', '前言\r\n第一章 函数与极限\r\n第一节 映射与函数\r\n第二节 数列的极限\r\n第三节 函数的极限\r\n第四节 无穷小与无穷大\r\n第五节 极限运算法则\r\n第六节 极限存在准则 两个重要极限\r\n第七节 无穷小的比较\r\n第八节 函数的连续性与间断点\r\n第九节 连续函数的运算与初等函数的连续性\r\n第十节 闭区间上连续函数的性质\r\n总习题一\r\n第二章 导数与微分', '无', '无', NULL, NULL, NULL, NULL, '2014-12-01 20:44:49', 56782);
INSERT INTO `t_books` VALUES (2, 17, '概率论与数理统计', 'images/9269536-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2008-10-01 20:44:49', 39617);
INSERT INTO `t_books` VALUES (3, 18, '名人传', 'images/20175470-1_l.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2014-06-11 20:44:49', 12312);
INSERT INTO `t_books` VALUES (4, 19, '福尔摩斯探案全集', 'images/20531088-1_l_4.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2015-07-22 20:44:49', 12343);
INSERT INTO `t_books` VALUES (5, 20, '三国演義', 'images/21015000-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-09-25 20:44:49', 34567);
INSERT INTO `t_books` VALUES (6, 1, '2666', 'images/22539560-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2020-02-02 20:44:49', 23455);
INSERT INTO `t_books` VALUES (7, 1, '概率论与数理统计', 'images/22854283-1_l.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2017-11-01 20:44:49', 42424);
INSERT INTO `t_books` VALUES (8, 16, '学会自己长大', 'images/22855492-1_l_3.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2017-10-01 20:44:49', 45664);
INSERT INTO `t_books` VALUES (9, 17, '哲人与先知', 'images/22860102-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-06-01 20:44:49', 12345);
INSERT INTO `t_books` VALUES (10, 2, '遇见未知的自己', 'images/22876893-1_l.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2018-09-01 20:44:49', 65434);
INSERT INTO `t_books` VALUES (11, 21, '我们仨', 'images/22880790-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-11-04 20:44:49', 98766);
INSERT INTO `t_books` VALUES (12, 22, '启蒙', 'images/22882241-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-06-20 20:44:49', 12356);
INSERT INTO `t_books` VALUES (13, 23, '走进奇妙的数学世界', 'images/22914275-1_l_5.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2020-01-22 20:44:49', 23412);
INSERT INTO `t_books` VALUES (14, 24, '从你的全世界路过', 'images/23353342-1_l.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-12-31 20:44:49', 45643);
INSERT INTO `t_books` VALUES (15, 4, '三国演义', 'images/23356962-1_l_19.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-05-22 20:44:49', 34523);
INSERT INTO `t_books` VALUES (16, 4, '大败局', 'images/23368526-1_l.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-07-25 20:44:49', 23454);
INSERT INTO `t_books` VALUES (17, 14, '摆渡人', 'images/23694647-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-08-25 20:44:49', 65453);
INSERT INTO `t_books` VALUES (18, 9, '畅销的原理', 'images/24144199-1_l_9.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-12-18 20:44:49', 23412);
INSERT INTO `t_books` VALUES (19, 9, '喜欢我也没关系', 'images/24156322-1_l_6.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2017-10-01 20:44:49', 23454);
INSERT INTO `t_books` VALUES (20, 6, '把你的英语用起来', 'images/1900494200-1_l_5.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2020-02-01 20:44:49', 65435);
INSERT INTO `t_books` VALUES (21, 7, '你的努力，', 'images/1900513383-1_l_3.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-03-21 20:44:49', 12343);
INSERT INTO `t_books` VALUES (22, 2, '自控力', 'images/1900537714-1_l_4.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-07-01 20:44:49', 12343);
INSERT INTO `t_books` VALUES (23, 14, '30岁后，我靠投资生活', 'images/1900542997-1_l_4.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-08-01 20:44:49', 64545);
INSERT INTO `t_books` VALUES (24, 7, '知更鸟女孩', 'images/1900560686-1_l_8.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-09-01 20:44:49', 23423);
INSERT INTO `t_books` VALUES (25, 10, 'Power up', 'images/1900589433-1_l_5.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-11-01 20:44:49', 12347);
INSERT INTO `t_books` VALUES (26, 24, '冕', 'images/24157752-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-05-18 20:44:49', 36575);
INSERT INTO `t_books` VALUES (27, 5, '亲爱的彼得温小姐', 'images/1900594623-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-01-24 20:44:49', 32465);
INSERT INTO `t_books` VALUES (28, 7, '寻找时间的灰度', 'images/1900600235-1_l_7.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-11-27 20:44:49', 43565);
INSERT INTO `t_books` VALUES (29, 3, '战争就是这么回事儿', 'images/1900625661-1_l_5.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-09-27 20:44:49', 23456);
INSERT INTO `t_books` VALUES (30, 10, '不完美才完美', 'images/1900625776-1_l_4.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-12-20 20:44:49', 23412);
INSERT INTO `t_books` VALUES (31, 22, '把...生活过程你想要的样子', 'images/1900626774-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-06-19 20:44:49', 65744);
INSERT INTO `t_books` VALUES (32, 9, '奇迹', 'images/1900631400-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-06-28 20:44:49', 11111);
INSERT INTO `t_books` VALUES (33, 14, '看脸', 'images/1900645272-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-08-19 20:44:49', 22222);
INSERT INTO `t_books` VALUES (34, 8, '卖产品就是“卖”自己', 'images/1900649210-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-04-17 20:44:49', 33333);
INSERT INTO `t_books` VALUES (35, 6, '觉得，汪是爱你', 'images/1900649350-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-04-20 20:44:49', 44444);
INSERT INTO `t_books` VALUES (36, 18, '不正常人类，症候群', 'images/1900649353-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-02-28 20:44:49', 55555);
INSERT INTO `t_books` VALUES (37, 20, '了不起的匠人', 'images/1900650062-1_l_1.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-03-28 20:44:49', 66666);
INSERT INTO `t_books` VALUES (38, 15, '时间的朋友', 'images/1900650094-1_l_3.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2019-07-01 20:44:49', 77777);
INSERT INTO `t_books` VALUES (39, 12, '巨婴国', 'images/1900646105-1_l_2.jpg', '浙江大学 盛骤 谢式千 潘承毅', '高等教育出版社', '2008-06-24 20:13:08', 39617, 45.00, 47.00, 4, 200, 10000, '2008-09-01 20:50:23', '16开', '胶版纸', 1, '平装-胶订', 0, '9787040238969', '经典教材，研究生入学考试必备', '1.内容覆盖全国硕士研究生入学统一考试数学考试大纲，研究生入学考试必备参考书。\r\n2.教材内容安排紧凑、讲述深入浅出、思路清晰，说理充分，简洁明了。\r\n3.在引入基本概念时注意揭示其直观背景和实际意义，在叙述概念和基本方法时注意阐明其概率和统计意义。\r\n4.例题和习题题型丰富。\r\n5.包括三章随机过程的内容可供信息工程等专业使用③我们在例题和习题的选配上作了努力，使得很多题目', '本书是普通高等教育“十一五”*规划教材,在2001年出版的《概率论与数理统计》(第三版)的基础上增订而成，本次修订新增的内容有:在数理统计中应用Excel, bootstrap方法,值检验法,箱线图等;同时吸收了国内外优秀教材的优点对习题的类型和数量进行了调整和充实。\r\n本书主要内容包括概率论数理统计*过程三部分,每章附有习题;同时涵盖了《全国硕士研究生入学统一考试数学考试大纲》的所有知识点。本书可作为高等学校工科、理科(非数学专业)各专业的教材和研究生入学考试的参考书,也可供工程技术人员、科技工作者参考。', '盛骤，浙江大学应用数学系教授，一直从事基础课教学，为工科类专业开设高等数学、工程数学、概率论与数理统计等课程；为力学专业开设数学分析、常微分方程、复变函数等课程；为外籍进修教师单独开设线性代数、张量分析等课程。编写了多种教材，从事可靠性数学的研究。曾参加航天部课题“武器系统可靠性综合评定方法”的工作，为其中分课题“成败型系统可靠性综合评定方法”的负责人；并是航空航天部部管课题“宇航产品贮存可靠性的评定方法”的负责人。', '前辅文\r\n第四版前言Ⅰ\r\n第三版前言Ⅰ\r\n第二版前言Ⅰ\r\n第一章 概率论的基本概念\r\n1 随机试验\r\n2 样本空间?随机事件\r\n3 频率与概率\r\n4 等可能概型(古典概型)\r\n5 条件概率\r\n6 独立性\r\n小结\r\n习题\r\n第二章 随机变量及其分布', '无', '无', NULL, NULL, NULL, NULL, '2020-02-25 20:44:49', 88888);
INSERT INTO `t_books` VALUES (40, 6, '中国诗词名篇名句赏', 'images/28507555-1_l_3.jpg', '李定广', '华文出版社', '2020-01-24 20:13:08', 258, 82.20, 84.00, 1, 200, 10000, '2020-02-01 20:50:23', '16开', '纯纸质', 1, '平装-胶订', 1, '9787507552447', '【2020年全新版本】《中国诗词大会》通关宝典，囊括《中国诗词大会》*季第二季第三季第四季第五季命题范围内的经典诗词五百余首 阅读是心灵的花园，更多文学每满100减50>>', '1.中央广播电视总台热播节目《中国诗词大会》学术总负责人、命题专家组组长李定广教授倾情奉献给诗词大赛参赛选手、大中小学生和诗词爱好者暖心、贴心的诚意之作。\r\n\r\n2.本书收录的诗词不限于《中国诗词大会》已播，还包括未播和即播，同时对常考的名句标红突出，并对《中国诗词大会》已播四季中诗词使用的频次做了统计。在文末有名句索引，易于查找，方便备赛选手和读者参考。\r\n\r\n3.为加深读者印象，每首诗词*后均留下适当方格以便摹写诗词名句。                     \r\n\r\n4.作者注意将自己的研究心得与*学术前沿成果相结合，学术性、前瞻性和指导性兼容。在有限的赏析文字中，道尽了古诗词的文化意蕴和蕴含其中的诗美、哲理，世情、人情，深入浅出，言简意赅，味之不尽。', '本书分上下两册，共收录诗词500余首。由《中国诗词大会》学术总负责人、命题专家组组长李定广教授编选、评注、赏析，所选诗词基本覆盖《中国诗词大会》*季、第二季、第三季、第四季、第五季的命题范围，以及备选但实际未播出的诗词若干首。作者吸收了*的学术研究成果，确保注释准确无误，赏析深入浅出，活泼平易，引导读者进入诗意的美的殿堂。本书旨在向社会提供一种权威、可靠的诗词读本，适合中学生、大学生以及不同层次的广大诗词爱好者阅读。', '李定广，著名文史学者、复旦大学文学博士、教授、博士生导师。上海师范大学中国语言文学创新团队成员。《中国诗词大会》第一、二、三、四、五季学术总负责人、命题专家组组长。《经典咏流传》首席文学顾问。创办并主编国际学术刊物《中华诗学》中文版和英文版。《学术界》杂志2016年第8期封面人物。主要研究方向为唐宋诗词，已出版学术专著多部，在重要学术刊物发表高质量的学术论文数篇。', '上册\r\n锦　瑟?/ 46\r\n严恽\r\n落　花?/ 49\r\n李频\r\n春日思归?/ 50\r\n黄巢\r\n题菊花?/ 51\r\n不第后赋菊?/ 52\r\n陆龟蒙\r\n别　离?/ 53\r\n新　沙?/ 54\r\n浮　萍?/ 55\r\n曹松', '无', '精彩段落：\r\n锦　瑟①\r\n锦瑟无端五十弦，一弦一柱思华年。②\r\n庄生晓梦迷蝴蝶，望帝春心托杜鹃。③\r\n沧海月明珠有泪，蓝田日暖玉生烟。④\r\n此情可待成追忆，只是当时已惘然。⑤\r\n（第一季4 次，第二季1 次，第三季2 次，第四季4 次）\r\n\r\n① 锦瑟：装饰华美的瑟。瑟，拨弦乐器，自先秦以来现实中的瑟一般二十五根弦。李商隐妻王氏生前爱弹锦瑟，李商隐悼亡诗《房中曲》：“归来已不见，锦瑟长于人。”\r\n② 无端：没来由。五十弦 ：传说神女所鼓之瑟是五十弦，后以“五十弦”代替瑟的名称。作者的意思是说锦瑟实际是二十五弦啊，为何要称“五十弦”呢？柱：瑟上撑弦的三角形可移动小木块，可移动以调节音高，一弦配一柱。华年：青春之年。\r\n③ “庄生”两句：意思是说，庄周早晨做梦陶醉于变成蝴蝶的快乐，但太短暂；望帝在春天通过杜鹃的叫声表达悲伤的心情，但为时已晚。《庄子·齐物论》：“庄周梦为胡蝶，栩栩然胡蝶也；自喻适志与！不知周也。俄然觉，则蘧蘧然周也。不知周之梦为胡蝶与？胡蝶之梦为周与？”春心：指男女之间相思之情。相传蜀帝杜宇，号望帝，让位于有功的大臣，死后其魂化为子规，即杜鹃，暮春啼叫，叫声悲怨，口中带血。《华阳国志·蜀志》：“杜宇称帝，号曰望帝。……其相开明，决玉垒山以除水害，帝遂委以政事，法尧舜禅授之义，遂禅位于开明。帝升西山隐焉。时适二月，子鹃鸟鸣，故蜀人悲子鹃鸟鸣也。”子鹃即杜鹃。', NULL, NULL, NULL, NULL, '2019-12-25 20:44:49', 258);
INSERT INTO `t_books` VALUES (41, 16, '我与世界只差一个你', 'images/23668351-1_l_4.jpg', '张皓宸', '天津人民出版社', '2015-04-08 19:34:05', 163281, 21.00, 36.00, 1, 320, 15000, '2015-05-25 19:35:05', '16开', '胶版纸', 2, '平装-胶订', 0, '9787507552447', '（一个App人气冠军张皓宸全新个人故事集，温馨治愈的情感故事，让你在面对爱时无惧，怀疑爱时坚定。随书附赠张皓宸私密手写寄语明信片）', '1、「一个」app人气冠军，90后实力写作者，继年度畅销书《你是**的自己》后，张皓宸全新力作，带来温暖人心的个人故事集。12个温馨治愈的情感故事，给年轻人爱的正能量和信心。电影版权火热接洽中，不久的将来你将会在大屏幕上再次与这些故事相逢。 2、张皓宸的文字，在微博、豆瓣、人人等文艺平台广受欢迎，百万微博粉丝，他的文字被阅读过100，000，000次，在微博被累计转发1，000，000次，在「一个」app上被分享收藏超过2，000，000次，他的作品被人民日报、人民网微博多次转载，成为90后作家中的励志榜样，给无数年轻人带去力量。 3、韩寒监制并微博推荐，「一个」工作室开年力作，重磅主打 。 4、这本书可以送给自己，亦可作为礼物，送给你在乎的人，有了ta，世界才完整。随书附赠张皓宸私密手写寄语明信片。 5、内文插画元素由张皓宸亲自手绘，摄影图由「一个」app众多优秀首页图作者提供，装帧设计由「一个」工作室王牌设计师陆骏璇倾情打造。', '无', '无', '无', '无', '无', NULL, NULL, NULL, NULL, '2019-01-26 19:37:49', 42353);
INSERT INTO `t_books` VALUES (42, 16, '我只想一个人住在你心里（当当专享作者亲笔签章版）孟瑞新书', 'images/24168704-1_l_2.jpg', '孟瑞', '北京联合出版公司', '2017-07-01 19:34:05', 41, 31.10, 45.00, 1, 320, 15000, '2015-05-25 19:35:05', '16开', '胶版纸', 2, '平装-胶订', 0, '9787507552447', '孟瑞首部青春成长暖伤图文故事集，记录那些走过的青春，爱的人，追的梦，未走完的路和苍茫人世寻觅心安抚慰的你我！赵丽颖、程青松、胡海', '签章版释义：作者亲自签的名  再刻成的章，然后盖到书的扉页上。 赵丽颖、程青松、胡海泉、谢佳勋、吉克隽逸 温暖推荐             ★孟瑞，明星、新生代偶像、爆红网剧《 不可抗力爱上你》主角微博粉丝100万加。青春温暖的偶像派和才华明星实力担当。★孟瑞青春成长暖伤故事，记录那些走', '无', '无', '无', '无', '无', NULL, NULL, NULL, NULL, '2019-01-26 19:37:49', 42313);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `generated_time` datetime(0) NULL DEFAULT NULL,
  `total_price` decimal(10, 2) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `address_id` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_4`(`user_id`) USING BTREE,
  INDEX `FK_Reference_5`(`address_id`) USING BTREE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`address_id`) REFERENCES `t_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (9, 'V202003041928371912782', '2020-03-04 11:28:37', 225.00, 14, 4, 1);
INSERT INTO `t_order` VALUES (10, 'W202003050006013593006', '2020-03-04 16:06:01', 225.00, 14, 4, 1);
INSERT INTO `t_order` VALUES (11, 'D202003050945511117503', '2020-03-05 01:45:51', 180.00, 14, 4, 1);
INSERT INTO `t_order` VALUES (12, 'S202003051641187111104', '2020-03-05 08:41:19', 45.00, 14, 5, 0);
INSERT INTO `t_order` VALUES (13, 'J202003051746053290794', '2020-03-05 09:46:05', 90.00, 14, 4, 0);

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `book_id` int(0) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `books_number` int(0) NULL DEFAULT NULL,
  `order_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_6`(`order_id`) USING BTREE,
  INDEX `FK_Reference_7`(`book_id`) USING BTREE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`book_id`) REFERENCES `t_books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES (15, 39, 45.00, 3, 9);
INSERT INTO `t_order_detail` VALUES (16, 8, 45.00, 1, 9);
INSERT INTO `t_order_detail` VALUES (17, 14, 45.00, 1, 9);
INSERT INTO `t_order_detail` VALUES (18, 8, 45.00, 1, 10);
INSERT INTO `t_order_detail` VALUES (19, 39, 45.00, 3, 10);
INSERT INTO `t_order_detail` VALUES (20, 6, 45.00, 1, 10);
INSERT INTO `t_order_detail` VALUES (21, 39, 45.00, 4, 11);
INSERT INTO `t_order_detail` VALUES (22, 39, 45.00, 1, 12);
INSERT INTO `t_order_detail` VALUES (23, 8, 45.00, 1, 13);
INSERT INTO `t_order_detail` VALUES (24, 37, 45.00, 1, 13);

-- ----------------------------
-- Table structure for t_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_shopping_cart`;
CREATE TABLE `t_shopping_cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `quantity` int(0) NULL DEFAULT NULL,
  `book_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_2`(`user_id`) USING BTREE,
  INDEX `FK_Reference_3`(`book_id`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`book_id`) REFERENCES `t_books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (14, '123@qq.com', NULL, '601f1889667efaebb33b8c12572835da3f027f78e750d9fb52d4f8b2813d908d9209d63e', 'e750d9fb52d4f8b2813d908d9209d63e', 1);
INSERT INTO `t_user` VALUES (15, NULL, '18322011111', '601f1889667efaebb33b8c12572835da3f027f782c7a21e152973f4eb5a7393338454add', '2c7a21e152973f4eb5a7393338454add', 1);
INSERT INTO `t_user` VALUES (16, 'qwer@qq.com', NULL, '601f1889667efaebb33b8c12572835da3f027f78a789966767bc6dde5aa0651e1e6982cf', 'a789966767bc6dde5aa0651e1e6982cf', 1);
INSERT INTO `t_user` VALUES (17, 'qwert@qq.com', NULL, '601f1889667efaebb33b8c12572835da3f027f78a6b75e4d175cd81e0f2fbc358777f6b7', 'a6b75e4d175cd81e0f2fbc358777f6b7', 1);
INSERT INTO `t_user` VALUES (18, 'sdfasd@qq.com', NULL, '601f1889667efaebb33b8c12572835da3f027f7803feb7365b40a990c497901024a5d9b5', '03feb7365b40a990c497901024a5d9b5', 1);
INSERT INTO `t_user` VALUES (19, 'qweasd@qq.com', NULL, '601f1889667efaebb33b8c12572835da3f027f78704f94e08d146d1476282e6f93639bf8', '704f94e08d146d1476282e6f93639bf8', 1);

SET FOREIGN_KEY_CHECKS = 1;
