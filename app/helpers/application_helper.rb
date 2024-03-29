module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end 
  end

  # Logo helper
  def logo
    return image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

  
end
