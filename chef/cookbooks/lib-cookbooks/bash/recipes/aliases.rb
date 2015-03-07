require_recipe "user"

node.bash_aliases.users.each do |username, aliases|
  user_account username

  content = <<-eof
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
  eof
  destination_file = "~#{username}/.bash_profile"

  bash "Source ~#{username}/.bash_aliases in #{destination_file}" do
    code <<-EOT
      echo '#{content}' >> #{destination_file}
    EOT
    not_if "grep '#{content}' #{destination_file}"
  end

  aliases.each do |alias_name, command_value|
    bash_alias alias_name do
      command command_value
      user username
    end
  end
end
