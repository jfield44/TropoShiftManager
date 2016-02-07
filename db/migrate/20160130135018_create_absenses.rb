class CreateAbsenses < ActiveRecord::Migration
  def change
    create_table :absenses do |t|
      t.string :shift
      t.string :reason
      t.string :replacement_employee
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
