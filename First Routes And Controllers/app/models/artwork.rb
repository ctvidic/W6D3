class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true
    validates :artist_id, presence: true
    validates :artist_id, uniqueness: { scope: :title }

    belongs_to :artist,
        class_name: 'User',
        foreign_key: :artist_id,
        primary_key: :id

    has_many :artwork_share,
        class_name: 'ArtworkShare',
        foreign_key: :artwork_id,
        primary_key: :id

    has_many :shared_artworks,
        through: :artwork_share,
        source: :artwork
    
end