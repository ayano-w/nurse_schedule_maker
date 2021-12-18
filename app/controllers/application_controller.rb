class ApplicationController < ActionController::Base


  # ログイン後看護師が病棟に所属しているか確認する
  def nurse_ward_nil?
    if current_nurse.ward_id == nil
      redirect_to mypage_path, notice: "病棟が削除されました。登録してください。"
    end
  end

  # ログイン後管理者が病棟に所属しているか確認する
  def admin_ward_nil?
    if current_admin.ward_id == nil
      redirect_to edit_admin_admin_path(current_admin), notice: "病棟が削除されました。登録してください。"
    end
  end



end
