# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

#https://stackoverflow.com/questions/53562171/seeding-profile-pictures-stored-in-s3-from-faker
def image_fetcher
    open(Faker::Avatar.image)
    rescue
    open("https://robohash.org/sitsequiquia.png?size=300x300&set=set1")
end


# generate 20 users
(1..20).each do |id|
      u = User.create(
# each user is assigned an id from 1-20 
      name: Faker::Name.name,
      email: Faker::Internet.unique.email,
      username: Faker::Internet.unique.username,
      age: rand(18..30),
      work: [:ingenieria, :comercial, :medicina, :arte, :derecho, :antropologia, :sicologia, :enfermeria, :geografia, :veterinaria, :nutricion, :matematica, :fisica, :quimica].sample,
# issue each user the same password
      password: "password", 
      password_confirmation: "password",
      )
    u.images.attach(
      io: image_fetcher,
      filename: "#{id}_tower.png",
      content_type: 'image/png'
    )
end

# create 10 publications in DB
(1..10).each do |id|
  Publication.create!(
# we have userIds between 1 and 20. Assign a publication to a user 
# randomly
      user_id: rand(1..20), 
      titulo:  ['Turno', 'te llevo', 'Turno lunes', 'Ida miercoles', 'Vuelta Jueves', 'ofrazco turno', 'unete', 'turno lo contador', 'viaje a SJ', 'Turno Ñuñoa', 'ofrezco ida', 'Turno martes', 'ida 3 cupos'].sample,
      punto_partida: ['San Joaquin', 'Lo Contador', 'Campus Oriente', 'Casa Central'].sample,
      punto_llegada: ['Pajaritos 123', 'El Cerro 1962', 'Estados Unidos 480', 'Bernardo OHiggins 1492', 'Los Claveles 4376', 'San Pedro 1195', 'Av Chile 12973', 'Las Americas 673', 'Pasaje Interior 998'].sample,
      fecha: Faker::Date.between(from: Date.today, to: '2023-01-01'),
      cupos: rand(1..5),
      radio: Faker::Number.between(from: 1.0, to: 6.0).round(1),
      comuna_partida: ["Santiago","Conchalí","Huechuraba","Independencia","Quilicura","Recoleta",
      "Renca","Las Condes","Lo Barnechea","Providencia","Vitacura","La Reina","Macul","Ñuñoa","Peñalolén","La Florida","La Granja",
      "El Bosque","La Cisterna","La Pintana","San Ramón","Lo Espejo","Pedro Aguirre Cerda","San Joaquín","San Miguel","Cerrillos",
      "Estación Central","Maipú","Cerro Navia","Lo Prado","Pudahuel","Quinta Normal"].sample,
      comuna_llegada: ["Santiago","Conchalí","Huechuraba","Independencia","Quilicura","Recoleta",
      "Renca","Las Condes","Lo Barnechea","Providencia","Vitacura","La Reina","Macul","Ñuñoa","Peñalolén","La Florida","La Granja",
      "El Bosque","La Cisterna","La Pintana","San Ramón","Lo Espejo","Pedro Aguirre Cerda","San Joaquín","San Miguel","Cerrillos",
      "Estación Central","Maipú","Cerro Navia","Lo Prado","Pudahuel","Quinta Normal"].sample,
      #hora: Faker::Time.between_dates(from: id.fecha, to: id.fecha + 1, period: :day),
  )
end

#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?