require('pg')
require_relative('../db/sql_runner')

class Pet

  attr_reader( :name, :type, :id, :shop_id )

  def initialize (options)
    @name = options['name']
    @type = options['type']
    @id = options['id'].to_i
    @shop_id = options['shop_id'].to_i
  end

  def save
    sql = "INSERT INTO pet (name, type, shop_id) VALUES ('#{@name}', '#{@type}', '#{@shop_id}') RETURNING *;"
    pet = SqlRunner.run(sql).firstss
    @id = pet['id'].to_i
  end

  def shop
    sql = "SELECT name FROM shop WHERE shop_id = (#{id});"
    shop = SqlRunner.run(sql).first
    return shop
  end

end