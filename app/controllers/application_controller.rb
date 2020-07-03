class ApplicationController < ActionController::Base
  before_action :set_locale

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : {lang: I18n.locale}
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end

  # use devise helper
  def after_sign_in_path_for(resource)
    flash[:info] = t('.after_sign_in_hello', name: current_user.name)
    if resource.admin?
      admin_tests_path
    else
      super
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
