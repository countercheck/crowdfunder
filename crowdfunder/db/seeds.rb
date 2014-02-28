# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

100.times do
  Campaign.create(
    title: Faker::Company.name,
    description: "#{Faker::Company.bs}",
    target_in_cents: rand(10000),
    start_date: DateTime.now + 11,
    end_date: DateTime.now + 13,
    user_id: 1
  )

  3.times do
  	Breakpoint.create(
  		title: "#{Faker::Company.bs}",
  		description: "breakpoint reward",
  		estimated_delivery: DateTime.now + 80,
  		value_in_cents: rand(5000),
  		number_available: rand(100),
  		campaign_id: Campaign.last.id
  		)

  end
end



