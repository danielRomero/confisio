class PostsController < ApplicationController
  skip_before_filter :only_admin, only: [:show, :index]
  skip_before_filter :login_required, only: [:show, :index]
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
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

  def new
    @post = @section.posts.build
  end

  def create
    @post = @section.posts.build
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to post_permalink_path(@section.permalink, !@post.categories.empty? ? @post.categories.first.permalink : 'artículo', @post.permalink), notice: "Artículo creado."
    else
      render :edit
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_permalink_path(@section.permalink, !@post.categories.empty? ? @post.categories.first.permalink : 'artículo', @post.permalink), notice: "Artículo actualizado."
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
      if !(@post = Post.find_by(permalink: params[:post_permalink]))
        redirect_to sections_permalink_path(params[:permalink]) # si no encuentra el artículo redirige a la sección a la que debería pertenecer
      end
    end
    
    def set_section
      @section = Section.find_by(permalink: params[:permalink])
    end

    def set_category
      @category = @section.categories.find_by(permalink: params[:category_permalink])
    end

    def post_params
      params.require(:post).permit(:keywords, :body, :title, :primary_image, :id, category_ids: [])
    end
end
