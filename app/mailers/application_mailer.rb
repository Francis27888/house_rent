# frozen_string_literal: true
# ApplicationMailer

class ApplicationMailer < ActionMailer::Base
  default from: 'house@support.com'
  layout 'mailer'
end
