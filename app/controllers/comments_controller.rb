class CommentsController < ApplicationController

  def index 
    difference = Difference.where(user_id: session[:user_id])
    d_id = difference.pluck(:id)
    @comments = Comment.where(difference_id: d_id).includes(:user)
    @graph = difference.pluck(:total)
    binding.pry
    @comment = Comment.new
    
  end

  def new
  end

  def create
    @comment.create(params_comment)
    link_to comments_path
  end

  def delete
    @comment.delete
    link_to comments_path
  end

  private
  def params_comment
    params.require(:comment).permit(:comment).merge(user_id: session[:user_id], difference_id: @graph.id)
  end

end
