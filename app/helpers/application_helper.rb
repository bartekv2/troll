module ApplicationHelper
  def get_footer
    simple_format "© #{DateTime.now.year} all rights reserved".upcase
  end
end
