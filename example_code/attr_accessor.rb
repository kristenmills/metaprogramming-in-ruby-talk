def our_attr_accessor(*args)
  args.each do |arg|
    define_method(arg) do
      instance_variable_get(:"@#{arg}")
    end
    define_method(:"#{arg}=") do |value|
      instance_variable_set(:"@#{arg}", value)
    end
  end
end

class MyClass
  our_attr_accessor :hip, :current

  def initialize(hip, current)
    @hip = hip
    @current = current
  end
end

c = MyClass.new('so hip', 'so current')

puts c.hip
puts c.current
c.hip = "YEAHHHH"
puts c.hip