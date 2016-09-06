class PaymentsController < ApplicationController

  def process_all_payments
    Submission.all.each do |sub|
      process_payment(sub)
    end
  end

  def process_payment
    if current_recycler && current_recycler.id ==1
      puts "looking for a submission with id #{params[:submission_id]}"

      sub = Submission.find(params[:submission_id])
      puts "found? #{sub}"
      puts "this submission is #{sub.id}, and it has #{sub.get_upvotes.size} upvotes"

      if sub.get_upvotes.size > sub.get_downvotes.size && sub.get_upvotes.size >=3
        puts "Processing submission ##{sub.id}, made by #{sub.recycler} on #{sub.created_at}"


        total = 0.00

        sub.submission_groups.each do |subm_group|
          total += (0.01 * subm_group.weight)
        end

        eligible_grants = Grant.where("amount >= #{total}")

        if eligible_grants
          random_grant = Grant.find(rand(1..Grant.count))


          puts "About to create a payment with submission_id: #{sub.id}, grant_id: #{random_grant.id}, and amount: #{total}"

          payment = Payment.new(
            submission_id: sub.id,
            grant_id: random_grant.id,
            amount: total
            )

          # new_transaction = Braintree::Transaction.sale(
          # amount: params[:amount],
          # payment_method_nonce: params['client-nonce'],
          # options: {submit_for_settlement: true}
          # )

          if payment.save
            puts "Payment saved!"
          else
            puts "Payment not saved!"
            puts payment.errors.full_messages
          end

          random_grant.amount -= total
          random_grant.save
          puts "Grant reduced to #{random_grant.amount}."
          puts "Changing the status on the original submission"
          sub.status = "Paid"
          sub.save
          redirect_to "/submissions/#{sub.id}"
        else
          puts "Error: not enough votes or vote count too low."
          # sub.status = "Rejected"
        end # end of if sub.votes
      else
        puts "Error: no grants are large enough to draw this payment from."
      end # end of if eligible grants
    end # end of if current_recycler
  end #end of process_payment
end #end of class
