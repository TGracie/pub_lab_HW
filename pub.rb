class Pub

  attr_reader :name
  attr_accessor :drinks, :till

  def initialize(name)
    @name = name
    @drinks = []
    @till = 0
  end

  def stock
    @drinks.count()
  end

  def add_drink(drink)
    @drinks.push(drink)
  end

  def drink_bought(drink_being_bought) #Pub hasn't lost a drink yet!
    @till += drink_being_bought.price
    return @drinks.delete(drink_being_bought)
  end

  def transaction(customer, drink_to_buy)
      if customer.age < 18
        return "Soft drinks only!"
      else
        returned_drink = drink_bought(drink_to_buy)
        customer.buy_drink(returned_drink)
    end
  end

end #class end
