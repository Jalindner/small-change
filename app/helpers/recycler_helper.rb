module RecyclerHelper
  def resource_name
    :recycler
  end

  def resource
    @resource ||=Recycler.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:recycler]
  end

end
