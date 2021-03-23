class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
    @users = User.all.order(:created_at => "DESC")
  end




end
