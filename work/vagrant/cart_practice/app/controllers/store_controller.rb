class StoreController < ApplicationController
 before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  def index
  	@products = Product.order(:title)
  end

  def create
  	@line_item = LineItem.new(line_item_params)
  	respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
  	end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end

end