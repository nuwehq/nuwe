# Nuwe

This gem wraps the [Nuwe API](https://api.nuapi.co/).

Nuwe is your digital wellness system for a better life.
It understands the exercise you do, the food you eat, and the biometric data you create.
Nuwe can intelligently combine them all into a single score and give you real-time decision-making support for your lifestyle.
Life with Nuwe puts you in charge of your health and wellness.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nuwe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nuwe

## Configuration

Configure the gem with your API token:

```
Nuwe.configure do |c|
  c.token = "8f399c4c-8bbf-4272-938e-f3e4123d194f"
end
```

For Rails, you can put the above content in `config/initializers/nuwe.rb`.

## Usage

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nuwe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
