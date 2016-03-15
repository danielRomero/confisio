class Admin::PostsController < Admin::AdminsController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @titulo = "#{@section.name.capitalize} · artículos"
    @posts = @section.posts.page params[:page]
  end

  def new
    @post = @section.posts.build
  end

  def edit
  end

  def create
    @post = @section.posts.build
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: 'Artículo creado.'
    else
      render :edit
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: 'Artículo actualizado.'
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path, notice: 'Artículo borrado'
    else
      redirect_to request.referer, notice: 'Artícuno NO borrado, error.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:keywords, :body, :title, :primary_image, :id, category_ids: [])
  end
end
