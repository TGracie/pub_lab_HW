class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drinks, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drinks = []
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

end #Class end
