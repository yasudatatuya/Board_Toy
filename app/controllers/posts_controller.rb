class PostsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.topic_id = @topic.id
    binding.pry
    if @topic.save
      redirect_to topic_path(@post.topic_id)
    else
      render 'topics/show'
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

end