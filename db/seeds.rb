# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

breakfast = Category.create(name: 'breakfast', title: 'Breakfast')
Category.create(name: 'lunch', title: 'Lunch')
Category.create(name: 'dinner', title: 'Dinner')
Category.create(name: 'snacks', title: 'Snacks')
Category.create(name: 'drinks', title: 'Drinks')
Category.create(name: 'desserts', title: 'Desserts')

breakfast.dishes.create(name: 'banh-mi-chao-op-la', title: 'Bánh mì chảo ốp la')
breakfast.dishes.create(name: 'com-tam-suon', title: 'Cơm tấm sườn')
breakfast.dishes.create(name: 'banh-mi-thit-nguoi', title: 'Bánh mì thịt nguội')
