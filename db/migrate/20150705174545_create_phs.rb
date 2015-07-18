class CreatePhs < ActiveRecord::Migration
  def change
    create_table :phs do |t|

      t.timestamps null: false
      t.float :value
    end
  end
end
