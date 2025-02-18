class AddKanjiFirstNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kanji_first_name, :string
  end
end
