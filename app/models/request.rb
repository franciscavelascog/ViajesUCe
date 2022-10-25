# frozen_string_literal: true

# validates_uniqueness_of requested_user_id:, scope: :publication_id

class Request < ApplicationRecord
  validates :requested_user_id, uniqueness: { scope: :publication_id }
  belongs_to :user
  belongs_to :publication
end
