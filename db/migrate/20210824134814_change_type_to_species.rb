class ChangeTypeToSpecies < ActiveRecord::Migration[6.0]
  def change
    rename_column :pets, :type, :species
  end
end
