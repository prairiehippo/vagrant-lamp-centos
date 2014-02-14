name "basic_lamp"
description "A LAMP stack for PHP development."
run_list(
  "role[apache2_webserver]",
  "role[mysql_server]",
  "role[php]",
  "recipe[app::sites]",
  "recipe[app::drupal]",
  "recipe[composer]",
  "recipe[nodejs]",
  "recipe[grunt_cookbook::install_grunt_prereq]",
  "recipe[grunt_cookbook::install_grunt_cli]",
  "recipe[mailcatcher]"
)