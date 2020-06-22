class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.boolean :graduate
      t.references :cohort, null: false, foreign_key: true
      t.boolean :work_remotely

      t.timestamps
    end
  end
end
