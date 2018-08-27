# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Database: blog
# Generation Time: 2018-08-27 08:09:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) DEFAULT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `vip_lv` int(11) DEFAULT '0' COMMENT 'vip等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email_validate_token`, `email`, `role`, `status`, `avatar`, `vip_lv`, `created_at`, `updated_at`)
VALUES
	(560,'admin','cdYdiixIjqUwfuASVM0JS8oGPn94IeIn','$2y$13$gN10Cko7DrhJHmKF5T4LO.uzXY55taL/pOA3sPCgNb/P2dEHrMiIi',NULL,NULL,'test@test.com',10,10,NULL,0,1534842962,1534842962);

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cats`;

CREATE TABLE `cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cat_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

LOCK TABLES `cats` WRITE;
/*!40000 ALTER TABLE `cats` DISABLE KEYS */;

INSERT INTO `cats` (`id`, `cat_name`)
VALUES
	(1,'分类一'),
	(2,'分类二');

/*!40000 ALTER TABLE `cats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feeds`;

CREATE TABLE `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天信息表';

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;

INSERT INTO `feeds` (`id`, `user_id`, `content`, `created_at`)
VALUES
	(1,560,'2222',0),
	(2,560,'我的第一条留言',1535139243),
	(3,560,'哈哈哈',1535139248),
	(4,560,'呃呃呃呃呃',1535139817),
	(5,560,'e\'e\'e\'e\'e\'f',1535139821),
	(6,560,'付费分',1535139826);

/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_extends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_extends`;

CREATE TABLE `post_extends` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `post_id` int(11) DEFAULT NULL COMMENT '文章id',
  `browser` int(11) DEFAULT '0' COMMENT '浏览量',
  `collect` int(11) DEFAULT '0' COMMENT '收藏量',
  `praise` int(11) DEFAULT '0' COMMENT '点赞',
  `comment` int(11) DEFAULT '0' COMMENT '评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章扩展表';

LOCK TABLES `post_extends` WRITE;
/*!40000 ALTER TABLE `post_extends` DISABLE KEYS */;

INSERT INTO `post_extends` (`id`, `post_id`, `browser`, `collect`, `praise`, `comment`)
VALUES
	(1,3,9,0,0,0),
	(2,4,3,0,0,0),
	(3,5,8,0,0,0),
	(4,6,3,0,0,0);

