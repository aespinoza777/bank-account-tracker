class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) 
            session[:user_id] = user.id
            redirect_to user
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session.clear
        redirect_to new_session_path
    end

    def google_auth
        auth = request.env["omniauth.auth"]
        user = User.from_omniauth(auth)
        user.save
        session[:user_id] = user.id
        redirect_to user 
    end
end