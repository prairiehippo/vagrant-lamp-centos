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
		body {
			margin-top: 100px;
			background-color: #e3e3e3;
		}
		.page-wrapper{
			width: 800px;
			margin: auto;
			padding: 50px;
			background-color: #ffffff;
			border-radius: 8px;
		}
	</style>
</head>

<body>
<div class="page-wrapper">

	<header>
		<marquee><strong>WPG Development Environment</strong></marquee>
	</header>

	<section>
		<ul>
			<?php foreach($folders as $folder) : ?>
				<li><a href="/<?php echo $folder ?>"> <?php echo $folder ?></a></li>
			<?php endforeach; ?>
		</ul>
	</section>

	<footer></footer>
</div>
</body>

</html>