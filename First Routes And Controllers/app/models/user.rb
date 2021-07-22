class User < ApplicationRecord
    
    validates :username, uniqueness: true, presence: true

    has_many :artworks, dependent: :destroy,
        class_name: 'Artwork',
        foreign_key: :artist_id,
        primary_key: :id

    has_many :artwork_shares, dependent: :destroy,
        class_name: 'ArtworkShare',
        foreign_key: :viewer_id,
        primary_key: :id

    has_many :comments, dependent: :destroy,
        class_name: 'Comments',
        primary_key: :id,
        foreign_key: :user_id

    has_many :shared_artworks, dependent: :destroy,
        through: :artwork_shares,
        source: :artwork


end