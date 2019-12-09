# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Conferenceroom.create!(conferenceroomname: '会議室1',people: '2',price: '2000', start_date:  '2000-01-01 09:00:00', end_date: '2000-01-01 10:00:00', remarks: 'test', facility_id: '1')