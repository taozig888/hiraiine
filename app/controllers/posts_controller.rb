class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post].permit(:topic_id, :name, :comment))
    @post.save
    redirect_to topic_path(params[:post]['topic_id'])
  end
  
end