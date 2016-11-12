class FriendshipsController < ApplicationController
#this app was created by Ankush Malik github:  https://github.com/freakuency

  def index

   
    @user = User.find(session[:user_id])
    @friends = @user.friends
    @user_all = User.all 
    @friendship_all = Friendship.all 
    @invites = Friendship.where(friend_id:session[:user_id], status: "Pending")
    @accept = Friendship.where(friend_id:session[:user_id], status: "Accepted")
  end

  def create
    $sid= params[:sid]
    Friendship.create(user: User.find(session[:user_id]), friend: User.find(params[:user_id]), status:"Pending")
    redirect_to '/professional_profile'
  end


  def destroy #bidirectional deletion
   Friendship.find_by(user_id: User.find(session[:user_id]), friend_id: User.find(params[:user_id])).destroy 
   Friendship.find_by(user_id: User.find(params[:user_id]), friend_id:User.find(session[:user_id])).destroy 
   redirect_to '/professional_profile'
  end

  def accept #bidirectional addition
    $sac=params[:sac]
    @user = User.find(session[:user_id])
    Friendship.find_by(id: params[:id]).update(status:"Accepted")
    Friendship.create(user: @user , friend: User.find(params[:user_id]), status:"Accepted")
    redirect_to '/professional_profile'
  end 
  def ignore
    Friendship.find_by(id: params[:id]).destroy 
    redirect_to '/professional_profile'
  end 
end

