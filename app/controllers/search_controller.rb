class SearchController < ApplicationController

  def index
    query = params[:search]

    if (user_signed_in?)
      @vacancies = current_user.vacancies.where {(title =~ "%#{query}%") | (external_vacancy_number =~ "%#{query}%") | (location =~ "%#{query}%")}
    else
      redirect_to root_url, :alert => "You must be logged in to search"
    end
  end

end

