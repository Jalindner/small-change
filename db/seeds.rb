# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Draft A
# Material.destroy_all
# Material.create(name: 'plastic', price_per_weight: 0.02)
# Material.create(name: 'aluminum', price_per_weight: 0.05)
# Material.create(name: 'glass', price_per_weight: 0.03)
# Material.create(name: 'cardboard', price_per_weight: 0.01)
# Material.create(name: 'paper', price_per_weight: 0.01)


rob = Recycler.create(first_name: "Rob", last_name: "Dale", email: "robzd1@gmail.com", password: 'password')
ver = Recycler.create(first_name: "Veronica", last_name: "Agurto", email: "Veronica@veronica.com", password: 'password')
wholefoods = Sponsor.create(name: "Whole Foods", email: "info@wholefoods.com", password: 'password')
redcross = Charity.create(name: "American Red Cross", email: "info@redcross.org", password: 'password')

bigGrant = Grant.create(sponsor_id: wholefoods.id, amount: 500)


sub1 = Submission.create(recycler_id: rob.id )
SubmissionGroup.create(submission_id: 1, material: "aluminum", weight: 5.0)
SubmissionGroup.create(submission_id: 1, material: "paper", weight: 2.0)

sub2 = Submission.create(recycler_id: rob.id )

SubmissionGroup.create(submission_id: sub2.id, material: "HDPE", weight: 4.0)
SubmissionGroup.create(submission_id: sub2.id, material: "PET", weight: 3.0)
