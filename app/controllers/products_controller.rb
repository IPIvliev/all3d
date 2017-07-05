class ProductsController < InheritedResources::Base



  private

    def product_params
      params.require(:product).permit(:title, :price, :user_id, :description, :project_id, :orders_count, :comments_count, :status, :active)
    end
end

