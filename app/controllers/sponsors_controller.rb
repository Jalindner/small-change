class SponsorsController < ApplicationController

  def new
    if recycler_session || charity_session || sponsor_session
      flash[:notice] = 'You are already signed in'
      redirect_to '/'
    end
  end

  def show
    @sponsor = Sponsor.find(params[:id])
  end


  def sign_up
    @sponsor = Sponsor.new(logo_params)

    if !@sponsor.logo_file_name
      @sponsor.logo: File.new("#{Rails.root}/public/default-logo.jpeg")
    end

    if @sponsor.save
      redirect_to @sponsor
    end
  end

  def signin
     if recycler_session || charity_session || sponsor_session
      flash[:notice] = 'You are already signed in'
      redirect_to '/'
    end
  end
  private
  def logo_params
    params.require(:sponsor).permit(:logo)
  end




end
