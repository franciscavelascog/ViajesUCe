# frozen_string_literal: true

# Comments Controller
class CommentsController < ApplicationController
  before_action :find_publication
  before_action :find_comment, only: %i[destroy edit update comment_owner]
  before_action :comment_owner, only: %i[destroy edit update]

  def create
    @comment = @publication.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to publication_path(@publication)
    else
      render 'new'

    end
  end

  def destroy
    @comment.destroy
    redirect_to publication_path(@publication)
  end

  def edit; end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to publication_path(@publication)
    else
      puts 'doesnt save '
      render 'edit'

    end
  end

  private

  def find_publication
    @publication = Publication.find(params[:publication_id])
  end

  def find_comment
    @comment = @publication.comments.find(params[:id])
  end

  def comment_owner
    return if current_user.id == @comment.user.id

    flash[:notice] = 'No puedes modificar un comentario ajeno'
    redirect_to @publication
  end
end
