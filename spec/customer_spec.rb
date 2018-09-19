require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../food.rb")

class CustomerTest < MiniTest::Test

  def setup

    @customer1 = Customer.new("Thomas", 100, 24)

    @customer2 = Customer.new("Oksana", 100, 35)

    @beer = Drink.new("Session", 4, 6)

    @pub = Pub.new("Chanter")

  end #setup end

  def test_customer_has_money
    assert_equal(100, @customer1.wallet)
  end

  def test_customer_can_buy_drink
    @customer1.buy_drink(@beer)
    assert_equal(96, @customer1.wallet)
  end

  def test_customer_can_take_drink
    @customer1.buy_drink(@beer)
    assert_equal(1, @customer1.drink_count)
  end

  def test_customer_drunkenness
    @customer1.buy_drink(@beer)
    assert_equal(6, @customer1.drunkenness)
  end

  def test_customer_is_drunk
    @customer1.buy_drink(@beer)
    @customer1.buy_drink(@beer)
    @customer1.buy_drink(@beer)
    @customer1.buy_drink(@beer)
    assert_equal(true, @customer1.is_drunk?)
  end
  def test_customer_is_not_drunk
    @customer1.buy_drink(@beer)
    @customer1.buy_drink(@beer)
    @customer1.buy_drink(@beer)
    assert_equal(false, @customer1.is_drunk?)
    end

end # class end
