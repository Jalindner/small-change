# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rob = Recycler.create(first_name: "Rob", last_name: "Dale", email: "robzd1@gmail.com", password: 'password')
ver = Recycler.create(first_name: "Veronica", last_name: "Agurto", email: "Veronica@veronica.com", password: 'password')
dob = Recycler.create(first_name: "Dob", last_name: "Rale", email: "dob@dob.dob", password: 'password')
aer = Recycler.create(first_name: "Aeronica", last_name: "Vgurto", email: "aer@aer.aer", password: 'password')
wholefoods = Sponsor.create(name: "Whole Foods", email: "info@wholefoods.com", password: 'password')
redcross = Charity.create(name: "American Red Cross", email: "info@redcross.org", password: 'password')

bigGrant = Grant.create(sponsor_id: wholefoods.id, amount: 500)

don1 = Donation.create(recycler_id: rob.id, charity_id: redcross.id, amount: 5.0)
don2 = Donation.create(recycler_id: ver.id, charity_id: redcross.id, amount: 14.0)
