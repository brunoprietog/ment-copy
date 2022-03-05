# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ment@gmail.com'
  # TODO: Set email!
  layout 'mailer'
end
