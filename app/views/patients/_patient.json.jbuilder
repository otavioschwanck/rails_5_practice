# frozen_string_literal: true

json.extract! patient, :id, :name, :birth_day, :description, :created_at, :updated_at
json.url patient_url(patient, format: :json)
