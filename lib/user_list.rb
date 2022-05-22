require 'user'

class UserList
  def initialize
    @users = [] # User[]
  end

  def list
    return @users
  end

  def get(index) # index: Int
    # returns a User object
  end

  def add(user)
    @users << user
  end

  def remove(index) # index: Integer
    # Deletes the user obj at given index
  end

  def update(index, email, password, name, mobile)    # index: Integer, 
                                                      # email: String, 
                                                      # password: String,
                                                      # name: String,
                                                      # mobile: String
    # Updates the User obj at index with the new arguments
    # No return value
  end

  def find(id) 
    return @users.find{|user| user.id == id}
  end

  def exists?(id) # email: String
    # checks to see if the email has already been used for an account
    # returns true or false
  end

end