puts 'seeds discounts'
discounts = [
  # Fisioterapia
  {
    title: 'Bono 10 sesiones',
    valid_to: 1.year.from_now,
    value: 320.0,
    description: 'Las sesiones de los bonos se pueden ceder a familiares.',
    conditions: 'Descuento por 10 sesiones no acumulable a otras ofertas',
    section_id: 1
  },
  {
    title: 'Bono 5 sesiones',
    valid_to: 1.year.from_now,
    value: 175.0,
    description: 'Las sesiones de los bonos se pueden ceder a familiares.',
    conditions: 'Descuento por 5 sesiones no acumulable a otras ofertas',
    section_id: 1
  },
  {
    title: 'Traer amigos',
    valid_to: 1.year.from_now,
    value: 8.0,
    description: '',
    conditions: 'Descuento por sesión, no acumulables a otros descuentos u otras ofertas. ',
    section_id: 1
  },
  {
    title: 'Descuento en redes sociales',
    valid_to: 1.year.from_now,
    value: 6.0,
    description: "Reseña en <a href='https://www.google.es/search?q=Confisio,+Av.+de+Badajoz,+3,+28027+Madrid&ludocid=15265252100196118758#lrd=0xd422f31137e4ebb:0xd3d911e806f9b0e6,1'>Google</a> o amigo en <a href='https://www.facebook.com/clinicaconfisio/'>Facebook</a>",
    conditions: 'Descuento por sesión no acumulable a otras ofertas',
    section_id: 1
  },
  {
    title: 'Iberia',
    valid_to: 1.year.from_now,
    value: 6.0,
    description: '',
    conditions: 'Descuento por sesión, no acumulables a otros descuentos u otras ofertas. ',
    section_id: 1
  },
  {
    title: '20 minutos, Blue Media, Grupo Henneo',
    valid_to: 1.year.from_now,
    value: 6.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 1
  },
  {
    title: 'Club triatlon Molokai',
    valid_to: 1.year.from_now,
    value: 6.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 1
  },
  {
    title: 'Feuvert',
    valid_to: 1.year.from_now,
    value: 3.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 1
  },
  # Psicologia
  {
    title: 'Desempleados',
    valid_to: 1.year.from_now,
    value: 30.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 2
  },
  {
    title: 'Bono 4 sesiones',
    valid_to: 1.year.from_now,
    value: 160.0,
    description: '',
    conditions: 'Descuento por 4 sesiones, no acumulables a otros descuentos u otras ofertas.',
    section_id: 2
  },
  # Podologia
  {
    title: 'Tratamiento Papiloma 10 sesiones',
    valid_to: 1.year.from_now,
    value: 150.0,
    description: '',
    conditions: 'Descuento por 10 sesiones, no acumulables a otros descuentos u otras ofertas.',
    section_id: 3
  },
  {
    title: '8ª Sesión gratuita en un año',
    valid_to: 1.year.from_now,
    value: nil,
    description: '',
    conditions: 'Descuento por sesión, no acumulables a otros descuentos u otras ofertas.',
    section_id: 3
  },
  # Nutricion
  {
    title: 'Pacientes de Confisio',
    valid_to: 1.year.from_now,
    value: 50.0,
    description: '',
    conditions: 'Precio por sesión, no acumulables a otros descuentos u otras ofertas.',
    section_id: 4
  }
]

discounts.each do |d|
  dis = Discount.find_or_initialize_by(d.except(:valid_to))
  next unless dis.new_record?
  dis.valid_to = d[:valid_to]
  dis.save
end
puts "#{Discount.count} discounts\n\n"
