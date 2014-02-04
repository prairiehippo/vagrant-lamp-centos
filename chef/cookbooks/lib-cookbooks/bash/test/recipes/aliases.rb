describe_recipe 'the aliases' do
  it 'is sourced in the bash profile' do
    node.bash_aliases.users.each do |username, aliases|
      file("/home/#{username}/.bash_profile").must_include 'source ~/.bash_aliases'
    end
  end

  it 'are added to the bash_aliases file' do
    node.bash_aliases.users.each do |username, aliases|
      aliases.each do |alias_name, command|
        file("/home/#{username}/.bash_aliases").must_include %(alias #{alias_name}="#{command.gsub('"', '\"').gsub("'", "\'").gsub("'", '\\"')}")
      end
    end
  end

  it 'escapes aliases that has double quotes in them' do
    file("/home/matt/.bash_aliases").must_include 'alias has_double_quotes="\\"this will have to be escaped\\""'
  end

  it 'escapes aliases that has single quotes in them' do
    file("/home/matt/.bash_aliases").must_include %(alias has_single_quotes="\\"this will have to be escaped\\"")
  end
end
