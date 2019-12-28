class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:session][:username])

        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            render json: UserSerializer.new(@user), status: :ok
        else
            render json: {
                error: "Invalid Username or Password."
            }
        end
    end

    def get_current_user
        # if user not logged in return true and end 
        
        if !logged_in? 
           return render json: {
                error: "No one is logged in"
            }
        end
        render json: UserSerializer.new(current_user)
       
        # if logged_in?
        #     render json: UserSerializer.new(current_user)
        # else
        #     render json: {
        #         error: "No one is logged in."
        #     }
        # end
    end

    def destroy
        session.clear
        render json: { notice: "You have successfully logged out." }
    end

end
