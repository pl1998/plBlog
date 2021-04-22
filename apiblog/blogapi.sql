/*
 Navicat Premium Data Transfer

 Source Server         : laradock_mysql
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : blogapi

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 17/04/2021 16:35:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_extension_histories
-- ----------------------------
DROP TABLE IF EXISTS `admin_extension_histories`;
CREATE TABLE `admin_extension_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_extension_histories_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_extension_histories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_extensions
-- ----------------------------
DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE `admin_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_extensions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_extensions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Index', 'feather icon-bar-chart-2', '/', '', 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'feather icon-settings', '', '', 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', '', 'auth/users', '', 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', '', 'auth/roles', '', 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', '', 'auth/permissions', '', 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', '', 'auth/menu', '', 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Extensions', '', 'auth/extensions', '', 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 8, '文章管理', 'fa-adjust', '/articles', '', 1, '2021-03-25 07:17:19', '2021-03-25 07:17:19');
INSERT INTO `admin_menu` VALUES (9, 0, 9, '用户管理', 'fa-users', '/users', '', 1, '2021-03-27 12:26:17', '2021-03-27 12:26:17');
INSERT INTO `admin_menu` VALUES (10, 0, 10, '日志监控', 'fa-adjust', '/visitor-registry', '', 1, '2021-04-08 09:59:20', '2021-04-08 09:59:20');
INSERT INTO `admin_menu` VALUES (11, 0, 11, '评论列表', 'fa-adjust', '/topics', '', 1, '2021-04-17 07:00:57', '2021-04-17 07:00:57');
COMMIT;

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu` (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_permission_menu_permission_id_menu_id_unique` (`permission_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (1, 'Auth management', 'auth-management', '', '', 1, 0, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Users', 'users', '', '/auth/users*', 2, 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Roles', 'roles', '', '/auth/roles*', 3, 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_permissions` VALUES (4, 'Permissions', 'permissions', '', '/auth/permissions*', 4, 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Menu', 'menu', '', '/auth/menu*', 5, 1, '2021-03-25 06:52:25', NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Extension', 'extension', '', '/auth/extensions*', 6, 1, '2021-03-25 06:52:25', NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_menu_role_id_menu_id_unique` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_users_role_id_user_id_unique` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, '2021-03-25 06:52:25', '2021-03-25 06:52:25');
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2021-03-25 06:52:25', '2021-03-25 06:52:25');
COMMIT;

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings` (
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$OnwBMK86vtxVe1fPyuVqge6hws.3xM4RnO7Sfw4OOxNhNKKdMZt82', 'Administrator', NULL, NULL, '2021-03-25 06:52:25', '2021-03-25 06:52:25');
COMMIT;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_count` int(10) unsigned DEFAULT '0',
  `browse_count` int(10) unsigned DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
BEGIN;
INSERT INTO `articles` VALUES (3, 6, 1, 'Web 工作方式【转】', '', '大多数 Go 程序遵循相同的格式化规则....', 0, '我们平时浏览网页的时候, 会打开浏览器，输入网址后按下回车键，然后就会显示出你想要浏览的内容。在这个看似简单的用户行为背后，到底隐藏了些什么呢？\r\n\r\n对于普通的上网过程，系统其实是这样做的：浏览器本身是一个客户端，当你输入 URL 的时候，首先浏览器会去请求 DNS 服务器，通过 DNS 获取相应的域名对应的 IP，然后通过 IP 地址找到 IP 对应的服务器后，要求建立 TCP 连接，等浏览器发送完 HTTP Request（请求）包后，服务器接收到请求包之后才开始处理请求包，服务器调用自身服务，返回 HTTP Response（响应）包；客户端收到来自服务器的响应后开始渲染这个 Response 包里的主体（body），等收到全部的内容随后断开与该服务器之间的 TCP 连接。\r\n\r\n![](images/3.1.web2.png?raw=true)\r\n\r\n图 3.1 用户访问一个 Web 站点的过程\r\n\r\n 一个 Web 服务器也被称为 HTTP 服务器，它通过 HTTP 协议与客户端通信。这个客户端通常指的是 Web 浏览器(其实手机端客户端内部也是浏览器实现的)。\r\n\r\nWeb 服务器的工作原理可以简单地归纳为：\r\n\r\n- 客户机通过 TCP/IP 协议建立到服务器的 TCP 连接\r\n- 客户端向服务器发送 HTTP 协议请求包，请求服务器里的资源文档\r\n- 服务器向客户机发送 HTTP 协议应答包，如果请求的资源包含有动态语言的内容，那么服务器会调用动态语言的解释引擎负责处理“动态内容”，并将处理得到的数据返回给客户端\r\n- 客户机与服务器断开。由客户端解释 HTML 文档，在客户端屏幕上渲染图形结果\r\n\r\n一个简单的 HTTP 事务就是这样实现的，看起来很复杂，原理其实是挺简单的。需要注意的是客户机与服务器之间的通信是非持久连接的，也就是当服务器发送了应答后就与客户机断开连接，等待下一次请求。\r\n\r\n## URL 和 DNS 解析\r\n我们浏览网页都是通过 URL 访问的，那么 URL 到底是怎么样的呢？\r\n\r\nURL(Uniform Resource Locator) 是 “统一资源定位符” 的英文缩写，用于描述一个网络上的资源, 基本格式如下\r\n\r\n	scheme://host[:port#]/path/.../[?query-string][#anchor]\r\n	scheme         指定底层使用的协议(例如：http, https, ftp)\r\n	host           HTTP 服务器的 IP 地址或者域名\r\n	port#          HTTP 服务器的默认端口是 80，这种情况下端口号可以省略。如果使用了别的端口，必须指明，例如 http://www.cnblogs.com:8080/\r\n	path           访问资源的路径\r\n	query-string   发送给 http 服务器的数据\r\n	anchor         锚\r\n\r\n DNS(Domain Name System) 是 “域名系统” 的英文缩写，是一种组织成域层次结构的计算机和网络服务命名系统，它用于 TCP/IP 网络，它从事将主机名或域名转换为实际 IP 地址的工作。DNS 就是这样的一位 “翻译官”，它的基本工作原理可用下图来表示。\r\n\r\n![](images/3.1.dns_hierachy.png?raw=true)\r\n\r\n图 3.2 DNS 工作原理\r\n\r\n更详细的 DNS 解析的过程如下，这个过程有助于我们理解 DNS 的工作模式\r\n\r\n1. 在浏览器中输入 www.qq.com 域名，操作系统会先检查自己本地的 hosts 文件是否有这个网址映射关系，如果有，就先调用这个 IP 地址映射，完成域名解析。\r\n\r\n2. 如果 hosts 里没有这个域名的映射，则查找本地 DNS 解析器缓存，是否有这个网址映射关系，如果有，直接返回，完成域名解析。\r\n\r\n3. 如果 hosts 与本地 DNS 解析器缓存都没有相应的网址映射关系，首先会找 TCP/IP 参数中设置的首选 DNS 服务器，在此我们叫它本地 DNS 服务器，此服务器收到查询时，如果要查询的域名，包含在本地配置区域资源中，则返回解析结果给客户机，完成域名解析，此解析具有权威性。\r\n\r\n4. 如果要查询的域名，不由本地 DNS 服务器区域解析，但该服务器已缓存了此网址映射关系，则调用这个 IP 地址映射，完成域名解析，此解析不具有权威性。\r\n\r\n5. 如果本地 DNS 服务器本地区域文件与缓存解析都失效，则根据本地 DNS 服务器的设置（是否设置转发器）进行查询，如果未用转发模式，本地 DNS 就把请求发至 “根 DNS 服务器”，“根 DNS 服务器”收到请求后会判断这个域名 (.com) 是谁来授权管理，并会返回一个负责该顶级域名服务器的一个 IP。本地 DNS 服务器收到 IP 信息后，将会联系负责 .com 域的这台服务器。这台负责 .com 域的服务器收到请求后，如果自己无法解析，它就会找一个管理 .com 域的下一级 DNS 服务器地址 (qq.com) 给本地 DNS 服务器。当本地 DNS 服务器收到这个地址后，就会找 qq.com 域服务器，重复上面的动作，进行查询，直至找到 www.qq.com 主机。\r\n\r\n6. 如果用的是转发模式，此 DNS 服务器就会把请求转发至上一级 DNS 服务器，由上一级服务器进行解析，上一级服务器如果不能解析，或找根 DNS 或把转请求转至上级，以此循环。不管是本地 DNS 服务器用是是转发，还是根提示，最后都是把结果返回给本地 DNS 服务器，由此 DNS 服务器再返回给客户机。\r\n\r\n![](images/3.1.dns_inquery.png?raw=true)\r\n\r\n图 3.3 DNS 解析的整个流程\r\n\r\n> 所谓 `递归查询过程` 就是 “查询的递交者” 更替, 而 `迭代查询过程` 则是 “查询的递交者”不变。\r\n>\r\n> 举个例子来说，你想知道某个一起上法律课的女孩的电话，并且你偷偷拍了她的照片，回到寝室告诉一个很仗义的哥们儿，这个哥们儿二话没说，拍着胸脯告诉你，甭急，我替你查(此处完成了一次递归查询，即，问询者的角色更替)。然后他拿着照片问了学院大四学长，学长告诉他，这姑娘是 xx 系的；然后这哥们儿马不停蹄又问了 xx 系的办公室主任助理同学，助理同学说是 xx 系 yy 班的，然后很仗义的哥们儿去 xx 系 yy 班的班长那里取到了该女孩儿电话。(此处完成若干次迭代查询，即，问询者角色不变，但反复更替问询对象)最后，他把号码交到了你手里。完成整个查询过程。\r\n\r\n通过上面的步骤，我们最后获取的是IP地址，也就是浏览器最后发起请求的时候是基于 IP 来和服务器做信息交互的。\r\n\r\n## HTTP 协议详解\r\n\r\nHTTP 协议是 Web 工作的核心，所以要了解清楚 Web 的工作方式就需要详细的了解清楚 HTTP 是怎么样工作的。\r\n\r\nHTTP 是一种让 Web 服务器与浏览器(客户端)通过 Internet 发送与接收数据的协议, 它建立在 TCP 协议之上，一般采用 TCP 的 80 端口。它是一个请求、响应协议--客户端发出一个请求，服务器响应这个请求。在 HTTP 中，客户端总是通过建立一个连接与发送一个 HTTP 请求来发起一个事务。服务器不能主动去与客户端联系，也不能给客户端发出一个回调连接。客户端与服务器端都可以提前中断一个连接。例如，当浏览器下载一个文件时，你可以通过点击 “停止” 键来中断文件的下载，关闭与服务器的 HTTP 连接。\r\n\r\nHTTP 协议是无状态的，同一个客户端的这次请求和上次请求是没有对应关系，对 HTTP 服务器来说，它并不知道这两个请求是否来自同一个客户端。为了解决这个问题， Web 程序引入了 Cookie 机制来维护连接的可持续状态。\r\n\r\n>HTTP 协议是建立在 TCP 协议之上的，因此 TCP 攻击一样会影响 HTTP 的通讯，例如比较常见的一些攻击：SYN Flood 是当前最流行的 DoS（拒绝服务攻击）与 DdoS（分布式拒绝服务攻击）的方式之一，这是一种利用 TCP 协议缺陷，发送大量伪造的 TCP 连接请求，从而使得被攻击方资源耗尽（CPU 满负荷或内存不足）的攻击方式。\r\n\r\n### HTTP 请求包（浏览器信息）\r\n\r\n我们先来看看 Request 包的结构, Request 包分为 3 部分，第一部分叫 Request line（请求行）, 第二部分叫 Request header（请求头）,第三部分是 body（主体）。header 和 body 之间有个空行，请求包的例子所示:\r\n\r\n	GET /domains/example/ HTTP/1.1		// 请求行: 请求方法 请求 URI HTTP 协议/协议版本\r\n	Host：www.iana.org				// 服务端的主机名\r\n	User-Agent：Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4			// 浏览器信息\r\n	Accept：text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8	// 客户端能接收的 mine\r\n	Accept-Encoding：gzip,deflate,sdch		// 是否支持流压缩\r\n	Accept-Charset：UTF-8,*;q=0.5		// 客户端字符编码集\r\n	// 空行,用于分割请求头和消息体\r\n	// 消息体,请求资源参数,例如 POST 传递的参数\r\n\r\nHTTP 协议定义了很多与服务器交互的请求方法，最基本的有 4 种，分别是 GET, POST, PUT, DELETE。一个 URL 地址用于描述一个网络上的资源，而 HTTP 中的 GET, POST, PUT, DELETE 就对应着对这个资源的查，增，改，删 4 个操作。我们最常见的就是 GET 和 POST 了。GET 一般用于获取/查询资源信息，而 POST 一般用于更新资源信息。\r\n\r\n通过 fiddler 抓包可以看到如下请求信息:\r\n\r\n![](images/3.1.http.png?raw=true)\r\n\r\n图 3.4 fiddler 抓取的 GET 信息\r\n\r\n![](images/3.1.httpPOST.png?raw=true)\r\n\r\n图 3.5 fiddler 抓取的 POST 信息\r\n\r\n我们看看 GET 和 POST 的区别:\r\n\r\n1. 我们可以看到 GET 请求消息体为空，POST 请求带有消息体。\r\n2. GET 提交的数据会放在 URL 之后，以 `?` 分割 URL 和传输数据，参数之间以 `&` 相连，如 `EditPosts.aspx?name=test1&id=123456`。POST 方法是把提交的数据放在 HTTP 包的 body 中。\r\n3. GET 提交的数据大小有限制（因为浏览器对 URL 的长度有限制），而 POST 方法提交的数据没有限制。\r\n4. GET 方式提交数据，会带来安全问题，比如一个登录页面，通过 GET 方式提交数据时，用户名和密码将出现在 URL 上，如果页面可以被缓存或者其他人可以访问这台机器，就可以从历史记录获得该用户的账号和密码。\r\n\r\n### HTTP 响应包（服务器信息）\r\n我们再来看看 HTTP 的 response 包，他的结构如下：\r\n\r\n	HTTP/1.1 200 OK						// 状态行\r\n	Server: nginx/1.0.8					// 服务器使用的 WEB 软件名及版本\r\n	Date: Tue, 30 Oct 2012 04:14:25 GMT		// 发送时间\r\n	Content-Type: text/html				// 服务器发送信息的类型\r\n	Transfer-Encoding: chunked			// 表示发送 HTTP 包是分段发的\r\n	Connection: keep-alive				// 保持连接状态\r\n	Content-Length: 90					// 主体内容长度\r\n	// 空行 用来分割消息头和主体\r\n	<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"... // 消息体\r\n\r\nResponse 包中的第一行叫做状态行，由 HTTP 协议版本号， 状态码， 状态消息三部分组成。\r\n\r\n状态码用来告诉 HTTP 客户端, HTTP 服务器是否产生了预期的 Response。HTTP/1.1 协议中定义了 5 类状态码， 状态码由三位数字组成，第一个数字定义了响应的类别\r\n\r\n- 1XX  提示信息 		- 表示请求已被成功接收，继续处理\r\n- 2XX  成功 			- 表示请求已被成功接收，理解，接受\r\n- 3XX  重定向 		- 要完成请求必须进行更进一步的处理\r\n- 4XX  客户端错误 	- 请求有语法错误或请求无法实现\r\n- 5XX  服务器端错误 	- 服务器未能实现合法的请求\r\n\r\n我们看下面这个图展示了详细的返回信息，左边可以看到有很多的资源返回码，200 是常用的，表示正常信息，302 表示跳转。response header 里面展示了详细的信息。\r\n\r\n![](images/3.1.response.png?raw=true)\r\n\r\n图 3.6 访问一次网站的全部请求信息\r\n\r\n### HTTP 协议是无状态的和 Connection: keep-alive 的区别\r\n无状态是指协议对于事务处理没有记忆能力，服务器不知道客户端是什么状态。从另一方面讲，打开一个服务器上的网页和你之前打开这个服务器上的网页之间没有任何联系。\r\n\r\nHTTP 是一个无状态的面向连接的协议，无状态不代表 HTTP 不能保持 TCP 连接，更不能代表 HTTP 使用的是 UDP 协议（面对无连接）。\r\n\r\n从 HTTP/1.1 起，默认都开启了 Keep-Alive 保持连接特性，简单地说，当一个网页打开完成后，客户端和服务器之间用于传输 HTTP 数据的 TCP 连接不会关闭，如果客户端再次访问这个服务器上的网页，会继续使用这一条已经建立的 TCP 连接。\r\n\r\nKeep-Alive 不会永久保持连接，它有一个保持时间，可以在不同服务器软件（如 Apache）中设置这个时间。\r\n\r\n## 请求实例\r\n\r\n![](images/3.1.web.png?raw=true)\r\n\r\n图 3.7 一次请求的 request 和 response\r\n\r\n上面这张图我们可以了解到整个的通讯过程，同时细心的读者是否注意到了一点，一个 URL 请求但是左边栏里面为什么会有那么多的资源请求(这些都是静态文件，go 对于静态文件有专门的处理方式)。\r\n\r\n这个就是浏览器的一个功能，第一次请求 url，服务器端返回的是 html 页面，然后浏览器开始渲染 HTML：当解析到 HTML DOM 里面的图片连接，css 脚本和 js 脚本的链接，浏览器就会自动发起一个请求静态资源的 HTTP 请求，获取相对应的静态资源，然后浏览器就会渲染出来，最终将所有资源整合、渲染，完整展现在我们面前的屏幕上。\r\n\r\n>网页优化方面有一项措施是减少 HTTP 请求次数，就是把尽量多的 css 和 js 资源合并在一起，目的是尽量减少网页请求静态资源的次数，提高网页加载速度，同时减缓服务器的压力。', 56, 0, 'Go', '2020-02-17 04:16:23', '2021-04-08 10:18:27', NULL, 0);
INSERT INTO `articles` VALUES (5, 7, 1, '使用laravel 如何创建一个数据库模型', '', '使用laravel 如何创建一个数据库模型', 1, '```\r\n使用laravel 如何创建一个数据库模型\r\n```', 7, 0, 'Go', '2020-02-17 08:02:13', '2021-04-13 06:11:57', NULL, 0);
INSERT INTO `articles` VALUES (6, 7, 1, 'Eloquent: 关联', '', 'Eloquent: 关联', 1, '# Eloquent: 关联\r\n\r\n- [简介](#introduction)\r\n- [定义关联](#defining-relationships)\r\n    - [一对一](#one-to-one)\r\n    - [一对多](#one-to-many)\r\n    - [一对多 (反向)](#one-to-many-inverse)\r\n    - [多对多](#many-to-many)\r\n    - [自定义中间表模型](#defining-custom-intermediate-table-models)\r\n    - [远程一对一](#has-one-through)\r\n    - [远程一对多](#has-many-through)\r\n- [多态关联](#polymorphic-relationships)\r\n    - [一对一](#one-to-one-polymorphic-relations)\r\n    - [一对多](#one-to-many-polymorphic-relations)\r\n    - [多对多](#many-to-many-polymorphic-relations)\r\n    - [自定义多态模型](#custom-polymorphic-types)\r\n- [查询关联](#querying-relations)\r\n    - [关联方法 Vs. 动态属性](#relationship-methods-vs-dynamic-properties)\r\n    - [基于存在的关联查询](#querying-relationship-existence)\r\n    - [基于不存在的关联查询](#querying-relationship-absence)\r\n    - [多态的关联查询](#querying-polymorphic-relationships)\r\n    - [关联数据计数](#counting-related-models)\r\n- [预加载](#eager-loading)\r\n    - [为预加载添加约束](#constraining-eager-loads)\r\n    - [延迟预加载](#lazy-eager-loading)\r\n- [插入 & 更新关联模型](#inserting-and-updating-related-models)\r\n    - [ `save` 方法](#the-save-method)\r\n    - [ `create` 方法](#the-create-method)\r\n    - [更新 `Belongs To` 关联](#updating-belongs-to-relationships)\r\n    - [多对多关联](#updating-many-to-many-relationships)\r\n- [更新父集时间戳](#touching-parent-timestamps)\r\n\r\n<a name=\"introduction\"></a>\r\n## 简介\r\n\r\n数据库表通常相互关联。例如，一篇博客文章可能有很多评论，或者一个订单对应一个下单用户。 Eloquent 让这些关联的管理和使用变得简单，并支持多种类型的关联：\r\n\r\n<div class=\"content-list\" markdown=\"1\">\r\n- [一对一](#one-to-one)\r\n- [一对多](#one-to-many)\r\n- [多对多](#many-to-many)\r\n- [远程一对一](#has-one-through)\r\n- [远程一对多](#has-many-through)\r\n- [一对一 (多态关联)](#one-to-one-polymorphic-relations)\r\n- [一对多 (多态关联)](#one-to-many-polymorphic-relations)\r\n- [多对多 (多态关联)](#many-to-many-polymorphic-relations)\r\n</div>\r\n\r\n<a name=\"defining-relationships\"></a>\r\n## 定义关联\r\n\r\nEloquent 关联在 Eloquent 模型类中以方法的形式呈现。如同 Eloquent 模型本身，关联也可以作为强大的 [查询语句构造器](/docs/{{version}}/queries) 使用，提供了强大的链式调用和查询功能。例如，我们可以在 `posts` 关联的链式调用中附加一个约束条件：\r\n\r\n    $user->posts()->where(\'active\', 1)->get();\r\n\r\n不过在深入使用关联之前，让我们先学习如何定义每种关联类型。\r\n\r\n<a name=\"one-to-one\"></a>\r\n### 一对一\r\n\r\n一对一是最基本的关联关系。例如，一个 `User` 模型可能关联一个 `Phone` 模型。为了定义这个关联，我们要在 `User` 模型中写一个 `phone` 方法。在 `phone` 方法内部调用 `hasOne` 方法并返回其结果:\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class User extends Model\r\n    {\r\n        /**\r\n         * 获取与用户关联的电话记录。\r\n         */\r\n        public function phone()\r\n        {\r\n            return $this->hasOne(\'App\\Phone\');\r\n        }\r\n    }\r\n\r\n\r\n`hasOne` 方法的第一个参数是关联模型的类名。一旦定义了模型关联，我们就可以使用 Eloquent 动态属性获得相关的记录。动态属性允许你访问关系方法就像访问模型中定义的属性一样：\r\n\r\n    $phone = User::find(1)->phone;\r\n\r\nEloquent 会基于模型名决定外键名称。在这种情况下，会自动假设 `Phone` 模型有一个 `user_id` 外键。如果你想覆盖这个约定，可以传递第二个参数给 `hasOne` 方法：\r\n\r\n    return $this->hasOne(\'App\\Phone\', \'foreign_key\');\r\n\r\n另外，Eloquent 假设外键的值是与父级 `id` (或自定义 `$primaryKey`) 列的值相匹配的。换句话说，Eloquent 将会在 `Phone` 记录的 `user_id` 列中查找与用户表的 `id` 列相匹配的值。如果您希望该关联使用 `id` 以外的自定义键名，则可以给 `hasOne` 方法传递第三个参数：\r\n\r\n    return $this->hasOne(\'App\\Phone\', \'foreign_key\', \'local_key\');\r\n\r\n#### 定义反向关联\r\n\r\n我们已经能从 `User` 模型访问到 `Phone` 模型了。现在，让我们再在 `Phone` 模型上定义一个关联，这个关联能让我们访问到拥有该电话的 `User` 模型。我们可以使用与 `hasOne` 方法对应的 `belongsTo` 方法来定义反向关联：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Phone extends Model\r\n    {\r\n        /**\r\n         * 获得拥有此电话的用户。\r\n         */\r\n        public function user()\r\n        {\r\n            return $this->belongsTo(\'App\\User\');\r\n        }\r\n    }\r\n\r\n在上面的例子中， Eloquent 会尝试匹配 `Phone` 模型上的 `user_id` 至 `User` 模型上的 `id` 。它是通过检查关系方法的名称并使用 `_id` 作为后缀名来确定默认外键名称的。但是，如果 `Phone` 模型的外键不是 `user_id`，那么可以将自定义键名作为第二个参数传递给 `belongsTo` 方法：\r\n\r\n    /**\r\n     * 获得拥有此电话的用户。\r\n     */\r\n    public function user()\r\n    {\r\n        return $this->belongsTo(\'App\\User\', \'foreign_key\');\r\n    }\r\n\r\n如果父级模型没有使用 `id` 作为主键，或者是希望用不同的字段来连接子级模型，则可以通过给 `belongsTo` 方法传递第三个参数的形式指定父级数据表的自定义键：\r\n\r\n    /**\r\n     * 获得拥有此电话的用户\r\n     */\r\n    public function user()\r\n    {\r\n        return $this->belongsTo(\'App\\User\', \'foreign_key\', \'other_key\');\r\n    }\r\n\r\n<a name=\"one-to-many\"></a>\r\n### 一对多\r\n\r\n『一对多』关联用于定义单个模型拥有任意数量的其它关联模型。例如，一篇博客文章可能会有无限多条评论。正如其它所有的 Eloquent 关联一样，一对多关联的定义也是在 Eloquent 模型中写一个方法：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Post extends Model\r\n    {\r\n        /**\r\n         * 获取博客文章的评论\r\n         */\r\n        public function comments()\r\n        {\r\n            return $this->hasMany(\'App\\Comment\');\r\n        }\r\n    }\r\n\r\n记住一点，Eloquent 将会自动确定 `Comment` 模型的外键属性。按照约定，Eloquent 将会使用所属模型名称的 『snake case』形式，再加上 `_id` 后缀作为外键字段。因此，在上面这个例子中，Eloquent 将假定 `Comment` 对应到 `Post` 模型上的外键就是 `post_id`。\r\n\r\n一旦关系被定义好以后，就可以通过访问 `Post` 模型的 `comments` 属性来获取评论的集合。记住，由于 Eloquent 提供了『动态属性』 ，所以我们可以像访问模型的属性一样访问关联方法：\r\n\r\n    $comments = App\\Post::find(1)->comments;\r\n\r\n    foreach ($comments as $comment) {\r\n        //\r\n    }\r\n\r\n当然，由于所有的关联还可以作为查询语句构造器使用，因此你可以使用链式调用的方式，在 `comments` 方法上添加额外的约束条件：\r\n\r\n    $comment = App\\Post::find(1)->comments()->where(\'title\', \'foo\')->first();\r\n\r\n正如 `hasOne` 方法一样，你也可以在使用 `hasMany` 方法的时候，通过传递额外参数来覆盖默认使用的外键与本地键：\r\n\r\n    return $this->hasMany(\'App\\Comment\', \'foreign_key\');\r\n\r\n    return $this->hasMany(\'App\\Comment\', \'foreign_key\', \'local_key\');\r\n\r\n<a name=\"one-to-many-inverse\"></a>\r\n### 一对多 (反向)\r\n\r\n现在，我们已经能获得一篇文章的所有评论，接着再定义一个通过评论获得所属文章的关联关系。这个关联是 `hasMany` 关联的反向关联，需要在子级模型中使用 `belongsTo` 方法定义它：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Comment extends Model\r\n    {\r\n        /**\r\n         * 获取此评论所属文章\r\n         */\r\n        public function post()\r\n        {\r\n            return $this->belongsTo(\'App\\Post\');\r\n        }\r\n    }\r\n\r\n这个关系定义好以后，我们就可以通过访问 `Comment` 模型的 `post` 这个『动态属性』来获取关联的 `Post` 模型了：\r\n\r\n    $comment = App\\Comment::find(1);\r\n\r\n    echo $comment->post->title;\r\n\r\n在上面的例子中，Eloquent 会尝试用 `Comment` 模型的 `post_id` 与 `Post` 模型的 `id` 进行匹配。默认外键名是 Eloquent 依据关联名，并在关联名后加上 `_ `再加上主键字段名作为后缀确定的。当然，如果 `Comment` 模型的外键不是 `post_id`，那么可以将自定义键名作为第二个参数传递给 `belongsTo` 方法：\r\n\r\n    /**\r\n     * 获取此评论所属文章\r\n     */\r\n    public function post()\r\n    {\r\n        return $this->belongsTo(\'App\\Post\', \'foreign_key\');\r\n    }\r\n\r\n如果父级模型没有使用 `id` 作为主键，或者是希望用不同的字段来连接子级模型，则可以通过给 `belongsTo` 方法传递第三个参数的形式指定父级数据表的自定义键：\r\n\r\n    /**\r\n     * 获取此评论所属文章\r\n     */\r\n    public function post()\r\n    {\r\n        return $this->belongsTo(\'App\\Post\', \'foreign_key\', \'other_key\');\r\n    }\r\n\r\n<a name=\"many-to-many\"></a>\r\n### 多对多\r\n\r\n多对多关联比 `hasOne` 和 `hasMany` 关联稍微复杂些。举个例子，一个用户可以拥有很多种角色，同时这些角色也被其他用户共享。例如，许多用户可能都有 「管理员」 这个角色。要定义这种关联，需要三个数据库表： `users`，`roles` 和 `role_user`。`role_user` 表的命名是由关联的两个模型按照字母顺序来的，并且包含了 `user_id` 和 `role_id` 字段。\r\n\r\n多对多关联通过调用 `belongsToMany` 这个内部方法返回的结果来定义，例如，我们在 `User` 模型中定义 `roles` 方法：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class User extends Model\r\n    {\r\n        /**\r\n         * 用户拥有的角色\r\n         */\r\n        public function roles()\r\n        {\r\n            return $this->belongsToMany(\'App\\Role\');\r\n        }\r\n    }\r\n\r\n一旦关联关系被定义后，你可以通过 `roles` 动态属性获取用户角色：\r\n\r\n    $user = App\\User::find(1);\r\n\r\n    foreach ($user->roles as $role) {\r\n        //\r\n    }\r\n\r\n当然，像其它所有关联模型一样，你可以使用 `roles` 方法，利用链式调用对查询语句添加约束条件：\r\n\r\n    $roles = App\\User::find(1)->roles()->orderBy(\'name\')->get();\r\n\r\n正如前面所提到的，为了确定关联连接表的表名，Eloquent 会按照字母顺序连接两个关联模型的名字。当然，你也可以不使用这种约定，传递第二个参数到 `belongsToMany` 方法即可：\r\n\r\n    return $this->belongsToMany(\'App\\Role\', \'role_user\');\r\n\r\n除了自定义连接表的表名，你还可以通过传递额外的参数到 `belongsToMany` 方法来定义该表中字段的键名。第三个参数是定义此关联的模型在连接表里的外键名，第四个参数是另一个模型在连接表里的外键名：\r\n\r\n    return $this->belongsToMany(\'App\\Role\', \'role_user\', \'user_id\', \'role_id\');\r\n\r\n#### 定义反向关联\r\n\r\n要定义多对多的反向关联， 你只需要在关联模型中调用 `belongsToMany` 方法。我们在 `Role` 模型中定义 `users` 方法：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Role extends Model\r\n    {\r\n        /**\r\n         * 拥有此角色的用户\r\n         */\r\n        public function users()\r\n        {\r\n            return $this->belongsToMany(\'App\\User\');\r\n        }\r\n    }\r\n\r\n如你所见，除了引入模型为 `App\\User` 外，其它与在 `User` 模型中定义的完全一样。由于我们重用了 `belongsToMany` 方法，自定义连接表表名和自定义连接表里的键的字段名称在这里同样适用。\r\n\r\n#### 获取中间表字段\r\n\r\n就如你刚才所了解的一样，多对多的关联关系需要一个中间表来提供支持， Eloquent 提供了一些有用的方法来和这张表进行交互。例如，假设我们的 `User` 对象关联了多个 `Role` 对象。在获得这些关联对象后，可以使用模型的 `pivot` 属性访问中间表的数据：\r\n\r\n    $user = App\\User::find(1);\r\n\r\n    foreach ($user->roles as $role) {\r\n        echo $role->pivot->created_at;\r\n    }\r\n\r\n需要注意的是，我们获取的每个 `Role` 模型对象，都会被自动赋予 `pivot` 属性，它代表中间表的一个模型对象，并且可以像其他的 Eloquent 模型一样使用。\r\n\r\n默认情况下，`pivot` 对象只包含两个关联模型的主键，如果你的中间表里还有其他额外字段，你必须在定义关联时明确指出：\r\n\r\n    return $this->belongsToMany(\'App\\Role\')->withPivot(\'column1\', \'column2\');\r\n\r\n如果你想让中间表自动维护 `created_at` 和 `updated_at` 时间戳，那么在定义关联时附加上 `withTimestamps` 方法即可：\r\n\r\n    return $this->belongsToMany(\'App\\Role\')->withTimestamps();\r\n\r\n#### 自定义 `pivot` 属性名称\r\n\r\n如前所述，来自中间表的属性可以使用 `pivot` 属性访问。但是，你可以自由定制此属性的名称，以便更好的反应其在应用中的用途。\r\n\r\n例如，如果你的应用中包含可能订阅的用户，则用户与博客之间可能存在多对多的关系。如果是这种情况，你可能希望将中间表访问器命名为 `subscription` 取代 `pivot` 。这可以在定义关系时使用 `as` 方法完成：\r\n\r\n    return $this->belongsToMany(\'App\\Podcast\')\r\n                    ->as(\'subscription\')\r\n                    ->withTimestamps();\r\n\r\n一旦定义完成，你可以使用自定义名称访问中间表数据：\r\n\r\n    $users = User::with(\'podcasts\')->get();\r\n\r\n    foreach ($users->flatMap->podcasts as $podcast) {\r\n        echo $podcast->subscription->created_at;\r\n    }\r\n\r\n#### 通过中间表过滤关系\r\n\r\n在定义关系时，你还可以使用 `wherePivot` 和 `wherePivotIn` 方法来过滤 `belongsToMany` 返回的结果：\r\n\r\n    return $this->belongsToMany(\'App\\Role\')->wherePivot(\'approved\', 1);\r\n\r\n    return $this->belongsToMany(\'App\\Role\')->wherePivotIn(\'priority\', [1, 2]);\r\n\r\n<a name=\"defining-custom-intermediate-table-models\"></a>\r\n### 定义中间表模型\r\n\r\n如果你想定义一个自定义模型来表示关联关系中的中间表，可以在定义关联时调用 `using` 方法。自定义多对多中间表模型都必须扩展自 `Illuminate\\Database\\Eloquent\\Relations\\Pivot` 类，自定义多对多（多态）中间表模型必须继承 `Illuminate\\Database\\Eloquent\\Relations\\MorphPivot` 类。例如，我们在写 `Role` 模型的关联时，使用自定义中间表模型 `RoleUser`:\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Role extends Model\r\n    {\r\n        /**\r\n         * 拥有此角色的所有用户\r\n         */\r\n        public function users()\r\n        {\r\n            return $this->belongsToMany(\'App\\User\')->using(\'App\\RoleUser\');\r\n        }\r\n    }\r\n\r\n当定义 `RoleUser` 模型时，我们要扩展 `Pivot` 类：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Relations\\Pivot;\r\n\r\n    class RoleUser extends Pivot\r\n    {\r\n        //\r\n    }\r\n\r\n你可以组合使用 `using` 和 `withPivot` 从中间表来检索列。例如，通过将列名传递给 `withPivot` 方法，就可以从 `UserRole` 中间表中检索出 `created_by` 和 `updated_by` 两列数据。\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Role extends Model\r\n    {\r\n        /**\r\n         * 拥有此角色的用户。\r\n         */\r\n        public function users()\r\n        {\r\n            return $this->belongsToMany(\'App\\User\')\r\n                            ->using(\'App\\RoleUser\')\r\n                            ->withPivot([\r\n                                \'created_by\',\r\n                                \'updated_by\',\r\n                            ]);\r\n        }\r\n    }\r\n\r\n> **注意:** `Pivot` 模型可能不使用 `SoftDeletes` 特性。 如果您需要软删除数据关联记录，请考虑将您的数据关联模型转换为实际的 Eloquent 模型。\r\n\r\n#### 带有递增 ID 的自定义中继模型\r\n\r\n如果你用一个自定义的中继模型定义了多对多的关系，而且这个中继模型拥有一个自增的主键，你应当确保这个自定义中继模型类中定义了一个 `incrementing` 属性其值为 `true` ：\r\n\r\n    /**\r\n     * 标识 ID 是否自增。\r\n     *\r\n     * @var bool\r\n     */\r\n    public $incrementing = true;\r\n\r\n\r\n<a name=\"has-one-through\"></a>\r\n### 远程一对一关系\r\n\r\n远程一对一关联通过一个中间关联模型实现。\r\n例如，如果每个供应商都有一个用户，并且每个用户与一个用户历史记录相关联，那么供应商可以通过用户访问用户的历史记录，让我们看看定义这种关系所需的数据库表：\r\n\r\n    users\r\n        id - integer\r\n        supplier_id - integer\r\n\r\n    suppliers\r\n        id - integer\r\n\r\n    history\r\n        id - integer\r\n        user_id - integer\r\n\r\n虽然 `history` 表不包含 `supplier_id` ，但 `hasOneThrough` 关系可以提供对用户历史记录的访问，以访问供应商模型。现在我们已经检查了关系的表结构，让我们在 `Supplier` 模型上定义相应的方法：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Supplier extends Model\r\n    {\r\n        /**\r\n         * 用户的历史记录。\r\n         */\r\n        public function userHistory()\r\n        {\r\n            return $this->hasOneThrough(\'App\\History\', \'App\\User\');\r\n        }\r\n    }\r\n\r\n传递给 `hasOneThrough` 方法的第一个参数是希望访问的模型名称，第二个参数是中间模型的名称。\r\n\r\n当执行关联查询时，通常会使用 Eloquent 约定的外键名。如果你想要自定义关联的键，可以通过给 `hasOneThrough` 方法传递第三个和第四个参数实现，第三个参数表示中间模型的外键名，第四个参数表示最终模型的外键名。第五个参数表示本地键名，而第六个参数表示中间模型的本地键名：\r\n\r\n    class Supplier extends Model\r\n    {\r\n        /**\r\n         * 用户的历史记录。\r\n         */\r\n        public function userHistory()\r\n        {\r\n            return $this->hasOneThrough(\r\n                \'App\\History\',\r\n                \'App\\User\',\r\n                \'supplier_id\', // 用户表外键\r\n                \'user_id\', // 历史记录表外键\r\n                \'id\', // 供应商本地键\r\n                \'id\' // 用户本地键\r\n            );\r\n        }\r\n    }\r\n\r\n<a name=\"has-many-through\"></a>\r\n### 远程一对多关联\r\n\r\n远程「一对多」关联提供了方便、简短的方式通过中间的关联来获得远层的关联。例如，一个 `Country` 模型可以通过中间的 `User` 模型获得多个 `Post` 模型。在这个例子中，你可以轻易地收集给定国家的所有博客文章。让我们来看看定义这种关联所需的数据表：\r\n\r\n    countries\r\n        id - integer\r\n        name - string\r\n\r\n    users\r\n        id - integer\r\n        country_id - integer\r\n        name - string\r\n\r\n    posts\r\n        id - integer\r\n        user_id - integer\r\n        title - string\r\n\r\n虽然 `posts` 表中不包含 `country_id` 字段，但 `hasManyThrough` 关联能让我们通过 `$country->posts` 访问到一个国家下所有的用户文章。为了完成这个查询，Eloquent 会先检查中间表 `users` 的 `country_id` 字段，找到所有匹配的用户 ID 后，使用这些 ID，在 `posts` 表中完成查找。\r\n\r\n现在，我们已经知道了定义这种关联所需的数据表结构，接下来，让我们在 `Country` 模型中定义它：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Country extends Model\r\n    {\r\n        /**\r\n         * 当前国家所有文章。\r\n         */\r\n        public function posts()\r\n        {\r\n            return $this->hasManyThrough(\'App\\Post\', \'App\\User\');\r\n        }\r\n    }\r\n\r\n`hasManyThrough` 方法的第一个参数是我们最终希望访问的模型名称，而第二个参数是中间模型的名称。\r\n\r\n当执行关联查询时，通常会使用 Eloquent 约定的外键名。如果你想要自定义关联的键，可以通过给 `hasManyThrough` 方法传递第三个和第四个参数实现，第三个参数表示中间模型的外键名，第四个参数表示最终模型的外键名。第五个参数表示本地键名，而第六个参数表示中间模型的本地键名：\r\n\r\n    class Country extends Model\r\n    {\r\n        public function posts()\r\n        {\r\n            return $this->hasManyThrough(\r\n                \'App\\Post\',\r\n                \'App\\User\',\r\n                \'country_id\', // 国家表外键\r\n                \'user_id\', // 用户表外键\r\n                \'id\', // 国家表本地键\r\n                \'id\' // 用户表本地键\r\n            );\r\n        }\r\n    }\r\n\r\n<a name=\"polymorphic-relationships\"></a>\r\n## 多态关联\r\n\r\n多态关联允许目标模型借助单个关联从属于多个模型。\r\n\r\n<a name=\"one-to-one-polymorphic-relations\"></a>\r\n### 一对一 (多态)\r\n\r\n#### 表结构\r\n\r\n一对一多态关联与简单的一对一关联类似；不过，目标模型能够在一个关联上从属于多个模型。例如，博客 `Post` 和 `User` 可能共享一个关联到 `Image` 模型的关系。使用一对一多态关联允许使用一个唯一图片列表同时用于博客文章和用户账户。让我们先看看表结构：\r\n\r\n    posts\r\n        id - integer\r\n        name - string\r\n\r\n    users\r\n        id - integer\r\n        name - string\r\n\r\n    images\r\n        id - integer\r\n        url - string\r\n        imageable_id - integer\r\n        imageable_type - string\r\n\r\n要特别留意 `images` 表的 `imageable_id` 和 `imageable_type` 列。 `imageable_id` 列包含文章或用户的 ID 值，而 `imageable_type` 列包含的则是父模型的类名。Eloquent 在访问 `imageable` 时使用 `imageable_type` 列来判断父模型的 「类型」。\r\n\r\n#### 模型结构\r\n\r\n接下来，再看看建立关联的模型定义：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Image extends Model\r\n    {\r\n        /**\r\n         * 获取拥有此图片的模型。\r\n         */\r\n        public function imageable()\r\n        {\r\n            return $this->morphTo();\r\n        }\r\n    }\r\n\r\n    class Post extends Model\r\n    {\r\n        /**\r\n         * 获取文章图片。\r\n         */\r\n        public function image()\r\n        {\r\n            return $this->morphOne(\'App\\Image\', \'imageable\');\r\n        }\r\n    }\r\n\r\n    class User extends Model\r\n    {\r\n        /**\r\n         * 获取用户图片。\r\n         */\r\n        public function image()\r\n        {\r\n            return $this->morphOne(\'App\\Image\', \'imageable\');\r\n        }\r\n    }\r\n\r\n#### 获取关联\r\n\r\n一旦定义了表和模型，就可以通过模型访问此关联。比如，要获取文章图片，可以使用 `image` 动态属性：\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    $image = $post->image;\r\n\r\n还可以通过访问执行 `morphTo` 调用的方法名来从多态模型中获知父模型。在这个例子中，就是 `Image` 模型的 `imageable` 方法。所以，我们可以像动态属性那样访问这个方法：\r\n\r\n    $image = App\\Image::find(1);\r\n\r\n    $imageable = $image->imageable;\r\n\r\n `Image` 模型的 `imageable` 关联将返回 `Post` 或 `User` 实例，其结果取决于图片属性哪个模型。\r\n\r\n<a name=\"one-to-many-polymorphic-relations\"></a>\r\n### 一对多（多态）\r\n\r\n#### 表结构\r\n\r\n一对多多态关联与简单的一对多关联类似；不过，目标模型可以在一个关联中从属于多个模型。假设应用中的用户可以同时 「评论」 文章和视频。使用多态关联，可以用单个 `comments` 表同时满足这些情况。我们还是先来看看用来构建这种关联的表结构：\r\n\r\n    posts\r\n        id - integer\r\n        title - string\r\n        body - text\r\n\r\n    videos\r\n        id - integer\r\n        title - string\r\n        url - string\r\n\r\n    comments\r\n        id - integer\r\n        body - text\r\n        commentable_id - integer\r\n        commentable_type - string\r\n\r\n#### 模型结构\r\n\r\n接下来，看看构建这种关联的模型定义：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Comment extends Model\r\n    {\r\n        /**\r\n         * 获取拥有此评论的模型。\r\n         */\r\n        public function commentable()\r\n        {\r\n            return $this->morphTo();\r\n        }\r\n    }\r\n\r\n    class Post extends Model\r\n    {\r\n        /**\r\n         * 获取此文章的所有评论。\r\n         */\r\n        public function comments()\r\n        {\r\n            return $this->morphMany(\'App\\Comment\', \'commentable\');\r\n        }\r\n    }\r\n\r\n    class Video extends Model\r\n    {\r\n        /**\r\n         * 获取此视频的所有评论。\r\n         */\r\n        public function comments()\r\n        {\r\n            return $this->morphMany(\'App\\Comment\', \'commentable\');\r\n        }\r\n    }\r\n\r\n#### 获取关联\r\n\r\n一旦定义了数据库表和模型，就可以通过模型访问关联。例如，可以使用 `comments` 动态属性访问文章的全部评论：\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    foreach ($post->comments as $comment) {\r\n        //\r\n    }\r\n\r\n还可以通过访问执行 `morphTo` 调用的方法名来从多态模型获取其所属模型。在本例中，就是 `Comment` 模型的  `commentable` 方法：\r\n\r\n    $comment = App\\Comment::find(1);\r\n\r\n    $commentable = $comment->commentable;\r\n\r\n `Comment`  模型的 `commentable` 关联将返回 `Post` 或 `Video` 实例，其结果取决于评论所属的模型。\r\n\r\n<a name=\"many-to-many-polymorphic-relations\"></a>\r\n### 多对多（多态）\r\n\r\n#### 表结构\r\n\r\n多对多多态关联比 `morphOne` 和 `morphMany` 关联略微复杂一些。例如，博客 `Post` 和 `Video` 模型能够共享关联到 `Tag` 模型的多态关系。使用多对多多态关联允许使用一个唯一标签在博客文章和视频间共享。以下是多对多多态关联的表结构：\r\n\r\n    posts\r\n        id - integer\r\n        name - string\r\n\r\n    videos\r\n        id - integer\r\n        name - string\r\n\r\n    tags\r\n        id - integer\r\n        name - string\r\n\r\n    taggables\r\n        tag_id - integer\r\n        taggable_id - integer\r\n        taggable_type - string\r\n\r\n#### 模型结构\r\n\r\n接下来，在模型上定义关联。`Post` 和 `Video` 模型都有调用 Eloquent 基类上  `morphToMany` 方法的 `tags` 方法：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Post extends Model\r\n    {\r\n        /**\r\n         * 获取文章的所有标签。\r\n         */\r\n        public function tags()\r\n        {\r\n            return $this->morphToMany(\'App\\Tag\', \'taggable\');\r\n        }\r\n    }\r\n\r\n#### 定义反向关联关系\r\n\r\n下面，需要在 `Tag` 模型上为每个关联模型定义一个方法。在这个示例中，我们将会定义 `posts` 方法和 `videos` 方法：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Tag extends Model\r\n    {\r\n        /**\r\n         * 获取被打上此标签的所有文章。\r\n         */\r\n        public function posts()\r\n        {\r\n            return $this->morphedByMany(\'App\\Post\', \'taggable\');\r\n        }\r\n\r\n        /**\r\n         * 获取被打上此标签的所有视频。\r\n         */\r\n        public function videos()\r\n        {\r\n            return $this->morphedByMany(\'App\\Video\', \'taggable\');\r\n        }\r\n    }\r\n\r\n#### 获取关联\r\n\r\n一旦定义了数据库表和模型，就可以通过模型访问关联。例如，可以使用 `tags` 动态属性访问文章的所有标签：\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    foreach ($post->tags as $tag) {\r\n        //\r\n    }\r\n\r\n还可以访问执行 `morphedByMany` 方法调用的方法名来从多态模型获取其所属模型。在这个示例中，就是 `Tag`  模型的 `posts` 或 `videos` 方法。可以像动态属性一样访问这些方法：\r\n\r\n    $tag = App\\Tag::find(1);\r\n\r\n    foreach ($tag->videos as $video) {\r\n        //\r\n    }\r\n\r\n<a name=\"custom-polymorphic-types\"></a>\r\n### 自定义多态类型\r\n\r\n默认情况下， Laravel 使用完全限定类名存储关联模型类型。在上面的一对多示例中， 因为 `Comment` 可能从属于一个 `Post` 或一个 `Video`，默认的 `commentable_type` 就将分别是 `App\\Post` 或 `App\\Video`。不过，你可能希望数据库与应用的内部结构解耦。在这种情况下，可以定义一个 「morph 映射」 来通知 Eloquent 使用自定义名称代替对应的类名：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Relations\\Relation;\r\n\r\n    Relation::morphMap([\r\n        \'posts\' => \'App\\Post\',\r\n        \'videos\' => \'App\\Video\',\r\n    ]);\r\n\r\n可以在 `AppServiceProvider` 的  `boot` 函数中注册 `morphMap`，或者创建一个单独的服务提供者。\r\n\r\n> {note} 在现有应用程序中添加「morph 映射」时，数据库中仍包含完全限定类的每个可变形 `*_type` 列值都需要转换为其「映射」名称。\r\n\r\n<a name=\"querying-relations\"></a>\r\n## 查询关联\r\n\r\n由于 Eloquent 关联的所有类型都通过方法定义，你可以调用这些方法，而无需真实执行关联查询。另外，所有 Eloquent 关联类型用作 [查询构造器](/docs/{{version}}/queries)，允许你在数据库上执行 SQL 之前，持续通过链式调用添加约束。\r\n\r\n例如，假设一个博客系统的 `User` 模型有许多关联的 `Post`模型：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class User extends Model\r\n    {\r\n        /**\r\n         * 获取该用户的所有文章。\r\n         */\r\n        public function posts()\r\n        {\r\n            return $this->hasMany(\'App\\Post\');\r\n        }\r\n    }\r\n\r\n你可以查询 `posts` 关联，并为其添加额外的约束：\r\n\r\n    $user = App\\User::find(1);\r\n\r\n    $user->posts()->where(\'active\', 1)->get();\r\n\r\n你可以在关联上使用任意 [查询构造器](/docs/{{version}}/queries) 方法，请查阅查询构造器文档，学习那些对你有用的方法。\r\n\r\n#### 在关联之后链式添加 `orWhere` 条件\r\n\r\n如上所示，你可以在查询关联时自由添加其他约束。 但是，在将 `orWhere` 子句链接到关联时要小心，因为 `orWhere` 子句将在逻辑上与关联约束处于同一级别：\r\n\r\n    $user->posts()\r\n            ->where(\'active\', 1)\r\n            ->orWhere(\'votes\', \'>=\', 100)\r\n            ->get();\r\n\r\n    // select * from posts\r\n    // where user_id = ? and active = 1 or votes >= 100\r\n\r\n\r\n在大多数情况下，你可以使用[约束组](/docs/{{version}}/queries#parameter-grouping) 在括号中对条件检查进行逻辑分组：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    $user->posts()\r\n            ->where(function (Builder $query) {\r\n                return $query->where(\'active\', 1)\r\n                             ->orWhere(\'votes\', \'>=\', 100);\r\n            })\r\n            ->get();\r\n\r\n    // select * from posts\r\n    // where user_id = ? and (active = 1 or votes >= 100)\r\n\r\n<a name=\"relationship-methods-vs-dynamic-properties\"></a>\r\n### 关联方法 Vs. 动态属性\r\n\r\n如果不需要向 Eloquent 关联查询添加额外的约束，可以像属性一样访问关联。例如，继续使用 `User` 和 `Post` 示例模型，可以这样访问用户的全部文章：\r\n\r\n    $user = App\\User::find(1);\r\n\r\n    foreach ($user->posts as $post) {\r\n        //\r\n    }\r\n\r\n动态属性是「懒加载」的，这意味着它们仅在你真实访问关联数据时才被载入。因此，开发者经常使用 [预加载](#eager-loading) 预先加载那些他们确知在载入模型后将访问的关联。对载入模型关联中必定被执行的 SQL 查询而言，预加载显著减少了查询的执行次数。\r\n\r\n<a name=\"querying-relationship-existence\"></a>\r\n### 查询已存在的关联\r\n\r\n在访问模型记录时，可能希望基于关联的存在限制查询结果。比如想要获取至少存在一条评论的所有文章，可以通过给 `has` 和 `orHas` 方法传递关联名称来实现：\r\n\r\n    // 获取至少存在一条评论的所有文章...\r\n    $posts = App\\Post::has(\'comments\')->get();\r\n\r\n还可以指定运算符和数量进一步自定义查询：\r\n\r\n    // 获取评论超过三条的文章...\r\n    $posts = App\\Post::has(\'comments\', \'>=\', 3)->get();\r\n\r\n还可以用 「点」语法构造嵌套的 `has` 语句。比如，可以获取拥有至少一条评论和投票的文章：\r\n\r\n    // 获取拥有至少一条带有投票评论的文章...\r\n    $posts = App\\Post::has(\'comments.votes\')->get();\r\n\r\n如果需要更多功能，可以使用 `whereHas` 和 `orWhereHas` 方法将「where」 条件放到 `has` 查询上。这些方法允许你向关联加入自定义约束，比如检查评论内容：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    // 获取至少带有一条评论内容包含 foo% 关键词的文章...\r\n    $posts = App\\Post::whereHas(\'comments\', function (Builder $query) {\r\n        $query->where(\'content\', \'like\', \'foo%\');\r\n    })->get();\r\n\r\n    // 获取至少带有十条评论内容包含 foo% 关键词的文章...\r\n    $posts = App\\Post::whereHas(\'comments\', function (Builder $query) {\r\n        $query->where(\'content\', \'like\', \'foo%\');\r\n    }, \'>=\', 10)->get();\r\n\r\n\r\n<a name=\"querying-relationship-absence\"></a>\r\n### 查询不存在的关联\r\n\r\n在访问模型记录时，可能希望基于关联不存在来限制查询结果。假设想要获取**不**存在任何评论的文章，可以通过向 `doesntHave` 和 `orDoesntHave` 方法传递关联名称来实现：\r\n\r\n    $posts = App\\Post::doesntHave(\'comments\')->get();\r\n\r\n如果需要更多功能，可以使用 `whereDoesntHave` 和 `orWhereDoesntHave` 方法将「where」 条件加到 `doesntHave` 查询上。这些方法允许你向关联加入自定义限制，比如检测评论内容：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    $posts = App\\Post::whereDoesntHave(\'comments\', function (Builder $query) {\r\n        $query->where(\'content\', \'like\', \'foo%\');\r\n    })->get();\r\n\r\n还可以使用 「点」 语法执行嵌套关联查询。例如，下面的查询用于获取带有没被禁用的作者发表评论的文章：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    $posts = App\\Post::whereDoesntHave(\'comments.author\', function (Builder $query) {\r\n        $query->where(\'banned\', 1);\r\n    })->get();\r\n\r\n<a name=\"querying-polymorphic-relationships\"></a>\r\n### 多态关联查询\r\n\r\n要查询 `MorphTo` 关联的存在，可以使用 `whereHasMorph` 方法及其相应的方法：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n	// 查询与帖子或视频相关并且标题包含 foo 的评论...\r\n    $comments = App\\Comment::whereHasMorph(\r\n        \'commentable\',\r\n        [\'App\\Post\', \'App\\Video\'],\r\n        function (Builder $query) {\r\n            $query->where(\'title\', \'like\', \'foo%\');\r\n        }\r\n    )->get();\r\n\r\n	// 查询与帖子相关的评论，标题不像 foo％...\r\n    $comments = App\\Comment::whereDoesntHaveMorph(\r\n        \'commentable\',\r\n        \'App\\Post\',\r\n        function (Builder $query) {\r\n            $query->where(\'title\', \'like\', \'foo%\');\r\n        }\r\n    )->get();\r\n\r\n你可以使用 `$type` 参数根据相关模型添加不同的约束：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    $comments = App\\Comment::whereHasMorph(\r\n        \'commentable\',\r\n        [\'App\\Post\', \'App\\Video\'],\r\n        function (Builder $query, $type) {\r\n            $query->where(\'title\', \'like\', \'foo%\');\r\n\r\n            if ($type === \'App\\Post\') {\r\n                $query->orWhere(\'content\', \'like\', \'foo%\');\r\n            }\r\n        }\r\n    )->get();\r\n\r\n您可以提供 `*` 作为通配符，让 Laravel 从数据库中查询所有可能的多态类型，而不是传递可能的多态模型数组。 Laravel 将执行其他查询以执行此操作：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    $comments = App\\Comment::whereHasMorph(\'commentable\', \'*\', function (Builder $query) {\r\n        $query->where(\'title\', \'like\', \'foo%\');\r\n    })->get();\r\n\r\n<a name=\"counting-related-models\"></a>\r\n### 关联模型计数\r\n\r\n如果想要只计算关联结果的统计数量而不需要真实加载它们，可以使用 `withCount` 方法，它将放在结果模型的 `{relation}_count` 列。示例如下：\r\n\r\n    $posts = App\\Post::withCount(\'comments\')->get();\r\n\r\n    foreach ($posts as $post) {\r\n        echo $post->comments_count;\r\n    }\r\n\r\n可以像给查询添加限制一样为多个关系添加「计数」：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    $posts = App\\Post::withCount([\'votes\', \'comments\' => function (Builder $query) {\r\n        $query->where(\'content\', \'like\', \'foo%\');\r\n    }])->get();\r\n\r\n    echo $posts[0]->votes_count;\r\n    echo $posts[0]->comments_count;\r\n\r\n还可以给关联计数结果起别名，这允许你在同一关联上添加多个计数：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Builder;\r\n\r\n    $posts = App\\Post::withCount([\r\n        \'comments\',\r\n        \'comments as pending_comments_count\' => function (Builder $query) {\r\n            $query->where(\'approved\', false);\r\n        },\r\n    ])->get();\r\n\r\n    echo $posts[0]->comments_count;\r\n\r\n    echo $posts[0]->pending_comments_count;\r\n\r\n如果将 `withCount` 和 `select` 查询组装在一起，请确保在 `select` 方法之后调用 `withCount` ：\r\n\r\n    $posts = App\\Post::select([\'title\', \'body\'])->withCount(\'comments\')->get();\r\n\r\n    echo $posts[0]->title;\r\n    echo $posts[0]->body;\r\n    echo $posts[0]->comments_count;\r\n\r\n<a name=\"eager-loading\"></a>\r\n## 预加载\r\n\r\n当以属性方式访问 Eloquent 关联时，关联数据「懒加载」。这意味着直到第一次访问属性时关联数据才会被真实加载。不过 Eloquent 能在查询父模型时「预先载入」子关联。预加载可以缓解 N + 1 查询问题。为了说明 N + 1 查询问题，考虑  `Book` 模型关联到 `Author` 的情形：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Book extends Model\r\n    {\r\n        /**\r\n         * 获取书籍作者。\r\n         */\r\n        public function author()\r\n        {\r\n            return $this->belongsTo(\'App\\Author\');\r\n        }\r\n    }\r\n\r\n现在，我们来获取所有的书籍及其作者：\r\n\r\n    $books = App\\Book::all();\r\n\r\n    foreach ($books as $book) {\r\n        echo $book->author->name;\r\n    }\r\n\r\n此循环将执行一个查询，用于获取全部书籍，然后为每本书执行获取作者的查询。如果我们有 25 本书，此循环将运行 26 个查询：1 个用于查询书籍，25 个附加查询用于查询每本书的作者。\r\n\r\n谢天谢地，我们能够使用预加载将操作压缩到只有 2 个查询。在查询时，可以使用 `with` 方法指定想要预加载的关联：\r\n\r\n    $books = App\\Book::with(\'author\')->get();\r\n\r\n    foreach ($books as $book) {\r\n        echo $book->author->name;\r\n    }\r\n\r\n在这个例子中，仅执行了两个查询：\r\n\r\n    select * from books\r\n\r\n    select * from authors where id in (1, 2, 3, 4, 5, ...)\r\n\r\n#### 预加载多个关联\r\n\r\n有时，你可能需要在单一操作中预加载几个不同的关联。要达成此目的，只要向 `with` 方法传递多个关联名称构成的数组参数：\r\n\r\n    $books = App\\Book::with([\'author\', \'publisher\'])->get();\r\n\r\n#### 嵌套预加载\r\n\r\n可以使用 「点」 语法预加载嵌套关联。比如在一个 Eloquent 语句中预加载所有书籍作者及其联系方式：\r\n\r\n    $books = App\\Book::with(\'author.contacts\')->get();\r\n\r\n#### 嵌套预加载 `morphTo` 关联\r\n\r\n如果你希望加载一个 `morphTo` 关系，以及该关系可能返回的各种实体的嵌套关系，可以将 `with` 方法与 `morphTo` 关系的 `morphWith` 方法结合使用。 为了帮助说明这种方法，让我们考虑以下模型：\r\n\r\n    <?php\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class ActivityFeed extends Model\r\n    {\r\n        /**\r\n         * 获取活动提要记录的父级。\r\n         */\r\n        public function parentable()\r\n        {\r\n            return $this->morphTo();\r\n        }\r\n    }\r\n\r\n在这个例子中，我们假设 `Event`，`Photo` 和 `Post` 模型可以创建`ActivityFeed` 模型。 另外，我们假设 `Event` 模型属于 `Calendar` 模型，`Photo` 模型与 `Tag` 模型相关联，`Post` 模型属于 `Author` 模型。\r\n\r\n使用这些模型定义和关联，我们可以查询 `ActivityFeed` 模型实例并预加载所有`parentable` 模型及其各自的嵌套关系：\r\n\r\n    use Illuminate\\Database\\Eloquent\\Relations\\MorphTo;\r\n\r\n    $activities = ActivityFeed::query()\r\n        ->with([\'parentable\' => function (MorphTo $morphTo) {\r\n            $morphTo->morphWith([\r\n                Event::class => [\'calendar\'],\r\n                Photo::class => [\'tags\'],\r\n                Post::class => [\'author\'],\r\n            ]);\r\n        }])->get();\r\n\r\n#### 预加载指定列\r\n\r\n并不是总需要获取关系的每一列。在这种情况下，Eloquent 允许你为关联指定想要获取的列：\r\n\r\n    $books = App\\Book::with(\'author:id,name\')->get();\r\n\r\n> {note} 在使用这个特性时，一定要在要获取的列的列表中包含 `id` 列。\r\n\r\n#### 默认预加载\r\n\r\n有时可能希望在查询模型时始终加载某些关联。 为此，你可以在模型上定义 `$with` 属性：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Book extends Model\r\n    {\r\n        /**\r\n         * 默认加载的关联。\r\n         *\r\n         * @var array\r\n         */\r\n        protected $with = [\'author\'];\r\n\r\n        /**\r\n         * 获取书籍作者\r\n         */\r\n        public function author()\r\n        {\r\n            return $this->belongsTo(\'App\\Author\');\r\n        }\r\n    }\r\n\r\n如果你想从单个查询的 `$with` 属性中删除一个预加载，你可以使用 `without` 方法：\r\n\r\n    $books = App\\Book::without(\'author\')->get();\r\n\r\n<a name=\"constraining-eager-loads\"></a>\r\n### 为预加载添加约束\r\n\r\n有时，可能希望预加载一个关联，同时为预加载查询添加额外查询条件，就像下面的例子：\r\n\r\n    $users = App\\User::with([\'posts\' => function ($query) {\r\n        $query->where(\'title\', \'like\', \'%first%\');\r\n    }])->get();\r\n\r\n在这个例子中， Eloquent 将仅预加载那些 `title` 列包含 `first` 关键词的文章。也可以调用其它的 [查询构造器](/docs/{{version}}/queries) 方法进一步自定义预加载操作：\r\n\r\n    $users = App\\User::with([\'posts\' => function ($query) {\r\n        $query->orderBy(\'created_at\', \'desc\');\r\n    }])->get();\r\n\r\n> {note} 在约束预加载时，不能使用 `limit` 和 `take` 查询构造器方法。\r\n\r\n<a name=\"lazy-eager-loading\"></a>\r\n### 延迟预加载\r\n\r\n有可能你还希望在模型加载完成后在进行渴求式加载。举例来说，如果你想要根据某个条件动态决定是否加载关联数据，那么 `load` 方法对你来说会非常有用：\r\n\r\n    $books = App\\Book::all();\r\n\r\n    if ($someCondition) {\r\n        $books->load(\'author\', \'publisher\');\r\n    }\r\n\r\n如果你想要在渴求式加载的查询语句中进行条件约束，你可以通过数组的形式去加载，键为对应的关联关系，值为 `Closure` 闭包函数，该闭包的参数为一个 `query` 实例：\r\n\r\n    $books->load([\'author\' => function ($query) {\r\n        $query->orderBy(\'published_date\', \'asc\');\r\n    }]);\r\n\r\n如果希望加载还没有加载的关联关系时，你可以使用 `loadMissing` 方法：\r\n\r\n    public function format(Book $book)\r\n    {\r\n        $book->loadMissing(\'author\');\r\n\r\n        return [\r\n            \'name\' => $book->name,\r\n            \'author\' => $book->author->name,\r\n        ];\r\n    }\r\n\r\n\r\n\r\n#### 嵌套延迟预加载 & `morphTo`\r\n\r\n如果希望快速加载 `morphTo` 关系，以及该关系可能返回的各种实体上的嵌套关系，可以使用 `loadMorph` 方法。\r\n\r\n这个方法接受 `morphTo` 关系的名称作为它的第一个参数，第二个参数接收模型数组、关系数组。为了帮助说明这个方法，可以看一下以下模型例子:\r\n\r\n    <?php\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class ActivityFeed extends Model\r\n    {\r\n        /**\r\n         * 获取 activity feed 记录的父级。\r\n         */\r\n        public function parentable()\r\n        {\r\n            return $this->morphTo();\r\n        }\r\n    }\r\n\r\n在这个例子中，让我们假设 `Event` 、`Photo` 和 `Post` 模型可以创建 `ActivityFeed` 模型。此外，让我们假设 `Event` 模型属于 `Calendar` 模型，`Photo` 模型与 `Tag` 模型相关联，`Post` 模型属于 `Author` 模型。\r\n\r\n使用这些模型定义和关系，我们可以检索 `ActivityFeed` 模型实例，并立即加载所有 `parentable` 模型及其各自的嵌套关系:\r\n\r\n    $activities = ActivityFeed::with(\'parentable\')\r\n        ->get()\r\n        ->loadMorph(\'parentable\', [\r\n            Event::class => [\'calendar\'],\r\n            Photo::class => [\'tags\'],\r\n            Post::class => [\'author\'],\r\n        ]);\r\n\r\n<a name=\"inserting-and-updating-related-models\"></a>\r\n## 插入 & 更新关联模型\r\n\r\n<a name=\"the-save-method\"></a>\r\n### 保存方法\r\n\r\nEloquent 为新模型添加关联提供了便捷的方法。例如，也许你需要添加一个新的 `Comment` 到一个 `Post` 模型中。你不用在 `Comment`中手动设置 `post_id` 属性, 就可以直接使用关联模型的 `save` 方法将 `Comment` 直接插入：\r\n\r\n    $comment = new App\\Comment([\'message\' => \'A new comment.\']);\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    $post->comments()->save($comment);\r\n\r\n需要注意的是，我们并没有使用动态属性的方式访问 `comments` 关联。相反，我们调用 `comments` 方法来获得关联实例。`save` 方法将自动添加适当的 `post_id` 值到 `Comment` 模型中。\r\n\r\n如果你需要保存多个关联模型，你可以使用 `saveMany` 方法：\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    $post->comments()->saveMany([\r\n        new App\\Comment([\'message\' => \'A new comment.\']),\r\n        new App\\Comment([\'message\' => \'Another comment.\']),\r\n    ]);\r\n\r\n<a name=\"the-push-method\"></a>\r\n#### 递归保存模型和关联数据\r\n\r\n如果你想 `save` 你的模型及其所有关联数据，你可以使用 `push` 方法:\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    $post->comments[0]->message = \'Message\';\r\n    $post->comments[0]->author->name = \'Author Name\';\r\n\r\n    $post->push();\r\n\r\n<a name=\"the-create-method\"></a>\r\n### 新增方法\r\n\r\n除了 `save` 和 `saveMany` 方法外，你还可以使用 `create` 方法。它接受一个属性数组，同时会创建模型并插入到数据库中。 还有， `save` 方法和 `create` 方法的不同之处在于， `save` 方法接受一个完整的 Eloquent 模型实例，而 `create` 则接受普通的 PHP 数组:\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    $comment = $post->comments()->create([\r\n        \'message\' => \'A new comment.\',\r\n    ]);\r\n\r\n> {tip} 在使用 `create` 方法前，请务必确保查看过本文档的 [批量赋值](/docs/{{version}}/eloquent#mass-assignment) 章节。\r\n\r\n你还可以使用 `createMany` 方法去创建多个关联模型：\r\n\r\n    $post = App\\Post::find(1);\r\n\r\n    $post->comments()->createMany([\r\n        [\r\n            \'message\' => \'A new comment.\',\r\n        ],\r\n        [\r\n            \'message\' => \'Another new comment.\',\r\n        ],\r\n    ]);\r\n\r\n你还可以使用 `findOrNew`、`firstOrNew`、`firstOrCreate` 和 `updateOrCreate` 方法来 [创建和更新关系模型](/docs/{{version}}/eloquent#other-creation-methods).\r\n\r\n<a name=\"updating-belongs-to-relationships\"></a>\r\n### 更新 `belongsTo` 关联\r\n\r\n当更新 `belongsTo` 关联时，可以使用 `associate` 方法。此方法将会在子模型中设置外键：\r\n\r\n    $account = App\\Account::find(10);\r\n\r\n    $user->account()->associate($account);\r\n\r\n    $user->save();\r\n\r\n当移除 `belongsTo` 关联时，可以使用 `dissociate` 方法。此方法会将关联外键设置为 `null`:\r\n\r\n    $user->account()->dissociate();\r\n\r\n    $user->save();\r\n\r\n<a name=\"default-models\"></a>\r\n#### 默认模型\r\n\r\n`belongsTo`，`hasOne`，`hasOneThrough` 和 `morphOne` 关系允许你指定默认模型，当给定关系为 `null` 时，将会返回默认模型。 这种模式被称作 [Null 对象模式](https://en.wikipedia.org/wiki/Null_Object_pattern) ，可以减少你代码中不必要的检查。在下面的例子中，如果发布的帖子没有找到作者， `user` 关系会返回一个空的 `App\\User` 模型：\r\n\r\n    /**\r\n     * 获取帖子的作者。\r\n     */\r\n    public function user()\r\n    {\r\n        return $this->belongsTo(\'App\\User\')->withDefault();\r\n    }\r\n\r\n如果需要在默认模型里添加属性， 你可以传递数组或者回调方法到 `withDefault` 中：\r\n\r\n    /**\r\n     * 获取帖子的作者。\r\n     */\r\n    public function user()\r\n    {\r\n        return $this->belongsTo(\'App\\User\')->withDefault([\r\n            \'name\' => \'Guest Author\',\r\n        ]);\r\n    }\r\n\r\n    /**\r\n     * 获取帖子的作者。\r\n     */\r\n    public function user()\r\n    {\r\n        return $this->belongsTo(\'App\\User\')->withDefault(function ($user, $post) {\r\n            $user->name = \'Guest Author\';\r\n        });\r\n    }\r\n\r\n<a name=\"updating-many-to-many-relationships\"></a>\r\n### 多对多关联\r\n\r\n#### 附加 / 分离\r\n\r\nEloquent 也提供了一些额外的辅助方法，使相关模型的使用更加方便。例如，我们假设一个用户可以拥有多个角色，并且每个角色都可以被多个用户共享。给某个用户附加一个角色是通过向中间表插入一条记录实现的，可以使用 `attach` 方法完成该操作：\r\n\r\n    $user = App\\User::find(1);\r\n\r\n    $user->roles()->attach($roleId);\r\n\r\n在将关系附加到模型时，还可以传递一组要插入到中间表中的附加数据：\r\n\r\n    $user->roles()->attach($roleId, [\'expires\' => $expires]);\r\n\r\n当然，有时也需要移除用户的角色。可以使用 `detach` 移除多对多关联记录。`detach` 方法将会移除中间表对应的记录；但是这 2 个模型都将会保留在数据库中：\r\n\r\n    // 移除用户的一个角色...\r\n    $user->roles()->detach($roleId);\r\n\r\n    // 移除用户的所有角色...\r\n    $user->roles()->detach();\r\n\r\n为了方便，`attach` 和 `detach` 也允许传递一个 ID 数组：\r\n\r\n    $user = App\\User::find(1);\r\n\r\n    $user->roles()->detach([1, 2, 3]);\r\n\r\n    $user->roles()->attach([\r\n        1 => [\'expires\' => $expires],\r\n        2 => [\'expires\' => $expires],\r\n    ]);\r\n\r\n#### 同步关联\r\n\r\n你也可以使用 `sync` 方法构建多对多关联。`sync` 方法接收一个 ID 数组以替换中间表的记录。中间表记录中，所有未在 ID 数组中的记录都将会被移除。所以该操作结束后，只有给出数组的 ID 会被保留在中间表中：\r\n\r\n    $user->roles()->sync([1, 2, 3]);\r\n\r\n你也可以通过 ID 传递额外的附加数据到中间表：\r\n\r\n    $user->roles()->sync([1 => [\'expires\' => true], 2, 3]);\r\n\r\n如果你不想移除现有的 ID，可以使用 `syncWithoutDetaching` 方法：\r\n\r\n    $user->roles()->syncWithoutDetaching([1, 2, 3]);\r\n\r\n#### 切换关联\r\n\r\n多对多关联也提供了 `toggle` 方法用于「切换」给定 ID 数组的附加状态。 如果给定的 ID 已被附加在中间表中，那么它将会被移除，同样，如果如果给定的 ID 已被移除，它将会被附加：\r\n\r\n    $user->roles()->toggle([1, 2, 3]);\r\n\r\n#### 在中间表上保存额外的数据\r\n\r\n当处理多对多关联时，save 方法接收一个额外的数据数组作为第二个参数：\r\n\r\n    App\\User::find(1)->roles()->save($role, [\'expires\' => $expires]);\r\n\r\n#### 更新中间表记录\r\n\r\n如果你需要在中间表中更新一条已存在的记录，可以使用 `updateExistingPivot` 。此方法接收中间表的外键与要更新的数据数组进行更新：\r\n\r\n    $user = App\\User::find(1);\r\n\r\n    $user->roles()->updateExistingPivot($roleId, $attributes);\r\n\r\n<a name=\"touching-parent-timestamps\"></a>\r\n## 更新父级时间戳\r\n\r\n当一个模型属 `belongsTo` 或者 `belongsToMany` 另一个模型时， 例如 `Comment` 属于 `Post`，有时更新子模型导致更新父模型时间戳非常有用。例如，当 `Comment` 模型被更新时，您要自动「触发」父级 `Post` 模型的 `updated_at` 时间戳的更新。Eloquent 让它变得简单。只要在子模型加一个包含关联名称的 `touches` 属性即可：\r\n\r\n    <?php\r\n\r\n    namespace App;\r\n\r\n    use Illuminate\\Database\\Eloquent\\Model;\r\n\r\n    class Comment extends Model\r\n    {\r\n        /**\r\n         * 要触发的所有关联关系\r\n         *\r\n         * @var array\r\n         */\r\n        protected $touches = [\'post\'];\r\n\r\n        /**\r\n         * 评论所属的文章\r\n         */\r\n        public function post()\r\n        {\r\n            return $this->belongsTo(\'App\\Post\');\r\n        }\r\n    }\r\n\r\n现在，当你更新一个 `Comment` 时，对应父级 `Post` 模型的 `updated_at` 字段同时也会被更新，使其更方便得知何时让一个 `Post` 模型的缓存失效：\r\n\r\n    $comment = App\\Comment::find(1);\r\n\r\n    $comment->text = \'Edit to this comment!\';\r\n\r\n    $comment->save();', 9, 0, 'laravel', '2020-02-18 07:53:25', '2021-02-05 16:24:40', NULL, 0);
INSERT INTO `articles` VALUES (8, 7, 1, 'docker入门基操~~~', '', 'Window Use Docker to create an LNMP environment', 0, '##  Docker基本使用方式\r\n\r\n- [Window 使用 Docker 创建lnmp环境 ](#introduction)\r\n- [常用docker命令 ](#command)\r\n\r\n### [安装详情](https://www.cnblogs.com/wyt007/p/10656813.html)\r\n\r\n\r\n<a name=\"introduction\"></a>\r\n## Window 使用 Docker 创建lnmp环境\r\n\r\n####  创建mysql 容器\r\n\r\n```shell script\r\ndocker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=wqg951122 --name lnmp_mysql mysql:5.6\r\n//挂在本地卷\r\n docker create -v e:/pgsql/data --name PostgresData alpine 新建本地数据仓库\r\n \r\ndocker run -d -p 3306:3306   --name pgsql -e POSTGRES_PASSWORD=123456 -d --volumes-from PostgresData mysql:5.7 //挂在到数据仓库\r\n\r\n\r\n```\r\n\r\n####  参数说明\r\n- -d 让容器在后台运行\r\n- -p 添加主机到容器的端口映射\r\n- -e 设置环境变量，这里是设置 mysql 的 root 用户的初始密码 *\r\n- –name 容器的名字，随便取，但是必须唯一\r\n\r\n#### windows 进入容器 请带上 `winpty` 命令\r\n\r\n#### 进入容器\r\n```shell script\r\ndocker exec -ti lnmp /bin/bash \r\n//或者\r\ndocker exec -ti lnmp bash\r\n\r\n```\r\n\r\n##### 参数说明\r\n\r\n- -t 在容器产生一个伪终端\r\n- -i 对容器内的标准输入 (STDIN) 进行交互\r\n\r\n#### 安装VM（每个创建的容器都要执行此步骤，后续忽略）\r\n\r\n```shell script\r\napt update\r\n```\r\n\r\n##### 再执行\r\n\r\n```shell script\r\napt-get install vim\r\n```\r\n\r\n####  安装完成\r\n\r\n#### 创建php容器\r\n\r\n```shell script\r\ndocker run -d -v /home/wwwroot:/home/wwwroot -p 9000:9000 --link woann_mysql:mysql --name woann_phpfpm php:7.2-fpm\r\n```\r\n\r\n####  参数说明\r\n\r\n- -d 让容器在后台运行\r\n- -p 添加主机到容器的端口映射\r\n- -v 添加目录映射，即主机上的 `/home/wwwroot` 和容器中 `/home/wwwroot` 目录是同步的\r\n- –name 容器的名字\r\n- –link 与另外一个容器建立起联系，这样我们就可以在当前容器中去使用另一个容器里的服务。这里如果不指定–link 参数其实也是可以得，因为容器本身也是有 ip 的且唯一，所以我们也可以直接利用 ip 去访问容器。\r\n\r\n#### 添加 php 测试文件\r\n\r\n#####  在 `/home/wwwroot` 目录下添加测试 php 文件 `index.php`\r\n```php\r\n<?php phpinfo();\r\n```\r\n#### 创建 nginx 容器 并挂载到本地目录 `注意`:本地想访问容器必须通过-p去添加端口映射 容器中项目应该挂载在本地目录房子丢失\r\n\r\n```shell script\r\ndocker run -d -p 80:80  -v /home/wwwroot:/home/wwwroot --link woann_phpfpm:phpfpm --name woann_nginx nginx\r\n```\r\n\r\n####  参数说明\r\n\r\n- d 让容器在后台运行\r\n- -p 添加主机到容器的端口映射\r\n- -v 添加目录映射，这里最好 nginx 容器的根目录最好写成和 php 容器中根目录一样。但是不一点非要一模一样，如果不一样在配置 nginx 的时候需要注意\r\n- –name 容器的名字\r\n- –link 与另外一个容器建立起联系\r\n\r\n####  进入到 nginx 容器修改配置文件[#](https://learnku.com/articles/21950#070bf6)\r\n\r\n- nginx 配置文件目录在 `/etc/nginx/` 目录下\r\n- 主配置文件为 `/etc/nginx/nginx.conf`\r\n- 引用配置文件为 `/etc/nginx/conf.d/*.conf`\r\n- nginx 默认创建了一个引用配置文件 (/etc/nginx/conf.d/default.conf)\r\n  执行\r\n\r\n```shell script\r\nvim /etc/nginx/conf.d/default.conf\r\n```\r\n\r\n#### 配置nginx\r\n\r\n```shell\r\nserver {\r\n  #访问端口 默认80\r\n  listen       80;\r\n  listen  [::]:80;\r\n  #域名或者ip\r\n  server_name  zy.test;\r\n \r\n  index index.php index.html index.htm;\r\n\r\n  set $root_path \'/home/wwwroot/huawei/public\';\r\n   root $root_path;\r\n\r\n   autoindex on;\r\n\r\n   # tp laravel 等单入口框架\r\n   location / {\r\n           if (!-e $request_filename) {\r\n              rewrite  ^(.*)$  /index.php?s=/$1  last;\r\n          }\r\n      }\r\n   #访问php文件转发到php-fpm\r\n    location ~ \\.php$ {\r\n        try_files $uri /index.php =404;\r\n        fastcgi_pass   phpfpm:9000;\r\n        fastcgi_index  index.php;\r\n        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\r\n        fastcgi_read_timeout 600;\r\n        include        fastcgi_params;\r\n    }\r\n    \r\n    location ~ /\\.ht {\r\n          deny all;\r\n     }\r\n   \r\n    error_log /var/log/nginx/php_error.log;\r\n    access_log /var/log/nginx/php_access.log;\r\n\r\n}\r\n```\r\n\r\n#### 查看刚才创建的所有容器\r\n\r\n```shell script\r\n\r\ndocker ps\r\n\r\n```\r\n####  用浏览器访问 `http://127.0.0.1/index.php`, 即可看到 phpinfo 的信息页面。至此 lnmp 搭建完毕\r\n\r\n\r\n## 常用docker命令\r\n\r\n\r\n#### 查看当前镜像\r\n```shell script\r\ndocker images\r\n```\r\n\r\n#### 查看运行过的镜像\r\n\r\n```shell script\r\n\r\ndocker ps -a\r\n\r\n```\r\n\r\n#### 卸载镜像\r\n\r\n```shell script\r\n\r\ndocker rmi xxxxx (当前镜像id) || docker rm c3065afc73c4(容器ID)\r\n\r\n```\r\n#### 启动docker\r\n\r\n```shell script\r\n\r\ndocker start c3065afc73c4(容器ID)\r\n\r\n```\r\n#### 终止容器\r\n\r\n```shell script\r\n\r\ndocker stop c3065afc73c4(容器ID)\r\n\r\n```\r\n\r\n#### 进入docker容器\r\n\r\n```shell script\r\n\r\ndocker attach c3065afc73c4(容器ID) 或者 docker exec -it  nginx（容器名） /bin/bash\r\n\r\n```\r\n\r\n#### 重启docker容器\r\n\r\n```shell script\r\ndocker restart c3065afc73c4(容器ID)\r\n```\r\n\r\n#### 上传文件到docker容器\r\n\r\n> 例如：将当前路径`/root/test.txt`文件 映射到id为`ecef8319d2c8`的容器`/root/`下\r\n> docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH\r\n\r\n\r\n```shell script\r\ndocker cp ecef8319d2c8:/root/test.txt /root/\r\n```', 102, 0, 'Nginx', '2020-02-18 21:11:06', '2021-03-04 09:48:43', NULL, 0);
INSERT INTO `articles` VALUES (10, 7, 1, 'Eloquent: API 资源 示例文章', '', 'Eloquent: API 资源', 1, '# Eloquent: API 资源\r\n\r\n- [简介](#introduction)\r\n- [生成资源](#generating-resources)\r\n- [概念综述](#concept-overview)\r\n   - [资源集合](#resource-collections)\r\n- [编写资源](#writing-resources)\r\n    - [数据包裹](#data-wrapping)\r\n    - [分页](#pagination)\r\n    - [条件属性](#conditional-attributes)\r\n    - [条件关联](#conditional-relationships)\r\n    - [添加元数据](#adding-meta-data)\r\n- [资源响应](#resource-responses)\r\n\r\n<a name=\"introduction\"></a>\r\n## 简介\r\n\r\n当构建 API 时，你往往需要一个转换层来联结你的 Eloquent 模型和实际返回给用户的 JSON 响应。Laravel 的资源类能够让你以更直观简便的方式将模型和模型集合转化成 JSON。\r\n\r\n<a name=\"generating-resources\"></a>\r\n## 生成资源\r\n\r\n![](http://blog.test/storage/images/fece16e5de81ad35ac734550b2aae880.jpg)\r\n\r\n你可以使用 `make:resource` Artisan 命令来生成一个资源类。默认情况下生成的资源都会被放置在应用程序的 `app/Http/Resources` 文件夹下。资源继承自 `Illuminate\\Http\\Resources\\Json\\JsonResource` 类：\r\n\r\n    php artisan make:resource User\r\n\r\n#### 资源集合\r\n\r\n除了生成资源转换单个模型外，你还可以生成资源集合用来转换模型的集合。这允许你在响应中包含与给定资源相关的链接与其他元信息。\r\n\r\n你需要在生成资源时添加 `--collection` 标志以生成一个资源集合。或者，你也可以直接在资源的名称中包含 `Collection` 向 Laravel 表示应该生成一个资源集合。资源集合继承自 `Illuminate\\Http\\Resources\\Json\\ResourceCollection` 类：\r\n\r\n    php artisan make:resource Users --collection\r\n\r\n    php artisan make:resource UserCollection\r\n\r\n<a name=\"concept-overview\"></a>\r\n## 概念综述\r\n\r\n> {tip} 这是对资源和资源集合的高度概述。强烈建议你阅读本文档的其他部分，以深入了解如何更好地自定义和使用资源。\r\n\r\n在深入了解如何定制化编写你的资源之前，让我们先来看看在 Laravel 中如何使用资源。一个资源类表示一个单一模型需要被转换成 JSON 格式。例如，现在我们有一个简单的 `User` 资源类：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\JsonResource;\r\n\r\n    class User extends JsonResource\r\n    {\r\n        /**\r\n         * 将资源转换成数组。\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function toArray($request)\r\n        {\r\n            return [\r\n                \'id\' => $this->id,\r\n                \'name\' => $this->name,\r\n                \'email\' => $this->email,\r\n                \'created_at\' => $this->created_at,\r\n                \'updated_at\' => $this->updated_at,\r\n            ];\r\n        }\r\n    }\r\n\r\n每一个资源类都定义了一个 `toArray` 方法，在发送响应时它会返回应该被转化成 JSON 的属性数组。注意在这里我们可以直接使用 `$this` 变量来访问模型属性。这是因为资源类将自动代理属性和方法到底层模型以方便访问。你可以在路由或控制器中返回已定义的资源：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\User as UserResource;\r\n\r\n    Route::get(\'/user\', function () {\r\n        return new UserResource(User::find(1));\r\n    });\r\n\r\n### 资源集合\r\n\r\n你可以在路由或者控制器中使用 `collection` 方法来创建资源实例，以返回多个资源的集合或分页响应：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\User as UserResource;\r\n\r\n    Route::get(\'/user\', function () {\r\n        return UserResource::collection(User::all());\r\n    });\r\n\r\n当然了，使用如上方法你将不能添加任何附加的元数据和集合一起返回。如果你需要自定义资源集合响应，你需要创建一个专用的资源来表示集合：\r\n\r\n    php artisan make:resource UserCollection\r\n\r\n你可以轻松的在已生成的资源集合类中定义任何你想在响应中返回的元数据：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\ResourceCollection;\r\n\r\n    class UserCollection extends ResourceCollection\r\n    {\r\n        /**\r\n         * 将资源集合转换成数组。\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function toArray($request)\r\n        {\r\n            return [\r\n                \'data\' => $this->collection,\r\n                \'links\' => [\r\n                    \'self\' => \'link-value\',\r\n                ],\r\n            ];\r\n        }\r\n    }\r\n\r\n你可以在路由或者控制器中返回已定义的资源集合：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\UserCollection;\r\n\r\n    Route::get(\'/users\', function () {\r\n        return new UserCollection(User::all());\r\n    });\r\n\r\n#### 保护集合的键\r\n\r\n当从路由返回资源集合时，Laravel 将重置集合的键，使它们以简单的数字顺序。但是，可以将 `preserveKeys` 属性添加到资源类中，指示是否应保留集合键：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\JsonResource;\r\n\r\n    class User extends JsonResource\r\n    {\r\n        /**\r\n         * 指示是否应保留资源的集合键。\r\n         *\r\n         * @var bool\r\n         */\r\n        public $preserveKeys = true;\r\n    }\r\n\r\n当 `preserveKeys` 属性被设置为 `true`, 集合的键将会被保护:\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\User as UserResource;\r\n\r\n    Route::get(\'/user\', function () {\r\n        return UserResource::collection(User::all()->keyBy->id);\r\n    });\r\n\r\n#### 自定义基础资源类\r\n\r\n通常，资源集合的 `$this->collection` 属性会自动填充，结果是将集合的每个项映射到其单个资源类。假定单一资源类是集合的类名，但结尾没有 `Collection` 字符串。\r\n\r\n例如，`UserCollection` 将给定的用户实例映射到 `User` 资源中。若要自定义此行为，你可以重写资源集合的 `$collects` 属性：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\ResourceCollection;\r\n\r\n    class UserCollection extends ResourceCollection\r\n    {\r\n        /**\r\n         * collects 属性定义了资源类。\r\n         *\r\n         * @var string\r\n         */\r\n        public $collects = \'App\\Http\\Resources\\Member\';\r\n    }\r\n\r\n<a name=\"writing-resources\">\r\n## 编写资源\r\n\r\n> {tip} 如果你还没有阅读 [概念综述](#concept-overview)，那么在继续阅读本文档前，强烈建议你去阅读一下。\r\n\r\n从本质上来说，资源的作用很简单。它们只需要将一个给定的模型转换成一个数组。所以每一个资源都包含一个 `toArray` 方法用来将你的模型属性转换成一个可以返回给用户的 API 友好数组：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\JsonResource;\r\n\r\n    class User extends JsonResource\r\n    {\r\n        /**\r\n         * 将资源转换成数组。\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function toArray($request)\r\n        {\r\n            return [\r\n                \'id\' => $this->id,\r\n                \'name\' => $this->name,\r\n                \'email\' => $this->email,\r\n                \'created_at\' => $this->created_at,\r\n                \'updated_at\' => $this->updated_at,\r\n            ];\r\n        }\r\n    }\r\n\r\n你可以在路由或者控制器中返回已经定义的资源：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\User as UserResource;\r\n\r\n    Route::get(\'/user\', function () {\r\n        return new UserResource(User::find(1));\r\n    });\r\n\r\n#### 关联\r\n\r\n如果你希望在响应中包含关联资源，你只需要将它们添加到 `toArray` 方法返回的数组中。在下面这个例子里，我们将使用 `Post` 资源的 `collection` 方法将用户的文章添加到资源响应中：\r\n\r\n    /**\r\n     * 将资源转换成数组。\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @return array\r\n     */\r\n    public function toArray($request)\r\n    {\r\n        return [\r\n            \'id\' => $this->id,\r\n            \'name\' => $this->name,\r\n            \'email\' => $this->email,\r\n            \'posts\' => PostResource::collection($this->posts),\r\n            \'created_at\' => $this->created_at,\r\n            \'updated_at\' => $this->updated_at,\r\n        ];\r\n    }\r\n\r\n> {tip}  如果你只想在关联已经加载时才添加关联资源，请查看文档 [条件关联](https://learnku.com/docs/laravel/5.7/eloquent-resources/1407#conditional-relationships) 。\r\n\r\n\r\n#### 资源集合\r\n\r\n资源是将单个模型转换成数组，而资源集合是将多个模型的集合转换成数组。所有的资源都提供了一个 `collection` 方法来生成一个 「临时」 资源集合，所以你没有必要为每一个模型类型都编写一个资源集合类：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\User as UserResource;\r\n\r\n    Route::get(\'/user\', function () {\r\n        return UserResource::collection(User::all());\r\n    });\r\n\r\n不过，如果你需要自定义返回集合的元数据，则仍需要定义一个资源集合：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\ResourceCollection;\r\n\r\n    class UserCollection extends ResourceCollection\r\n    {\r\n        /**\r\n         * 将资源集合转换成数组\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function toArray($request)\r\n        {\r\n            return [\r\n                \'data\' => $this->collection,\r\n                \'links\' => [\r\n                    \'self\' => \'link-value\',\r\n                ],\r\n            ];\r\n        }\r\n    }\r\n\r\n和单个资源一样，你可以在路由或控制器中直接返回资源集合：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\UserCollection;\r\n\r\n    Route::get(\'/users\', function () {\r\n        return new UserCollection(User::all());\r\n    });\r\n\r\n<a name=\"data-wrapping\"></a>\r\n### 数据包裹\r\n\r\n默认情况下，当资源响应被转换成 JSON 时，顶层资源将会被包裹在 `data` 键中。因此一个典型的资源集合响应如下所示：\r\n\r\n    {\r\n        \"data\": [\r\n            {\r\n                \"id\": 1,\r\n                \"name\": \"Eladio Schroeder Sr.\",\r\n                \"email\": \"therese28@example.com\",\r\n            },\r\n            {\r\n                \"id\": 2,\r\n                \"name\": \"Liliana Mayert\",\r\n                \"email\": \"evandervort@example.com\",\r\n            }\r\n        ]\r\n    }\r\n\r\n你可以使用资源基类的 `withoutWrapping` 方法来禁用顶层资源的包裹。通常，你应该在  `AppServiceProvider`  或其他在程序每一个请求中都会被加载的 [服务提供者](/docs/{{version}}/providers) 中调用此方法：\r\n\r\n    <?php namespace App\\Providers;\r\n\r\n    use Illuminate\\Support\\ServiceProvider;\r\n    use Illuminate\\Http\\Resources\\Json\\Resource;\r\n\r\n    class AppServiceProvider extends ServiceProvider\r\n    {\r\n        /**\r\n         * 在注册后进行服务的启动\r\n         *\r\n         * @return void\r\n         */\r\n        public function boot()\r\n        {\r\n            Resource::withoutWrapping();\r\n        }\r\n\r\n        /**\r\n         * 在容器中注册绑定\r\n         *\r\n         * @return void\r\n         */\r\n        public function register()\r\n        {\r\n            //\r\n        }\r\n    }\r\n\r\n> {note} `withoutWrapping` 方法只会禁用顶层资源的包裹，不会删除你手动添加到资源集合中的 `data` 键。\r\n\r\n### 包裹嵌套资源\r\n\r\n你可以完全自由地决定资源关联如何被包裹。如果你希望无论怎样嵌套，都将所有资源集合包裹在 `data` 键中，那么你需要为每个资源都定义一个资源集合类，并将返回的集合包裹在 `data` 键中。\r\n\r\n当然，你可能会担心这样顶层资源将会被包裹在两个 `data `键中。请放心， Laravel 将永远不会让你的资源被双层包裹，因此你不必担心被转换的资源集合会被多重嵌套：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\ResourceCollection;\r\n\r\n    class CommentsCollection extends ResourceCollection\r\n    {\r\n        /**\r\n         * 将资源集合转换成数组\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function toArray($request)\r\n        {\r\n            return [\'data\' => $this->collection];\r\n        }\r\n    }\r\n\r\n### 数据包裹和分页\r\n\r\n当在资源响应中返回分页集合时，即使你调用了 `withoutWrapping` 方法， Laravel 也会将你的资源数据包裹在 `data` 键中。这是因为分页响应中总会有 `meta` 和 `links` 键包含着分页状态信息：\r\n\r\n    {\r\n        \"data\": [\r\n            {\r\n                \"id\": 1,\r\n                \"name\": \"Eladio Schroeder Sr.\",\r\n                \"email\": \"therese28@example.com\",\r\n            },\r\n            {\r\n                \"id\": 2,\r\n                \"name\": \"Liliana Mayert\",\r\n                \"email\": \"evandervort@example.com\",\r\n            }\r\n        ],\r\n        \"links\":{\r\n            \"first\": \"http://example.com/pagination?page=1\",\r\n            \"last\": \"http://example.com/pagination?page=1\",\r\n            \"prev\": null,\r\n            \"next\": null\r\n        },\r\n        \"meta\":{\r\n            \"current_page\": 1,\r\n            \"from\": 1,\r\n            \"last_page\": 1,\r\n            \"path\": \"http://example.com/pagination\",\r\n            \"per_page\": 15,\r\n            \"to\": 10,\r\n            \"total\": 10\r\n        }\r\n    }\r\n\r\n<a name=\"pagination\"></a>\r\n### 分页\r\n\r\n你可以将分页实例传递给资源的 `collection` 方法或者自定义的资源集合：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\UserCollection;\r\n\r\n    Route::get(\'/users\', function () {\r\n        return new UserCollection(User::paginate());\r\n    });\r\n\r\n分页响应中总有 `meta` 和 `links` 键包含着分页状态信息：\r\n\r\n    {\r\n        \"data\": [\r\n            {\r\n                \"id\": 1,\r\n                \"name\": \"Eladio Schroeder Sr.\",\r\n                \"email\": \"therese28@example.com\",\r\n            },\r\n            {\r\n                \"id\": 2,\r\n                \"name\": \"Liliana Mayert\",\r\n                \"email\": \"evandervort@example.com\",\r\n            }\r\n        ],\r\n        \"links\":{\r\n            \"first\": \"http://example.com/pagination?page=1\",\r\n            \"last\": \"http://example.com/pagination?page=1\",\r\n            \"prev\": null,\r\n            \"next\": null\r\n        },\r\n        \"meta\":{\r\n            \"current_page\": 1,\r\n            \"from\": 1,\r\n            \"last_page\": 1,\r\n            \"path\": \"http://example.com/pagination\",\r\n            \"per_page\": 15,\r\n            \"to\": 10,\r\n            \"total\": 10\r\n        }\r\n    }\r\n\r\n\r\n<a name=\"conditional-attributes\"></a>\r\n### 条件属性\r\n\r\n有些时候，你可能希望在给定条件满足时添加属性到资源响应里。例如，你可能希望如果当前用户是 「管理员」 时添加某个值到资源响应中。在这种情况下 Laravel 提供了一些辅助方法来帮助你解决问题。 `when` 方法可以被用来有条件地向资源响应添加属性：\r\n\r\n    /**\r\n     * 将资源转换成数组\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @return array\r\n     */\r\n    public function toArray($request)\r\n    {\r\n        return [\r\n            \'id\' => $this->id,\r\n            \'name\' => $this->name,\r\n            \'email\' => $this->email,\r\n            \'secret\' => $this->when(Auth::user()->isAdmin(), \'secret-value\'),\r\n            \'created_at\' => $this->created_at,\r\n            \'updated_at\' => $this->updated_at,\r\n        ];\r\n    }\r\n\r\n在上面这个例子中，只有当 `isAdmin` 方法返回 `true` 时， `secret` 键才会最终在资源响应中被返回。如果该方法返回 `false` ，则 `secret` 键将会在资源响应被发送给客户端之前被删除。 `when` 方法可以使你避免使用条件语句拼接数组，转而用更优雅的方式来编写你的资源。\r\n\r\n`when` 方法也接受闭包作为其第二个参数，只有在给定条件为 `true` 时，才从闭包中计算返回的值：\r\n\r\n    \'secret\' => $this->when(Auth::user()->isAdmin(), function () {\r\n        return \'secret-value\';\r\n    }),\r\n\r\n#### 有条件的合并数据\r\n\r\n有些时候，你可能希望在给定条件满足时添加多个属性到资源响应里。在这种情况下，你可以使用 `mergeWhen` 方法在给定的条件为 `true` 时将多个属性添加到响应中：\r\n\r\n    /**\r\n     * 将资源转换成数组\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @return array\r\n     */\r\n    public function toArray($request)\r\n    {\r\n        return [\r\n            \'id\' => $this->id,\r\n            \'name\' => $this->name,\r\n            \'email\' => $this->email,\r\n            $this->mergeWhen(Auth::user()->isAdmin(), [\r\n                \'first-secret\' => \'value\',\r\n                \'second-secret\' => \'value\',\r\n            ]),\r\n            \'created_at\' => $this->created_at,\r\n            \'updated_at\' => $this->updated_at,\r\n        ];\r\n    }\r\n		\r\n同理，如果给定的条件为 `false` 时，则这些属性将会在资源响应被发送给客户端之前被移除。\r\n\r\n> {note} `mergeWhen` 方法不应该被使用在混合字符串和数字键的数组中。此外，它也不应该被使用在不按顺序排列的数字键的数组中。\r\n\r\n<a name=\"conditional-relationships\"></a>\r\n### 条件关联\r\n\r\n除了有条件地添加属性之外，你还可以根据模型关联是否已加载来有条件地在你的资源响应中包含关联。这允许你在控制器中决定加载哪些模型关联，这样你的资源可以在模型关联被加载后才添加它们。\r\n\r\n这样做可以避免在你的资源中出现 「N+1」 查询问题。你应该使用 `whenLoaded` 方法来有条件的加载关联。为了避免加载不必要的关联，此方法接受关联的名称而不是关联本身作为其参数：\r\n\r\n    /**\r\n     * 将资源转换成数组\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @return array\r\n     */\r\n    public function toArray($request)\r\n    {\r\n        return [\r\n            \'id\' => $this->id,\r\n            \'name\' => $this->name,\r\n            \'email\' => $this->email,\r\n            \'posts\' => PostResource::collection($this->whenLoaded(\'posts\')),\r\n            \'created_at\' => $this->created_at,\r\n            \'updated_at\' => $this->updated_at,\r\n        ];\r\n    }\r\n\r\n在上面这个例子中，如果关联没有被加载，则 `posts` 键将会在资源响应被发送给客户端之前被删除。\r\n\r\n\r\n\r\n#### 条件中间表信息\r\n\r\n除了在你的资源响应中有条件地包含关联外，你还可以使用 `whenPivotLoaded`  方法有条件地从多对多关联的中间表中添加数据。 `whenPivotLoaded` 方法接受的第一个参数为中间表的名称。第二个参数是一个闭包，它定义了在模型上如果中间表信息可用时要返回的值：\r\n\r\n\r\n\r\n    /**\r\n     * 将资源转换成数组\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @return array\r\n     */\r\n    public function toArray($request)\r\n    {\r\n        return [\r\n            \'id\' => $this->id,\r\n            \'name\' => $this->name,\r\n            \'expires_at\' => $this->whenPivotLoaded(\'role_user\', function () {\r\n                return $this->pivot->expires_at;\r\n            }),\r\n        ];\r\n    }\r\n\r\n如果你的中间表使用的是 `pivot` 以外的访问器，你可以使用 `whenPivotLoadedAs`方法：\r\n\r\n    /**\r\n     * 将资源转换成数组\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @return array\r\n     */\r\n    public function toArray($request)\r\n    {\r\n        return [\r\n            \'id\' => $this->id,\r\n            \'name\' => $this->name,\r\n            \'expires_at\' => $this->whenPivotLoadedAs(\'subscription\', \'role_user\', function () {\r\n                return $this->subscription->expires_at;\r\n            }),\r\n        ];\r\n    }\r\n\r\n\r\n\r\n<a name=\"adding-meta-data\"></a>\r\n### 添加元数据\r\n\r\n一些 JSON API 标准需要你在资源和资源集合响应中添加元数据。这通常包括资源或相关资源的 `links` ，或一些关于资源本身的元数据。如果你需要返回有关资源的其他元数据，只需要将它们包含在 `toArray` 方法中即可。例如在转换资源集合时你可能需要添加 `links` 信息：\r\n\r\n\r\n\r\n    /**\r\n     * 将资源转换成数组\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @return array\r\n     */\r\n    public function toArray($request)\r\n    {\r\n        return [\r\n            \'data\' => $this->collection,\r\n            \'links\' => [\r\n                \'self\' => \'link-value\',\r\n            ],\r\n        ];\r\n    }\r\n\r\n\r\n当添加额外的元数据到你的资源中时，你不必担心会覆盖 Laravel 在返回分页响应时自动添加的 `links` 或 `meta` 键。你添加的任何其他 `links` 会与分页响应添加的 `links` 相合并。\r\n\r\n#### 顶层元数据\r\n\r\n有时候你可能希望当资源被作为顶层资源返回时添加某些元数据到资源响应中。这通常包括整个响应的元信息。你可以在资源类中添加 `with` 方法来定义元数据。此方法应返回一个元数据数组，当资源被作为顶层资源渲染时，这个数组将会被包含在资源响应中：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\ResourceCollection;\r\n\r\n    class UserCollection extends ResourceCollection\r\n    {\r\n        /**\r\n         * 将资源集合转换成数组\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function toArray($request)\r\n        {\r\n            return parent::toArray($request);\r\n        }\r\n\r\n        /**\r\n         * 返回应该和资源一起返回的其他数据数组\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function with($request)\r\n        {\r\n            return [\r\n                \'meta\' => [\r\n                    \'key\' => \'value\',\r\n                ],\r\n            ];\r\n        }\r\n    }\r\n\r\n#### 构造资源时添加元数据\r\n\r\n你还可以在路由或者控制器中构造资源实例时添加顶层数据。所有资源都可以使用 `additional` 方法来接受应该被添加到资源响应中的数据数组：\r\n\r\n    return (new UserCollection(User::all()->load(\'roles\')))\r\n                    ->additional([\'meta\' => [\r\n                        \'key\' => \'value\',\r\n                    ]]);\r\n\r\n<a name=\"resource-responses\"></a>\r\n## 响应资源\r\n\r\n就像你知道的那样， 资源可以直接在路由和控制器中被返回：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\User as UserResource;\r\n\r\n    Route::get(\'/user\', function () {\r\n        return new UserResource(User::find(1));\r\n    });\r\n\r\n但有些时候，在发送给客户端前你可能需要自定义 HTTP 响应。 你有两种办法。第一，你可以在链式上调用 `response` 方法。此方法将会返回  `Illuminate\\Http\\Response` 实例，允许你自定义响应头信息：\r\n\r\n    use App\\User;\r\n    use App\\Http\\Resources\\User as UserResource;\r\n\r\n    Route::get(\'/user\', function () {\r\n        return (new UserResource(User::find(1)))\r\n                    ->response()\r\n                    ->header(\'X-Value\', \'True\');\r\n    });\r\n\r\n另外，你还可以在资源中定义一个 `withResponse` 方法。此方法将会在资源被作为顶层资源在响应时被调用：\r\n\r\n    <?php namespace App\\Http\\Resources;\r\n\r\n    use Illuminate\\Http\\Resources\\Json\\JsonResource;\r\n\r\n    class User extends JsonResource\r\n    {\r\n        /**\r\n         * 资源转换成数组\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @return array\r\n         */\r\n        public function toArray($request)\r\n        {\r\n            return [\r\n                \'id\' => $this->id,\r\n            ];\r\n        }\r\n\r\n        /**\r\n         * 自定义响应\r\n         *\r\n         * @param  \\Illuminate\\Http\\Request  $request\r\n         * @param  \\Illuminate\\Http\\Response  $response\r\n         * @return void\r\n         */\r\n        public function withResponse($request, $response)\r\n        {\r\n            $response->header(\'X-Value\', \'True\');\r\n        }\r\n    }', 21, 0, 'laravel', '2019-12-31 16:01:00', '2020-12-03 16:31:02', NULL, 0);
INSERT INTO `articles` VALUES (13, 7, 1, '阅读清单', '', 'Reading list', 0, '#### 收藏文章\r\n* 2020/4/16        [redis 实时更新排行榜](https://learnku.com/articles/30279)\r\n* 2020/4/17        [Jenkins代码自动化部署](https://jenkins.io/zh/solutions/php/)\r\n* 2020/4/23        [Go学习文档](https://learnku.com/docs/the-way-to-go/preface/3561)\r\n* 2020/4/26        [Laravel 开发最佳实践](https://learnku.com/articles/42563)\r\n* 2020/4/28         [深入理解AMQP协议](https://blog.csdn.net/weixin_37641832/article/details/83270778)\r\n* 2020/5/11         [推送技术——个推技术实现原理介绍](https://www.cnblogs.com/evakang/p/3756489.html)\r\n* 2020/6/45         [什么是枚举](https://baike.baidu.com/item/%E6%9E%9A%E4%B8%BE%E7%B1%BB%E5%9E%8B/2978296)\r\n* 2020/07/05      [git提交 emoji ⚽](https://blog.csdn.net/qq_41005535/article/details/80999062)\r\n* 2020/07/10      [oracle数据操作入门](https://www.w3cschool.cn/oraclejc/oraclejc-elp62qqx.html)\r\n* 2020/07/21     [宝塔lnmp下 tp项目除首页 404 解决](https://blog.csdn.net/fzxyxf1314/article/details/85124106)\r\n* 2020/09/15  [ngin详解](https://www.runoob.com/w3cnote/nginx-setup-intro.html)', 144, 0, '文章,置顶', '2020-04-16 09:55:37', '2021-04-09 13:42:11', NULL, 1);
INSERT INTO `articles` VALUES (14, 8, 1, '通过gd库实现头像按比例放大缩小？？？', '', 'PHP interface image upload, native implementation of thumbnail class', 1, '### php接口图片上传,原生实现缩略图类 ?\r\n-----------------------------------------------------\r\n> 注意检查是否安装GD库\r\n#### 1.创建一个 `UpdateImage` 类,并给它定义一些变量\r\n```php\r\n<?php\r\n/**\r\n * Created by PhpStorm\r\n * User: pl\r\n * Date: 2020/4/15\r\n * Time: 10:04\r\n */\r\n\r\nnamespace app\\common\\Service;\r\n\r\n\r\nuse think\\Request;\r\n\r\nclass UpdateImage\r\n{\r\n\r\n    /**\r\n     * 图片处理类\r\n     */\r\n\r\n    //文件类型判断\r\n    protected $img_type = [\'image/png\', \'image/jpeg\', \'image/jpg\', \'image/gif\'];\r\n    //单例模式\r\n    public static $instance = null;\r\n    //缩小比例\r\n    protected $percent = 0.5;\r\n    //图片超过这个大小进行缩略显示\r\n    protected $size = 1000;\r\n    //保存$_FILES的变量\r\n    protected $file;\r\n    //图片自定义名称默认为空\r\n    protected $file_name;\r\n    //图片生成后缀\r\n    protected $type = \'png\';\r\n    //是否使用缩略图\r\n    protected $status;\r\n\r\n    //返回的接口信息\r\n    protected $result_data = [\r\n        \'code\' => \'000000\',\r\n        \'err_msg\' => \'\',\r\n        \'data\' => []\r\n    ];\r\n\r\n    protected $images;\r\n    //图片上传后的地址\r\n    protected $filename;\r\n\r\n\r\n    /**\r\n     * UpdateImage constructor.\r\n     * @param $file_name 文件名\r\n     * @param $status 是否缩略图\r\n     * @param $percent 倍数\r\n     */\r\n\r\n\r\n    public function __construct($file_name, $status, $percent)\r\n    {\r\n        $this->percent = $percent;   //比例\r\n        $this->file = $_FILES;      //处理文件对象\r\n        $this->file_name = $file_name; //自定义文件名\r\n        $this->status = $status;    //是否使用缩略图\r\n    }\r\n\r\n    /**\r\n     * @param $file_name\r\n     * @param $status\r\n     * @param $percent\r\n     * @return null\r\n     * 单例模式\r\n     */\r\n    public static function getInstance($file_name, $status, $percent)\r\n    {\r\n\r\n        if (is_null(static::$instance)) {\r\n            static::$instance = new self($file_name, $status, $percent);\r\n        }\r\n        return static::$instance;\r\n    }\r\n\r\n\r\n    /**\r\n     * @param string $name\r\n     * @return $this|array|bool\r\n     * 图片处理\r\n     */\r\n\r\n    public function save()\r\n    {\r\n        $file = $this->file;\r\n\r\n        if (empty($file)) return false;\r\n\r\n        $tmp_name = $file[\'cover\'][\'tmp_name\'];\r\n\r\n        if (!in_array($file[\'cover\'][\'type\'], $this->img_type)) {\r\n            $this->result_data[\'err_msg\'] = \'请上传正确的文件格式\';\r\n            $this->result_data[\'code\'] = \'200005\';\r\n            return $this->img_type;\r\n        }\r\n        $uploads = \'uploads\';\r\n\r\n        if (!file_exists($uploads)) {\r\n            mkdir($uploads, 0777, true);\r\n\r\n        }\r\n        $fileUrl = $uploads . \'/\' . date(\'Y\') . \'/\' . date(\'m\') . \'/\' . date(\'d\');\r\n\r\n        if (!file_exists($fileUrl)) {\r\n\r\n            mkdir($fileUrl, 0777, true);\r\n\r\n        }\r\n\r\n        $fileName = explode(\'.\', $file[\'cover\'][\'name\']);\r\n        $fileName = array_pop($fileName);\r\n        $this->type = $fileName;\r\n        $fileName = $fileUrl . \'/\' . time() . \'_\' . $this->file_name . \'.\' . $fileName;\r\n\r\n        move_uploaded_file($tmp_name, $fileName);\r\n        $this->filename = $fileName;\r\n\r\n\r\n        if ($this->status == 1) {\r\n            if ($file[\'cover\'][\'size\'] > $this->size) {\r\n                return $this->compress_img($this->file_name);\r\n            }\r\n        }\r\n\r\n        return $this;\r\n    }\r\n\r\n\r\n    /**\r\n     * @return $this\r\n     */\r\n\r\n    protected function compress_img()\r\n    {\r\n        header(\"content-type:image/png\");\r\n\r\n        list($width, $height) = getimagesize($this->filename);\r\n\r\n\r\n        $new_width = $width * $this->percent;\r\n        $new_height = $height * $this->percent;\r\n\r\n        $image_p = imagecreatetruecolor($new_width, $new_height);\r\n\r\n        switch ($this->type) {\r\n            case \'jpeg\':\r\n                $image = imagecreatefromjpeg($this->filename);\r\n                break;\r\n            case \'gif\':\r\n                $image = imagecreatefromgif($this->filename);\r\n                break;\r\n            case \'png\':\r\n                $image = imagecreatefrompng($this->filename);\r\n                break;\r\n            case \'jpg\':\r\n                $image = $image = imagecreatefromjpeg($this->filename);\r\n                break;\r\n        }\r\n\r\n        imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);\r\n\r\n        $uploads = \'uploads\';\r\n        $fileUrl = $uploads . \'/\' . date(\'Y\') . \'/\' . date(\'m\') . \'/\' . date(\'d\');\r\n        $fileUrl = $fileUrl . \'/\' . time() . $this->file_name . \'.png\';\r\n\r\n        switch ($this->type) {\r\n            case \'jpeg\':\r\n                imagejpeg($image_p, $fileUrl);\r\n                break;\r\n            case \'gif\':\r\n                imagegif($image_p, $fileUrl);\r\n                break;\r\n            case \'png\':\r\n                imagepng($image_p, $fileUrl);\r\n                break;\r\n            case \'jpg\':\r\n                imagejpeg($image_p, $fileUrl);\r\n                break;\r\n        }\r\n        imagedestroy($image_p);\r\n        unlink($this->filename);\r\n        $this->filename = $fileUrl;\r\n        return $this;\r\n\r\n    }\r\n\r\n    public function return_coverage()\r\n    {\r\n\r\n    }\r\n\r\n\r\n    /**\r\n     * @return bool|string\r\n     * 获取处理结果\r\n     */\r\n    public function get()\r\n    {\r\n        if (empty($this->filename)) return false;\r\n        $request = Request::instance();\r\n        $this->result_data[\'data\'] = $request->domain() . \'/\' . $this->filename;\r\n        return $this->result_data;\r\n    }\r\n\r\n\r\n    public static function thumb($file_url, $size)\r\n    {\r\n\r\n        try {\r\n            $imarr = getimagesize($file_url);\r\n            list($width, $height) = getimagesize($file_url);\r\n            $size = explode(\"x\", $size);\r\n\r\n            $save_width = $size[0];\r\n            $save_height = $size[1];\r\n            if($save_width!=$save_height){\r\n                return json_encode([\r\n                    \'code\' => \'200005\',\r\n                    \'err_msg\' => \'不符合规格\',\r\n                    \'data\' => []\r\n                ]);\r\n            }\r\n            switch ($imarr[\'mime\']) {\r\n                case \'image/jpeg\':\r\n                    $image = imagecreatefromjpeg($file_url);\r\n                    break;\r\n                case \'image/gif\':\r\n                    $image = imagecreatefromgif($file_url);\r\n                    break;\r\n                case \'image/png\':\r\n                    $image = imagecreatefrompng($file_url);\r\n                    break;\r\n                case \'image/jpg\':\r\n                    $image = $image = imagecreatefromjpeg($file_url);\r\n                    break;\r\n            }\r\n            $dst_im  = imagecreatetruecolor($save_width,$save_height);\r\n\r\n            $red  =  imagecolorallocate ( $dst_im ,  14 ,  14 ,  14 );\r\n            imagefill ( $dst_im ,  0 ,   0 ,  $red );\r\n\r\n            imagecopyresized($dst_im, $image, 0, 0, 0, 0, $save_width, $save_height, $width, $height);\r\n            ob_end_clean();\r\n            switch ($imarr[\'mime\']) {\r\n                case \'image/jpeg\':\r\n                    header(\"content-type:image/jpeg\");\r\n                    imagejpeg($dst_im);\r\n                    break;\r\n                case \'image/gif\':\r\n                    header(\"content-type:image/gif\");\r\n                    imagegif($dst_im);\r\n                    break;\r\n                case \'image/png\':\r\n                    header(\"content-type:image/png\");\r\n                    imagepng($dst_im);\r\n                    break;\r\n                case \'image/jpg\':\r\n                    header(\"content-type:image/jpg\");\r\n                    imagejpeg($dst_im);\r\n                    break;\r\n                default:\r\n                    header(\"content-type:image/png\");\r\n                    imagepng($dst_im);\r\n                    break;\r\n            }\r\n            imagedestroy($dst_im);\r\n            imagedestroy($image);\r\n        }catch (\\Exception $exception){\r\n            return json_encode([\r\n                \'code\' => \'200006\',\r\n                \'err_msg\' => \'请输入合格参数\',\r\n                \'data\' => []\r\n            ]);\r\n        }\r\n    }\r\n}\r\n```\r\n#### 6.最后如何上传呢?\r\n```php\r\n $fileurl = UpdateImage::getInstance($file_name,$status,$percent)->save()->get();\r\n```\r\n\r\n> 最后接口返回 :relaxed:\r\n\r\n\r\n```JSON\r\n{\r\n    \"code\": \"000000\",\r\n    \"err_msg\": \"000000:\",\r\n    \"data\": \"http://at.test/uploads/2020/04/17/1587108251test.png\"\r\n}\r\n```', 97, 0, 'php', '2020-04-17 07:30:49', '2021-04-09 07:14:20', NULL, 0);
INSERT INTO `articles` VALUES (15, 7, 1, 'Redis', '', 'Redis', 1, '# Redis\r\n\r\n- [简介](#introduction)\r\n    - [配置](#configuration)\r\n    - [Predis](#predis)\r\n    - [PhpRedis](#phpredis)\r\n- [Redis 交互](#interacting-with-redis)\r\n    - [管道命令](#pipelining-commands)\r\n- [发布 / 订阅](#pubsub)\r\n\r\n<a name=\"introduction\"></a>\r\n## 简介\r\n\r\n[Redis](https://redis.io) 是一个开源的，高级键值对存储数据库。由于它包含 [字符串](https://redis.io/topics/data-types#strings), [哈希](https://redis.io/topics/data-types#hashes), [列表](https://redis.io/topics/data-types#lists), [集合](https://redis.io/topics/data-types#sets), 和 [有序集合](https://redis.io/topics/data-types#sorted-sets) 这些数据类型，所以它通常被称为数据结构服务器。\r\n\r\n在使用 Laravel 的 Redis 之前，你需要通过 Composer 安装 `predis/predis` 扩展包：\r\n\r\n    composer require predis/predis\r\n\r\n或者，你也可以通过 PECL 安装 [PhpRedis](https://github.com/phpredis/phpredis) PHP 扩展。这个扩展安装起来比较复杂，但对于大量使用 Redis 的应用程序来说可能会产生更好的性能。\r\n\r\n<a name=\"configuration\"></a>\r\n### 配置\r\n\r\nLaravel 应用的 Redis 配置都在配置文件 `config/database.php` 中。在这个文件里，你可以看到 `redis` 数组里包含了应用程序使用的 Redis 服务器信息：\r\n\r\n    \'redis\' => [\r\n\r\n        \'client\' => \'predis\',\r\n\r\n        \'default\' => [\r\n            \'host\' => env(\'REDIS_HOST\', \'127.0.0.1\'),\r\n            \'password\' => env(\'REDIS_PASSWORD\', null),\r\n            \'port\' => env(\'REDIS_PORT\', 6379),\r\n            \'database\' => env(\'REDIS_DB\', 0),\r\n        ],\r\n\r\n        \'cache\' => [\r\n            \'host\' => env(\'REDIS_HOST\', \'127.0.0.1\'),\r\n            \'password\' => env(\'REDIS_PASSWORD\', null),\r\n            \'port\' => env(\'REDIS_PORT\', 6379),\r\n            \'database\' => env(\'REDIS_CACHE_DB\', 1),\r\n        ],\r\n\r\n    ],\r\n\r\n默认的服务器配置应该足以进行开发。当然，你也可以根据使用的环境来随意更改这个数组。只需在配置文件中给每个 Redis 服务器指定名称、host（主机）和 port（端口）即可。\r\n\r\n#### 集群配置\r\n\r\n如果你的应用使用 Redis 服务器集群，你应该在 Redis 配置文件中使用 `clusters` 键来定义这些集群：\r\n\r\n    \'redis\' => [\r\n\r\n        \'client\' => \'predis\',\r\n\r\n        \'clusters\' => [\r\n            \'default\' => [\r\n                [\r\n                    \'host\' => env(\'REDIS_HOST\', \'localhost\'),\r\n                    \'password\' => env(\'REDIS_PASSWORD\', null),\r\n                    \'port\' => env(\'REDIS_PORT\', 6379),\r\n                    \'database\' => 0,\r\n                ],\r\n            ],\r\n        ],\r\n\r\n    ],\r\n\r\n默认情况下，集群可以在节点上实现客户端分片，允许你实现节点池以及创建大量可用内存。这里要注意，客户端共享不会处理失败的情况；因此，这个功能主要适用于从另一个主数据库获取的缓存数据。如果要使用 Redis 原生集群，需要在配置文件下的 `options` 键中做出如下指定： \r\n\r\n    \'redis\' => [\r\n\r\n        \'client\' => \'predis\',\r\n\r\n        \'options\' => [\r\n            \'cluster\' => \'redis\',\r\n        ],\r\n\r\n        \'clusters\' => [\r\n            // ...\r\n        ],\r\n\r\n    ],\r\n\r\n<a name=\"predis\"></a>\r\n### Predis\r\n\r\n除了默认的 `host`, `port`, `database`, 和 `password` 这些服务配置选项外，Predis 还支持为每个 Redis 服务器定义其它的链接参数 [connection parameters](https://github.com/nrk/predis/wiki/Connection-Parameters) 。如果要使用这些额外的配置选项，可以将以下配置添加到 Redis 服务器的配置文件 `config/database.php` 中：\r\n\r\n    \'default\' => [\r\n        \'host\' => env(\'REDIS_HOST\', \'localhost\'),\r\n        \'password\' => env(\'REDIS_PASSWORD\', null),\r\n        \'port\' => env(\'REDIS_PORT\', 6379),\r\n        \'database\' => 0,\r\n        \'read_write_timeout\' => 60,\r\n    ],\r\n\r\n\r\n\r\n<a name=\"phpredis\"></a>\r\n### PhpRedis\r\n\r\n要使用 PhpRedis 扩展，需要将配置文件 `config/database.php` 中 Redis 配置的 `client` 选项修改为 `phpredis`：\r\n\r\n    \'redis\' => [\r\n\r\n        \'client\' => \'phpredis\',\r\n\r\n        // 其余的Redis配置...\r\n    ],\r\n\r\n除了默认的 `host`， `port`， `database` 和 `password` 这些服务配置选项外，PhpRedis 还支持以下几个额外的连接参数： `persistent`， `prefix`， `read_timeout` 和 `timeout` 。你可以将这些配置选项添加到配置文件 `config/database.php` 中 Redis 服务配置项下：\r\n\r\n    \'default\' => [\r\n        \'host\' => env(\'REDIS_HOST\', \'localhost\'),\r\n        \'password\' => env(\'REDIS_PASSWORD\', null),\r\n        \'port\' => env(\'REDIS_PORT\', 6379),\r\n        \'database\' => 0,\r\n        \'read_timeout\' => 60,\r\n    ],\r\n\r\n<a name=\"interacting-with-redis\"></a>\r\n## Redis交互\r\n\r\n你可以通过调用 `Redis` [facade](/docs/{{version}}/facades)上的各种方法来与Redis 交互。`Redis` facade 支持动态方法，意味着你可以在 facade 上调用各种 [Redis 命令](https://redis.io/commands) ，命令将直接传递给 Redis。在示例中，将通过 `Redis` facade 上的 `get` 方法来调用 Redis上的 `GET` 命令：\r\n\r\n    <?php\r\n\r\n    namespace App\\Http\\Controllers;\r\n\r\n    use App\\Http\\Controllers\\Controller;\r\n    use Illuminate\\Support\\Facades\\Redis;\r\n\r\n    class UserController extends Controller\r\n    {\r\n        /**\r\n         * 显示给定用户的配置文件。\r\n         *\r\n         * @param  int  $id\r\n         * @return Response\r\n         */\r\n        public function showProfile($id)\r\n        {\r\n            $user = Redis::get(\'user:profile:\'.$id);\r\n\r\n            return view(\'user.profile\', [\'user\' => $user]);\r\n        }\r\n    }\r\n\r\n如上所述，你可以在 `Redis` facade 上调用任意 Redis 命令。Laravel 使用魔术方法将命令传递给 Redis 服务器，因此只需传递 Redis 命令所需的参数即可：\r\n\r\n    Redis::set(\'name\', \'Taylor\');\r\n\r\n    $values = Redis::lrange(\'names\', 5, 10);\r\n\r\n或者，你也可以使用 `command` 方法将命令传递给服务器，它接受命令的名称作为其第一个参数，并将值的数组作为其第二个参数：\r\n\r\n    $values = Redis::command(\'lrange\', [\'name\', 5, 10]);\r\n\r\n#### 使用多个 Redis 连接\r\n\r\n你可以通过 `Redis::connection` 方法获得 Redis 实例：\r\n\r\n    $redis = Redis::connection();\r\n\r\n这会返回一个默认的 Redis 实例。你可以传递连接或者集群名称给 `connection` 方法来获取在 Redis 配置中特定服务或集群：\r\n\r\n    $redis = Redis::connection(\'my-connection\');\r\n\r\n<a name=\"pipelining-commands\"></a>\r\n### 管道命令\r\n\r\n当你需要在一个操作中给服务器发送很多命令时，推荐你使用管道命令。 `pipeline` 方法接受一个 Redis 实例的 `闭包` 。你可以将所有的命令发送给 Redis 实例，它们都会在一个操作中执行完成：\r\n\r\n    Redis::pipeline(function ($pipe) {\r\n        for ($i = 0; $i < 1000; $i++) {\r\n            $pipe->set(\"key:$i\", $i);\r\n        }\r\n    });\r\n\r\n\r\n\r\n<a name=\"pubsub\"></a>\r\n## 发布与订阅\r\n\r\nLaravel 为 Redis 的 `publish` 及 `subscribe` 提供了方便的接口。这些 Redis 命令让你可以监听指定「频道」上的消息。你可以从另一个应用程序发布消息给另一个应用程序，甚至使用其它编程语言，让应用程序和进程之间能够轻松进行通信。\r\n\r\n首先，我们使用 `subscribe` 方法设置频道监听器。我们将这个方法调用放在 [Artisan 命令](/docs/{{version}}/artisan) 中，因为调用 `subscribe` 方法会启动一个长时间运行的进程：\r\n\r\n    <?php\r\n\r\n    namespace App\\Console\\Commands;\r\n\r\n    use Illuminate\\Console\\Command;\r\n    use Illuminate\\Support\\Facades\\Redis;\r\n\r\n    class RedisSubscribe extends Command\r\n    {\r\n        /**\r\n         * 控制台命令的名称和签名。\r\n         *\r\n         * @var string\r\n         */\r\n        protected $signature = \'redis:subscribe\';\r\n\r\n        /**\r\n         * 控制台命令说明。\r\n         *\r\n         * @var string\r\n         */\r\n        protected $description = \'Subscribe to a Redis channel\';\r\n\r\n        /**\r\n         * 执行控制台命令。\r\n         *\r\n         * @return mixed\r\n         */\r\n        public function handle()\r\n        {\r\n            Redis::subscribe([\'test-channel\'], function ($message) {\r\n                echo $message;\r\n            });\r\n        }\r\n    }\r\n\r\n现在我们可以使用 `publish` 方法将消息发布到频道：\r\n\r\n    Route::get(\'publish\', function () {\r\n        // 路由...\r\n\r\n        Redis::publish(\'test-channel\', json_encode([\'foo\' => \'bar\']));\r\n    });\r\n\r\n#### 通配符订阅\r\n\r\n使用 `psubscribe` 方法可以订阅通配符频道，可以用来在所有频道上获取所有消息。 `$channel` 名称将作为第二个参数传递给提供的回调 `闭包`:\r\n\r\n    Redis::psubscribe([\'*\'], function ($message, $channel) {\r\n        echo $message;\r\n    });\r\n\r\n    Redis::psubscribe([\'users.*\'], function ($message, $channel) {\r\n        echo $message;\r\n    });', 3, 0, 'laravel', '2020-04-19 03:23:15', '2020-06-22 02:48:38', NULL, 0);
INSERT INTO `articles` VALUES (16, 9, 1, '基于 swoole 下 异步队列和毫秒定时任务 API', 'images/{79492864-0a6a-4c6c-b66d-cb6a7200dfc2}_MDB-Developer-Newsletter-Email-Banner.png', 'Asynchronous queue API based on swoole', 0, '- [说明 ](#introduction)\r\n\r\n\r\n1.在 Server 程序中如果需要执行很耗时的操作，比如一个聊天服务器发送广播，Web 服务器中发送邮件。如果直接去执行这些函数就会阻塞当前进程，导致服务器响应变慢。\r\nSwoole 提供了异步任务处理的功能，可以投递一个异步任务到 `TaskWorker` 进程池中执行，不影响当前请求的处理速度。(官网说明)\r\n- [当我们使用定时任务时说明: ](#introduction1)\r\n\r\n\r\n\r\n\r\n#### 1. 服务端代码\r\n> 执行服务端监听端口`9501`。通过设置`daemonize`这个参数，以守护进程在系统去维护这个`TaskWorker`进程池。我们客户端将消息传递给服务端，服务端异步将数据请求放入进程池队列运行，从大大缩短了响应时间。\r\n\r\n\r\n```\r\n<?php /**\r\n * Created by PhpStorm\r\n * User: pl\r\n * Date: 2020/5/22\r\n * Time: 15:23\r\n */\r\n\r\n\r\nclass TaskServer\r\n{\r\n    private $server;\r\n\r\n    public function __construct()\r\n    {\r\n        $this->server = new Swoole\\Server(\'127.0.0.1\', 9501);\r\n        $this->server->set([\r\n            \'task_worker_num\' => 3,     //开启的进程数 一般为cup核数 1-4倍\r\n            \'daemonize\' => 1,     //已守护进程执行该程序\r\n            \'max_request\' => 10000,  //worker进程最大任务数\r\n            \'dispatch_mode\' => 2,        //设置为争抢模式\r\n            \'task_ipc_mode\' => 3,     //设置为消息队列模式\r\n        ]);\r\n        $this->server->on(\'Receive\', array($this, \'onReceive\'));\r\n        $this->server->on(\'Task\', array($this, \'onTask\'));\r\n        $this->server->on(\'Finish\', array($this, \'onFinish\'));\r\n        $this->server->start();\r\n    }\r\n\r\n\r\n    public function onReceive(swoole_server $server, $fd, $form_id, $data)\r\n    {\r\n        $this->server->task($data);\r\n    }\r\n\r\n    /**\r\n     * @param swoole_server $server\r\n     * @param $fd\r\n     * @param $from_id\r\n     * @param $data\r\n     *  执行异步任务\r\n     */\r\n    public function onTask($server, $fd, $from_id, $data)\r\n    {\r\n        $data = json_decode($data, true);\r\n        try {\r\n\r\n            $log_txt = date(\'Y-m-d H:i:s\') . \"开始执行任务\" . PHP_EOL;\r\n            $this->log($log_txt);\r\n            $type = $data[\'data\'][\'type\'];\r\n            $time = intval($data[\'data\'][\'timing\']);\r\n            unset($data[\'data\'][\'timing\']);\r\n            unset($data[\'data\'][\'type\']);\r\n            if (intval($type) == 1) {\r\n                $this->request_curl($data[\'url\'], $data[\'data\'], $data[\'data\'][\'http_type\']);\r\n            } else {\r\n                Swoole\\Timer::after($time, function () use ($data) {\r\n                    $this->request_curl($data[\'url\'], $data[\'data\'], $data[\'data\'][\'http_type\']);\r\n                });\r\n            }\r\n        } catch (\\Exception $exception) {\r\n            $log_txt = date(\'Y-m-d H:i:s\') . \"执行任务失败发生错误\" . PHP_EOL;\r\n            $this->log($log_txt);\r\n        }\r\n    }\r\n\r\n\r\n    public function onFinish($server, $task_id, $data)\r\n    {\r\n        $log_txt = date(\'Y-m-d H:i:s\') . \"$data\" . PHP_EOL;\r\n        $this->log($log_txt);\r\n    }\r\n\r\n    public function request_curl($url = \'\', $request_data = \'\', $request_type = \'get\', $headers = [], $is_ssl = false)\r\n    {\r\n        $ch = curl_init(); //curl初始化\r\n        if ($request_type == \'get\' && !empty($request_data)) {\r\n            $num = 0;\r\n            foreach ($request_data as $key => $value) {\r\n                if ($num == 0) {\r\n                    $url .= \'?\' . $key . \'=\' . $value;\r\n                } else {\r\n                    $url .= \'&\' . $key . \'=\' . $value;\r\n                }\r\n                $num++;\r\n            }\r\n            $num = 0;\r\n        }\r\n        //区分get和post\r\n        curl_setopt($ch, CURLOPT_URL, $url); //URL地址\r\n        curl_setopt($ch, CURLOPT_HEADER, 0); //头信息不输出\r\n        //如果成功只将结果返回，不自动输出任何内容\r\n        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);\r\n        //post类型就实现此结果\r\n        if ($request_type == \'post\') {\r\n            //设置为POST方式\r\n            curl_setopt($ch, CURLOPT_POST, 1);\r\n            //POST数据\r\n            curl_setopt($ch, CURLOPT_POSTFIELDS, $request_data);\r\n            //当post数据大于1024时强制执行\r\n            curl_setopt($ch, CURLOPT_HTTPHEADER, array(\"Expect:\"));\r\n        }\r\n        //判断是否绕过证书\r\n        if ($is_ssl) {\r\n            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//绕过ssl验证\r\n            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);\r\n        }\r\n        if (!empty($headers)) curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);\r\n        $result = curl_exec($ch); //执行\r\n        if ($result == FALSE) return false;\r\n        curl_close($ch); //关闭资源\r\n        return $result;\r\n    }\r\n    public function log($log_txt)\r\n    {\r\n        $log = \'log/\' . date(\'Y_m_d\') . \'log\';\r\n        if (!file_exists($log)) {\r\n            touch($log);\r\n            chown($log, 0777);\r\n        }\r\n        $file_log = fopen($log, \"a\");\r\n        fputs($file_log, $log_txt);\r\n        fclose($file_log);\r\n    }\r\n}\r\n\r\n\r\n$task = new TaskServer();\r\n```\r\n#### 2.客户端代码\r\n```\r\n<?php const API_KEY = \'xxx\';\r\n\r\nclass ClientRequest\r\n{\r\n    private $client;\r\n    private $params; //请求参数\r\n\r\n    public function __construct($params)\r\n    {\r\n        $this->client = new swoole_client(SWOOLE_SOCK_TCP | SWOOLE_KEEP);\r\n        $this->params = $params;\r\n    }\r\n\r\n    public function connect()\r\n    {\r\n        if (!$this->client->connect(\'127.0.0.1\', 9501, 1)) {\r\n            return json_encode([\r\n                \'code\' => 500,\r\n                \'err_msg\' => \'链接异步客户端失败\'\r\n            ]);\r\n        }\r\n        /**\r\n         * 注意请求格式\r\n         * $params[\'url\'] 接口地址\r\n         * $params[\'type\']接口请求方式\r\n         * $params[\'data\']参数\r\n         */\r\n        $params = $this->params;\r\n        $array[\'url\'] = $params[\'url\'];\r\n        unset($params[\'url\']);\r\n        $array[\'data\'] = $params;\r\n        $this->client->send(json_encode($array, JSON_UNESCAPED_UNICODE));\r\n    }\r\n}\r\n\r\n\r\nif($_SERVER[\'REQUEST_METHOD\']!=\'POST\')  throw new ErrorException(\'路由不存在\',\'404\');\r\n\r\nif(!array_key_exists(\'HTTP_TOKEN\',$_SERVER)){\r\n    header(\'Content-type: application/json\');\r\n    echo json_encode([\'code\'=>\'200007\',\'token is not empty\']);exit();\r\n}\r\nif($_SERVER[\'HTTP_TOKEN\']!= API_KEY )  {\r\n    header(\'Content-type: application/json\');\r\n    echo json_encode([\'code\'=>\'200007\',\'error token\']);exit();\r\n}\r\n\r\n\r\n$params = $_POST;\r\n\r\n\r\n$client = new ClientRequest($params);\r\n$client->connect();\r\n\r\n\r\n```\r\n>开始执行服务端程序,`php TaskServer.php`我们以接口形式上去调用另外一个耗时接口.简单对比一下响应速度。\r\n\r\n\r\n\r\n\r\n![基于 swoole 下 异步队列 API](https://cdn.learnku.com/uploads/images/202004/26/32593/6Kyklub1MV.png!large)\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n![基于 swoole 下 异步队列 API](https://cdn.learnku.com/uploads/images/202004/26/32593/0TOVJI0Urm.png!large)\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n![基于 swoole下 异步队列API](https://cdn.learnku.com/uploads/images/202004/26/32593/2ojVK7GIdn.png!large)\r\n\r\n\r\n\r\n\r\n>最后补充:基于swoole 一个简单的异步队列就完成了。可以将此队列封装成api队列接口，将它丢到task里面去慢慢执行吧~哈哈\r\n<a name=\"introduction1\"></a>\r\n#### 补充新增的一次定时器任务，支持毫秒级\r\n\r\n#### 3.定时任务和异步接口\r\n\r\n\r\n##### 说明:\r\n\r\n\r\n>\r\n> 1、在swoole 中 毫秒【如 1000 表示 1 秒，v4.2.10 以下版本最大不得超过 86400000【一天】】\r\n> 2、后台定时器操作接口：操作方法如下\r\n> 当操作时间在一天内 则直接执行定时器\r\n> 3、大于一天时 \r\n> 系统执行一个定时crontab任务 ->\r\n> 每隔12-24小时 运行一次 将数据库执行接口时间大于当前时间且不超过一天的数据数据执行该接口\r\n> 关 于用户执行撤销则通过推送数据接口去判断该数据是否进行推送\r\n> 4、当该需要给执行接口添加参数时 直接将参数放入接口\r\n>\r\n\r\n###  接口文档\r\n\r\n`ClientRequest.php`\r\n\r\n\r\n##### 请求方法 `post`\r\n\r\n\r\n##### 参数\r\n\r\n\r\n| 参数         | 是否必选 | 备注         | 限制 | 新增 |\r\n| -----------| -------- | ---------   | ---- | ---- |\r\n|  token     |是         | 密钥【header】`xxxx`       |      |      |\r\n|  url         |是         | 执行接口的地址       |      |      |\r\n|  type       |是         | 1、异步执行该接口 2、定时执行该接口    |      |      |\r\n|  http_type|是         | get、post    |      |      |\r\n|  timing   |否         | 定时执行该接口的时间 单位【毫秒】    |      |      |\r\n\r\n\r\n\r\n\r\n```\r\n​', 135, 0, 'swoole', '2020-04-26 07:04:39', '2021-04-09 07:16:46', NULL, 0);
INSERT INTO `articles` VALUES (17, 7, 1, 'rabbitmq 安装文档', '', 'rabbitmq Installation documentation', 1, '#### rabbitmq 安装文档\r\n  * 底层基于Erlang\r\n  * 先安装\r\n\r\n### [原文地址](https://blog.csdn.net/qq_37651267/article/details/104413546)\r\n##### 1.安装Erlang\r\n````php\r\nrpm -Uvh https://download.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm\r\n \r\nyum -y install erlang\r\n\r\n````\r\n\r\n##### 2.安装RabbitMq\r\n```php\r\nwget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.6/rabbitmq-server-3.6.6-1.el7.noarch.rpm\r\n或\r\nyum -y install rabbitmq-server-3.6.6-1.el7.noarch.rpm\r\n\r\n```\r\n\r\n##### 3.启动RabbitMq\r\n```php\r\nsystemctl status rabbitmq-server\r\n```\r\n\r\n##### 4.查看RabbitMq状态\r\n```php\r\nsystemctl status rabbitmq-server\r\n```\r\n##### 5.停止RabbitMq服务\r\n```php\r\nsystemctl stop rabbitmq-server\r\n```\r\n##### 6.RabbitMq默认自带一个账号为 guest， 密码也为guest的用户，但是只能本机访问，如果需要在其他服务器访问，需要添加配置文件，默认没有，按照官方推荐方式直接复制一份\r\n```php\r\ncd /etc/rabbitmq\r\n \r\ncp /usr/share/doc/rabbitmq-server-3.6.6/rabbitmq.config.example rabbitmq.config\r\n\r\n```\r\n\r\n##### 7.其他\r\n```php\r\n列出用户：rabbitmqctl list_users\r\n新建用户rabbitmqctl add_user xxx pwd\r\n删除用户:rabbitmqctl delete_user xxx\r\n改密码:rabbimqctlchange_password {guest} {123456}\r\n设置用户角色：rabbitmqctl set_user_tags {username} {tag ...}\r\nTag可以为 administrator,monitoring, management\r\n\r\n```', 40, 0, 'AMQP', '2020-05-09 06:33:30', '2020-12-14 09:43:19', NULL, 0);
INSERT INTO `articles` VALUES (18, 8, 1, 'apche服务器下无后缀文件配置浏览器访问自动下载', '', 'Apche server under the suffix-free file configuration browser access automatically downloaded', 1, '#### 1.在配置最新的[IOS app 微信授权登录时](https://developers.weixin.qq.com/doc/oplatform/Mobile_App/Access_Guide/iOS.html) SDK时，碰到一个[问题](https://www.cnblogs.com/GJ-ios/p/9583141.html)。服务器端需要配置IOS唤起微信APP授权的通用链接地址。\r\n#### 2.关于[通用链接](https://search.developer.apple.com/appsearch-validation-tool/)\r\n#### 3. 必须将ios的配置文件放入网址根目录下的`apple-app-site-association`文件。文件必须没有后缀且浏览器端访问时，会自动下载\r\n\r\n> 讲到自动下载，我们就想到了http响应 我们加上响应头 `application/octet-stream` 它能帮我们实现文件的访问下载功能 给mime类型文件设置该响应头，就能实现文件的下载，那么如何配置没有后缀名的文件实现访问下载呢?我们找到apche 的配置文件`httpd.conf` \r\n>\r\n\r\n#### 4.找到这段代码 这是`mime_module设置 具体我们可以看apche conf 下的 `mime.types`文件\r\n```\r\n<IfModule mime_module>\r\n    #\r\n    # TypesConfig points to the file containing the list of mappings from\r\n    # filename extension to MIME-type.\r\n    #\r\n    TypesConfig conf/mime.types\r\n    #AddType application/octet-stream  text/plain\r\n    #\r\n    # AddType allows you to add to or override the MIME configuration\r\n    # file specified in TypesConfig for specific file types.\r\n    #\r\n    AddType application/x-gzip .tgz\r\n\r\n```\r\n>在它的尾部加入,防止被覆盖\r\n```\r\n<IfModule mime_module>\r\n.....\r\n</IfModule>\r\n<FilesMatch \"^[^.]+$\">\r\n    ForceType application/octet-stream\r\n</FilesMatch>\r\n\r\n```\r\n\r\n>假如我们需要设置其它文件下载，则打开`mime.types` 找到这段代码。将我们需要下载的文件后缀放入 并重启apche\r\n\r\n```\r\napplication/octet-stream	bin dms lrf mar so dist distz pkg bpk dump elc deploy \r\n```', 53, 0, '分享', '2020-05-15 05:21:12', '2021-02-24 20:58:24', NULL, 0);
INSERT INTO `articles` VALUES (19, 6, 1, '关于最近写RBAC模型权限的思路设计', '', 'The idea design of writing RBAC model permission recently', 1, '### 1. ` RABC`权限系统说明 \r\n\r\n#### 是基于角色访问控制管理控制模型 相信对于web开发的同学肯定并不陌生。RABC是一个后台管理系统的基石。\r\n\r\n### 2.RABC模型\r\n\r\n> rabc 基于三个模块部分组成 :用户、角色、权限。rabc用过角色赋予权限，并将相对应的角色赋予给用户，这样用户就可以通过所赋予角色的权限，对后台的一些模块进行操作与管理。\r\n\r\n*  用户【user】:可以登录的管理人员或用户 ，并且会被赋予不同的角色\r\n*  角色【role】:每个不同的角色有不同的权限\r\n*  权限【permission】:通过权限来判断用户的那些action可以被执行\r\n*  中间件-用户-角色 一个用户可能会被赋予多个角色\r\n*  中间件-角色-权限 一个角色可能会被赋予多种权限\r\n![](https://note.youdao.com/yws/res/231/WEBRESOURCE3fe70ba3bf5ced43250d8f8e99d91c7f)\r\n### 3.RABC模型的优点和缺点\r\n* 逻辑设计简洁易用，清晰明了，易于维护和扩展\r\n* 不适合过于对操作流程严苛的系统\r\n\r\n### 4.RABC数据表设计\r\n![](https://shuwoom.oss-cn-beijing.aliyuncs.com/rbac%E6%95%B0%E6%8D%AE%E5%BA%93%E8%AE%BE%E8%AE%A1.png)', 46, 0, '文章', '2020-05-30 13:05:48', '2021-02-22 02:31:33', NULL, 0);
INSERT INTO `articles` VALUES (20, 8, 1, '基于token的多平台身份认证架构设计【转】', '', '基于token的多平台身份认证架构设计', 1, '[基于token的多平台身份认证架构设计](https://cloud.tencent.com/developer/article/1351749)', 28, 0, '分享', '2020-06-05 07:36:31', '2021-03-08 00:46:23', NULL, 0);
INSERT INTO `articles` VALUES (21, 8, 1, 'ios授权登录 php端效验', '', 'ios授权登录 php端效验', 0, '### ios授权登录 php端效验\r\n\r\n* 编写校验类\r\n\r\n```\r\n<?php\r\n/**\r\n * Created by PhpStorm\r\n * User: pl\r\n * Date: 2020/6/5\r\n * Time: 17:06\r\n */\r\n\r\nnamespace app\\common\\Service;\r\n\r\n\r\nuse think\\Config;\r\nuse think\\Exception;\r\n\r\n\r\nclass AppleAuth\r\n{\r\n\r\n\r\n    protected static $supported_algs = array(\r\n        \'HS256\' => array(\'hash_hmac\', \'SHA256\'),\r\n        \'HS512\' => array(\'hash_hmac\', \'SHA512\'),\r\n        \'HS384\' => array(\'hash_hmac\', \'SHA384\'),\r\n        \'RS256\' => array(\'openssl\', \'SHA256\'),\r\n        \'RS384\' => array(\'openssl\', \'SHA384\'),\r\n        \'RS512\' => array(\'openssl\', \'SHA512\'),\r\n    );\r\n\r\n    private     $result_data = [\r\n        \'code\' => \'000000\',\r\n        \'err_msg\' => \'\',\r\n        \'data\' => []\r\n    ];\r\n\r\n\r\n    /**\r\n     * 效验苹果信息\r\n     * @param $userID\r\n     * @param $identityToken\r\n     * @param $authorizationCode\r\n     * @return array\r\n     */\r\n\r\n    public function ValidationAppleInfo($userID,$identityToken,$authorizationCode,$type)\r\n    {\r\n\r\n        $result_data = $this->result_data;\r\n        $jwt_token_array = explode(\'.\', $identityToken);\r\n\r\n        //头部信息\r\n        $header = json_decode(base64_decode($jwt_token_array[0]),true);\r\n\r\n        //payload 消息体\r\n        $payload = json_decode(base64_decode($jwt_token_array[1]),true);\r\n\r\n        $jwt_sign = $jwt_token_array[2];\r\n\r\n        if ($userID != $payload[\'sub\']) {\r\n            $result_data[\'code\'] = \'200032\';\r\n            $result_data[\'err_msg\'] = \'用户唯一凭证不一致\';\r\n            return $result_data;\r\n        }\r\n\r\n        if(time()>$payload[\'exp\']){\r\n            $result_data[\'code\'] = \'200032\';\r\n            $result_data[\'err_msg\'] = \'identityToken 已过期\';\r\n            return $result_data;\r\n        }\r\n\r\n        //https://appleid.apple.com/auth/keys\r\n        $public_key_url = Config::get(\'apple_login.public_key_url\');\r\n\r\n        $appley_keys = request_curl($public_key_url,[],\'get\');\r\n        $appley_keys = json_decode($appley_keys, TRUE);\r\n        if(!$appley_keys){\r\n            $result_data[\'code\'] = \"200032\";\r\n            $result_data[\'err_msg\'] = \"获取苹果公钥失败\";\r\n            return $result_data;\r\n        }\r\n\r\n\r\n        $the_apple_key = [];\r\n\r\n        foreach($appley_keys[\'keys\'] as $key){\r\n            if($key[\'kid\'] == $header[\'kid\'] ){\r\n                $the_apple_key = $key;\r\n            }\r\n        }\r\n\r\n        $pem = self::createPemFromModulusAndExponent($the_apple_key[\'n\'],$the_apple_key[\'e\']);\r\n\r\n        $pKey = openssl_pkey_get_public($pem);\r\n        $publicKeyDetails  = openssl_pkey_get_details($pKey);\r\n\r\n\r\n        if( $pKey === FALSE ){\r\n            $result_data[\'err_msg\'] = \"生成苹果pem失败\";\r\n            return  $result_data;\r\n        }\r\n\r\n        $pub_key = $publicKeyDetails[\'key\']; //公钥\r\n        $alg = $header[\'alg\'];\r\n\r\n        $ok = self::verify(\"$jwt_token_array[0].$jwt_token_array[1]\",static::urlsafeB64Decode($jwt_sign),$pub_key,$alg);\r\n\r\n        if(!$ok) {\r\n            $result_data[\'code\'] = \"200032\";\r\n            $result_data[\'err_msg\'] = \"苹果登录签名校验失败\";\r\n            return  $result_data;\r\n        }\r\n\r\n        return  $result_data;\r\n\r\n    }\r\n\r\n    /**\r\n     *\r\n     * Create a public key represented in PEM format from RSA modulus and exponent information\r\n     *\r\n     * @param string $n the RSA modulus encoded in Base64\r\n     * @param string $e the RSA exponent encoded in Base64\r\n     * @return string the RSA public key represented in PEM format\r\n     */\r\n    protected static function createPemFromModulusAndExponent($n, $e)\r\n    {\r\n        $modulus = static::urlsafeB64Decode($n);\r\n        $publicExponent = static::urlsafeB64Decode($e);\r\n\r\n        $components = array(\r\n            \'modulus\' => pack(\'Ca*a*\', 2, self::encodeLength(strlen($modulus)), $modulus),\r\n            \'publicExponent\' => pack(\'Ca*a*\', 2, self::encodeLength(strlen($publicExponent)), $publicExponent)\r\n        );\r\n\r\n        $RSAPublicKey = pack(\r\n            \'Ca*a*a*\',\r\n            48,\r\n            self::encodeLength(strlen($components[\'modulus\']) + strlen($components[\'publicExponent\'])),\r\n            $components[\'modulus\'],\r\n            $components[\'publicExponent\']\r\n        );\r\n\r\n        // sequence(oid(1.2.840.113549.1.1.1), null)) = rsaEncryption.\r\n        $rsaOID = pack(\'H*\', \'300d06092a864886f70d0101010500\'); // hex version of MA0GCSqGSIb3DQEBAQUA\r\n        $RSAPublicKey = chr(0) . $RSAPublicKey;\r\n        $RSAPublicKey = chr(3) . self::encodeLength(strlen($RSAPublicKey)) . $RSAPublicKey;\r\n\r\n        $RSAPublicKey = pack(\r\n            \'Ca*a*\',\r\n            48,\r\n            self::encodeLength(strlen($rsaOID . $RSAPublicKey)),\r\n            $rsaOID . $RSAPublicKey\r\n        );\r\n\r\n        $RSAPublicKey = \"-----BEGIN PUBLIC KEY-----\\r\\n\" .\r\n            chunk_split(base64_encode($RSAPublicKey), 64) .\r\n            \'-----END PUBLIC KEY-----\';\r\n\r\n        return $RSAPublicKey;\r\n    }\r\n\r\n\r\n    /**\r\n     * Decode a string with URL-safe Base64.\r\n     *\r\n     * @param string $input A Base64 encoded string\r\n     *\r\n     * @return string A decoded string\r\n     */\r\n    protected static function urlsafeB64Decode($input)\r\n    {\r\n        $remainder = strlen($input) % 4;\r\n        if ($remainder) {\r\n            $padlen = 4 - $remainder;\r\n            $input .= str_repeat(\'=\', $padlen);\r\n        }\r\n        return base64_decode(strtr($input, \'-_\', \'+/\'));\r\n    }\r\n\r\n    /**\r\n     * DER-encode the length\r\n     *\r\n     * DER supports lengths up to (2**8)**127, however, we\'ll only support lengths up to (2**8)**4.  See\r\n     * {@link http://itu.int/ITU-T/studygroups/com17/languages/X.690-0207.pdf#p=13 X.690 paragraph 8.1.3} for more information.\r\n     *\r\n     * @access private\r\n     * @param int $length\r\n     * @return string\r\n     */\r\n    protected static function encodeLength($length)\r\n    {\r\n        if ($length <= 0x7F) {\r\n            return chr($length);\r\n        }\r\n\r\n        $temp = ltrim(pack(\'N\', $length), chr(0));\r\n        return pack(\'Ca*\', 0x80 | strlen($temp), $temp);\r\n    }\r\n\r\n    /**\r\n     * Get the number of bytes in cryptographic strings.\r\n     *\r\n     * @param string\r\n     *\r\n     * @return int\r\n     */\r\n    protected static function safeStrlen($str)\r\n    {\r\n        if (function_exists(\'mb_strlen\')) {\r\n            return mb_strlen($str, \'8bit\');\r\n        }\r\n        return strlen($str);\r\n    }\r\n\r\n    /**\r\n     * Verify a signature with the message, key and method. Not all methods\r\n     * are symmetric, so we must have a separate verify and sign method.\r\n     *\r\n     * @param string            $msg        The original message (header and body)\r\n     * @param string            $signature  The original signature\r\n     * @param string|resource   $key        For HS*, a string key works. for RS*, must be a resource of an openssl public key\r\n     * @param string            $alg        The algorithm\r\n     *\r\n     * @return bool\r\n     *\r\n     * @throws DomainException Invalid Algorithm or OpenSSL failure\r\n     */\r\n    protected static function verify($msg, $signature, $key, $alg)\r\n    {\r\n        if (empty(static::$supported_algs[$alg])) {\r\n            throw new Exception(\'Algorithm not supported\');\r\n        }\r\n\r\n        list($function, $algorithm) = static::$supported_algs[$alg];\r\n        switch($function) {\r\n            case \'openssl\':\r\n                $success = openssl_verify($msg, $signature, $key, $algorithm);\r\n                if ($success === 1) {\r\n                    return true;\r\n                } elseif ($success === 0) {\r\n                    return false;\r\n                }\r\n                // returns 1 on success, 0 on failure, -1 on error.\r\n                throw new Exception(\r\n                    \'OpenSSL error: \' . openssl_error_string()\r\n                );\r\n            case \'hash_hmac\':\r\n            default:\r\n                $hash = hash_hmac($algorithm, $msg, $key, true);\r\n                if (function_exists(\'hash_equals\')) {\r\n                    return hash_equals($signature, $hash);\r\n                }\r\n                $len = min(static::safeStrlen($signature), static::safeStrlen($hash));\r\n\r\n                $status = 0;\r\n                for ($i = 0; $i < $len; $i++) {\r\n                    $status |= (ord($signature[$i]) ^ ord($hash[$i]));\r\n                }\r\n                $status |= (static::safeStrlen($signature) ^ static::safeStrlen($hash));\r\n\r\n                return ($status === 0);\r\n        }\r\n    }\r\n\r\n\r\n}\r\n```', 79, 0, 'php', '2020-06-11 01:13:48', '2021-03-08 13:34:41', NULL, 0);
INSERT INTO `articles` VALUES (22, 6, 1, '在上述编写的模型类中，模型类与数据表是如何映射的呢', '', '在上述编写的模型类中，模型类与数据表是如何映射的呢', 1, '在上述编写的模型类中，模型类与数据表是如何映射的呢？这个由 go-mysql-driver 底层实现，每次从数据库查询到结果之后，可以通过 Scan 方法将数据表字段值映射到对应的结构体模型类，而将模型类保存到数据库时，又可以基于字段映射关系将结构体属性值转化为对应的数据表字段值。对应的底层交互逻辑如下所示：\r\n\r\n模型类与数据库映射\r\n\r\n\r\n再次重申，本项目旨在帮助大家快速熟悉 Go Web 项目的完整开发流程和代码组织架构，具体的技术实现细节留到后面单独的数据库模块详细介绍，不过，如果你之前有过其他语言的 Web 开发经验，比如 PHP、Python、Java，基本上看一眼这些代码就能知道个大概了，因为他们的实现思路都是相通的，无非是语言的语法不同而已，所以这也是学院君反复强调新人应该花个三五年时间先精通一门语言，再学习其他语言的原因。\r\n\r\n底层数据库交互逻辑定义好了之后，接下来，我们就可以编写上层实现代码了，下一篇学院君将给大家演示在线论坛项目上层路由和处理器方法的实现。', 14, 0, 'Go', '2020-07-05 14:22:10', '2020-08-25 14:06:15', NULL, 0);
INSERT INTO `articles` VALUES (23, 7, 1, '在window10上使用laradock安装你的php docker集成环境 完美体验linux and mac 编程', '', '在window10上使用laradock安装你的php docker集成环境 完美体验linux and mac 编程', 1, '#### 中文文档：\r\nhttps://laradock.linganmin.cn/\r\n安装好docker 后', 41, 0, 'docker', '2020-03-27 12:39:29', '2021-04-09 07:14:17', NULL, 0);
INSERT INTO `articles` VALUES (24, 8, 1, 'tp6跨域问题解决', '', 'Access to XMLHttpRequest at xxx by CORS', 1, '#### 最近在用tp6 写一个前后端分离的项目 遇到的跨域问题  原因tp自带的跨域中间件 不生效\r\n\r\n\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200901225528605.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n\r\n##### 新建一个跨域中间件  问题解决\r\n \r\n```php\r\n  /**\r\n     * 设置跨域\r\n     * @param $request\r\n     * @param \\Closure $next\r\n     * @return mixed|void\r\n     */\r\n    public function handle($request, \\Closure $next)\r\n    {\r\n        header(\'Access-Control-Allow-Origin: *\');\r\n        header(\'Access-Control-Max-Age: 1800\');\r\n        header(\'Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE\');\r\n        header(\'Access-Control-Allow-Headers: Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-CSRF-TOKEN, X-Requested-With, Token\');\r\n        if (strtoupper($request->method()) == \"OPTIONS\") {\r\n            return Response::create()->send();\r\n        }\r\n        return $next($request);\r\n    }\r\n		\r\n```\r\n\r\n##### 为啥tp 自带的跨域中间件 不生效\r\n\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200901225906794.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n\r\n\r\n\r\n> tp6的跨域中间件 会判断请求头的数据是否为空 在将跨域的请求头合并写入 其他条件不会写入 我们也可以在此修改 不过一般不该动框架 则加一个中间件即可 \r\n\r\n\r\n```php\r\npublic function handle($request, Closure $next, ?array $header = [])\r\n    {\r\n    // tp 会判断请求头的数据是否为空 在将跨域的请求头合并写入 其他条件不会写入 我们也可以在此修改 不过一般不该动框架 则加一个中间件即可\r\n        $header = !empty($header) ? array_merge($this->header, $header) : $this->header;\r\n\r\n        if (!isset($header[\'Access-Control-Allow-Origin\'])) {\r\n            $origin = $request->header(\'origin\');\r\n\r\n            if ($origin && (\'\' == $this->cookieDomain || strpos($origin, $this->cookieDomain))) {\r\n                $header[\'Access-Control-Allow-Origin\'] = $origin;\r\n            } else {\r\n                $header[\'Access-Control-Allow-Origin\'] = \'*\';\r\n            }\r\n        }\r\n\r\n        return $next($request)->header($header);\r\n    }\r\n```', 9, 0, 'php', '2020-01-16 15:18:26', '2020-12-20 06:55:43', NULL, 0);
INSERT INTO `articles` VALUES (25, 8, 1, 'websocket h5控制 pc 大屏 进行协同操作', '', 'websocket h5控制 pc 大屏 进行协同操作', 0, '####  接到产品需求单 ，哎说多都是累 这几天接口写个没停? 今天捣鼓一下这个需求\r\n>需求简要说明：客户找我们做的pc端可视化大屏 需要扫码 到 h5端移动端控制pc端大屏 移动端当然也是一个网页 一对一操控 分n个大屏 于是我快速梳理了一下需求 将结果完成之后做一个小小的总结：上图\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200902220453697.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n\r\n##### 整个流程用到的技术 前端 、websocket、redis 、workerman（原因使用方便 不限环境）\r\n>项目是前后端分离的 将逻辑梳理清楚后 工作量也就不大了 前后端对半开\r\n##### 下载 workerman [官网文档](http://doc.workerman.net/install/install.html)\r\n```php\r\n//composer 安装\r\ncomposer require workerman/workerman\r\n```\r\n##### 编写推送的websocket文件\r\n```php\r\n<?php\r\n/**\r\n * Created by PhpStorm\r\n * User: pl\r\n * Date: 2020/9/2\r\n * Time: 10:46\r\n */\r\nuse Workerman\\Worker;\r\n\r\nrequire_once \'./Autoloader.php\';\r\n\r\n$worker = new Worker(\"websocket://0.0.0.0:2345\");\r\n\r\n//开启的worker进程\r\n$worker->count = 4;\r\n\r\n//前端连接发送的消息数据\r\n$worker->onMessage = function ($connection,$data){\r\n    $redis = new \\Redis();\r\n    $redis->connect(\'127.0.0.1\',\'6379\');\r\n    $redis->select(2);\r\n    //前端发送过来的唯一值 绑定连接的id\r\n    $redis->set($connection->id,$data);\r\n    $connection->send(\'已连接服务\');\r\n};\r\n\r\n$worker->onWorkerStart = function ($ws_worker) {\r\n\r\n    \\Workerman\\Timer::add(1,function () use($ws_worker){\r\n        foreach($ws_worker->connections as $connection) {\r\n\r\n            $redis = new \\Redis();\r\n            $queue = \"nan_ling_\";\r\n            $redis->connect(\'127.0.0.1\',\'6379\');\r\n            $redis->select(2);\r\n            //获取消费的队列\r\n            $rpop_list = $redis->get($connection->id);\r\n            //消费路由数据\r\n            if(!$rpop_list){\r\n\r\n            }else{\r\n                $queue = $queue.$rpop_list;\r\n                $value = $redis->rPop($queue);\r\n                if(!is_null($value)){\r\n                     //推送给前端\r\n                    $connection->send($value);\r\n                }\r\n            }\r\n        }\r\n    });\r\n};\r\n\r\n//监听断开连接\r\n$worker->onClose = function ($connection){\r\n    $redis = new \\Redis();\r\n    $redis->connect(\'127.0.0.1\',\'6379\');\r\n    $redis->auth(\'\');\r\n    $redis->select(2);\r\n    // 删除连接的唯一值\r\n    $redis->del($connection->id);\r\n    echo \"connection closed\\n\".$connection->id;\r\n};\r\n\r\nWorker::runAll();\r\n\r\n```\r\n\r\n##### 二、h5更新路由接口\r\n```php\r\n/**\r\n * 将用户信息写入队列\r\n * @param Request $request\r\n * @throws \\think\\Exception\r\n */\r\n\r\npublic function updateRoute(Request $request)\r\n{\r\n    $db = new Redis();\r\n     //扫码获取的唯一值\r\n    $client_sn = $request->header(\"issue\");\r\n\r\n    if(!$client_sn) {\r\n        return $this->error([],\'请重新扫码\',500);\r\n    }\r\n    $data = $request->put();\r\n  \r\n    //组装队列名\r\n    $queue = self::$table.$client_sn;\r\n    //将点击的路由放入队列\r\n    $db->redis->rPush($queue,json_encode($data,JSON_UNESCAPED_UNICODE));\r\n\r\n    return $this->success([]);\r\n\r\n}\r\n\r\n```\r\n##### 执行文件\r\n```\r\nphp h5_remote.php start\r\n```\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200902220313511.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n\r\n#### 测试一下结果 完成这两个接口 其他的由前端去折腾吧～～\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200902220327775.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200902220341220.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n\r\n\r\n##### 小伙伴们其他好点想法可以底下留言哟～～～:relaxed::relaxed::relaxed:', 47, 0, 'websocket,workerman', '2020-09-02 13:41:17', '2021-03-03 07:54:51', NULL, 0);
INSERT INTO `articles` VALUES (26, 7, 1, '前后端分离下 博客接入 gitee、github、微博 第三方登录', '', '前后端分离下 博客接入 gitee、github、微博 第三方登录', 0, '#### 今天将博客的第三方登录写了一下 博客是前后端分离的 前端vue+后端laravel 我在这里会一步步教大家如何理解 aouth 形式的授权登录\r\n\r\n###### 完成效果图\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/2020091400003518.gif#pic_center)\r\n###### 项目地址 可以的话帮忙点个 `star` ?\r\n[博客前端地址](https://github.com/pl1998/vue-blog.git)\r\n[博客后端地址](https://github.com/pl1998/latent-blog-api.git)\r\n##### aouth登录大概的流程图\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913231842779.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n> 如何申请应用如下\r\n> \r\n * [github应用创建地址](https://github.com/settings/developers)\r\n * [gitee应用创建地址](https://gitee.com/oauth/applications)\r\n * [微博应用创建地址](https://open.weibo.com/)\r\n\r\n\r\n#### 在流程中因为是前后端分离\r\n\r\n\r\n* 前端拿到key和回调地址去请求授权地址 执行第一步 去拿授权code\r\n* 后端拿到code 去取access_token 并且拿到用户信息\r\n* 判断有无该用户授权信息 有则读 无则写 并且给用户颁发token 并且进行回调给前端\r\n* 前端拿到token 请求接口去取用户数据 整个登录流程完成\r\n\r\n\r\n\r\n\r\n\r\n\r\n```java\r\n\r\n\r\n<a v-title=\"`登录`\"></a>\r\n\r\n<script>\r\n   //登录方法 写在methods里面 如果只是前端不是vue 为function方法即可\r\n   login(){\r\n   //关键 方法打开一个新页面请求这个地址 其实 process.env.GITEE_CLIENT_ID 和process.env.REDIRECT_URI 写在配置文件中\r\n    window.open(\'https://gitee.com/oauth/authorize?client_id=\'+process.env.GITEE_CLIENT_ID+\'&redirect_uri=\'+process.env.REDIRECT_URI+\'&response_type=code\')\r\n          //监听回调方法 方法文档地址：https://developer.mozilla.org/zh-CN/docs/Web/API/EventTarget/addEventListener\r\n          window.addEventListener(\'message\', function (e) {\r\n          //e.data 就是后端颁发的token\r\n          //执行vuex里面的方法 可以理解拿到了token 去请求获取用户信息的接口\r\n          store.dispatch(\'loginByOauth\',e.data)\r\n            }, false)\r\n            this.show = false\r\n              }\r\n</script>\r\n```\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913233336916.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n#### 后端接口需要做的就是其他部分了    回调接口\r\n\r\n\r\n\r\n  ```php\r\n   /**\r\n     * 微博授权登录地址\r\n     * @param Request $request\r\n     * @param WeiBoOauth $oauth\r\n     */\r\n    public function handleWeiBoCallback(Request  $request, WeiBoOauth $oauth)\r\n    {\r\n       //微博回调code \r\n        $code = $request->get(\'code\');\r\n         //根据code 拿access_token\r\n        $result = $oauth->getAccessToken($code);\r\n        $result = $result->getBody()->getContents();\r\n        $result = json_decode($result,true);\r\n        $access_token = $result[\'access_token\'];\r\n        $userInfo = $oauth->getUserInfo($access_token);\r\n        $userInfo = json_decode($userInfo->getBody()->getContents(),true);\r\n        //判断用户是否存在\r\n        $user = User::query()->where(\'wb_id\',$userInfo[\'id\'])->first();\r\n       //不存在写入table\r\n        if(empty($user)) {\r\n            $user = User::query()->create([\r\n                \'wb_id\' => $userInfo[\'id\'],\r\n                \'name\' => $userInfo[\'name\'],\r\n                \'github_name\' => $userInfo[\'screen_name\'],\r\n                \'avatar\' => $userInfo[\'avatar_large\'],\r\n                \'user_json\' => json_encode($userInfo),\r\n                \'bound_oauth\' => 3\r\n            ]);\r\n        }\r\n        //颁发token\r\n        $token = Auth::guard(\'api\')->login($user);\r\n         //这一步是关键 通过后端的这个页面将token进行回调\r\n        return view(\'loading\', [\r\n            \'token\' => $token,\r\n            \'domain\' => env(\'APP_CALLBACK\',\'https://pltrue.top/\'),\r\n        ]);\r\n    }\r\n  ```\r\n	\r\n	\r\n	\r\n  ####  获取access_token方法\r\n \r\n```\r\n\r\n\r\n    public function getAccessToken($code)\r\n    {\r\n\r\n        $client_id     = env(\'WEIBO_CLIENT_ID\');\r\n        $client_secret = env(\'WEIBO_CLIENT_SECRET\');\r\n        $redirect_uri  = env(\'WEIBO_REDIRECT_URL\');\r\n\r\n        $url = sprintf(\'https://api.weibo.com/oauth2/access_token?client_id=%s&client_secret=%s&grant_type=authorization_code&code=%s&redirect_uri=%s\',$client_id,$client_secret,$code,$redirect_uri);\r\n\r\n        $client = new Client();\r\n\r\n        return  $client->post($url);\r\n\r\n    }\r\n```\r\n\r\n   ####  获取用户信息方法\r\n\r\n\r\n\r\n```\r\n\r\n\r\n    /**\r\n     * 获取用户uid\r\n     * @param $access_token\r\n     * @return mixed\r\n     */\r\n    public function getUid($access_token)\r\n    {\r\n        $url = \"https://api.weibo.com/oauth2/get_token_info?access_token=\".$access_token;\r\n        $client = new Client();\r\n        $result =  $client->post($url);\r\n        $result = json_decode($result->getBody()->getContents(),true);\r\n        return $result[\'uid\'];\r\n\r\n    }\r\n\r\n    /**\r\n     * 获取用户信息\r\n     * @param $access_token\r\n     */\r\n    public function getUserInfo($access_token)\r\n    {\r\n        $uid = $this->getUid($access_token);\r\n        $url = \'https://api.weibo.com/2/users/show.json?uid=\'.$uid.\'&access_token=\'.$access_token;\r\n        $client = new Client();\r\n        return $client->get($url);\r\n    }\r\n    \r\n```\r\n##### 关键的回调页面\r\n````html\r\n<div style=\"text-align: center;margin: 100px auto;height: 500px;width: 400px\">授权登陆中...</div>\r\n<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script><script>\r\n\r\n    window.onload = function () {\r\n       //窗口通信函数api 将token发送给前一个页面 文档说明地址 https://developer.mozilla.org/zh-CN/docs/Web/API/Window/postMessage\r\n        window.opener.postMessage(\"bearer {{ $token }}\", \"{{ $domain }}\");\r\n        window.close();\r\n    }\r\n</script>\r\n````\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/2020091323431782.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70#pic_center)\r\n##### 整个流程ok！', 48, 0, '前端,vue,扩展包', '2020-09-13 16:18:41', '2021-03-09 03:05:20', NULL, 0);
INSERT INTO `articles` VALUES (27, 9, 1, 'laradock 中如何启动swoole扩展', '', 'laradock 中如何启动swoole扩展', 0, '## laradock 中如何启动swoole扩展\r\n\r\n### 在 `.env`中修改一下参数为 `true`\r\n```php\r\nPHP_FPM_INSTALL_SWOOLE = true\r\nPHP_WORKER_INSTALL_SWOOLE=true\r\n```\r\n### 重构镜像\r\n\r\n```shell\r\ndocker-compose build workspace php-fpm\r\n```\r\n\r\n\r\n\r\n### 在`php.ini`文件中加入\r\n\r\n```\r\nextension=swoole.so\r\n```\r\n\r\n###  进入`php-fpm`容器\r\n\r\n```shell\r\ndocker-compose exec php-fpm  bash\r\n\r\n//查看是否安装swoole扩展\r\nphp -m\r\n\r\n//查看swoole 一些配置开启问题\r\nphp --ri swoole\r\n\r\n//关闭参数\r\n-----------------------------------------------$:\r\nSwoole => enabled\r\nAuthor => Swoole Team <team@swoole.com>\r\nVersion => 4.5.4\r\nBuilt => Sep 20 2020 01:04:23\r\ncoroutine => enabled\r\nepoll => enabled\r\neventfd => enabled\r\nsignalfd => enabled\r\ncpu_affinity => enabled\r\nspinlock => enabled\r\nrwlock => enabled\r\nzlib => 1.2.11\r\nmutex_timedlock => enabled\r\npthread_barrier => enabled\r\nfutex => enabled\r\nasync_redis => enabled\r\n\r\nDirective => Local Value => Master Value\r\nswoole.enable_coroutine => On => On\r\nswoole.enable_library => On => On\r\nswoole.enable_preemptive_scheduler => Off => Off\r\nswoole.display_errors => On => On\r\nswoole.use_shortname => Off => Off\r\nswoole.unixsock_buffer_size => 8388608 => 8388608\r\n```\r\n### 关闭参数在`php.ini`中加入\r\n\r\n```php\r\nswoole.use_shortname = off\r\n\r\n//重启php\r\n\r\nservice php-fpm reload //注意php-fpm是绝对路径\r\n```', 65, 0, 'swoole,docker', '2020-09-20 05:50:33', '2021-03-07 05:12:23', NULL, 0);
INSERT INTO `articles` VALUES (28, 7, 1, '我写了一个第三方登录的php扩展包', '', '我写了一个第三方登录的php扩展包', 0, '### \r\n > [具体可看这篇文章](https://pltrue.top/article/26/23c3c90be6721df0a1d50b96a27dcba6) 基于自己的博客项目 已在自己的项目中使用 下面是扩展包的用法\r\n\r\n<h1> thirdparty_oauth </h1>\r\n\r\n<p> 这是一个社会第三方登录扩展包 目前支持 github gitee 微博 gitlab QQ 微信 登录.</p>\r\n\r\n[![Build Status](https://travis-ci.org/pl1998/thirdparty_oauth.svg?branch=master)](https://travis-ci.org/pl1998/thirdparty_oauth)\r\n![StyleCI build status](https://github.styleci.io/repos/295677202/shield)\r\n\r\n## 安装\r\n\r\n```shell\r\n$ composer require pltrue/thirdparty_oauth \r\n```\r\n\r\n<hr>\r\n\r\n## 贡献\r\n你可以通过以下三种方式做出贡献:\r\n\r\n1. bug反馈   [issue tracker](https://github.com/pl1998/thirdparty_oauth/issues).\r\n2. 回答问题或修复错误 [issue tracker](https://github.com/pl1998/thirdparty_oauth/issues).\r\n3. 贡献新特性或更新wiki。\r\n\r\n## 兼容\r\n> * 支持php >=5.6 \r\n\r\n## 如何使用\r\n\r\n> * [php项目中如何使用?](#测试1)\r\n> * [在Thinkphp中如何使用?](#测试2)\r\n> * [在laravel中如何使用?](#测试3)\r\n\r\n\r\n<hr>\r\n\r\n## 如何申请应用授权？\r\n    \r\n   * [github应用创建地址](https://github.com/settings/developers)\r\n   * [gitee应用创建地址](https://gitee.com/oauth/applications)\r\n   * [gitlab应用创建地址](https://gitlab.com/oauth/applications)\r\n   * [微博应用创建地址](https://open.weibo.com/)\r\n   \r\n\r\n##### 参数说明 \r\n\r\n>   <kbd>redirect_url</kbd>   回调地址将使用方法写到回调接口即可 获取到用户的一些基础信息 <br>\r\n> <kbd>client_id</kbd>     应用授权id <br>\r\n>  <kbd>client_secret</kbd>  应用授权key <br>\r\n>  所有支持平台的类型 `github` `gitee` `gitlab` `weibo` `qq` `weixin` 配置文件下标一致\r\n\r\n\r\n\r\n##### 建议\r\n\r\n> 前后端分离下建议前端直接请求授权接口，后端负责回调接口即可\r\n\r\n## <a id=\"测试1\">php项目中如何使用</a>\r\n\r\n<hr><br><br>\r\n\r\n#### 授权方法  \r\n\r\n\r\n\r\n```php\r\n\r\nrequire __DIR__ .\'/vendor/autoload.php\';\r\n\r\nuse Pl1998\\ThirdpartyOauth\\SocialiteAuth;\r\n\r\n$api = new SocialiteAuth([\r\n    \'client_id\' => \'74ee75f10437b4862d653a682111e5ddca1d24422f00ec884453ad232ae07ac9\',\r\n    \'redirect_uri\' => \'http://oauth.test/test.php\'\r\n]);\r\n\r\n$json = $api->redirect(\'weibo\');\r\n\r\nvar_dump($json);\r\n```\r\n    \r\n#### 回调接口方法\r\n\r\n```php\r\n\r\nrequire __DIR__ .\'/vendor/autoload.php\';\r\n\r\nuse Pl1998\\ThirdpartyOauth\\SocialiteAuth;\r\n\r\n$api = new SocialiteAuth([\r\n    \'client_id\' => \'74ee75f10437b4862d653a682111e5ddca1d24422f00ec884453ad232ae07ac9\',\r\n    \'redirect_uri\' => \'http://oauth.test/test.php\',\r\n    \'client_secret\' => \'\'\r\n]);\r\n\r\n$user = $api->driver(\'gitee\')->user();\r\n\r\nvar_dump($user);die;\r\n\r\n```\r\n\r\n<br>\r\n\r\n## <a id=\"测试2\">在Thinkphp中如何使用?</a>\r\n\r\n\r\n<hr>\r\n\r\n```php\r\n\r\n//在路由文件新建两条路由\r\nRoute::get(\'authorization\',\'api/TestController/authorization\')->name(\'请求授权\');\r\nRoute::get(\'gitee/callback\',\'api/TestController/giteeCallback\')->name(\'授权回调接口\');\r\n\r\n```\r\n\r\n## 配置文件\r\n\r\n```php\r\nreturn [\r\n    \'github\' => [\r\n            \'client_id\' => \'2365a07a73dc25a27e5c7a968248b96beb53a1ad300de7ba6bf4ffe247a4b386\',\r\n            \'redirect_uri\' => \'http://test.test/gitee/callback\',\r\n            \'client_secret\' => \'\'\r\n        ],\r\n    \'github\' => [\r\n            \'client_id\' => \'2365a07a73dc25a27e5c7a968248b96beb53a1ad300de7ba6bf4ffe247a4b386\',\r\n            \'redirect_uri\' => \'http://test.test/gitee/callback\',\r\n            \'client_secret\' => \'\'\r\n     ]\r\n];\r\n\r\n```\r\n\r\n\r\n\r\n```php\r\n\r\n<?php /**\r\n * Created by PhpStorm\r\n * User: pl\r\n * Date: 2020/9/17\r\n * Time: 14:56\r\n */\r\n\r\nnamespace app\\api\\controller;\r\n\r\nuse Pl1998\\ThirdpartyOauth\\SocialiteAuth;\r\nuse think\\facade\\Config;\r\n\r\nclass TestController\r\n{\r\n\r\n\r\n    /**\r\n     * 该方法重定向后会执行giteeCallback() 方法\r\n     * @return int\r\n     */\r\n    public function authorization()\r\n    {\r\n        $auth = new SocialiteAuth(Config::get(\'aouth.github\'));\r\n\r\n        return $auth->redirect(\'github\');\r\n\r\n    }\r\n\r\n    /**\r\n     * @throws \\Pl1998\\ThirdpartyOauth\\Exceptions\\InvalidArgumentException\r\n     */\r\n    public function giteeCallback()\r\n    {\r\n        $api = new SocialiteAuth(Config::get(\'aouth.github\'));\r\n\r\n        $user = $api->driver(\'github\')->user();\r\n\r\n        var_dump($user);\r\n\r\n        //判断用户是否存在表中 然后存入session 或者颁发token 返回给前端\r\n    }\r\n}\r\n\r\n```\r\n\r\n## <a id=\"测试3\">在laravel中如何使用?</a>\r\n\r\n\r\n> 在laravle的 <kbd>service.php</kbd>配置文件中加入配置\r\n\r\n```php\r\n\r\n   .\r\n   .\r\n   .\r\n  \'oauth\' => [\r\n         \'github\' => [\r\n             \'client_id\'    => env(\'GITHUB_CLIENT_ID\'),\r\n             \'redirect_uri\' => env(\'GITHUB_REDIRECT_URI\'),\r\n             \'client_secret\'=>env(\'GITHUB_CLIENT_SECRET\')\r\n         ]\r\n  ]\r\n   .....\r\n```\r\n\r\n#### 在 <kbd>.env中配置\r\n\r\n```shell\r\nGITHUB_CLIENT_ID=xxxx\r\nGITHUB_REDIRECT_URI=xxx\r\nGITHUB_CLIENT_SECRET=xxx\r\n```\r\n\r\n## 创建路由\r\n\r\n```php\r\nRoute::get(\'auth/github\',\'IndexController@auth\')->name(\'github授权\');\r\nRoute::get(\'callback/github\',\'IndexController@callback\')->name(\'github回调接口\');\r\n```\r\n\r\n## 控制器方法\r\n\r\n```php\r\n /**\r\n     * 授权方法\r\n     * @return mixed\r\n     */\r\n    public function auth()\r\n    {\r\n        //普通写法\r\n        // $auth = new SocialiteAuth(config(\'services.oauth\'));\r\n        // $auth->redirect(\'github\');\r\n\r\n        //laravel 容器使用\r\n         app(\'socialiteAuth\')->redirect(\'github\');\r\n\r\n    }\r\n    /**\r\n     * 回调方法\r\n     */\r\n    public function callback()\r\n    {\r\n        //普通写法\r\n        //$auth = new SocialiteAuth(config(\'services.oauth.github\'));\r\n        //$user = $auth->driver(\'github\')->user();\r\n        //var_dump($user);\r\n        //laravel 容器使用\r\n        $user = app(\'socialiteAuth\')->driver(\'github\')->user();\r\n        var_dump($user);\r\n    }\r\n```\r\n\r\n\r\n\r\n## 返回示例\r\n\r\n```json\r\n{\r\n    \"login\": \"pl1998\",\r\n    \"id\": 43993206,\r\n    \"node_id\": \"MDQ6VXNlcjQzOTkzMjA2\",\r\n    \"avatar_url\": \"https://avatars1.githubusercontent.com/u/43993206?v=4\",\r\n    \"gravatar_id\": \"\",\r\n    \"url\": \"https://api.github.com/users/pl1998\",\r\n    \"html_url\": \"https://github.com/pl1998\",\r\n    \"followers_url\": \"https://api.github.com/users/pl1998/followers\",\r\n    \"following_url\": \"https://api.github.com/users/pl1998/following{/other_user}\",\r\n    \"gists_url\": \"https://api.github.com/users/pl1998/gists{/gist_id}\",\r\n    \"starred_url\": \"https://api.github.com/users/pl1998/starred{/owner}{/repo}\",\r\n    \"subscriptions_url\": \"https://api.github.com/users/pl1998/subscriptions\",\r\n    \"organizations_url\": \"https://api.github.com/users/pl1998/orgs\",\r\n    \"repos_url\": \"https://api.github.com/users/pl1998/repos\",\r\n    \"events_url\": \"https://api.github.com/users/pl1998/events{/privacy}\",\r\n    \"received_events_url\": \"https://api.github.com/users/pl1998/received_events\",\r\n    \"type\": \"User\",\r\n    \"site_admin\": false,\r\n    \"name\": \"pltrue\",\r\n    \"company\": null,\r\n    \"blog\": \"pltrue.top\",\r\n    \"location\": \"深圳\",\r\n    \"email\": null,\r\n    \"hireable\": null,\r\n    \"bio\": null,\r\n    \"twitter_username\": null,\r\n    \"public_repos\": 6,\r\n    \"public_gists\": 0,\r\n    \"followers\": 1,\r\n    \"following\": 1,\r\n    \"created_at\": \"2018-10-09T12:42:14Z\",\r\n    \"updated_at\": \"2020-09-17T04:49:23Z\"\r\n}\r\n\r\n```\r\n<br><br>\r\n\r\n\r\n## License\r\n<hr>\r\nMIT</kbd>', 57, 0, 'laravel,扩展包', '2020-09-20 05:57:14', '2021-04-08 08:14:23', NULL, 0);
INSERT INTO `articles` VALUES (29, 9, 1, '基于swoole的日志系统，提供了简单便捷的Api', '', '基于swoole 异步队列 日志写入 邮件发送 api demo', 0, '## 基于swoole的日志系统，提供了简单便捷的Api\r\n\r\n#### 功能简洁\r\n\r\n  * http服务 、tcp服务、邮件异步发送、日志异步存储、简洁vue界面\r\n  * 文件json式存储，提供简单的日期查询条件\r\n  * 只需配置好配置文件 两行命令就能启动\r\n\r\n#### 安装需求\r\n  \r\n   * 安装了swoole扩展\r\n\r\n#### 如何启动？\r\n```shell script\r\n\r\ngit clone https://github.com/pl1998/swoole_log.git\r\n\r\ncd swoole_log\r\n\r\n// 查看是否安装了swoole\r\n\r\nphp --ri swoole \r\n\r\n// 测试环境 laradock\r\n\r\n// 启动http服务\r\n\r\nphp http.php\r\n\r\n// 启动tcp服务\r\n\r\nphp tcp.php\r\n```\r\n\r\n#### 简单配置`config/server.php`服务端口\r\n\r\n```php\r\nreturn [\r\n    /**\r\n     * http服务\r\n     */\r\n    \'http\' => [\r\n        \'host\' => \'0.0.0.0\',\r\n        \'port\' => 9501\r\n    ],\r\n    /**\r\n     * tcp服务\r\n     */\r\n    \'tcp\'  => [\r\n        \'host\' => \'127.0.0.1\',\r\n        \'port\' => 9502,\r\n        \'server\' => [\r\n            \'task_worker_num\' => 3,        //开启的进程数 一般为cup核数 1-4倍\r\n            \'daemonize\'       => 0,             //已守护进程执行该程序   //0 为调试模式 1 为 守护进程模式\r\n            \'max_request\'     => 10000,       //worker进程最大任务数\r\n            \'dispatch_mode\'   => 2,         //设置为争抢模式\r\n            \'task_ipc_mode\'   => 3,         //设置为消息队列模式\r\n        ]\r\n    ]\r\n];\r\n\r\n```\r\n\r\n#### 简单配置`config/email.php`邮件端口\r\n\r\n```php\r\n\r\nreturn [\r\n    \'username\'    => \'pltruenine@163.com\',\r\n    \'password\'    => \'xxxx\',\r\n    \'host\'        => \'smtp.163.com\',\r\n    \'smtp_secure\' => \'ssl\',\r\n    \'port\'        => 465,\r\n    \'setfrom\'     => \'pltruenine@163.com\',\r\n];\r\n```\r\n\r\n\r\n#### 提供的api\r\n\r\n#### 异步邮件发送、日志存储\r\n\r\n`127.0.0.1/api/get_log`\r\n\r\n##### 请求格式\r\n\r\n`post`\r\n\r\n##### 参数\r\n\r\n| 参数   | 是否必选 | 备注      | 限制 | 新增 |\r\n| ------| -------- | --------- | ---- | ---- |\r\n| email|   必须   | 收件人邮箱   |      |      |\r\n| time |   必须   | 发送间隔时间 时间戳 例如 一个小时 3600  |      |      |\r\n| content|   必须   | 错误内容   |      |      |\r\n| api_url|   必须   | 发送错误的接口名称  |      |      |\r\n\r\n\r\n\r\n```json\r\n{\r\n    \"status\": 200,\r\n    \"err_msg\": \"success\"\r\n}\r\n```\r\n\r\n#### 日志页面访问 `http://127.0.0.1:9501/get_log`', 49, 0, 'php,swoole', '2020-09-22 14:59:43', '2021-03-09 03:05:08', NULL, 0);
INSERT INTO `articles` VALUES (30, 10, 1, '分享一个php数组排序函数', '', '分享一个php数组排序函数', 1, '### 分享一个php数组排序函数\r\n\r\n------------\r\n\r\n> 二维数组根据某字段值进行正序或者倒序排序\r\n> 使用场景:当不同表数据在一起显示 需要根据一些值进行相对于得权重排序\r\n\r\n ```php\r\n \r\n  /**\r\n     * 数组排序操作方法\r\n     * @param $lists\r\n     * @param string $order\r\n     * @param string $field\r\n     * @return mixed\r\n     */\r\n     function sort($lists,$order=\'SORT_ASC\',$field= \'sort\')\r\n    {\r\n        $sort = array(\r\n            \'direction\' => $order, //排序顺序标志 SORT_DESC 降序；SORT_ASC 升序\r\n            \'field\'     => $field, //排序字段\r\n        );\r\n        $arrSort = array();\r\n        foreach($lists AS $uniqid => $row){\r\n            foreach($row AS $key=>$value){\r\n                $arrSort[$key][$uniqid] = $value;\r\n            }\r\n        }\r\n        if($sort[\'direction\']){\r\n            array_multisort($arrSort[$sort[\'field\']], constant($sort[\'direction\']), $lists);\r\n        }\r\n       return $lists;\r\n    }\r\n	\r\n ```\r\n ------------\r\n \r\n ### 最后 当然是用`laravel`这个包操作数组集合最爽了\r\n \r\n ```\r\n $ composer require vetor/laravel-collect\r\n ```', 19, 0, 'php,文章', '2020-09-23 07:07:53', '2020-12-02 12:56:09', NULL, 0);
INSERT INTO `articles` VALUES (31, 10, 1, '我理解的 php-fpm', '', '我理解的 php-fpm', 1, '## 我理解的 php-fpm 进程模型\r\n\r\n>  `php-fpm`就是通过`PHP`实现`FastCGI`协议的一个处理php脚本的进程管理器。 <br/>\r\n>  `FastCGI`与`CGI`的区别:`CGI`就是web服务器调用外部应用程序的一种服务器应用规范。 <br/>\r\n>  `FastCGI`就是`CGI`的一种升级版本,它是一种协议规范,需要每种语言自己去实现它，才能通过web服务器去调用,而php-fpm就是通过php版本FastCGI的实现，可以通过它实现web服务器与php脚本之间的通信。\r\n\r\n#### nginx如何通过php-fpm与php脚本通信\r\n\r\n> 下面是一个完整的nginx配置文件\r\n\r\n```shell script\r\nserver {\r\n\r\n    listen 80;\r\n    listen [::]:80;\r\n\r\n    server_name test.test;\r\n    index index.php index.html index.htm;\r\n\r\n    set $root_path \'/var/www/test.test/public\';\r\n\r\n    root $root_path;\r\n\r\n    location / {\r\n         if (!-e $request_filename) {\r\n            rewrite  ^(.*)$  /index.php?s=/$1  last;\r\n        }\r\n    }\r\n    #将请求去访问.php文件\r\n    location ~ \\.php$ {\r\n        try_files $uri /index.php =404;\r\n        fastcgi_pass php-upstream; #转发到php-fpm端口\r\n        fastcgi_index index.php;   #php-fpm类型框架 单入口\r\n        fastcgi_buffers 16 16k;\r\n        fastcgi_buffer_size 32k;\r\n        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\r\n        #fixes timeouts\r\n        fastcgi_read_timeout 600;\r\n        include fastcgi_params;\r\n    }\r\n\r\n    location ~ /\\.ht {\r\n        deny all;\r\n    }\r\n\r\n    location /.well-known/acme-challenge/ {\r\n        root /var/www/letsencrypt/;\r\n        log_not_found off;\r\n    }\r\n\r\n    error_log /var/log/nginx/laravel_error.log;\r\n    access_log /var/log/nginx/laravel_access.log;\r\n}\r\n\r\n```\r\n\r\n#### php-fpm 工作流程\r\n\r\n> php-fpm 会fork一个 master进程 然后会开启若干个worker进程 去处理访问请求 <br/>\r\n> 存在的问题1:每一个进程只能处理一个访问请求，如果所有进程都在处理请求，那剩下的请求就要阻塞排队 <br/>\r\n> 存在的问题2:因为每个进程只能处理一次请求 而进程与进程之间是隔离的 所有访问请求的变量和全局变量是独立的 而php脚本的生命周期在请求开始和请求结束 加载所有需要的变量 请求结束 就收回。并不常驻内存 浪费性能 理论上开n个进程 访问进程的上下文对cpu压力也很大\r\n> 所以pgp-fpm并发性能并不好 <br/>\r\n\r\n\r\n#### 问题解决\r\n\r\n> 服务器： 通过nginx服务器进行负载均衡 部署多个服务器提升并发性能 \r\n> 使用RPC架构 使用php swoole 这种常驻内存的框架\r\n> 不仅仅是访问io 数据库io 、使用缓存优化代码结构', 17, 0, 'php,Nginx', '2020-10-09 02:45:17', '2021-01-12 02:12:46', NULL, 0);
INSERT INTO `articles` VALUES (32, 6, 1, 'docker 离线部署 php-fpm 环境', '', 'docker 内网下离线部署 php-fpm 环境', 0, '## 部署文档。\r\n\r\n\r\n\r\n#### [docker部署环境请看这篇文章](https://pltrue.top/article/8/fsdfwewrecsfsdfds)\r\n#### 首先我们先要把相关的php-fpm nginx 等镜像下载到u盘\r\n\r\n####  在自己电脑上拉去镜像\r\n```shell\r\ndocker pull php:7.2-fpm \r\ndocker pull nginx\r\ndocker pull mysql:5.7\r\n```\r\n####启动容器 并 配置相关的容器 php\r\n```shell\r\n#安装pdo_mysql等相关扩展\r\nwhereis php \r\n/usr/local/etc/php\r\ncp php.ini-production php.ini #编辑这个文件 开启扩展\r\ncd cd /usr/local/bin/\r\n# 在此目录下载所需的扩展文件\r\ndocker-php-ext-install pdo_mysql\r\n```\r\n#### \r\n```php\r\ndocker ps #查看运行容器id\r\ndocker commit  -a \"作者\" -m \"描述\"  xxxx[容器id]   php:7.2fpm[name:tag] \r\ndocker images #查看该镜像\r\ndocker save  -o php-7.2fpm.tar php:7.2fpm #保存为 tar文件\r\n#导出备用\r\n#导入\r\ndocker load -i php-7.2fpm.tar\r\n\r\n```\r\n\r\n#### 将镜像导出到本地 保存到u盘备用\r\n\r\n```shell\r\ndocker save  -o  nginx.tar nginx\r\ndocker save  -o  php-gpm7.2.tar php-fpm\r\ndocker save  -o  msyql5.7.tar mysql\r\n```\r\n\r\n#### 导入 images 镜像\r\n\r\n```shell\r\ndocker load --input nginx.tar \r\n.....\r\n```\r\n\r\n#### 加载 php-fpm 容器\r\n ```shell\r\n docker run  -d -v /www/wwwroot:/home/wwwroot -p 9000:9000 -name  lnmp_php php-fpm7.2 /bin/bash\r\n ```\r\n \r\n#### 加载 nginx 容器\r\n```shell \r\ndocker run -d -p 8080:8080 -p 9092:9092  \r\n-v /Users/panliang/www/lnmp/conf:/etc/nginx/conf.d //挂在映射目录\r\n-v /Users/panliang/www/lnmp:/home/wwwroot --link lnmp_phpfpm:phpfpm --name lnmp_nginx nginx\r\n```\r\n \r\n#### 配置nginx\r\n```shell\r\nserver {\r\n  #访问端口 默认80\r\n  listen       9092;\r\n  listen  [::]:9092;\r\n  #域名或者ip\r\n  server_name  localhost;\r\n\r\n  index index.php index.html index.htm;\r\n\r\n  set $root_path \'/home/wwwroot/table_api/public\';\r\n  root $root_path;\r\n\r\n  #autoindex on;\r\n\r\n   location / {\r\n           if (!-e $request_filename) {\r\n              rewrite  ^(.*)$  /index.php?s=/$1  last;\r\n          }\r\n      }\r\n   #访问php文件转发到php-fpm\r\n    location ~ \\.php$ {\r\n        try_files $uri /index.php =404;\r\n        fastcgi_pass   phpfpm:9000;\r\n        fastcgi_index  index.php;\r\n        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\r\n        fastcgi_read_timeout 600;\r\n        include        fastcgi_params;\r\n    }\r\n\r\n    location ~ /\\.ht {\r\n          deny all;\r\n     }\r\n\r\n    error_log /var/log/nginx/php_error.log;\r\n    access_log /var/log/nginx/php_access.log;\r\n\r\n}\r\n```\r\n\r\n####  浏览器访问 `http://127.0.0.1:9092/` 成功', 97, 0, 'docker', '2020-10-24 16:20:18', '2021-04-16 06:39:27', NULL, 0);
INSERT INTO `articles` VALUES (33, 6, 1, 'go 实现一个简单的冒泡排序算法', '', 'Go implements a simple bubble sort algorithm', 0, '## go 实现一个简单的冒泡排序算法\r\n\r\n\r\n####  1.定义一个 需要排序的map\r\n```go\r\npackage main\r\n\r\nimport (\r\n	\r\n)\r\n\r\nvar (\r\n	barMap = map[string]int{\"alpha\": 34, \"bravo\": 56, \"charlie\": 23,\r\n		\"delta\": 87, \"echo\": 56, \"foxtrot\": 12,\r\n		\"golf\": 34, \"hotel\": 16, \"indio\": 87,\r\n		\"juliet\": 65, \"kili\": 43, \"lima\": 98}\r\n)\r\n```\r\n\r\n#### 2.编写排序方法\r\n\r\n * 1.append 作用：在原切片的末尾添加元素\r\n\r\n```go\r\nfunc SortMap(s map[string]int) (m map[string][int],rank []string) {\r\n     //将amp的key 添加到切片末尾\r\n     for key, _ := range s {\r\n     		rank = append(rank, key)\r\n     	}\r\n     //对key进行排序 import 引入 sort\r\n     sort.Strings(rank)\r\n    //冒泡排序开始\r\n    for i := 0; i  s[rank[j]] {\r\n    				rank[i], rank[j] = rank[j], rank[i]\r\n    			}\r\n    		}\r\n    }\r\n    // 定义一个存放变量值的map\r\n    rankMap := map[string]int{}\r\n   for i, ran := range rank {\r\n   		rankMap[ran] = i + 1\r\n   	}\r\n   	return rankMap, rank\r\n}\r\n```\r\n\r\n#### 3.使用该函数\r\n\r\n```go\r\n\r\nfunc main() {\r\n	var amp1 map[string]int\r\n	var rank []string\r\n    // inport 引入fmt\r\n	fmt.Println(amp1)\r\n	fmt.Println(rank)\r\n	amp1, rank = SortMap(barMap)\r\n   \r\n	fmt.Println(amp1)\r\n	fmt.Println(rank)\r\n\r\n}\r\n\r\n```\r\n\r\n#### 4. `go run sort_map.go` 执行结果如下：\r\n\r\n```shell script\r\nmap[]\r\n[]\r\nmap[alpha:5 bravo:7 charlie:3 delta:10 echo:8 foxtrot:1 golf:4 hotel:2 indio:11 juliet:9 kili:6 lima:12]\r\n[foxtrot hotel charlie golf alpha kili bravo echo juliet delta indio lima]\r\n\r\n```\r\n\r\n#### 4.完成示例 `sort_map.go`\r\n\r\n```go\r\npackage main\r\n\r\nimport (\r\n	\"fmt\"\r\n	\"sort\"\r\n)\r\n\r\nvar (\r\n	//定义一个变量\r\n	barMap = map[string]int{\"alpha\": 34, \"bravo\": 56, \"charlie\": 23,\r\n		\"delta\": 87, \"echo\": 56, \"foxtrot\": 12,\r\n		\"golf\": 34, \"hotel\": 16, \"indio\": 87,\r\n		\"juliet\": 65, \"kili\": 43, \"lima\": 98}\r\n)\r\n\r\nfunc main() {\r\n	var amp1 map[string]int\r\n	var rank []string\r\n	fmt.Println(amp1)\r\n	fmt.Println(rank)\r\n	amp1, rank = SortMap(barMap)\r\n\r\n	fmt.Println(amp1)\r\n	fmt.Println(rank)\r\n\r\n}\r\n\r\nfunc SortMap(s map[string]int) (m map[string]int, rank []string) {\r\n\r\n	for key, _ := range s {\r\n		rank = append(rank, key)\r\n	}\r\n\r\n	sort.Strings(rank)\r\n\r\n	for i := 0; i  s[rank[j]] {\r\n				rank[i], rank[j] = rank[j], rank[i]\r\n			}\r\n		}\r\n	}\r\n	rankMap := map[string]int{}\r\n\r\n	for i, ran := range rank {\r\n		rankMap[ran] = i + 1\r\n	}\r\n	return rankMap, rank\r\n}\r\n\r\n```', 33, 0, 'Go', '2020-12-03 03:24:34', '2021-03-09 07:22:30', NULL, 0);
INSERT INTO `articles` VALUES (34, 6, 1, '手把手教你如何gin入门快速编写api应用之快速搭建http服务器', '', '手把手教你如何gin入门快速编写api应用之快速搭建http服务器', 0, '#### 安装go可以看这篇[文章](https://www.runoob.com/go/go-environment.html)\r\n>我们cd $GOPATH 进入该目录下创建项目 新建ginproject 进入项目新建`main.go`文件。\r\n\r\n```go\r\npackage main\r\n\r\nimport (\r\n	\"fmt\"\r\n	\"net/http\"\r\n)\r\n\r\nfunc main() {\r\n   \r\n	http.HandleFunc(\"/\",handlerFunc)\r\n	\r\n	http.ListenAndServe(\":8081\",nil)\r\n}\r\n\r\nfunc handlerFunc(h http.ResponseWriter,r *http.Request){\r\n	fmt.Fprint(h, \"<h1>Hello, world</h1>\")\r\n}\r\n```\r\n>上面便是一个用go实现的一个简易的http服务器 我们来一一对代码进行讲解。\r\n```go\r\npackage main \r\n```\r\n每个go程序都有它所属的包名、通过包名可以在其他go程序中引用，类似于php的命名空间(namespace)，package 则是告诉我们这个文件是属于那个包的。\r\n```\r\nimport (\r\n)\r\n```\r\n类似php的use关键字 php use 是引入类文件，而import则是直接引入go的包 这里我们用到的go官方提供的标准包`fmt`，`net/http`。\r\n```go\r\nfunc main() {\r\n}\r\n```\r\n`main` 函数 当我们执行这个文件时，会执行这个函数。其中`http.HandleFunc`方法是处理http的请求的方法 `http.ListenAndServe`是监听本地端口的方法 下面我们来执行一个这个go程序。\r\n\r\n> 执行以下命令，然后访问[127.0.0.1:8081](http://127.0.0.1:8081)。\r\n```shell\r\ngo run main.go \r\n```\r\n\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201218231026251.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201218231106703.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)', 11, 0, 'Go,gin', '2020-12-18 16:58:13', '2021-03-04 09:47:21', NULL, 0);
INSERT INTO `articles` VALUES (35, 6, 1, '手把手教你如何gin入门快速编写api应用之go项目工程化', '', '手把手教你如何gin入门快速编写api应用之go项目工程化', 0, '#### 在项目中如何使用gin快速的搭建自己的框架，本节教你使用gin框架，路由、中间件、控制器的使用，以及mod、air等工程化使用 我们先来搭建一个gin项目。\r\n#### 本章内容\r\n  * 基于mod构建go项目\r\n  * air 代码热加载\r\n  * 使用gin框架的路由以及中间件\r\n  * 对go api 进行单元测试\r\n  \r\n首先我们在 `$GOPATH`下创建`gin`文件夹并 进入目录\r\n```shell\r\ncd gin\r\ngo mod init gin\r\n```\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201218234055563.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n生成了`go.mod`文件 `mod`是go官方提供的包管理工具类似`php`的`composer` 和`javascript`的`npm`、`yarn`。\r\n\r\n下面我们来安装`gin`框架\r\n```go\r\ngo get -u github.com/gin-gonic/gin\r\n```\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201218234501839.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n如上，安装成功。我们开始编码。创建`main.go`入口文件\r\n```go\r\npackage main\r\n\r\nimport (\r\n	\"github.com/gin-gonic/gin\"\r\n	\"net/http\"\r\n)\r\n\r\nfunc main() {\r\n	router := gin.Default()\r\n	router.GET(\"/\", func(c *gin.Context) {\r\n		data := map[string]interface{}{\r\n			\"lang\": \"GO语言\"\r\n		}\r\n		c.JSON(http.StatusOK, data)\r\n	})\r\n	router.Run(\":8081\")\r\n}\r\n\r\n```\r\n\r\n我们每次都要执行`go run main.go `命令对代码进行重新加载并使它修改生效。太麻烦了，如何热加载代码。 执行以下命令\r\n\r\n```shell\r\ngo get -u github.com/cosmtrek/air\r\n```\r\nlinux或者mos下 应该把alias air=\'~/.air\'加到.bashrc或.zshrc中。然后项目跟目录执行。\r\n```\r\nair\r\n```\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201218235835401.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n\r\n浏览器访问[127.0.0.1:8081](http://127.0.01:8081)\r\n\r\n接下来我们使用路由分组、以及编写api\r\n\r\n```go\r\npackage main\r\n\r\nimport (\r\n	\"github.com/gin-gonic/gin\"\r\n	\"net/http\"\r\n)\r\n\r\nfunc main() {\r\n	router := gin.Default()\r\n	router.GET(\"/\", func(c *gin.Context) {\r\n		data := map[string]interface{}{\r\n			\"lang\": \"GO语言\"\r\n		}\r\n		c.JSON(http.StatusOK, data)\r\n	})\r\n\r\n	api := router.Group(\"/api\")\r\n	{\r\n		api.GET(\"/get\",apiGet)\r\n		api.POST(\"/post\",apiPOST)\r\n	}\r\n\r\n	router.Run(\":8081\")\r\n}\r\n\r\nfunc apiGet(c *gin.Context){\r\n	data := map[string]interface{}{\r\n		\"title\":\"这是一个get请求\",\r\n	}\r\n	\r\n	c.JSON(http.StatusOK,data)\r\n	return\r\n}\r\nfunc apiPOST(c *gin.Context){\r\n	data := map[string]interface{}{\r\n		\"title\":\"这是一个psot请求\",\r\n	}\r\n	c.JSON(http.StatusOK,data)\r\n	return\r\n}\r\n```\r\n接下来我们对以下api接口进行测试\r\n * http://127.0.0.1:8081/api/get\r\n * http://127.0.0.1:8081/api/post\r\n \r\n 创建tests文件并安装`stretchr/testify`这个第三方测试包\r\n ```go\r\n go get github.com/stretchr/testify\r\n ```\r\n 创建`api_test.go`文件\r\n ```go\r\n package tests\r\n\r\nimport (\r\n	\"net/http\"\r\n	\"strconv\"\r\n	\"testing\"\r\n	\"github.com/stretchr/testify/assert\"\r\n)\r\n\r\nfunc TestHomePage(t *testing.T) {\r\n	baseURL := \"http://localhost:8081\"\r\n\r\n	// 1. 请求 —— 模拟用户访问浏览器\r\n	var tests = []struct {\r\n		method   string\r\n		url      string\r\n		expected int\r\n	}{\r\n		{\"GET\", \"/api/get\", 200},\r\n		{\"POST\", \"/api/post\", 200},\r\n	}\r\n\r\n	// 2. 遍历所有测试\r\n	for _, test := range tests {\r\n		t.Logf(\"当前请求 URL: %v \\n\", test.url)\r\n		var (\r\n			resp *http.Response\r\n			err  error\r\n		)\r\n		// 2.1 请求以获取响应\r\n		switch {\r\n		case test.method == \"POST\":\r\n			data := make(map[string][]string)\r\n			resp, err = http.PostForm(baseURL+test.url, data)\r\n		default:\r\n			resp, err = http.Get(baseURL + test.url)\r\n		}\r\n		// 2.2 断言\r\n		assert.NoError(t, err, \"请求 \"+test.url+\" 时报错\")\r\n		assert.Equal(t, test.expected, resp.StatusCode, test.url+\" 应返回状态码 \"+strconv.Itoa(test.expected))\r\n	}\r\n}\r\n ```\r\n 使用ide执行该测试文件 \r\n ![在这里插入图片描述](https://img-blog.csdnimg.cn/20201219004803218.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201219005409916.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n如上图所示，测试完成✅\r\n\r\n给接口增加中间件\r\n```go\r\n...\r\napi := router.Group(\"/api\").Use(Auth())\r\n...\r\n\r\n//中间件 没有token则返回500\r\nfunc Auth()  gin.HandlerFunc {\r\n	return func(c *gin.Context) {\r\n		token := c.GetHeader(\"token\")\r\n		if token ==\"\" || len(token) <1 {\r\n			c.JSON(http.StatusInternalServerError, map[string]interface{}{\r\n				\"code\":500,\r\n				\"msg\":\"token不存在\",\r\n			})\r\n\r\n			c.Abort()\r\n			return\r\n		}\r\n	}\r\n}\r\n\r\n```\r\n使用postman进行接口测试\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201219011206791.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201219011248279.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n测试成功 中间件添加完成', 23, 0, 'Go,gin', '2020-12-18 16:58:50', '2021-03-07 08:59:40', NULL, 0);
INSERT INTO `articles` VALUES (36, 6, 1, 'go面向对象思想:封装、继承、多态', '', 'go面向对象思想:封装、继承、多态', 0, '#### go 如何实现的封装、继承、和多态\r\n  * 封装:go通过结首字母大小写的方式，实现类方法和属性的公有化和私有化\r\n  * 继承:使用内嵌的方式，对结构体	`struct` 进行组合\r\n  * 多态:使用 `interface` 实现\r\n\r\n> 封装： go中是通过结构体的方法去模拟类\r\n\r\n```go\r\npackage objects\r\n\r\n//通过结构体的方式去模拟类\r\n\r\ntype User struct {\r\n	Name string\r\n	age int8   //根据首字母方式表现私有 公有\r\n	Record string\r\n}\r\n//根据方法的首字母的大小写去判断是否外部访问\r\nfunc (user *User) GetUser() string {\r\n\r\n	return user.Name + \"pl\";\r\n}\r\n\r\n```\r\n> 继承 我们编写一个用户信息的类。UserInfo 通过 U 继承了User结构体 通过嵌套实现了类的继承\r\n\r\n```go\r\ntype UserInfo struct {\r\n	U User //继承这个Uset结构体\r\n	Record string //经历\r\n	stature float32 //身高\r\n	Sex int8 //性别\r\n	Introduction string //简介\r\n	Avatar string //头像\r\n}\r\n\r\nfunc (userinfo *UserInfo) GetUserInfo() *UserInfo  {\r\n	user := new(UserInfo)\r\n	user.Avatar =\"xxx\"\r\n	return user\r\n}\r\n```\r\n> 多肽实现 完整代码\r\n\r\n```go\r\npackage objects\r\n\r\n//通过结构体的方式去模拟类\r\n\r\ntype UserInterface interface {\r\n	GetUserInfo() *UserInfo\r\n}\r\n\r\ntype User struct {\r\n	Id int8\r\n	Name string\r\n	age int8   //根据首字母方式表现私有 公有\r\n\r\n}\r\n//根据方法的首字母的大小写去判断是否外部访问\r\nfunc (user *User) package objects\r\n\r\n//通过结构体的方式去模拟类\r\n\r\ntype UserInterface interface {\r\n	GetUserInfo() *UserInfo\r\n}\r\n\r\ntype User struct {\r\n	Id int8\r\n	Name string\r\n	age int8   //根据首字母方式表现私有 公有\r\n\r\n}\r\n//根据方法的首字母的大小写去判断是否外部访问\r\nfunc (user *User) GetUser() string {\r\n\r\n	return user.Name + \"pl\";\r\n}\r\n\r\ntype UserInfo struct {\r\n	U User //继承这个Uset结构体\r\n	Record string //经历\r\n	stature float32 //身高\r\n	Sex int8 //性别\r\n	Introduction string //简介\r\n	Avatar string //头像\r\n}\r\n\r\nfunc (userinfo *UserInfo) GetUserInfo() *UserInfo  {\r\n	user := new(UserInfo)\r\n	user.Avatar =\"xxx\"\r\n	return user\r\n}\r\n() string {\r\n\r\n	return user.Name + \"pl\";\r\n}\r\n\r\ntype UserInfo struct {\r\n	U User //继承这个Uset结构体\r\n	Record string //经历\r\n	stature float32 //身高\r\n	Sex int8 //性别\r\n	Introduction string //简介\r\n	Avatar string //头像\r\n}\r\n\r\nfunc (userinfo *UserInfo) GetUserInfo() *UserInfo  {\r\n	user := new(UserInfo)\r\n	user.Avatar =\"xxx\"\r\n	return user\r\n}\r\n\r\n```\r\n如上代码所示:`UserInfo` 结构体继承了`UserInterface `接口 并实现了`GetUserInfo()`的方法\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201230115726669.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n\r\n我们来实现打印一下这个方法`GetUserInfo` 编写`main.go`入口文件\r\n```go\r\npackage main\r\n\r\nimport (\r\n	\"fmt\"\r\n	//类似于php的命名空间 引入这个包\r\n	\"object/objects\"\r\n)\r\n\r\nfunc main(){\r\n    //实例化这个结构体\r\n	user :=new(objects.UserInfo)\r\n	//引用这个结构体对应的方法 并打印它\r\n	fmt.Println(user.GetUserInfo())\r\n}\r\n```\r\n执行`go run main.go`\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201230114224201.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n如图执行成功(注意代码1片段和代码2片段是在object目录下的同一个文件)', 20, 0, 'Go', '2020-12-30 03:54:47', '2021-03-09 03:05:01', NULL, 0);
INSERT INTO `articles` VALUES (37, 10, 1, '关于php重建数组索引、array_merge、sort、array_values、json_encode的问题', '', '在php中使用unset 删除数组、以及对数组进行排序之后导致数组的key值从0,1,2到了2,1,0 这种。导致数组成为了关联数组 然后使用 array_merge\\sort序列化...', 0, '```php\nfunction(){\n\n}\n```', 14, 0, 'php', '2021-01-21 02:48:17', '2021-03-26 15:36:01', NULL, 0);
INSERT INTO `articles` VALUES (38, 10, 1, 'Windows下使用laradock作为开发环境', 'images/{79492864-0a6a-4c6c-b66d-cb6a7200dfc2}_MDB-Developer-Newsletter-Email-Banner.png', 'laradock是laravel官方维护的一个用于php开发docker集成环境  预先打包的Docker镜像，所有配置官方基本提供了。Laradock是在laravel社区众所周知的，因为这个项目最开始只关...', 0, '## 关于laradock\r\n*  laradock是laravel官方维护的一个用于php开发docker集成环境  预先打包的Docker镜像，所有配置官方基本提供了。\r\n* Laradock是在laravel社区众所周知的，因为这个项目最开始只关注在Docker上运行的laravel项目。后来，由于PHP社区的大量使用，它开始支持比如Symfony、CodeIgniter、WordPress、Drupal等其他的PHP项目。\r\n\r\n ##  我的个人用例\r\n* 即使在windows下它依然是我平台开发的主要环境，基于学习docker都有比较好的帮助，我也是去年开始学习并使用docker。并在实际的业务场景中基于laradock给客户部署过一套php相关的项目，也基于客户内网部署过一套docker lnmp环境 ，使用和了解它，使我大大缩减了大部分部署相关环境消耗的时间：\r\n\r\n## 开始安装docker\r\n*  [官网地址](https://www.docker.com/products/docker-desktop)\r\n安装完成并开启虚拟化\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/2021022718361918.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n## 启动异常问题\r\n  * 关闭USE [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) 我们使用git工具作为命令行操作面板\r\n  * 登录docker账号 这个在官网注册一个\r\n  \r\n  \r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20210227184443595.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n*  设置一个镜像源 有服务器的同学可以在自己服务器平台创建一个或者 \r\n\r\n[传送门](https://www.jianshu.com/p/3b062c177508)\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20210227184937300.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n## 开始构建镜像\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20210227185039949.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n *  我们在E盘或者D盘创建一个WWW目录用于存放我们的项目\r\n * [laradock 官方文档](https://laradock.linganmin.cn/)\r\n * [我的拉取的gitee地址](https://gitee.com/pltrue/laradock) 建议使用我这个地址 速度快的起飞。\r\n\r\n```shell\r\ncd www\r\ngit clone https://gitee.com/pltrue/laradock\r\ncd laradock\r\ncp env-example .env\r\nvim .env\r\n//修改文件mysql版本\r\nMYSQL_VERSION=5.7\r\n//需要开启swoole\r\nWORKSPACE_INSTALL_SWOOLE=true\r\nPHP_FPM_INSTALL_SWOOLE=true\r\nPHP_WORKER_INSTALL_SWOOLE=true\r\nWORKSPACE_INSTALL_SWOOLE=true\r\n\r\n//开始拉取需要的镜像 完成之后继续下一步\r\n docker-compose build nginx php-fpm redis mysql \r\n//启动容器 \r\ndocker-composer up -d nginx php-fpm redis mysql\r\n//进入某个容器\r\nwinpty docker-composer exec redis bash //windows git下 记得带上命令 winpty\r\n//进入主容器 \r\nwinpty docker-composer exec workspace bash\r\n//www 映射的是本地 laradock 同级目录  所有的项目都在/var/www 目录下面\r\ncd /var/www/  \r\n\r\n```\r\n## 配置项目 nginx\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20210227202546231.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)\r\n * 在laradock/nginx/sites目录下配置nginx配置文件 php框架的模板都有\r\n ```shell\r\n //配置好了之后，重启nginx\r\n winpty docker-composer exec nginx bash\r\n nginx -s reload\r\n ```\r\n * 注意 laradock容器之间通信不能通过127.0.0.1 而是通过名:例如:host:redis host:mysql  \r\n * 如果需要配置额外的端口与容器通信 在docker-compose.yml、和env中配置新端口 然后重新重建容器\r\n * 之后所有操作都一样。其他具体可以查看官方文档。有问题，在本文下面提出，我会即时答复。\r\n \r\n \r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20210227203926523.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDMyMTE3,size_16,color_FFFFFF,t_70)', 75, 4, 'php', '2021-02-27 12:45:22', '2021-04-17 06:53:42', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_09_07_090635_create_admin_settings_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_09_22_015815_create_admin_extensions_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_11_01_083237_update_admin_menu_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `topic_id` int(11) DEFAULT '0' COMMENT '评论id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content` text COMMENT '内容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of topics
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `oauth_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方id',
  `bound_oauth` tinyint(1) DEFAULT '0' COMMENT '1\\github 2\\gitee',
  `user_json` json DEFAULT NULL COMMENT '第三方授权的用户数据',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 正常 1禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (53, 'pl1998', NULL, NULL, NULL, NULL, '2020-09-13 10:35:32', '2020-09-13 10:35:32', 'https://avatars1.githubusercontent.com/u/43993206?v=4', '43993206', 1, NULL, 0);
INSERT INTO `users` VALUES (57, 'pltrue', NULL, NULL, NULL, NULL, '2020-09-13 12:58:26', '2020-09-13 12:58:26', 'https://portrait.gitee.com/uploads/avatars/user/752/2257588_pltrue_1595596617.png', NULL, 2, '{\"id\": 2257588, \"bio\": \"不成大牛，不改签名！\", \"url\": \"https://gitee.com/api/v5/users/pltrue\", \"blog\": \"https://pltrue.top\", \"name\": \"pl1998\", \"type\": \"User\", \"email\": null, \"login\": \"pltrue\", \"weibo\": null, \"stared\": 1, \"watched\": 22, \"html_url\": \"https://gitee.com/pltrue\", \"followers\": 0, \"following\": 1, \"gists_url\": \"https://gitee.com/api/v5/users/pltrue/gists{/gist_id}\", \"repos_url\": \"https://gitee.com/api/v5/users/pltrue/repos\", \"avatar_url\": \"https://portrait.gitee.com/uploads/avatars/user/752/2257588_pltrue_1595596617.png\", \"created_at\": \"2018-10-26T15:23:20+08:00\", \"events_url\": \"https://gitee.com/api/v5/users/pltrue/events{/privacy}\", \"updated_at\": \"2020-09-13T18:38:02+08:00\", \"starred_url\": \"https://gitee.com/api/v5/users/pltrue/starred{/owner}{/repo}\", \"public_gists\": 0, \"public_repos\": 7, \"followers_url\": \"https://gitee.com/api/v5/users/pltrue/followers\", \"following_url\": \"https://gitee.com/api/v5/users/pltrue/following_url{/other_user}\", \"organizations_url\": \"https://gitee.com/api/v5/users/pltrue/orgs\", \"subscriptions_url\": \"https://gitee.com/api/v5/users/pltrue/subscriptions\", \"received_events_url\": \"https://gitee.com/api/v5/users/pltrue/received_events\"}', 0);
INSERT INTO `users` VALUES (58, 'Hi叫我李荣浩', NULL, NULL, NULL, NULL, '2020-09-13 14:48:50', '2020-09-13 14:48:50', 'https://tvax1.sinaimg.cn/crop.0.0.996.996.180/006pP2Laly8gh2touqt7yj30ro0ro0tw.jpg?KID=imgbed,tva&Expires=1600019330&ssig=9FimAYScqc', '5878370732', 3, '{\"id\": 5878370732, \"url\": \"\", \"city\": \"9\", \"lang\": \"zh-cn\", \"like\": false, \"name\": \"Hi叫我李荣浩\", \"star\": 0, \"class\": 1, \"email\": \"\", \"idstr\": \"5878370732\", \"ptype\": 0, \"urank\": 9, \"domain\": \"\", \"gender\": \"m\", \"mbrank\": 0, \"mbtype\": 0, \"pc_new\": 0, \"remark\": \"\", \"status\": {\"id\": 4519807145721924, \"geo\": null, \"mid\": \"4519807145721924\", \"rid\": \"0\", \"text\": \"上岛\", \"idstr\": \"4519807145721924\", \"mlevel\": 0, \"source\": \"<a href=\\\"http://app.weibo.com/t/feed/48Dc49\\\" rel=\\\"nofollow\\\">HUAWEI P20</a>\", \"gif_ids\": \"\", \"is_paid\": false, \"pic_num\": 1, \"visible\": {\"type\": 0, \"list_id\": 0}, \"can_edit\": false, \"pic_urls\": [{\"thumbnail_pic\": \"http://wx2.sinaimg.cn/thumbnail/006pP2Lagy1gg4trqrbqlj33282ao4qq.jpg\"}], \"userType\": 0, \"favorited\": false, \"hide_flag\": 0, \"mblogtype\": 0, \"picStatus\": \"0:1\", \"truncated\": false, \"created_at\": \"Thu Jun 25 20:50:59 +0800 2020\", \"isLongText\": false, \"textLength\": 4, \"annotations\": [{\"client_mblogid\": \"daada9fc-4370-414c-88c2-805729e979b6\"}, {\"mapi_request\": true}], \"biz_feature\": 4294967300, \"bmiddle_pic\": \"http://wx2.sinaimg.cn/bmiddle/006pP2Lagy1gg4trqrbqlj33282ao4qq.jpg\", \"darwin_tags\": [], \"source_type\": 1, \"content_auth\": 0, \"original_pic\": \"http://wx2.sinaimg.cn/large/006pP2Lagy1gg4trqrbqlj33282ao4qq.jpg\", \"reposts_count\": 0, \"text_tag_tips\": [], \"thumbnail_pic\": \"http://wx2.sinaimg.cn/thumbnail/006pP2Lagy1gg4trqrbqlj33282ao4qq.jpg\", \"comments_count\": 0, \"hot_weibo_tags\": [], \"mblog_vip_type\": 0, \"more_info_type\": 0, \"attitudes_count\": 0, \"is_show_bulletin\": 2, \"hasActionTypeCard\": 0, \"source_allowclick\": 1, \"comment_manage_info\": {\"approval_comment_type\": 0, \"comment_permission_type\": -1}, \"in_reply_to_user_id\": \"\", \"positive_recom_flag\": 0, \"in_reply_to_status_id\": \"\", \"pending_approval_count\": 0, \"reward_exhibition_type\": 0, \"in_reply_to_screen_name\": \"\", \"show_additional_indication\": 0}, \"weihao\": \"\", \"like_me\": false, \"location\": \"江西 宜春\", \"province\": \"36\", \"verified\": false, \"avatar_hd\": \"https://tvax1.sinaimg.cn/crop.0.0.996.996.1024/006pP2Laly8gh2touqt7yj30ro0ro0tw.jpg?KID=imgbed,tva&Expires=1600019330&ssig=zHGl6Bo6AW\", \"block_app\": 0, \"follow_me\": false, \"following\": false, \"block_word\": 0, \"created_at\": \"Wed Mar 09 19:26:21 +0800 2016\", \"insecurity\": {\"sexual_content\": false}, \"video_mark\": 0, \"description\": \"不忆过往，不畏将来！\", \"geo_enabled\": true, \"is_guardian\": 0, \"is_teenager\": 0, \"live_status\": 0, \"profile_url\": \"u/5878370732\", \"screen_name\": \"Hi叫我李荣浩\", \"avatar_large\": \"https://tvax1.sinaimg.cn/crop.0.0.996.996.180/006pP2Laly8gh2touqt7yj30ro0ro0tw.jpg?KID=imgbed,tva&Expires=1600019330&ssig=9FimAYScqc\", \"credit_score\": 80, \"planet_video\": 0, \"user_ability\": 2360320, \"vclub_member\": 0, \"friends_count\": 72, \"online_status\": 0, \"verified_type\": -1, \"special_follow\": false, \"statuses_count\": 82, \"verified_trade\": \"\", \"followers_count\": 163, \"verified_reason\": \"\", \"verified_source\": \"\", \"favourites_count\": 15, \"is_teenager_list\": 0, \"story_read_state\": -1, \"video_play_count\": 0, \"allow_all_act_msg\": false, \"allow_all_comment\": false, \"cover_image_phone\": \"http://ww2.sinaimg.cn/crop.0.0.640.640.640/a1d3feabjw1ecasunmkncj20hs0hsq4j.jpg\", \"pagefriends_count\": 2, \"profile_image_url\": \"https://tvax1.sinaimg.cn/crop.0.0.996.996.50/006pP2Laly8gh2touqt7yj30ro0ro0tw.jpg?KID=imgbed,tva&Expires=1600019330&ssig=w%2BtihIzUI%2B\", \"bi_followers_count\": 18, \"video_status_count\": 0, \"verified_reason_url\": \"\", \"verified_source_url\": \"\"}', 0);
INSERT INTO `users` VALUES (59, 'qinazhe', '2868247804@qq.com', NULL, '$2y$10$DEB2DpZOMVuYmjCAfXoFbernyi5Ay3MkFCrxY2GSuAJnMFn31zjui', NULL, '2020-09-14 12:24:21', '2020-09-14 12:24:21', 'https://api.adorable.io/avatars/200/qinazhe7D.png', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (60, '用户5309868248', NULL, NULL, NULL, NULL, '2020-09-22 13:16:24', '2020-09-22 13:16:24', 'https://tvax3.sinaimg.cn/crop.0.0.996.996.180/007WsAglly8ggafl3u4g9j30ro0ron2n.jpg?KID=imgbed,tva&Expires=1600791384&ssig=133kckX0q%2B', '7276769893', 3, '{\"id\": 7276769893, \"url\": \"\", \"city\": \"1\", \"lang\": \"zh-cn\", \"like\": false, \"name\": \"用户5309868248\", \"star\": 0, \"class\": 1, \"email\": \"\", \"idstr\": \"7276769893\", \"ptype\": 0, \"urank\": 0, \"domain\": \"\", \"gender\": \"m\", \"mbrank\": 0, \"mbtype\": 0, \"pc_new\": 0, \"remark\": \"\", \"status\": {\"id\": 4538490400802326, \"geo\": null, \"mid\": \"4538490400802326\", \"rid\": \"0\", \"text\": \"#阴阳师手游[超话]# 我的式神录新晋宠神白狼！\", \"idstr\": \"4538490400802326\", \"mlevel\": 0, \"source\": \"<a href=\\\"http://app.weibo.com/t/feed/4Oao5U\\\" rel=\\\"nofollow\\\">阴阳师</a>\", \"gif_ids\": \"\", \"is_paid\": false, \"pic_num\": 0, \"visible\": {\"type\": 0, \"list_id\": 0}, \"can_edit\": false, \"pic_urls\": [], \"userType\": 0, \"favorited\": false, \"hide_flag\": 0, \"mblogtype\": 0, \"page_type\": 32, \"truncated\": false, \"created_at\": \"Sun Aug 16 10:11:34 +0800 2020\", \"isLongText\": false, \"textLength\": 43, \"annotations\": [{\"shooting\": 1, \"client_mblogid\": \"4523b24f-ba4a-4123-ae33-08a2d7feed11\"}, {\"mapi_request\": true}], \"biz_feature\": 0, \"darwin_tags\": [], \"source_type\": 1, \"content_auth\": 0, \"reposts_count\": 0, \"text_tag_tips\": [], \"comments_count\": 0, \"hot_weibo_tags\": [], \"mblog_vip_type\": 0, \"more_info_type\": 0, \"attitudes_count\": 0, \"is_show_bulletin\": 2, \"hasActionTypeCard\": 0, \"source_allowclick\": 0, \"comment_manage_info\": {\"approval_comment_type\": 0, \"comment_permission_type\": -1}, \"in_reply_to_user_id\": \"\", \"positive_recom_flag\": 0, \"in_reply_to_status_id\": \"\", \"pending_approval_count\": 0, \"reward_exhibition_type\": 0, \"in_reply_to_screen_name\": \"\", \"show_additional_indication\": 0}, \"weihao\": \"\", \"like_me\": false, \"location\": \"北京 东城区\", \"province\": \"11\", \"verified\": false, \"avatar_hd\": \"https://tvax3.sinaimg.cn/crop.0.0.996.996.1024/007WsAglly8ggafl3u4g9j30ro0ron2n.jpg?KID=imgbed,tva&Expires=1600791384&ssig=%2BW3fPsSY0d\", \"block_app\": 0, \"follow_me\": false, \"following\": false, \"block_word\": 0, \"created_at\": \"Fri Aug 09 08:17:48 +0800 2019\", \"insecurity\": {\"sexual_content\": false}, \"video_mark\": 0, \"description\": \"\", \"geo_enabled\": true, \"is_guardian\": 0, \"is_teenager\": 0, \"live_status\": 0, \"profile_url\": \"u/7276769893\", \"screen_name\": \"用户5309868248\", \"avatar_large\": \"https://tvax3.sinaimg.cn/crop.0.0.996.996.180/007WsAglly8ggafl3u4g9j30ro0ron2n.jpg?KID=imgbed,tva&Expires=1600791384&ssig=133kckX0q%2B\", \"credit_score\": 80, \"planet_video\": 0, \"user_ability\": 0, \"vclub_member\": 0, \"friends_count\": 1, \"online_status\": 0, \"verified_type\": -1, \"special_follow\": false, \"statuses_count\": 8, \"verified_trade\": \"\", \"followers_count\": 1, \"verified_reason\": \"\", \"verified_source\": \"\", \"favourites_count\": 0, \"is_teenager_list\": 0, \"story_read_state\": -1, \"video_play_count\": 0, \"allow_all_act_msg\": false, \"allow_all_comment\": false, \"cover_image_phone\": \"http://ww1.sinaimg.cn/crop.0.0.640.640.640/549d0121tw1egm1kjly3jj20hs0hsq4f.jpg\", \"pagefriends_count\": 0, \"profile_image_url\": \"https://tvax3.sinaimg.cn/crop.0.0.996.996.50/007WsAglly8ggafl3u4g9j30ro0ron2n.jpg?KID=imgbed,tva&Expires=1600791384&ssig=5DPVTWmz%2Br\", \"bi_followers_count\": 0, \"video_status_count\": 0, \"verified_reason_url\": \"\", \"verified_source_url\": \"\"}', 0);
INSERT INTO `users` VALUES (61, 'ywAlexyw', NULL, NULL, NULL, NULL, '2020-09-25 07:01:43', '2020-09-25 07:01:43', 'https://avatars2.githubusercontent.com/u/41054299?v=4', '41054299', 1, '{\"id\": 41054299, \"bio\": null, \"url\": \"https://api.github.com/users/ywAlexyw\", \"blog\": \"\", \"name\": null, \"type\": \"User\", \"email\": null, \"login\": \"ywAlexyw\", \"company\": null, \"node_id\": \"MDQ6VXNlcjQxMDU0Mjk5\", \"hireable\": null, \"html_url\": \"https://github.com/ywAlexyw\", \"location\": null, \"followers\": 0, \"following\": 0, \"gists_url\": \"https://api.github.com/users/ywAlexyw/gists{/gist_id}\", \"repos_url\": \"https://api.github.com/users/ywAlexyw/repos\", \"avatar_url\": \"https://avatars2.githubusercontent.com/u/41054299?v=4\", \"created_at\": \"2018-07-10T10:16:41Z\", \"events_url\": \"https://api.github.com/users/ywAlexyw/events{/privacy}\", \"site_admin\": false, \"updated_at\": \"2020-09-23T07:09:50Z\", \"gravatar_id\": \"\", \"starred_url\": \"https://api.github.com/users/ywAlexyw/starred{/owner}{/repo}\", \"public_gists\": 0, \"public_repos\": 13, \"followers_url\": \"https://api.github.com/users/ywAlexyw/followers\", \"following_url\": \"https://api.github.com/users/ywAlexyw/following{/other_user}\", \"twitter_username\": null, \"organizations_url\": \"https://api.github.com/users/ywAlexyw/orgs\", \"subscriptions_url\": \"https://api.github.com/users/ywAlexyw/subscriptions\", \"received_events_url\": \"https://api.github.com/users/ywAlexyw/received_events\"}', 0);
INSERT INTO `users` VALUES (62, 'pl1', '2540463097@qq.com', NULL, '$2y$10$I1yyBKkkQuoMaNKMTj3Jre2PiRVZLzum/Df4SsLK9326m/h2kyhA.', NULL, '2020-10-02 00:40:15', '2020-10-02 00:40:15', 'https://api.adorable.io/avatars/200/pl17D.png', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (63, '742481030', 'admin@mxin.ltd', NULL, NULL, NULL, '2020-12-06 10:01:03', '2020-12-06 10:01:03', 'https://avatars1.githubusercontent.com/u/59884249?v=4', '59884249', 1, '{\"id\": 59884249, \"bio\": null, \"url\": \"https://api.github.com/users/742481030\", \"blog\": \"www.mxin.ltd\", \"name\": \"上海明馨科技有限公司\", \"type\": \"User\", \"email\": \"admin@mxin.ltd\", \"login\": \"742481030\", \"company\": \"上海明馨科技有限公司\", \"node_id\": \"MDQ6VXNlcjU5ODg0MjQ5\", \"hireable\": null, \"html_url\": \"https://github.com/742481030\", \"location\": \"上海\", \"followers\": 2, \"following\": 0, \"gists_url\": \"https://api.github.com/users/742481030/gists{/gist_id}\", \"repos_url\": \"https://api.github.com/users/742481030/repos\", \"avatar_url\": \"https://avatars1.githubusercontent.com/u/59884249?v=4\", \"created_at\": \"2020-01-14T15:48:40Z\", \"events_url\": \"https://api.github.com/users/742481030/events{/privacy}\", \"site_admin\": false, \"updated_at\": \"2020-11-24T05:05:32Z\", \"gravatar_id\": \"\", \"starred_url\": \"https://api.github.com/users/742481030/starred{/owner}{/repo}\", \"public_gists\": 0, \"public_repos\": 46, \"followers_url\": \"https://api.github.com/users/742481030/followers\", \"following_url\": \"https://api.github.com/users/742481030/following{/other_user}\", \"twitter_username\": null, \"organizations_url\": \"https://api.github.com/users/742481030/orgs\", \"subscriptions_url\": \"https://api.github.com/users/742481030/subscriptions\", \"received_events_url\": \"https://api.github.com/users/742481030/received_events\"}', 0);
INSERT INTO `users` VALUES (64, 'Pwoodong', '892471693@qq.com', NULL, NULL, NULL, '2021-02-21 08:23:44', '2021-02-26 10:42:50', 'https://portrait.gitee.com/uploads/avatars/user/782/2348597_Pwoodong_1588926952.png', '2348597', 2, '{\"id\": 2348597, \"bio\": \"study\", \"url\": \"https://gitee.com/api/v5/users/Pwoodong\", \"blog\": null, \"name\": \"Pwoodong\", \"type\": \"User\", \"email\": \"未公开邮箱\", \"login\": \"Pwoodong\", \"weibo\": null, \"stared\": 2, \"watched\": 7, \"html_url\": \"https://gitee.com/Pwoodong\", \"followers\": 0, \"following\": 0, \"gists_url\": \"https://gitee.com/api/v5/users/Pwoodong/gists{/gist_id}\", \"repos_url\": \"https://gitee.com/api/v5/users/Pwoodong/repos\", \"avatar_url\": \"https://portrait.gitee.com/uploads/avatars/user/782/2348597_Pwoodong_1588926952.png\", \"created_at\": \"2018-12-10T11:17:17+08:00\", \"events_url\": \"https://gitee.com/api/v5/users/Pwoodong/events{/privacy}\", \"updated_at\": \"2021-02-21T15:59:45+08:00\", \"starred_url\": \"https://gitee.com/api/v5/users/Pwoodong/starred{/owner}{/repo}\", \"public_gists\": 0, \"public_repos\": 2, \"followers_url\": \"https://gitee.com/api/v5/users/Pwoodong/followers\", \"following_url\": \"https://gitee.com/api/v5/users/Pwoodong/following_url{/other_user}\", \"organizations_url\": \"https://gitee.com/api/v5/users/Pwoodong/orgs\", \"subscriptions_url\": \"https://gitee.com/api/v5/users/Pwoodong/subscriptions\", \"received_events_url\": \"https://gitee.com/api/v5/users/Pwoodong/received_events\"}', 0);
INSERT INTO `users` VALUES (65, 'taskqishu', NULL, NULL, NULL, NULL, '2021-03-02 07:51:06', '2021-03-02 07:51:06', 'https://gitee.com/assets/no_portrait.png', '8229892', 2, '{\"id\": 8229892, \"bio\": null, \"url\": \"https://gitee.com/api/v5/users/taskqishu\", \"blog\": null, \"name\": \"taskqishu\", \"type\": \"User\", \"email\": null, \"login\": \"taskqishu\", \"weibo\": null, \"stared\": 0, \"watched\": 1, \"html_url\": \"https://gitee.com/taskqishu\", \"followers\": 0, \"following\": 0, \"gists_url\": \"https://gitee.com/api/v5/users/taskqishu/gists{/gist_id}\", \"repos_url\": \"https://gitee.com/api/v5/users/taskqishu/repos\", \"avatar_url\": \"https://gitee.com/assets/no_portrait.png\", \"created_at\": \"2020-10-26T14:26:03+08:00\", \"events_url\": \"https://gitee.com/api/v5/users/taskqishu/events{/privacy}\", \"updated_at\": \"2021-03-02T15:32:20+08:00\", \"starred_url\": \"https://gitee.com/api/v5/users/taskqishu/starred{/owner}{/repo}\", \"public_gists\": 0, \"public_repos\": 0, \"followers_url\": \"https://gitee.com/api/v5/users/taskqishu/followers\", \"following_url\": \"https://gitee.com/api/v5/users/taskqishu/following_url{/other_user}\", \"organizations_url\": \"https://gitee.com/api/v5/users/taskqishu/orgs\", \"subscriptions_url\": \"https://gitee.com/api/v5/users/taskqishu/subscriptions\", \"received_events_url\": \"https://gitee.com/api/v5/users/taskqishu/received_events\"}', 0);
INSERT INTO `users` VALUES (66, 'pl1998', NULL, NULL, NULL, NULL, '2021-04-07 09:28:36', '2021-04-07 09:28:36', 'https://portrait.gitee.com/uploads/avatars/user/752/2257588_pltrue_1595596617.png', '2257588', 2, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for visitor_registries
-- ----------------------------
DROP TABLE IF EXISTS `visitor_registries`;
CREATE TABLE `visitor_registries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `art_id` bigint(20) unsigned NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visitor_registries_art_id_foreign` (`art_id`),
  CONSTRAINT `visitor_registries_art_id_foreign` FOREIGN KEY (`art_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of visitor_registries
-- ----------------------------
BEGIN;
INSERT INTO `visitor_registries` VALUES (1, 10, '192.168.10.1', '2020-02-18 22:24:49', '2020-04-05 09:30:05', NULL);
INSERT INTO `visitor_registries` VALUES (5, 8, '192.168.10.1', '2020-02-18 22:37:27', '2020-02-25 07:07:21', NULL);
INSERT INTO `visitor_registries` VALUES (9, 6, '192.168.10.1', '2020-02-22 19:34:11', '2020-02-23 10:08:23', NULL);
INSERT INTO `visitor_registries` VALUES (10, 3, '192.168.10.1', '2020-02-24 05:49:31', '2020-02-26 06:34:10', NULL);
INSERT INTO `visitor_registries` VALUES (11, 5, '192.168.10.1', '2020-02-24 05:51:20', '2020-02-25 07:40:27', NULL);
INSERT INTO `visitor_registries` VALUES (12, 8, '119.123.74.250', '2020-04-12 08:39:24', '2020-04-12 14:23:39', NULL);
INSERT INTO `visitor_registries` VALUES (13, 6, '119.123.74.250', '2020-04-12 14:20:17', '2020-04-12 14:20:17', NULL);
INSERT INTO `visitor_registries` VALUES (14, 8, '116.25.236.6', '2020-04-13 01:20:15', '2020-04-14 02:26:52', NULL);
INSERT INTO `visitor_registries` VALUES (15, 10, '116.25.236.6', '2020-04-13 03:01:19', '2020-04-14 02:34:21', NULL);
INSERT INTO `visitor_registries` VALUES (16, 8, '119.123.75.23', '2020-04-13 14:14:41', '2020-04-13 15:08:14', NULL);
INSERT INTO `visitor_registries` VALUES (17, 8, '113.87.129.251', '2020-04-13 23:11:50', '2020-04-13 23:11:50', NULL);
INSERT INTO `visitor_registries` VALUES (18, 3, '116.25.236.6', '2020-04-14 02:26:58', '2020-04-14 02:26:58', NULL);
INSERT INTO `visitor_registries` VALUES (20, 10, '116.25.237.27', '2020-04-15 07:04:34', '2020-04-16 09:57:22', NULL);
INSERT INTO `visitor_registries` VALUES (21, 8, '116.25.237.27', '2020-04-15 07:04:38', '2020-04-16 09:57:31', NULL);
INSERT INTO `visitor_registries` VALUES (22, 3, '116.25.237.27', '2020-04-15 07:07:09', '2020-04-16 09:57:26', NULL);
INSERT INTO `visitor_registries` VALUES (23, 8, '183.40.35.245', '2020-04-15 10:54:07', '2020-04-15 10:54:07', NULL);
INSERT INTO `visitor_registries` VALUES (24, 13, '116.25.237.27', '2020-04-16 09:56:36', '2020-04-16 09:57:39', NULL);
INSERT INTO `visitor_registries` VALUES (25, 13, '119.123.133.191', '2020-04-16 13:40:30', '2020-04-16 14:04:26', NULL);
INSERT INTO `visitor_registries` VALUES (26, 8, '119.123.133.191', '2020-04-16 14:03:41', '2020-04-16 14:03:41', NULL);
INSERT INTO `visitor_registries` VALUES (27, 3, '119.123.133.191', '2020-04-16 14:03:46', '2020-04-16 14:03:46', NULL);
INSERT INTO `visitor_registries` VALUES (28, 13, '116.25.238.48', '2020-04-17 01:14:15', '2020-04-17 09:08:27', NULL);
INSERT INTO `visitor_registries` VALUES (29, 8, '116.25.238.48', '2020-04-17 03:25:44', '2020-04-17 09:08:23', NULL);
INSERT INTO `visitor_registries` VALUES (30, 10, '116.25.238.48', '2020-04-17 06:03:36', '2020-04-17 06:03:36', NULL);
INSERT INTO `visitor_registries` VALUES (31, 14, '116.25.238.48', '2020-04-17 07:31:20', '2020-04-18 02:44:55', NULL);
INSERT INTO `visitor_registries` VALUES (32, 14, '119.123.74.247', '2020-04-19 02:46:49', '2020-04-19 14:21:15', NULL);
INSERT INTO `visitor_registries` VALUES (33, 15, '119.123.74.247', '2020-04-19 03:23:21', '2020-04-19 03:24:10', NULL);
INSERT INTO `visitor_registries` VALUES (34, 13, '119.123.74.247', '2020-04-19 13:21:26', '2020-04-19 15:22:52', NULL);
INSERT INTO `visitor_registries` VALUES (35, 8, '119.123.74.247', '2020-04-19 13:35:22', '2020-04-19 14:20:51', NULL);
INSERT INTO `visitor_registries` VALUES (36, 3, '119.123.74.247', '2020-04-19 13:37:56', '2020-04-19 13:37:56', NULL);
INSERT INTO `visitor_registries` VALUES (37, 15, '203.208.60.2', '2020-04-20 02:38:56', '2020-04-20 02:38:56', NULL);
INSERT INTO `visitor_registries` VALUES (38, 13, '116.25.239.59', '2020-04-20 02:39:36', '2020-04-20 08:27:50', NULL);
INSERT INTO `visitor_registries` VALUES (39, 14, '116.25.239.59', '2020-04-20 02:39:40', '2020-04-20 10:20:45', NULL);
INSERT INTO `visitor_registries` VALUES (40, 8, '203.208.60.18', '2020-04-20 02:48:13', '2020-04-20 02:48:13', NULL);
INSERT INTO `visitor_registries` VALUES (41, 14, '203.208.60.119', '2020-04-20 02:53:57', '2020-04-20 02:53:57', NULL);
INSERT INTO `visitor_registries` VALUES (42, 3, '116.25.239.59', '2020-04-20 07:42:28', '2020-04-20 07:42:28', NULL);
INSERT INTO `visitor_registries` VALUES (43, 8, '116.25.239.59', '2020-04-20 07:42:32', '2020-04-20 07:46:25', NULL);
INSERT INTO `visitor_registries` VALUES (44, 14, '116.25.239.161', '2020-04-21 10:31:33', '2020-04-22 10:02:26', NULL);
INSERT INTO `visitor_registries` VALUES (45, 13, '183.39.161.120', '2020-04-21 14:19:34', '2020-04-21 14:19:34', NULL);
INSERT INTO `visitor_registries` VALUES (46, 14, '183.39.161.120', '2020-04-21 14:19:40', '2020-04-21 14:31:18', NULL);
INSERT INTO `visitor_registries` VALUES (47, 8, '183.39.161.120', '2020-04-21 14:31:12', '2020-04-21 14:31:13', NULL);
INSERT INTO `visitor_registries` VALUES (48, 8, '116.25.239.161', '2020-04-22 09:45:05', '2020-04-22 10:05:18', NULL);
INSERT INTO `visitor_registries` VALUES (49, 13, '116.25.239.161', '2020-04-22 09:45:35', '2020-04-22 09:45:35', NULL);
INSERT INTO `visitor_registries` VALUES (50, 3, '116.25.239.161', '2020-04-22 09:45:38', '2020-04-22 09:45:38', NULL);
INSERT INTO `visitor_registries` VALUES (51, 14, '183.39.29.85', '2020-04-22 23:42:11', '2020-04-23 01:18:52', NULL);
INSERT INTO `visitor_registries` VALUES (52, 13, '183.39.29.85', '2020-04-22 23:42:26', '2020-04-22 23:42:26', NULL);
INSERT INTO `visitor_registries` VALUES (53, 13, '116.25.238.203', '2020-04-23 06:31:21', '2020-04-24 10:22:35', NULL);
INSERT INTO `visitor_registries` VALUES (54, 14, '116.25.238.203', '2020-04-23 07:56:25', '2020-04-23 07:56:25', NULL);
INSERT INTO `visitor_registries` VALUES (55, 13, '113.87.131.35', '2020-04-23 13:39:38', '2020-04-23 13:40:26', NULL);
INSERT INTO `visitor_registries` VALUES (56, 8, '113.87.131.35', '2020-04-23 13:40:29', '2020-04-23 13:40:29', NULL);
INSERT INTO `visitor_registries` VALUES (57, 14, '113.87.131.35', '2020-04-23 13:40:32', '2020-04-23 13:40:32', NULL);
INSERT INTO `visitor_registries` VALUES (58, 13, '119.123.135.160', '2020-04-25 01:02:32', '2020-04-25 15:18:26', NULL);
INSERT INTO `visitor_registries` VALUES (59, 14, '119.123.135.160', '2020-04-25 01:03:05', '2020-04-25 15:18:04', NULL);
INSERT INTO `visitor_registries` VALUES (60, 14, '116.25.238.85', '2020-04-26 01:19:05', '2020-04-26 03:22:37', NULL);
INSERT INTO `visitor_registries` VALUES (61, 3, '116.25.238.85', '2020-04-26 01:19:17', '2020-04-26 01:40:35', NULL);
INSERT INTO `visitor_registries` VALUES (62, 13, '219.133.101.105', '2020-04-26 11:35:36', '2020-04-26 13:30:14', NULL);
INSERT INTO `visitor_registries` VALUES (63, 16, '219.133.101.105', '2020-04-26 11:35:39', '2020-04-26 14:17:40', NULL);
INSERT INTO `visitor_registries` VALUES (64, 3, '219.133.101.105', '2020-04-26 11:40:47', '2020-04-26 11:40:47', NULL);
INSERT INTO `visitor_registries` VALUES (65, 16, '183.39.150.105', '2020-04-26 14:39:33', '2020-04-26 14:39:33', NULL);
INSERT INTO `visitor_registries` VALUES (66, 16, '14.30.42.131', '2020-04-26 23:00:17', '2020-04-27 15:26:40', NULL);
INSERT INTO `visitor_registries` VALUES (67, 13, '14.30.42.131', '2020-04-26 23:02:18', '2020-04-26 23:02:18', NULL);
INSERT INTO `visitor_registries` VALUES (68, 16, '116.25.238.107', '2020-04-27 01:06:46', '2020-04-28 09:07:44', NULL);
INSERT INTO `visitor_registries` VALUES (69, 13, '116.25.238.107', '2020-04-27 08:11:04', '2020-04-28 08:26:49', NULL);
INSERT INTO `visitor_registries` VALUES (70, 8, '116.25.238.107', '2020-04-27 08:11:08', '2020-04-28 01:02:56', NULL);
INSERT INTO `visitor_registries` VALUES (71, 3, '116.25.238.107', '2020-04-27 11:13:54', '2020-04-28 08:59:14', NULL);
INSERT INTO `visitor_registries` VALUES (72, 14, '116.25.238.107', '2020-04-27 11:13:58', '2020-04-28 09:10:11', NULL);
INSERT INTO `visitor_registries` VALUES (73, 13, '113.87.131.56', '2020-04-27 15:13:15', '2020-04-27 15:13:15', NULL);
INSERT INTO `visitor_registries` VALUES (74, 16, '113.87.131.56', '2020-04-27 15:13:21', '2020-04-27 15:13:21', NULL);
INSERT INTO `visitor_registries` VALUES (75, 14, '14.30.42.131', '2020-04-27 15:18:33', '2020-04-27 15:22:24', NULL);
INSERT INTO `visitor_registries` VALUES (76, 16, '14.30.0.138', '2020-04-28 00:34:38', '2020-04-28 13:00:44', NULL);
INSERT INTO `visitor_registries` VALUES (77, 14, '14.30.0.138', '2020-04-28 10:40:42', '2020-04-28 10:42:46', NULL);
INSERT INTO `visitor_registries` VALUES (78, 8, '14.30.0.138', '2020-04-28 10:43:10', '2020-04-28 10:45:08', NULL);
INSERT INTO `visitor_registries` VALUES (79, 16, '61.141.73.104', '2020-04-28 12:02:58', '2020-04-28 15:55:00', NULL);
INSERT INTO `visitor_registries` VALUES (80, 14, '61.141.73.104', '2020-04-28 12:09:16', '2020-04-28 13:32:36', NULL);
INSERT INTO `visitor_registries` VALUES (81, 13, '61.141.73.104', '2020-04-28 12:12:32', '2020-04-28 14:06:02', NULL);
INSERT INTO `visitor_registries` VALUES (82, 3, '61.141.73.104', '2020-04-28 12:12:37', '2020-04-28 12:12:37', NULL);
INSERT INTO `visitor_registries` VALUES (83, 8, '61.141.73.104', '2020-04-28 13:53:45', '2020-04-28 14:11:07', NULL);
INSERT INTO `visitor_registries` VALUES (84, 8, '14.30.5.237', '2020-04-28 14:05:24', '2020-04-28 14:05:24', NULL);
INSERT INTO `visitor_registries` VALUES (85, 14, '119.123.133.3', '2020-04-28 23:07:57', '2020-04-29 12:59:27', NULL);
INSERT INTO `visitor_registries` VALUES (86, 16, '116.25.236.168', '2020-04-29 01:06:00', '2020-04-30 13:21:16', NULL);
INSERT INTO `visitor_registries` VALUES (87, 8, '116.25.236.168', '2020-04-29 01:23:37', '2020-04-30 11:59:16', NULL);
INSERT INTO `visitor_registries` VALUES (88, 14, '116.25.236.168', '2020-04-29 04:09:20', '2020-04-30 13:21:04', NULL);
INSERT INTO `visitor_registries` VALUES (89, 8, '113.87.128.143', '2020-04-29 06:25:46', '2020-04-29 08:23:32', NULL);
INSERT INTO `visitor_registries` VALUES (90, 16, '119.123.133.3', '2020-04-29 12:59:52', '2020-04-29 13:00:16', NULL);
INSERT INTO `visitor_registries` VALUES (91, 13, '119.123.133.3', '2020-04-29 12:59:53', '2020-04-29 12:59:53', NULL);
INSERT INTO `visitor_registries` VALUES (92, 16, '113.87.128.143', '2020-04-29 13:46:54', '2020-04-29 13:46:54', NULL);
INSERT INTO `visitor_registries` VALUES (93, 13, '203.208.60.40', '2020-04-29 19:49:04', '2020-04-29 19:49:04', NULL);
INSERT INTO `visitor_registries` VALUES (94, 8, '119.123.132.99', '2020-04-30 02:44:00', '2020-04-30 06:24:44', NULL);
INSERT INTO `visitor_registries` VALUES (95, 3, '116.25.236.168', '2020-04-30 11:59:11', '2020-04-30 11:59:11', NULL);
INSERT INTO `visitor_registries` VALUES (96, 13, '116.25.236.168', '2020-04-30 13:21:21', '2020-04-30 13:21:21', NULL);
INSERT INTO `visitor_registries` VALUES (97, 3, '203.208.60.6', '2020-04-30 22:31:04', '2020-04-30 22:31:04', NULL);
INSERT INTO `visitor_registries` VALUES (98, 14, '203.208.60.51', '2020-04-30 22:31:45', '2020-04-30 22:31:45', NULL);
INSERT INTO `visitor_registries` VALUES (99, 13, '203.208.60.19', '2020-04-30 22:33:11', '2020-04-30 22:33:11', NULL);
INSERT INTO `visitor_registries` VALUES (100, 16, '119.123.74.173', '2020-05-01 02:05:54', '2020-05-01 02:09:01', NULL);
INSERT INTO `visitor_registries` VALUES (101, 13, '119.123.74.173', '2020-05-01 02:08:35', '2020-05-01 02:08:42', NULL);
INSERT INTO `visitor_registries` VALUES (102, 8, '119.123.74.173', '2020-05-01 02:08:39', '2020-05-01 02:08:39', NULL);
INSERT INTO `visitor_registries` VALUES (103, 14, '119.123.74.173', '2020-05-01 02:08:44', '2020-05-01 02:08:44', NULL);
INSERT INTO `visitor_registries` VALUES (104, 3, '119.123.74.173', '2020-05-01 02:08:47', '2020-05-01 02:08:47', NULL);
INSERT INTO `visitor_registries` VALUES (105, 8, '203.208.60.48', '2020-05-01 10:40:17', '2020-05-01 10:40:17', NULL);
INSERT INTO `visitor_registries` VALUES (106, 16, '203.208.60.66', '2020-05-01 13:08:36', '2020-05-01 13:08:36', NULL);
INSERT INTO `visitor_registries` VALUES (107, 16, '182.97.216.109', '2020-05-01 14:56:13', '2020-05-01 14:56:13', NULL);
INSERT INTO `visitor_registries` VALUES (108, 16, '59.55.170.173', '2020-05-02 01:15:57', '2020-05-02 01:15:57', NULL);
INSERT INTO `visitor_registries` VALUES (109, 3, '59.55.170.173', '2020-05-02 01:16:14', '2020-05-02 01:16:14', NULL);
INSERT INTO `visitor_registries` VALUES (110, 16, '117.166.48.132', '2020-05-02 13:43:32', '2020-05-02 13:43:32', NULL);
INSERT INTO `visitor_registries` VALUES (111, 13, '182.97.126.66', '2020-05-03 10:25:23', '2020-05-03 10:27:27', NULL);
INSERT INTO `visitor_registries` VALUES (112, 14, '182.97.126.66', '2020-05-03 10:27:32', '2020-05-03 10:27:32', NULL);
INSERT INTO `visitor_registries` VALUES (113, 13, '117.166.48.132', '2020-05-04 03:34:31', '2020-05-04 03:34:31', NULL);
INSERT INTO `visitor_registries` VALUES (114, 13, '116.25.239.110', '2020-05-05 01:01:08', '2020-05-05 01:03:27', NULL);
INSERT INTO `visitor_registries` VALUES (115, 16, '116.25.239.110', '2020-05-05 01:01:10', '2020-05-05 01:03:31', NULL);
INSERT INTO `visitor_registries` VALUES (116, 14, '116.25.239.110', '2020-05-05 01:01:19', '2020-05-06 09:35:14', NULL);
INSERT INTO `visitor_registries` VALUES (117, 3, '116.25.239.110', '2020-05-05 01:01:27', '2020-05-05 01:01:27', NULL);
INSERT INTO `visitor_registries` VALUES (118, 8, '116.25.239.110', '2020-05-05 01:01:31', '2020-05-06 09:32:01', NULL);
INSERT INTO `visitor_registries` VALUES (119, 14, '116.25.237.86', '2020-05-07 01:07:21', '2020-05-07 12:32:27', NULL);
INSERT INTO `visitor_registries` VALUES (120, 16, '116.25.237.86', '2020-05-07 01:09:29', '2020-05-07 12:31:09', NULL);
INSERT INTO `visitor_registries` VALUES (121, 8, '116.25.237.86', '2020-05-07 09:37:05', '2020-05-08 09:22:01', NULL);
INSERT INTO `visitor_registries` VALUES (122, 3, '116.25.237.86', '2020-05-07 09:37:09', '2020-05-07 12:32:19', NULL);
INSERT INTO `visitor_registries` VALUES (123, 13, '116.25.237.86', '2020-05-07 09:37:18', '2020-05-07 12:32:17', NULL);
INSERT INTO `visitor_registries` VALUES (124, 8, '183.42.32.192', '2020-05-07 15:32:48', '2020-05-07 15:32:48', NULL);
INSERT INTO `visitor_registries` VALUES (125, 16, '183.42.32.192', '2020-05-07 15:33:05', '2020-05-07 15:34:30', NULL);
INSERT INTO `visitor_registries` VALUES (126, 13, '61.141.72.235', '2020-05-08 14:03:08', '2020-05-08 14:03:08', NULL);
INSERT INTO `visitor_registries` VALUES (127, 3, '61.141.72.235', '2020-05-08 14:03:15', '2020-05-08 14:03:15', NULL);
INSERT INTO `visitor_registries` VALUES (128, 17, '116.25.239.33', '2020-05-09 07:38:26', '2020-05-09 07:38:26', NULL);
INSERT INTO `visitor_registries` VALUES (129, 13, '222.90.234.186', '2020-05-09 08:16:03', '2020-05-09 08:16:03', NULL);
INSERT INTO `visitor_registries` VALUES (130, 8, '222.90.234.186', '2020-05-09 08:16:08', '2020-05-09 08:16:08', NULL);
INSERT INTO `visitor_registries` VALUES (131, 3, '222.90.234.186', '2020-05-09 08:16:15', '2020-05-09 08:16:15', NULL);
INSERT INTO `visitor_registries` VALUES (132, 17, '119.123.134.34', '2020-05-09 10:40:36', '2020-05-09 14:31:58', NULL);
INSERT INTO `visitor_registries` VALUES (133, 8, '119.123.134.34', '2020-05-09 12:49:27', '2020-05-09 14:32:24', NULL);
INSERT INTO `visitor_registries` VALUES (134, 16, '119.123.134.34', '2020-05-09 13:01:21', '2020-05-09 13:01:21', NULL);
INSERT INTO `visitor_registries` VALUES (135, 3, '119.123.134.34', '2020-05-09 14:32:28', '2020-05-09 14:32:28', NULL);
INSERT INTO `visitor_registries` VALUES (136, 13, '119.123.134.34', '2020-05-09 14:32:37', '2020-05-09 14:32:37', NULL);
INSERT INTO `visitor_registries` VALUES (137, 17, '119.123.74.197', '2020-05-09 23:42:38', '2020-05-10 05:20:18', NULL);
INSERT INTO `visitor_registries` VALUES (138, 16, '119.123.74.197', '2020-05-09 23:42:44', '2020-05-09 23:49:09', NULL);
INSERT INTO `visitor_registries` VALUES (139, 14, '119.123.74.197', '2020-05-09 23:42:48', '2020-05-09 23:48:58', NULL);
INSERT INTO `visitor_registries` VALUES (140, 8, '119.123.74.197', '2020-05-09 23:48:53', '2020-05-10 06:26:30', NULL);
INSERT INTO `visitor_registries` VALUES (141, 13, '119.123.74.197', '2020-05-09 23:48:55', '2020-05-09 23:48:55', NULL);
INSERT INTO `visitor_registries` VALUES (142, 3, '119.123.74.197', '2020-05-09 23:49:01', '2020-05-09 23:49:01', NULL);
INSERT INTO `visitor_registries` VALUES (143, 6, '203.208.60.126', '2020-05-10 16:58:17', '2020-05-10 16:58:17', NULL);
INSERT INTO `visitor_registries` VALUES (144, 13, '116.25.237.52', '2020-05-12 05:57:51', '2020-05-12 05:57:51', NULL);
INSERT INTO `visitor_registries` VALUES (145, 16, '116.25.237.52', '2020-05-12 05:57:55', '2020-05-12 05:58:11', NULL);
INSERT INTO `visitor_registries` VALUES (146, 14, '116.25.237.52', '2020-05-12 05:57:58', '2020-05-12 05:57:58', NULL);
INSERT INTO `visitor_registries` VALUES (147, 8, '116.25.237.52', '2020-05-12 05:58:01', '2020-05-12 05:58:01', NULL);
INSERT INTO `visitor_registries` VALUES (148, 16, '113.87.130.135', '2020-05-12 15:30:53', '2020-05-12 15:41:55', NULL);
INSERT INTO `visitor_registries` VALUES (149, 6, '203.208.60.52', '2020-05-12 22:41:28', '2020-05-12 22:41:28', NULL);
INSERT INTO `visitor_registries` VALUES (150, 16, '116.25.237.63', '2020-05-13 01:12:56', '2020-05-13 01:14:08', NULL);
INSERT INTO `visitor_registries` VALUES (151, 17, '116.25.237.63', '2020-05-13 01:14:27', '2020-05-13 01:14:27', NULL);
INSERT INTO `visitor_registries` VALUES (152, 14, '116.25.237.63', '2020-05-13 01:14:30', '2020-05-13 01:14:30', NULL);
INSERT INTO `visitor_registries` VALUES (153, 8, '203.208.60.84', '2020-05-13 19:55:08', '2020-05-13 19:55:08', NULL);
INSERT INTO `visitor_registries` VALUES (154, 18, '116.25.239.168', '2020-05-15 05:21:20', '2020-05-16 01:08:52', NULL);
INSERT INTO `visitor_registries` VALUES (155, 17, '116.25.239.168', '2020-05-15 05:25:08', '2020-05-16 01:08:57', NULL);
INSERT INTO `visitor_registries` VALUES (156, 14, '116.25.239.168', '2020-05-15 05:25:12', '2020-05-15 10:11:43', NULL);
INSERT INTO `visitor_registries` VALUES (157, 13, '116.25.239.168', '2020-05-15 05:25:33', '2020-05-15 05:25:33', NULL);
INSERT INTO `visitor_registries` VALUES (158, 16, '116.25.239.168', '2020-05-15 10:12:18', '2020-05-15 10:12:18', NULL);
INSERT INTO `visitor_registries` VALUES (159, 8, '116.25.239.168', '2020-05-15 10:12:28', '2020-05-15 10:12:28', NULL);
INSERT INTO `visitor_registries` VALUES (160, 6, '203.208.60.62', '2020-05-16 00:04:51', '2020-05-16 00:04:51', NULL);
INSERT INTO `visitor_registries` VALUES (161, 18, '14.30.34.211', '2020-05-16 00:29:29', '2020-05-16 00:43:09', NULL);
INSERT INTO `visitor_registries` VALUES (162, 14, '14.30.34.211', '2020-05-16 00:29:59', '2020-05-16 00:29:59', NULL);
INSERT INTO `visitor_registries` VALUES (163, 8, '14.30.34.211', '2020-05-16 00:30:20', '2020-05-16 00:42:45', NULL);
INSERT INTO `visitor_registries` VALUES (164, 16, '14.30.34.211', '2020-05-16 00:30:44', '2020-05-16 00:32:56', NULL);
INSERT INTO `visitor_registries` VALUES (165, 17, '14.30.34.211', '2020-05-16 00:32:59', '2020-05-16 00:33:04', NULL);
INSERT INTO `visitor_registries` VALUES (166, 13, '119.123.73.19', '2020-05-17 04:45:36', '2020-05-17 04:51:46', NULL);
INSERT INTO `visitor_registries` VALUES (167, 17, '119.123.73.19', '2020-05-17 04:45:40', '2020-05-17 04:50:05', NULL);
INSERT INTO `visitor_registries` VALUES (168, 18, '119.123.73.19', '2020-05-17 04:50:09', '2020-05-17 04:50:48', NULL);
INSERT INTO `visitor_registries` VALUES (169, 14, '119.123.73.19', '2020-05-17 04:50:22', '2020-05-17 04:50:22', NULL);
INSERT INTO `visitor_registries` VALUES (170, 8, '119.123.73.19', '2020-05-17 04:50:36', '2020-05-17 04:50:36', NULL);
INSERT INTO `visitor_registries` VALUES (171, 18, '183.39.49.255', '2020-05-17 07:04:50', '2020-05-17 07:04:50', NULL);
INSERT INTO `visitor_registries` VALUES (172, 18, '116.25.239.128', '2020-05-18 01:13:49', '2020-05-18 09:58:20', NULL);
INSERT INTO `visitor_registries` VALUES (173, 17, '116.25.239.128', '2020-05-18 09:09:01', '2020-05-18 09:09:01', NULL);
INSERT INTO `visitor_registries` VALUES (174, 14, '116.25.239.128', '2020-05-18 09:09:07', '2020-05-18 09:09:07', NULL);
INSERT INTO `visitor_registries` VALUES (175, 16, '116.25.239.128', '2020-05-18 09:09:16', '2020-05-18 09:09:37', NULL);
INSERT INTO `visitor_registries` VALUES (176, 18, '113.87.128.186', '2020-05-18 12:01:18', '2020-05-18 14:47:47', NULL);
INSERT INTO `visitor_registries` VALUES (177, 17, '113.87.128.186', '2020-05-18 12:01:37', '2020-05-18 14:47:53', NULL);
INSERT INTO `visitor_registries` VALUES (178, 16, '113.87.128.186', '2020-05-18 12:01:40', '2020-05-18 14:50:30', NULL);
INSERT INTO `visitor_registries` VALUES (179, 6, '203.208.60.2', '2020-05-18 12:01:48', '2020-05-18 12:01:48', NULL);
INSERT INTO `visitor_registries` VALUES (180, 8, '113.87.128.186', '2020-05-18 14:15:30', '2020-05-18 14:15:30', NULL);
INSERT INTO `visitor_registries` VALUES (181, 14, '113.87.128.186', '2020-05-18 14:47:59', '2020-05-18 14:47:59', NULL);
INSERT INTO `visitor_registries` VALUES (182, 13, '113.87.128.186', '2020-05-18 14:50:06', '2020-05-18 14:50:17', NULL);
INSERT INTO `visitor_registries` VALUES (183, 8, '116.25.237.101', '2020-05-19 01:13:44', '2020-05-19 01:48:16', NULL);
INSERT INTO `visitor_registries` VALUES (184, 14, '116.25.237.101', '2020-05-19 01:13:51', '2020-05-19 09:35:54', NULL);
INSERT INTO `visitor_registries` VALUES (185, 18, '116.25.237.101', '2020-05-19 09:34:14', '2020-05-20 08:13:27', NULL);
INSERT INTO `visitor_registries` VALUES (186, 16, '116.25.237.101', '2020-05-19 09:36:07', '2020-05-20 01:13:55', NULL);
INSERT INTO `visitor_registries` VALUES (187, 13, '116.25.237.101', '2020-05-20 00:55:59', '2020-05-20 00:55:59', NULL);
INSERT INTO `visitor_registries` VALUES (188, 13, '119.123.134.128', '2020-05-20 12:34:54', '2020-05-20 13:56:39', NULL);
INSERT INTO `visitor_registries` VALUES (189, 18, '119.123.134.128', '2020-05-20 12:35:01', '2020-05-20 13:01:30', NULL);
INSERT INTO `visitor_registries` VALUES (190, 17, '119.123.134.128', '2020-05-20 12:35:07', '2020-05-20 13:11:34', NULL);
INSERT INTO `visitor_registries` VALUES (191, 14, '119.123.134.128', '2020-05-20 12:35:11', '2020-05-20 12:35:11', NULL);
INSERT INTO `visitor_registries` VALUES (192, 8, '119.123.134.128', '2020-05-20 12:35:20', '2020-05-20 12:35:20', NULL);
INSERT INTO `visitor_registries` VALUES (193, 3, '119.123.134.128', '2020-05-20 13:01:37', '2020-05-20 13:01:37', NULL);
INSERT INTO `visitor_registries` VALUES (194, 14, '116.25.236.210', '2020-05-21 01:15:36', '2020-05-21 06:10:37', NULL);
INSERT INTO `visitor_registries` VALUES (195, 13, '116.25.236.210', '2020-05-21 01:15:45', '2020-05-22 08:22:29', NULL);
INSERT INTO `visitor_registries` VALUES (196, 8, '116.25.236.210', '2020-05-21 06:36:06', '2020-05-21 06:36:06', NULL);
INSERT INTO `visitor_registries` VALUES (197, 17, '119.123.72.146', '2020-05-21 14:58:43', '2020-05-21 15:00:05', NULL);
INSERT INTO `visitor_registries` VALUES (198, 18, '119.123.72.146', '2020-05-21 15:01:14', '2020-05-21 15:01:35', NULL);
INSERT INTO `visitor_registries` VALUES (199, 3, '119.123.72.146', '2020-05-21 15:15:02', '2020-05-21 15:15:02', NULL);
INSERT INTO `visitor_registries` VALUES (200, 18, '14.30.152.65', '2020-05-22 06:32:12', '2020-05-22 06:32:12', NULL);
INSERT INTO `visitor_registries` VALUES (201, 16, '14.30.152.65', '2020-05-22 06:32:17', '2020-05-22 06:32:17', NULL);
INSERT INTO `visitor_registries` VALUES (202, 14, '14.30.152.65', '2020-05-22 06:32:24', '2020-05-22 06:32:24', NULL);
INSERT INTO `visitor_registries` VALUES (203, 16, '116.25.236.210', '2020-05-22 07:26:38', '2020-05-22 07:34:26', NULL);
INSERT INTO `visitor_registries` VALUES (204, 13, '119.123.74.180', '2020-05-23 02:47:13', '2020-05-23 02:47:13', NULL);
INSERT INTO `visitor_registries` VALUES (205, 17, '119.123.74.180', '2020-05-23 02:47:17', '2020-05-23 02:47:17', NULL);
INSERT INTO `visitor_registries` VALUES (206, 13, '61.141.73.148', '2020-05-24 01:22:15', '2020-05-24 11:14:16', NULL);
INSERT INTO `visitor_registries` VALUES (207, 18, '61.141.73.148', '2020-05-24 01:26:42', '2020-05-24 10:53:22', NULL);
INSERT INTO `visitor_registries` VALUES (208, 14, '61.141.73.148', '2020-05-24 01:26:48', '2020-05-24 01:26:49', NULL);
INSERT INTO `visitor_registries` VALUES (209, 3, '61.141.73.148', '2020-05-24 10:51:11', '2020-05-24 10:51:11', NULL);
INSERT INTO `visitor_registries` VALUES (210, 8, '61.141.73.148', '2020-05-24 11:20:07', '2020-05-24 11:20:07', NULL);
INSERT INTO `visitor_registries` VALUES (211, 18, '116.25.238.248', '2020-05-28 01:13:17', '2020-05-28 11:22:33', NULL);
INSERT INTO `visitor_registries` VALUES (212, 13, '116.25.238.248', '2020-05-28 11:22:27', '2020-05-28 11:22:27', NULL);
INSERT INTO `visitor_registries` VALUES (213, 8, '61.141.73.94', '2020-05-30 11:20:41', '2020-05-30 11:20:41', NULL);
INSERT INTO `visitor_registries` VALUES (214, 13, '61.141.73.94', '2020-05-30 12:00:42', '2020-05-30 14:30:54', NULL);
INSERT INTO `visitor_registries` VALUES (215, 19, '61.141.73.94', '2020-05-30 13:06:28', '2020-05-30 14:30:58', NULL);
INSERT INTO `visitor_registries` VALUES (216, 18, '61.141.73.94', '2020-05-30 13:09:50', '2020-05-30 14:31:03', NULL);
INSERT INTO `visitor_registries` VALUES (217, 17, '61.141.73.94', '2020-05-30 13:09:55', '2020-05-30 14:13:09', NULL);
INSERT INTO `visitor_registries` VALUES (218, 16, '61.141.73.94', '2020-05-30 13:09:59', '2020-05-30 14:13:13', NULL);
INSERT INTO `visitor_registries` VALUES (219, 14, '61.141.73.94', '2020-05-30 13:10:45', '2020-05-30 13:10:45', NULL);
INSERT INTO `visitor_registries` VALUES (220, 3, '61.141.73.94', '2020-05-30 14:04:30', '2020-05-30 14:04:30', NULL);
INSERT INTO `visitor_registries` VALUES (221, 13, '219.133.100.117', '2020-05-31 00:41:07', '2020-05-31 05:25:58', NULL);
INSERT INTO `visitor_registries` VALUES (222, 19, '219.133.100.117', '2020-05-31 00:41:20', '2020-05-31 00:41:20', NULL);
INSERT INTO `visitor_registries` VALUES (223, 14, '219.133.100.117', '2020-05-31 05:26:03', '2020-05-31 05:26:03', NULL);
INSERT INTO `visitor_registries` VALUES (224, 8, '219.133.100.117', '2020-05-31 05:26:11', '2020-05-31 05:26:11', NULL);
INSERT INTO `visitor_registries` VALUES (225, 13, '116.25.236.126', '2020-06-01 01:10:41', '2020-06-01 01:10:41', NULL);
INSERT INTO `visitor_registries` VALUES (226, 16, '183.39.0.226', '2020-06-01 11:42:35', '2020-06-01 11:42:35', NULL);
INSERT INTO `visitor_registries` VALUES (227, 13, '119.123.135.96', '2020-06-01 15:17:45', '2020-06-01 15:17:45', NULL);
INSERT INTO `visitor_registries` VALUES (228, 18, '119.123.135.96', '2020-06-01 15:17:48', '2020-06-01 15:17:48', NULL);
INSERT INTO `visitor_registries` VALUES (229, 16, '119.123.135.96', '2020-06-01 15:17:52', '2020-06-01 15:17:52', NULL);
INSERT INTO `visitor_registries` VALUES (230, 8, '119.123.135.96', '2020-06-01 15:18:03', '2020-06-01 15:18:03', NULL);
INSERT INTO `visitor_registries` VALUES (231, 16, '116.25.239.65', '2020-06-02 01:06:38', '2020-06-02 01:12:51', NULL);
INSERT INTO `visitor_registries` VALUES (232, 16, '119.123.135.55', '2020-06-02 12:37:55', '2020-06-02 12:37:55', NULL);
INSERT INTO `visitor_registries` VALUES (233, 16, '119.123.73.116', '2020-06-03 02:35:16', '2020-06-03 02:35:16', NULL);
INSERT INTO `visitor_registries` VALUES (234, 19, '119.123.73.116', '2020-06-03 09:21:16', '2020-06-03 09:21:16', NULL);
INSERT INTO `visitor_registries` VALUES (235, 8, '119.123.72.162', '2020-06-04 13:07:25', '2020-06-04 13:07:33', NULL);
INSERT INTO `visitor_registries` VALUES (236, 14, '119.123.72.162', '2020-06-04 13:07:35', '2020-06-04 13:07:35', NULL);
INSERT INTO `visitor_registries` VALUES (237, 16, '119.123.72.162', '2020-06-04 13:07:38', '2020-06-04 13:10:41', NULL);
INSERT INTO `visitor_registries` VALUES (238, 19, '119.123.72.162', '2020-06-04 13:07:43', '2020-06-04 13:07:43', NULL);
INSERT INTO `visitor_registries` VALUES (239, 3, '119.123.72.162', '2020-06-04 13:11:30', '2020-06-04 13:11:30', NULL);
INSERT INTO `visitor_registries` VALUES (240, 13, '119.123.135.93', '2020-06-05 13:54:40', '2020-06-05 14:20:12', NULL);
INSERT INTO `visitor_registries` VALUES (241, 20, '119.123.135.93', '2020-06-05 13:54:45', '2020-06-05 13:54:46', NULL);
INSERT INTO `visitor_registries` VALUES (242, 13, '119.123.75.252', '2020-06-06 01:20:54', '2020-06-06 06:14:21', NULL);
INSERT INTO `visitor_registries` VALUES (243, 20, '119.123.75.252', '2020-06-06 06:08:18', '2020-06-06 06:08:18', NULL);
INSERT INTO `visitor_registries` VALUES (244, 19, '119.123.75.252', '2020-06-06 06:08:23', '2020-06-06 06:08:23', NULL);
INSERT INTO `visitor_registries` VALUES (245, 18, '119.123.75.252', '2020-06-06 06:08:28', '2020-06-06 06:08:28', NULL);
INSERT INTO `visitor_registries` VALUES (246, 16, '119.123.75.252', '2020-06-06 06:08:32', '2020-06-06 06:14:11', NULL);
INSERT INTO `visitor_registries` VALUES (247, 14, '119.123.75.252', '2020-06-06 06:13:30', '2020-06-06 06:14:00', NULL);
INSERT INTO `visitor_registries` VALUES (248, 8, '119.123.75.252', '2020-06-06 06:13:36', '2020-06-06 06:14:14', NULL);
INSERT INTO `visitor_registries` VALUES (249, 13, '119.123.73.132', '2020-06-07 03:31:42', '2020-06-07 14:08:54', NULL);
INSERT INTO `visitor_registries` VALUES (250, 18, '119.123.73.132', '2020-06-07 03:31:46', '2020-06-07 03:31:46', NULL);
INSERT INTO `visitor_registries` VALUES (251, 14, '119.123.73.132', '2020-06-07 03:31:49', '2020-06-07 03:31:49', NULL);
INSERT INTO `visitor_registries` VALUES (252, 19, '119.123.73.132', '2020-06-07 07:24:10', '2020-06-07 07:24:10', NULL);
INSERT INTO `visitor_registries` VALUES (253, 8, '119.123.73.132', '2020-06-07 07:24:16', '2020-06-07 07:24:16', NULL);
INSERT INTO `visitor_registries` VALUES (254, 16, '183.42.42.122', '2020-06-07 08:22:45', '2020-06-07 08:22:45', NULL);
INSERT INTO `visitor_registries` VALUES (255, 14, '183.42.42.122', '2020-06-07 08:28:59', '2020-06-07 08:28:59', NULL);
INSERT INTO `visitor_registries` VALUES (256, 20, '119.123.73.132', '2020-06-07 10:52:51', '2020-06-07 11:22:17', NULL);
INSERT INTO `visitor_registries` VALUES (257, 16, '119.123.73.132', '2020-06-07 11:33:53', '2020-06-07 11:33:53', NULL);
INSERT INTO `visitor_registries` VALUES (258, 13, '116.25.236.60', '2020-06-08 01:07:25', '2020-06-09 03:10:41', NULL);
INSERT INTO `visitor_registries` VALUES (259, 20, '219.133.100.67', '2020-06-08 12:20:49', '2020-06-08 12:20:49', NULL);
INSERT INTO `visitor_registries` VALUES (260, 20, '219.133.100.186', '2020-06-08 12:23:22', '2020-06-08 14:31:14', NULL);
INSERT INTO `visitor_registries` VALUES (261, 19, '219.133.100.186', '2020-06-08 12:23:27', '2020-06-08 12:23:27', NULL);
INSERT INTO `visitor_registries` VALUES (262, 18, '219.133.100.186', '2020-06-08 12:23:37', '2020-06-08 14:23:45', NULL);
INSERT INTO `visitor_registries` VALUES (263, 16, '219.133.100.186', '2020-06-08 12:23:43', '2020-06-08 14:34:41', NULL);
INSERT INTO `visitor_registries` VALUES (264, 13, '219.133.100.186', '2020-06-08 12:24:24', '2020-06-08 14:23:40', NULL);
INSERT INTO `visitor_registries` VALUES (265, 14, '219.133.100.186', '2020-06-08 14:31:24', '2020-06-08 14:31:31', NULL);
INSERT INTO `visitor_registries` VALUES (266, 8, '219.133.100.186', '2020-06-08 14:31:29', '2020-06-08 14:31:29', NULL);
INSERT INTO `visitor_registries` VALUES (267, 20, '116.25.236.60', '2020-06-09 01:08:32', '2020-06-09 03:10:44', NULL);
INSERT INTO `visitor_registries` VALUES (268, 18, '116.25.236.60', '2020-06-09 01:08:36', '2020-06-09 01:08:36', NULL);
INSERT INTO `visitor_registries` VALUES (269, 16, '116.25.236.60', '2020-06-09 01:10:35', '2020-06-09 09:19:51', NULL);
INSERT INTO `visitor_registries` VALUES (270, 20, '183.42.50.18', '2020-06-09 05:03:07', '2020-06-09 05:03:45', NULL);
INSERT INTO `visitor_registries` VALUES (271, 16, '183.42.50.18', '2020-06-09 05:03:12', '2020-06-09 09:20:46', NULL);
INSERT INTO `visitor_registries` VALUES (272, 8, '183.42.50.18', '2020-06-09 05:03:24', '2020-06-09 05:03:58', NULL);
INSERT INTO `visitor_registries` VALUES (273, 14, '116.25.236.60', '2020-06-09 09:20:10', '2020-06-09 09:20:10', NULL);
INSERT INTO `visitor_registries` VALUES (274, 13, '119.123.132.34', '2020-06-09 11:48:11', '2020-06-09 11:48:11', NULL);
INSERT INTO `visitor_registries` VALUES (275, 20, '119.123.132.34', '2020-06-09 11:48:15', '2020-06-09 11:48:15', NULL);
INSERT INTO `visitor_registries` VALUES (276, 19, '119.123.132.34', '2020-06-09 11:48:19', '2020-06-09 11:48:19', NULL);
INSERT INTO `visitor_registries` VALUES (277, 21, '116.25.239.228', '2020-06-11 01:24:12', '2020-06-11 01:24:12', NULL);
INSERT INTO `visitor_registries` VALUES (278, 18, '116.25.239.228', '2020-06-11 03:14:24', '2020-06-11 03:14:24', NULL);
INSERT INTO `visitor_registries` VALUES (279, 21, '113.87.129.78', '2020-06-11 11:52:44', '2020-06-11 11:53:27', NULL);
INSERT INTO `visitor_registries` VALUES (280, 17, '113.87.129.78', '2020-06-11 11:53:00', '2020-06-11 11:53:01', NULL);
INSERT INTO `visitor_registries` VALUES (281, 21, '116.25.237.121', '2020-06-12 01:10:56', '2020-06-12 02:22:02', NULL);
INSERT INTO `visitor_registries` VALUES (282, 20, '116.25.237.121', '2020-06-12 01:11:07', '2020-06-12 02:22:07', NULL);
INSERT INTO `visitor_registries` VALUES (283, 3, '116.25.237.121', '2020-06-12 03:24:25', '2020-06-12 03:24:25', NULL);
INSERT INTO `visitor_registries` VALUES (284, 10, '116.25.237.121', '2020-06-12 03:25:14', '2020-06-12 03:25:14', NULL);
INSERT INTO `visitor_registries` VALUES (285, 16, '116.25.237.121', '2020-06-12 09:06:32', '2020-06-12 09:06:32', NULL);
INSERT INTO `visitor_registries` VALUES (286, 13, '113.87.130.56', '2020-06-12 14:40:44', '2020-06-12 14:40:44', NULL);
INSERT INTO `visitor_registries` VALUES (287, 21, '113.87.130.56', '2020-06-12 14:40:47', '2020-06-12 14:40:47', NULL);
INSERT INTO `visitor_registries` VALUES (288, 21, '119.123.73.233', '2020-06-13 13:37:23', '2020-06-13 13:37:23', NULL);
INSERT INTO `visitor_registries` VALUES (289, 18, '219.133.101.191', '2020-06-13 23:30:45', '2020-06-13 23:30:45', NULL);
INSERT INTO `visitor_registries` VALUES (290, 21, '219.133.101.191', '2020-06-13 23:30:52', '2020-06-13 23:30:52', NULL);
INSERT INTO `visitor_registries` VALUES (291, 16, '219.133.101.191', '2020-06-13 23:30:57', '2020-06-14 05:59:51', NULL);
INSERT INTO `visitor_registries` VALUES (292, 10, '219.133.101.191', '2020-06-14 05:59:28', '2020-06-14 06:01:05', NULL);
INSERT INTO `visitor_registries` VALUES (293, 14, '219.133.101.191', '2020-06-14 06:01:14', '2020-06-14 06:01:14', NULL);
INSERT INTO `visitor_registries` VALUES (294, 13, '119.123.75.10', '2020-06-16 12:54:19', '2020-06-16 12:54:59', NULL);
INSERT INTO `visitor_registries` VALUES (295, 20, '119.123.75.10', '2020-06-16 12:54:24', '2020-06-16 12:54:24', NULL);
INSERT INTO `visitor_registries` VALUES (296, 16, '119.123.75.10', '2020-06-16 12:54:31', '2020-06-16 12:54:31', NULL);
INSERT INTO `visitor_registries` VALUES (297, 16, '116.25.237.41', '2020-06-17 05:25:20', '2020-06-17 05:25:20', NULL);
INSERT INTO `visitor_registries` VALUES (298, 10, '61.141.72.97', '2020-06-18 14:53:19', '2020-06-18 14:53:19', NULL);
INSERT INTO `visitor_registries` VALUES (299, 16, '61.141.72.97', '2020-06-18 14:56:19', '2020-06-18 14:57:57', NULL);
INSERT INTO `visitor_registries` VALUES (300, 8, '61.141.72.97', '2020-06-18 14:57:44', '2020-06-18 14:57:44', NULL);
INSERT INTO `visitor_registries` VALUES (301, 13, '119.123.74.66', '2020-06-19 14:36:45', '2020-06-19 14:47:15', NULL);
INSERT INTO `visitor_registries` VALUES (302, 21, '119.123.74.66', '2020-06-19 14:38:26', '2020-06-19 14:38:26', NULL);
INSERT INTO `visitor_registries` VALUES (303, 21, '113.87.129.65', '2020-06-19 22:24:50', '2020-06-20 09:47:54', NULL);
INSERT INTO `visitor_registries` VALUES (304, 20, '113.87.129.65', '2020-06-19 22:25:21', '2020-06-19 22:25:21', NULL);
INSERT INTO `visitor_registries` VALUES (305, 13, '113.87.129.65', '2020-06-20 08:11:26', '2020-07-10 13:39:20', NULL);
INSERT INTO `visitor_registries` VALUES (306, 21, '183.39.181.159', '2020-06-20 08:29:44', '2020-06-22 03:08:51', NULL);
INSERT INTO `visitor_registries` VALUES (307, 16, '183.39.181.159', '2020-06-20 08:30:46', '2020-06-21 01:26:18', NULL);
INSERT INTO `visitor_registries` VALUES (308, 13, '103.125.250.135', '2020-06-20 09:19:57', '2020-06-20 09:19:57', NULL);
INSERT INTO `visitor_registries` VALUES (309, 16, '113.87.129.65', '2020-06-20 09:25:25', '2020-07-10 11:44:26', NULL);
INSERT INTO `visitor_registries` VALUES (310, 13, '119.123.133.164', '2020-06-21 00:50:46', '2020-06-21 15:03:33', NULL);
INSERT INTO `visitor_registries` VALUES (311, 16, '119.123.133.164', '2020-06-21 01:09:28', '2020-06-21 07:13:54', NULL);
INSERT INTO `visitor_registries` VALUES (312, 21, '203.208.60.56', '2020-06-21 07:56:53', '2020-06-21 07:56:53', NULL);
INSERT INTO `visitor_registries` VALUES (313, 19, '203.208.60.117', '2020-06-21 08:04:05', '2020-06-21 08:04:05', NULL);
INSERT INTO `visitor_registries` VALUES (314, 21, '203.208.60.112', '2020-06-21 08:04:10', '2020-06-21 08:04:10', NULL);
INSERT INTO `visitor_registries` VALUES (315, 20, '203.208.60.16', '2020-06-21 08:04:35', '2020-06-21 08:04:35', NULL);
INSERT INTO `visitor_registries` VALUES (316, 19, '203.208.60.101', '2020-06-21 08:12:37', '2020-06-21 08:12:37', NULL);
INSERT INTO `visitor_registries` VALUES (317, 19, '183.39.181.159', '2020-06-21 15:38:49', '2020-06-21 15:38:49', NULL);
INSERT INTO `visitor_registries` VALUES (318, 14, '183.39.181.159', '2020-06-21 15:39:11', '2020-06-21 15:39:11', NULL);
INSERT INTO `visitor_registries` VALUES (319, 15, '116.25.236.28', '2020-06-22 02:48:38', '2020-06-22 02:48:38', NULL);
INSERT INTO `visitor_registries` VALUES (320, 14, '116.25.236.28', '2020-06-22 02:48:55', '2020-06-22 02:48:55', NULL);
INSERT INTO `visitor_registries` VALUES (321, 8, '116.25.236.28', '2020-06-22 08:29:35', '2020-06-22 08:29:35', NULL);
INSERT INTO `visitor_registries` VALUES (322, 14, '119.123.134.208', '2020-06-22 15:06:28', '2020-06-22 15:06:29', NULL);
INSERT INTO `visitor_registries` VALUES (323, 20, '203.208.60.109', '2020-06-23 00:09:07', '2020-06-23 00:09:07', NULL);
INSERT INTO `visitor_registries` VALUES (324, 19, '116.25.236.28', '2020-06-23 01:00:42', '2020-06-23 01:00:42', NULL);
INSERT INTO `visitor_registries` VALUES (325, 21, '116.25.236.28', '2020-06-23 08:58:35', '2020-06-23 08:58:35', NULL);
INSERT INTO `visitor_registries` VALUES (326, 16, '116.25.236.28', '2020-06-23 08:58:44', '2020-06-23 08:58:48', NULL);
INSERT INTO `visitor_registries` VALUES (327, 21, '113.87.131.7', '2020-06-23 11:42:54', '2020-06-23 11:42:54', NULL);
INSERT INTO `visitor_registries` VALUES (328, 16, '113.87.131.7', '2020-06-23 14:47:53', '2020-06-23 14:47:53', NULL);
INSERT INTO `visitor_registries` VALUES (329, 16, '183.42.20.162', '2020-06-23 14:57:21', '2020-06-23 14:59:59', NULL);
INSERT INTO `visitor_registries` VALUES (330, 18, '116.25.238.5', '2020-06-24 01:00:33', '2020-06-24 01:00:33', NULL);
INSERT INTO `visitor_registries` VALUES (331, 16, '116.25.238.5', '2020-06-24 01:00:40', '2020-06-24 01:00:40', NULL);
INSERT INTO `visitor_registries` VALUES (332, 13, '116.25.238.5', '2020-06-24 01:03:19', '2020-06-24 06:44:40', NULL);
INSERT INTO `visitor_registries` VALUES (333, 21, '116.25.238.5', '2020-06-24 01:07:17', '2020-06-24 01:07:17', NULL);
INSERT INTO `visitor_registries` VALUES (334, 20, '119.123.132.35', '2020-06-24 11:08:05', '2020-06-24 14:45:46', NULL);
INSERT INTO `visitor_registries` VALUES (335, 17, '119.123.132.35', '2020-06-24 11:08:10', '2020-06-24 11:08:10', NULL);
INSERT INTO `visitor_registries` VALUES (336, 16, '119.123.132.35', '2020-06-24 11:08:17', '2020-06-24 14:46:39', NULL);
INSERT INTO `visitor_registries` VALUES (337, 10, '119.123.132.35', '2020-06-24 14:51:34', '2020-06-24 14:52:13', NULL);
INSERT INTO `visitor_registries` VALUES (338, 21, '119.123.132.35', '2020-06-24 14:52:15', '2020-06-24 14:52:15', NULL);
INSERT INTO `visitor_registries` VALUES (339, 16, '119.123.134.131', '2020-06-25 00:27:47', '2020-06-25 04:20:53', NULL);
INSERT INTO `visitor_registries` VALUES (340, 10, '119.123.134.131', '2020-06-25 00:30:19', '2020-06-25 00:30:19', NULL);
INSERT INTO `visitor_registries` VALUES (341, 17, '119.123.134.131', '2020-06-25 04:20:50', '2020-06-25 04:20:50', NULL);
INSERT INTO `visitor_registries` VALUES (342, 13, '119.123.134.131', '2020-06-25 04:21:01', '2020-06-25 04:21:01', NULL);
INSERT INTO `visitor_registries` VALUES (343, 18, '119.123.134.131', '2020-06-25 04:21:26', '2020-06-25 04:21:26', NULL);
INSERT INTO `visitor_registries` VALUES (344, 14, '119.123.134.131', '2020-06-25 04:21:31', '2020-06-25 05:20:42', NULL);
INSERT INTO `visitor_registries` VALUES (345, 21, '119.123.134.131', '2020-06-25 05:45:20', '2020-06-25 05:45:20', NULL);
INSERT INTO `visitor_registries` VALUES (346, 13, '183.39.131.160', '2020-06-25 10:30:10', '2020-06-25 10:30:10', NULL);
INSERT INTO `visitor_registries` VALUES (347, 16, '183.39.131.160', '2020-06-25 13:57:26', '2020-06-26 08:17:53', NULL);
INSERT INTO `visitor_registries` VALUES (348, 20, '183.39.131.160', '2020-06-26 03:29:47', '2020-06-26 03:29:47', NULL);
INSERT INTO `visitor_registries` VALUES (349, 13, '113.87.130.229', '2020-06-28 11:30:19', '2020-06-28 11:30:19', NULL);
INSERT INTO `visitor_registries` VALUES (350, 21, '113.87.130.229', '2020-06-28 11:30:25', '2020-06-28 11:30:25', NULL);
INSERT INTO `visitor_registries` VALUES (351, 16, '66.249.68.55', '2020-06-28 17:54:14', '2020-06-28 17:54:14', NULL);
INSERT INTO `visitor_registries` VALUES (352, 10, '203.208.60.68', '2020-06-29 12:23:21', '2020-06-29 12:23:21', NULL);
INSERT INTO `visitor_registries` VALUES (353, 10, '203.208.60.14', '2020-06-29 12:26:24', '2020-06-29 12:26:24', NULL);
INSERT INTO `visitor_registries` VALUES (354, 21, '219.133.100.208', '2020-06-29 13:14:14', '2020-06-29 13:14:14', NULL);
INSERT INTO `visitor_registries` VALUES (355, 16, '219.133.100.208', '2020-06-29 13:24:55', '2020-06-29 13:24:55', NULL);
INSERT INTO `visitor_registries` VALUES (356, 8, '116.25.238.139', '2020-06-30 05:52:15', '2020-06-30 05:52:15', NULL);
INSERT INTO `visitor_registries` VALUES (357, 16, '116.25.238.139', '2020-06-30 05:52:23', '2020-06-30 07:38:01', NULL);
INSERT INTO `visitor_registries` VALUES (358, 16, '203.208.60.86', '2020-06-30 07:28:29', '2020-06-30 07:28:29', NULL);
INSERT INTO `visitor_registries` VALUES (359, 3, '116.25.238.139', '2020-06-30 07:41:16', '2020-06-30 07:41:39', NULL);
INSERT INTO `visitor_registries` VALUES (360, 13, '119.123.133.19', '2020-06-30 13:09:19', '2020-06-30 13:09:19', NULL);
INSERT INTO `visitor_registries` VALUES (361, 16, '119.123.133.19', '2020-06-30 13:09:26', '2020-06-30 13:10:02', NULL);
INSERT INTO `visitor_registries` VALUES (362, 17, '116.25.237.42', '2020-07-01 02:05:00', '2020-07-01 02:07:02', NULL);
INSERT INTO `visitor_registries` VALUES (363, 18, '116.25.237.42', '2020-07-02 02:15:50', '2020-07-02 02:15:50', NULL);
INSERT INTO `visitor_registries` VALUES (364, 16, '116.25.237.42', '2020-07-02 02:15:59', '2020-07-02 02:15:59', NULL);
INSERT INTO `visitor_registries` VALUES (365, 16, '119.123.135.183', '2020-07-02 12:48:44', '2020-07-02 12:48:44', NULL);
INSERT INTO `visitor_registries` VALUES (366, 18, '203.208.60.14', '2020-07-03 06:36:30', '2020-07-03 06:36:30', NULL);
INSERT INTO `visitor_registries` VALUES (367, 18, '203.208.60.104', '2020-07-03 11:43:07', '2020-07-03 11:43:07', NULL);
INSERT INTO `visitor_registries` VALUES (368, 20, '120.229.20.91', '2020-07-03 13:23:42', '2020-07-03 13:23:42', NULL);
INSERT INTO `visitor_registries` VALUES (369, 18, '120.229.20.91', '2020-07-03 13:23:45', '2020-07-03 13:23:45', NULL);
INSERT INTO `visitor_registries` VALUES (370, 13, '120.229.20.91', '2020-07-03 14:55:26', '2020-07-03 14:55:26', NULL);
INSERT INTO `visitor_registries` VALUES (371, 13, '203.208.60.85', '2020-07-04 20:39:12', '2021-02-10 00:02:25', NULL);
INSERT INTO `visitor_registries` VALUES (372, 13, '113.87.131.68', '2020-07-05 14:07:07', '2020-07-05 14:07:07', NULL);
INSERT INTO `visitor_registries` VALUES (373, 22, '113.87.131.68', '2020-07-05 14:23:02', '2020-07-05 14:23:02', NULL);
INSERT INTO `visitor_registries` VALUES (374, 13, '203.208.60.83', '2020-07-05 19:20:30', '2020-07-05 19:20:30', NULL);
INSERT INTO `visitor_registries` VALUES (375, 3, '203.208.60.23', '2020-07-05 20:54:29', '2020-07-05 20:54:29', NULL);
INSERT INTO `visitor_registries` VALUES (376, 22, '183.37.165.214', '2020-07-06 11:12:58', '2020-07-06 11:12:58', NULL);
INSERT INTO `visitor_registries` VALUES (377, 3, '183.37.165.214', '2020-07-06 11:13:19', '2020-07-06 11:13:19', NULL);
INSERT INTO `visitor_registries` VALUES (378, 10, '183.37.165.214', '2020-07-06 11:13:56', '2020-07-06 11:13:56', NULL);
INSERT INTO `visitor_registries` VALUES (379, 13, '119.123.133.207', '2020-07-06 12:41:02', '2020-07-06 12:49:11', NULL);
INSERT INTO `visitor_registries` VALUES (380, 22, '119.123.133.207', '2020-07-06 12:43:50', '2020-07-06 12:43:50', NULL);
INSERT INTO `visitor_registries` VALUES (381, 14, '119.123.133.207', '2020-07-06 12:43:57', '2020-07-06 12:43:57', NULL);
INSERT INTO `visitor_registries` VALUES (382, 19, '119.123.133.207', '2020-07-06 12:49:04', '2020-07-06 12:49:04', NULL);
INSERT INTO `visitor_registries` VALUES (383, 3, '116.25.238.130', '2020-07-07 01:10:51', '2020-07-07 01:10:51', NULL);
INSERT INTO `visitor_registries` VALUES (384, 10, '116.25.238.130', '2020-07-07 01:11:00', '2020-07-07 01:11:17', NULL);
INSERT INTO `visitor_registries` VALUES (385, 13, '116.25.238.130', '2020-07-07 03:58:47', '2020-07-08 01:15:14', NULL);
INSERT INTO `visitor_registries` VALUES (386, 8, '116.25.238.130', '2020-07-07 09:36:33', '2020-07-08 10:05:14', NULL);
INSERT INTO `visitor_registries` VALUES (387, 16, '116.25.238.130', '2020-07-07 09:36:40', '2020-07-07 09:36:40', NULL);
INSERT INTO `visitor_registries` VALUES (388, 16, '116.25.236.223', '2020-07-09 04:36:33', '2020-07-09 04:36:33', NULL);
INSERT INTO `visitor_registries` VALUES (389, 21, '125.230.80.31', '2020-07-10 15:33:56', '2020-07-10 15:33:56', NULL);
INSERT INTO `visitor_registries` VALUES (390, 16, '116.25.236.167', '2020-07-11 03:04:35', '2020-07-11 03:04:35', NULL);
INSERT INTO `visitor_registries` VALUES (391, 13, '113.87.131.138', '2020-07-12 00:40:33', '2020-07-12 00:40:33', NULL);
INSERT INTO `visitor_registries` VALUES (392, 16, '113.87.131.138', '2020-07-12 00:40:44', '2020-07-12 00:40:44', NULL);
INSERT INTO `visitor_registries` VALUES (393, 22, '116.25.238.176', '2020-07-13 01:19:34', '2020-07-13 01:19:34', NULL);
INSERT INTO `visitor_registries` VALUES (394, 21, '116.25.238.176', '2020-07-13 01:19:53', '2020-07-13 01:19:53', NULL);
INSERT INTO `visitor_registries` VALUES (395, 14, '116.25.238.176', '2020-07-14 02:46:28', '2020-07-14 02:46:28', NULL);
INSERT INTO `visitor_registries` VALUES (396, 16, '116.25.238.176', '2020-07-14 02:46:41', '2020-07-14 02:46:41', NULL);
INSERT INTO `visitor_registries` VALUES (397, 8, '119.123.72.131', '2020-07-14 12:58:00', '2020-07-14 12:58:00', NULL);
INSERT INTO `visitor_registries` VALUES (398, 22, '119.123.72.131', '2020-07-14 12:58:05', '2020-07-14 12:58:05', NULL);
INSERT INTO `visitor_registries` VALUES (399, 19, '119.123.72.131', '2020-07-14 12:58:08', '2020-07-14 12:58:09', NULL);
INSERT INTO `visitor_registries` VALUES (400, 16, '116.25.238.240', '2020-07-15 12:21:06', '2020-07-15 12:21:06', NULL);
INSERT INTO `visitor_registries` VALUES (401, 21, '119.123.73.15', '2020-07-16 12:55:34', '2020-07-16 12:55:34', NULL);
INSERT INTO `visitor_registries` VALUES (402, 14, '119.123.73.15', '2020-07-16 12:56:06', '2020-07-16 12:56:06', NULL);
INSERT INTO `visitor_registries` VALUES (403, 8, '116.25.239.124', '2020-07-20 03:45:49', '2020-07-20 07:20:49', NULL);
INSERT INTO `visitor_registries` VALUES (404, 22, '203.208.60.108', '2020-07-20 06:52:07', '2020-07-20 06:52:07', NULL);
INSERT INTO `visitor_registries` VALUES (405, 22, '203.208.60.3', '2020-07-20 06:53:03', '2020-07-20 06:53:03', NULL);
INSERT INTO `visitor_registries` VALUES (406, 8, '116.25.236.15', '2020-07-21 01:01:10', '2020-07-22 02:52:26', NULL);
INSERT INTO `visitor_registries` VALUES (407, 17, '203.208.60.38', '2020-07-22 14:53:30', '2020-07-22 14:53:30', NULL);
INSERT INTO `visitor_registries` VALUES (408, 16, '203.208.60.2', '2020-07-22 16:13:02', '2020-07-25 12:11:59', NULL);
INSERT INTO `visitor_registries` VALUES (409, 16, '203.208.60.13', '2020-07-22 22:47:19', '2020-07-22 22:47:19', NULL);
INSERT INTO `visitor_registries` VALUES (410, 13, '203.208.60.93', '2020-07-22 22:57:35', '2021-02-07 03:19:02', NULL);
INSERT INTO `visitor_registries` VALUES (411, 17, '66.249.79.165', '2020-07-23 03:58:20', '2020-07-23 03:58:20', NULL);
INSERT INTO `visitor_registries` VALUES (412, 13, '116.25.237.94', '2020-07-24 05:44:25', '2020-07-24 05:44:48', NULL);
INSERT INTO `visitor_registries` VALUES (413, 14, '116.25.237.94', '2020-07-24 05:44:29', '2020-07-24 05:44:38', NULL);
INSERT INTO `visitor_registries` VALUES (414, 14, '203.208.60.93', '2020-07-24 10:44:02', '2020-07-24 10:44:02', NULL);
INSERT INTO `visitor_registries` VALUES (415, 18, '203.208.60.46', '2020-07-24 14:11:59', '2020-07-24 14:11:59', NULL);
INSERT INTO `visitor_registries` VALUES (416, 14, '203.208.60.95', '2020-07-24 15:03:57', '2020-07-24 15:03:57', NULL);
INSERT INTO `visitor_registries` VALUES (417, 13, '203.208.60.67', '2020-07-24 16:27:28', '2021-02-21 04:39:53', NULL);
INSERT INTO `visitor_registries` VALUES (418, 18, '203.208.60.112', '2020-07-25 07:55:39', '2020-07-25 07:55:40', NULL);
INSERT INTO `visitor_registries` VALUES (419, 16, '119.123.74.178', '2020-07-25 10:42:41', '2020-07-25 10:42:41', NULL);
INSERT INTO `visitor_registries` VALUES (420, 19, '119.123.74.178', '2020-07-25 10:42:52', '2020-07-25 10:42:52', NULL);
INSERT INTO `visitor_registries` VALUES (421, 18, '119.123.74.178', '2020-07-25 10:42:59', '2020-07-25 10:42:59', NULL);
INSERT INTO `visitor_registries` VALUES (422, 21, '119.123.74.178', '2020-07-25 10:43:08', '2020-07-25 10:43:08', NULL);
INSERT INTO `visitor_registries` VALUES (423, 16, '61.141.73.55', '2020-07-26 04:27:23', '2020-07-26 04:27:23', NULL);
INSERT INTO `visitor_registries` VALUES (424, 22, '61.141.73.55', '2020-07-26 04:27:55', '2020-07-26 07:47:28', NULL);
INSERT INTO `visitor_registries` VALUES (425, 13, '61.141.73.55', '2020-07-26 05:26:19', '2020-07-26 05:26:19', NULL);
INSERT INTO `visitor_registries` VALUES (426, 8, '61.141.73.55', '2020-07-26 07:16:51', '2020-07-26 07:16:51', NULL);
INSERT INTO `visitor_registries` VALUES (427, 20, '61.141.73.55', '2020-07-26 07:17:06', '2020-07-26 07:17:06', NULL);
INSERT INTO `visitor_registries` VALUES (428, 21, '61.141.73.55', '2020-07-26 07:47:32', '2020-07-26 07:47:32', NULL);
INSERT INTO `visitor_registries` VALUES (429, 13, '183.40.42.34', '2020-07-28 09:38:49', '2020-07-28 09:38:56', NULL);
INSERT INTO `visitor_registries` VALUES (430, 22, '183.40.34.78', '2020-07-29 00:46:01', '2020-07-29 00:46:01', NULL);
INSERT INTO `visitor_registries` VALUES (431, 22, '119.123.72.231', '2020-07-31 10:15:36', '2020-07-31 10:15:36', NULL);
INSERT INTO `visitor_registries` VALUES (432, 21, '119.123.72.231', '2020-07-31 10:15:41', '2020-07-31 10:15:41', NULL);
INSERT INTO `visitor_registries` VALUES (433, 17, '203.208.60.85', '2020-08-02 23:36:23', '2020-08-02 23:36:23', NULL);
INSERT INTO `visitor_registries` VALUES (434, 16, '203.208.60.27', '2020-08-03 01:48:06', '2020-08-03 01:48:06', NULL);
INSERT INTO `visitor_registries` VALUES (435, 13, '219.133.100.118', '2020-08-03 14:13:27', '2020-08-03 14:13:27', NULL);
INSERT INTO `visitor_registries` VALUES (436, 22, '219.133.100.118', '2020-08-03 14:13:31', '2020-08-03 14:13:31', NULL);
INSERT INTO `visitor_registries` VALUES (437, 20, '219.133.100.118', '2020-08-03 14:13:36', '2020-08-03 14:13:36', NULL);
INSERT INTO `visitor_registries` VALUES (438, 16, '219.133.100.118', '2020-08-03 14:13:40', '2020-08-03 14:13:40', NULL);
INSERT INTO `visitor_registries` VALUES (439, 8, '219.133.100.118', '2020-08-03 14:13:59', '2020-08-03 14:13:59', NULL);
INSERT INTO `visitor_registries` VALUES (440, 8, '116.25.237.246', '2020-08-05 03:04:18', '2020-08-05 03:04:18', NULL);
INSERT INTO `visitor_registries` VALUES (441, 17, '14.28.37.192', '2020-08-05 11:01:55', '2020-08-05 11:01:55', NULL);
INSERT INTO `visitor_registries` VALUES (442, 18, '116.25.239.105', '2020-08-06 02:08:20', '2020-08-06 02:08:20', NULL);
INSERT INTO `visitor_registries` VALUES (443, 14, '116.25.239.105', '2020-08-07 07:10:08', '2020-08-07 07:11:02', NULL);
INSERT INTO `visitor_registries` VALUES (444, 10, '116.25.239.105', '2020-08-07 07:11:13', '2020-08-07 07:11:13', NULL);
INSERT INTO `visitor_registries` VALUES (445, 22, '119.123.75.116', '2020-08-07 12:49:13', '2020-08-07 12:49:13', NULL);
INSERT INTO `visitor_registries` VALUES (446, 16, '119.123.75.116', '2020-08-07 12:55:08', '2020-08-07 12:55:08', NULL);
INSERT INTO `visitor_registries` VALUES (447, 22, '116.25.237.2', '2020-08-08 01:08:19', '2020-08-08 01:08:19', NULL);
INSERT INTO `visitor_registries` VALUES (448, 19, '116.25.237.2', '2020-08-08 01:08:27', '2020-08-08 01:08:27', NULL);
INSERT INTO `visitor_registries` VALUES (449, 8, '116.25.237.2', '2020-08-08 01:08:34', '2020-08-08 03:20:58', NULL);
INSERT INTO `visitor_registries` VALUES (450, 10, '116.25.237.2', '2020-08-08 01:08:41', '2020-08-08 01:08:41', NULL);
INSERT INTO `visitor_registries` VALUES (451, 16, '113.87.129.222', '2020-08-08 10:08:31', '2020-08-08 10:08:31', NULL);
INSERT INTO `visitor_registries` VALUES (452, 13, '116.25.239.25', '2020-08-12 08:44:45', '2020-08-12 08:44:45', NULL);
INSERT INTO `visitor_registries` VALUES (453, 16, '116.25.239.25', '2020-08-12 08:44:55', '2020-08-12 08:44:55', NULL);
INSERT INTO `visitor_registries` VALUES (454, 18, '203.208.60.87', '2020-08-13 05:03:03', '2020-08-13 05:03:03', NULL);
INSERT INTO `visitor_registries` VALUES (455, 17, '203.208.60.91', '2020-08-14 03:53:36', '2020-08-14 03:53:36', NULL);
INSERT INTO `visitor_registries` VALUES (456, 16, '203.208.60.14', '2020-08-14 05:13:15', '2020-08-14 05:13:15', NULL);
INSERT INTO `visitor_registries` VALUES (457, 13, '119.123.134.218', '2020-08-15 00:06:52', '2020-08-15 00:06:52', NULL);
INSERT INTO `visitor_registries` VALUES (458, 16, '119.123.134.218', '2020-08-15 08:16:40', '2020-08-15 08:16:40', NULL);
INSERT INTO `visitor_registries` VALUES (459, 13, '119.123.132.249', '2020-08-17 14:08:40', '2020-08-17 14:08:40', NULL);
INSERT INTO `visitor_registries` VALUES (460, 22, '119.123.132.249', '2020-08-17 14:08:47', '2020-08-18 14:27:06', NULL);
INSERT INTO `visitor_registries` VALUES (461, 20, '119.123.132.249', '2020-08-17 14:08:59', '2020-08-17 14:08:59', NULL);
INSERT INTO `visitor_registries` VALUES (462, 18, '119.123.132.249', '2020-08-17 14:09:09', '2020-08-17 14:09:09', NULL);
INSERT INTO `visitor_registries` VALUES (463, 10, '119.123.132.249', '2020-08-17 15:02:53', '2020-08-17 15:02:53', NULL);
INSERT INTO `visitor_registries` VALUES (464, 21, '119.123.132.249', '2020-08-18 14:04:05', '2020-08-18 14:04:05', NULL);
INSERT INTO `visitor_registries` VALUES (465, 16, '66.249.79.175', '2020-08-18 16:14:44', '2020-08-18 16:14:44', NULL);
INSERT INTO `visitor_registries` VALUES (466, 18, '203.208.60.41', '2020-08-19 09:11:38', '2020-08-19 09:11:38', NULL);
INSERT INTO `visitor_registries` VALUES (467, 17, '113.87.131.240', '2020-08-19 14:47:38', '2020-08-19 14:47:38', NULL);
INSERT INTO `visitor_registries` VALUES (468, 21, '203.208.60.121', '2020-08-20 01:54:18', '2020-08-20 01:54:18', NULL);
INSERT INTO `visitor_registries` VALUES (469, 8, '116.25.238.78', '2020-08-20 02:56:33', '2020-08-20 02:56:33', NULL);
INSERT INTO `visitor_registries` VALUES (470, 8, '113.87.131.240', '2020-08-20 13:47:37', '2020-08-20 13:47:37', NULL);
INSERT INTO `visitor_registries` VALUES (471, 8, '119.123.134.46', '2020-08-22 13:10:12', '2020-08-22 13:10:12', NULL);
INSERT INTO `visitor_registries` VALUES (472, 3, '119.123.134.46', '2020-08-22 15:38:23', '2020-08-22 15:38:23', NULL);
INSERT INTO `visitor_registries` VALUES (473, 23, '119.123.75.247', '2020-08-23 12:39:43', '2020-08-23 14:28:57', NULL);
INSERT INTO `visitor_registries` VALUES (474, 8, '119.123.75.247', '2020-08-23 14:29:07', '2020-08-23 14:29:07', NULL);
INSERT INTO `visitor_registries` VALUES (475, 23, '116.25.239.180', '2020-08-24 01:47:48', '2020-08-25 10:03:29', NULL);
INSERT INTO `visitor_registries` VALUES (476, 17, '116.25.239.180', '2020-08-24 02:13:05', '2020-08-24 02:13:05', NULL);
INSERT INTO `visitor_registries` VALUES (477, 13, '183.42.4.111', '2020-08-24 08:43:55', '2020-08-24 08:43:55', NULL);
INSERT INTO `visitor_registries` VALUES (478, 23, '183.42.4.111', '2020-08-24 08:44:07', '2020-08-24 08:44:07', NULL);
INSERT INTO `visitor_registries` VALUES (479, 16, '183.42.4.111', '2020-08-24 08:44:35', '2020-08-24 09:16:50', NULL);
INSERT INTO `visitor_registries` VALUES (480, 13, '116.25.239.180', '2020-08-24 09:00:48', '2020-08-24 09:01:01', NULL);
INSERT INTO `visitor_registries` VALUES (481, 23, '119.123.74.234', '2020-08-25 14:11:55', '2020-08-26 15:15:37', NULL);
INSERT INTO `visitor_registries` VALUES (482, 13, '119.123.74.234', '2020-08-25 14:20:09', '2020-08-26 15:07:28', NULL);
INSERT INTO `visitor_registries` VALUES (483, 23, '172.19.0.1', '2020-08-26 15:10:41', '2020-08-26 15:10:52', NULL);
INSERT INTO `visitor_registries` VALUES (484, 16, '119.123.74.234', '2020-08-26 15:15:44', '2020-08-26 15:15:44', NULL);
INSERT INTO `visitor_registries` VALUES (485, 13, '116.25.238.24', '2020-08-27 08:34:55', '2020-08-27 08:35:29', NULL);
INSERT INTO `visitor_registries` VALUES (486, 23, '116.25.238.24', '2020-08-27 08:35:10', '2020-08-27 08:51:38', NULL);
INSERT INTO `visitor_registries` VALUES (487, 21, '116.25.238.24', '2020-08-27 08:51:23', '2020-08-27 08:51:23', NULL);
INSERT INTO `visitor_registries` VALUES (488, 17, '116.25.238.24', '2020-08-27 09:48:59', '2020-08-27 09:48:59', NULL);
INSERT INTO `visitor_registries` VALUES (489, 23, '61.141.73.219', '2020-08-27 14:33:19', '2020-08-27 14:33:19', NULL);
INSERT INTO `visitor_registries` VALUES (490, 10, '203.208.60.70', '2020-08-28 12:40:32', '2020-08-28 12:40:32', NULL);
INSERT INTO `visitor_registries` VALUES (491, 13, '203.208.60.112', '2020-08-29 13:58:38', '2021-02-07 06:55:13', NULL);
INSERT INTO `visitor_registries` VALUES (492, 23, '113.87.128.169', '2020-08-29 14:09:40', '2020-08-30 08:56:57', NULL);
INSERT INTO `visitor_registries` VALUES (493, 17, '113.87.128.169', '2020-08-30 08:57:05', '2020-08-30 08:57:05', NULL);
INSERT INTO `visitor_registries` VALUES (494, 3, '113.87.128.169', '2020-08-30 08:57:13', '2020-08-30 08:57:13', NULL);
INSERT INTO `visitor_registries` VALUES (495, 10, '113.87.128.169', '2020-08-30 08:57:24', '2020-08-30 08:57:24', NULL);
INSERT INTO `visitor_registries` VALUES (496, 23, '203.208.60.12', '2020-09-01 04:15:28', '2020-09-01 04:15:28', NULL);
INSERT INTO `visitor_registries` VALUES (497, 24, '61.141.72.170', '2020-09-01 15:18:49', '2020-09-01 15:19:49', NULL);
INSERT INTO `visitor_registries` VALUES (498, 23, '61.141.72.170', '2020-09-01 15:19:18', '2020-09-01 15:19:18', NULL);
INSERT INTO `visitor_registries` VALUES (499, 13, '61.141.72.170', '2020-09-01 15:19:30', '2020-09-01 15:19:30', NULL);
INSERT INTO `visitor_registries` VALUES (500, 24, '116.25.239.55', '2020-09-02 01:39:45', '2020-09-02 01:39:45', NULL);
INSERT INTO `visitor_registries` VALUES (501, 16, '116.25.239.55', '2020-09-02 06:33:44', '2020-09-02 06:33:44', NULL);
INSERT INTO `visitor_registries` VALUES (502, 24, '119.123.135.247', '2020-09-02 11:25:03', '2020-09-03 13:45:46', NULL);
INSERT INTO `visitor_registries` VALUES (503, 13, '119.123.135.247', '2020-09-02 12:23:28', '2020-09-02 12:23:28', NULL);
INSERT INTO `visitor_registries` VALUES (504, 25, '119.123.135.247', '2020-09-02 13:41:31', '2020-09-03 14:15:40', NULL);
INSERT INTO `visitor_registries` VALUES (505, 23, '119.123.135.247', '2020-09-02 14:10:32', '2020-09-02 14:10:32', NULL);
INSERT INTO `visitor_registries` VALUES (506, 16, '119.123.135.247', '2020-09-02 14:28:23', '2020-09-02 14:28:23', NULL);
INSERT INTO `visitor_registries` VALUES (507, 16, '60.166.73.228', '2020-09-03 02:35:00', '2020-09-03 02:35:28', NULL);
INSERT INTO `visitor_registries` VALUES (508, 25, '116.25.236.155', '2020-09-03 02:50:07', '2020-09-04 11:39:34', NULL);
INSERT INTO `visitor_registries` VALUES (509, 24, '116.25.236.155', '2020-09-03 02:50:19', '2020-09-03 05:32:45', NULL);
INSERT INTO `visitor_registries` VALUES (510, 18, '203.208.60.71', '2020-09-03 07:38:24', '2020-09-03 07:38:24', NULL);
INSERT INTO `visitor_registries` VALUES (511, 25, '183.40.14.199', '2020-09-03 11:41:03', '2020-09-03 13:16:54', NULL);
INSERT INTO `visitor_registries` VALUES (512, 20, '119.123.135.247', '2020-09-03 13:45:08', '2020-09-03 13:45:12', NULL);
INSERT INTO `visitor_registries` VALUES (513, 25, '113.89.11.93', '2020-09-03 13:55:55', '2020-09-03 13:57:20', NULL);
INSERT INTO `visitor_registries` VALUES (514, 16, '116.25.236.155', '2020-09-04 01:10:26', '2020-09-04 01:10:26', NULL);
INSERT INTO `visitor_registries` VALUES (515, 25, '14.30.63.168', '2020-09-04 14:15:37', '2020-09-04 14:15:37', NULL);
INSERT INTO `visitor_registries` VALUES (516, 17, '203.208.60.46', '2020-09-04 14:17:35', '2020-09-04 14:17:35', NULL);
INSERT INTO `visitor_registries` VALUES (517, 25, '61.141.72.102', '2020-09-04 14:50:26', '2020-09-04 14:50:26', NULL);
INSERT INTO `visitor_registries` VALUES (518, 25, '113.89.11.253', '2020-09-04 16:57:37', '2020-09-04 16:57:37', NULL);
INSERT INTO `visitor_registries` VALUES (519, 21, '203.208.60.2', '2020-09-04 22:21:34', '2020-09-04 22:21:34', NULL);
INSERT INTO `visitor_registries` VALUES (520, 20, '203.208.60.75', '2020-09-05 03:59:46', '2020-09-05 03:59:46', NULL);
INSERT INTO `visitor_registries` VALUES (521, 16, '203.208.60.19', '2020-09-05 05:44:56', '2020-09-05 05:44:56', NULL);
INSERT INTO `visitor_registries` VALUES (522, 25, '119.123.72.139', '2020-09-06 06:56:48', '2020-09-07 12:52:46', NULL);
INSERT INTO `visitor_registries` VALUES (523, 19, '203.208.60.50', '2020-09-06 15:14:10', '2020-09-06 15:14:10', NULL);
INSERT INTO `visitor_registries` VALUES (524, 16, '203.208.60.121', '2020-09-06 21:20:23', '2020-09-06 21:20:23', NULL);
INSERT INTO `visitor_registries` VALUES (525, 16, '66.249.79.177', '2020-09-06 22:49:45', '2020-09-06 22:49:45', NULL);
INSERT INTO `visitor_registries` VALUES (526, 18, '203.208.60.97', '2020-09-07 06:31:34', '2020-09-07 06:31:34', NULL);
INSERT INTO `visitor_registries` VALUES (527, 13, '116.25.239.130', '2020-09-07 09:30:09', '2020-09-08 06:46:04', NULL);
INSERT INTO `visitor_registries` VALUES (528, 25, '116.25.239.130', '2020-09-07 09:30:13', '2020-09-07 09:30:13', NULL);
INSERT INTO `visitor_registries` VALUES (529, 13, '119.123.72.139', '2020-09-07 12:52:38', '2020-09-07 12:52:38', NULL);
INSERT INTO `visitor_registries` VALUES (530, 25, '14.30.157.248', '2020-09-07 13:30:50', '2020-09-08 04:39:45', NULL);
INSERT INTO `visitor_registries` VALUES (531, 18, '203.208.60.115', '2020-09-08 00:46:58', '2020-11-13 03:48:18', NULL);
INSERT INTO `visitor_registries` VALUES (532, 21, '203.208.60.18', '2020-09-08 03:56:17', '2020-09-08 03:56:17', NULL);
INSERT INTO `visitor_registries` VALUES (533, 18, '14.30.157.248', '2020-09-08 04:39:58', '2020-09-08 04:39:58', NULL);
INSERT INTO `visitor_registries` VALUES (534, 25, '113.87.128.155', '2020-09-08 15:43:39', '2020-09-08 22:59:39', NULL);
INSERT INTO `visitor_registries` VALUES (535, 21, '113.87.128.155', '2020-09-08 15:44:21', '2020-09-08 15:44:21', NULL);
INSERT INTO `visitor_registries` VALUES (536, 20, '113.87.128.155', '2020-09-08 15:44:31', '2020-09-08 15:44:31', NULL);
INSERT INTO `visitor_registries` VALUES (537, 19, '113.87.128.155', '2020-09-08 15:44:39', '2020-09-08 15:44:39', NULL);
INSERT INTO `visitor_registries` VALUES (538, 18, '113.87.128.155', '2020-09-08 15:44:50', '2020-09-08 15:44:50', NULL);
INSERT INTO `visitor_registries` VALUES (539, 17, '113.87.128.155', '2020-09-08 15:45:06', '2020-09-08 15:45:06', NULL);
INSERT INTO `visitor_registries` VALUES (540, 13, '113.87.128.155', '2020-09-08 16:00:39', '2020-09-08 16:00:39', NULL);
INSERT INTO `visitor_registries` VALUES (541, 25, '14.28.1.110', '2020-09-09 08:55:24', '2020-09-09 08:55:24', NULL);
INSERT INTO `visitor_registries` VALUES (542, 25, '172.19.0.1', '2020-09-09 08:56:02', '2020-10-18 02:07:46', NULL);
INSERT INTO `visitor_registries` VALUES (543, 10, '203.208.60.21', '2020-09-09 21:13:15', '2020-09-09 21:13:15', NULL);
INSERT INTO `visitor_registries` VALUES (544, 19, '203.208.60.48', '2020-09-11 12:13:19', '2020-09-11 12:13:19', NULL);
INSERT INTO `visitor_registries` VALUES (545, 20, '172.19.0.1', '2020-09-11 12:50:14', '2020-09-11 12:50:14', NULL);
INSERT INTO `visitor_registries` VALUES (546, 13, '172.19.0.1', '2020-09-11 15:07:02', '2020-09-11 15:07:02', NULL);
INSERT INTO `visitor_registries` VALUES (547, 25, '203.208.60.93', '2020-09-11 20:09:04', '2020-09-11 20:09:04', NULL);
INSERT INTO `visitor_registries` VALUES (548, 13, '116.30.193.231', '2020-09-12 00:02:29', '2020-09-12 00:02:29', NULL);
INSERT INTO `visitor_registries` VALUES (549, 18, '203.208.60.107', '2020-09-12 00:52:39', '2020-09-12 00:52:39', NULL);
INSERT INTO `visitor_registries` VALUES (550, 25, '203.208.60.106', '2020-09-12 02:44:23', '2020-09-12 02:44:23', NULL);
INSERT INTO `visitor_registries` VALUES (551, 25, '113.116.49.11', '2020-09-13 01:38:40', '2020-09-13 01:38:40', NULL);
INSERT INTO `visitor_registries` VALUES (552, 13, '113.116.49.11', '2020-09-13 10:38:39', '2020-09-13 10:38:39', NULL);
INSERT INTO `visitor_registries` VALUES (553, 13, '113.116.49.12', '2020-09-13 14:57:02', '2020-09-13 14:57:02', NULL);
INSERT INTO `visitor_registries` VALUES (554, 25, '113.116.49.12', '2020-09-13 14:57:35', '2020-09-13 15:13:15', NULL);
INSERT INTO `visitor_registries` VALUES (555, 26, '113.116.49.12', '2020-09-13 16:18:50', '2020-09-13 16:30:59', NULL);
INSERT INTO `visitor_registries` VALUES (556, 20, '203.208.60.40', '2020-09-13 23:25:58', '2020-09-13 23:25:58', NULL);
INSERT INTO `visitor_registries` VALUES (557, 26, '119.84.158.15', '2020-09-14 02:05:30', '2020-09-14 02:05:30', NULL);
INSERT INTO `visitor_registries` VALUES (558, 13, '119.84.158.15', '2020-09-14 02:06:43', '2020-09-14 02:06:43', NULL);
INSERT INTO `visitor_registries` VALUES (559, 26, '203.208.60.35', '2020-09-14 02:23:32', '2020-09-14 02:23:32', NULL);
INSERT INTO `visitor_registries` VALUES (560, 26, '113.87.91.157', '2020-09-14 11:16:23', '2020-09-15 14:53:43', NULL);
INSERT INTO `visitor_registries` VALUES (561, 26, '172.19.0.1', '2020-09-14 12:25:16', '2020-09-17 14:48:51', NULL);
INSERT INTO `visitor_registries` VALUES (562, 19, '203.208.60.39', '2020-09-14 17:01:34', '2020-09-14 17:01:34', NULL);
INSERT INTO `visitor_registries` VALUES (563, 13, '203.208.60.101', '2020-09-14 23:31:10', '2020-10-31 02:29:59', NULL);
INSERT INTO `visitor_registries` VALUES (564, 26, '183.42.15.216', '2020-09-15 00:11:08', '2020-09-15 00:11:08', NULL);
INSERT INTO `visitor_registries` VALUES (565, 17, '203.208.60.59', '2020-09-15 05:23:32', '2020-09-15 05:23:32', NULL);
INSERT INTO `visitor_registries` VALUES (566, 8, '113.87.91.157', '2020-09-15 12:17:30', '2020-09-15 12:17:30', NULL);
INSERT INTO `visitor_registries` VALUES (567, 25, '113.87.91.157', '2020-09-15 13:50:18', '2020-09-15 13:50:18', NULL);
INSERT INTO `visitor_registries` VALUES (568, 21, '113.87.91.157', '2020-09-15 13:54:59', '2020-09-15 13:54:59', NULL);
INSERT INTO `visitor_registries` VALUES (569, 19, '113.87.91.157', '2020-09-15 13:55:21', '2020-09-15 13:55:21', NULL);
INSERT INTO `visitor_registries` VALUES (570, 16, '113.87.91.157', '2020-09-15 13:55:43', '2020-09-15 13:55:43', NULL);
INSERT INTO `visitor_registries` VALUES (571, 13, '203.208.60.68', '2020-09-15 20:28:00', '2020-09-15 20:28:00', NULL);
INSERT INTO `visitor_registries` VALUES (572, 26, '14.30.180.94', '2020-09-16 00:30:53', '2020-09-16 00:30:53', NULL);
INSERT INTO `visitor_registries` VALUES (573, 26, '113.116.158.123', '2020-09-16 13:57:07', '2020-09-16 13:57:07', NULL);
INSERT INTO `visitor_registries` VALUES (574, 24, '113.116.158.123', '2020-09-16 14:06:08', '2020-09-16 14:06:08', NULL);
INSERT INTO `visitor_registries` VALUES (575, 26, '116.25.237.62', '2020-09-17 03:50:56', '2020-09-17 03:50:56', NULL);
INSERT INTO `visitor_registries` VALUES (576, 25, '116.25.237.62', '2020-09-17 03:51:48', '2020-09-17 03:51:48', NULL);
INSERT INTO `visitor_registries` VALUES (577, 26, '116.25.236.134', '2020-09-18 07:43:15', '2020-09-18 07:43:15', NULL);
INSERT INTO `visitor_registries` VALUES (578, 25, '116.25.236.134', '2020-09-18 07:43:22', '2020-09-18 07:43:22', NULL);
INSERT INTO `visitor_registries` VALUES (579, 17, '203.208.60.18', '2020-09-18 14:38:53', '2020-09-18 14:38:53', NULL);
INSERT INTO `visitor_registries` VALUES (580, 26, '116.30.194.13', '2020-09-19 13:26:58', '2020-09-20 06:02:11', NULL);
INSERT INTO `visitor_registries` VALUES (581, 8, '116.30.194.13', '2020-09-19 14:05:39', '2020-09-19 14:05:39', NULL);
INSERT INTO `visitor_registries` VALUES (582, 25, '116.30.194.13', '2020-09-20 02:02:09', '2020-09-20 02:02:09', NULL);
INSERT INTO `visitor_registries` VALUES (583, 16, '116.30.194.13', '2020-09-20 02:02:21', '2020-09-20 02:02:21', NULL);
INSERT INTO `visitor_registries` VALUES (584, 27, '116.30.194.13', '2020-09-20 05:50:44', '2020-09-20 06:19:20', NULL);
INSERT INTO `visitor_registries` VALUES (585, 28, '116.30.194.13', '2020-09-20 05:57:26', '2020-09-20 06:19:03', NULL);
INSERT INTO `visitor_registries` VALUES (586, 16, '116.25.238.98', '2020-09-21 02:32:00', '2020-09-21 03:03:36', NULL);
INSERT INTO `visitor_registries` VALUES (587, 28, '113.87.91.7', '2020-09-22 12:16:41', '2020-09-23 23:26:52', NULL);
INSERT INTO `visitor_registries` VALUES (588, 26, '1.193.83.31', '2020-09-22 13:13:44', '2020-09-22 13:23:30', NULL);
INSERT INTO `visitor_registries` VALUES (589, 28, '1.193.83.31', '2020-09-22 13:14:36', '2020-09-22 13:14:36', NULL);
INSERT INTO `visitor_registries` VALUES (590, 29, '113.87.91.7', '2020-09-22 14:59:56', '2020-09-23 23:26:46', NULL);
INSERT INTO `visitor_registries` VALUES (591, 29, '116.25.236.190', '2020-09-23 03:10:42', '2020-09-23 03:10:42', NULL);
INSERT INTO `visitor_registries` VALUES (592, 28, '116.25.236.190', '2020-09-23 03:10:50', '2020-09-23 07:27:42', NULL);
INSERT INTO `visitor_registries` VALUES (593, 17, '116.25.238.18', '2020-09-23 08:16:57', '2020-09-23 08:16:57', NULL);
INSERT INTO `visitor_registries` VALUES (594, 8, '116.25.238.18', '2020-09-23 08:17:01', '2020-09-23 08:17:01', NULL);
INSERT INTO `visitor_registries` VALUES (595, 18, '203.208.60.1', '2020-09-23 10:11:35', '2020-09-23 10:11:35', NULL);
INSERT INTO `visitor_registries` VALUES (596, 30, '113.87.91.7', '2020-09-23 13:23:29', '2020-09-23 23:26:41', NULL);
INSERT INTO `visitor_registries` VALUES (597, 13, '203.208.60.9', '2020-09-23 14:58:36', '2020-09-23 14:58:36', NULL);
INSERT INTO `visitor_registries` VALUES (598, 13, '203.208.60.0', '2020-09-23 14:58:52', '2020-09-23 14:58:52', NULL);
INSERT INTO `visitor_registries` VALUES (599, 19, '113.87.91.7', '2020-09-23 23:12:54', '2020-09-23 23:12:54', NULL);
INSERT INTO `visitor_registries` VALUES (600, 27, '113.87.91.7', '2020-09-23 23:14:07', '2020-09-23 23:14:07', NULL);
INSERT INTO `visitor_registries` VALUES (601, 16, '113.87.91.7', '2020-09-23 23:15:17', '2020-09-23 23:15:18', NULL);
INSERT INTO `visitor_registries` VALUES (602, 24, '113.87.91.7', '2020-09-23 23:16:55', '2020-09-23 23:16:55', NULL);
INSERT INTO `visitor_registries` VALUES (603, 26, '113.87.91.7', '2020-09-23 23:25:04', '2020-09-23 23:25:04', NULL);
INSERT INTO `visitor_registries` VALUES (604, 17, '113.87.91.7', '2020-09-23 23:26:27', '2020-09-23 23:26:27', NULL);
INSERT INTO `visitor_registries` VALUES (605, 30, '203.208.60.93', '2020-09-24 00:27:48', '2020-09-24 00:27:48', NULL);
INSERT INTO `visitor_registries` VALUES (606, 14, '203.208.60.58', '2020-09-24 00:31:26', '2020-09-24 00:31:26', NULL);
INSERT INTO `visitor_registries` VALUES (607, 18, '203.208.60.51', '2020-09-24 00:31:54', '2020-09-24 00:31:54', NULL);
INSERT INTO `visitor_registries` VALUES (608, 13, '203.208.60.65', '2020-09-24 00:32:34', '2021-02-03 22:00:19', NULL);
INSERT INTO `visitor_registries` VALUES (609, 29, '203.208.60.80', '2020-09-24 00:32:56', '2020-09-24 00:32:56', NULL);
INSERT INTO `visitor_registries` VALUES (610, 26, '203.208.60.99', '2020-09-24 00:33:18', '2020-09-24 00:33:18', NULL);
INSERT INTO `visitor_registries` VALUES (611, 27, '203.208.60.117', '2020-09-24 00:33:49', '2020-09-24 00:33:49', NULL);
INSERT INTO `visitor_registries` VALUES (612, 26, '203.208.60.74', '2020-09-24 00:34:29', '2020-09-24 00:34:29', NULL);
INSERT INTO `visitor_registries` VALUES (613, 27, '203.208.60.66', '2020-09-24 00:35:02', '2021-01-12 12:59:22', NULL);
INSERT INTO `visitor_registries` VALUES (614, 16, '203.208.60.89', '2020-09-24 00:51:29', '2020-09-24 00:51:29', NULL);
INSERT INTO `visitor_registries` VALUES (615, 16, '203.208.60.41', '2020-09-24 00:52:53', '2020-09-24 00:52:53', NULL);
INSERT INTO `visitor_registries` VALUES (616, 26, '117.159.27.60', '2020-09-24 03:53:59', '2020-09-24 03:53:59', NULL);
INSERT INTO `visitor_registries` VALUES (617, 29, '116.25.238.18', '2020-09-24 06:45:08', '2020-09-24 06:45:08', NULL);
INSERT INTO `visitor_registries` VALUES (618, 28, '116.25.238.18', '2020-09-24 06:45:11', '2020-09-24 06:45:11', NULL);
INSERT INTO `visitor_registries` VALUES (619, 26, '116.25.238.18', '2020-09-24 06:45:16', '2020-09-24 06:46:05', NULL);
INSERT INTO `visitor_registries` VALUES (620, 27, '116.25.238.18', '2020-09-24 06:53:17', '2020-09-24 06:53:17', NULL);
INSERT INTO `visitor_registries` VALUES (621, 13, '116.25.238.18', '2020-09-24 06:55:21', '2020-09-24 06:55:21', NULL);
INSERT INTO `visitor_registries` VALUES (622, 16, '116.25.236.188', '2020-09-25 08:37:42', '2020-09-27 06:18:47', NULL);
INSERT INTO `visitor_registries` VALUES (623, 26, '171.11.3.50', '2020-09-25 23:52:41', '2020-09-25 23:52:41', NULL);
INSERT INTO `visitor_registries` VALUES (624, 26, '42.236.10.125', '2020-09-25 23:52:46', '2020-09-25 23:52:46', NULL);
INSERT INTO `visitor_registries` VALUES (625, 18, '203.208.60.77', '2020-09-26 04:29:23', '2020-09-26 04:29:23', NULL);
INSERT INTO `visitor_registries` VALUES (626, 18, '203.208.60.26', '2020-09-26 16:33:17', '2020-09-26 16:33:17', NULL);
INSERT INTO `visitor_registries` VALUES (627, 29, '116.25.236.188', '2020-09-27 02:57:32', '2020-09-27 02:57:32', NULL);
INSERT INTO `visitor_registries` VALUES (628, 28, '116.25.236.188', '2020-09-27 02:57:39', '2020-09-27 06:16:08', NULL);
INSERT INTO `visitor_registries` VALUES (629, 26, '116.25.236.188', '2020-09-27 02:58:12', '2020-09-27 06:16:37', NULL);
INSERT INTO `visitor_registries` VALUES (630, 18, '116.25.236.188', '2020-09-27 02:59:06', '2020-09-27 02:59:06', NULL);
INSERT INTO `visitor_registries` VALUES (631, 23, '116.25.236.188', '2020-09-27 06:07:16', '2020-09-27 06:07:16', NULL);
INSERT INTO `visitor_registries` VALUES (632, 28, '116.25.238.219', '2020-09-27 08:09:09', '2020-09-27 08:09:09', NULL);
INSERT INTO `visitor_registries` VALUES (633, 30, '116.30.193.198', '2020-09-27 11:57:26', '2020-09-27 11:57:26', NULL);
INSERT INTO `visitor_registries` VALUES (634, 27, '116.25.238.219', '2020-09-28 02:26:04', '2020-09-28 02:46:09', NULL);
INSERT INTO `visitor_registries` VALUES (635, 30, '116.25.238.219', '2020-09-28 05:25:32', '2020-09-28 05:25:32', NULL);
INSERT INTO `visitor_registries` VALUES (636, 26, '116.25.238.219', '2020-09-28 06:40:52', '2020-09-28 06:40:52', NULL);
INSERT INTO `visitor_registries` VALUES (637, 26, '42.194.202.189', '2020-09-28 06:41:00', '2020-09-28 06:41:00', NULL);
INSERT INTO `visitor_registries` VALUES (638, 30, '120.229.20.77', '2020-09-28 14:39:48', '2020-09-28 14:39:48', NULL);
INSERT INTO `visitor_registries` VALUES (639, 27, '120.229.20.216', '2020-09-28 23:29:37', '2020-09-28 23:29:37', NULL);
INSERT INTO `visitor_registries` VALUES (640, 17, '120.229.20.216', '2020-09-28 23:49:52', '2020-09-28 23:49:52', NULL);
INSERT INTO `visitor_registries` VALUES (641, 30, '223.104.65.34', '2020-09-29 03:14:08', '2020-09-29 03:14:08', NULL);
INSERT INTO `visitor_registries` VALUES (642, 30, '117.166.48.6', '2020-09-29 12:47:41', '2020-09-29 14:13:34', NULL);
INSERT INTO `visitor_registries` VALUES (643, 19, '203.208.60.88', '2020-09-30 16:18:10', '2020-09-30 16:18:10', NULL);
INSERT INTO `visitor_registries` VALUES (644, 30, '203.208.60.66', '2020-10-01 03:43:28', '2020-10-01 03:43:28', NULL);
INSERT INTO `visitor_registries` VALUES (645, 29, '203.208.60.12', '2020-10-01 03:45:18', '2020-11-13 12:02:15', NULL);
INSERT INTO `visitor_registries` VALUES (646, 27, '203.208.60.76', '2020-10-01 15:02:39', '2021-02-22 16:42:26', NULL);
INSERT INTO `visitor_registries` VALUES (647, 13, '203.208.60.110', '2020-10-01 16:07:36', '2020-10-01 16:07:36', NULL);
INSERT INTO `visitor_registries` VALUES (648, 30, '172.19.0.1', '2020-10-02 00:42:13', '2020-10-18 02:07:14', NULL);
INSERT INTO `visitor_registries` VALUES (649, 21, '203.208.60.98', '2020-10-04 19:26:22', '2020-10-04 19:26:22', NULL);
INSERT INTO `visitor_registries` VALUES (650, 17, '203.208.60.76', '2020-10-05 04:32:11', '2020-10-05 04:32:11', NULL);
INSERT INTO `visitor_registries` VALUES (651, 18, '120.19.45.166', '2020-10-05 13:34:16', '2020-10-05 13:34:16', NULL);
INSERT INTO `visitor_registries` VALUES (652, 17, '203.208.60.5', '2020-10-05 17:41:17', '2020-10-05 17:41:17', NULL);
INSERT INTO `visitor_registries` VALUES (653, 21, '203.208.60.26', '2020-10-05 18:16:49', '2020-10-05 18:16:49', NULL);
INSERT INTO `visitor_registries` VALUES (654, 17, '203.208.60.114', '2020-10-06 03:29:46', '2020-10-06 03:29:46', NULL);
INSERT INTO `visitor_registries` VALUES (655, 21, '203.208.60.84', '2020-10-06 18:54:44', '2021-02-08 21:32:33', NULL);
INSERT INTO `visitor_registries` VALUES (656, 13, '203.208.60.12', '2020-10-07 08:17:42', '2020-10-07 08:17:42', NULL);
INSERT INTO `visitor_registries` VALUES (657, 29, '172.19.0.1', '2020-10-07 09:16:00', '2020-10-18 02:07:24', NULL);
INSERT INTO `visitor_registries` VALUES (658, 28, '172.19.0.1', '2020-10-07 09:16:07', '2020-10-17 07:44:32', NULL);
INSERT INTO `visitor_registries` VALUES (659, 10, '172.19.0.1', '2020-10-07 09:47:14', '2020-10-07 09:47:14', NULL);
INSERT INTO `visitor_registries` VALUES (660, 13, '203.208.60.119', '2020-10-08 23:12:20', '2020-12-26 10:41:23', NULL);
INSERT INTO `visitor_registries` VALUES (661, 27, '116.25.237.121', '2020-10-09 01:32:09', '2020-10-09 01:32:09', NULL);
INSERT INTO `visitor_registries` VALUES (662, 31, '116.25.237.121', '2020-10-09 02:46:12', '2020-10-09 02:47:44', NULL);
INSERT INTO `visitor_registries` VALUES (663, 29, '116.25.237.121', '2020-10-09 02:47:53', '2020-10-09 02:47:53', NULL);
INSERT INTO `visitor_registries` VALUES (664, 21, '203.208.60.86', '2020-10-09 07:55:03', '2020-10-09 07:55:03', NULL);
INSERT INTO `visitor_registries` VALUES (665, 29, '116.25.239.221', '2020-10-10 01:42:45', '2020-10-10 01:42:45', NULL);
INSERT INTO `visitor_registries` VALUES (666, 16, '116.25.239.221', '2020-10-10 01:43:02', '2020-10-10 01:43:02', NULL);
INSERT INTO `visitor_registries` VALUES (667, 27, '116.25.239.221', '2020-10-11 02:20:01', '2020-10-11 02:20:01', NULL);
INSERT INTO `visitor_registries` VALUES (668, 18, '116.25.239.221', '2020-10-11 06:49:46', '2020-10-11 06:49:46', NULL);
INSERT INTO `visitor_registries` VALUES (669, 25, '116.25.239.221', '2020-10-11 06:49:52', '2020-10-11 07:05:46', NULL);
INSERT INTO `visitor_registries` VALUES (670, 31, '116.25.239.221', '2020-10-11 07:01:12', '2020-10-11 07:01:12', NULL);
INSERT INTO `visitor_registries` VALUES (671, 26, '116.25.239.221', '2020-10-11 07:01:19', '2020-10-11 07:02:57', NULL);
INSERT INTO `visitor_registries` VALUES (672, 28, '116.25.239.221', '2020-10-11 07:05:42', '2020-10-11 07:05:42', NULL);
INSERT INTO `visitor_registries` VALUES (673, 19, '116.25.239.221', '2020-10-11 07:05:54', '2020-10-11 07:05:54', NULL);
INSERT INTO `visitor_registries` VALUES (674, 14, '116.25.239.221', '2020-10-11 07:06:19', '2020-10-11 07:06:19', NULL);
INSERT INTO `visitor_registries` VALUES (675, 23, '116.25.239.221', '2020-10-11 07:06:44', '2020-10-11 07:06:44', NULL);
INSERT INTO `visitor_registries` VALUES (676, 25, '116.25.239.207', '2020-10-12 06:42:52', '2020-10-12 06:42:52', NULL);
INSERT INTO `visitor_registries` VALUES (677, 31, '113.88.133.61', '2020-10-12 14:18:56', '2020-10-13 12:23:27', NULL);
INSERT INTO `visitor_registries` VALUES (678, 31, '203.208.60.122', '2020-10-13 00:43:06', '2020-10-13 00:43:06', NULL);
INSERT INTO `visitor_registries` VALUES (679, 29, '203.208.60.7', '2020-10-13 00:48:51', '2021-02-10 00:43:06', NULL);
INSERT INTO `visitor_registries` VALUES (680, 8, '203.208.60.123', '2020-10-13 00:53:03', '2020-10-13 00:53:03', NULL);
INSERT INTO `visitor_registries` VALUES (681, 8, '203.208.60.28', '2020-10-13 00:55:25', '2020-10-13 00:55:25', NULL);
INSERT INTO `visitor_registries` VALUES (682, 28, '203.208.60.62', '2020-10-13 07:09:08', '2020-10-13 07:09:08', NULL);
INSERT INTO `visitor_registries` VALUES (683, 28, '203.208.60.10', '2020-10-13 07:10:42', '2020-10-13 07:10:42', NULL);
INSERT INTO `visitor_registries` VALUES (684, 29, '116.25.237.206', '2020-10-13 08:05:29', '2020-10-13 09:05:35', NULL);
INSERT INTO `visitor_registries` VALUES (685, 30, '116.25.237.206', '2020-10-13 08:37:05', '2020-10-13 08:37:05', NULL);
INSERT INTO `visitor_registries` VALUES (686, 31, '116.25.237.206', '2020-10-13 08:44:41', '2020-10-13 08:44:41', NULL);
INSERT INTO `visitor_registries` VALUES (687, 28, '116.25.237.206', '2020-10-13 09:05:23', '2020-10-13 09:05:23', NULL);
INSERT INTO `visitor_registries` VALUES (688, 25, '203.208.60.94', '2020-10-13 10:11:31', '2020-10-13 10:11:31', NULL);
INSERT INTO `visitor_registries` VALUES (689, 31, '172.19.0.1', '2020-10-13 12:13:14', '2020-10-18 02:07:08', NULL);
INSERT INTO `visitor_registries` VALUES (690, 29, '113.88.133.61', '2020-10-13 12:20:05', '2020-10-13 12:23:36', NULL);
INSERT INTO `visitor_registries` VALUES (691, 26, '113.88.133.61', '2020-10-13 12:23:57', '2020-10-13 12:23:57', NULL);
INSERT INTO `visitor_registries` VALUES (692, 18, '113.88.133.61', '2020-10-13 12:49:16', '2020-10-13 12:49:16', NULL);
INSERT INTO `visitor_registries` VALUES (693, 25, '113.88.133.61', '2020-10-13 12:49:28', '2020-10-13 12:49:28', NULL);
INSERT INTO `visitor_registries` VALUES (694, 25, '203.208.60.55', '2020-10-13 20:04:24', '2020-10-13 20:04:24', NULL);
INSERT INTO `visitor_registries` VALUES (695, 25, '203.208.60.97', '2020-10-14 08:02:22', '2020-10-14 08:02:23', NULL);
INSERT INTO `visitor_registries` VALUES (696, 31, '113.116.159.119', '2020-10-14 12:27:48', '2020-10-14 12:27:48', NULL);
INSERT INTO `visitor_registries` VALUES (697, 30, '116.25.236.22', '2020-10-16 05:52:03', '2020-10-20 12:00:32', NULL);
INSERT INTO `visitor_registries` VALUES (698, 19, '116.25.236.22', '2020-10-16 07:53:10', '2020-10-16 07:53:10', NULL);
INSERT INTO `visitor_registries` VALUES (699, 18, '172.19.0.1', '2020-10-17 07:15:17', '2020-10-17 07:19:08', NULL);
INSERT INTO `visitor_registries` VALUES (700, 16, '172.19.0.1', '2020-10-18 03:30:40', '2020-10-18 04:50:11', NULL);
INSERT INTO `visitor_registries` VALUES (701, 30, '113.116.49.123', '2020-10-18 04:49:51', '2020-10-19 13:37:47', NULL);
INSERT INTO `visitor_registries` VALUES (702, 18, '113.116.49.123', '2020-10-18 04:49:57', '2020-10-18 04:49:57', NULL);
INSERT INTO `visitor_registries` VALUES (703, 21, '172.19.0.1', '2020-10-18 04:50:30', '2020-10-18 04:50:30', NULL);
INSERT INTO `visitor_registries` VALUES (704, 19, '172.19.0.1', '2020-10-18 14:16:33', '2020-10-18 14:16:33', NULL);
INSERT INTO `visitor_registries` VALUES (705, 31, '113.116.49.123', '2020-10-18 14:16:45', '2020-10-19 13:37:41', NULL);
INSERT INTO `visitor_registries` VALUES (706, 29, '113.116.49.123', '2020-10-19 13:37:52', '2020-10-19 13:37:52', NULL);
INSERT INTO `visitor_registries` VALUES (707, 27, '113.116.49.123', '2020-10-19 13:37:56', '2020-10-19 13:37:56', NULL);
INSERT INTO `visitor_registries` VALUES (708, 26, '113.116.49.123', '2020-10-19 13:38:16', '2020-10-19 13:38:16', NULL);
INSERT INTO `visitor_registries` VALUES (709, 25, '113.116.49.123', '2020-10-19 13:38:38', '2020-10-19 13:38:38', NULL);
INSERT INTO `visitor_registries` VALUES (710, 28, '116.25.236.22', '2020-10-20 01:19:59', '2020-10-20 01:19:59', NULL);
INSERT INTO `visitor_registries` VALUES (711, 26, '116.25.236.22', '2020-10-20 01:20:11', '2020-10-20 01:20:11', NULL);
INSERT INTO `visitor_registries` VALUES (712, 24, '116.25.236.22', '2020-10-20 02:20:19', '2020-10-20 02:20:19', NULL);
INSERT INTO `visitor_registries` VALUES (713, 27, '202.65.196.242', '2020-10-20 03:20:22', '2020-10-20 03:20:22', NULL);
INSERT INTO `visitor_registries` VALUES (714, 8, '116.25.236.22', '2020-10-20 07:01:29', '2020-10-21 01:47:23', NULL);
INSERT INTO `visitor_registries` VALUES (715, 31, '116.25.236.22', '2020-10-20 11:30:31', '2020-10-20 11:30:31', NULL);
INSERT INTO `visitor_registries` VALUES (716, 14, '113.88.132.80', '2020-10-20 14:47:54', '2020-10-20 14:47:54', NULL);
INSERT INTO `visitor_registries` VALUES (717, 8, '113.88.132.80', '2020-10-20 14:48:10', '2020-10-21 13:07:56', NULL);
INSERT INTO `visitor_registries` VALUES (718, 8, '116.25.238.91', '2020-10-21 05:56:06', '2020-10-22 10:57:20', NULL);
INSERT INTO `visitor_registries` VALUES (719, 30, '116.25.238.91', '2020-10-21 05:56:36', '2020-10-21 05:56:37', NULL);
INSERT INTO `visitor_registries` VALUES (720, 27, '116.25.238.91', '2020-10-21 09:34:35', '2020-10-21 09:34:35', NULL);
INSERT INTO `visitor_registries` VALUES (721, 18, '116.25.238.91', '2020-10-21 09:34:43', '2020-10-21 09:34:43', NULL);
INSERT INTO `visitor_registries` VALUES (722, 31, '113.88.132.80', '2020-10-21 13:05:45', '2020-10-21 15:06:29', NULL);
INSERT INTO `visitor_registries` VALUES (723, 29, '113.88.132.80', '2020-10-21 13:05:55', '2020-10-21 13:05:55', NULL);
INSERT INTO `visitor_registries` VALUES (724, 27, '113.88.132.80', '2020-10-21 13:06:03', '2020-10-21 13:06:03', NULL);
INSERT INTO `visitor_registries` VALUES (725, 16, '113.88.132.80', '2020-10-21 13:59:32', '2020-10-21 14:04:46', NULL);
INSERT INTO `visitor_registries` VALUES (726, 30, '113.88.132.80', '2020-10-21 14:34:37', '2020-10-21 15:02:53', NULL);
INSERT INTO `visitor_registries` VALUES (727, 25, '113.88.132.80', '2020-10-21 15:05:57', '2020-10-21 15:06:17', NULL);
INSERT INTO `visitor_registries` VALUES (728, 3, '203.208.60.65', '2020-10-22 11:26:55', '2020-10-22 11:26:55', NULL);
INSERT INTO `visitor_registries` VALUES (729, 8, '113.116.159.221', '2020-10-22 16:15:47', '2020-10-22 16:15:47', NULL);
INSERT INTO `visitor_registries` VALUES (730, 30, '117.136.32.1', '2020-10-23 10:30:16', '2020-10-23 10:30:16', NULL);
INSERT INTO `visitor_registries` VALUES (731, 29, '117.136.32.1', '2020-10-23 10:30:26', '2020-10-23 10:30:26', NULL);
INSERT INTO `visitor_registries` VALUES (732, 28, '117.136.32.1', '2020-10-23 10:30:39', '2020-10-23 10:30:39', NULL);
INSERT INTO `visitor_registries` VALUES (733, 16, '117.136.32.1', '2020-10-23 10:30:54', '2020-10-23 10:30:54', NULL);
INSERT INTO `visitor_registries` VALUES (734, 31, '113.116.159.221', '2020-10-23 14:12:33', '2020-10-23 14:12:34', NULL);
INSERT INTO `visitor_registries` VALUES (735, 8, '116.30.195.14', '2020-10-24 04:41:35', '2020-10-25 18:56:31', NULL);
INSERT INTO `visitor_registries` VALUES (736, 29, '116.30.195.14', '2020-10-24 12:19:48', '2020-10-24 12:24:25', NULL);
INSERT INTO `visitor_registries` VALUES (737, 10, '116.30.195.14', '2020-10-24 12:20:07', '2020-10-24 12:20:07', NULL);
INSERT INTO `visitor_registries` VALUES (738, 14, '116.30.195.14', '2020-10-24 12:22:13', '2020-10-24 12:22:13', NULL);
INSERT INTO `visitor_registries` VALUES (739, 32, '116.30.195.14', '2020-10-24 16:20:31', '2020-10-25 18:56:25', NULL);
INSERT INTO `visitor_registries` VALUES (740, 31, '116.30.195.14', '2020-10-25 17:20:44', '2020-10-25 17:21:12', NULL);
INSERT INTO `visitor_registries` VALUES (741, 8, '172.104.56.177', '2020-10-25 18:05:35', '2020-10-25 19:25:16', NULL);
INSERT INTO `visitor_registries` VALUES (742, 32, '172.104.56.177', '2020-10-25 18:05:44', '2020-10-25 18:07:37', NULL);
INSERT INTO `visitor_registries` VALUES (743, 32, '116.25.237.75', '2020-10-26 01:12:09', '2020-10-26 01:12:09', NULL);
INSERT INTO `visitor_registries` VALUES (744, 8, '116.25.237.75', '2020-10-26 01:12:11', '2020-10-26 01:12:11', NULL);
INSERT INTO `visitor_registries` VALUES (745, 32, '112.97.166.186', '2020-10-26 09:19:13', '2020-10-26 09:42:52', NULL);
INSERT INTO `visitor_registries` VALUES (746, 8, '112.97.166.186', '2020-10-26 09:19:15', '2020-10-26 09:19:15', NULL);
INSERT INTO `visitor_registries` VALUES (747, 32, '117.136.33.54', '2020-10-27 01:15:24', '2020-10-27 01:27:20', NULL);
INSERT INTO `visitor_registries` VALUES (748, 18, '117.136.33.54', '2020-10-27 01:30:12', '2020-10-27 01:30:12', NULL);
INSERT INTO `visitor_registries` VALUES (749, 28, '117.136.33.54', '2020-10-27 01:30:37', '2020-10-27 01:30:37', NULL);
INSERT INTO `visitor_registries` VALUES (750, 13, '203.208.60.11', '2020-10-30 04:12:54', '2020-10-30 04:12:54', NULL);
INSERT INTO `visitor_registries` VALUES (751, 27, '139.159.170.3', '2020-10-30 05:59:09', '2020-10-30 05:59:09', NULL);
INSERT INTO `visitor_registries` VALUES (752, 21, '203.208.60.23', '2020-10-30 07:35:57', '2020-10-30 07:35:57', NULL);
INSERT INTO `visitor_registries` VALUES (753, 27, '203.208.60.99', '2020-10-30 08:15:24', '2020-10-30 08:15:24', NULL);
INSERT INTO `visitor_registries` VALUES (754, 32, '203.208.60.115', '2020-10-30 09:07:19', '2020-10-30 09:07:19', NULL);
INSERT INTO `visitor_registries` VALUES (755, 32, '203.208.60.56', '2020-10-30 09:33:30', '2020-10-30 09:33:30', NULL);
INSERT INTO `visitor_registries` VALUES (756, 28, '203.208.60.106', '2020-10-30 14:17:20', '2020-10-30 14:17:20', NULL);
INSERT INTO `visitor_registries` VALUES (757, 13, '203.208.60.32', '2020-10-30 15:27:28', '2020-10-30 15:27:28', NULL);
INSERT INTO `visitor_registries` VALUES (758, 27, '203.208.60.53', '2020-10-30 16:38:45', '2021-02-04 14:15:04', NULL);
INSERT INTO `visitor_registries` VALUES (759, 30, '117.136.40.191', '2020-10-31 08:26:05', '2020-10-31 08:26:05', NULL);
INSERT INTO `visitor_registries` VALUES (760, 8, '117.136.40.191', '2020-10-31 08:26:21', '2020-10-31 08:26:21', NULL);
INSERT INTO `visitor_registries` VALUES (761, 31, '117.136.40.191', '2020-10-31 08:26:35', '2020-10-31 08:26:35', NULL);
INSERT INTO `visitor_registries` VALUES (762, 29, '117.136.40.191', '2020-10-31 08:28:02', '2020-10-31 08:28:02', NULL);
INSERT INTO `visitor_registries` VALUES (763, 14, '116.25.236.65', '2020-11-02 09:52:43', '2020-11-02 09:52:43', NULL);
INSERT INTO `visitor_registries` VALUES (764, 21, '203.208.60.75', '2020-11-05 11:51:31', '2020-11-05 11:51:31', NULL);
INSERT INTO `visitor_registries` VALUES (765, 29, '203.208.60.121', '2020-11-05 12:56:41', '2020-11-05 12:56:41', NULL);
INSERT INTO `visitor_registries` VALUES (766, 19, '113.88.132.163', '2020-11-06 23:23:07', '2020-11-06 23:23:07', NULL);
INSERT INTO `visitor_registries` VALUES (767, 32, '223.104.66.59', '2020-11-09 10:31:40', '2020-11-09 10:31:40', NULL);
INSERT INTO `visitor_registries` VALUES (768, 31, '223.104.66.59', '2020-11-09 10:32:00', '2020-11-09 10:32:00', NULL);
INSERT INTO `visitor_registries` VALUES (769, 29, '223.104.66.59', '2020-11-09 10:32:18', '2020-11-09 10:32:18', NULL);
INSERT INTO `visitor_registries` VALUES (770, 28, '223.104.66.59', '2020-11-09 10:33:05', '2020-11-09 10:33:05', NULL);
INSERT INTO `visitor_registries` VALUES (771, 27, '223.104.66.59', '2020-11-09 10:33:20', '2020-11-09 10:33:20', NULL);
INSERT INTO `visitor_registries` VALUES (772, 26, '223.104.66.59', '2020-11-09 10:33:32', '2020-11-09 10:33:32', NULL);
INSERT INTO `visitor_registries` VALUES (773, 25, '223.104.66.59', '2020-11-09 10:33:57', '2020-11-09 10:33:57', NULL);
INSERT INTO `visitor_registries` VALUES (774, 21, '223.104.66.59', '2020-11-09 10:34:40', '2020-11-09 10:34:40', NULL);
INSERT INTO `visitor_registries` VALUES (775, 28, '203.208.60.75', '2020-11-10 09:35:51', '2020-11-10 09:35:51', NULL);
INSERT INTO `visitor_registries` VALUES (776, 21, '203.208.60.51', '2020-11-10 14:21:05', '2021-02-21 16:02:59', NULL);
INSERT INTO `visitor_registries` VALUES (777, 25, '203.208.60.2', '2020-11-10 19:28:47', '2020-11-10 19:28:47', NULL);
INSERT INTO `visitor_registries` VALUES (778, 21, '203.208.60.91', '2020-11-11 03:35:07', '2020-11-11 03:35:07', NULL);
INSERT INTO `visitor_registries` VALUES (779, 25, '203.208.60.68', '2020-11-11 04:08:50', '2020-11-11 04:08:50', NULL);
INSERT INTO `visitor_registries` VALUES (780, 14, '203.208.60.32', '2020-11-11 07:47:42', '2020-12-04 03:19:04', NULL);
INSERT INTO `visitor_registries` VALUES (781, 28, '203.208.60.19', '2020-11-12 22:09:50', '2020-11-12 22:09:50', NULL);
INSERT INTO `visitor_registries` VALUES (782, 8, '139.159.170.21', '2020-11-13 06:11:18', '2020-11-13 06:11:18', NULL);
INSERT INTO `visitor_registries` VALUES (783, 17, '203.208.60.95', '2020-11-13 11:32:34', '2020-11-13 11:32:34', NULL);
INSERT INTO `visitor_registries` VALUES (784, 32, '113.89.32.253', '2020-11-14 02:33:56', '2020-11-14 02:33:56', NULL);
INSERT INTO `visitor_registries` VALUES (785, 32, '223.73.185.250', '2020-11-14 03:48:36', '2020-11-14 03:49:54', NULL);
INSERT INTO `visitor_registries` VALUES (786, 32, '27.115.124.70', '2020-11-14 03:48:43', '2020-11-14 03:48:43', NULL);
INSERT INTO `visitor_registries` VALUES (787, 21, '203.208.60.102', '2020-11-17 16:00:21', '2020-11-17 16:00:21', NULL);
INSERT INTO `visitor_registries` VALUES (788, 25, '203.208.60.105', '2020-11-18 13:23:24', '2020-11-18 13:23:24', NULL);
INSERT INTO `visitor_registries` VALUES (789, 32, '139.159.170.11', '2020-11-19 01:57:34', '2020-11-19 01:57:34', NULL);
INSERT INTO `visitor_registries` VALUES (790, 26, '139.159.170.30', '2020-11-19 11:18:52', '2020-11-19 11:18:52', NULL);
INSERT INTO `visitor_registries` VALUES (791, 21, '203.208.60.62', '2020-11-20 03:21:51', '2020-11-20 03:21:52', NULL);
INSERT INTO `visitor_registries` VALUES (792, 26, '139.159.170.11', '2020-11-20 09:02:26', '2020-11-20 09:04:09', NULL);
INSERT INTO `visitor_registries` VALUES (793, 24, '139.159.170.11', '2020-11-20 09:06:41', '2020-11-20 09:06:41', NULL);
INSERT INTO `visitor_registries` VALUES (794, 30, '113.116.51.106', '2020-11-20 15:00:20', '2020-11-20 15:00:20', NULL);
INSERT INTO `visitor_registries` VALUES (795, 28, '113.116.51.106', '2020-11-20 15:00:25', '2020-11-20 15:00:31', NULL);
INSERT INTO `visitor_registries` VALUES (796, 27, '113.116.51.106', '2020-11-20 15:00:48', '2020-11-20 15:00:48', NULL);
INSERT INTO `visitor_registries` VALUES (797, 26, '113.116.51.106', '2020-11-20 15:00:54', '2020-11-20 15:00:55', NULL);
INSERT INTO `visitor_registries` VALUES (798, 25, '113.116.51.106', '2020-11-20 15:01:25', '2020-11-20 15:01:25', NULL);
INSERT INTO `visitor_registries` VALUES (799, 14, '113.116.51.106', '2020-11-20 15:03:09', '2020-11-22 05:05:11', NULL);
INSERT INTO `visitor_registries` VALUES (800, 32, '117.136.12.163', '2020-11-22 07:35:17', '2020-11-22 07:37:09', NULL);
INSERT INTO `visitor_registries` VALUES (801, 16, '117.136.12.163', '2020-11-22 07:35:28', '2020-11-22 07:35:28', NULL);
INSERT INTO `visitor_registries` VALUES (802, 32, '113.116.51.106', '2020-11-22 07:40:32', '2020-11-22 14:29:16', NULL);
INSERT INTO `visitor_registries` VALUES (803, 21, '113.116.51.106', '2020-11-22 14:24:57', '2020-11-22 14:24:57', NULL);
INSERT INTO `visitor_registries` VALUES (804, 32, '116.25.237.252', '2020-11-23 04:04:05', '2020-11-23 04:04:05', NULL);
INSERT INTO `visitor_registries` VALUES (805, 31, '117.136.33.151', '2020-11-23 13:40:39', '2020-11-23 13:40:39', NULL);
INSERT INTO `visitor_registries` VALUES (806, 30, '117.136.33.151', '2020-11-23 13:42:06', '2020-11-23 13:42:06', NULL);
INSERT INTO `visitor_registries` VALUES (807, 29, '117.136.33.151', '2020-11-23 13:42:14', '2020-11-23 13:42:14', NULL);
INSERT INTO `visitor_registries` VALUES (808, 27, '117.136.33.151', '2020-11-23 13:42:32', '2020-11-23 13:42:32', NULL);
INSERT INTO `visitor_registries` VALUES (809, 26, '117.136.33.151', '2020-11-23 13:42:45', '2020-11-23 13:42:45', NULL);
INSERT INTO `visitor_registries` VALUES (810, 25, '117.136.33.151', '2020-11-23 13:43:46', '2020-11-23 13:43:46', NULL);
INSERT INTO `visitor_registries` VALUES (811, 21, '203.208.60.40', '2020-11-23 20:12:24', '2020-11-23 20:12:24', NULL);
INSERT INTO `visitor_registries` VALUES (812, 21, '203.208.60.96', '2020-11-24 18:10:35', '2021-02-11 13:03:16', NULL);
INSERT INTO `visitor_registries` VALUES (813, 32, '113.88.133.178', '2020-11-25 11:49:46', '2020-11-25 11:49:46', NULL);
INSERT INTO `visitor_registries` VALUES (814, 29, '113.88.133.178', '2020-11-25 11:53:30', '2020-11-25 11:53:31', NULL);
INSERT INTO `visitor_registries` VALUES (815, 26, '113.88.133.178', '2020-11-25 11:53:38', '2020-11-25 11:54:01', NULL);
INSERT INTO `visitor_registries` VALUES (816, 25, '113.88.133.178', '2020-11-25 11:53:47', '2020-11-25 11:53:53', NULL);
INSERT INTO `visitor_registries` VALUES (817, 27, '116.25.237.60', '2020-11-26 06:56:20', '2020-11-26 06:56:20', NULL);
INSERT INTO `visitor_registries` VALUES (818, 8, '116.25.237.60', '2020-11-27 08:40:35', '2020-11-27 08:40:35', NULL);
INSERT INTO `visitor_registries` VALUES (819, 32, '223.104.66.112', '2020-11-27 10:07:00', '2020-11-27 10:07:00', NULL);
INSERT INTO `visitor_registries` VALUES (820, 31, '223.104.66.112', '2020-11-27 10:07:17', '2020-11-27 10:07:17', NULL);
INSERT INTO `visitor_registries` VALUES (821, 29, '223.104.66.112', '2020-11-27 10:07:25', '2020-11-27 10:07:25', NULL);
INSERT INTO `visitor_registries` VALUES (822, 27, '223.104.66.112', '2020-11-27 10:07:37', '2020-11-27 10:07:37', NULL);
INSERT INTO `visitor_registries` VALUES (823, 25, '223.104.66.112', '2020-11-27 10:07:44', '2020-11-27 10:07:44', NULL);
INSERT INTO `visitor_registries` VALUES (824, 14, '113.88.133.179', '2020-11-27 12:41:42', '2020-11-27 12:41:42', NULL);
INSERT INTO `visitor_registries` VALUES (825, 21, '203.208.60.16', '2020-11-27 17:51:34', '2020-11-27 17:51:34', NULL);
INSERT INTO `visitor_registries` VALUES (826, 29, '113.87.88.61', '2020-11-29 03:33:21', '2020-11-29 03:33:22', NULL);
INSERT INTO `visitor_registries` VALUES (827, 8, '203.208.60.29', '2020-11-29 08:06:41', '2020-11-29 08:06:41', NULL);
INSERT INTO `visitor_registries` VALUES (828, 21, '203.208.60.37', '2020-11-29 12:15:10', '2020-11-29 12:15:10', NULL);
INSERT INTO `visitor_registries` VALUES (829, 13, '113.87.88.61', '2020-11-29 13:35:20', '2020-11-30 14:33:12', NULL);
INSERT INTO `visitor_registries` VALUES (830, 32, '113.87.88.61', '2020-11-29 14:42:58', '2020-11-29 14:42:58', NULL);
INSERT INTO `visitor_registries` VALUES (831, 8, '203.208.60.76', '2020-11-29 19:39:20', '2020-11-29 19:39:20', NULL);
INSERT INTO `visitor_registries` VALUES (832, 14, '203.208.60.1', '2020-11-29 19:48:32', '2020-11-29 19:48:32', NULL);
INSERT INTO `visitor_registries` VALUES (833, 32, '203.208.60.83', '2020-11-29 19:53:35', '2020-11-29 19:53:35', NULL);
INSERT INTO `visitor_registries` VALUES (834, 21, '203.208.60.114', '2020-11-29 21:46:04', '2020-11-29 21:46:04', NULL);
INSERT INTO `visitor_registries` VALUES (835, 32, '116.25.237.250', '2020-11-30 02:42:44', '2020-11-30 02:43:56', NULL);
INSERT INTO `visitor_registries` VALUES (836, 29, '116.25.237.250', '2020-11-30 02:43:02', '2020-11-30 02:43:05', NULL);
INSERT INTO `visitor_registries` VALUES (837, 8, '116.25.237.250', '2020-11-30 02:44:10', '2020-11-30 02:44:10', NULL);
INSERT INTO `visitor_registries` VALUES (838, 28, '223.70.159.3', '2020-11-30 10:57:36', '2020-11-30 10:57:36', NULL);
INSERT INTO `visitor_registries` VALUES (839, 14, '66.249.79.177', '2020-11-30 22:13:58', '2020-11-30 22:13:58', NULL);
INSERT INTO `visitor_registries` VALUES (840, 21, '203.208.60.10', '2020-12-01 03:16:45', '2020-12-01 03:16:45', NULL);
INSERT INTO `visitor_registries` VALUES (841, 27, '171.224.178.92', '2020-12-02 07:40:14', '2020-12-02 07:40:14', NULL);
INSERT INTO `visitor_registries` VALUES (842, 27, '203.208.60.10', '2020-12-02 11:04:14', '2020-12-02 11:04:14', NULL);
INSERT INTO `visitor_registries` VALUES (843, 27, '203.208.60.29', '2020-12-02 11:24:23', '2020-12-02 11:24:23', NULL);
INSERT INTO `visitor_registries` VALUES (844, 30, '203.208.60.68', '2020-12-02 12:56:09', '2020-12-02 12:56:10', NULL);
INSERT INTO `visitor_registries` VALUES (845, 17, '203.208.60.48', '2020-12-02 13:18:04', '2020-12-02 13:18:04', NULL);
INSERT INTO `visitor_registries` VALUES (846, 19, '203.208.60.115', '2020-12-02 20:13:47', '2020-12-02 20:13:47', NULL);
INSERT INTO `visitor_registries` VALUES (847, 17, '203.208.60.97', '2020-12-03 00:08:32', '2020-12-03 00:08:32', NULL);
INSERT INTO `visitor_registries` VALUES (848, 27, '203.208.60.59', '2020-12-03 00:09:12', '2020-12-03 00:09:12', NULL);
INSERT INTO `visitor_registries` VALUES (849, 33, '116.25.236.135', '2020-12-03 03:24:40', '2020-12-03 03:29:16', NULL);
INSERT INTO `visitor_registries` VALUES (850, 14, '116.25.236.135', '2020-12-03 03:49:09', '2020-12-03 03:49:09', NULL);
INSERT INTO `visitor_registries` VALUES (851, 3, '203.208.60.38', '2020-12-03 13:19:20', '2020-12-03 13:19:20', NULL);
INSERT INTO `visitor_registries` VALUES (852, 16, '203.208.60.111', '2020-12-03 13:42:34', '2020-12-03 13:42:34', NULL);
INSERT INTO `visitor_registries` VALUES (853, 33, '117.136.33.207', '2020-12-03 15:01:46', '2020-12-03 15:01:46', NULL);
INSERT INTO `visitor_registries` VALUES (854, 10, '203.208.60.24', '2020-12-03 16:31:02', '2020-12-03 16:31:02', NULL);
INSERT INTO `visitor_registries` VALUES (855, 21, '203.208.60.29', '2020-12-03 20:12:17', '2020-12-03 20:12:17', NULL);
INSERT INTO `visitor_registries` VALUES (856, 27, '112.32.1.182', '2020-12-04 14:14:22', '2020-12-04 14:14:22', NULL);
INSERT INTO `visitor_registries` VALUES (857, 33, '113.88.133.247', '2020-12-05 05:20:02', '2020-12-05 05:20:02', NULL);
INSERT INTO `visitor_registries` VALUES (858, 32, '113.88.133.247', '2020-12-05 05:20:11', '2020-12-05 05:20:11', NULL);
INSERT INTO `visitor_registries` VALUES (859, 28, '113.88.133.247', '2020-12-05 05:20:16', '2020-12-05 05:20:16', NULL);
INSERT INTO `visitor_registries` VALUES (860, 21, '113.88.133.247', '2020-12-05 05:20:21', '2020-12-05 05:20:21', NULL);
INSERT INTO `visitor_registries` VALUES (861, 20, '203.208.60.41', '2020-12-05 08:39:39', '2020-12-05 08:39:39', NULL);
INSERT INTO `visitor_registries` VALUES (862, 13, '117.82.219.112', '2020-12-06 10:01:13', '2020-12-06 10:05:47', NULL);
INSERT INTO `visitor_registries` VALUES (863, 28, '117.82.219.112', '2020-12-06 10:02:57', '2020-12-06 10:02:57', NULL);
INSERT INTO `visitor_registries` VALUES (864, 25, '113.88.133.247', '2020-12-06 14:12:44', '2020-12-06 14:12:44', NULL);
INSERT INTO `visitor_registries` VALUES (865, 8, '113.88.133.247', '2020-12-06 14:12:58', '2020-12-06 14:12:58', NULL);
INSERT INTO `visitor_registries` VALUES (866, 26, '116.76.31.253', '2020-12-07 00:38:47', '2020-12-07 09:57:59', NULL);
INSERT INTO `visitor_registries` VALUES (867, 32, '203.208.60.64', '2020-12-07 07:00:09', '2020-12-07 07:00:09', NULL);
INSERT INTO `visitor_registries` VALUES (868, 14, '203.208.60.101', '2020-12-07 12:31:08', '2020-12-07 12:31:08', NULL);
INSERT INTO `visitor_registries` VALUES (869, 32, '203.208.60.120', '2020-12-07 21:34:00', '2021-01-03 12:05:30', NULL);
INSERT INTO `visitor_registries` VALUES (870, 13, '171.93.203.226', '2020-12-08 07:51:03', '2020-12-08 07:51:03', NULL);
INSERT INTO `visitor_registries` VALUES (871, 33, '171.93.203.226', '2020-12-08 07:51:30', '2020-12-08 07:51:30', NULL);
INSERT INTO `visitor_registries` VALUES (872, 24, '171.93.203.226', '2020-12-08 07:52:34', '2020-12-08 07:52:34', NULL);
INSERT INTO `visitor_registries` VALUES (873, 16, '203.208.60.9', '2020-12-08 12:27:49', '2020-12-08 12:27:49', NULL);
INSERT INTO `visitor_registries` VALUES (874, 33, '113.116.158.23', '2020-12-08 15:15:28', '2020-12-08 15:15:28', NULL);
INSERT INTO `visitor_registries` VALUES (875, 33, '203.208.60.49', '2020-12-11 21:39:13', '2020-12-11 21:39:13', NULL);
INSERT INTO `visitor_registries` VALUES (876, 21, '203.208.60.123', '2020-12-11 21:48:11', '2020-12-11 21:48:11', NULL);
INSERT INTO `visitor_registries` VALUES (877, 33, '203.208.60.19', '2020-12-11 22:05:57', '2020-12-11 22:05:57', NULL);
INSERT INTO `visitor_registries` VALUES (878, 33, '116.25.236.98', '2020-12-14 09:28:14', '2020-12-14 09:28:14', NULL);
INSERT INTO `visitor_registries` VALUES (879, 26, '116.25.236.98', '2020-12-14 09:28:25', '2020-12-14 09:28:25', NULL);
INSERT INTO `visitor_registries` VALUES (880, 21, '116.25.236.98', '2020-12-14 09:28:34', '2020-12-14 09:28:34', NULL);
INSERT INTO `visitor_registries` VALUES (881, 8, '116.25.236.98', '2020-12-14 09:28:40', '2020-12-14 09:28:40', NULL);
INSERT INTO `visitor_registries` VALUES (882, 17, '119.137.54.65', '2020-12-14 09:43:19', '2020-12-14 09:43:19', NULL);
INSERT INTO `visitor_registries` VALUES (883, 28, '111.160.31.58', '2020-12-17 04:55:03', '2020-12-17 04:55:03', NULL);
INSERT INTO `visitor_registries` VALUES (884, 32, '116.30.194.226', '2020-12-18 04:44:50', '2020-12-18 04:44:50', NULL);
INSERT INTO `visitor_registries` VALUES (885, 29, '116.30.194.226', '2020-12-18 04:45:10', '2020-12-18 04:45:10', NULL);
INSERT INTO `visitor_registries` VALUES (886, 33, '116.30.194.226', '2020-12-18 14:37:20', '2020-12-18 14:37:20', NULL);
INSERT INTO `visitor_registries` VALUES (887, 27, '203.208.60.37', '2020-12-18 16:15:43', '2020-12-18 16:15:43', NULL);
INSERT INTO `visitor_registries` VALUES (888, 34, '116.30.194.226', '2020-12-18 17:00:20', '2020-12-18 17:00:20', NULL);
INSERT INTO `visitor_registries` VALUES (889, 35, '116.30.194.226', '2020-12-18 17:00:38', '2020-12-18 17:18:29', NULL);
INSERT INTO `visitor_registries` VALUES (890, 35, '203.208.60.127', '2020-12-18 23:45:01', '2020-12-18 23:45:01', NULL);
INSERT INTO `visitor_registries` VALUES (891, 34, '203.208.60.124', '2020-12-19 00:01:59', '2020-12-19 00:01:59', NULL);
INSERT INTO `visitor_registries` VALUES (892, 34, '203.208.60.96', '2020-12-19 00:49:56', '2020-12-19 00:49:56', NULL);
INSERT INTO `visitor_registries` VALUES (893, 35, '203.208.60.123', '2020-12-19 01:07:01', '2020-12-19 01:07:01', NULL);
INSERT INTO `visitor_registries` VALUES (894, 35, '113.116.50.91', '2020-12-19 03:27:46', '2020-12-20 07:21:21', NULL);
INSERT INTO `visitor_registries` VALUES (895, 34, '113.116.50.91', '2020-12-19 03:29:39', '2020-12-19 07:09:52', NULL);
INSERT INTO `visitor_registries` VALUES (896, 13, '113.116.50.91', '2020-12-19 03:30:27', '2020-12-20 06:57:42', NULL);
INSERT INTO `visitor_registries` VALUES (897, 13, '103.200.114.84', '2020-12-19 08:16:06', '2020-12-19 08:16:06', NULL);
INSERT INTO `visitor_registries` VALUES (898, 26, '103.200.114.84', '2020-12-19 08:42:24', '2020-12-19 08:42:24', NULL);
INSERT INTO `visitor_registries` VALUES (899, 8, '113.116.50.91', '2020-12-20 05:53:15', '2020-12-20 05:53:15', NULL);
INSERT INTO `visitor_registries` VALUES (900, 16, '203.208.60.117', '2020-12-20 22:17:33', '2020-12-20 22:17:33', NULL);
INSERT INTO `visitor_registries` VALUES (901, 13, '203.208.60.114', '2020-12-20 23:41:51', '2020-12-20 23:41:51', NULL);
INSERT INTO `visitor_registries` VALUES (902, 14, '203.208.60.122', '2020-12-21 03:13:00', '2020-12-21 03:13:00', NULL);
INSERT INTO `visitor_registries` VALUES (903, 13, '218.18.152.36', '2020-12-21 06:44:46', '2020-12-21 06:44:46', NULL);
INSERT INTO `visitor_registries` VALUES (904, 16, '218.18.152.36', '2020-12-21 06:45:10', '2020-12-21 06:45:10', NULL);
INSERT INTO `visitor_registries` VALUES (905, 35, '117.136.33.179', '2020-12-21 12:47:13', '2020-12-21 12:47:59', NULL);
INSERT INTO `visitor_registries` VALUES (906, 29, '117.136.33.179', '2020-12-21 12:48:14', '2020-12-21 12:48:14', NULL);
INSERT INTO `visitor_registries` VALUES (907, 27, '117.136.33.179', '2020-12-21 12:48:19', '2020-12-21 12:48:20', NULL);
INSERT INTO `visitor_registries` VALUES (908, 32, '203.208.60.109', '2020-12-21 19:45:17', '2020-12-21 19:45:17', NULL);
INSERT INTO `visitor_registries` VALUES (909, 3, '113.88.12.42', '2020-12-22 07:29:02', '2020-12-22 07:29:02', NULL);
INSERT INTO `visitor_registries` VALUES (910, 35, '113.116.158.190', '2020-12-22 15:10:25', '2020-12-22 15:11:50', NULL);
INSERT INTO `visitor_registries` VALUES (911, 26, '113.116.158.190', '2020-12-22 15:10:52', '2020-12-22 15:10:52', NULL);
INSERT INTO `visitor_registries` VALUES (912, 35, '113.116.156.163', '2020-12-23 02:42:25', '2020-12-23 10:28:02', NULL);
INSERT INTO `visitor_registries` VALUES (913, 35, '113.88.135.174', '2020-12-24 01:49:20', '2020-12-24 13:39:19', NULL);
INSERT INTO `visitor_registries` VALUES (914, 27, '125.112.216.44', '2020-12-24 06:57:38', '2020-12-24 07:05:18', NULL);
INSERT INTO `visitor_registries` VALUES (915, 34, '113.88.135.174', '2020-12-24 13:39:30', '2020-12-24 13:39:30', NULL);
INSERT INTO `visitor_registries` VALUES (916, 33, '113.88.135.174', '2020-12-24 13:39:38', '2020-12-24 13:39:38', NULL);
INSERT INTO `visitor_registries` VALUES (917, 29, '113.88.135.174', '2020-12-24 13:39:47', '2020-12-24 13:39:54', NULL);
INSERT INTO `visitor_registries` VALUES (918, 13, '113.88.135.174', '2020-12-24 13:42:33', '2020-12-24 13:42:33', NULL);
INSERT INTO `visitor_registries` VALUES (919, 25, '113.88.135.174', '2020-12-24 13:44:21', '2020-12-24 13:44:21', NULL);
INSERT INTO `visitor_registries` VALUES (920, 35, '183.14.133.100', '2020-12-25 04:18:29', '2020-12-25 04:18:29', NULL);
INSERT INTO `visitor_registries` VALUES (921, 13, '113.87.91.125', '2020-12-25 13:22:05', '2020-12-25 13:22:05', NULL);
INSERT INTO `visitor_registries` VALUES (922, 35, '113.87.91.125', '2020-12-25 13:22:09', '2020-12-25 14:38:09', NULL);
INSERT INTO `visitor_registries` VALUES (923, 8, '113.87.91.125', '2020-12-25 14:36:49', '2020-12-25 14:36:49', NULL);
INSERT INTO `visitor_registries` VALUES (924, 3, '113.87.91.125', '2020-12-25 14:36:58', '2020-12-25 14:36:58', NULL);
INSERT INTO `visitor_registries` VALUES (925, 16, '203.208.60.101', '2020-12-25 23:35:51', '2020-12-25 23:35:51', NULL);
INSERT INTO `visitor_registries` VALUES (926, 14, '203.208.60.118', '2020-12-26 01:50:00', '2020-12-26 01:50:00', NULL);
INSERT INTO `visitor_registries` VALUES (927, 21, '203.208.60.120', '2020-12-26 03:06:56', '2020-12-26 06:39:06', NULL);
INSERT INTO `visitor_registries` VALUES (928, 3, '203.208.60.99', '2020-12-26 04:27:14', '2020-12-26 04:27:14', NULL);
INSERT INTO `visitor_registries` VALUES (929, 16, '203.208.60.116', '2020-12-26 09:00:40', '2020-12-26 09:00:40', NULL);
INSERT INTO `visitor_registries` VALUES (930, 29, '203.208.60.102', '2020-12-27 14:59:34', '2020-12-27 14:59:34', NULL);
INSERT INTO `visitor_registries` VALUES (931, 35, '116.30.195.77', '2020-12-29 05:32:41', '2020-12-30 09:47:41', NULL);
INSERT INTO `visitor_registries` VALUES (932, 34, '116.30.195.77', '2020-12-29 09:54:49', '2020-12-29 09:54:49', NULL);
INSERT INTO `visitor_registries` VALUES (933, 35, '119.137.53.238', '2020-12-30 03:13:06', '2020-12-30 03:13:06', NULL);
INSERT INTO `visitor_registries` VALUES (934, 33, '119.137.53.238', '2020-12-30 03:13:23', '2020-12-30 03:13:23', NULL);
INSERT INTO `visitor_registries` VALUES (935, 36, '119.137.53.238', '2020-12-30 03:54:53', '2020-12-30 04:18:24', NULL);
INSERT INTO `visitor_registries` VALUES (936, 13, '119.137.53.238', '2020-12-30 04:17:07', '2020-12-30 04:17:07', NULL);
INSERT INTO `visitor_registries` VALUES (937, 36, '119.136.250.105', '2020-12-30 06:06:37', '2020-12-30 07:00:27', NULL);
INSERT INTO `visitor_registries` VALUES (938, 35, '119.136.250.105', '2020-12-30 06:31:39', '2020-12-30 06:31:39', NULL);
INSERT INTO `visitor_registries` VALUES (939, 36, '223.104.66.100', '2020-12-30 07:24:34', '2020-12-30 07:24:34', NULL);
INSERT INTO `visitor_registries` VALUES (940, 36, '116.30.195.77', '2020-12-30 09:44:57', '2020-12-30 14:01:14', NULL);
INSERT INTO `visitor_registries` VALUES (941, 27, '203.208.60.119', '2020-12-31 16:47:17', '2021-01-11 16:36:27', NULL);
INSERT INTO `visitor_registries` VALUES (942, 28, '203.208.60.117', '2021-01-01 01:50:53', '2021-01-01 01:50:53', NULL);
INSERT INTO `visitor_registries` VALUES (943, 36, '113.116.50.151', '2021-01-01 02:49:25', '2021-01-01 06:08:31', NULL);
INSERT INTO `visitor_registries` VALUES (944, 27, '113.116.50.151', '2021-01-01 03:42:39', '2021-01-01 03:42:39', NULL);
INSERT INTO `visitor_registries` VALUES (945, 27, '203.208.60.106', '2021-01-01 04:31:58', '2021-01-01 04:31:58', NULL);
INSERT INTO `visitor_registries` VALUES (946, 35, '113.116.50.151', '2021-01-01 05:52:34', '2021-01-01 05:52:34', NULL);
INSERT INTO `visitor_registries` VALUES (947, 8, '203.208.60.119', '2021-01-01 16:52:11', '2021-01-01 16:52:11', NULL);
INSERT INTO `visitor_registries` VALUES (948, 3, '203.208.60.115', '2021-01-01 17:08:43', '2021-01-01 17:08:43', NULL);
INSERT INTO `visitor_registries` VALUES (949, 23, '203.208.60.101', '2021-01-01 23:48:42', '2021-01-01 23:48:42', NULL);
INSERT INTO `visitor_registries` VALUES (950, 35, '203.208.60.121', '2021-01-02 00:22:57', '2021-01-02 00:22:57', NULL);
INSERT INTO `visitor_registries` VALUES (951, 36, '203.208.60.100', '2021-01-02 00:23:12', '2021-01-02 00:23:12', NULL);
INSERT INTO `visitor_registries` VALUES (952, 36, '113.87.91.135', '2021-01-02 12:09:03', '2021-01-02 12:14:34', NULL);
INSERT INTO `visitor_registries` VALUES (953, 32, '203.208.60.124', '2021-01-03 13:31:01', '2021-01-03 13:31:01', NULL);
INSERT INTO `visitor_registries` VALUES (954, 25, '203.208.60.104', '2021-01-03 23:49:46', '2021-01-03 23:49:46', NULL);
INSERT INTO `visitor_registries` VALUES (955, 36, '113.116.158.200', '2021-01-04 11:39:25', '2021-02-03 14:28:07', NULL);
INSERT INTO `visitor_registries` VALUES (956, 35, '113.116.158.200', '2021-01-04 11:42:30', '2021-01-04 11:42:30', NULL);
INSERT INTO `visitor_registries` VALUES (957, 14, '113.116.158.200', '2021-01-04 11:43:38', '2021-01-04 11:43:38', NULL);
INSERT INTO `visitor_registries` VALUES (958, 23, '113.116.158.200', '2021-01-04 11:43:55', '2021-01-04 11:43:55', NULL);
INSERT INTO `visitor_registries` VALUES (959, 8, '113.116.158.200', '2021-01-04 11:44:04', '2021-01-04 11:44:04', NULL);
INSERT INTO `visitor_registries` VALUES (960, 3, '113.116.158.200', '2021-01-04 11:44:13', '2021-01-04 11:44:13', NULL);
INSERT INTO `visitor_registries` VALUES (961, 14, '203.208.60.104', '2021-01-05 10:14:12', '2021-01-05 10:14:12', NULL);
INSERT INTO `visitor_registries` VALUES (962, 36, '119.137.54.49', '2021-01-06 03:17:14', '2021-01-06 03:17:14', NULL);
INSERT INTO `visitor_registries` VALUES (963, 8, '113.102.165.56', '2021-01-06 07:15:10', '2021-01-06 07:15:10', NULL);
INSERT INTO `visitor_registries` VALUES (964, 36, '223.104.63.187', '2021-01-06 08:07:22', '2021-01-06 08:07:22', NULL);
INSERT INTO `visitor_registries` VALUES (965, 35, '223.104.63.187', '2021-01-06 08:07:28', '2021-01-06 08:07:28', NULL);
INSERT INTO `visitor_registries` VALUES (966, 33, '223.104.63.187', '2021-01-06 08:07:40', '2021-01-06 08:07:40', NULL);
INSERT INTO `visitor_registries` VALUES (967, 32, '223.104.63.187', '2021-01-06 08:07:44', '2021-01-06 08:07:45', NULL);
INSERT INTO `visitor_registries` VALUES (968, 28, '223.104.63.187', '2021-01-06 08:07:53', '2021-01-06 08:07:54', NULL);
INSERT INTO `visitor_registries` VALUES (969, 26, '223.104.63.187', '2021-01-06 08:08:02', '2021-01-06 08:08:02', NULL);
INSERT INTO `visitor_registries` VALUES (970, 25, '223.104.63.187', '2021-01-06 08:08:14', '2021-01-06 08:08:14', NULL);
INSERT INTO `visitor_registries` VALUES (971, 13, '116.30.193.73', '2021-01-06 09:49:44', '2021-01-06 09:49:44', NULL);
INSERT INTO `visitor_registries` VALUES (972, 28, '116.30.193.73', '2021-01-07 13:36:00', '2021-01-07 13:36:00', NULL);
INSERT INTO `visitor_registries` VALUES (973, 36, '116.30.193.73', '2021-01-07 13:36:27', '2021-01-07 13:36:27', NULL);
INSERT INTO `visitor_registries` VALUES (974, 33, '203.208.60.110', '2021-01-08 08:51:15', '2021-01-08 08:51:15', NULL);
INSERT INTO `visitor_registries` VALUES (975, 13, '203.208.60.96', '2021-01-08 10:33:38', '2021-01-08 10:33:38', NULL);
INSERT INTO `visitor_registries` VALUES (976, 8, '183.11.39.117', '2021-01-09 01:27:18', '2021-01-09 04:35:34', NULL);
INSERT INTO `visitor_registries` VALUES (977, 32, '203.208.60.13', '2021-01-09 16:05:40', '2021-01-09 16:05:40', NULL);
INSERT INTO `visitor_registries` VALUES (978, 36, '203.208.60.34', '2021-01-09 16:07:43', '2021-01-09 16:07:43', NULL);
INSERT INTO `visitor_registries` VALUES (979, 13, '203.208.60.88', '2021-01-09 16:11:09', '2021-01-09 16:11:09', NULL);
INSERT INTO `visitor_registries` VALUES (980, 16, '66.249.72.51', '2021-01-09 18:46:41', '2021-01-09 18:46:41', NULL);
INSERT INTO `visitor_registries` VALUES (981, 27, '203.208.60.28', '2021-01-09 19:47:20', '2021-01-09 19:47:20', NULL);
INSERT INTO `visitor_registries` VALUES (982, 21, '203.208.60.122', '2021-01-09 20:28:03', '2021-01-09 20:28:03', NULL);
INSERT INTO `visitor_registries` VALUES (983, 14, '203.208.60.21', '2021-01-10 01:01:59', '2021-01-10 01:01:59', NULL);
INSERT INTO `visitor_registries` VALUES (984, 8, '203.208.60.71', '2021-01-10 01:20:02', '2021-01-10 01:20:02', NULL);
INSERT INTO `visitor_registries` VALUES (985, 21, '203.208.60.3', '2021-01-10 02:10:11', '2021-01-10 02:10:11', NULL);
INSERT INTO `visitor_registries` VALUES (986, 19, '203.208.60.66', '2021-01-10 04:09:07', '2021-01-10 04:09:07', NULL);
INSERT INTO `visitor_registries` VALUES (987, 27, '203.208.60.102', '2021-01-10 10:22:56', '2021-01-10 10:22:56', NULL);
INSERT INTO `visitor_registries` VALUES (988, 23, '203.208.60.9', '2021-01-10 23:59:37', '2021-01-10 23:59:37', NULL);
INSERT INTO `visitor_registries` VALUES (989, 16, '203.208.60.108', '2021-01-11 07:58:16', '2021-01-11 07:58:16', NULL);
INSERT INTO `visitor_registries` VALUES (990, 13, '203.208.60.13', '2021-01-11 08:48:44', '2021-01-13 06:27:31', NULL);
INSERT INTO `visitor_registries` VALUES (991, 33, '203.208.60.54', '2021-01-11 08:58:23', '2021-01-11 08:58:23', NULL);
INSERT INTO `visitor_registries` VALUES (992, 27, '203.208.60.122', '2021-01-11 09:43:28', '2021-01-11 09:43:28', NULL);
INSERT INTO `visitor_registries` VALUES (993, 14, '66.249.69.232', '2021-01-11 11:29:30', '2021-01-11 11:29:30', NULL);
INSERT INTO `visitor_registries` VALUES (994, 21, '66.249.69.232', '2021-01-11 11:34:55', '2021-01-11 11:34:55', NULL);
INSERT INTO `visitor_registries` VALUES (995, 23, '203.208.60.37', '2021-01-11 12:27:37', '2021-01-11 12:27:37', NULL);
INSERT INTO `visitor_registries` VALUES (996, 21, '203.208.60.89', '2021-01-11 13:23:34', '2021-01-11 13:23:34', NULL);
INSERT INTO `visitor_registries` VALUES (997, 28, '203.208.60.52', '2021-01-11 13:59:46', '2021-01-11 13:59:46', NULL);
INSERT INTO `visitor_registries` VALUES (998, 13, '203.208.60.45', '2021-01-11 18:04:08', '2021-01-11 18:04:08', NULL);
INSERT INTO `visitor_registries` VALUES (999, 16, '203.208.60.50', '2021-01-11 18:11:55', '2021-01-11 18:11:55', NULL);
INSERT INTO `visitor_registries` VALUES (1000, 19, '203.208.60.54', '2021-01-11 18:29:55', '2021-01-11 18:29:55', NULL);
INSERT INTO `visitor_registries` VALUES (1001, 33, '66.249.69.232', '2021-01-11 19:08:57', '2021-01-12 06:03:23', NULL);
INSERT INTO `visitor_registries` VALUES (1002, 14, '203.208.60.24', '2021-01-11 20:34:25', '2021-01-11 20:34:25', NULL);
INSERT INTO `visitor_registries` VALUES (1003, 29, '203.208.60.84', '2021-01-11 22:50:42', '2021-01-11 22:50:42', NULL);
INSERT INTO `visitor_registries` VALUES (1004, 3, '203.208.60.90', '2021-01-11 23:00:49', '2021-01-11 23:00:49', NULL);
INSERT INTO `visitor_registries` VALUES (1005, 28, '203.208.60.26', '2021-01-11 23:50:57', '2021-01-11 23:50:57', NULL);
INSERT INTO `visitor_registries` VALUES (1006, 8, '203.208.60.21', '2021-01-12 00:00:54', '2021-01-12 00:00:54', NULL);
INSERT INTO `visitor_registries` VALUES (1007, 34, '203.208.60.93', '2021-01-12 00:11:11', '2021-01-12 00:11:11', NULL);
INSERT INTO `visitor_registries` VALUES (1008, 19, '203.208.60.51', '2021-01-12 00:39:58', '2021-01-12 00:39:58', NULL);
INSERT INTO `visitor_registries` VALUES (1009, 13, '203.208.60.7', '2021-01-12 01:32:03', '2021-01-12 01:32:03', NULL);
INSERT INTO `visitor_registries` VALUES (1010, 31, '203.208.60.89', '2021-01-12 02:12:46', '2021-01-12 02:12:46', NULL);
INSERT INTO `visitor_registries` VALUES (1011, 16, '203.208.60.113', '2021-01-12 02:42:29', '2021-01-12 02:42:29', NULL);
INSERT INTO `visitor_registries` VALUES (1012, 27, '203.208.60.42', '2021-01-12 04:21:06', '2021-01-12 04:21:06', NULL);
INSERT INTO `visitor_registries` VALUES (1013, 36, '183.11.69.35', '2021-01-12 04:45:44', '2021-01-12 04:45:44', NULL);
INSERT INTO `visitor_registries` VALUES (1014, 23, '203.208.60.1', '2021-01-12 07:14:01', '2021-01-12 07:14:01', NULL);
INSERT INTO `visitor_registries` VALUES (1015, 14, '203.208.60.100', '2021-01-12 07:44:41', '2021-01-12 07:44:41', NULL);
INSERT INTO `visitor_registries` VALUES (1016, 29, '203.208.60.58', '2021-01-12 07:45:16', '2021-01-12 22:51:56', NULL);
INSERT INTO `visitor_registries` VALUES (1017, 21, '203.208.60.13', '2021-01-12 07:55:07', '2021-01-12 07:55:07', NULL);
INSERT INTO `visitor_registries` VALUES (1018, 3, '203.208.60.51', '2021-01-12 08:23:08', '2021-01-12 08:23:08', NULL);
INSERT INTO `visitor_registries` VALUES (1019, 36, '203.208.60.121', '2021-01-12 08:55:26', '2021-01-12 08:55:26', NULL);
INSERT INTO `visitor_registries` VALUES (1020, 34, '66.249.69.234', '2021-01-12 09:15:14', '2021-01-12 09:15:14', NULL);
INSERT INTO `visitor_registries` VALUES (1021, 8, '203.208.60.23', '2021-01-12 09:25:41', '2021-01-12 09:25:41', NULL);
INSERT INTO `visitor_registries` VALUES (1022, 33, '203.208.60.63', '2021-01-12 19:41:58', '2021-01-12 19:41:58', NULL);
INSERT INTO `visitor_registries` VALUES (1023, 36, '203.208.60.63', '2021-01-12 21:06:24', '2021-01-12 21:06:24', NULL);
INSERT INTO `visitor_registries` VALUES (1024, 26, '203.208.60.122', '2021-01-13 01:28:09', '2021-01-13 01:28:09', NULL);
INSERT INTO `visitor_registries` VALUES (1025, 32, '203.208.60.80', '2021-01-13 01:31:42', '2021-01-13 01:31:42', NULL);
INSERT INTO `visitor_registries` VALUES (1026, 29, '203.208.60.113', '2021-01-13 01:33:26', '2021-01-13 01:33:26', NULL);
INSERT INTO `visitor_registries` VALUES (1027, 33, '203.208.60.108', '2021-01-13 01:36:01', '2021-01-13 01:36:01', NULL);
INSERT INTO `visitor_registries` VALUES (1028, 35, '203.208.60.113', '2021-01-13 01:42:10', '2021-01-13 01:42:10', NULL);
INSERT INTO `visitor_registries` VALUES (1029, 8, '203.208.60.112', '2021-01-13 03:40:23', '2021-01-13 03:40:23', NULL);
INSERT INTO `visitor_registries` VALUES (1030, 25, '203.208.60.13', '2021-01-13 04:14:48', '2021-01-13 04:14:48', NULL);
INSERT INTO `visitor_registries` VALUES (1031, 14, '203.208.60.121', '2021-01-13 06:17:34', '2021-01-13 06:17:34', NULL);
INSERT INTO `visitor_registries` VALUES (1032, 16, '203.208.60.53', '2021-01-13 08:08:27', '2021-01-13 08:08:27', NULL);
INSERT INTO `visitor_registries` VALUES (1033, 28, '203.208.60.103', '2021-01-13 16:54:22', '2021-01-13 16:54:22', NULL);
INSERT INTO `visitor_registries` VALUES (1034, 27, '203.208.60.26', '2021-01-13 22:16:38', '2021-02-02 10:11:34', NULL);
INSERT INTO `visitor_registries` VALUES (1035, 36, '203.208.60.116', '2021-01-13 22:26:43', '2021-01-13 22:26:43', NULL);
INSERT INTO `visitor_registries` VALUES (1036, 8, '203.208.60.42', '2021-01-14 11:21:33', '2021-01-14 11:21:33', NULL);
INSERT INTO `visitor_registries` VALUES (1037, 34, '203.208.60.79', '2021-01-14 12:41:33', '2021-01-14 12:41:33', NULL);
INSERT INTO `visitor_registries` VALUES (1038, 19, '123.125.250.166', '2021-01-15 09:18:39', '2021-01-15 09:18:39', NULL);
INSERT INTO `visitor_registries` VALUES (1039, 33, '203.208.60.43', '2021-01-15 22:08:18', '2021-01-15 22:08:18', NULL);
INSERT INTO `visitor_registries` VALUES (1040, 25, '183.11.69.18', '2021-01-16 03:05:06', '2021-01-16 03:05:07', NULL);
INSERT INTO `visitor_registries` VALUES (1041, 28, '183.11.69.18', '2021-01-16 04:56:00', '2021-01-16 04:56:00', NULL);
INSERT INTO `visitor_registries` VALUES (1042, 19, '203.208.60.8', '2021-01-16 09:13:15', '2021-01-16 09:13:15', NULL);
INSERT INTO `visitor_registries` VALUES (1043, 16, '203.208.60.93', '2021-01-16 09:15:41', '2021-01-16 09:15:41', NULL);
INSERT INTO `visitor_registries` VALUES (1044, 23, '203.208.60.42', '2021-01-16 11:31:08', '2021-01-16 11:31:08', NULL);
INSERT INTO `visitor_registries` VALUES (1045, 27, '203.208.60.63', '2021-01-16 12:07:28', '2021-01-16 12:07:28', NULL);
INSERT INTO `visitor_registries` VALUES (1046, 13, '66.249.79.177', '2021-01-16 14:35:57', '2021-01-16 14:35:57', NULL);
INSERT INTO `visitor_registries` VALUES (1047, 29, '203.208.60.34', '2021-01-16 15:24:30', '2021-01-16 15:24:30', NULL);
INSERT INTO `visitor_registries` VALUES (1048, 21, '203.208.60.97', '2021-01-17 01:14:03', '2021-01-17 01:14:03', NULL);
INSERT INTO `visitor_registries` VALUES (1049, 6, '203.208.60.56', '2021-01-17 02:24:16', '2021-01-17 02:24:16', NULL);
INSERT INTO `visitor_registries` VALUES (1050, 6, '66.249.79.179', '2021-01-17 03:16:38', '2021-01-17 03:16:38', NULL);
INSERT INTO `visitor_registries` VALUES (1051, 13, '113.116.159.45', '2021-01-17 05:17:27', '2021-01-17 05:24:12', NULL);
INSERT INTO `visitor_registries` VALUES (1052, 13, '66.249.79.179', '2021-01-17 10:44:30', '2021-03-07 16:07:27', NULL);
INSERT INTO `visitor_registries` VALUES (1053, 3, '203.208.60.41', '2021-01-17 15:52:49', '2021-01-17 15:52:49', NULL);
INSERT INTO `visitor_registries` VALUES (1054, 14, '66.249.79.175', '2021-01-17 19:22:10', '2021-01-17 19:22:10', NULL);
INSERT INTO `visitor_registries` VALUES (1055, 19, '203.208.60.67', '2021-01-18 02:56:06', '2021-01-18 02:56:07', NULL);
INSERT INTO `visitor_registries` VALUES (1056, 23, '203.208.60.106', '2021-01-18 04:22:11', '2021-01-18 04:22:11', NULL);
INSERT INTO `visitor_registries` VALUES (1057, 21, '203.208.60.103', '2021-01-18 16:16:52', '2021-01-18 16:16:52', NULL);
INSERT INTO `visitor_registries` VALUES (1058, 13, '113.102.164.195', '2021-01-19 08:07:04', '2021-01-19 08:07:04', NULL);
INSERT INTO `visitor_registries` VALUES (1059, 13, '203.208.60.116', '2021-01-19 23:48:02', '2021-01-19 23:48:02', NULL);
INSERT INTO `visitor_registries` VALUES (1060, 32, '203.208.60.2', '2021-01-20 04:31:52', '2021-01-20 04:31:52', NULL);
INSERT INTO `visitor_registries` VALUES (1061, 21, '66.249.68.53', '2021-01-21 01:43:08', '2021-01-21 01:43:08', NULL);
INSERT INTO `visitor_registries` VALUES (1062, 37, '113.102.164.195', '2021-01-21 02:48:23', '2021-01-21 02:49:30', NULL);
INSERT INTO `visitor_registries` VALUES (1063, 23, '113.102.164.195', '2021-01-21 02:49:50', '2021-01-21 02:56:54', NULL);
INSERT INTO `visitor_registries` VALUES (1064, 28, '66.249.68.55', '2021-01-21 05:24:31', '2021-01-21 05:24:31', NULL);
INSERT INTO `visitor_registries` VALUES (1065, 37, '66.249.68.53', '2021-01-21 16:28:19', '2021-01-21 16:37:02', NULL);
INSERT INTO `visitor_registries` VALUES (1066, 37, '66.249.68.51', '2021-01-21 16:53:29', '2021-01-21 16:53:29', NULL);
INSERT INTO `visitor_registries` VALUES (1067, 16, '66.249.68.53', '2021-01-21 22:31:35', '2021-01-21 22:31:35', NULL);
INSERT INTO `visitor_registries` VALUES (1068, 26, '113.102.165.248', '2021-01-22 01:24:05', '2021-01-22 03:36:03', NULL);
INSERT INTO `visitor_registries` VALUES (1069, 37, '113.102.165.248', '2021-01-22 03:04:00', '2021-01-22 03:04:00', NULL);
INSERT INTO `visitor_registries` VALUES (1070, 13, '113.102.165.248', '2021-01-22 07:50:26', '2021-01-22 07:50:43', NULL);
INSERT INTO `visitor_registries` VALUES (1071, 32, '203.208.60.123', '2021-01-22 20:04:53', '2021-01-22 20:04:53', NULL);
INSERT INTO `visitor_registries` VALUES (1072, 32, '66.249.68.53', '2021-01-22 22:05:48', '2021-01-22 22:05:48', NULL);
INSERT INTO `visitor_registries` VALUES (1073, 35, '223.104.63.5', '2021-01-23 11:25:59', '2021-01-23 11:25:59', NULL);
INSERT INTO `visitor_registries` VALUES (1074, 32, '223.104.63.5', '2021-01-23 11:26:09', '2021-01-23 11:26:10', NULL);
INSERT INTO `visitor_registries` VALUES (1075, 29, '223.104.63.5', '2021-01-23 11:26:27', '2021-01-23 11:26:27', NULL);
INSERT INTO `visitor_registries` VALUES (1076, 28, '223.104.63.5', '2021-01-23 11:26:41', '2021-01-23 11:26:41', NULL);
INSERT INTO `visitor_registries` VALUES (1077, 27, '223.104.63.5', '2021-01-23 11:26:51', '2021-01-23 11:26:51', NULL);
INSERT INTO `visitor_registries` VALUES (1078, 26, '223.104.63.5', '2021-01-23 11:27:08', '2021-01-23 11:27:08', NULL);
INSERT INTO `visitor_registries` VALUES (1079, 25, '223.104.63.5', '2021-01-23 11:27:26', '2021-01-23 11:27:46', NULL);
INSERT INTO `visitor_registries` VALUES (1080, 16, '223.104.63.5', '2021-01-23 11:27:31', '2021-01-23 11:27:31', NULL);
INSERT INTO `visitor_registries` VALUES (1081, 14, '223.104.63.5', '2021-01-23 11:27:41', '2021-01-23 11:27:41', NULL);
INSERT INTO `visitor_registries` VALUES (1082, 23, '223.104.63.5', '2021-01-23 11:27:46', '2021-01-23 11:28:05', NULL);
INSERT INTO `visitor_registries` VALUES (1083, 8, '223.104.63.5', '2021-01-23 11:28:00', '2021-01-23 11:28:00', NULL);
INSERT INTO `visitor_registries` VALUES (1084, 3, '223.104.63.5', '2021-01-23 11:28:06', '2021-01-23 11:28:06', NULL);
INSERT INTO `visitor_registries` VALUES (1085, 37, '223.104.63.5', '2021-01-23 11:28:31', '2021-01-23 11:28:31', NULL);
INSERT INTO `visitor_registries` VALUES (1086, 36, '183.11.70.13', '2021-01-27 01:30:15', '2021-01-27 01:30:15', NULL);
INSERT INTO `visitor_registries` VALUES (1087, 21, '183.11.70.13', '2021-01-27 01:30:23', '2021-01-27 01:30:23', NULL);
INSERT INTO `visitor_registries` VALUES (1088, 32, '203.208.60.57', '2021-01-28 02:26:13', '2021-01-28 02:26:13', NULL);
INSERT INTO `visitor_registries` VALUES (1089, 26, '113.88.134.214', '2021-01-31 02:03:21', '2021-01-31 02:03:21', NULL);
INSERT INTO `visitor_registries` VALUES (1090, 13, '113.88.134.214', '2021-01-31 02:04:46', '2021-01-31 02:04:46', NULL);
INSERT INTO `visitor_registries` VALUES (1091, 13, '203.208.60.121', '2021-01-31 07:37:02', '2021-01-31 07:37:02', NULL);
INSERT INTO `visitor_registries` VALUES (1092, 16, '203.208.60.42', '2021-01-31 10:24:32', '2021-03-04 23:05:16', NULL);
INSERT INTO `visitor_registries` VALUES (1093, 28, '203.208.60.6', '2021-01-31 19:47:20', '2021-01-31 19:47:20', NULL);
INSERT INTO `visitor_registries` VALUES (1094, 14, '203.208.60.50', '2021-02-01 00:39:47', '2021-02-01 00:39:47', NULL);
INSERT INTO `visitor_registries` VALUES (1095, 21, '203.208.60.21', '2021-02-01 04:50:58', '2021-02-01 04:50:58', NULL);
INSERT INTO `visitor_registries` VALUES (1096, 21, '203.208.60.118', '2021-02-01 06:41:59', '2021-02-01 06:41:59', NULL);
INSERT INTO `visitor_registries` VALUES (1097, 23, '66.249.79.173', '2021-02-01 08:02:11', '2021-02-01 08:02:11', NULL);
INSERT INTO `visitor_registries` VALUES (1098, 23, '203.208.60.64', '2021-02-01 10:13:26', '2021-02-01 10:13:26', NULL);
INSERT INTO `visitor_registries` VALUES (1099, 16, '66.249.79.173', '2021-02-01 11:42:47', '2021-02-01 11:42:47', NULL);
INSERT INTO `visitor_registries` VALUES (1100, 21, '203.208.60.24', '2021-02-01 13:13:58', '2021-02-01 13:13:58', NULL);
INSERT INTO `visitor_registries` VALUES (1101, 27, '203.208.60.108', '2021-02-01 13:34:00', '2021-02-01 13:34:00', NULL);
INSERT INTO `visitor_registries` VALUES (1102, 13, '203.208.60.16', '2021-02-01 15:37:16', '2021-02-01 15:37:16', NULL);
INSERT INTO `visitor_registries` VALUES (1103, 20, '203.208.60.18', '2021-02-01 15:46:03', '2021-02-01 15:46:03', NULL);
INSERT INTO `visitor_registries` VALUES (1104, 20, '203.208.60.116', '2021-02-01 16:07:06', '2021-02-01 16:07:06', NULL);
INSERT INTO `visitor_registries` VALUES (1105, 8, '203.208.60.55', '2021-02-01 16:39:07', '2021-02-01 16:39:07', NULL);
INSERT INTO `visitor_registries` VALUES (1106, 21, '66.249.79.173', '2021-02-01 16:44:59', '2021-02-01 16:44:59', NULL);
INSERT INTO `visitor_registries` VALUES (1107, 23, '66.249.79.171', '2021-02-01 16:54:51', '2021-02-01 16:54:51', NULL);
INSERT INTO `visitor_registries` VALUES (1108, 32, '203.208.60.42', '2021-02-01 17:39:19', '2021-02-01 17:39:19', NULL);
INSERT INTO `visitor_registries` VALUES (1109, 32, '183.11.69.116', '2021-02-02 01:10:33', '2021-02-02 01:10:33', NULL);
INSERT INTO `visitor_registries` VALUES (1110, 21, '203.208.60.58', '2021-02-02 04:43:47', '2021-02-02 04:43:47', NULL);
INSERT INTO `visitor_registries` VALUES (1111, 14, '203.208.60.124', '2021-02-02 06:42:59', '2021-02-02 06:42:59', NULL);
INSERT INTO `visitor_registries` VALUES (1112, 23, '203.208.60.25', '2021-02-02 11:12:16', '2021-02-02 11:12:16', NULL);
INSERT INTO `visitor_registries` VALUES (1113, 13, '203.208.60.48', '2021-02-02 13:06:03', '2021-02-02 13:06:03', NULL);
INSERT INTO `visitor_registries` VALUES (1114, 27, '203.208.60.47', '2021-02-02 21:53:09', '2021-02-02 21:53:09', NULL);
INSERT INTO `visitor_registries` VALUES (1115, 27, '113.109.245.163', '2021-02-03 03:52:02', '2021-02-03 04:11:23', NULL);
INSERT INTO `visitor_registries` VALUES (1116, 27, '27.115.124.6', '2021-02-03 03:54:33', '2021-02-03 03:54:33', NULL);
INSERT INTO `visitor_registries` VALUES (1117, 27, '203.208.60.52', '2021-02-03 07:16:15', '2021-02-03 07:16:15', NULL);
INSERT INTO `visitor_registries` VALUES (1118, 23, '203.208.60.87', '2021-02-03 08:35:55', '2021-02-03 08:35:55', NULL);
INSERT INTO `visitor_registries` VALUES (1119, 13, '66.249.79.173', '2021-02-03 10:57:12', '2021-02-03 10:57:12', NULL);
INSERT INTO `visitor_registries` VALUES (1120, 19, '66.249.79.169', '2021-02-03 11:27:28', '2021-02-03 11:27:28', NULL);
INSERT INTO `visitor_registries` VALUES (1121, 28, '203.208.60.28', '2021-02-03 12:58:25', '2021-02-03 12:58:25', NULL);
INSERT INTO `visitor_registries` VALUES (1122, 23, '203.208.60.22', '2021-02-03 13:54:52', '2021-02-03 13:54:52', NULL);
INSERT INTO `visitor_registries` VALUES (1123, 37, '113.116.158.200', '2021-02-03 14:28:03', '2021-02-03 14:28:03', NULL);
INSERT INTO `visitor_registries` VALUES (1124, 29, '203.208.60.13', '2021-02-03 15:41:28', '2021-02-03 15:41:28', NULL);
INSERT INTO `visitor_registries` VALUES (1125, 32, '203.208.60.60', '2021-02-03 22:19:38', '2021-02-03 22:19:38', NULL);
INSERT INTO `visitor_registries` VALUES (1126, 16, '203.208.60.4', '2021-02-03 22:20:40', '2021-02-03 22:20:40', NULL);
INSERT INTO `visitor_registries` VALUES (1127, 16, '203.208.60.88', '2021-02-04 10:33:55', '2021-02-04 10:33:55', NULL);
INSERT INTO `visitor_registries` VALUES (1128, 21, '203.208.60.100', '2021-02-04 14:55:34', '2021-02-04 14:55:34', NULL);
INSERT INTO `visitor_registries` VALUES (1129, 14, '203.208.60.112', '2021-02-04 15:15:29', '2021-02-04 15:15:30', NULL);
INSERT INTO `visitor_registries` VALUES (1130, 16, '203.208.60.17', '2021-02-04 19:47:02', '2021-02-04 19:47:02', NULL);
INSERT INTO `visitor_registries` VALUES (1131, 14, '203.208.60.72', '2021-02-05 03:51:33', '2021-02-05 03:51:33', NULL);
INSERT INTO `visitor_registries` VALUES (1132, 16, '203.208.60.78', '2021-02-05 05:10:39', '2021-02-05 05:10:39', NULL);
INSERT INTO `visitor_registries` VALUES (1133, 21, '66.249.79.179', '2021-02-05 06:21:23', '2021-02-05 06:21:23', NULL);
INSERT INTO `visitor_registries` VALUES (1134, 14, '203.208.60.111', '2021-02-05 14:20:07', '2021-02-10 11:13:06', NULL);
INSERT INTO `visitor_registries` VALUES (1135, 6, '203.208.60.123', '2021-02-05 16:24:40', '2021-02-05 16:24:40', NULL);
INSERT INTO `visitor_registries` VALUES (1136, 21, '203.208.60.32', '2021-02-05 17:23:14', '2021-02-05 17:23:14', NULL);
INSERT INTO `visitor_registries` VALUES (1137, 33, '203.208.60.95', '2021-02-05 18:25:25', '2021-02-05 18:25:25', NULL);
INSERT INTO `visitor_registries` VALUES (1138, 33, '203.208.60.28', '2021-02-06 01:46:55', '2021-02-06 01:46:55', NULL);
INSERT INTO `visitor_registries` VALUES (1139, 14, '203.208.60.71', '2021-02-06 02:42:49', '2021-02-06 02:42:49', NULL);
INSERT INTO `visitor_registries` VALUES (1140, 27, '203.208.60.13', '2021-02-06 03:27:03', '2021-02-06 03:27:03', NULL);
INSERT INTO `visitor_registries` VALUES (1141, 19, '203.208.60.44', '2021-02-06 03:42:39', '2021-02-22 17:57:54', NULL);
INSERT INTO `visitor_registries` VALUES (1142, 19, '203.208.60.85', '2021-02-06 13:42:29', '2021-02-06 13:42:29', NULL);
INSERT INTO `visitor_registries` VALUES (1143, 23, '203.208.60.60', '2021-02-06 14:04:54', '2021-02-06 14:04:54', NULL);
INSERT INTO `visitor_registries` VALUES (1144, 29, '203.208.60.28', '2021-02-06 15:32:08', '2021-02-06 15:32:08', NULL);
INSERT INTO `visitor_registries` VALUES (1145, 23, '203.208.60.79', '2021-02-06 22:43:33', '2021-02-06 22:43:33', NULL);
INSERT INTO `visitor_registries` VALUES (1146, 33, '203.208.60.81', '2021-02-07 01:53:49', '2021-02-07 01:53:49', NULL);
INSERT INTO `visitor_registries` VALUES (1147, 16, '203.208.60.5', '2021-02-07 03:24:54', '2021-02-07 03:24:54', NULL);
INSERT INTO `visitor_registries` VALUES (1148, 19, '203.208.60.70', '2021-02-07 05:05:36', '2021-02-07 05:05:36', NULL);
INSERT INTO `visitor_registries` VALUES (1149, 13, '203.208.60.79', '2021-02-07 10:27:27', '2021-02-07 10:27:27', NULL);
INSERT INTO `visitor_registries` VALUES (1150, 29, '203.208.60.88', '2021-02-07 18:42:20', '2021-02-07 18:42:20', NULL);
INSERT INTO `visitor_registries` VALUES (1151, 14, '203.208.60.125', '2021-02-07 19:32:45', '2021-02-07 19:32:45', NULL);
INSERT INTO `visitor_registries` VALUES (1152, 21, '203.208.60.52', '2021-02-07 21:53:11', '2021-02-07 21:53:11', NULL);
INSERT INTO `visitor_registries` VALUES (1153, 29, '66.249.79.177', '2021-02-08 01:24:37', '2021-02-23 09:28:52', NULL);
INSERT INTO `visitor_registries` VALUES (1154, 14, '203.208.60.22', '2021-02-08 05:16:30', '2021-02-08 05:16:30', NULL);
INSERT INTO `visitor_registries` VALUES (1155, 27, '203.208.60.118', '2021-02-08 05:27:54', '2021-02-08 05:27:54', NULL);
INSERT INTO `visitor_registries` VALUES (1156, 27, '203.208.60.111', '2021-02-08 09:58:24', '2021-02-08 09:58:24', NULL);
INSERT INTO `visitor_registries` VALUES (1157, 16, '203.208.60.57', '2021-02-08 12:08:34', '2021-02-08 12:08:34', NULL);
INSERT INTO `visitor_registries` VALUES (1158, 33, '203.208.60.75', '2021-02-08 14:11:05', '2021-02-08 14:11:05', NULL);
INSERT INTO `visitor_registries` VALUES (1159, 23, '203.208.60.89', '2021-02-08 14:20:01', '2021-02-08 14:20:01', NULL);
INSERT INTO `visitor_registries` VALUES (1160, 23, '203.208.60.52', '2021-02-08 14:52:47', '2021-02-08 14:52:47', NULL);
INSERT INTO `visitor_registries` VALUES (1161, 37, '117.166.48.236', '2021-02-08 14:54:05', '2021-02-08 14:54:05', NULL);
INSERT INTO `visitor_registries` VALUES (1162, 3, '66.249.72.77', '2021-02-08 21:32:56', '2021-02-08 21:32:56', NULL);
INSERT INTO `visitor_registries` VALUES (1163, 16, '66.249.72.73', '2021-02-09 02:04:48', '2021-02-09 02:04:48', NULL);
INSERT INTO `visitor_registries` VALUES (1164, 8, '66.249.72.79', '2021-02-09 09:44:01', '2021-02-09 09:44:01', NULL);
INSERT INTO `visitor_registries` VALUES (1165, 14, '66.249.72.75', '2021-02-09 11:53:07', '2021-02-09 11:53:07', NULL);
INSERT INTO `visitor_registries` VALUES (1166, 27, '203.208.60.7', '2021-02-09 11:54:16', '2021-02-09 11:54:16', NULL);
INSERT INTO `visitor_registries` VALUES (1167, 8, '203.208.60.63', '2021-02-09 19:03:01', '2021-02-09 19:03:01', NULL);
INSERT INTO `visitor_registries` VALUES (1168, 27, '203.208.60.70', '2021-02-09 21:22:26', '2021-02-09 21:22:26', NULL);
INSERT INTO `visitor_registries` VALUES (1169, 19, '66.249.72.77', '2021-02-09 23:18:48', '2021-02-09 23:18:48', NULL);
INSERT INTO `visitor_registries` VALUES (1170, 33, '66.249.72.77', '2021-02-09 23:42:22', '2021-02-09 23:42:22', NULL);
INSERT INTO `visitor_registries` VALUES (1171, 29, '66.249.72.79', '2021-02-10 01:13:17', '2021-02-10 01:13:17', NULL);
INSERT INTO `visitor_registries` VALUES (1172, 27, '203.208.60.127', '2021-02-10 04:12:19', '2021-02-10 04:12:19', NULL);
INSERT INTO `visitor_registries` VALUES (1173, 13, '66.249.72.71', '2021-02-10 05:39:31', '2021-02-10 05:39:31', NULL);
INSERT INTO `visitor_registries` VALUES (1174, 19, '203.208.60.69', '2021-02-10 08:29:18', '2021-02-10 08:29:18', NULL);
INSERT INTO `visitor_registries` VALUES (1175, 13, '203.208.60.62', '2021-02-10 09:54:03', '2021-02-10 09:54:03', NULL);
INSERT INTO `visitor_registries` VALUES (1176, 27, '203.208.60.104', '2021-02-10 17:03:21', '2021-02-10 17:03:21', NULL);
INSERT INTO `visitor_registries` VALUES (1177, 21, '203.208.60.44', '2021-02-10 17:23:22', '2021-02-10 17:23:22', NULL);
INSERT INTO `visitor_registries` VALUES (1178, 19, '203.208.60.20', '2021-02-10 19:55:14', '2021-02-10 19:55:14', NULL);
INSERT INTO `visitor_registries` VALUES (1179, 23, '66.249.72.71', '2021-02-10 23:27:20', '2021-02-10 23:27:20', NULL);
INSERT INTO `visitor_registries` VALUES (1180, 3, '203.208.60.7', '2021-02-10 23:47:28', '2021-02-10 23:47:28', NULL);
INSERT INTO `visitor_registries` VALUES (1181, 29, '66.249.79.175', '2021-02-11 02:28:48', '2021-02-11 02:28:48', NULL);
INSERT INTO `visitor_registries` VALUES (1182, 14, '203.208.60.12', '2021-02-11 03:24:41', '2021-02-11 03:24:41', NULL);
INSERT INTO `visitor_registries` VALUES (1183, 14, '66.249.72.73', '2021-02-11 08:42:32', '2021-02-11 08:42:32', NULL);
INSERT INTO `visitor_registries` VALUES (1184, 33, '203.208.60.35', '2021-02-11 10:21:56', '2021-02-11 10:21:56', NULL);
INSERT INTO `visitor_registries` VALUES (1185, 13, '66.249.72.75', '2021-02-11 14:43:32', '2021-02-11 14:43:32', NULL);
INSERT INTO `visitor_registries` VALUES (1186, 16, '203.208.60.120', '2021-02-11 15:43:32', '2021-02-11 15:43:32', NULL);
INSERT INTO `visitor_registries` VALUES (1187, 33, '66.249.72.75', '2021-02-11 20:05:23', '2021-02-11 20:05:23', NULL);
INSERT INTO `visitor_registries` VALUES (1188, 16, '66.249.64.105', '2021-02-12 00:57:13', '2021-02-12 00:57:13', NULL);
INSERT INTO `visitor_registries` VALUES (1189, 19, '66.249.64.109', '2021-02-12 03:38:08', '2021-02-12 03:38:08', NULL);
INSERT INTO `visitor_registries` VALUES (1190, 14, '66.249.64.109', '2021-02-12 07:36:16', '2021-02-12 07:36:16', NULL);
INSERT INTO `visitor_registries` VALUES (1191, 27, '66.249.64.105', '2021-02-12 15:42:15', '2021-02-12 15:42:15', NULL);
INSERT INTO `visitor_registries` VALUES (1192, 19, '66.249.64.105', '2021-02-12 21:05:38', '2021-02-12 21:05:38', NULL);
INSERT INTO `visitor_registries` VALUES (1193, 27, '66.249.73.173', '2021-02-13 01:23:27', '2021-02-14 00:55:51', NULL);
INSERT INTO `visitor_registries` VALUES (1194, 23, '66.249.73.173', '2021-02-13 01:43:06', '2021-02-13 01:43:06', NULL);
INSERT INTO `visitor_registries` VALUES (1195, 21, '66.249.73.171', '2021-02-13 02:13:32', '2021-02-13 02:13:32', NULL);
INSERT INTO `visitor_registries` VALUES (1196, 16, '66.249.73.173', '2021-02-13 02:53:31', '2021-02-13 12:47:41', NULL);
INSERT INTO `visitor_registries` VALUES (1197, 13, '66.249.73.171', '2021-02-13 03:13:23', '2021-02-13 19:09:58', NULL);
INSERT INTO `visitor_registries` VALUES (1198, 29, '66.249.73.171', '2021-02-13 05:44:33', '2021-02-13 05:44:33', NULL);
INSERT INTO `visitor_registries` VALUES (1199, 19, '66.249.73.169', '2021-02-13 06:30:17', '2021-02-13 06:30:17', NULL);
INSERT INTO `visitor_registries` VALUES (1200, 14, '66.249.73.173', '2021-02-13 07:43:43', '2021-02-13 07:43:43', NULL);
INSERT INTO `visitor_registries` VALUES (1201, 13, '117.166.48.152', '2021-02-13 14:05:21', '2021-02-13 14:05:21', NULL);
INSERT INTO `visitor_registries` VALUES (1202, 29, '66.249.73.173', '2021-02-13 21:50:39', '2021-02-13 21:50:39', NULL);
INSERT INTO `visitor_registries` VALUES (1203, 33, '66.249.73.171', '2021-02-13 23:40:58', '2021-02-13 23:40:58', NULL);
INSERT INTO `visitor_registries` VALUES (1204, 3, '66.249.66.201', '2021-02-14 05:20:42', '2021-02-14 05:20:42', NULL);
INSERT INTO `visitor_registries` VALUES (1205, 23, '66.249.66.205', '2021-02-14 05:40:58', '2021-02-14 05:40:58', NULL);
INSERT INTO `visitor_registries` VALUES (1206, 19, '66.249.66.205', '2021-02-14 10:49:14', '2021-02-14 10:49:14', NULL);
INSERT INTO `visitor_registries` VALUES (1207, 29, '66.249.66.205', '2021-02-14 10:51:25', '2021-02-14 10:51:25', NULL);
INSERT INTO `visitor_registries` VALUES (1208, 27, '66.249.66.203', '2021-02-14 12:22:45', '2021-02-14 12:22:45', NULL);
INSERT INTO `visitor_registries` VALUES (1209, 3, '203.208.60.50', '2021-02-14 21:58:14', '2021-02-14 21:58:14', NULL);
INSERT INTO `visitor_registries` VALUES (1210, 34, '203.208.60.92', '2021-02-20 02:33:14', '2021-02-20 02:33:14', NULL);
INSERT INTO `visitor_registries` VALUES (1211, 23, '203.208.60.58', '2021-02-20 17:36:49', '2021-02-20 17:36:49', NULL);
INSERT INTO `visitor_registries` VALUES (1212, 37, '183.11.37.190', '2021-02-21 02:20:13', '2021-02-21 02:20:13', NULL);
INSERT INTO `visitor_registries` VALUES (1213, 32, '183.11.37.190', '2021-02-21 02:20:17', '2021-02-21 02:20:17', NULL);
INSERT INTO `visitor_registries` VALUES (1214, 25, '183.11.37.190', '2021-02-21 02:20:27', '2021-02-21 02:20:27', NULL);
INSERT INTO `visitor_registries` VALUES (1215, 27, '203.208.60.23', '2021-02-21 02:59:45', '2021-02-21 02:59:45', NULL);
INSERT INTO `visitor_registries` VALUES (1216, 33, '203.208.60.67', '2021-02-21 05:10:21', '2021-02-21 05:10:21', NULL);
INSERT INTO `visitor_registries` VALUES (1217, 35, '173.82.212.243', '2021-02-21 07:38:44', '2021-02-21 07:45:52', NULL);
INSERT INTO `visitor_registries` VALUES (1218, 14, '203.208.60.70', '2021-02-21 10:35:42', '2021-02-21 10:35:42', NULL);
INSERT INTO `visitor_registries` VALUES (1219, 16, '203.208.60.84', '2021-02-21 11:00:28', '2021-02-21 11:00:28', NULL);
INSERT INTO `visitor_registries` VALUES (1220, 18, '66.249.79.177', '2021-02-21 17:03:43', '2021-02-21 17:03:43', NULL);
INSERT INTO `visitor_registries` VALUES (1221, 26, '66.249.79.177', '2021-02-21 18:16:31', '2021-02-21 18:16:31', NULL);
INSERT INTO `visitor_registries` VALUES (1222, 28, '203.208.60.4', '2021-02-21 20:44:46', '2021-02-21 20:44:46', NULL);
INSERT INTO `visitor_registries` VALUES (1223, 28, '203.208.60.43', '2021-02-21 23:07:17', '2021-02-21 23:07:17', NULL);
INSERT INTO `visitor_registries` VALUES (1224, 27, '203.208.60.109', '2021-02-22 01:16:00', '2021-02-22 01:16:00', NULL);
INSERT INTO `visitor_registries` VALUES (1225, 19, '203.208.60.16', '2021-02-22 02:31:33', '2021-02-22 02:31:33', NULL);
INSERT INTO `visitor_registries` VALUES (1226, 16, '203.208.60.104', '2021-02-22 03:47:59', '2021-02-22 03:47:59', NULL);
INSERT INTO `visitor_registries` VALUES (1227, 29, '203.208.60.123', '2021-02-22 05:07:27', '2021-02-22 05:07:27', NULL);
INSERT INTO `visitor_registries` VALUES (1228, 14, '203.208.60.8', '2021-02-22 09:32:31', '2021-02-22 09:32:31', NULL);
INSERT INTO `visitor_registries` VALUES (1229, 27, '203.208.60.8', '2021-02-22 10:59:22', '2021-02-22 10:59:23', NULL);
INSERT INTO `visitor_registries` VALUES (1230, 37, '66.249.79.179', '2021-02-22 11:47:15', '2021-02-22 11:47:15', NULL);
INSERT INTO `visitor_registries` VALUES (1231, 33, '203.208.60.39', '2021-02-22 12:09:47', '2021-02-22 12:09:47', NULL);
INSERT INTO `visitor_registries` VALUES (1232, 23, '203.208.60.109', '2021-02-22 13:32:05', '2021-02-22 13:32:05', NULL);
INSERT INTO `visitor_registries` VALUES (1233, 33, '203.208.60.44', '2021-02-22 17:12:17', '2021-02-22 17:12:17', NULL);
INSERT INTO `visitor_registries` VALUES (1234, 13, '203.208.60.35', '2021-02-23 07:30:30', '2021-02-23 07:30:30', NULL);
INSERT INTO `visitor_registries` VALUES (1235, 21, '66.249.79.175', '2021-02-23 11:58:47', '2021-02-23 11:58:47', NULL);
INSERT INTO `visitor_registries` VALUES (1236, 27, '112.47.136.110', '2021-02-24 07:51:56', '2021-02-24 07:51:56', NULL);
INSERT INTO `visitor_registries` VALUES (1237, 18, '66.249.64.105', '2021-02-24 20:58:24', '2021-02-24 20:58:24', NULL);
INSERT INTO `visitor_registries` VALUES (1238, 26, '112.97.53.144', '2021-02-25 01:37:54', '2021-02-25 01:37:54', NULL);
INSERT INTO `visitor_registries` VALUES (1239, 21, '66.249.64.109', '2021-02-25 08:22:27', '2021-02-25 08:22:27', NULL);
INSERT INTO `visitor_registries` VALUES (1240, 13, '66.249.73.177', '2021-02-25 22:41:10', '2021-02-25 22:41:10', NULL);
INSERT INTO `visitor_registries` VALUES (1241, 33, '66.249.73.173', '2021-02-26 03:12:31', '2021-02-26 03:12:31', NULL);
INSERT INTO `visitor_registries` VALUES (1242, 26, '183.11.69.31', '2021-02-26 10:39:46', '2021-02-26 10:53:22', NULL);
INSERT INTO `visitor_registries` VALUES (1243, 32, '183.11.69.31', '2021-02-26 10:53:02', '2021-02-26 10:53:02', NULL);
INSERT INTO `visitor_registries` VALUES (1244, 29, '183.11.69.31', '2021-02-26 10:53:08', '2021-02-26 10:53:08', NULL);
INSERT INTO `visitor_registries` VALUES (1245, 28, '183.11.69.31', '2021-02-26 10:53:12', '2021-02-26 10:53:12', NULL);
INSERT INTO `visitor_registries` VALUES (1246, 27, '183.11.69.31', '2021-02-26 10:53:17', '2021-02-26 10:53:17', NULL);
INSERT INTO `visitor_registries` VALUES (1247, 25, '183.11.69.31', '2021-02-26 10:53:28', '2021-02-26 10:53:28', NULL);
INSERT INTO `visitor_registries` VALUES (1248, 14, '183.11.69.31', '2021-02-26 10:53:34', '2021-02-26 10:53:34', NULL);
INSERT INTO `visitor_registries` VALUES (1249, 23, '183.11.69.31', '2021-02-26 10:53:37', '2021-02-26 10:53:37', NULL);
INSERT INTO `visitor_registries` VALUES (1250, 8, '66.249.73.177', '2021-02-27 00:38:23', '2021-02-27 00:38:24', NULL);
INSERT INTO `visitor_registries` VALUES (1251, 23, '66.249.73.177', '2021-02-27 05:06:39', '2021-02-27 05:06:39', NULL);
INSERT INTO `visitor_registries` VALUES (1252, 38, '113.116.159.152', '2021-02-27 12:45:29', '2021-02-27 15:05:46', NULL);
INSERT INTO `visitor_registries` VALUES (1253, 13, '117.143.24.52', '2021-02-28 03:27:25', '2021-02-28 03:39:41', NULL);
INSERT INTO `visitor_registries` VALUES (1254, 27, '117.143.24.52', '2021-02-28 03:29:05', '2021-02-28 03:29:05', NULL);
INSERT INTO `visitor_registries` VALUES (1255, 8, '117.143.24.52', '2021-02-28 03:29:21', '2021-02-28 03:39:13', NULL);
INSERT INTO `visitor_registries` VALUES (1256, 38, '66.249.66.205', '2021-02-28 05:57:53', '2021-02-28 05:57:53', NULL);
INSERT INTO `visitor_registries` VALUES (1257, 38, '66.249.66.203', '2021-02-28 05:59:54', '2021-02-28 05:59:54', NULL);
INSERT INTO `visitor_registries` VALUES (1258, 37, '117.143.24.52', '2021-02-28 11:46:13', '2021-02-28 11:46:13', NULL);
INSERT INTO `visitor_registries` VALUES (1259, 16, '66.249.66.205', '2021-02-28 11:56:35', '2021-02-28 11:56:35', NULL);
INSERT INTO `visitor_registries` VALUES (1260, 27, '112.206.106.185', '2021-03-01 08:14:50', '2021-03-01 08:14:50', NULL);
INSERT INTO `visitor_registries` VALUES (1261, 38, '173.82.212.243', '2021-03-02 03:00:00', '2021-03-02 03:00:00', NULL);
INSERT INTO `visitor_registries` VALUES (1262, 28, '211.139.24.4', '2021-03-02 07:51:51', '2021-03-02 07:53:48', NULL);
INSERT INTO `visitor_registries` VALUES (1263, 3, '113.102.167.139', '2021-03-02 10:58:29', '2021-03-02 10:58:29', NULL);
INSERT INTO `visitor_registries` VALUES (1264, 16, '113.102.167.139', '2021-03-02 10:58:41', '2021-03-02 10:58:41', NULL);
INSERT INTO `visitor_registries` VALUES (1265, 37, '113.102.167.139', '2021-03-02 10:59:12', '2021-03-02 10:59:12', NULL);
INSERT INTO `visitor_registries` VALUES (1266, 27, '183.11.37.13', '2021-03-03 07:49:22', '2021-03-04 09:49:23', NULL);
INSERT INTO `visitor_registries` VALUES (1267, 38, '183.11.37.13', '2021-03-03 07:49:41', '2021-03-03 09:01:41', NULL);
INSERT INTO `visitor_registries` VALUES (1268, 33, '183.11.37.13', '2021-03-03 07:53:18', '2021-03-03 08:54:34', NULL);
INSERT INTO `visitor_registries` VALUES (1269, 32, '183.11.37.13', '2021-03-03 07:53:34', '2021-03-03 07:53:34', NULL);
INSERT INTO `visitor_registries` VALUES (1270, 29, '183.11.37.13', '2021-03-03 07:53:45', '2021-03-03 07:53:45', NULL);
INSERT INTO `visitor_registries` VALUES (1271, 28, '183.11.37.13', '2021-03-03 07:53:57', '2021-03-04 09:48:33', NULL);
INSERT INTO `visitor_registries` VALUES (1272, 26, '183.11.37.13', '2021-03-03 07:54:11', '2021-03-03 07:54:11', NULL);
INSERT INTO `visitor_registries` VALUES (1273, 25, '183.11.37.13', '2021-03-03 07:54:51', '2021-03-03 07:54:54', NULL);
INSERT INTO `visitor_registries` VALUES (1274, 13, '183.11.37.13', '2021-03-03 08:54:19', '2021-03-04 09:46:43', NULL);
INSERT INTO `visitor_registries` VALUES (1275, 36, '183.11.37.13', '2021-03-03 08:54:25', '2021-03-03 08:54:25', NULL);
INSERT INTO `visitor_registries` VALUES (1276, 35, '183.11.37.13', '2021-03-03 08:54:29', '2021-03-04 09:47:30', NULL);
INSERT INTO `visitor_registries` VALUES (1277, 23, '49.64.106.79', '2021-03-04 01:58:47', '2021-03-04 01:58:47', NULL);
INSERT INTO `visitor_registries` VALUES (1278, 34, '183.11.37.13', '2021-03-04 09:47:21', '2021-03-04 09:47:21', NULL);
INSERT INTO `visitor_registries` VALUES (1279, 3, '183.11.37.13', '2021-03-04 09:48:39', '2021-03-04 09:48:39', NULL);
INSERT INTO `visitor_registries` VALUES (1280, 8, '183.11.37.13', '2021-03-04 09:48:43', '2021-03-04 09:48:43', NULL);
INSERT INTO `visitor_registries` VALUES (1281, 23, '183.11.37.13', '2021-03-04 09:48:47', '2021-03-04 09:48:58', NULL);
INSERT INTO `visitor_registries` VALUES (1282, 14, '183.11.37.13', '2021-03-04 09:49:02', '2021-03-04 09:49:02', NULL);
INSERT INTO `visitor_registries` VALUES (1283, 16, '183.11.37.13', '2021-03-04 09:49:08', '2021-03-04 09:49:08', NULL);
INSERT INTO `visitor_registries` VALUES (1284, 26, '113.102.164.52', '2021-03-05 06:27:07', '2021-03-05 09:59:11', NULL);
INSERT INTO `visitor_registries` VALUES (1285, 13, '113.102.164.52', '2021-03-05 09:35:18', '2021-03-05 10:41:21', NULL);
INSERT INTO `visitor_registries` VALUES (1286, 36, '113.102.164.52', '2021-03-05 09:35:24', '2021-03-05 09:35:24', NULL);
INSERT INTO `visitor_registries` VALUES (1287, 35, '113.102.164.52', '2021-03-05 09:35:34', '2021-03-05 09:35:34', NULL);
INSERT INTO `visitor_registries` VALUES (1288, 29, '113.102.164.52', '2021-03-05 09:35:56', '2021-03-05 09:35:56', NULL);
INSERT INTO `visitor_registries` VALUES (1289, 28, '113.102.164.52', '2021-03-05 09:36:06', '2021-03-05 09:36:06', NULL);
INSERT INTO `visitor_registries` VALUES (1290, 37, '113.102.164.52', '2021-03-05 09:41:51', '2021-03-05 09:41:51', NULL);
INSERT INTO `visitor_registries` VALUES (1291, 38, '113.102.164.52', '2021-03-05 09:55:09', '2021-03-05 10:54:48', NULL);
INSERT INTO `visitor_registries` VALUES (1292, 27, '113.102.164.52', '2021-03-05 09:56:26', '2021-03-05 09:56:26', NULL);
INSERT INTO `visitor_registries` VALUES (1293, 3, '113.102.164.52', '2021-03-05 10:00:47', '2021-03-05 10:00:47', NULL);
INSERT INTO `visitor_registries` VALUES (1294, 13, '116.30.193.172', '2021-03-05 15:55:05', '2021-03-05 15:55:05', NULL);
INSERT INTO `visitor_registries` VALUES (1295, 38, '116.30.193.172', '2021-03-05 16:10:58', '2021-03-06 00:51:33', NULL);
INSERT INTO `visitor_registries` VALUES (1296, 26, '116.30.193.172', '2021-03-06 01:11:09', '2021-03-06 01:11:09', NULL);
INSERT INTO `visitor_registries` VALUES (1297, 14, '66.249.79.179', '2021-03-06 13:46:41', '2021-03-06 13:46:41', NULL);
INSERT INTO `visitor_registries` VALUES (1298, 29, '66.249.79.179', '2021-03-06 23:30:01', '2021-03-06 23:30:01', NULL);
INSERT INTO `visitor_registries` VALUES (1299, 28, '66.249.79.179', '2021-03-07 03:51:25', '2021-03-07 03:51:25', NULL);
INSERT INTO `visitor_registries` VALUES (1300, 32, '66.249.79.179', '2021-03-07 04:45:48', '2021-03-07 04:56:51', NULL);
INSERT INTO `visitor_registries` VALUES (1301, 27, '66.249.79.175', '2021-03-07 05:12:23', '2021-03-07 07:34:22', NULL);
INSERT INTO `visitor_registries` VALUES (1302, 38, '117.136.12.161', '2021-03-07 08:59:23', '2021-03-07 09:00:00', NULL);
INSERT INTO `visitor_registries` VALUES (1303, 37, '117.136.12.161', '2021-03-07 08:59:34', '2021-03-07 08:59:34', NULL);
INSERT INTO `visitor_registries` VALUES (1304, 35, '117.136.12.161', '2021-03-07 08:59:40', '2021-03-07 08:59:40', NULL);
INSERT INTO `visitor_registries` VALUES (1305, 29, '117.136.12.161', '2021-03-07 08:59:49', '2021-03-07 08:59:49', NULL);
INSERT INTO `visitor_registries` VALUES (1306, 20, '66.249.75.201', '2021-03-08 00:46:23', '2021-03-08 00:46:23', NULL);
INSERT INTO `visitor_registries` VALUES (1307, 13, '103.138.53.55', '2021-03-08 01:57:22', '2021-03-08 01:57:22', NULL);
INSERT INTO `visitor_registries` VALUES (1308, 38, '103.138.53.55', '2021-03-08 01:57:25', '2021-03-08 01:57:25', NULL);
INSERT INTO `visitor_registries` VALUES (1309, 28, '113.102.164.48', '2021-03-08 02:49:00', '2021-03-09 07:22:36', NULL);
INSERT INTO `visitor_registries` VALUES (1310, 38, '183.4.3.7', '2021-03-08 05:30:26', '2021-03-08 05:30:26', NULL);
INSERT INTO `visitor_registries` VALUES (1311, 37, '183.4.3.7', '2021-03-08 05:30:29', '2021-03-08 05:30:29', NULL);
INSERT INTO `visitor_registries` VALUES (1312, 21, '219.145.1.62', '2021-03-08 07:54:23', '2021-03-09 02:03:57', NULL);
INSERT INTO `visitor_registries` VALUES (1313, 21, '113.201.51.72', '2021-03-08 13:34:41', '2021-03-08 13:34:41', NULL);
INSERT INTO `visitor_registries` VALUES (1314, 33, '66.249.64.105', '2021-03-08 23:26:32', '2021-03-08 23:26:32', NULL);
INSERT INTO `visitor_registries` VALUES (1315, 13, '113.102.164.48', '2021-03-09 03:04:57', '2021-03-09 03:04:57', NULL);
INSERT INTO `visitor_registries` VALUES (1316, 36, '113.102.164.48', '2021-03-09 03:05:01', '2021-03-09 03:05:01', NULL);
INSERT INTO `visitor_registries` VALUES (1317, 29, '113.102.164.48', '2021-03-09 03:05:08', '2021-03-09 03:05:08', NULL);
INSERT INTO `visitor_registries` VALUES (1318, 26, '113.102.164.48', '2021-03-09 03:05:20', '2021-03-09 03:05:20', NULL);
INSERT INTO `visitor_registries` VALUES (1319, 38, '113.102.164.48', '2021-03-09 07:22:11', '2021-03-09 07:22:11', NULL);
INSERT INTO `visitor_registries` VALUES (1320, 32, '113.102.164.48', '2021-03-09 07:22:26', '2021-03-09 07:22:26', NULL);
INSERT INTO `visitor_registries` VALUES (1321, 33, '113.102.164.48', '2021-03-09 07:22:30', '2021-03-09 07:22:30', NULL);
INSERT INTO `visitor_registries` VALUES (1322, 14, '113.102.164.48', '2021-03-09 07:22:51', '2021-03-09 07:23:03', NULL);
INSERT INTO `visitor_registries` VALUES (1323, 3, '113.102.164.48', '2021-03-09 07:24:56', '2021-03-09 07:24:56', NULL);
INSERT INTO `visitor_registries` VALUES (1324, 3, '127.0.0.0', '2021-04-08 10:18:27', '2021-04-08 10:18:27', 'United States-New Haven');
INSERT INTO `visitor_registries` VALUES (1325, 32, '127.0.0.1', '2021-04-16 06:15:43', '2021-04-16 06:15:43', '');
INSERT INTO `visitor_registries` VALUES (1326, 32, '127.0.0.1', '2021-04-16 06:15:44', '2021-04-16 06:15:44', '');
INSERT INTO `visitor_registries` VALUES (1327, 32, '127.0.0.1', '2021-04-16 06:15:45', '2021-04-16 06:15:45', '');
INSERT INTO `visitor_registries` VALUES (1328, 32, '127.0.0.1', '2021-04-16 06:15:46', '2021-04-16 06:15:46', '');
INSERT INTO `visitor_registries` VALUES (1329, 32, '127.0.0.1', '2021-04-16 06:15:46', '2021-04-16 06:15:46', '');
INSERT INTO `visitor_registries` VALUES (1330, 32, '127.0.0.1', '2021-04-16 06:15:46', '2021-04-16 06:15:46', '');
INSERT INTO `visitor_registries` VALUES (1331, 32, '127.0.0.1', '2021-04-16 06:15:59', '2021-04-16 06:15:59', '');
INSERT INTO `visitor_registries` VALUES (1332, 32, '127.0.0.1', '2021-04-16 06:16:00', '2021-04-16 06:16:00', '');
INSERT INTO `visitor_registries` VALUES (1333, 32, '127.0.0.1', '2021-04-16 06:20:23', '2021-04-16 06:20:23', '');
INSERT INTO `visitor_registries` VALUES (1334, 32, '127.0.0.1', '2021-04-16 06:20:34', '2021-04-16 06:20:34', '');
INSERT INTO `visitor_registries` VALUES (1335, 32, '127.0.0.1', '2021-04-16 06:20:47', '2021-04-16 06:20:47', '');
INSERT INTO `visitor_registries` VALUES (1336, 32, '127.0.0.1', '2021-04-16 06:20:48', '2021-04-16 06:20:48', '');
INSERT INTO `visitor_registries` VALUES (1337, 32, '127.0.0.1', '2021-04-16 06:20:50', '2021-04-16 06:20:50', '');
INSERT INTO `visitor_registries` VALUES (1338, 32, '127.0.0.1', '2021-04-16 06:29:01', '2021-04-16 06:29:01', '');
INSERT INTO `visitor_registries` VALUES (1339, 32, '127.0.0.1', '2021-04-16 06:29:01', '2021-04-16 06:29:01', '');
INSERT INTO `visitor_registries` VALUES (1340, 32, '127.0.0.1', '2021-04-16 06:29:01', '2021-04-16 06:29:01', '');
INSERT INTO `visitor_registries` VALUES (1341, 32, '127.0.0.1', '2021-04-16 06:29:34', '2021-04-16 06:29:34', '');
INSERT INTO `visitor_registries` VALUES (1342, 32, '127.0.0.1', '2021-04-16 06:30:14', '2021-04-16 06:30:14', '');
INSERT INTO `visitor_registries` VALUES (1343, 32, '127.0.0.1', '2021-04-16 06:30:14', '2021-04-16 06:30:14', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
