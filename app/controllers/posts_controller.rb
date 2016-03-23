class PostsController < ApplicationController

  before_filter :sign_in_user

  def create
    post = current_user.posts.build(post_params(params))

    if post.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      render root_path
    end

  end

  def destroy
  end

  def show
<<<<<<< HEAD
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new
=======
  	@post = Post.find_by_id(params[:id])
>>>>>>> 7e28554a5bd4e50ec596ffaa1858d6cb51051ba8
  end

  private
    def post_params(params)
      params.require(:post).permit(:user_id, :content)
    end
end
