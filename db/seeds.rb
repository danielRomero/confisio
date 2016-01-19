# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Generating seed...\n"

description = 'Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.'

## FISIOTERAPIA
puts 'Fisioterapia:'
puts 'section failed' if !(section = Section.find_or_create_by(name: 'Fisioterapia'))
setting = section.setting || Setting.new(email: 'confianzayfisioterapia@gmail.com', section: section)
setting.description ||= description
setting.base_price ||= 38
#section.setting = Setting.new(email: 'confianzayfisioterapia@gmail.com') #if !section.setting
puts 'setting failed' if !setting.save

## PSICOLOGIA
puts 'Psicología:'
puts 'section failed' if !(section = Section.find_or_create_by(name: 'Psicología'))
setting = section.setting || Setting.new(email: 'confisiopsi@gmail.com')
setting.description ||= description
setting.base_price ||= 48
puts 'setting failed' if !setting.save

app_configuration_images = %w(http://res.cloudinary.com/confisio/image/upload/v1433795114/landing_equipo_1_pslvvq.jpg http://res.cloudinary.com/confisio/image/upload/v1434033298/IMG_20150528_142811_zlfr94.jpg http://res.cloudinary.com/confisio/image/upload/v1433794588/landing_camilla_1_pqbmzp.jpg http://res.cloudinary.com/confisio/image/upload/v1433794672/landing_logo_1_esgxyy.png http://res.cloudinary.com/confisio/image/upload/v1433794802/landing_sofa_1_izqrzy.jpg)

puts 'failed app config' if !(app_configuration = AppConfiguration.find_or_create_by(telefono_fijo: '918273320', telefono_movil: '664476055', calle: 'Avenida de Badajoz', numero: '3', cp: '28027', ciudad: 'Madrid', email: 'confianzayfisioterapia@gmail.com', metro: 'Barrio de la concepción', barrio: 'San Pascual, Ciudad Lineal, Arturo Soria'))
if app_configuration.landing_images.empty?
  app_configuration.landing_images = app_configuration_images
  puts 'failed load images app config' if !app_configuration.save
end

puts 'Creating users...'

u = User.find_or_initialize_by(email: "confianzayfisioterapia@gmail.com")
if u.new_record?
  u.name = "Rodrigo"
  u.surname = "Guerrero Corral"
  u.section_id = Section.find_by(name: 'Fisioterapia').id
  u.gender = "Male"
  u.rank = 5
  u.cv = "Your CV HERE"
  u.avatar_url = "http://res.cloudinary.com/confisio/image/upload/v1434194403/empleados/rodrigo_2.jpg"
  u.contact_email = "confianzayfisioterapia@gmail.com"
  u.contact_phone = "918 27 33 20"
  u.degree = "Fisioterapeuta"
  u.specialty = "Osteópata, Posturólogo"
  u.password= "123456"
  u.password_confirmation= "123456"
  u.save!
end

u = User.find_or_initialize_by(email: "carlossalasmr@gmail.com")
if u.new_record?
  u.name = "Carlos"
  u.surname = "Salas Merino"
  u.section_id = Section.find_by(name: 'Psicología').id
  u.gender = "Male"
  u.rank = 5
  u.cv = "Your CV HERE"
  u.avatar_url = "http://res.cloudinary.com/confisio/image/upload/v1434192996/empleados/carlos_2.jpg"
  u.contact_email = "confisiopsi@gmail.com"
  u.contact_phone = "918 27 33 20"
  u.degree = "Psicólogo Sanitario"
  u.specialty = "Especializado en Psicología Clínica y de la salud y en Terapia Cognitivo-Conductual"
  u.password= "123456"
  u.password_confirmation= "123456"
  u.save!
end

u = User.find_or_initialize_by(email: "inessantosmartinez@gmail.com")
if u.new_record?
  u.name = "Inés"
  u.surname = "Santos Martínez"
  u.section_id = Section.find_by(name: 'Psicología').id
  u.gender = "Female"
  u.rank = 5
  u.cv = "Your CV HERE"
  u.avatar_url = "http://res.cloudinary.com/confisio/image/upload/v1433876735/empleados/ines_1.jpg"
  u.contact_email = "confisiopsi@gmail.com"
  u.contact_phone = "918 27 33 20"
  u.degree = "Psicóloga Sanitaria"
  u.specialty = "Especializada en Psicología Clínica y de la salud y en Intervención Clínica Infanto-Juvenil"
  u.password= "123456"
  u.password_confirmation= "123456"
  u.save!
end

u = User.find_or_initialize_by(email: "danirocklabel@gmail.com")
u.name = "Daniel"
u.surname = "Romero Esteban"
u.gender = "Male"
u.rank = 5
u.cv = nil
u.avatar_url = nil
u.contact_email = nil
u.contact_phone = nil
u.degree = nil
u.specialty = nil
u.password= "123456" if u.new_record?
u.password_confirmation= "123456" if u.new_record?
u.save!

Section.all.each do |section|
  section.posts.where(user_id: nil).each do |post|
    if section.name == "Psicología"
      post.update_attributes!(user_id: User.find_by(name: "Carlos").id)
    else
      post.update_attributes!(user_id: User.find_by(name: "Rodrigo").id)
    end
  end
end


puts "Users created, total: #{User.count} -- Names: #{User.all.pluck(:name)}"

puts "\nseed finished"