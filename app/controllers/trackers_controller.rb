class TrackersController < ApplicationController

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

    post '/trackers' do
        if logged_in?
            #binding.pry
            @tracker = current_user.trackers.build(params)
            if !@tracker.save
                @errors = @tracker.errors.full_messages
                erb :'/trackers/new'
            else
                redirect to "/trackers/#{@tracker.id}" #redirect to show page 
            end
        else
            redirect to 'signin'
        end  
    end
    #binding.pry
    get '/trackers/:id' do  #show the tracker details to user
       
        @tracker = Tracker.find(params[:id])
        if logged_in? && @tracker.user == current_user
                    erb :'/trackers/show'
        else
            redirect to '/signin'
       end
     end

end