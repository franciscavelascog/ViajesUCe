# frozen_string_literal: true

# Helper de publicacioes
# module PublicationHelper
# end

# frozen_string_literal: true

# Publications Helper
module PublicationsHelper
  # la primera letra del titulo será mayuscula
  def first_letter(act_title)
    upper_title = act_title.capitalize
    (upper_title == act_title)
  end
end
