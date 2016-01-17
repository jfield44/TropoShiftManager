class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_number
      t.string :first_name
      t.string :surname
      t.string :security_pin
      t.string :mobile_number
      t.string :monday_shift
      t.string :tuesday_shift
      t.string :wednesday_shift
      t.string :thursday_shift
      t.string :friday_shift
      t.string :saturday_shift
      t.string :sunday_shift

      t.timestamps null: false
    end
  end
end
