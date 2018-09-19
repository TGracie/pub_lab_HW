require("minitest/autorun")
require("minitest/rg")
require_relative("../food.rb")

class DrinkTest < MiniTest::Test

  def test_food_exists
    burger = Food.new("Burger", 6, 4)
    assert_equal("Burger", burger.name)
  end

end #class end
