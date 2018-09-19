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

  def drink_bought(customer, drink)
    @till += drink.price
  end

end #class end
