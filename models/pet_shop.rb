require('pg')
require_relative('../db/sql_runner.rb')

class Shop

  attr_reader(:id, :name)

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def self.find(id)
    sql = "SELECT * FROM shop WHERE id = #{id};"
    shop = SqlRunner.run(sql).first
    return Artist.new(shop)
  end

  def save
    sql = "INSERT INTO shop (name) VALUES ('#{@name}') RETURNING *;"
    shop = SqlRunner.run(sql).first
    @id = shop['id'].to_i
  end

  def pets
    sql = "SELECT * FROM pets WHERE (#{@shop_id}) = id;"
    pets = SqlRunner.run(sql)
    return pets.map { |pet| Pet.new(pet) }
    # return pets
  end
end