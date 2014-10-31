class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.column :name, :string

      t.column :level, :integer, default: 1
      t.column :xp, :integer, default: 0
      t.column :gold, :integer, default: 0

      t.references :race
      t.references :pc_class
      t.belongs_to :user

      t.timestamps
    end
  end
end
