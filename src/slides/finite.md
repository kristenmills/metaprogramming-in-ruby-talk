## Vending Machine
```ruby
 finite initial: :idle do

    before :idle do
      @current_money = 0
    end

    after :accepting do
      puts "Current amount in machine: $%.2f" % @current_money
    end
    
    @money.each do |event_name, amount|
      event :"insert_#{event_name}" do
        before do
          puts "Adding #{event_name}"
          add_money (amount)
        end
        go from: :idle, to: :accepting
        go from: :accepting, to: :accepting
      end
    end

    @products.each do |event_name, price|
      event :"buy_#{event_name}" do
        before { puts "Buying #{event_name}" }
        go from: :accepting, to: :vending, if: lambda { @current_money >= price }
        after do
          @current_money -= price
        end
      end
    end

    event :complete_vend do
      before { puts "Returning $%.2f to the customer" % @current_money }
      go from: :vending, to: :idle
    end

    event :press_coin_return do
      before { puts "Returning $%.2f to the customer" % @current_money }
      go from: :accepting, to: :idle
    end
  end
 ```