# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all.from_user(current_user.id)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show; end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit; end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        successful_response('Patient successfuly created', :created)
      else
        failure_response(format, :new, @patient)
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        successful_response('Patient was successfuly updated.', :ok)
      else
        failure_response(format, :new, @patient)
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  # reek:disable TooManyStatements
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def failure_response(format, action, patient)
    format.html { render action }
    format.json { render json: patient.errors, status: :unprocessable_entity }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def successful_response(message, status)
    format.html { redirect_to patients_url, notice: message }
    format.json { render :show, status: status, location: @patient }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_params
    params.require(:patient).permit(:name, :birth_day, :description).merge(user_id: current_user.id)
  end
end