/*!40000 ALTER TABLE `post_extends` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `label_img` varchar(255) DEFAULT NULL COMMENT '标签图',
  `cat_id` int(11) DEFAULT NULL COMMENT '分类id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `is_valid` tinyint(1) DEFAULT '0' COMMENT '是否有效：0-未发布 1-已发布',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_cat_valid` (`cat_id`,`is_valid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章主表';

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `title`, `summary`, `content`, `label_img`, `cat_id`, `user_id`, `user_name`, `is_valid`, `created_at`, `updated_at`)
VALUES
	(1,'1111','sfsdf11111','<p>sfsdf11111</p>','/image/20180825/1535126905895612.jpeg',2,560,'test',0,1535126911,1535126911),
	(2,'33333','33333','<p>33333</p>','/image/20180825/1535128868706083.jpeg',1,560,'test',1,1535128878,1535128878),
	(3,'55555','55555','<p>55555</p>','/image/20180825/1535129136157888.jpeg',2,560,'test',1,1535129148,1535129148),
	(4,'测试文章001','测试文章001测试文章001测试文章001测试文章001测试文章001测试文章001','<p>测试文章001测试文章001测试文章001测试文章001测试文章001测试文章001<img src=\"/image/20180825/1535133104807980.jpeg\" title=\"1535133104807980.jpeg\" alt=\"20150830105732_nZCLV.jpeg\"/></p>','/image/20180825/1535133088143333.jpeg',2,560,'test',1,1535133121,1535133121),
	(5,'测试文章222','yii2.0-Ueditor百度编辑器上班偷偷打酱油扩展组件2015-10-1716216资源下载：扩展下载（yii2.0-ueditor）框架下载（Yii 2.0.6 高级版）描','<h3 class=\"news_title\" style=\"box-sizing: border-box; font-family: 微软雅黑, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">yii2.0-Ueditor百度编辑器</h3><ul style=\"box-sizing: border-box; margin-bottom: 10px; padding: 0px;\" class=\" list-paddingleft-2\"><li><p><a href=\"http://www.yii-china.com/member/index/1.html\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(85, 85, 85); text-decoration-line: none; outline: none; cursor: pointer;\"><span class=\"fa fa-user\" style=\"box-sizing: border-box; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1; font-family: FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;\"></span>&nbsp;上班偷偷打酱油</a></p></li><li><p><a href=\"http://www.yii-china.com/\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(85, 85, 85); text-decoration-line: none; outline: none; cursor: pointer;\"><span class=\"fa fa-list\" style=\"box-sizing: border-box; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1; font-family: FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;\"></span>&nbsp;扩展组件</a></p></li><li><p><span class=\"fa fa-clock-o\" style=\"box-sizing: border-box; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1; font-family: FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;\"></span>&nbsp;2015-10-17</p></li><li><p><span class=\"fa fa-eye\" style=\"box-sizing: border-box; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1; font-family: FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;\"></span>&nbsp;16216</p></li></ul><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\"><strong style=\"box-sizing: border-box;\">资源下载：</strong></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\"><a href=\"https://github.com/org-yii-china/yii2-ueditor/archive/master.zip\" target=\"_blank\" title=\"yii2.0扩展-百度编辑器\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(51, 122, 183); text-decoration-line: none; outline: none; cursor: pointer;\">扩展下载</a>（yii2.0-ueditor）</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\"><a href=\"https://github.com/yiisoft/yii2/releases/download/2.0.6/yii-advanced-app-2.0.6.tgz\" target=\"_blank\" title=\"yii2.0高级版\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(51, 122, 183); text-decoration-line: none; outline: none; cursor: pointer;\">框架下载</a>（Yii 2.0.6 高级版）</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">描述：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">最佳适用于yii2.0 高级版（advanced）应用框架，对于基础板（basic）及其他框架要修改对应的命名空间即可使用</p><hr style=\"box-sizing: content-box; height: 0px; margin-top: 20px; margin-bottom: 20px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: rgb(238, 238, 238);\"/><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; line-height: 30px;\"><strong style=\"box-sizing: border-box;\">效果演示：</strong></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; line-height: 30px;\"><img src=\"http://up.yii-china.com/image/20151023/1445578416240130.png\" title=\"1445578416240130.png\" alt=\"blob.png\" width=\"789\" height=\"485\" style=\"box-sizing: border-box; border: 1px solid rgb(211, 224, 233); vertical-align: middle; display: block; cursor: pointer; width: 789px; box-shadow: rgba(42, 42, 42, 0.1) 1px 0px 2px 2px; margin: 10px 0px; max-width: 100%; height: 485px;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\"><strong style=\"box-sizing: border-box; line-height: 25.6px;\">版本相关：</strong></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">Yii：2.0.6</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">Ueditor：1.4.3.1 （php版本）</p><hr style=\"box-sizing: content-box; height: 0px; margin-top: 20px; margin-bottom: 20px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: rgb(238, 238, 238);\"/><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\"><strong style=\"box-sizing: border-box;\">安装方法：</strong></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">1.下载yii2-ueditor</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">2.将下载的yii2-ueditor-master 修改 ueditor (注意：修改成其他文件名请修改插件内对应的命名空间)</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">3.将文件方在 根目录/common/widgets 下即可</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">调用方法：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">在rootPath/backend/controllers中新建一个控制器加入以下代码</p><pre style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 14px; padding: 16px; margin-top: 0px; margin-bottom: 16px; line-height: 1.45; color: rgb(51, 51, 51); word-break: break-all; word-wrap: normal; background-color: rgb(247, 247, 247); border: 1px solid rgb(204, 204, 204); border-radius: 3px; font-stretch: normal;\">public&nbsp;function&nbsp;actions(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;ueditor&#39;=&gt;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;class&#39;&nbsp;=&gt;&nbsp;&#39;common\\widgets\\ueditor\\UeditorAction&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;config&#39;=&gt;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//上传图片配置\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;imageUrlPrefix&#39;&nbsp;=&gt;&nbsp;&quot;&quot;,&nbsp;/*&nbsp;图片访问路径前缀&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;imagePathFormat&#39;&nbsp;=&gt;&nbsp;&quot;/image/{yyyy}{mm}{dd}/{time}{rand:6}&quot;,&nbsp;/*&nbsp;上传保存路径,可以自定义保存路径和文件名格式&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]\r\n&nbsp;&nbsp;&nbsp;&nbsp;];\r\n}</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">第一种调用方式：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">在对应的渲染页面，即views下的页面中</p><pre class=\"brush:php;toolbar:false\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&lt;?=common\\widgets\\ueditor\\Ueditor::widget([&#39;options&#39;=&gt;[&#39;initialFrameWidth&#39;&nbsp;=&gt;&nbsp;850,]])?&gt;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">options 填写配置编辑器的参数（参考ueditor官网）</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; line-height: 25.6px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Segoe UI&quot;, Arial, freesans, sans-serif;\">第二种调用方式：</p><pre style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 14px; padding: 16px; margin-top: 0px; line-height: 1.45; color: rgb(51, 51, 51); word-break: break-all; word-wrap: normal; background-color: rgb(247, 247, 247); border: 1px solid rgb(204, 204, 204); border-radius: 3px; font-stretch: normal; margin-bottom: 0px !important;\">&lt;?php&nbsp;$form&nbsp;=&nbsp;ActiveForm::begin();&nbsp;?&gt;\r\n\r\n&lt;?=&nbsp;$form-&gt;field($model,&nbsp;&#39;title&#39;)-&gt;textInput([&#39;maxlength&#39;&nbsp;=&gt;&nbsp;true])&nbsp;?&gt;\r\n\r\n&lt;?=&nbsp;$form-&gt;field($model,&nbsp;&#39;content&#39;)-&gt;widget(&#39;common\\widgets\\ueditor\\Ueditor&#39;,[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&#39;options&#39;=&gt;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;initialFrameWidth&#39;&nbsp;=&gt;&nbsp;850,\r\n&nbsp;&nbsp;&nbsp;&nbsp;]\r\n])&nbsp;?&gt;\r\n\r\n&nbsp;&nbsp;...\r\n\r\n&lt;?php&nbsp;ActiveForm::end();&nbsp;?&gt;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; line-height: 30px;\"><strong style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 24px;\">常见问题：</span></strong></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; line-height: 30px;\">1.图片上传提示“后端配置项没有正常加载，上传插件不能正常使用”</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; line-height: 30px;\">a.首先确认一下是否为最新的插件源码</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; line-height: 30px;\">b.举例：如在SiteController中配置的该插件，确认site/ueditor是否有权限访问</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; line-height: 30px;\">c.同上例子，确定site/ueditor是否能用get方式访问</p><p><br/></p>','/image/20180825/1535169114348934.jpeg',1,560,'test',1,1535169153,1535169153),
	(6,'测试文章33','3333','<p>3333</p>','',1,560,'test',1,1535169395,1535169395);

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table relation_post_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relation_post_tags`;

CREATE TABLE `relation_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `post_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章和标签关系表';

LOCK TABLES `relation_post_tags` WRITE;
/*!40000 ALTER TABLE `relation_post_tags` DISABLE KEYS */;

