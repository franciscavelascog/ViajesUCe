# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'Nombres', type: :request do
# describe 'GET /index' do
#  pending "add some examples (or delete) #{__FILE__}"
# end
# end

# frozen_string_literal: true

# require '../profile_helper.rb'
require 'rails_helper'

# Se agrupan todos los tests relacionados al controlador de Profiles,
# con esta línea se le dice a Rails que será testeado
RSpec.describe 'Users', type: :request do
  # Se crean unos atributos para la creación de un Profile
  # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
  before(:each) do
    @attr_user = {
      name: 'Example_name',
      description: 'Exampple description',
      email: 'test@test.com',
      work: 'example work',
      age: 20,
      password: 123_123
    }

    @user_and_mail_repetead_age_str = {
      name: 'Example_name',
      description: 'Exampple description',
      email: 'test@test.com',
      work: 'example work',
      age: 'hola'
    }
    @mail_repetead = {
      name: 'Example_name_2',
      description: 'Exampple description',
      email: 'test@test.com',
      work: 'example work',
      age: 25
    }
    @negative_age = {
      name: 'Example_name_4',
      description: 'Exampple description',
      email: 'test4@test.com',
      work: 'example work',
      age: -10
    }
    @not_arroba_mail = {
      name: 'Example_name_5',
      description: 'Exampple description',
      email: 'testtest.com',
      work: 'example work',
      age: 45
    }
    @age_string_number = {
      name: 'Example_name_6',
      description: 'Exampple description',
      email: 'test6@test.com',
      work: 'example work',
      age: '2age'
    }
    @user_and_mail_repeated_ = {
      name: 'Example_name_2',
      description: 'Exampple description',
      email: 'test@test.com',
      work: 'example work',
      age: 5
    }
    @user_too_short = {
      name: 'a',
      description: 'Exampple description',
      email: 'test8@test.com',
      work: 'example work',
      age: 18
    }
    @no_mail = {
      name: 'Example_name_9',
      description: 'Exampple description',
      email: '',
      work: 'example work',
      age: 25
    }
    @double_arroba = { # REVISAR
      name: 'Example_name_10',
      description: 'Exampple description',
      email: 'test@test@test.com',
      work: 'example work',
      age: 25
    }
    @age_float = {
      name: 'Example_name_11',
      description: 'Exampple description',
      email: 'test11@test.com',
      work: 'example work',
      age: 25.3
    }
    @name_repeated_age_str = {
      name: 'Example_name',
      description: 'Exampple description',
      email: 'test12@test.com',
      work: 'example work',
      age: 'a'
    }
    @mail_repeated_age_negative = {
      name: 'Example_name_13',
      description: 'Exampple description',
      email: 'test@test.com',
      work: 'example work',
      age: -25
    }
    @description_too_short = {
      name: 'Example_name_14',
      description: 'n',
      email: 'test14@test.com',
      work: 'example work',
      age: 25
    }
    @name_and_description_too_short = {
      name: '15',
      description: 'Examp',
      email: 'test15@test.com',
      work: 'example work',
      age: 25
    }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful request' do
      # Se le señala a Rails que se haga un GET a la ruta /profiles
      get '/users'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_new' do
    it 'should return a successful request' do
      get '/users/sign_in'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful request' do
      # Se crea una instancia de Profile
      @user = User.create!(@attr_user)
      # Se realiza un GET con el id del profile recién creado y
      # se espra que la salida sea un 200 que es lo mismo que un ok
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
    it 'should increase count of Profiles by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
      expect do
        post '/users', params: { user: @attr_user }
      end.to change(User, :count).by(1)
    end
    # No debería aumentar la cuenta porque
    # le estamos pasando un atributo inválido según las validaciones que se hicieron
    it 'should not increase count of Profiles' do
      expect do
        post '/users', params: { user: @invalid_attr_user }
      end.to change(User, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful request' do
      @user = User.create!(@attr_user)
      get '/users/edit'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Profile' do
      # Se crea el perfil donde se testeará el update
      @user = User.create!(@attr_user)

      expect do
        patch "/users/#{@user.id}", params: { user: { age: 40 } }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        @user.reload
        # Luego se revisa si cambió alguno de los atributos del usuario
      end.to change(@user, :attributes)
    end
  end

  describe 'update' do
    it 'should not change a Profile' do
      # Se crea el perfil donde se testeará el update
      @user = User.create!(@attr_user)

      expect do
        # Se realiza un patch dado que es de actualización de un usuario ya creado
        patch "/users/#{@user.id}", params: { user: @invalid_attr_user }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        @user.reload
      end.to_not change(@user, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Profiles by 1' do
      # Se crea el perfil donde se testeará el update
      @user = User.create!(@attr_user)
      expect do
        delete "/users/#{@user.id}"
      end.to change(User, :count).by(-1)
    end
  end
end
