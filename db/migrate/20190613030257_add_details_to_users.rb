class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :postcode, :string
    add_column :users, :address, :text
    add_column :users, :biography, :text
  end
end
