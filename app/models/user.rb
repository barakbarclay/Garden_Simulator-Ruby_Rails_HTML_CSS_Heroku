# The User model is responsible for acting as a blueprint to all users.
class User < ActiveRecord::Base

    #User attribute validation
    validates_presence_of :name, :email
    
end