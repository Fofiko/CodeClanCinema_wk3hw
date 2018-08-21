require_relative("../db/sql_runner")

class Screening
  attr_reader :id
  attr_accessor :time, :capacity

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @time = info['time']
    @capacity = info['capacity']
  end

  def save()
    sql = "INSERT INTO screenings (time, capacity) VALUES ($1, $2) RETURNING id"
    values = [@time, @capacity]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET (time, capacity) = ($1, $2) WHERE id = $3"
    values = [@time, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM screenings where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screening_data = SqlRunner.run(sql)
    return Screening.map_items(screening_data)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|screening| Screening.new(screening)}
    return result
  end

end
