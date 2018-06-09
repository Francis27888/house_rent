# frozen_string_literal: true
# HouseMailer

class HouseMailer < ApplicationMailer
  def house_mail(user, house)
    @user = user
    @house = house
    mail to: @user.email, message: 'You have posted a new house!!!'
  end
end
