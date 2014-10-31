class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.column :name, :string

      t.references :race
      t.references :pc_class
      t.belongs_to :user

      t.timestamps
    end
  end
end
