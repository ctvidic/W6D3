class UsersController < ApplicationController
    def index
        # render plain: "I'm in the index action!"
        # debugger
        if User.where(params[:username])
            render json: User.where(username: params[:username])
        else
            users = User.all
            render json: users
        end
    end

    def create
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        # debugger
        render json: User.find(params[:id])
    end

    def update 
        user = User.find(params[:id])
        user.update(user_params)
        if user.save
            render json: user
          else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end