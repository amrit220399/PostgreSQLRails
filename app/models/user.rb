
class User < ApplicationRecord
    validates :first_name ,presence: true
    validates :last_name ,presence: true
    validates :date_of_birth ,presence: true
    validates :email, uniqueness:  true, length: { in: 5..50 }
    validates :password ,presence: true,confirmation: true, length: { in: 4..20}
    validates :mobile ,presence: true, length: {is: 10}
   
    attr_accessor :password

    has_one_attached :avatar

    before_save :encrypt_password
    


    def self.authenticate(email,login_password)
        user = find_by_email(email)
        return user if user &&  user.password_valid?(login_password)
    end

    def password_valid?(login_password)
        self.hashed_password == encrypt(login_password)
    end

    private
    def encrypt_password
        return if password.blank?
        self.hashed_password = encrypt(password)
    end

    def encrypt(string_pass)
        Digest::SHA1.hexdigest(string_pass)
    end
end
