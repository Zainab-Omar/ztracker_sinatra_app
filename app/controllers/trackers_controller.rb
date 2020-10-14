class TrackersController < ApplicationController

    get '/trackers' do #index that show the user all trackers they create
        if logged_in?
            @trackers=current_user.trackers
            erb :'trackers/index'
        else
            redirect to ('/signin')
        end
    end


end