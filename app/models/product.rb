class Product < ApplicationRecord
    has_many :comments
    has_and_belongs_to_many :albums
    has_one_attached :image
    belongs_to :user
end
