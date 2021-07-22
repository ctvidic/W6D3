class CommentsController < ApplicationController
    def index
        # debugger
        if !params[:user_id].nil?
            userr = Comments.where(user_id: params[:user_id])
            render json: userr
        else
            artowkke = Comments.where(artwork_id: params[:artwork_id])
            render json: artowkke
        end
    end

    def create
        comments = Comments.new(comments_params)
        if comments.save
          render json: comments
        else
          render json: comments.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comments = Comments.find(params[:id])
        comments.destroy
        render json: comments
    end

    private

    def comments_params
        params.require(:comments).permit(:user_id, :artwork_id, :body)
    end
end