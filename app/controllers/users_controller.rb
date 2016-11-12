class UsersController < ApplicationController
  def index
  end

  def register
	  	@user = User.create(name:params[:name],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation], description:params[:description])
	  	if @user.valid?
	  		session[:user_id] = @user.id
	  		redirect_to '/professional_profile'
	  	else
	  		redirect_to '/users', :notice => @user.errors.full_messages
	  end 
  end

  def login
  		if !params[:email].blank? && !params[:password].blank?
  		user = User.find_by_email(params[:email])
	  	if user 
	  		if  user.authenticate(params[:password])
	  			session[:user_id] = user.id
	  			redirect_to '/professional_profile'
	  		else 
	  			redirect_to '/users', :alert =>  "Email/password do not match. Try again."
	  		end
	  	else
	  		redirect_to '/users', :alert =>  "Email does not exist."
	  	end
	  else
	  	redirect_to '/users', :alert =>  "Email and Password cannot be blank."
	  end
  end

   def show_all
    @users = User.all 
    @current_user = User.find(session[:user_id])
    @friendships = @current_user.friends
    @pending = Friendship.where(status: "Pending", friend_id:session[:user_id])

    #you dont want to be friend with yourself :P
   	
    @all_friends = []
    for pend in @pending  
    	@all_friends.push(pend.user_id)
    end 

    puts"*"*100
    puts @all_friends.class
    puts"*"*100
	end

  def show
  @user= User.find(params[:user_id])
  end 

  def logout
    session[:user_id] = nil
    redirect_to '/users'
  end 

end
