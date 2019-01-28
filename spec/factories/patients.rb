# frozen_string_literal: true

FactoryGirl.define do
  factory :patient do
    name { 'João' }
    birth_day { Time.now.utc }
    description { 'Some Description' }
    user
  end
end
