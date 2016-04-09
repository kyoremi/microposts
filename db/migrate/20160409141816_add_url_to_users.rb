class AddUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :url, :string
    add_column :users, :self_introduction, :string
    add_column :users, :area, :string
  end
end
