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
        
    end


end