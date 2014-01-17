name "basic_lamp"
description "A LAMP stack for PHP development."
run_list(
  "role[apache2_webserver]",
  "role[mysql_server]",
  "role[php]",

  "recipe[app::sites]",
  "recipe[app::drupal]",
  "recipe[drush]"

  #{}"recipe[mailcatcher]"
)