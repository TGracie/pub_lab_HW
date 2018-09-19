require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")

class DrinkTest < MiniTest::Test



def test_drink_has_name()
  beer = Drink.new("First World Problems", 4, 6)
  assert_equal("First World Problems", beer.name)
end

def test_drink_has_price
  martini = Drink.new("Martini", 6)
  assert_equal(6, martini.price)
end

end #Class end
