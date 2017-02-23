class User < ApplicationRecord

  has_secure_password

  before_save { self.email = email.downcase }

  validates :username, presence: true,
                       uniqueness: true,
                       length: { minimum: 3, maximum: 30}


  val_email_reg = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 105 },
                    format: { with: val_email_reg }

   val_pass_reg = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}\z/
                   #  | Looks for an arbitrary string followed by a letter
                                 #  | Looks for an arbitrary string followed by a number.
                                             # | Ensure there are at least 6 characters

  validates :password, presence: true,
                       length: { minimum: 8, maximum: 20},
                       format: { with: val_pass_reg }

  validates_confirmation_of :password, message: ": Passwords don't match!"

end
