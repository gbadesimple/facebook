class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
  #  @profile = Profile.find(params[:id])
    @profile = Profile.find_by_user_id(params[:user_id])
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find_by_user_id(params[:user_id])
  end

  def create
    @profile = current_user.build_profile(user_profile_params)

    if @profile.save
      flash[:notice] = "Profile created successfully."

      redirect_to root_path
    else
      flash[:alert] = "We are unable to process your request due to some error(s)."
      render :new
    end
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(user_profile_params)
      flash[:notice] = "Profile updated successfully"

      redirect_to user_profile_path(current_user)

    else
      flash[:alert] = "Update was not successful please try again"

      render :update
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


  private
  def user_profile_params
    params.require(:profile).permit(:firstname, :lastname, :date_of_birth, :state_of_origin,
                                    :lga, :occupation, :study, :qualification, :marital_status,
                                    :place_of_residence, :phone_number, :sex, :religion)
  end


end
