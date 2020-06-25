# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email, unique: true
      t.string :password_digest
      t.boolean :is_admin, :default => false
      t.boolean :graduate
      t.references :cohort, null: false, foreign_key: true
      t.boolean :work_remotely
      t.string :twitter
      t.string :facebook
      t.string :linkedIn
      t.string :portfolio
      t.string :blog

      t.timestamps
    end
  end
end
