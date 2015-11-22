class AddImportanceToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :importance, :integer
  end

  def self.down
    remove_column :pages, :importance
  end
end
