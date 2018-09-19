require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")

class PubTest < MiniTest::Test

  def setup

    @beer1 = Drink.new("Session", 4, 6)
    @beer2 = Drink.new("Session", 4, 6)
    @beer3 = Drink.new("Session", 4, 6)
    @beer4 = Drink.new("Session", 4, 6)
    @beer5 = Drink.new("Session", 4, 6)
    @beer = Drink.new("Session", 4, 6)
    # @martini = Drink.new("Martini", 6)

    @customer1 = Customer.new("Thomas", 100, 24)

    @pub = Pub.new("Chanter")
    @pub.add_drink(@beer1)
    @pub.add_drink(@beer2)
    @pub.add_drink(@beer3)
    @pub.add_drink(@beer4)
    @pub.add_drink(@beer5)
    @pub.add_drink(@beer) # 6 beers

  end

  def test_pub_has_name
    assert_equal("Chanter", @pub.name)
  end

  def test_stock_count
    assert_equal(6, @pub.stock)
  end

  def test_add_drink_to_pub
    @pub.add_drink(@beer)
    assert_equal(7, @pub.stock)
  end

  def test_customer_buys_drink_pub_gets_money
    @pub.drink_bought(@beer)
    @customer1.buy_drink(@beer)
    assert_equal(4, @pub.till)
    assert_equal(96, @customer1.wallet)
  end
#Pub hasn't actually lost a drink here, it's just taken in some money!

  def test_customer_buys_drink_pub_loses_drink_from_stock

    @pub.drink_bought(@beer1) # all beers were the same so all were being deleted?
    assert_equal(5, @pub.stock)

  end

  def test_transaction_customer_gains_drink

    @pub.transaction(@customer1, @beer)
    assert_equal(1, @customer1.drinks.count)

  end

  def test_customer_is_underage
 #not required to check age, just a nice personal touch to check no beer was sold anyway
    child = Customer.new("Billy", 5, 16)
    sale = @pub.transaction(child, @beer)
    assert_equal(6, @pub.stock)
    assert_equal("Soft drinks only!", sale)
  end

  def test_customer_is_smashed
    blotto = Customer.new("Frank", 100, 56)
    blotto.buy_drink(@beer)
    blotto.buy_drink(@beer)
    blotto.buy_drink(@beer)
    blotto.buy_drink(@beer)
    sale = @pub.transaction(blotto, @beer)
    assert_equal("I'm cutting you off for a bit Frank", sale)
  end

  def test_customer_is_sober

    frank = Customer.new("Frank", 1000, 56)
    frank.buy_drink(@beer)
    frank.buy_drink(@beer)
    @pub.transaction(frank, @beer)
    assert_equal(3, frank.drink_count)
  end

end #Class end
