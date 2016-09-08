require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

############## recyclers/submissions/votes
rob = Recycler.create(first_name: "Rob", last_name: "Dale", email: "robzd1@gmail.com", password: 'password')
ver = Recycler.create(first_name: "Veronica", last_name: "Agurto", email: "Veronica@veronica.com", password: 'password')

100.times do
  Recycler.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password')
end

materials = ["plastic drink bottle", "plastic food container", "laundry detergent bottle", "gallon milk jug", "aluminum beverage can", "tin or steel food can", "glass jar or bottle", "large glass bottle", "newspaper", "magazine", "junk mail", "small stack of office paper", "cardboard box", "telephone book", "paper bag", "cereal box", "paper towel roll", "batteries"]

100.times do
  newsub = Submission.create(recycler_id: rand(1..100), image: File.new("#{Rails.root}/public/happy-earth.jpg"))

  rand(1..4).times do
  SubmissionGroup.create(submission_id: newsub.id, material: materials[rand(0..materials.length)], weight: rand(1..3).to_f)
  end
end

200.times do
  submission = Submission.find(rand(1..100))
  submission.upvote_by Recycler.find(rand(1..100))
end





##############

############## sponsors/grants
starbucks = Sponsor.create(name: "Starbucks", email: "info@starbucks.com", password: 'password', logo: File.new("#{Rails.root}/public/starbucks.jpeg"))
petsmart = Sponsor.create(name: "Petsmart", email: "info@petsmart.com", password: 'password')

dob = Recycler.create(first_name: "Dob", last_name: "Rale", email: "dob@dob.dob", password: 'password')
aer = Recycler.create(first_name: "Aeronica", last_name: "Vgurto", email: "aer@aer.aer", password: 'password')

wholefoods = Sponsor.create(name: "Whole Foods", email: "info@wholefoods.com", password: 'password')

wfGrant = Grant.create(sponsor_id: wholefoods.id, amount: 500, original_amount: 500)
psGrant = Grant.create(sponsor_id: petsmart.id, amount: 350)
sbGrant = Grant.create(sponsor_id: starbucks.id, amount: 650)

##############


############## charities/donations
acs = Charity.create(name: "The American Cancer Society", email: "info@cancer.org", password: 'password')
unitedway = Charity.create(name: "The United Way", email: "info@unitedway.org", password: 'password')
redcross = Charity.create(name: "American Red Cross", email: "info@redcross.org", password: 'password')

20.times do
  Donation.create(recycler_id: rand(1..100), charity_id: rand(1..3), amount: rand(1..15).to_f)
end
##############


##############Materials

MaterialObject.destroy_all
material_categories =
{ plastic: {'plastic drink bottle' => 0.2,
  'plastic food container' => 0.2,
  'laundry detergent bottle' => 0.3,
  'gallon milk jug' => 0.4},

  metal: {'aluminum beverage can' => 0.2,
  'tin or steel food can' => 0.1},

  glass: {'glass jar or bottle' => 0.1,
  'large glass bottle' => 0.3},

  paper: {'newspaper' => 0.2,
  'magazine' => 0.2,
  'junk mail' => 0.1,
  'small stack of office paper' => 0.1,
  'cardboard box' => 0.3,
  'telephone book' => 0.5,
  'paper bag' => 0.1,
  'cereal box' => 0.2,
  'paper towel roll' => 0.1} }

material_categories.keys.each do |mat_cat|
  material_sub_cats = material_categories[mat_cat]
  material_sub_cats.keys.each do |mat_sub_cat|

  MaterialObject.create(category: mat_cat, subcategory: mat_sub_cat, price: material_sub_cats[mat_sub_cat])
  end
end


##############
