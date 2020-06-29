# frozen_string_literal: true

class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :string
    User.update_all(avatar: '')
    # Ex:- :default =>''
  end
end
