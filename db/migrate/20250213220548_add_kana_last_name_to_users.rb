class AddKanaLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kana_last_name, :string
  end
end
