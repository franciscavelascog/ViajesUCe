# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Publication, type: :model do
# pending "add some examples to (or delete) #{__FILE__}"
# end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publication, type: :model do
  # Todo lo que está dentro de este bloque se ejecutará una vez antes de cada it
  before(:each) do
    # Creamos una instancia de la clase publicación "a mano", sin una factory

    @user = User.new(name: 'A title 123', description: 'Description', email: 'mail@uc.cl', work: 'ingenier', age: 2,
                     password: '123123')
    @publication = @user.publications.build(titulo: 'A title 12345', punto_partida: 'Punto de Partida Turno',
                                            punto_llegada: 'Punto de Llegada Turno', fecha: '2022-05-11T17:52',
                                            cupos: 2, radio: 1.5, user_id: @user.id)
    # @publication = Publication.new(titulo: 'A title 12345', punto_partida: 'Punto de Partida Turno',
    #                                punto_llegada: 'Punto de Llegada Turno', fecha: '2022-05-11T17:52',
    #                                cupos: 2, radio: 1.5, user_id: @user.id)
    @publication.user = @user
    current_user = @user
    # @publication.user_id = @user.id
  end

  it 'is valid with valid attributes' do
    expect(@publication).to be_valid
  end

  it 'is not valid with no title' do
    @publication.titulo = nil
    expect(@publication).not_to be_valid
  end

  it 'is not valid with a title too short' do
    @publication.titulo = 'aa'
    expect(@publication).not_to be_valid
  end

  it 'is not valid with no punto de partida' do
    @publication.punto_partida = nil
    expect(@publication).not_to be_valid
  end

  it 'is not valid with a punto de partida too short' do
    @publication.punto_partida = 'a'
    expect(@publication).not_to be_valid
  end

  it 'is not valid with no punto de llegada' do
    @publication.punto_llegada = nil
    expect(@publication).not_to be_valid
  end

  it 'is not valid with a punto de llegada too short' do
    @publication.punto_llegada = 'a'
    expect(@publication).not_to be_valid
  end
end
