module Authenticate
  require 'bcrypt'
  puts "Authenticate module activated"

  # Method hashing the string
  def Authenticate.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  #Verify the hashed string
  def Authenticate.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  # Hash the string of each user in the user class
  def Authenticate.create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    return list_of_users
  end

  # Compare and authenticate
  def Authenticate.authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username].downcase == username.downcase && verify_hash_digest(user_record[:password]) == password
        puts "User Authenticated"
        return user_record
      end
    end
    puts "Credentials were not correct"
  end
end

# to use the module require_relative "file_name"