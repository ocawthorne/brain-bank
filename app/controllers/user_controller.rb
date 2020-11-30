class UserController < AppController
   get("/signup") {erb :'sessions/signup'}
   get("/login") {erb :'sessions/login'}

   post "/login" do
      user = User.find_by(username: params[:username])
      user && user.authenticate(params[:password]) ? (session[:id] = user.id ; redirect "/#{user.username}") : (redirect "/login")
   end
   
   post "/signup" do
      @username_error = User.find_by(username: params[:username]) ? true : false
      @email_error = User.find_by(email: params[:email]) ? true : false
      if @username_error || @email_error
         erb :'sessions/signup'
      else
         user = User.create(params)
         session[:id] = user.id
         redirect "/#{user.username}"
      end
   end

   get "/:username" do
      @user = User.find_by(username: params[:username])
      erb :'users/posts'
   end

   post "/logout" do
      logged_in? ? (session.clear ; (redirect '/login')) : (redirect '/')
      erb :'sessions/login'
   end

end
