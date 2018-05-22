class AddUserIdToCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :user_id, :integer
  end
end
