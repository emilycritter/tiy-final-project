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

    order_item.save! if order_item.quantity <= @piece.inventory

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
    @order = Order.find_by status: 'cart', user_id: @current_user.id

    card_token = params[:stripeToken]

    Stripe.api_key = "sk_test_wHzmUvlgjN7NWOsoIRsR2sJT"

    Stripe::Charge.create(
      :amount => @order.total_price_in_cents,
      :currency => "usd",
      :source => card_token,
      :description => @order.description
    )

    @order.update status: 'payment_received'

    # update inventory
    @order.order_items.each do |order_item|
      order_item.piece.inventory -= order_item.quantity
      order_item.piece.save!
    end

    redirect_to receipt_path(order_confirmation: @order.order_confirmation)
  end

  def receipt
    @order = Order.find_by! order_confirmation: params[:order_confirmation], user_id: @current_user.id
  end
end
