class AddPaceOptionToCohorts < ActiveRecord::Migration[6.0]
  def change
    add_column :cohorts, :pace_option, :string
  end
end
