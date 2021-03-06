class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end
  
  def new
    @comment = Comment.new
  end
  
  def edit
    @comment.post_id = params[:post_id]
  end
  
  def create
    @comment = Comment.new(comment_params) 
    @comment.post_id = params[:post_id]
    @comment.name = current_user.name
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_url, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @comment.post_id = params[:id] 
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_comment
      @comment = Comment.find(params[:id])    
    end   

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment_text ,:post_id)
    end
end
