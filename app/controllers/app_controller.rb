class AppController < Sinatra::Base
   configure do
      set :views, 'app/views'
      enable :sessions
      set :session_secret, 'flucloxacillin'
   end

   get '/' do
      session[:id] ? (redirect "/#{User.find(session[:id]).username}") : (redirect '/login')
   end

   helpers do
      def current_user
         User.find(session[:id]) if session[:id]
      end

      def logged_in?
         !!current_user
      end

      def posts_user_id_matches_user_found_by_username
         Post.find(params[:post_id]).user_id == User.find_by(username: params[:username]).id
      end

      def is_user?
         session[:id] == User.find_by(username: params[:username]).id
      end
   end

end
