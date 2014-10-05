require 'bcrypt'

class User < ActiveRecord::Base

  has_many :characters

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  # attr_accessor :new_password, :new_password_confirmation

  # validates_confirmation_of :new_password, :if=>:password_changed?

  # def password_changed?
  #   !@new_password.blank?
  # end

  # def self.authenticate(username, password)
  #   if user = find_by_name(username)
  #     if BCrypt::Password.new(user.hashed_password).is_password? password
  #       return user
  #     end
  #   end
  #   return nil
  # end

  # def self.hash_password(password)
  #   BCrypt::Password.create(password)
  # end

  # private

  # def hash_new_password
  #   self.hashed_password = BCrypt::Password.create(@new_password)
  # end

end

