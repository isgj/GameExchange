class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json

  def my_action
    respond_to do |format|
      format.js { render :js => "star_rating();" }
    end
  end

  def index
    @comments = Comment.where("commented_id=?",params[:gamer_id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show

    @comment = Comment.where("commented_id = ? AND commentator_id = ?",params[:gamer_id],current_user).reduce
    if(@comment.empty?)
      redirect_to gamer_path(params[:gamer_id]), notice: 'You haven\'t commented this user.'
    end
  end

  # GET /comments/new
  #new works fine
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  #create works fine
  def create
    @comment = Comment.new(comment_params)
    @comment.commented_id = params[:gamer_id]
    @comment.commentator_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to gamer_comments_path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to gamer_path(params[:gamer_id]), notice: 'Comment was successfully updated.'
    else
      render :edit, alert: 'Errore editing comment.'
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  #destroy works fine
def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to gamer_path(params[:gamer_id]), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end

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
