class Admin::WardsController < ApplicationController
 before_action :authenticate_admin!

  def new
    @ward = Ward.new
    @wards = Ward.all
  end

  def create
    @ward = Ward.new(ward_params)
    if @ward.save
      redirect_to admin_wards_new_path, notice: "登録に成功しました"
    else
      redirect_to admin_wards_new_path, notice: "同じ名前の病棟は登録できません"
    end
  end

  def update
    @ward = Ward.find(params[:id])
    if @ward.update(ward_params)
      redirect_to admin_wards_new_path, notice: "編集しました"
    else
      redirect_to admin_wards_new_path, notice: "同じ名前の病棟は登録できません"
    end
  end
  

  def destroy
    @ward = Ward.find(params[:id])
    @ward.destroy
    redirect_to admin_wards_new_path

  end

  private
  def ward_params
    params.require(:ward).permit(:ward_name)
  end

end
