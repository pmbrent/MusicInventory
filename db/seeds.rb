# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..5).to_a.each do |i|
  User.create!(email: "ilovecats#{i}@cats.com", password: "ilovecats#{i}")
  Band.create!(name: "The #{i}-Cat Band")
  3.times do |j|
    live = ((i+j) % 3 == 0)
    Album.create!(band_id: i, title: "Band #{i}'s Album #{j}", live: live)
    2.times do |m|
      bonus = (j % 2 != 0)
      Track.create!(album_id: ((3*i-1)+j), bonus: bonus,
        title: "#{i},#{j},#{m} cats!")
    end
  end
end
