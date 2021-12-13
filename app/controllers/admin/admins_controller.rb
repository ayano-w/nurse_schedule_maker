class Admin::AdminsController < ApplicationController
  def edit
    @admin = current_admin
  end

  def update
    admin = current_admin
    admin.update(admin_params)
    redirect_to edit_admin_admin_path
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :ward_id)
  end

end
