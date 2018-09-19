require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")

class PubTest < MiniTest::Test

  def setup

    @beer = Drink.new("Session", 4)
    @martini = Drink.new("Martini", 6)

    @pub = Pub.new("Chanter")

  end

  def test_pub_has_name
    assert_equal("Chanter", @pub.name)
  end

  def test_stock_count
    
  end

  # def test_add_drink_to_pub
  #   stock = @pub.drinks.count
  #   assert_equal(1, stock)
  #
  # end

end #Class end
