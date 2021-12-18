class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  before_action :admin_ward_nil?

  def top
  end
end
