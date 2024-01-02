class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post
  has_many :postcomments
  has_many :likes, as: :likeable
  validates :phonenumber, presence: true, length: { minimum: 10, maximum: 15 }
  validates :gender, inclusion: { in: ['male', 'female', 'other'], allow_nil: true }

 
end
