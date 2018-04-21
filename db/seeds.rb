# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
System::Models::ApiKey.create(key: "0e1354adf510ad53beb5d3c513f14d96e8fe12fed86731101752ac74bbd6d052", is_master_key: true)
Apiv2::Realm.create(id: 1,name: "Oneminorder",email: "viktor.tassi@oneminorder.com",description:"")