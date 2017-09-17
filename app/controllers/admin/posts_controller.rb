module Admin
  class PostsController < AdminController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.ordered.includes(:section)
    end

    def show
    end

    def new
      @post = Post.new
    end

    def edit
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to admin_posts_path, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def update
      if @post.update(post_params)
        redirect_to admin_posts_path, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
    end

    def autocomplete_tags
      tags = Post.autocomplete(params[:q]).pluck(:name)
      render json: {
        items: tags.map { |t| { id: t, text: t } }
      }
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:section_id, :title, :body, :banner, :banner_cache, :remove_banner, tag_list: [])
      end
  end
end
