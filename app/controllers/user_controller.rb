#! A User can only edit their own posts.
#! When a User makes a Post, an upvote is automatically assigned to the Post.
#! A User can upvote any entry.

require 'pry'

class UserController < AppController
   get('/signup') {erb :'users/signup'}
   get('/login') {erb :'users/login'}

   post '/login' do
      @user = User.all.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:id] = @user.id
         redirect "/#{@user.username}"
      else
         redirect '/login'
      end
   end
   
   post '/signup' do
      user = User.create(params) ; user.reputation = 0
      session[:id] = user.id
   end

   get "/:username" do
      @user = current_user
      @user.username == params[:username] ? (erb :'users/index') : (erb :'users/other_user_profile')
   end

   post '/signout' do
      session.clear
      redirect '/login'
   end

   get '/feed' do
      erb :feed
   end

   get ':username/posts' do

   end

end
