class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :reason
      t.integer :interval # in minutes
      t.integer :user_id

      t.datetime :last_reminder_sent_at

      t.timestamps null: false
    end
  end
end
