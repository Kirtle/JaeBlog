/*

Source Host           : localhost:3306
Source Database       : jaeblog

Date: 2017-05-11 11:02:13
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `article` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `sys_category_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `summary` mediumtext NOT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_top` bit(1) NOT NULL DEFAULT b'0',
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`articleid`),
  KEY `fk_artical` (`user_id`),
  KEY `fk_scategory` (`sys_category_id`),
  KEY `fc_category` (`category_id`),
  CONSTRAINT `fc_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_artical` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_scategory` FOREIGN KEY (`sys_category_id`) REFERENCES `sys_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `category_name` varchar(64) NOT NULL DEFAULT '0',
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_category` (`user_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `article_id` int(11) NOT NULL DEFAULT '0',
  `content` LONGTEXT NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_comment1` (`user_id`),
  KEY `fk_comment2` (`article_id`),
  CONSTRAINT `fk_comment1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_comment2` FOREIGN KEY (`article_id`) REFERENCES `article` (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE `sys_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL DEFAULT '0',
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '0',
  `userpwd` varchar(64) NOT NULL DEFAULT '0',
  `userpermission` int(1) NOT NULL DEFAULT '1',
  `userregdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_user` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `user` 
ADD UNIQUE INDEX `username_UNIQUE` (`username` ASC);

INSERT INTO `user`(id,username,userpwd,userpermission) VALUES ('1', 'Jae', 'jae597982968', '0');
insert into category values("1","1","category_name","0");

DROP VIEW IF EXISTS `ucomment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ucomment` 
AS select `c`.`id` AS `cid`,
`c`.`user_id` AS `cuid`,
`c`.`article_id` AS `article_id`,
`c`.`content` AS `ccontent`,
`c`.`time` AS `ctime`,
`c`.`is_delete` AS `cdelete`,
`u`.`id` AS `uid`,
`u`.`username` AS `username`,
`u`.`userpwd` AS `userpwd`,
`u`.`userpermission` AS `userpermission`,
`u`.`userregdate` AS `userregdate`,
`a`.`id` AS `aid`,
`a`.`title` AS `title`,
`a`.`user_id` AS `user_id`,
`a`.`sys_category_id` AS `sys_category_id`,
`a`.`category_id` AS `category_id`,
`a`.`content` AS `acontent`,
`a`.`summary` AS `summary`,
`a`.`publish_time` AS `atime`,
`a`.`is_top` AS `is_top`,
`a`.`is_delete` AS `is_delete` 
from ((`comment` `c` join `user` `u`) join `article` `a`) 
where ((`c`.`is_delete` = 0) and (`u`.`id` = `c`.`user_id`) and (`a`.`id` = `c`.`article_id`));


INSERT INTO `sys_category`(id,category_name,is_delete) VALUES ('1', 'HTML/CSS', '');
INSERT INTO `sys_category` VALUES ('2', 'Spring框架',  '');
INSERT INTO `sys_category` VALUES ('3', 'MyBatis', '');
INSERT INTO `sys_category` VALUES ('4', 'MVC设计模式', '');
INSERT INTO `sys_category` VALUES ('5', '前端框架', '');
INSERT INTO `sys_category` VALUES ('6', '其他', '');






INSERT INTO `article` VALUES ('1', '第一篇文章', '1', '1', '1', '这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用', '这是第一篇文章。。。XXX', '2013-10-23 15:57:07', '', '', '24');
INSERT INTO `article` VALUES ('2', '第一篇文章', '2', '1', '1', '这是第一篇文章的内容，测试使用', '这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。', '2013-10-23 15:57:34', '', '', '6');
INSERT INTO `article` VALUES ('3', '第一篇文章', '2', '1', '1', '这是第一篇文章的内容，测试使用', '这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。', '2013-10-23 15:57:47', '', '', '3');
INSERT INTO `article` VALUES ('4', '第一篇文章', '2', '1', '1', '这是第一篇文章的内容，测试使用', '这是第3篇文章。。。', '2013-10-23 15:57:48', '', '', '1');
INSERT INTO `article` VALUES ('5', '第一篇文章', '2', '1', '1', '这是第一篇文章的内容，测试使用', '这是第4篇文章。。。', '2013-10-23 15:57:49', '', '', '4');
INSERT INTO `article` VALUES ('6', '第一篇文章', '2', '1', '1', '这是第一篇文章的内容，测试使用', '这是第5篇文章。。。', '2013-10-23 15:57:50', '', '', '2');
INSERT INTO `article` VALUES ('7', '第一篇文章', '2', '1', '1', '这是第一篇文章的内容，测试使用', '这是第6篇文章。。。', '2013-10-23 15:57:51', '', '', '15');
INSERT INTO `article` VALUES ('8', '第一篇文章', '2', '1', '1', '这是第一篇文章的内容，测试使用', '这是第7篇文章。。。', '2013-10-23 15:57:52', '', '', '57');
INSERT INTO `article` VALUES ('9', '2013年10月26日晚', '2', '2', '6', '2013年10月26日晚', '2013年10月26日晚', '2013-10-26 23:37:54', '', '', '7');
INSERT INTO `article` VALUES ('10', '2013年10月27日早', '2', '1', '12', '2013年10月27日早 - 继续写Jsp blog', '2013年10月27日早', '2013-10-28 20:00:04', '', '', '1');
INSERT INTO `article` VALUES ('11', '2013年10月27日早 - 2', '2', '1', '5', '2013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 2', '2013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 2', '2013-10-27 12:45:41', '', '', '24');
INSERT INTO `article` VALUES ('12', '2013年10月27日早 - 20', '1', '1', '2', '2013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 3', '2013年10月27日早 - 32013年10月27日早 - 3', '2013-10-28 15:21:19', '', '', '28');
INSERT INTO `article` VALUES ('13', 'ra叔', '2', '1', '4', 'ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔', 'ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔', '2013-10-28 09:28:37', '', '', '4');
INSERT INTO `article` VALUES ('14', '管理写的好烦', '1', '1', '3', '管理写的好烦管理写的好烦', '管理写的好烦管理写的好烦', '2013-10-28 16:03:17', '', '', '9');
INSERT INTO `article` VALUES ('15', '23', '2', '2', '12', '段落1\r\n段落2\r\n  段落3\r\n段落4', '123', '2013-10-28 21:00:09', '', '', '9');
INSERT INTO `article` VALUES ('16', '博客做的差不多了，还有几个功能点需要实现', '2', '2', '12', '今天29号了，还有几天就走了。项目也快做好了，又要工作了。SB学校不解释，WC', '今天29号了，还有几天就走了。项目也快做好了，又要工作了。', '2013-10-29 15:10:52', '', '', '5');
INSERT INTO `article` VALUES ('17', '这是chuan的文章', '5', '2', '14', '这是chuan的文章的摘要内容', '这是chuan的文章的摘要', '2013-10-30 12:20:16', '', '', '1');
INSERT INTO `article` VALUES ('18', '嵌入式实时OS', '1', '1', '8', '实时线程操作系统内部采用面向对象的方式设计，内建内核对象管理系统，能够访问/管理所有内核对象。内核对象包含了内核中绝大部分设施，而这些内核对象可 以是静态分配的静态对象，也可以是从系统内存堆中分配的动态对象。通过内核对象系统，RT-Thread可以做到不依赖于具体的内存分配方式，伸缩性得到 极大的加强。', '实时线程操作系统内部采用面向对象的方式设计，内建内核对象管理系统，能够访问/管理所有内核对象。内核对象包含了内核中绝大部分设施，而这些内核对象可 以是静态分配的静态对象，也可以是从系统内存堆中分配的动态对象。', '2013-11-02 14:57:35', '', '', '3');


CREATE TABLE `blog_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `blog_name` varchar(128) NOT NULL DEFAULT '0',
  `description` text,
  `annoucement` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_bloginfo` (`user_id`),
  CONSTRAINT `fk_bloginfo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


INSERT INTO `blog_info` VALUES ('7', '1', '博客名称', '博客描述', '这是我的个人技术博客。欢迎光临！xxx');
INSERT INTO `blog_info` VALUES ('8', '2', '宦传建', '这是我的个人技术博客', '这是我的个人技术博客');
INSERT INTO `blog_info` VALUES ('9', '3', '云风的Blog', '—— 思绪来的快，走的也快。偶尔在这里停留', '近期由于事务繁忙，博客不能及时更新。希望各位读者不要见谅哈');
INSERT INTO `blog_info` VALUES ('12', '4', '专注于Linux x86_64平台的高性能web服务器', '—— 思绪来的快，走的也快。偶尔在这里停留', '专注于Linux x86_64平台的高性能web服务器');
INSERT INTO `blog_info` VALUES ('13', '5', 'chuan的个人博客', '这是我的技术博客', '最近要休假了');



DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `counter` VALUES ('1', '111');