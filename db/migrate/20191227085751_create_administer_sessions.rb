class CreateAdministerSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :administer_sessions do |t|

      t.timestamps
    end
  end
end
