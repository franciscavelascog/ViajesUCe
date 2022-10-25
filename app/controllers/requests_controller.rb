# frozen_string_literal: true

# Requests Controller
class RequestsController < ApplicationController
  def create
    @request = current_user.requests.new(request_params)
    flash[:notice] = 'No se pudo crear la solicitud' unless @request.save
    redirect_to @request.publication
  end

  def destroy
    @request = current_user.requests.find(params[:id])
    @publication = request.publication
    @request.destroy
    redirect_to @publication
  end

  private

  def request_params
    params.require(:request).permit(:publication_id)
  end
end
