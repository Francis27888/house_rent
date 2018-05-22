class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :stripe_id
      t.string :card_brand
      t.string :card_last4
      t.string :card_exp_month
      t.string :card_exp_year
      t.date :expire_at

      t.timestamps
    end
  end
end
