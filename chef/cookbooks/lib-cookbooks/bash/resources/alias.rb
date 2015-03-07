actions :create
default_action :create

attribute :name, kind_of: [String, Symbol], name_attribute: true
attribute :command, kind_of: [String, NilClass], default: nil
attribute :user, kind_of: [String], required: true
