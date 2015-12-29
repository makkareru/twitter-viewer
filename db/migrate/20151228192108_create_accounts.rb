class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_id
      t.string :name
      t.string :screen_name
      t.text :follows
      t.text :followers

      t.timestamps null: false
    end
  end
end
