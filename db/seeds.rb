# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def create_user(n)
  start = 0
  n.times do
    u = User.new
    u.username = "foo#{start}"
    u.email = "foo#{start}@bar.com"
    start += 1
    u.save!
  end
end

create_user(10)