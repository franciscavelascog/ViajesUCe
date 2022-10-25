# frozen_string_literal: true

# Controlador de solicitudes de viajes
class SolicitudsController < ApplicationController
  before_action :find_publications
  def create
    @solicitud = current_user.solicituds.new(solicitud_params)
    @solicitud.status = 'pending'
    flash[:notice] = 'No se pudo crear la solicitud' unless @solicitud.save
    redirect_to @solicitud.publication
  end

  def destroy
    @solicitud = current_user.solicituds.find(params[:id])
    @publication = solicitud.publication
    @solicitud.destroy
    redirect_to @publication
  end

  def index
    @solicituds = Solicitud.where(publication_id: @publicaciones_propias.ids)
    @users = User.all
    @publications = Publication.all
  end

  def approve
    @solicitud = Solicitud.find(params[:id])
    @solicitud.status = 'approved'
    flash[:notice] = 'No se pudo crear la solicitud' unless @solicitud.save
    redirect_to @solicitud.publication
  end

  def reject
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy
    redirect_to publications_path
    flash[:notice] = 'Has rechazado la solicitud'
  end

  private

  def solicitud_params
    params.require(:solicitud).permit(:publication_id)
  end

  def find_publications
    @publicaciones_propias = Publication.where(user_id: current_user.id)
  end
end
