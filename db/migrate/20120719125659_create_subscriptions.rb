class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |s|
      s.string :name
      s.string :email

      s.timestamps
    end
  end
end
