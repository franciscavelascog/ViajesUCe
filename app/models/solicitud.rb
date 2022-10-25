# frozen_string_literal: true

class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  validates :user, uniqueness: { scope: :publication_id }
end
