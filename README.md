# BasicAuthMark
Check whether HTTP Basic authentication is enabled or not.
if basic authenticaiton is enabled, show github ribbon on your page.

## Installation

### Rails app
All you have to do is to include the Gem
```ruby
gem "basic_auth_mark"
```

## Configuring
### Change ribbon position
#### Rails app
In `config/environments/#{environment}.rb`

```ruby
Rails.application.configure do
  # ...
  config.basic_auth_mark.position = 'left-bottom' # left-top/right-top/left-bottom/right-bottom
end
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/g-ozawa/basic_auth_mark. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BasicAuthMark project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/g-ozawa/basic_auth_mark/blob/master/CODE_OF_CONDUCT.md).

## Acknowledgements
- [rack-dev-mark](https://github.com/dtaniwaki/rack-dev-mark) got a lot of inspiration from this gem
- [github-fork-ribbon-css](https://github.com/simonwhitaker/github-fork-ribbon-css) for github-ribbon-css

## Copyright
Copyright © 2019 Kazuki Ozawa.
