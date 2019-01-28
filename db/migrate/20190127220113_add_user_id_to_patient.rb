# frozen_string_literal: true

class AddUserIdToPatient < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :user, foreign_key: true
  end
end
