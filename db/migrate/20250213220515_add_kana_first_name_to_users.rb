class AddKanaFirstNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kana_first_name, :string
  end
end
