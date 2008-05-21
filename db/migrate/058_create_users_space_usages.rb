class CreateUsersSpaceUsages < ActiveRecord::Migration
  def self.up
    create_table (:users_space_usages, :force => true) do |t|
      t.integer :uid
      t.integer :server_id
      t.decimal :space_usage
    end
  end

  def self.down
    drop_table :users_space_usages
  end
end
