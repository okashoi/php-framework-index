<?php

// include, require 等で他のファイルのコードを読み込む
require_once __DIR__ . '/../config/database.php';

$pdo = new PDO(
    sprintf('mysql:host=%s;dbname=%s', MYSQL_HOST, MYSQL_DATABASE),
    MYSQL_USER,
    MYSQL_PASSWORD,
);

// $_GET, $_POST 等で入力を受け取る
$q = $_GET['q'] ?? '';

$stmt = $pdo->prepare('SELECT `name`, `price` FROM `products` WHERE `name` LIKE ?');
$stmt->execute(['%' . $q . '%']);

// .php ファイル内に HTML を記述したり、echo を使ったりすることで出力
?><!DOCTYPE html>
<html>
<body>
<form>
    <input name="q" value="<?php echo $q ?>">
    <input type="submit">
</form>
<table>
    <thead>
    <tr>
        <th>商品名</th>
        <th>価格</th>
    </tr>
    </thead>
    <tbody>
    <?php while ($row = $stmt->fetch()): ?>
        <tr>
            <th><?php echo htmlspecialchars($row['name']); ?></th>
            <th><?php echo $row['price']; ?></th>
        </tr>
    <?php endwhile; ?>
    </tbody>
</table>
</body>
</html>