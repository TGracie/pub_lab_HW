class Pub

  attr_reader :name
  attr_accessor :drinks, :till

  def initialize(name)
    @name = name
    @drinks = []
    @food = []
    @till = 0
  end

  # STOCK RELATED STUFF
  # Drink stocking
  def drink_stock
    @drinks.count()
  end

  def add_drink(drink)
    @drinks.push(drink)
  end

  # Food Stocking
  def food_stock
    @food.count()
  end

  def add_food(food)
    @food.push(food)
  end

  # PURCHASING
  # Drink Sales
  def drink_bought(drink_being_bought) #Pub hasn't lost a drink yet!
    @till += drink_being_bought.price
    return @drinks.delete(drink_being_bought)
  end

  def drink_transaction(customer, drink_to_buy)
      if customer.age < 18
        return "Soft drinks only!"
      elsif
        customer.is_drunk?
        return "I'm cutting you off for a bit #{customer.name}"
      elsif customer.wallet < drink_to_buy.price
        return "No free drinks!"
      else
        returned_drink = drink_bought(drink_to_buy)
        customer.buy_drink(returned_drink)
    end
  end

  # Food Sales
  def food_bought(food_being_bought)
    @till += food_being_bought.price
    return @food.delete(food_being_bought)
  end

  def food_transaction(customer, food_to_buy)
    if customer.wallet < food_to_buy.price
      return "No free food!"
    else
      returned_food = food_bought(food_to_buy)
      customer.buy_food(returned_food)
    end
  end

end #class end
