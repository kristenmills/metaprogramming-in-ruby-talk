## attr_accessor
```ruby
  def attr_accessor(*args)
    args.each do |arg|
      define_method(arg) do
        instance_eval_get("@#{arg}.to_s".to_sym)
      end
      define_method("#{arg.to_s}=") do |value|
        instance_eval_set("@#{arg}.to_s".to_sym, value)
      end
    end
  end
```