class PostsController < ApplicationController
  def create
    @newpost = Post.new(params[:post].permit(:topic_id, :name, :comment))
    @post.save
    redirect_to topics_show_path(params[:post]['topic_id'])
  end
  
end