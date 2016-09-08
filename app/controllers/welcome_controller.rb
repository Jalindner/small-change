class WelcomeController < ApplicationController

  def index
  end

  def intro
    @highest_grant = find_highest_grant
    @highest_granting_sponsor = @highest_grant.sponsor
  end

  def whywevote
  end
  private

  def find_highest_grant
    grants = Grant.all.order(amount: :desc)
    return grants.first
  end
end
