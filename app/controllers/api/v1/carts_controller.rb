class Api::V1::CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    if @cart
      render json: @cart, status: :ok
    else
      render json: { error: 'Cart is not found!' }, status: :not_found
    end
  end

  def create
    @cart = Cart.new(params.require(:cart).permit(:user_id))
    if @cart.save
      render json: @cart, status: :created
    else
      render json: { errors: @cart.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # def update
  #     if @cart.update(cart_params)
  #         render json: @cart, status: :ok
  #     else
  #         render json: {errors: @cart.errors.full_messages} , status: :unprocessable_entity
  #     end
  # end

  # def destroy
  #     if @cart.destroy
  #         render json: @cart
  #     else
  #         render json: {errors: @cart.errors.full_messages} , status: :unprocessable_entity
  #     end
  # end
end
