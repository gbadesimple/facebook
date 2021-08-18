class ProfilesController < ApplicationController
  before_action :authenticate_user!
  include ProfilesHelper
  include ApplicationHelper

  def show
    @profile = Profile.find_by_user_id(params[:user_id])
    friendrequests
  end

  def new
    @profile = Profile.new
    @user = User.find(params[:user_id])
    friendrequests
  end

  def edit
    @profile = Profile.find_by_user_id(params[:user_id])
    friendrequests
  end

  def create
    @profile = current_user.build_profile(user_profile_params)

    if @profile.save
      flash[:notice] = "Profile created successfully."

      redirect_to root_path
    else
      flash[:alert] = "Errors were found, please try again!"
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile

    if @profile.update(user_profile_params)
      flash[:notice] = "Profile updated successfully"

      redirect_to user_profile_path(current_user)

    else
      flash[:alert] = "Update was not successful please try again"

      redirect_to user_profile_path(current_user)
    end
  end

  def destroy
    @user = current_user
    @profile = Profile.find_by_user_id(params[:user_id])
    if @profile.destroy
      flash[:notice] = "Profile successfully deleted"

      redirect_to root_path
    else
      flash[:alert] = "We are unable to delete your profile"

      render user_profile_path(@user)
    end
  end

end
