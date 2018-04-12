# Wayarmy

`wayarmy` is commandline that will help you request to https://gitlab.com, get the response time, response code and show you the response time average in 1 minute.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wayarmy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wayarmy

## Usage

```
~$ wayarmy
Response: 302
Response Time: 1724.636 ms
----------------------------
Response: 302
Response Time: 1198.0919999999999 ms
----------------------------
Response: 302
Response Time: 1477.838 ms
----------------------------
Response: 302
Response Time: 1220.4060000000002 ms
----------------------------
Response: 302
Response Time: 1228.977 ms
----------------------------
Response: 302
Response Time: 1063.3870000000002 ms
----------------------------
Response Time average: 1318.8893333333333
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Please read carefully of [CODEOFCONDUCT](CodeOfConduct.md)
