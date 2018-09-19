require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")

class PubTest < MiniTest::Test

  def setup

    @beer = Drink.new("Session", 4)
    # @martini = Drink.new("Martini", 6)

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

  def test_customer_buys_drink_pub_gets_money
    @pub.drink_bought(@beer)
    @customer1.buy_drink(@beer)
    assert_equal(4, @pub.till)
    assert_equal(96, @customer1.wallet)
  end
#Pub hasn't actually lost a drink here, it's just taken in some money!

def test_customer_buys_drink_pub_loses_drink_from_stock
  @pub.add_drink(@beer)
  @pub.drink_bought(@beer)
  assert_equal(0, @pub.stock)
end

def test_transaction_pub_loses_customer_gains
  @pub.add_drink(@beer)
  @pub.transaction(@customer1, @beer)
  assert_equal(1, @customer1.drinks.count)
  assert_equal(0, @pub.stock)
end

def test_customer_is_underage
  @pub.add_drink(@beer)
  child = Customer.new("Billy", 5, 16)
  sale = @pub.transaction(child, @beer)
  assert_equal(1, @pub.stock)
  assert_equal("Soft drinks only!", sale)
end

end #Class end
