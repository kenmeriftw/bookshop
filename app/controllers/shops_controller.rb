class ShopsController < ApplicationController
  before_action :set_shop, except: %i[ index new create ]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def edit; end

  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: "Shop was successfully created." }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: "Shop was successfully updated." }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: "Shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def add_book_in_stock(book_id)
    @shop.books.find_or_create_by(id: book_id)
  end

  def sell_a_book
    @shop.books_sold_count += 1
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.fetch(:shop, {}).permit(:title)
  end
end
