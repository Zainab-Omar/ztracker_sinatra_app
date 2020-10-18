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
           # binding.pry
            @errors = @user.errors.full_messages
            
            erb :'users/create_user'
        else
            session[:user_id] = @user.id
            redirect to ('/trackers')
        end
    end

    get '/signin' do
       if !session[:user_id]
        erb :'users/signin' 
       else
        redirect to '/trackers' #index
       end
    end

    post '/signin' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/trackers'
        else
            @errors = "Invalid email or password"
            erb :'users/signin'
        end
    end

    get '/signout' do
        if logged_in?
            session.clear
            redirect to '/signin'
        else
            redirect to '/'
        end
    end

end