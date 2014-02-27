## attr_accessor
```ruby
  def attr_accessor(*args)
    args.each do |arg|
      define_method(arg) do
        instance_variable_get(:"@#{arg}")
      end
      define_method(:"#{arg}=") do |value|
        instance_variable_set(:"@#{arg}", value)
      end
    end
  end
```