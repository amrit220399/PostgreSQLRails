
class User < ApplicationRecord
    attr_accessor :password

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

    def encrypt(string)
        Digest::SHA1.hexdigest(string)
    end
end
