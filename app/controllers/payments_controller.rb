class PaymentsController < ApplicationController
  def process_all_payments
    Submission.all.each do |sub|
      process_payment(sub)
    end
  end

  def process_payment
    sub = Submission.find(params[:submission_id])
    # if sub.votes
    puts "Processing submission ##{sub.id}, made by #{sub.recycler} on #{sub.created_at}"

    random_grant = Grant.find(rand(1..Grant.count))
    total = 0.00

    sub.submission_groups.each do |subm_group|
      subm_group.quantity.times do
        total += 0.01
      end
    end
    puts "About to create a payment with submission_id: #{sub.id}, grant_id: #{random_grant.id}, and amount: #{total}"

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
    puts "Grant reduced to #{random_grant.amount}."
    puts "Destroying the original submission"
    sub.destroy
    # end # end of if sub.votes
  end #end of process_payment
end #end of class
