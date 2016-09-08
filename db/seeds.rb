# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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

############## recyclers/submissions/votes

require 'faker'

materials = [
  "plastic drink bottle",
  "plastic food container",
"laundry detergent bottle",
"gallon milk jug",
"aluminum beverage can",
"tin or steel food can",
"glass jar or bottle",
"large glass bottle",
"newspaper",
"magazine",
"junk mail",
"small stack of office paper",
"cardboard box",
"telephone book",
"paper bag",
"cereal box",
"paper towel roll",
"batteries"]

20.times do
  Recycler.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password')
end

rob = Recycler.create(first_name: "Rob", last_name: "Dale", email: "robzd1@gmail.com", password: 'password')
ver = Recycler.create(first_name: "Veronica", last_name: "Agurto", email: "Veronica@veronica.com", password: 'password')

# account for our demo
bob = Recycler.create(first_name: "Joe", last_name: "Demo", email: "demo@aol.com", password: 'dbcdbc')

newsub = Submission.create(recycler_id: bob.id, image: File.new("#{Rails.root}/public/recycling_pics/IMAG0349.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)

############ recyclers / submissions / votes




newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0346.jpg"))
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0347.jpg"))
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0348.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0349.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0350.jpg"))
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0351.jpg"))
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0352.jpg"))
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0353.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0354.jpg"))
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0355.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#junk mail
SubmissionGroup.create(submission_id: newsub.id, material: materials[10], weight: 0.1)




newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0356.jpg"))
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#junk mail
SubmissionGroup.create(submission_id: newsub.id, material: materials[10], weight: 0.1)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0357.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0358.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0359.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0360.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0361.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0362.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0363.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0364.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0365.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0366.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0367.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0368.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0369.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0370.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#plastic food container
SubmissionGroup.create(submission_id: newsub.id, material: materials[1], weight: 0.5)
#glass jar or bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[6], weight: 1.1)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)
#small stack of office paper
SubmissionGroup.create(submission_id: newsub.id, material: materials[11], weight: 0.3)
#newspaper
SubmissionGroup.create(submission_id: newsub.id, material: materials[8], weight: 0.1)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0371.jpg"))
#can
SubmissionGroup.create(submission_id: newsub.id, material: materials[4], weight: 0.5)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0372.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)


newsub = Submission.create(recycler_id: rand(1..22), image: File.new("#{Rails.root}/public/recycling_pics/IMAG0373.jpg"))
#plastic drink bottle
SubmissionGroup.create(submission_id: newsub.id, material: materials[0], weight: 0.5)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)
#cereal box
SubmissionGroup.create(submission_id: newsub.id, material: materials[15], weight: 0.4)



35.times do
  submission = Submission.find(rand(1..28))
  submission.upvote_by Recycler.find(rand(1..22))
end





############## sponsors/grants
starbucks = Sponsor.create(name: "Starbucks", email: "info@starbucks.com", password: 'password', logo: File.new("#{Rails.root}/public/starbucks.jpeg"))
petsmart = Sponsor.create(name: "Petsmart", email: "info@petsmart.com", password: 'password')

wholefoods = Sponsor.create(name: "Whole Foods", email: "info@wholefoods.com", password: 'password')

wfGrant = Grant.create(sponsor_id: wholefoods.id, amount: 500, original_amount: 500)
psGrant = Grant.create(sponsor_id: petsmart.id, amount: 350)
sbGrant = Grant.create(sponsor_id: starbucks.id, amount: 650)

##############


############## charities/donations
acs = Charity.create(name: "The American Cancer Society", email: "info@cancer.org", password: 'password')
unitedway = Charity.create(name: "The United Way", email: "info@unitedway.org", password: 'password')
redcross = Charity.create(name: "American Red Cross", email: "info@redcross.org", password: 'password')

5.times do
  Donation.create(recycler_id: rand(1..22), charity_id: rand(1..3), amount: rand(1..15).to_f)
end
##############

