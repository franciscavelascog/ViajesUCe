# frozen_string_literal: true

# Modelo de Publication
class Publication < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :solicituds, dependent: :destroy
  has_one :room, dependent: :destroy
  validates :titulo, length: { minimum: 5 }
  validates :punto_partida, length: {  minimum: 2 }
  validates :punto_llegada, length: {  minimum: 2 }
  # validates :fecha, presence: true
  # validates :cupos, length: { minimum: 10 }
  # validates :radio, length: { minimum: 10 }

  def self.search(search)
    where('comuna_partida LIKE ? OR comuna_llegada LIKE ?', "%#{search}%", "%#{search}%")
  end
end
