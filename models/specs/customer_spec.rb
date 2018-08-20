require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../film')

class CustomerTest < Minitest::Test


  def setup
    @customer1 = Customer.new({
      "name" => "Anthony",
      "funds" => ("200").to_i
      })
    @film1 = Film.new({
      "title" => "Gravity",
      "price" => ("15").to_i
      })
    @film2 = Film.new({
      "title" => "Hobbit",
      "price" => ("15").to_i
      })
  end

  def test_customer_has_funds
   assert_equal(200, @customer1.funds)
  end

  def test_can_buy_ticket()
    @customer1.buy_ticket(@film1)
    assert_equal(185, @customer1.funds)
  end






 end
