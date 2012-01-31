Given /^I have vacancies titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Vacancy.create!(:title => titles)
  end
end

Given /^I have no vacancies$/ do
  Vacancy.delete_all
end

Then /^I should have ([0-9]+) vacanc(y|ies)?$/ do |count, not_required|
  Vacancy.count.should == count.to_i
end

