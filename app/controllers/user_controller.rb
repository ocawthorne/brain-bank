#! A User can only edit their own posts.
#! When a User makes a Post, an upvote is automatically assigned to the Post.
#! A User can upvote any entry.

require "pry"

class UserController < AppController
   get('/') do

   end

   get("/signup") {erb :"users/signup"}
   get("/login") {erb :"sessions/login"}

   post "/login" do
      @user = User.all.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:id] = @user.id
         redirect "/#{@user.username}"
      else
         redirect "/login"
      end
   end
   
   post "/signup" do
      user = User.create(params) ; user.reputation = 0
      session[:id] = user.id
   end

   get "/:username" do
      case logged_in?
      when true
         current_user.username == params[:username] ? (erb :"users/index") : (erb :"users/other_user_profile")
      when false
         erb :"users/other_user_profile"
      end
   end

   get "/logout" do
      erb :'sessions/logout'
      # logged_in? ? (binding.pry ; (redirect '/login')) : (redirect '/')
      # erb :index
   end

end
