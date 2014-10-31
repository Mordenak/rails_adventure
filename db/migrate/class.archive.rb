class CreatePcClasses < ActiveRecord::Migration
  def change
    create_table :pc_classes do |t|
      
      t.column :name, :string

      t.column :str_gain, :integer
      t.column :dex_gain, :integer
      t.column :vit_gain, :integer
      t.column :int_gain, :integer
      t.column :wis_gain, :integer
      t.column :spd_gain, :integer

      t.timestamps
    end
  end
end
