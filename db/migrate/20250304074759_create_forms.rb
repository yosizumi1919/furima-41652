class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|

      t.timestamps
    end
  end
end
