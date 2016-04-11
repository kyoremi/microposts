class AddUrlToUsers < ActiveRecord::Migration
  def change
   create_table :user_params do |t|
       add_column :users, :url, :string
       add_column :users, :self_introduction, :string
       add_column :users, :area, :string
       t.timestamps null: false
   end
  end
end