INSERT INTO `relation_post_tags` (`id`, `post_id`, `tag_id`)
VALUES
	(1,2,1),
	(2,2,2),
	(3,2,3),
	(4,3,1),
	(5,3,3),
	(6,4,4),
	(7,5,5),
	(8,6,6);

/*!40000 ALTER TABLE `relation_post_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tag_name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `post_num` int(11) DEFAULT '0' COMMENT '关联文章数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_name` (`tag_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `tag_name`, `post_num`)
VALUES
	(1,'333',2),
	(2,'44444',1),
	(3,'5555',2),
	(4,'测试标签001',1),
	(5,'测试标签2',1),
	(6,'33333',1);

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) DEFAULT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `vip_lv` int(11) DEFAULT '0' COMMENT 'vip等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email_validate_token`, `email`, `role`, `status`, `avatar`, `vip_lv`, `created_at`, `updated_at`)
VALUES
	(560,'test','cdYdiixIjqUwfuASVM0JS8oGPn94IeIn','$2y$13$gN10Cko7DrhJHmKF5T4LO.uzXY55taL/pOA3sPCgNb/P2dEHrMiIi',NULL,NULL,'test@test.com',10,10,'/statics/images/avatar/default.jpeg',0,1534842962,1534842962),
	(561,'test1','rp9MCQdE_K5bBBeLislRMVKfPSkHzFrw','$2y$13$5DkUAcFpkmjdIC.rygmTvO7Wcs87Jn9wm5rDwl5ashtOZYt/4jXoS',NULL,NULL,'test1@test.com',10,10,'/statics/images/avatar/default.jpeg',0,1534882052,1534882052),
	(562,'test02','XsyhNj4a7VUcVkEF-8DJfoau7gWH_qEC','$2y$13$5hW0HnpsL6wdYX.eM1yX8u.bWRr9.8v1dMnlGDoioWkIWmZe9TTsa',NULL,NULL,'test02@test.com',10,10,'/statics/images/avatar/default.jpeg',0,1535013558,1535231512);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
