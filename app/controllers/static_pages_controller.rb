# frozen_string_literal: true

# Controlador de páginas estáticas
class StaticPagesController < ApplicationController
  def home
    redirect_to new_user_session_path unless user_signed_in?
  end

  def help; end

  def about; end

  def contact; end
end
