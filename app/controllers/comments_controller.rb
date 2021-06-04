class CommentsController < ApplicationController

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def new
    @comment = Comment.new(painting_id: params[:painting_id], user_id: session[:user_id])
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to painting_comment_path(@comment.painting, @comment)
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to painting_comment_path(@comment.painting, @comment)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    painting = @comment.painting
    if @comment.user == current_user
      @comment.destroy
    end
    redirect_to painting_path(painting)
  end

  private

    def comment_params
      params.require(:comment).permit(:message, :user_id, :painting_id)
    end
end
