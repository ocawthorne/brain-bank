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
      redirect "/#{user.username}"
   end

   get "/:username" do
      current_user.username == params[:username] ? (erb :"users/home") : (erb :"users/other_user_profile")
      # if logged_in?
      #    current_user.username == params[:username] ? (erb :"users/home") : (erb :"users/other_user_profile")
      # else
      #    erb :"users/other_user_profile"
      # end
   end

   post "/logout" do
      logged_in? ? (session.clear ; (redirect '/login')) : (redirect '/')
      erb :'sessions/login'
   end

   get('/feed') {erb :'users/feed'}

end
