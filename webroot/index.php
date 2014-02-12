<?php
	$folders = scandir('.');
	//hide hidden files, back references
	foreach($folders as $key => $value) {
		if(substr($value, 0, 1) == '.') {
			unset ($folders[$key]);
		}
	}
?>


<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>WPG Development Environment</title>
	<style>
	</style>
</head>

<body>

	<header>
	</header>

	<section>
		<ul>
			<?php foreach($folders as $folder) : ?>
				<li><a href="/<?php echo $folder ?>"> <?php echo $folder ?></a></li>
			<?php endforeach; ?>
		</ul>
	</section>

	<footer></footer>

</body>

</html>