class CreateCohorts < ActiveRecord::Migration[6.0]
  def change
    create_table :cohorts do |t|
      t.string :cohort_lead
      t.references :userId, null: false, foreign_key: true
      t.references :campusId, null: false, foreign_key: true
      t.references :courseId, null: false, foreign_key: true
      t.date :graduation

      t.timestamps
    end
  end
end
