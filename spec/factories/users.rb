# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    work { Faker::Job.title }
    age { 21 }
    password { '123123' }
  end
end
