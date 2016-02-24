class AddWizardIdToStep < ActiveRecord::Migration
  def change
    add_reference :steps, :wizard, index: true, foreign_key: true
  end
end
