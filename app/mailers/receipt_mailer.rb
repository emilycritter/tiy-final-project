class ReceiptMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_mailer.order_confirmation.subject
  #
  def order_confirmation(the_order, the_user, the_artists)
    @order = the_order
    @user = the_user
    @artists = the_artists

    @greeting = "Hi"

    mail to: @user.email, subject: "Order Confirmation from buylocalart.herokuapp.com (#{@order.order_confirmation})"

  end

  def artist_order_notice(the_order, the_user, the_artist)
    @order = the_order
    @user = the_user
    @artist = the_artist

    @items = @order.order_items.select{|item| item.piece.artist_id == @artist.id}

    @greeting = "Hi"

    mail to: @user.email, bcc: "emily.c.ritter@gmail.com", subject: "Order Notice from buylocalart.herokuapp.com (#{@order.order_confirmation})"
  end
end
