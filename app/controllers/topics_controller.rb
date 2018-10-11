class TopicsController < ApplicationController
  
  def new
    
  end 
    
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic].permit(:title))
    @topic.save
    redirect_to topics_path
  end
  
  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end
end
