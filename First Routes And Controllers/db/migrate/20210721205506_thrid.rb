class Thrid < ActiveRecord::Migration[5.2]
  def change
      change_column :users, :username, :string, :presence => true, :uniqueness => true
  end
end
