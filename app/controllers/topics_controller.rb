class TopicsController < ApplicationController
  
  def new
    
  end 
  
  def show
    set_topic
    
  end
  
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:success] = ' トピックが正常に投稿されました'
      redirect_to @topic
    else
      flash.now[:danger] = 'トピックが投稿されませんでした'
      render :new
    end
  end
  
  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end
 
 private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:content, :title)
  end
  
end
