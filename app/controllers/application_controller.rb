# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    if user.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username firstname lastname])
  end

  def rescue_with_resource_not_found
    render plain: "Object with id: #{params[:id]} was not found"
  end
end
