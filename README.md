# Rabdabs

Author's personal gem to create document from RSpec with Rails

## Installation

```
gem "rabdabs", git: 'https://github.com/longicorn/rabdabs.git', branch: 'master'
```

Add underline to `config/application.rb`

```
config.middleware.use Rabdabs::Middleware if Rails.env.test?
```

## Usage

```
bundle exec rspec *_spec.rb
```

## Development && Contributing

You are free to use it, but for the time being only the author will develop it.

No plans to register with rubygems in the immediate future.
