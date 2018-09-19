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

  def drink_bought(drink) #Pub hasn't lost a drink yet!
    @till += drink.price
    return @drinks.delete(drink)
  end

  def transaction(customer, drink_to_buy)
    returned_drink = drink_bought(drink_to_buy)
    customer.buy_drink(returned_drink)
  end

end #class end
