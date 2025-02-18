class AddKanjiLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kanji_last_name, :string
  end
end
