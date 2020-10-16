require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'trackersecure'
  end

  get "/" do
    if logged_in?
      redirect to ('/trackers') #redirect to the trackers index
    else
      erb :welcome  #user can signin or signup
    end
    erb :welcome
  end

  helpers do

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

     def total_calories
      @tracker = Tracker.find(params[:id]) 
      @total_cal = @tracker.intake_cal - @tracker.burned_cal
    end

    def show_message
      @tracker = Tracker.find(params[:id])
       gender = @tracker.gender

       if gender == "female"
        if total_calories.between?(1500, 2000)
          "You are maintaining your current weight"
        elsif total_calories < 1500
          "You will lose one pound of weight per week"
        elsif total_calories > 2000
          "You will gain one pound of weight per week" 
        end
       else gender == "male"
        if total_calories.between?(2000, 2500) 
        "You are maintaining your current weight"
        elsif total_calories < 2000
        "You will lose one pound of weight per week"
        elsif total_calories > 2500
        "You will gain one pound of weight per week" 
        end
      end
    end
  end

end
