require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require( 'pry-byebug' )

# Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()


customer1 = Customer.new({
  'name' => 'Anthony',
  'funds' => '20',
  })

customer2 = Customer.new({
  'name' => 'Brooks',
  'funds' => '30',
  })

customer3 = Customer.new({
  'name' => 'Kyle',
  'funds' => '40',
  })

customer1.save()
customer2.save()
customer3.save()

binding.pry
nil
