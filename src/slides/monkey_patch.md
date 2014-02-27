## Monkey Patching by example

```ruby
class String
  def my_method
	"my_method is a cool method"
  end
end

'abc'.my_method # => "my_method is a cool method"
```