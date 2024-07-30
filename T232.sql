/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t232`;
CREATE DATABASE IF NOT EXISTS `t232` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t232`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-04-16 12:52:49'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-04-16 12:52:49'),
	(3, 'gonggao_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-04-16 12:52:49'),
	(4, 'gonggao_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-04-16 12:52:49'),
	(5, 'examquestion_types', '试题类型', 1, '单选题', NULL, NULL, '2022-04-16 12:52:49'),
	(6, 'examquestion_types', '试题类型', 2, '多选题', NULL, NULL, '2022-04-16 12:52:49'),
	(7, 'examquestion_types', '试题类型', 3, '判断题', NULL, NULL, '2022-04-16 12:52:49'),
	(8, 'examquestion_types', '试题类型', 4, '填空题', NULL, NULL, '2022-04-16 12:52:49'),
	(9, 'exampaper_types', '试卷状态', 1, '启用', NULL, NULL, '2022-04-16 12:52:49'),
	(10, 'exampaper_types', '试卷状态', 2, '禁用', NULL, NULL, '2022-04-16 12:52:49'),
	(11, 'gonggao_types', '公告类型', 3, '公告类型3', NULL, '', '2022-04-16 13:12:00');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int NOT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `exampaper_types` int NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `exampaper_delete` int DEFAULT '0' COMMENT '逻辑删除（0代表未删除 1代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `exampaper_name`, `exampaper_date`, `exampaper_myscore`, `exampaper_types`, `exampaper_delete`, `create_time`) VALUES
	(1, '考试试卷1', 100, 100, 1, 1, '2022-04-16 12:52:49'),
	(2, '试卷2', 100, 62, 1, 1, '2022-04-16 13:12:22');

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int NOT NULL COMMENT '所属试卷id（外键）',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_score` int DEFAULT '0' COMMENT '分值 Search111',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `exampaper_id`, `examquestion_name`, `examquestion_options`, `examquestion_score`, `examquestion_answer`, `examquestion_analysis`, `examquestion_types`, `examquestion_sequence`, `create_time`) VALUES
	(1, 1, '单选题1', '[{"text":"答案A","code":"A"},{"text":"答案B","code":"B"},{"text":"正确答案C","code":"C"},{"text":"答案D","code":"D"}]', 10, 'C', '无', 1, 1, '2022-04-16 12:52:49'),
	(2, 1, '多选题1', '[{"text":"答案A","code":"A"},{"text":"正确答案B","code":"B"},{"text":"正确答案C","code":"C"},{"text":"答案D","code":"D"}]', 34, 'B,C', '无', 2, 2, '2022-04-16 12:52:49'),
	(3, 1, '填空题(正)_____', '[]', 41, '正', '无', 4, 3, '2022-04-16 12:52:49'),
	(4, 1, '判断题1', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 11, 'A', '无', 3, 4, '2022-04-16 12:52:49'),
	(5, 1, '单选题2', '[{"text":"答案A","code":"A"},{"text":"正确答案B","code":"B"},{"text":"答案C","code":"C"},{"text":"答案D","code":"D"}]', 4, 'B', '无', 1, 5, '2022-04-16 12:52:49'),
	(6, 2, '试题2的试题1', '[{"text":"A","code":"A"},{"text":"B","code":"B"},{"text":"C","code":"C"},{"text":"正确D","code":"D"}]', 12, 'D', '无', 1, 2, '2022-04-16 13:13:14'),
	(7, 2, '试卷2的试题2', '[{"text":"A","code":"A"},{"text":"正确B","code":"B"},{"text":"C","code":"C"},{"text":"正确D","code":"D"}]', 20, 'B,D', '五十多个', 2, 3, '2022-04-16 13:14:09'),
	(8, 2, '试卷2的试题3', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 30, 'A', '违规', 3, 54, '2022-04-16 13:14:33');

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int NOT NULL COMMENT '考试用户',
  `exampaper_id` int NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `examrecord_uuid_number`, `yonghu_id`, `exampaper_id`, `total_score`, `insert_time`, `create_time`) VALUES
	(1, '1650114632287', 1, 1, 38, '2022-04-16 13:10:32', '2022-04-16 13:10:32'),
	(2, '1718957777104', 1, 2, 30, '2024-06-21 08:16:17', '2024-06-21 08:16:17');

DROP TABLE IF EXISTS `examredetails`;
CREATE TABLE IF NOT EXISTS `examredetails` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int NOT NULL COMMENT '用户id',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='答题详情表';

DELETE FROM `examredetails`;
INSERT INTO `examredetails` (`id`, `examredetails_uuid_number`, `yonghu_id`, `examquestion_id`, `examredetails_myanswer`, `examredetails_myscore`, `create_time`) VALUES
	(1, '1650114632287', 1, 5, 'B', 4, '2022-04-16 13:10:36'),
	(2, '1650114632287', 1, 4, 'B', 0, '2022-04-16 13:10:38'),
	(3, '1650114632287', 1, 3, 'sgggh', 0, '2022-04-16 13:10:41'),
	(4, '1650114632287', 1, 2, 'B,C', 34, '2022-04-16 13:10:44'),
	(5, '1650114632287', 1, 1, 'B', 0, '2022-04-16 13:10:47'),
	(6, '1718957777104', 1, 8, 'A', 30, '2024-06-21 08:16:19'),
	(7, '1718957777104', 1, 7, 'A', 0, '2024-06-21 08:16:21'),
	(8, '1718957777104', 1, 6, 'A', 0, '2024-06-21 08:16:24');

DROP TABLE IF EXISTS `examrewrongquestion`;
CREATE TABLE IF NOT EXISTS `examrewrongquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int NOT NULL COMMENT '用户id',
  `exampaper_id` int NOT NULL COMMENT '试卷（外键）',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生作答',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='错题表';

