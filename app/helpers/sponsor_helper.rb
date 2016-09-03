module SponsorHelper
  def resource_name
    :sponsor
  end

  def resource
    @resource ||=Sponsor.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:sponsor]
  end

end
