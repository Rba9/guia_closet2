class RemoveColumnsFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :photo, :string
    remove_column :albums, :estilos, :string
  end
end
