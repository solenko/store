class CreateSeassons < ActiveRecord::Migration
  def change
    create_table :seassons do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
