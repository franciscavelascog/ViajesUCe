# frozen_string_literal: true

# Reseñas Controller
class ResenasController < ApplicationController
  before_action :find_user
  before_action :find_resena, only: %i[destroy edit update resena_owner]
  before_action :resena_owner, only: %i[destroy edit update]

  def new
    # print("aca")
    @resena = @user.resenas.build
    @resena.user_id = current_user.id
  end

  def create
    @resena = @user.resenas.build(params[:resena].permit(:puntualidad, :seguridad, :comentario, :calif))
    # @comment.user_id = current_user.id
    @resena.save

    if @resena.save
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Verifica los datos ingresados'
      puts 'doesnt save'
      render 'new'

    end
  end

  def show
    @resena = Resena.find(params[:id])
    # @comments = Comment.where(publication_id: @publication).order("created_at DESC")
  end

  def destroy
    @resena.destroy
    redirect_to user_path(@user)
  end

  def edit
    @resena = Resena.find(params[:id])
  end

  def index
    @resenas = Resena.all
  end

  def update
    if @resena.update(params[:resena].permit(:puntualidad, :seguridad, :comentario, :calif))
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Vuelve a intentarlo'
      render 'edit'
    end
  end

  def delete
    @resena = Resena.find(params[:id])
    @resena.destroy
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_resena
    @resena = @user.resenas.find(params[:id])
  end

  def resena_owner
    return if current_user.id != @resena.user.id

    flash[:notice] = 'No puedes modificar un comentario ajeno'
    redirect_to @user
  end
end
