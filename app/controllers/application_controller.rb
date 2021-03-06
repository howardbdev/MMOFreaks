require './config/environment'



class ApplicationController < Sinatra::Base

  configure do
    set :public_folder , Proc.new {File.join(root,"../public")}
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "catalano"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end