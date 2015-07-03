# Custom Fields Ruby on Rails

Add custom field functional to yours Rails app!

  - `gem 'cfror'`
  - `bundle`
  - `rake railties:install:migrations`
  - `rake db:migrate`

And now you can put to the some model.

```ruby
 has_many :fields, as: :fieldable, class_name: Cfror::Field
```
Cfror::Field has Integer String Text Image and Set column types

## It is alfa version now!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
