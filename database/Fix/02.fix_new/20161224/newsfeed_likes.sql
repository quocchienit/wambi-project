CREATE TABLE  IF NOT EXISTS `newsfeed_likes` (
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of newsfeed_likes
-- ----------------------------
