FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email { Factory.next(:email) }
    forename 'Factory'
    surname  'Girl'
    password "secret"
    password_confirmation {|u| u.password}
    admin false
  end

  factory :admin, :parent => :user do
    admin true
  end
end

