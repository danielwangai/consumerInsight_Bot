class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.references :step, index: true, foreign_key: true
      t.references :reviewer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
