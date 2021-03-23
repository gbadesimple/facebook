class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :firstname
      t.string  :lastname
      t.date    :date_of_birth
      t.string  :state_of_origin
      t.string :lga
      t.string  :occupation
      t.string  :study
      t.string :qualification
      t.string  :marital_status
      t.string  :place_of_residence
      t.string :phone_number
      t.string  :sex
      t.string  :religion

      t.timestamps
    end
  end
end
