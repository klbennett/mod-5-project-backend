class Api::V1::UsersController < ApplicationController

   
     def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: { token: issue_token({id: @user.id})}
        else
            render json: {error: "Could not log in"}
        end
    end

    def validate
        @user = get_current_user
        if @user
            render json: {username: @user.username, token: issue_token({id: user.id})}
        else
            render json: {error: 'User not found.'}, status: 400
        end
    end

    def signup
        @user = User.create(username: params[:username], password: params[:password])
        if @user.save
            render json: { username: @user.username, token: issue_token({id: @user.id})}
        else
            render json: {error: "Could not sign up"}
        end
    end

     def show
        @user = User.find_by(id: params[:id])
        if @user 
            render json: @user
        else
            render json: {error: "User not found"}
        end
    end

    def show_user_lists
        @user = get_current_user
        @user_lists = List.all.select{|list| list.user_id === @user.id }
        # byebug
        if @user_lists
            render json: @user_lists
        else
            render json: {error: "User not found"}
        end
    end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
