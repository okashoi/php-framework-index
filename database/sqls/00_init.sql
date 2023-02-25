CREATE TABLE `products` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NOT NULL,
    `price` INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `products` (`name`, `price`) VALUES
 ('牛乳', 120),
 ('豚肉（300 g）', 400),
 ('豚肉（200 g）', 270),
 ('牛肉（300 g）', 500),
 ('豆腐', 80),
 ('納豆', 90),
 ('卵', 90);
