class UsersController < ApplicationController
    def index
        # render plain: "I'm in the index action!"
        users = User.all
        render json: users
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
        render json: user

    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end