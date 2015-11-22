class AddCloudedToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :clouded, :boolean
  end

  def self.down
    remove_column :pages, :clouded
  end
end
