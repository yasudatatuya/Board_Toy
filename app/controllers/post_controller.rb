class PostController < ApplicationController
  def create
    @post = Post.new
    @post.user_id = current_user.id
    @post.topic_id = Topic.find(params[:topic_id]).id
    @topic.save
    redirect_to topic_path(@post.topic_id)
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :topic_id, :body)
  end

end
