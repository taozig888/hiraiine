class TopicsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    set_topic
    @newpost = Post.new(:topic_id => params[:id])
    @posts = Post.where(topic_id: params[:id])
    
  end
  
  def index
    @topics = Topic.order(created_at: :desc).page(params[:page]).per(10)
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = ' トピックが正常に投稿されました'
      redirect_to @topic
    else
      flash.now[:danger] = 'トピックが投稿されませんでした'
      redirect_to topics_path
    end
  end
  
  def destroy
    set_topic
    @topic.destroy
    flash[:success] = 'Message は正常に削除されました'
    redirect_to topics_path
  end
 
 private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:content, :title)
  end
  
  def correct_user
    @topic = current_user.topics.find_by(id: params[:id])
    unless @topic
      redirect_to root_url
    end
  end
  
end
