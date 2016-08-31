# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.delete_all
List.delete_all
items = (1..10).to_a.map { |n|
  [n, Item.create(label: "Item #{n}") ]}

list = List.create(header: "My ordered list")

items.each do | n, i|
  list.add(i)
end
