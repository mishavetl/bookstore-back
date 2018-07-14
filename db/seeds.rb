# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Book.delete_all

category_titles = [
  {en: 'Sci-fi', ru: 'Научно-популярное'},
  {en: 'Sci-fi', ru: 'Научно-популярное'},
]

categories = category_titles.map do |title|
  Category.create(title_en: title[:en], title_ru: title[:ru])
end

photos = Dir.children __dir__ + '/../public/img/'
photos.each do |photo|
  category = categories.sample
  price = Faker::Number.decimal 2, 2
  category.books.create(title: Faker::Book.title, photo: photo, price: price)
end