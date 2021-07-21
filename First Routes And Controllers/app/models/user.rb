class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true

    has_many :artworks,
        class_name: 'Artwork'
        foreign_key: :artist_id,
        primary_key: :id

end