module ApplicationHelper

  def app_title
    "Recruitr"
  end

  def copyright_years
    year = Time.new.year

    if (year == 2012)
      "2012"
    else
      "2012 - #{year}"
    end
  end

end

