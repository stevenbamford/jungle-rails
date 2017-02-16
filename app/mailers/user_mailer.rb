class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.email, subject: 'Your Jungle order has been placed. Order id: #{@order.id}')
  end

end
