puts 'seeds prices'
prices = [
  # fisioterapia
  {
    name: 'Sesión',
    value: 38,
    session_duration: '01:00',
    from: false,
    not_other_discounts: false,
    section_id: 1
  },
  {
    name: 'Masaje',
    value: '18',
    session_duration: '00:20',
    from: false,
    not_other_discounts: true,
    section_id: 1
  },
  # psicologia
  {
    name: 'Sesión individual',
    value: 48,
    session_duration: '01:00',
    from: false,
    not_other_discounts: false,
    section_id: 2
  },
  {
    name: 'Terapia de pareja',
    value: 60,
    session_duration: nil,
    from: false,
    not_other_discounts: false,
    section_id: 2
  },
  {
    name: 'Primera sesión informativa',
    value: 0,
    session_duration: nil,
    from: false,
    not_other_discounts: false,
    section_id: 2
  },
  # Podologia
  {
    name: 'Consulta',
    value: 24,
    session_duration: nil,
    from: false,
    not_other_discounts: false,
    section_id: 3
  },
  {
    name: 'Papiloma',
    value: 24,
    session_duration: nil,
    from: false,
    not_other_discounts: false,
    section_id: 3
  },
  {
    name: 'Quiropodia',
    value: 24,
    session_duration: nil,
    from: false,
    not_other_discounts: false,
    section_id: 3
  },
  {
    name: 'Plantillas',
    value: 140,
    session_duration: nil,
    from: true,
    not_other_discounts: false,
    section_id: 3
  },
  # nutricion
  {
    name: 'Sesión',
    value: 60,
    session_duration: nil,
    from: false,
    not_other_discounts: false,
    section_id: 4
  }
]

prices.each { |p| Price.find_or_create_by(p) }
puts "#{Price.count} prices\n\n"
