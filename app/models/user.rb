# frozen_string_literal: true

# Modelo de User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username
  has_many_attached :images, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :resenas, dependent: :destroy
  has_many :solicituds
  # validates :name, presence: true, lenght: {maximum: 50}
  validates :name, presence: true, length: { minimum: 2 }
end
