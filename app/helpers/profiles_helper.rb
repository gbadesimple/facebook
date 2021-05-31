module ProfilesHelper

  private
  def user_profile_params
    params.require(:profile).permit(:firstname, :lastname, :date_of_birth, :state_of_origin,
                                    :lga, :occupation, :study, :qualification, :marital_status,
                                    :place_of_residence, :phone_number, :sex, :religion, :avatar)
  end

end
