class PostsController < ApplicationController

  before_action :set_post, only: [:show]
  before_action :set_section
  before_action :set_category

  def show
    if @category
      @titulo = "#{@section.name.capitalize} · #{@category.name} · #{@post.title}"
    else
      @titulo = "#{@section.name.capitalize} · #{@post.title}"
    end
    @meta_image = @post.primary_image
    @description = @post.body_preview
    @meta_url = post_permalink_url(@section.permalink, @category.permalink, @post.permalink) if @category
    @author = @post.user ? @post.user : User.employers.first
  end

  def index
    @titulo = "#{@section.name.capitalize} · artículos"
  end

  private

  def set_post
    unless @post = Post.find_by(permalink: params[:post_permalink])
      redirect_to sections_permalink_path params[:permalink] # si no encuentra el artículo redirige a la sección a la que debería pertenecer
    end
  end

  def set_section
    @section = Section.find_by(permalink: params[:permalink])
  end

  def set_category
    @category = @section.categories.find_by(permalink: params[:category_permalink])
  end
end
