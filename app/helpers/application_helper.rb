# frozen_string_literal: true

# Helper de ApplicationController
module ApplicationHelper
  def render_stars(value)
    output = ''
    value.to_i.times { output += '*' } if (1..5).include?(value.to_i)
    output
  end
end
