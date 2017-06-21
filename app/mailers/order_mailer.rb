class OrderMailer < ApplicationMailer

  def received order
    @order = order

    mail to: order.email, subject: "Mail received"
  end

  def shipped order
    @order = order

    mail to: order.email, subject: "Mail shipped"
  end

  def canceled order
    @order = order

    mail to: order.email, subject: "Mail canceled"
  end
end
