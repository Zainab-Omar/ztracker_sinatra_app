require 'rack-flash'

class TrackersController < ApplicationController
    use Rack::Flash

    get '/trackers' do #index that show the user all trackers they create
        if logged_in?
            @trackers=current_user.trackers
            erb :'trackers/index'
        else
            redirect to ('/signin')
        end
    end

    get '/trackers/new' do 
        if logged_in?
            @current_user
            erb :'/trackers/new'
        else
            redirect to '/signin'
        end
    end

    post '/trackers' do #create new form
        if logged_in?
            @tracker = current_user.trackers.build(params)
            if !@tracker.save
                @errors = @tracker.errors.full_messages
                erb :'/trackers/new'
            else
                flash[:message] = "You have successfully created a new tracker."
                redirect to "/trackers/#{@tracker.id}" #redirect to show page 
            end
        else
            redirect to '/signin'
        end  
    end
    
    get '/trackers/:id' do  #show the tracker details to user
       
        @tracker = Tracker.find(params[:id])
        #binding.pry
        if logged_in? && @tracker.user == current_user
                    erb :'/trackers/show'
        elsif @tracker.user != current_user
            flash[:warning] = "You canot see, update, or delete trackers that do not belong to you."
            redirect to '/trackers'  #index
        else
            redirect to '/signin'
       end
     end

     get '/trackers/:id/edit' do  #route to enable user to update thier trackers
             if logged_in?
                @tracker = Tracker.find_by_id(params[:id])
                if @tracker.user == current_user
                   erb :'/trackers/edit'
                   else
                    redirect to '/signin'
             end
        end
    end

        patch '/trackers/:id' do
            @tracker = Tracker.find(params[:id])
            @tracker.date = params[:date]
            @tracker.gender = params[:gender]
            @tracker.exercise_time = params[:exercise_time]
            @tracker.intake_cal = params[:intake_cal]
            @tracker.burned_cal = params[:burned_cal]
    
            if !@tracker.save
                @errors = @tracker.errors.full_messages
                erb :'/trackers/edit'
            else
                flash[:message] = "Successfully updated tracker."
                redirect to "/trackers/#{@tracker.id}" #show page            
            end
        end
        
        delete '/trackers/:id/delete' do
            @tracker = Tracker.find(params[:id])
            
            if logged_in? && @tracker.user == current_user
                @tracker.destroy
                flash[:message] = "Successfully deleted tracker."
                redirect to '/trackers' #index
            else
                redirect to '/signin'
            end
        end
end