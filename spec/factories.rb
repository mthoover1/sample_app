FactoryGirl.define do
  factory :user do
    name     "Matt Hoover"
    email    "mthoover1@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end