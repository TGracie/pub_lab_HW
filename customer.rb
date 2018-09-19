class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drinks

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drinks = []
  end

def buy_drink(drink)
  @wallet -= drink.price
  @drinks << drink if !drink.nil?
end

def drink_count
  @drinks.count
end

# def take_drink(drink)
#
# end

end #Class end
