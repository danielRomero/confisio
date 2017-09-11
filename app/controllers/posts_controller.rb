class PostsController < ApplicationController
  before_action :set_section_by_permalink, :set_post

  private

  def set_post
    @post = Post.find_by(permalink: params[:permalink])
  end
end
