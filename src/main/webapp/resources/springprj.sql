CREATE TABLE `user` (
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nick_name` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `profile_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'default_img.jpg',
  `total_points` int DEFAULT '0',
  `curr_points` int DEFAULT '0',
  `grade` int DEFAULT '10',
  `reg_at` datetime DEFAULT (now()),
  `last_login` datetime DEFAULT NULL,
  `slang` tinyint DEFAULT '0',
  `adult` tinyint DEFAULT '0',
  `font_color` varchar(50) DEFAULT 'black',
  PRIMARY KEY (`email`)
);

CREATE TABLE `tv_review` (
  `writer` varchar(100) NOT NULL,
  `tvid` bigint NOT NULL,
  `reg_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `mod_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(1000) NOT NULL
);

CREATE TABLE `tv_rating` (
  `tvid` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `rating` float NOT NULL
);

CREATE TABLE `tv_like` (
  `email` varchar(100) NOT NULL,
  `tvid` bigint NOT NULL,
  `reg_at` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `tv_heart` (
  `tvb_id` bigint NOT NULL,
  `email` varchar(100) NOT NULL
); 

CREATE TABLE `tv_comment` (
  `tvc_id` bigint NOT NULL AUTO_INCREMENT,
  `tvb_id` bigint NOT NULL,
  `writer` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `heart` text,
  `reg_at` datetime DEFAULT (now()),
  `mod_at` datetime DEFAULT (now()),
  PRIMARY KEY (`tvc_id`)
);

CREATE TABLE `tv_board` (
  `tvb_id` bigint NOT NULL AUTO_INCREMENT,
  `writer` varchar(100) NOT NULL,
  `tvid` bigint NOT NULL,
  `title` varchar(50) NOT NULL,
  `like_hate` tinyint NOT NULL,
  `content` text NOT NULL,
  `reg_at` datetime DEFAULT (now()),
  `mod_at` datetime DEFAULT (now()),
  `read_count` int DEFAULT '0',
  `heart` text,
  `poster` varchar(200) DEFAULT NULL,
  `tv_title` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `cmt_qty` int DEFAULT '0',
  `nick_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tvb_id`)
);

CREATE TABLE `tv` (
  `tvid` bigint NOT NULL,
  `title` varchar(200) NOT NULL,
  `poster` varchar(200) DEFAULT NULL,
  `genres` varchar(100) DEFAULT NULL
);

CREATE TABLE `shop` (
  `sid` bigint NOT NULL AUTO_INCREMENT,
  `category` int DEFAULT NULL,
  `sname` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sid`)
);

CREATE TABLE `notice` (
  `nid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `reg_at` datetime DEFAULT (now()),
  `mod_at` datetime DEFAULT (now()),
  `read_count` int DEFAULT '0',
  `nick_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nid`)
);

CREATE TABLE `m_review` (
  `mid` bigint NOT NULL,
  `writer` varchar(100) NOT NULL,
  `reg_at` datetime DEFAULT (now()),
  `mod_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(1000) NOT NULL
);

CREATE TABLE `movie` (
  `mid` bigint NOT NULL,
  `title` varchar(200) NOT NULL,
  `poster` varchar(200) DEFAULT NULL,
  `genres` varchar(100) DEFAULT NULL
);

CREATE TABLE `m_like` (
  `email` varchar(100) NOT NULL,
  `mid` bigint NOT NULL,
  `reg_at` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `m_rating` (
  `mid` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `rating` float NOT NULL
);

CREATE TABLE `m_heart` (
  `mb_id` bigint NOT NULL,
  `email` varchar(100) NOT NULL
);

CREATE TABLE `m_comment` (
  `mc_id` bigint NOT NULL AUTO_INCREMENT,
  `mb_id` bigint NOT NULL,
  `writer` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `heart` text,
  `reg_at` datetime DEFAULT (now()),
  `mod_at` datetime DEFAULT (now()),
  PRIMARY KEY (`mc_id`)
);

CREATE TABLE `m_board` (
  `mb_id` bigint NOT NULL AUTO_INCREMENT,
  `writer` varchar(100) NOT NULL,
  `mid` bigint NOT NULL,
  `title` varchar(50) NOT NULL,
  `like_hate` tinyint NOT NULL,
  `content` text NOT NULL,
  `reg_at` datetime DEFAULT (now()),
  `mod_at` datetime DEFAULT (now()),
  `read_count` int DEFAULT '0',
  `heart` text,
  `poster` varchar(200) DEFAULT NULL,
  `movie_title` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `cmt_qty` int DEFAULT '0',
  `nick_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mb_id`)
);

CREATE TABLE `auth_user` (
  `email` varchar(100) NOT NULL,
  `auth` varchar(50) NOT NULL
);