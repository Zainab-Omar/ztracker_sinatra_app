class UsersController < ApplicationController
    
    get '/signup' do
        if !session[:user_id]
            erb :'users/create_user'
        else
            redirect to ('/trackers')
        end
    end

    post '/signup' do
        @user = User.new(params)
        if !@user.save
            @errors = @user.errors.full_messages
            erb :'users/create_user'
        else
            session[:user_id] = @user.id
            redirect to ('/trackers')
        end
    end

    get '/signin' do
        
    end

    post '/signin' do
        
    end

    get '/signout' do
        session.clear
        redirect to ('/')
    end

end