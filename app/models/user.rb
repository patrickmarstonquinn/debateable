class User < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  has_many   :favorites,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :debates,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
