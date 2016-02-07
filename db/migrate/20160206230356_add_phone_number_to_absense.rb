class AddPhoneNumberToAbsense < ActiveRecord::Migration
  def change
    add_column :absenses, :phone_number, :string
  end
end
