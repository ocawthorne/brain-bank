class AppController < Sinatra::Base

   configure do
      set :views, '.app/views'
      enable :sessions
      set :session_secret, 'flucloxacillin'
   end

   get '/' do
      erb :index
   end

   helpers do
      def current_user

      end

      def logged_in?

      end
   end

end
