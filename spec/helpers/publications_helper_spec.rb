# frozen_string_literal: true

# require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PublicationHelper. For example:
#
# describe PublicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe PublicationHelper, type: :helper do
# pending "add some examples to (or delete) #{__FILE__}"
# end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Publications', type: :request do
  include PublicationsHelper
  describe 'Publications helper methods' do
    it 'should return true' do
      publication_tittle = 'My first publication'
      first_letter(publication_tittle).should eq(true)
    end
  end
end
