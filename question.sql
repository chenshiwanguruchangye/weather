/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50520
 Source Host           : localhost:3306
 Source Schema         : question

 Target Server Type    : MySQL
 Target Server Version : 50520
 File Encoding         : 65001

 Date: 17/07/2018 16:43:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `tid` int(4) NOT NULL,
  `Q` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `A` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `B` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `C` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `D` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '1+1=？', '1', '2', '3', '4', 'B');
INSERT INTO `question` VALUES (2, '1+2=？', '2', '2', '3', '4', 'C');
INSERT INTO `question` VALUES (3, '1+3=？', '4', '3', '2', '1', 'A');
INSERT INTO `question` VALUES (4, '1+4=？', '8', '7', '6', '5', 'D');
INSERT INTO `question` VALUES (5, '1+5=？', '6', '7', '8', '9', 'A');
INSERT INTO `question` VALUES (6, '1+6=？', '10', '9', '8', '7', 'D');
INSERT INTO `question` VALUES (7, '1+7=？', '7', '8', '9', '10', 'B');
INSERT INTO `question` VALUES (8, '1+8=？', '9', '8', '7', '6', 'A');
INSERT INTO `question` VALUES (9, '1+9=？', '12', '11', '10', '9', 'C');
INSERT INTO `question` VALUES (10, '2+2=？', '2', '4', '6', '8', 'B');
INSERT INTO `question` VALUES (11, '3+3=？', '5', '3', '6', '9', 'C');
INSERT INTO `question` VALUES (12, '4+4=？', '6', '8', '10', '7', 'B');
INSERT INTO `question` VALUES (13, '5+5=？', '11', '10', '9', '8', 'B');
INSERT INTO `question` VALUES (14, '6+6=？', '9', '10', '11', '12', 'D');
INSERT INTO `question` VALUES (15, '7+7=？', '12', '13', '14', '15', 'C');
INSERT INTO `question` VALUES (16, '8+8=？', '16', '18', '19', '17', 'A');
INSERT INTO `question` VALUES (17, '9+9=？', '19', '17', '18', '20', 'C');
INSERT INTO `question` VALUES (18, '10-1=？', '0', '1', '9', '10', 'C');
INSERT INTO `question` VALUES (19, '2-1=？', '1', '2', '0', '21', 'A');
INSERT INTO `question` VALUES (20, '1-1=？', '0', '1', '2', '10', 'A');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('100', '1000');
INSERT INTO `score` VALUES ('100', '1000');

SET FOREIGN_KEY_CHECKS = 1;
