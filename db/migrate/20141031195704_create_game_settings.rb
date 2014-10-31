class CreateGameSettings < ActiveRecord::Migration
  def change
    create_table :game_settings do |t|

      t.column :max_level, :integer

      t.column :level_formula, :string

      t.timestamps
    end
  end
end
