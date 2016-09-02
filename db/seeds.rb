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

Submission.destroy_all
SubmissionGroup.destroy_all
Submission.create(recycler_id:1)
SubmissionGroup.create(submission_id: 1, material: 'aluminum', quantity: 3)
SubmissionGroup.create(submission_id: 1, material: 'glass', quantity: 2)
