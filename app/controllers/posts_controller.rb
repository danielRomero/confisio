class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  skip_before_filter :login_required, only: [:show, :index]
  before_filter :only_admin, except: [:show, :index]
  # GET /posts
  # GET /posts.json
  def index
    @category = case params[:category]
      when 'psicologia'
        'Psicología' # Al loro con el acento
      else
        'Fisioterapia'
      end
    
    @posts = Post.from_category(@category).by_create_date

    if params[:sucategory] and @subcategory = Subcategory.find_by(name_safe: params[:sucategory])
      @posts = @posts.joins(:subcategories).where( subcategories: { id: @subcategory.id } )
    end
    
    if params[:etiqueta]
      @posts = @posts.tagged_with(params[:etiqueta])
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @title = @post.title
    @description = Nokogiri::HTML(@post.body.to_s[0..200]).text
    render layout: 'columns'
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    #@post.body = post_params[:body].first
    respond_to do |format|
      if @post.save
        clean_categories(@post)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        clean_categories(@post)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def clean_categories(post)
      if params[:post] and params[:post][:subcategories_attributes]
        subcategories = []
        
        if subcategories_ids = params[:post][:subcategories_attributes][:id]
          # asigno esas subcategorías al post
          for subcategory_id in subcategories_ids
            if subcategory = Subcategory.find_by(id: subcategory_id)
              subcategories << subcategory
            end
          end
        end

        if subcategories_names = params[:post][:subcategories_attributes][:name]
          # creo subcategorias asociadas al post.category
          for subcategories_name in subcategories_names
            if !subcategories_name.blank?
              subcategories << Subcategory.find_or_create_by(name: subcategories_name, category_id: post.category.id)
            end
          end
        end

        if !subcategories.empty?
          post.subcategories = subcategories
          post.save
        end

      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if params[:permalink]
        @post = Post.find_by(permalink: params[:permalink])
      else
        @post = Post.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit( :title, :tag_list, :body, :category_id, :primary_image )
    end
end
