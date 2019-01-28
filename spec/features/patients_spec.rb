require 'spec_helper'

RSpec.describe 'patient CRUD', type: :feature do
  let!(:user) { create(:user) }

  before(:each) do
    visit('/users/sign_in')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: '12345678'
    click_button 'Login'
  end

  context 'creating' do
    context 'with valid attributes' do
      it 'create new user' do
        visit('/patients/new')

        fill_in 'patient_name', with: 'Otávio'
        fill_in 'patient_birth_day', with: '15/12/1994'

        click_button('Criar Paciente')

        expect(page).to have_content('Listando')
      end
    end

    context 'with invalid attributes' do
      it 'dont create user' do
        visit('/patients/new')

        click_button('Criar Paciente')

        expect(page).to have_content('não pode ficar em branco')
      end
    end
  end

  context 'editing' do
    let(:patient) { create(:patient, user_id: user.id) }

    context 'when edit with valid params' do
      it 'update user' do
        visit("/patients/#{patient.id}/edit")

        fill_in 'patient_name', with: 'Otávio Schwanck'
        fill_in 'patient_birth_day', with: '15/12/1994'

        click_button('Atualizar Paciente')

        expect(page).to have_content('Listando')
      end
    end

    context 'when edit with invalid params' do
      it 'update user' do
        visit("/patients/#{patient.id}/edit")

        fill_in 'patient_name', with: ''

        click_button('Atualizar Paciente')

        expect(page).to have_content('não pode ficar em branco')
      end
    end
  end

  context 'listing' do
    context 'when patient belongs to user' do
      let!(:patient) { create(:patient, user_id: user.id, name: 'Roger') }

      it 'list user' do
        visit('/patients')

        expect(page).to have_content('Roger')
      end
    end

    context 'when patient doesnt belongs to user' do
      let(:another_user) { create(:user, email: 'another_user@gmail.com') }
      let!(:patient) { create(:patient, user_id: another_user.id, name: 'Roger') }

      it 'list user' do
        visit('/patients')

        expect(page).to_not have_content('Roger')
      end
    end
  end
end
