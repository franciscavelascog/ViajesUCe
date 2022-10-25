# frozen_string_literal: true

FactoryBot.define do
  factory :resena do
    user_id { 1 }
    puntualidad { 1 }
    seguridad { 1 }
    comentario { 'MyString' }
  end
end
