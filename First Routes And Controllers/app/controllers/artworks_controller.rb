require 'byebug'
class ArtworksController < ApplicationController
    def index
        # render plain: "I'm in the index action!"
        if params.has_key?(:user_id)
            artworks = Artwork.where(artist_id: params[:user_id])
            artworkShare = ArtworkShare.where(viewer_id: params[:user_id])
            artworkShare.each do |artShare|
                shared_art = Artwork.where(id: artShare.artwork_id)
                artworks += shared_art
            end
        else 
            artworks = Artwork.all
        end

        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def update 
        artwork = Artwork.find(params[:id])
        artwork.update(artwork_params)
        if artwork.save
            render json: artwork
          else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end