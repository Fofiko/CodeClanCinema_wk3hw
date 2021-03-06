require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
# Screening.delete_all


customer1 = Customer.new({
  'name' => 'Anthony',
  'funds' => '100'
  })

customer2 = Customer.new({
  'name' => 'Brooks',
  'funds' => '50'
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

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film3.id
  })

ticket4 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()


screening1 = Screening.new({ "show_time" => "18:00", "capacity" => "20", "film_id" => film1.id })

 screening2 = Screening.new({ "show_time" => "19:30", "capacity" => "30", "film_id" => film2.id })

 screening3 = Screening.new({ "show_time" => "20:45", "capacity" => "40", "film_id" => film3.id })


 screening1.save
 screening2.save
 screening3.save



binding.pry
nil
