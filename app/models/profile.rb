class Profile < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :date_of_birth, presence: true
  validates :state_of_origin, presence: true
  validates :lga, presence: true
  validates :occupation, presence: true
  validates :study, presence: true
  validates :qualification, presence: true
  validates :marital_status, presence: true
  validates :place_of_residence, presence: true
  validates :phone_number, presence: true
  validates :sex, presence: true
  validates :religion, presence: true

  belongs_to :user

end
