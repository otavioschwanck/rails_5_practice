# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

describe 'the signup process', type: :feature do
  feature 'Visitor signs up' do
    it 'with valid email and password' do
      sign_up_with 'valid@example.com', 'password'

      expect(page).to have_content('Sair')
    end

    it 'with invalid email' do
      sign_up_with 'invalid_email', 'password'

      expect(page).to have_content('Login')
    end

    it 'with blank password' do
      sign_up_with 'valid@example.com', ''

      expect(page).to have_content('Login')
    end

    def sign_up_with(email, password)
      visit ('/users/sign_up')
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password Confirmation', with: password
      click_button 'Inscrever-se'
    end
  end
end
