# frozen_string_literal: true

# Controlador de publicaciones
class PublicationsController < ApplicationController
  def index
    # @publications = Publication.all
    @publications = Publication.search(params[:search])
  end

  def show
    @publication = Publication.find(params[:id])
    @comments = Comment.where(publication_id: @publication).order('created_at DESC')
    @solicituds = Solicitud.where(publication_id: @publication.id)
  end

  def new
    # print("aca")
    @publication = current_user.publications.build
    @publication.user_id = current_user.id
  end

  def create
    @publication = current_user.publications.build(publication_params)
    if @publication.save
      puts('aca')
      redirect_to publications_path
    else
      redirect_to publications_new_path,
                  notice: 'Hubo un error creando la publicación. Recuerda revisar que el título
        tenga más de 5 caracteres y que el punto de partida y el punto de llegada no se encuentren en blanco. '
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to publications_path
    else
      redirect_to edit_publication_path(@publication),
                  notice: 'Hubo un error editando la publicación. Recuerda revisar que el título
        tenga más de 5 caracteres y que el punto de partida y el punto de llegada no se encuentren en blanco. '
    end
  end

  def delete
    @publication = Publication.find(params[:id])
    @publication.destroy
    redirect_to publications_path
  end

  def owner_publications
    @user = User.find(params[:user_id])
  end

  private

  def publication_params
    params.require(:publication).permit(:titulo, :punto_partida, :comuna_partida, :punto_llegada, :comuna_llegada,
                                        :fecha, :hora, :cupos, :radio, :search)
  end
end
