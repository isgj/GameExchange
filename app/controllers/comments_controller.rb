class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def my_action
    respond_to do |format|
      format.js { render :js => "star_rating();" }
    end
  end

  def index
    @comments = Comment.where("commented_id=?",params[:gamer_id])
  end

  def show

    @comment = Comment.where("commented_id = ? AND commentator_id = ?",params[:gamer_id],current_user).reduce
    if(@comment.blank?)
      redirect_to gamer_path(params[:gamer_id]), notice: 'You haven\'t commented this user.'
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.commented_id = params[:gamer_id]
    @comment.commentator_id = current_user.id

    if @comment.save
      redirect_to gamer_comments_path, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to gamer_path(params[:gamer_id]), notice: 'Comment was successfully updated.'
    else
      render :edit, alert: 'Errore editing comment.'
    end
  end

def destroy
    @comment.destroy
    redirect_to gamer_path(params[:gamer_id]), notice: 'Comment was successfully destroyed.'
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:mark, :review)
    end
end
