require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../food.rb")

class PubTest < MiniTest::Test

  def setup
    @pub = Pub.new("Chanter")

    @customer1 = Customer.new("Thomas", 100, 24)

    @beer = Drink.new("Session", 4, 6)
    @beer1 = Drink.new("Session", 4, 6)
    @beer2 = Drink.new("Session", 4, 6)
    @beer3 = Drink.new("Session", 4, 6)
    @beer4 = Drink.new("Session", 4, 6)
    @beer5 = Drink.new("Session", 4, 6)

    @pub.add_drink(@beer) # 6 beers
    @pub.add_drink(@beer1)
    @pub.add_drink(@beer2)
    @pub.add_drink(@beer3)
    @pub.add_drink(@beer4)
    @pub.add_drink(@beer5)

    @burger = Food.new("Burger", 6, 3)
    @chips = Food.new("Chips", 3, 5)
    @pie = Food.new("Steak Pie", 5, 3)
    @sunday_roast = Food.new("Sunday Roast", 12, 8)

    @pub.add_food(@burger)
    @pub.add_food(@chips)
    @pub.add_food(@pie)
    @pub.add_food(@sunday_roast)

  end

  def test_pub_has_name
    assert_equal("Chanter", @pub.name)
  end

  def test_stock_count
    assert_equal(6, @pub.drink_stock)
    assert_equal(4, @pub.food_stock)
  end

  def test_add_drink_to_pub
    @pub.add_drink(@beer)
    assert_equal(7, @pub.drink_stock)
  end

  def test_add_food_to_pub
    mac_n_cheese = Food.new("Mac & Cheese", 3, 5)
    @pub.add_food(mac_n_cheese)
    assert_equal(5, @pub.food_stock)
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
    assert_equal(5, @pub.drink_stock)
  end

    def test_customer_buys_food_pub_gets_money_and_loses_food
      @pub.food_bought(@burger)
      @customer1.buy_food(@burger)
      assert_equal(6, @pub.till)
      assert_equal(94, @customer1.wallet)
      assert_equal(3, @pub.food_stock)
    end

  def test_transaction_customer_gains_drink
    @pub.drink_transaction(@customer1, @beer)
    assert_equal(1, @customer1.drink_count)
  end

  def test_transaction_customer_gains_food
    @pub.food_transaction(@customer1, @sunday_roast)
    assert_equal(1, @customer1.food_count)
  end

  def test_customer_is_underage
 #not required to check age, just a nice personal touch to check no beer was sold anyway
    child = Customer.new("Billy", 5, 16)
    sale = @pub.drink_transaction(child, @beer)
    assert_equal(6, @pub.drink_stock)
    assert_equal("Soft drinks only!", sale)
  end

  def test_customer_is_smashed
    blotto = Customer.new("Frank", 100, 56)
    blotto.buy_drink(@beer)
    blotto.buy_drink(@beer)
    blotto.buy_drink(@beer)
    blotto.buy_drink(@beer)
    sale = @pub.drink_transaction(blotto, @beer)
    assert_equal("I'm cutting you off for a bit Frank", sale)
  end

  def test_customer_is_sober

    frank = Customer.new("Frank", 1000, 56)
    frank.buy_drink(@beer)
    frank.buy_drink(@beer)
    @pub.drink_transaction(frank, @beer)
    assert_equal(3, frank.drink_count)
  end

  def test_customer_has_food_and_drink_under_the_drunk_limit
    @customer1.buy_drink(@beer1)
    @customer1.buy_drink(@beer2)
    @customer1.buy_food(@sunday_roast)
    @pub.drink_transaction(@customer1, @beer)
    assert_equal(10, @customer1.drunkenness)
    #need to remember if under the limit the drink will still be sold to them!
  end

end #Class end
