# frozen_string_literal: true

# Controlador principal de la aplicación
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :age, :work, :admin, { images: [] }]) # , images:[]
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :age, :work, :admin, { images: [] }])
  end

  def hello
    render html: 'Hello, World!'
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
