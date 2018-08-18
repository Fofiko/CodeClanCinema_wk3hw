require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()
# Ticket.delete_all()


customer1 = Customer.new({
  'name' => 'Anthony',
  'funds' => '20'
  })

customer2 = Customer.new({
  'name' => 'Brooks',
  'funds' => '30'
  })

customer3 = Customer.new({
  'name' => 'Kyle',
  'funds' => '40'
  })

customer1.save()
customer2.save()
customer3.save()


film1 = Film.new({
  'title' => 'Gravity',
  'price' => '15'
  })

film2 = Film.new({
  'title' => 'Die Hard',
  'price' => '10'
  })

film3 = Film.new({
  'title' => 'Mary Poppins',
  'price' => '12'
  })

film1.save()
film2.save()
film3.save()





binding.pry
nil
