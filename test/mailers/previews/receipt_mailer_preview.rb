# Preview all emails at http://localhost:3000/rails/mailers/receipt_mailer
class ReceiptMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt_mailer/order_confirmation
  def order_confirmation
    ReceiptMailer.order_confirmation
  end

end
