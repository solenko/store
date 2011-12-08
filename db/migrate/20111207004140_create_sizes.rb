class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :code

      t.timestamps
    end
  end
end
