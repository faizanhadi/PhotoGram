class AddPhotgrapherIdToRecepies < ActiveRecord::Migration
  def change
    add_column :photos, :photographer_id, :integer
  end
end
