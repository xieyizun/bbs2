class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params(params))
    if @comment.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to root_path
    end

  end

  def show
  end

  def destroy
    @comment = current_user.comments.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.html
      format.js
    end

  end
  
  private
    def comment_params(params)
      params.require(:comment).permit(:content, :post_id)
    end
end
