class AppController < Sinatra::Base

   configure do
      set :views, 'app/views'
      enable :sessions
      set :session_secret, 'flucloxacillin'
   end

   get '/' do
      erb :index
   end

   helpers do
      def current_user
         User.find(session[:id]) if session[:id]
      end

      def logged_in?
         !!current_user
      end

      def public?(post)
         post[:is_public] == "t" ? true : false
      end
   end

end
