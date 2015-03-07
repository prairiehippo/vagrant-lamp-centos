name "php"
description "PHP configuration"
run_list(
  "recipe[php]",
  "recipe[php::module_mysql]",
  "recipe[php::module_gd]",
  "recipe[php::module_curl]"
)