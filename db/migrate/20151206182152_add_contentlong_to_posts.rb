class AddContentlongToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :contentlong, :text
  end
end
