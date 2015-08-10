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
#section.setting = Setting.new(email: 'confianzayfisioterapia@gmail.com') #if !section.setting
puts 'setting failed' if !setting.save

## PSICOLOGIA
puts 'Psicología:'
puts 'section failed' if !(section = Section.find_or_create_by(name: 'Psicología'))
setting = section.setting || Setting.new(email: 'confisiopsi@gmail.com')
setting.description ||= description
puts 'setting failed' if !setting.save

app_configuration_images = %w(http://res.cloudinary.com/confisio/image/upload/v1433795114/landing_equipo_1_pslvvq.jpg http://res.cloudinary.com/confisio/image/upload/v1434033298/IMG_20150528_142811_zlfr94.jpg http://res.cloudinary.com/confisio/image/upload/v1433794588/landing_camilla_1_pqbmzp.jpg http://res.cloudinary.com/confisio/image/upload/v1433794672/landing_logo_1_esgxyy.png http://res.cloudinary.com/confisio/image/upload/v1433794802/landing_sofa_1_izqrzy.jpg)

puts 'failed app config' if !(app_configuration = AppConfiguration.find_or_create_by(telefono_fijo: '918273320', telefono_movil: '664476055', calle: 'Avenida de Badajoz', numero: '3', cp: '28027', ciudad: 'Madrid', email: 'confianzayfisioterapia@gmail.com'))
if app_configuration.landing_images.empty?
  app_configuration.landing_images = app_configuration_images
  puts 'failed load images app config' if !app.configuration.save
end

puts "\nseed finished"