class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :hashed_password, :string

      t.belongs_to :user_security

      t.timestamps
    end
  end
end
