class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drinks, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drinks = []
    @stomach = []
    @drunkenness = 0
  end

def buy_drink(drink)
  @wallet -= drink.price
  @drinks << drink if !drink.nil?
  drunk(drink)
end

def drink_count
  @drinks.count
end

def drunk(drink)
  @drunkenness += drink.abv
end

def is_drunk?
  if @drunkenness >= 20
    return true
  else
    return false
  end
end

#advanced extensions
  def buy_food(food)
    @wallet -= food.price
    @stomach << food if !food.nil?
    eaten(food)
  end

  def food_count
    @stomach.count
  end

  def eaten(food)
    @drunkenness -= food.rejuv
  end

end #Class end