DELETE FROM `examrewrongquestion`;
INSERT INTO `examrewrongquestion` (`id`, `yonghu_id`, `exampaper_id`, `examquestion_id`, `examredetails_myanswer`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 4, 'B', '2022-04-16 13:10:38', '2022-04-16 13:10:38'),
	(2, 1, 1, 3, 'sgggh', '2022-04-16 13:10:41', '2022-04-16 13:10:41'),
	(3, 1, 1, 1, 'B', '2022-04-16 13:10:47', '2022-04-16 13:10:47'),
	(4, 1, 2, 7, 'A', '2024-06-21 08:16:21', '2024-06-21 08:16:21'),
	(5, 1, 2, 6, 'A', '2024-06-21 08:16:24', '2024-06-21 08:16:24');

DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE IF NOT EXISTS `gonggao` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int NOT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告发布时间 ',
  `gonggao_content` text COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='公告';

DELETE FROM `gonggao`;
INSERT INTO `gonggao` (`id`, `gonggao_name`, `gonggao_photo`, `gonggao_types`, `insert_time`, `gonggao_content`, `create_time`) VALUES
	(1, '公告名称1', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao1.jpg', 1, '2022-04-16 12:52:53', '公告详情1', '2022-04-16 12:52:53'),
	(2, '公告名称2', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao2.jpg', 2, '2022-04-16 12:52:53', '公告详情2', '2022-04-16 12:52:53'),
	(3, '公告名称3', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao3.jpg', 1, '2022-04-16 12:52:53', '公告详情3', '2022-04-16 12:52:53'),
	(4, '公告名称4', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao4.jpg', 2, '2022-04-16 12:52:53', '公告详情4', '2022-04-16 12:52:53'),
	(5, '公告名称5', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao5.jpg', 2, '2022-04-16 12:52:53', '公告详情5', '2022-04-16 12:52:53'),
	(6, '公告11', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/1650114968178.jpg', 1, '2022-04-16 13:16:11', '<p>高公公1111</p>', '2022-04-16 13:16:11');

DROP TABLE IF EXISTS `laoshi`;
CREATE TABLE IF NOT EXISTS `laoshi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `laoshi_name` varchar(200) DEFAULT NULL COMMENT '老师姓名 Search111 ',
  `laoshi_phone` varchar(200) DEFAULT NULL COMMENT '老师手机号',
  `laoshi_id_number` varchar(200) DEFAULT NULL COMMENT '老师身份证号',
  `laoshi_photo` varchar(200) DEFAULT NULL COMMENT '老师头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `laoshi_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='老师';

DELETE FROM `laoshi`;
INSERT INTO `laoshi` (`id`, `username`, `password`, `laoshi_name`, `laoshi_phone`, `laoshi_id_number`, `laoshi_photo`, `sex_types`, `laoshi_email`, `create_time`) VALUES
	(1, '老师1', '123456', '老师姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/laoshi1.jpg', 2, '1@qq.com', '2022-04-16 12:52:53'),
	(2, '老师2', '123456', '老师姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/laoshi2.jpg', 2, '2@qq.com', '2022-04-16 12:52:53'),
	(3, '老师3', '123456', '老师姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/laoshi3.jpg', 2, '3@qq.com', '2022-04-16 12:52:53');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', 'lbtpja70hmwlpf2sl3nfyt3e4vcbutd8', '2022-04-16 12:52:28', '2024-06-21 09:14:47'),
	(2, 1, 'a1', 'yonghu', '用户', 'oqvs7zydtkpiyy5o67bznfzwjdipmzj0', '2022-04-16 13:09:27', '2024-06-21 09:16:08'),
	(3, 1, 'a1', 'laoshi', '老师', 'opctw33vnpul0nagbnvfsv2swnycemch', '2022-04-16 13:15:51', '2024-06-21 09:15:53');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_phone`, `yonghu_id_number`, `yonghu_photo`, `sex_types`, `yonghu_email`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/yonghu1.jpg', 1, '1@qq.com', '2022-04-16 12:52:53'),
	(2, '用户2', '123456', '用户姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/yonghu2.jpg', 2, '2@qq.com', '2022-04-16 12:52:53'),
	(3, '用户3', '123456', '用户姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/zaixianyuanchengkaoshixitong/upload/yonghu3.jpg', 1, '3@qq.com', '2022-04-16 12:52:53');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
