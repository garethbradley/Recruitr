Feature: Manage Vacancies
    In order to post job adverts
    As a user
    I want to create and manage vacancies

Background:
    Given the following user records
    | email          | password | admin |
    | joe@public.com | secret   | false |
    | tim@test.com   | secret   | false |
    | andy@admin.com | secret   | true  |

Scenario: Create Valid Vacancy
    Given I am logged in as "tim@test.com" with password "secret"
    And I have no vacancies
    And I am on the list of vacancies
    When I follow "New Vacancy"
    And I fill in "Title" with "Test Vacancy"
#    And I fill in "Content" with "Delicious potato wedges!"
    And I press "Create"
    Then I should see "Vacancy was successfully created."
    And I should see "Test Vacancy"
    And I should have 1 vacancy

Scenario: Vacancies List When Not Logged In
    Given I am not logged in
    And I have vacancies titled Test, Job
    When I go to the list of vacancies
    Then I should not see "Test"
    And I should not see "Job"

Scenario: Vacancies List When Logged In
    Given I am logged in as "joe@public.com" with password "secret"
    And I have vacancies titled Test, Job
    When I go to the list of vacancies
    Then I should see "Test"
    And I should see "Job"

