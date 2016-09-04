class PaymentsController < ApplicationController
  def process_payments
    Submission.all.each do |sub|
      # if sub.votes
      puts "Processing submission ##{sub.id}"

      random_grant = Grant.find(rand(1..Grant.count))
      total = 0.00

      sub.submission_groups.each do |subm_group|
        subm_group.quantity.times do
          total += 0.01
        end
      end
      puts "about to create a payment with submission_id: #{sub.id}, grant_id: #{random_grant.id}, and amount: #{total}"

      payment = Payment.new(
        submission_id: sub.id,
        grant_id: random_grant.id,
        amount: total
        )

      if payment.save
        puts "Payment saved!"
      else
        puts "Payment not saved!"
        puts payment.errors.full_messages
      end

      random_grant.amount -= total
      random_grant.save
    # end
    end
    Submission.delete_all
  end
end
