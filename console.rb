require('pry-byebug')
require_relative('./models/pet_shop.rb')
require_relative('./models/pets.rb')


shop = Shop.new( { 'name' => 'Percys Pet Emporium'})
shop.save

pet1 = Pet.new( { 'name' => 'Splash', 'type' => 'Goldfish', 'shop_id' => shop.id })
pet2 = Pet.new( { 'name' => 'Snappy', 'type' => 'Alligator', 'shop_id' => shop.id})
pet3 = Pet.new( { 'name' => 'Fluffy', 'type' => 'Kitten', 'shop_id' => shop.id})
pet4 = Pet.new( { 'name' => 'Roofus', 'type' => 'dog', 'shop_id' => shop.id})
# pet1.save
# pet2.save
# pet3.save
# pet4.save


binding.pry
nil

