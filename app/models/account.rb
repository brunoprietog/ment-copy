# frozen_string_literal: true

class Account < ApplicationRecord
  include Rodauth::Rails.model
  self.implicit_order_column = nil
end
