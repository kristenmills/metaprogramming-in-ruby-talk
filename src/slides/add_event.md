## add_event
```ruby
def add_event(event_name, &block)
  # Some other stuff happens before here
  @class.send(:define_method, :"can_#{event_name}?") do
    event.transitions.key? current_state.name
  end

  @class.send(:define_method, :"#{event_name}") do
    if event.transitions.key? current_state.name

      transition = event.transitions[current_state.name]
      unless transition.condition.nil? or self.instance_exec(&transition.condition)
        raise Error.new('Does not meet the transition condition')
      end
      new_state = states[event.transitions[current_state.name].to]

      event.callbacks[:before].each do |callback|
        self.instance_eval &callback
      end
      # More callbacks happen here
      @current_state = new_state
      # More Callbacks happe here

      event.callbacks[:after].each do |callback|
        self.instance_eval &callback
      end
      self
    else
      raise Error.new 'Invalid Transition'
    end
  end
 end
 ```