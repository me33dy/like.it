# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Company.destroy_all
ProductPromotion.destroy_all
Company.create(name: 'company01', email: 'company01@company.com', password:'password', password_confirmation: 'password')
Company.create(name: 'company02', email: 'company02@company.com', password:'password', password_confirmation: 'password')

Company.first.products.create(name: '01com01', requirement: 10, reward: 'shit01')
Company.first.products.create(name: '01com02', requirement: 100, reward: 'shit02')
Company.first.products.create(name: '01com03', requirement: 200, reward: 'shit03')
Company.first.products.create(name: '01com04', requirement: 300, reward: 'shit04')

Company.last.products.create(name: '02com01', requirement: 50, reward: 'crap01')
Company.last.products.create(name: '02com02', requirement: 150, reward: 'crap02')
Company.last.products.create(name: '02com03', requirement: 250, reward: 'crap03')

ProductPromotion.create(promoter_id: User.first.id, promoting_product_id: Company.first.products.first.id)
ProductPromotion.create(promoter_id: User.first.id, promoting_product_id: Company.first.products.last.id)
ProductPromotion.create(promoter_id: User.first.id, promoting_product_id: Company.last.products.first.id)









