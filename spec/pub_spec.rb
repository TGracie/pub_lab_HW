require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")

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
    assert_equal(0, @pub.stock)
  end

  def test_add_drink_to_pub
    @pub.add_drink(@beer)
    assert_equal(1, @pub.stock)
  end



end #Class end
