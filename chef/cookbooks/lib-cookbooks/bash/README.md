# Bash Alias Cookbook

This is a cookbook for Chef to create bash aliases.

Add the default recipe to your run list, and set attributes like so:

```
  attributes:
    bash_alias:
      users:
        matt:
          l: ls -lha
          gst: git status
```

These attributes allow reliable merging when your run includes bash aliases for multiple users.

## Contributing

This is maintained by Matt Simpson (@coffeencoke).

View the CONTRIBUTING.md file for info on that.