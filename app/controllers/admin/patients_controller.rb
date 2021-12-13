class Admin::PatientsController < ApplicationController

  def new
    admin_ward_id = current_admin.ward_id
    @patients = Patient.where(ward_id: admin_ward_id)

  end

  def create
    pateint = Patient.new(patient_params)
    pateint.save
    redirect_to new_admin_patient_path
  end


  private
  def patient_params
    params.require(:patient).permit(:name, :ward_id, :birthday)
  end

end
