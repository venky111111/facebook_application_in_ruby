class Post < ApplicationRecord
    belongs_to :user
    has_many :postcomments, dependent: :destroy
    has_many :likes, as: :likeable, dependent: :destroy
  
    validates :content, presence: true
  end
  