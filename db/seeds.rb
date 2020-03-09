# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Product.destroy_all
Album.destroy_all

test_user = User.new( email:'beta_br@gmail.com', password:'123456')
test_user.save    

Album.create(
    title:'pantalona',
    user: test_user,
    description: 'Mi primer album'
)
Category.create(
    name:'inspiraciones'
)

Product.create(
    name:'pantalones',
    description:'fleyer',
    user: test_user 
)

Album.first.products << Product.first
