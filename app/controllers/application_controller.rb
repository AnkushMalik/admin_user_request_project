class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #this app was created by Ankush Malik github:  https://github.com/freakuency
  protect_from_forgery with: :exception
end
