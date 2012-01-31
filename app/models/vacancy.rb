class Vacancy < ActiveRecord::Base

  belongs_to :user

  def distance(postcode)
    PostcodeLocation.distance(self.postcode, postcode)
  end

end

