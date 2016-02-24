class CreateWizards < ActiveRecord::Migration
  def change
    create_table :wizards do |t|
      t.string :name
      t.string :start_keyword
      t.string :reset_keyword

      t.timestamps null: false
    end
  end
end
