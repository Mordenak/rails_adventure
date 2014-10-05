class CreateUserSecurities < ActiveRecord::Migration
  def change
    create_table :user_securities do |t|
      t.column :account_level, :string, limit: 1, default: 'G'

      t.timestamps
    end
  end
end
