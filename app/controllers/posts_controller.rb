class PostsController < ApplicationController
  before_action :set_section_by_permalink, :set_post
  
  def show
    @title = @post.title
    @description = @post.body_preview
    @meta_image = @post.banner_url(:header)
  end
  
  private

  def set_post
    @post = Post.find_by(permalink: params[:permalink])
  end
end
