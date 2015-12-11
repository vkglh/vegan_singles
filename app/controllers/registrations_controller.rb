class RegistrationsController < Devise::RegistrationsController

before_filter :configure_permitted_parameters

  protected
  
  def after_update_path_for(resource)
      "/profile/#{current_user.id}"
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:avatar, :avatar_cache, :remove_avatar, 
        :name, :city, :bio, :date_of_birth, :gender, 
        :looking_for_male, :looking_for_female, :looking_for_genderfluid, :looking_for_nonbinary, 
        :skype, :instagram, :facebook, :twitter, )
    end
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
