class PostsController < ApplicationController
  skip_before_filter :only_admin, only: [:show, :index]
  skip_before_filter :login_required, only: [:show, :index]
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_section

  def show
    @titulo = "#{@section.name} · #{@post.title}"
    @meta_image = @post.primary_image
    @description = @post.body_preview || @section.description
  end

  def index
    @titulo = "#{@section.name} · artículos"
  end

  def new
    @post = @section.posts.build
  end

  def create
    @post = @section.posts.build
    if @post.update(post_params)
      redirect_to post_permalink_path(@section.permalink, @post.permalink), notice: "Artículo creado."
    else
      render :edit
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_permalink_path(@section.permalink, @post.permalink), notice: "Artículo actualizado."
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to setting_path(@section.permalink), notice: 'Artículo borrado'
    else
      redirect_to request.referer, notice: 'Artícuno NO borrado, error.'
    end
  end

  private
    def set_post
      if !@post = Post.find_by(permalink: params[:post_permalink])
        redirect_to sections_permalink_path(params[:permalink]) # si no encuentra el artículo redirige a la sección a la que debería pertenecer
      end
    end
    
    def set_section
      !@section = Section.find_by(permalink: params[:permalink])
    end

    def post_params
      params.require(:post).permit(:keywords, :body, :title, :primary_image, :id, category_ids: [])
    end
end
