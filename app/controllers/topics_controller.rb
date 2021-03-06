class TopicsController < ApplicationController

  def index
    @topics = Topic.page(params[:page]).per(5)
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.post.page(params[:page]).per(10)
    @post = Post.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to topics_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

end
