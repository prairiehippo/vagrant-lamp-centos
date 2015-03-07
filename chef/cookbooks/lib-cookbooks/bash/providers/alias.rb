def whyrun_supported?
  true
end

action :create do
  Chef::Log.info "Creating bash alias '#{new_resource.name}'..."
  if valid_alias?
    content = %(alias #{new_resource.name}="#{new_resource.command.gsub('"', '\\"').gsub("'", '\\"')}")
    destination_file = "~#{new_resource.user}/.bash_aliases"
    bash "Add alias to #{destination_file}" do
      code %(echo '#{content}' >> #{destination_file})
      not_if %(grep '#{content}' #{destination_file})
    end

    Chef::Log.info "Bash alias created: #{new_resource.name}=#{new_resource.command}"
  else
    Chef::Log.error "Alias was not valid, could not create the alias"
  end
end

def valid_alias?
  !new_resource.command.nil? && new_resource.command != ''
end

