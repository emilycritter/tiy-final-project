# Preview all emails at http://localhost:3000/rails/mailers/receipt_mailer
class ReceiptMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt_mailer/order_confirmation
  def order_confirmation
    ReceiptMailer.order_confirmation(Order.first, User.first, Artist.all)
  end

  # Preview this email at http://localhost:3000/rails/mailers/receipt_mailer/artist_order_notice
  def artist_order_notice
    ReceiptMailer.artist_order_notice(Order.first, User.first, Artist.find_by(id: 4))
  end

end
