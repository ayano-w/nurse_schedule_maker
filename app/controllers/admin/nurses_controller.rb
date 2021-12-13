class Admin::NursesController < ApplicationController
  def index
    admin_ward_id = current_admin.ward_id
    @nurses = Nurse.where(ward_id: admin_ward_id)

  end

  def update
    nurses = Nurse.find(nurses_params)
    # @nurses = nurses_params.map do |id, nurse_param|
    #   nurse = Nurse.find(id)
      nurses.update_all
    # end
    redirect_to admin_nurses_path
  end


  private
  def nurse_params
    params.require(:nurse).permit(:name, :ward_id)[:nurses]
  end

  def nurses_params
    params.require(:nurse).permit(nurses: [:attendance])[:nurses]
  end



end
