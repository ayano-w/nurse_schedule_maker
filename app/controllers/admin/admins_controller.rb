class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @admin = current_admin
  end

  def update
    admin = current_admin
    admin.update(admin_params)
    redirect_to edit_admin_admin_path, notice: "編集に成功しました"
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :ward_id)
  end

end
