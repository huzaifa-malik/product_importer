class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def import_from_csv
    ProductServices::ProductImporter.run(file_path: params[:file].path, override: params["delete_old_products"])
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Products were successfully imported.' }
      format.json { head :no_content }
    end
  rescue ExceptionHandlers::ServiceError => e
    respond_to do |format|
      format.html { redirect_to products_url, notice: e.message }
      format.json { head :no_content }
    end
  end
end
