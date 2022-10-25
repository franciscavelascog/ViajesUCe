# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :publication
  belongs_to :user
end
