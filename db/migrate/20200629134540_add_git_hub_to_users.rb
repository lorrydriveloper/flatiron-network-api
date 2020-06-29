# frozen_string_literal: true

class AddGitHubToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :github, :string
    User.update_all(github: '')
  end
end
