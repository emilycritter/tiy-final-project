class CartsController < ApplicationController
  def view
    @order = Order.find_by status: 'cart', user_id: @current_user.id
  end

  def add_to_cart
    @piece = Piece.find_by id: params[:piece_id]

    order = Order.find_by status: 'cart', user_id: @current_user.id
    if order.nil?
      order = Order.new
      order.user = @current_user
      order.purchased_at = Time.now
      order.save!
    end

    order_item = OrderItem.find_by order_id: order.id, piece_id: @piece.id
    if order_item.present?
      order_item.quantity += 1
    else
      order_item = OrderItem.new
      order_item.order = order
      order_item.piece = @piece
      order_item.price = @piece.price
      order_item.quantity = 1
    end
    order_item.save!

    redirect_to cart_path
  end

  def remove_from_cart
    @order = Order.find_by status: 'cart', user_id: @current_user.id
    @piece = Piece.find_by id: params[:piece_id]
    order_item = OrderItem.find_by order_id: @order.id, piece_id: @piece.id
    order_item.destroy
    redirect_to cart_path
  end

  def process_payment
  end

  def receipt
    @order = Order.find_by! order_confirmation: params[:order_confirmation], user_id: @current_user.id
  end
end
