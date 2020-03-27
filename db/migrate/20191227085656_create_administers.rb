class CreateAdministers < ActiveRecord::Migration[6.0]
  def change
    create_table :administers do |t|

      t.string    :login,               :null => false
      t.string    :email,               :null => false
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.string :nickname                    , :null => false
      t.integer :sex
      t.integer :province
      t.integer :order_email                , :default => 0
      t.string :info
      t.integer :messages_count             , :default => 0
      t.integer :reply_messages_count       , :default => 0
      # See "Magic States" in Authlogic::Session::Base
      t.timestamps
    end
  end
end
