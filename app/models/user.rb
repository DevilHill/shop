class User < ApplicationRecord
  has_many :addresses,:dependent => :destroy
  has_many :comments ,:dependent => :destroy
  has_many :favorites ,:dependent => :destroy
  has_one :default_address,:dependent => :destroy
  acts_as_authentic

  # Validate email, login, and password as you see fit.
  #
  # Authlogic < 5 added these validation for you, making them a little awkward
  # to change. In 4.4.0, those automatic validations were deprecated. See
  # https://github.com/binarylogic/authlogic/blob/master/doc/use_normal_rails_validation.md
  validates :login,
            format: {
                with: /\A[a-z0-9]+\z/,
                message: "should use only letters and numbers."
            },
            length: { within: 3..100 },
            uniqueness: {
                case_sensitive: false,
                if: :will_save_change_to_login?
            }

  validates :email,
            format: {
                with: /@/,
                message: "should look like an email address."
            },
            length: { maximum: 100 },
            uniqueness: {
                case_sensitive: false,
                if: :will_save_change_to_email?
            }



  validates :password,
            confirmation: { if: :require_password? },
            length: {
                minimum: 6,
                if: :require_password?
            }
  validates :password_confirmation,
            length: {
                minimum: 6,
                if: :require_password?
            }
end
