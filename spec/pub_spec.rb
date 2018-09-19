require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")

class PubTest < MiniTest::Test

  def setup

    @beer = Drink.new("Session", 4)
    @martini = Drink.new("Martini", 6)

    @customer1 = Customer.new("Thomas", 100, 24)

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

  def test_customer_buys_drink_pub_loses_drink
    @pub.drink_bought(@customer1, @beer)
    @customer1.buy_drink(@beer)
    assert_equal(4, @pub.till)
    assert_equal(96, @customer1.wallet)
  end



end #Class end
