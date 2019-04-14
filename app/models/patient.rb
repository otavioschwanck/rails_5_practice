# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :name, presence: true
  belongs_to :user

  scope :from_user, ->(user_id) { where(user_id: user_id) }

  def meu_metodo
    # do something
  end
end
