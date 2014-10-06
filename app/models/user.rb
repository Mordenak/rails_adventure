require 'bcrypt'

class User < ActiveRecord::Base

  has_many :characters

  include BCrypt

  def password
    # puts "test: #{Password.new(hashed_password)}"
    @password ||= Password.create(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    puts "Used #{new_password}"
    puts "Setting as #{@password}"
    self.hashed_password = @password
  end

  # attr_accessor :new_password, :new_password_confirmation

  # validates_confirmation_of :new_password, :if=>:password_changed?

  # def password_changed?
  #   !@new_password.blank?
  # end

  def self.authenticate(user, password)
    # temp = Password.create(password)
    puts "attempting on: #{password}"
    puts "against: #{user.hashed_password}"
    if Password.new(user.hashed_password).is_password? password
      return user
    end
    return nil
  end

  # def self.hash_password(password)
  #   BCrypt::Password.create(password)
  # end

  # private

  # def hash_new_password
  #   self.hashed_password = BCrypt::Password.create(@new_password)
  # end

end

