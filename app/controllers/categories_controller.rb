class CategoriesController < ApplicationController
  # GET /categories/:id/subcategories_selector?post_id=X
  def subcategories_selector
    if params[:post_id]
      @post = Post.find_by(id: params[:post_id])
    end
    @category = Category.find_by(id: params[:id])
  end

end
