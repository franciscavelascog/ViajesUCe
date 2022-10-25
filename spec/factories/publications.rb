# frozen_string_literal: true

require 'faker'

# Una factory nos permitirá crear de manera sencilla instancias de una clase con diferentes valores
# y sin la necesidad de que nosotros le asignemos los parámetros al momento de crearla.
FactoryBot.define do
  factory :publication do
    titulo { Faker::Lorem.words(number: rand(10..20)) }
    punto_partida { Faker::Lorem.words(number: rand(10..20)) }
    punto_llegada { Faker::Lorem.words(number: rand(10..20)) }
    fecha { Faker::Time.forward(days: 23, period: :all) }
    cupos { rand(1..5) }
    radio { rand(1.3..5.2) }
    user_id { 3 }
  end
end
