
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `answers`
-- ----------------------------
CREATE TABLE  IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `catid` int(250) NOT NULL,
  `peck` int(11) NOT NULL,
  `incid` int(11) NOT NULL,
  `etid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`,`pid`,`eid`,`unit_id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `eid` (`eid`) USING BTREE,
  KEY `lid` (`unit_id`) USING BTREE,
  KEY `incid` (`incid`) USING BTREE,
  KEY `etid` (`etid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
