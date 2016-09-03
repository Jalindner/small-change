module CharityHelper
  def resource_name
    :charity
  end

  def resource
    @resource ||=Charity.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:charity]
  end

end
