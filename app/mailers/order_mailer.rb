class OrderMailer < ApplicationMailer

  def received order
    @order = order
    mail to: order.email, subject: t "order_mailer.received"
  end

  def shipped order
    @order = order
    mail to: order.email, subject: t "order_mailer.shipped"
  end

  def canceled order
    @order = order
    mail to: order.email, subject: t "order_mailer.canceled"
  end
end
