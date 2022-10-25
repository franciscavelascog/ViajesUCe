# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'Publications', type: :request do
# describe 'GET /index' do
#  pending "add some examples (or delete) #{__FILE__}"
# end
# end

# frozen_string_literal: true

require 'rails_helper'
require 'faker'

# Se agrupan todos los tests relacionados al controlador de Profiles,
# con esta línea se le dice a Rails que será testeado
RSpec.describe Publication, type: :request do
  # Aquí se utiliza la factory de Publication para la creación de una publicación
  # @user = User.new(name: 'hola', description:'holahola', email:'hola123@hotamil.com', work: 'ing', age: 21)
  let!(:user) { create(:user) }
  let!(:publication) { create(:publication, user: user) }
  let!(:attr_publication) do
    { titulo: Faker::Lorem.words(number: rand(10..20)), punto_partida: Faker::Lorem.words(number: rand(10..20)),
      punto_llegada: Faker::Lorem.words(number: rand(10..20)), fecha: Faker::Time.forward(days: 23, period: :all),
      cupos: rand(1..5), radio: rand(1.3..5.2) }
  end
  let!(:invalid_attr_publication) do
    { titulo: Faker::Lorem.words(number: 1), punto_partida: Faker::Lorem.words(number: rand(10..20)),
      punto_llegada: Faker::Lorem.words(number: rand(10..20)), fecha: Faker::Time.forward(days: 23, period: :all),
      cupos: rand(1..5), radio: rand(1.3..5.2) }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful request' do
      # Se le señala a Rails que se haga un GET a la ruta /publications
      get '/publications'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get new' do
    it 'should return a successful request' do
      get '/publications/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful request' do
      get "/publication/#{publication.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree una publicación la cuenta de publicaciones totales se incremente en 1
    it 'should increase count of Publication by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Publcation en 1 (al poner 1 es +1).
      expect do
        post '/publications', params: { publication: publication.attributes }
      end.to change(Publication, :count).by(1)
    end
    # Se pasan atributos invalidos y se ve que la cuenta de Publicaciones no cambie
    it 'should not increase count of Publications' do
      expect do
        post '/publications', params: { publication: invalid_attr_publication }
      end.to change(Publication, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful request' do
      get "/publications/#{publication.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Publication' do
      expect do
        patch "/publication/#{publication.id}", params: { publication: { titulo: 'Ejemplo para cambiar' } }
        # Se recarga la instancia de publication nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        publication.reload
      end.to change(publication, :titulo)
    end
  end
  # En este caso se trata de haer un update pero con atributos que no son válidos por las validaciones hechas.
  describe 'update' do
    it 'should not change a Publication' do
      expect do
        patch "/publication/#{publication.id}", params: { publication: { punto_llegada: 'h', titulo: 'example' } }
        # Se recarga la instancia de publication nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos de la publication
        publication.reload
      end.to_not change(publication, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Publication by 1' do
      expect do
        delete "/publication/#{publication.id}"
      end.to change(Publication, :count).by(-1)
    end
  end
end
