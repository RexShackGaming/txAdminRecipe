CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'Anticheat',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `outlawstatus` int(11) NOT NULL DEFAULT 0,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `slots` int(11) NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
  `skin` VARCHAR(8000) NOT NULL COLLATE 'utf8mb3_general_ci',
  `clothes` VARCHAR(8000) NOT NULL COLLATE 'utf8mb4_general_ci',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
  `name` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
  `clothes` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `player_horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stable` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `horseid` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `horse` varchar(50) DEFAULT NULL,
  `dirt` int(11) DEFAULT 0,
  `horsexp` int(11) DEFAULT 0,
  `components` LONGTEXT NOT NULL DEFAULT '{}',
  `gender` varchar(11) NOT NULL,
  `wild` varchar(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `born` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_ammo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL,
  `ammo_revolver` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun_buckshot_incendiary` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun_slug` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun_slug_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_elephant` INT(3) NOT NULL DEFAULT '0',
  `ammo_22` INT(3) NOT NULL DEFAULT '0',
  `ammo_22_tranquilizer` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_small_game` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_fire` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_poison` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_dynamite` INT(3) NOT NULL DEFAULT '0',
  `ammo_molotov` INT(3) NOT NULL DEFAULT '0',
  `ammo_tomahawk` INT(3) NOT NULL DEFAULT '0',
  `ammo_tomahawk_ancient` INT(3) NOT NULL DEFAULT '0',
  `ammo_dynamite` INT(3) NOT NULL DEFAULT '0',
  `ammo_poisonbottle` INT(3) NOT NULL DEFAULT '0',
  `ammo_throwing_knives` INT(3) NOT NULL DEFAULT '0',
  `ammo_throwing_knives_drain` INT(3) NOT NULL DEFAULT '0',
  `ammo_throwing_knives_poison` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas_hawkmoth` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas_intertwined` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas_ironspiked` INT(3) NOT NULL DEFAULT '0',
  `ammo_hatchet` INT(3) NOT NULL DEFAULT '0',
  `ammo_hatchet_hunter` INT(3) NOT NULL DEFAULT '0',
  `ammo_hatchet_cleaver` INT(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_weapons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serial` varchar(16) NOT NULL,
  `citizenid` varchar(9) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}',
  `components_before` varchar(4096) NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_weapons_custom` (
  `gunsiteid` VARCHAR(20) NOT NULL,
  `propid` VARCHAR(20) NOT NULL,
  `citizenid` VARCHAR(50) NOT NULL,
  `item` VARCHAR(50) NOT NULL,
  `propdata` LONGTEXT NOT NULL,
  PRIMARY KEY (`gunsiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `job_name` VARCHAR(50) NOT NULL,
  `amount`  INT(100) NOT NULL,
  `type` ENUM('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('vallaw', 0, 'boss'),
('rholaw', 0, 'boss'),
('blklaw', 0, 'boss'),
('strlaw', 0, 'boss'),
('stdenlaw', 0, 'boss'),
('medic', 0, 'boss');

CREATE TABLE IF NOT EXISTS `favorites_animations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `favorites` longtext DEFAULT ('[]') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `grade` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `shop_stock` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_name` VARCHAR(50) NOT NULL,
  `item_name` VARCHAR(50) NOT NULL,
  `stock` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `shop_name_item_name` (`shop_name`, `item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_reports` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_type` VARCHAR(50) NOT NULL,
  `reporter_id` INT(11) NOT NULL,
  `reporter_name` VARCHAR(255) NOT NULL,
  `reporter_license` VARCHAR(255) NOT NULL,
  `reporter_discord` VARCHAR(255) DEFAULT NULL,
  `reporter_coords` VARCHAR(255) NOT NULL,
  `reported_player_id` INT(11) DEFAULT NULL,
  `reported_player_name` VARCHAR(255) DEFAULT NULL,
  `reported_player_license` VARCHAR(255) DEFAULT NULL,
  `reported_player_discord` VARCHAR(255) DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `image_url` VARCHAR(500) DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'open',
  `assigned_admin_id` INT(11) DEFAULT NULL,
  `assigned_admin_name` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_report_messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `sender_type` VARCHAR(50) NOT NULL,
  `sender_id` INT(11) NOT NULL,
  `sender_name` VARCHAR(255) NOT NULL,
  `message` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`report_id`) REFERENCES `admin_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_report_nearby_players` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `player_id` INT(11) NOT NULL,
  `player_name` VARCHAR(255) NOT NULL,
  `player_license` VARCHAR(255) NOT NULL,
  `distance` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`report_id`) REFERENCES `admin_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `telegrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `sendername` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `sentDate` varchar(25) NOT NULL,
  `message` varchar(455) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `birdstatus` TINYINT(2) NOT NULL DEFAULT '0',
  `fromPostOffice` TINYINT(1) NOT NULL DEFAULT '0',
  `pickedUp` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `address_book` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `name`  VARCHAR(50) NOT NULL,
  `owner`  VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rex_codes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `item` varchar(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `admin` varchar(255) NOT NULL,
  `uses` int(255) NOT NULL,
  `redeemed_players` varchar(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rex_houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent` varchar(30) NOT NULL,
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL DEFAULT '0',
  `owned` tinyint(4) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `credit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_owned` (`owned`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `rex_houses` (`id`, `agent`, `houseid`, `citizenid`, `owned`, `price`, `credit`) VALUES
(1, 'newhanover', 'house1', '0', 0, 3000, 0),
(2, 'westelizabeth', 'house2', '0', 0, 4000, 0),
(3, 'newhanover', 'house3', '0', 0, 2000, 0),
(4, 'lemoyne', 'house4', '0', 0, 4000, 0),
(5, 'lemoyne', 'house5', '0', 0, 3000, 0),
(6, 'lemoyne', 'house6', '0', 0, 2000, 0),
(7, 'newaustin', 'house7', '0', 0, 2000, 0),
(8, 'newhanover', 'house8', '0', 0, 4000, 0),
(9, 'newhanover', 'house9', '0', 0, 1000, 0),
(10, 'newhanover', 'house10', '0', 0, 4000, 0),
(11, 'lemoyne', 'house11', '0', 0, 4000, 0),
(12, 'lemoyne', 'house12', '0', 0, 4000, 0),
(13, 'lemoyne', 'house13', '0', 0, 5000, 0),
(14, 'lemoyne', 'house14', '0', 0, 4000, 0),
(15, 'lemoyne', 'house15', '0', 0, 2000, 0),
(16, 'lemoyne', 'house16', '0', 0, 3000, 0),
(17, 'newhanover', 'house17', '0', 0, 3000, 0),
(18, 'newhanover', 'house18', '0', 0, 4000, 0),
(19, 'newhanover', 'house19', '0', 0, 500, 0),
(20, 'ambarino', 'house20', '0', 0, 3000, 0),
(21, 'newhanover', 'house21', '0', 0, 2500, 0),
(22, 'ambarino', 'house22', '0', 0, 2000, 0),
(23, 'ambarino', 'house23', '0', 0, 2500, 0),
(24, 'ambarino', 'house24', '0', 0, 1000, 0),
(25, 'westelizabeth', 'house25', '0', 0, 2000, 0),
(26, 'westelizabeth', 'house26', '0', 0, 3500, 0),
(27, 'westelizabeth', 'house27', '0', 0, 1250, 0),
(28, 'westelizabeth', 'house28', '0', 0, 1500, 0),
(29, 'newaustin', 'house29', '0', 0, 1000, 0),
(30, 'newaustin', 'house30', '0', 0, 4000, 0),
(31, 'newaustin', 'house31', '0', 0, 1500, 0),
(32, 'newaustin', 'house32', '0', 0, 1500, 0),
(33, 'newaustin', 'house33', '0', 0, 1250, 0),
(34, 'ambarino', 'house34', '0', 0, 1000, 0),
(35, 'ambarino', 'house35', '0', 0, 1000, 0),
(36, 'newhanover', 'house36', '0', 0, 2000, 0),
(37, 'ambarino', 'house37', '0', 0, 3000, 0),
(38, 'newhanover', 'house38', '0', 0, 750, 0),
(39, 'newhanover', 'house39', '0', 0, 2000, 0),
(40, 'lemoyne', 'house40', '0', 0, 1300, 0),
(41, 'lemoyne', 'house41', '0', 0, 0, 0),
(42, 'ambarino', 'house42', '0', 0, 2500, 0),
(43, 'newaustin', 'house43', '0', 0, 2500, 0),
(44, 'newhanover', 'house44', '0', 0, 3000, 0),
(45, 'lemoyne', 'house45', '0', 0, 10000, 0),
(46, 'westelizabeth', 'house46', '0', 0, 2000, 0),
(47, 'newhanover', 'house47', '0', 0, 2000, 0),
(48, 'westelizabeth', 'house48', '0', 0, 5000, 0);

CREATE TABLE IF NOT EXISTS `rex_housekeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_houseid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rex_doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doorid` varchar(11) NOT NULL DEFAULT '0',
  `doorstate` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `rex_doors` (`doorid`, `doorstate`) VALUES
('3598523785', 1),
('2031215067', 1),
('1189146288', 1),
('906448125', 1),
('2821676992', 1),
('1510914117', 1),
('3549587335', 1),
('3000692149', 1),
('1928053488', 1),
('772977516', 1),
('527767089', 1),
('3468185317', 1),
('2779142555', 1),
('1239033969', 1),
('1597362984', 1),
('1299456376', 1),
('2933656395', 1),
('3238637478', 1),
('3544613794', 1),
('1485561723', 1),
('1511858696', 1),
('1282705079', 1),
('2238665296', 1),
('2080980868', 1),
('2700347737', 1),
('2544301759', 1),
('3720952508', 1),
('350169319', 1),
('984852093', 1),
('3473362722', 1),
('686097120', 1),
('3107660458', 1),
('3419719645', 1),
('3945582303', 1),
('862008394', 1),
('1661737397', 1),
('1574473390', 1),
('3731688048', 1),
('344028824', 1),
('2652873387', 1),
('2061942857', 1),
('3702071668', 1),
('1934463007', 1),
('2183007198', 1),
('4288310487', 1),
('872775928', 1),
('2385374047', 1),
('2051127971', 1),
('3167436574', 1),
('1195519038', 1),
('2212914984', 1),
('562830153', 1),
('663425326', 1),
('1171581101', 1),
('52014802', 1),
('4164042403', 1),
('2047072501', 1),
('2715667864', 1),
('1263476860', 1),
('1894337720', 1),
('120764251', 1),
('943176298', 1),
('2971757040', 1),
('1973911195', 1),
('784290387', 1),
('843137708', 1),
('4275653891', 1),
('1431398235', 1),
('896012811', 1),
('2813949612', 1),
('868379185', 1),
('640077562', 1),
('3045682143', 1),
('1915887592', 1),
('3324299212', 1),
('1180868565', 1),
('1535511805', 1),
('2395304827', 1),
('1606546482', 1),
('818583340', 1),
('2310818050', 1);

CREATE TABLE `rex_storage` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) DEFAULT NULL,
    `properties` text NOT NULL,
    `propid` varchar(100) NOT NULL,
    `proptype` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_propid` (`propid`),
    KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rex_storage_guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propid` varchar(255) NOT NULL,
  `owner_citizenid` varchar(50) NOT NULL,
  `guest_citizenid` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_guest_storage` (`propid`, `guest_citizenid`),
  KEY `propid` (`propid`),
  KEY `guest_citizenid` (`guest_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rex_trader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traderid` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `lowstock` int(11) NOT NULL DEFAULT 0,
  `highstock` int(11) NOT NULL DEFAULT 0,
  `baseprice` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `rex_trader` (`traderid`, `item`, `stock`, `lowstock`, `highstock`, `baseprice`) VALUES
('emeraldtrader', 'bread', 0, 10, 100, 0.10),
('emeraldtrader', 'water', 0, 10, 100, 0.10),
('bladetrader', 'bread', 0, 10, 100, 0.10),
('bladetrader', 'water', 0, 10, 100, 0.10),
('littlecreektrader', 'bread', 0, 10, 100, 0.10),
('littlecreektrader', 'water', 0, 10, 100, 0.10);

CREATE TABLE IF NOT EXISTS `rex_trapfishing` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) DEFAULT NULL COMMENT 'Player identifier (e.g. license/citizenid)',
  `owner` VARCHAR(50) DEFAULT NULL COMMENT 'Optional display name or secondary owner',
  `properties` TEXT NOT NULL COMMENT 'JSON/string with coordinates, zone, etc.',
  `propid` INT(11) NOT NULL COMMENT 'Unique prop/spawn ID in the world',
  `proptype` VARCHAR(50) DEFAULT NULL COMMENT 'Type of trap model',
  `crayfish` INT(11) NOT NULL DEFAULT 0,
  `lobster` INT(11) NOT NULL DEFAULT 0,
  `crab` INT(11) NOT NULL DEFAULT 0,
  `bluecrab` INT(11) NOT NULL DEFAULT 0,
  `bait` TINYINT(2) NOT NULL DEFAULT 0 COMMENT '0 = no bait, 1 = baited (or amount if you expand later)',
  `quality` TINYINT(3) UNSIGNED NOT NULL DEFAULT 100 COMMENT 'Trap durability/health 0-100',
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_propid` (`propid`),
  UNIQUE KEY `uniq_propid` (`propid`)  -- prevents duplicate traps with same propid
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rex_wagons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizen_id` varchar(50) NOT NULL,
  `wagon_id` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `storage` int(11) DEFAULT 10000,
  `slots` int(11) DEFAULT 1,
  `description` longtext DEFAULT NULL,
  `stored` tinyint(1) DEFAULT 0,
  `storage_shop` varchar(50) DEFAULT 'valentine',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`),
  KEY `idx_citizen_id` (`citizen_id`),
  KEY `idx_plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;