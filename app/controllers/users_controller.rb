class UsersController < ApplicationController
  def new
    @user = User.new
end

def create
  @user = User.new(username:params["user"][:username], email:params["user"][:email], contact:params["user"][:contact])
  if @user.save
  redirect_to "/passengers"
  else
  render :new
  end
end

def login
  @user = User.new
end

def login_user
  print "params",params
  user = User.find_by(username:params["user"][:username])
  print user
  if user != nil
    if user.contact == params["user"][:contact]
      print "success"
      redirect_to "/passengers/"
    else
      @user = User.new(username:params["user"][:username])
      render :login
    end
  
  else
    new
    render :new
  end
end

private
    def user_params
      params.require(:user).permit(:username, :email, :contact)
    end
end
