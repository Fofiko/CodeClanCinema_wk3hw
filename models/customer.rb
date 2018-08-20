require_relative("../db/sql_runner")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
    @funds = info['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
          INNER JOIN tickets
          ON films.id = tickets.film_id
          WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = Film.map_items(films)
    return result
  end

# Buying tickets should decrease the funds of the customer by the price
  def buy_ticket(film)
     @funds -= film.price
     update
  end

  def number_of_tickets_bought()
    return films().count
  end

# Check how many tickets were bought by a customer
  def count_tickets()
    sql = "SELECT tickets.* FROM tickets
          INNER JOIN customers
          ON tickets.customer_id = customers.id
          WHERE customers.id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    number_of_tickets = tickets.count
    return number_of_tickets
   end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_data = SqlRunner.run(sql)
    return Customer.map_items(customer_data)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|customer| Customer.new(customer)}
    return result
  end


end
