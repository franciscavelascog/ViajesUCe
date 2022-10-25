# frozen_string_literal: true

# Controlador de usuarios
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_publications = @user.publications
    @resenas = Resena.where(user_id: @user).order('created_at DESC')
  end

  def new
    @user = User.new.users.build
  end

  def create
    @user = User.new.users.build(user_params)
    if @user.save
      @user.images.attach(params[:images])
      redirect_to users_path
    else
      redirect_to new_registration_path(resource_name),
                  notice: 'Hubo un error creando la sesión. Recuerda revisar que el mail sea válido,
                  la contraseña este correctamente confirmada
                  y tu nombre y nombre de usuario no se encuentren en blanco. '

    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # cuenta_params = params.require(:cuentum).permit(:admin, :name)
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.images.attach(params[:images])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy if @user.admin == false
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :email, :work, :age, :admin, images: [])
  end
end
