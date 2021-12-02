class ApplicationController < ActionController::Base
  # THIS IS INCOMPLETE, FINISH THIS LATER AS WE NEED TO MAKE A FORM DIFFERENT DEPENDING ON THE USER TYPE!
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %I[name phone_number gender location avatar user_type])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %I[name phone_number gender location avatar user_type])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end
