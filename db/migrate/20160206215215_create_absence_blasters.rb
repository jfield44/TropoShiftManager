class CreateAbsenceBlasters < ActiveRecord::Migration
  def change
    create_table :absence_blasters do |t|
      t.string :recipient_name
      t.string :recipient_number
      t.string :shift
      t.string :access_code
      t.references :absense, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
