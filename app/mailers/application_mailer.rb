# frozen_string_literal: true
# ApplicationMailer

class ApplicationMailer < ActionMailer::Base
  default from: 'kalisa@getyourhouse.com'
  layout 'mailer'
end
