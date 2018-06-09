# frozen_string_literal: true
# AdminController

class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @houses = House.all.order('created_at desc').page(params[:page]).per(8)
  end
  
  def users
    @users = User.all.order('created_at desc').page(params[:page]).per(8)
  end
  
  def destroy_user
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted successfully.'
    redirect_to users_list_path
  end
end
