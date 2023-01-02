# frozen_string_literal: true

class CommentsController < ApplicationController
  # http_basic_authenticate_with name: 'user', password: 'secret', only: :destroy

  # Create a comment
  def create
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.comments.create(comment_params)
    redirect_to menu_path(@menu)
  end

  # Destroy a comment
  def destroy
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.comments.find(params[:id])
    @comment.destroy
    redirect_to menu_path(@menu), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
