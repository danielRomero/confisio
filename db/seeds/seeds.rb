sections = [
  {
    title: 'fisioterapia',
    body: 'Officia culpa cupidatat voluptate amet ut consequat fugiat sed occaecat deserunt ullamco ut veniam officia enim tempor ullamco pariatur aliquip tempor enim ullamco dolor mollit amet laborum ad.'
  },
  {
    title: 'psicología',
    body: 'Officia culpa cupidatat voluptate amet ut consequat fugiat sed occaecat deserunt ullamco ut veniam officia enim tempor ullamco pariatur aliquip tempor enim ullamco dolor mollit amet laborum ad.'
  },
  {
    title: 'nutrición',
    body: 'Officia culpa cupidatat voluptate amet ut consequat fugiat sed occaecat deserunt ullamco ut veniam officia enim tempor ullamco pariatur aliquip tempor enim ullamco dolor mollit amet laborum ad.'
  },
  {
    title: 'podología',
    body: 'Officia culpa cupidatat voluptate amet ut consequat fugiat sed occaecat deserunt ullamco ut veniam officia enim tempor ullamco pariatur aliquip tempor enim ullamco dolor mollit amet laborum ad.'
  }
]
begin
  Section.create(sections)
rescue; end

prices = [
  {
    name: 'Sesión',
    value: 58,
    session_duration: '01:00',
    from: false,
    not_other_discounts: false,
    section_id: 1
  },
  {
    name: 'Masaje',
    value: '00:30',
    session_duration: 30.minutes,
    from: false,
    not_other_discounts: true,
    section_id: 1
  },
  {
    name: 'Terapia de pareja',
    value: 10,
    session_duration: nil,
    from: true,
    not_other_discounts: false,
    section_id: 2
  },
  {
    name: 'Estudio nutricional',
    value: 50,
    session_duration: nil,
    from: false,
    not_other_discounts: false,
    section_id: 3
  },
  {
    name: 'Plantillas',
    value: 150,
    session_duration: nil,
    from: true,
    not_other_discounts: false,
    section_id: 4
  },
  {
    name: 'Consulta',
    value: 40,
    session_duration: '00:30',
    from: false,
    not_other_discounts: false,
    section_id: 4
  }
]
begin
  Price.create(prices)
rescue; end


discounts = [
  {
    title: 'Descuento en terapia de pareja',
    valid_to: 1.year.from_now,
    value: 3.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 1
  },
  {
    title: 'Descuento en terapia de parejas',
    valid_to: 1.year.from_now,
    value: 3.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 1
  },
  {
    title: 'Descuento en terapia de pareja',
    valid_to: 1.year.from_now,
    value: 3.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 2
  },
  {
    title: 'Descuento en terapia de pareja',
    valid_to: 1.year.from_now,
    value: 3.0,
    description: '',
    conditions: 'Descuento por sesión no acumulable a otras ofertas',
    section_id: 3
  },
  {
    title: 'Descuento en terapia de pareja',
    valid_to: 1.year.from_now,
    value: 3.0,
    description: '',
    conditions: 'Descuento no acumulable a otras ofertas',
    section_id: 4
  }
]

Discount.create!(discounts)

posts = [
  {
    section_id: 1,
    title: 'Título molón del post 1',
    body: 'Aliqua eu officia nulla ut aute aute ex ad qui fugiat tempor do anim velit non aliquip nulla et deserunt proident deserunt mollit dolor cupidatat magna aliquip ut elit cupidatat in ut ut ut sit amet laboris reprehenderit anim dolor cupidatat et et laborum ea adipisicing anim commodo sed velit do laborum non aliqua esse enim dolor aute cupidatat nulla in ex excepteur dolor cillum mollit dolore magna magna ut magna dolore deserunt eu sed do magna aute velit adipisicing in elit proident minim veniam incididunt sit sunt irure deserunt est anim adipisicing anim elit ut fugiat laboris reprehenderit reprehenderit aute sunt aute aliqua laborum eu duis dolor pariatur laboris incididunt aute reprehenderit nostrud anim fugiat aliqua consequat sed qui velit veniam tempor nulla velit deserunt mollit id sunt mollit mollit elit consequat exercitation in fugiat nostrud exercitation deserunt qui incididunt pariatur qui ad laborum ea aliqua sint laboris magna pariatur ea reprehenderit anim ex excepteur reprehenderit labore ullamco occaecat nisi sit adipisicing irure aute ullamco elit id in adipisicing aliquip occaecat nisi id quis id aliquip commodo in aliqua quis enim amet non labore velit esse consectetur aliquip occaecat minim qui anim deserunt occaecat amet ullamco tempor sunt do ut occaecat culpa esse sunt eu et minim culpa ut id dolor cillum non sed officia labore irure aliquip duis cupidatat officia ut cupidatat id dolor.'
  },
  {
    section_id: 1,
    title: 'Esse exercitation exercitation aute in ex minim aliqua in anim dolore in minim dolore esse ullamco occaecat in.',
    body: 'Aliqua eu officia nulla ut aute aute ex ad qui fugiat tempor do anim velit non aliquip nulla et deserunt proident deserunt mollit dolor cupidatat magna aliquip ut elit cupidatat in ut ut ut sit amet laboris reprehenderit anim dolor cupidatat et et laborum ea adipisicing anim commodo sed velit do laborum non aliqua esse enim dolor aute cupidatat nulla in ex excepteur dolor cillum mollit dolore magna magna ut magna dolore deserunt eu sed do magna aute velit adipisicing in elit proident minim veniam incididunt sit sunt irure deserunt est anim adipisicing anim elit ut fugiat laboris reprehenderit reprehenderit aute sunt aute aliqua laborum eu duis dolor pariatur laboris incididunt aute reprehenderit nostrud anim fugiat aliqua consequat sed qui velit veniam tempor nulla velit deserunt mollit id sunt mollit mollit elit consequat exercitation in fugiat nostrud exercitation deserunt qui incididunt pariatur qui ad laborum ea aliqua sint laboris magna pariatur ea reprehenderit anim ex excepteur reprehenderit labore ullamco occaecat nisi sit adipisicing irure aute ullamco elit id in adipisicing aliquip occaecat nisi id quis id aliquip commodo in aliqua quis enim amet non labore velit esse consectetur aliquip occaecat minim qui anim deserunt occaecat amet ullamco tempor sunt do ut occaecat culpa esse sunt eu et minim culpa ut id dolor cillum non sed officia labore irure aliquip duis cupidatat officia ut cupidatat id dolor.'
  },
  {
    section_id: 2,
    title: 'Lorem ipsum tempor magna culpa irure occaecat sint et quis commodo voluptate ea cupidatat voluptate.',
    body: 'Aliqua eu officia nulla ut aute aute ex ad qui fugiat tempor do anim velit non aliquip nulla et deserunt proident deserunt mollit dolor cupidatat magna aliquip ut elit cupidatat in ut ut ut sit amet laboris reprehenderit anim dolor cupidatat et et laborum ea adipisicing anim commodo sed velit do laborum non aliqua esse enim dolor aute cupidatat nulla in ex excepteur dolor cillum mollit dolore magna magna ut magna dolore deserunt eu sed do magna aute velit adipisicing in elit proident minim veniam incididunt sit sunt irure deserunt est anim adipisicing anim elit ut fugiat laboris reprehenderit reprehenderit aute sunt aute aliqua laborum eu duis dolor pariatur laboris incididunt aute reprehenderit nostrud anim fugiat aliqua consequat sed qui velit veniam tempor nulla velit deserunt mollit id sunt mollit mollit elit consequat exercitation in fugiat nostrud exercitation deserunt qui incididunt pariatur qui ad laborum ea aliqua sint laboris magna pariatur ea reprehenderit anim ex excepteur reprehenderit labore ullamco occaecat nisi sit adipisicing irure aute ullamco elit id in adipisicing aliquip occaecat nisi id quis id aliquip commodo in aliqua quis enim amet non labore velit esse consectetur aliquip occaecat minim qui anim deserunt occaecat amet ullamco tempor sunt do ut occaecat culpa esse sunt eu et minim culpa ut id dolor cillum non sed officia labore irure aliquip duis cupidatat officia ut cupidatat id dolor.'
  },
  {
    section_id: 2,
    title: 'Lorem ipsum enim pariatur elit est dolore incididunt ad dolore labore excepteur minim dolor ea fugiat reprehenderit duis.',
    body: 'Aliqua eu officia nulla ut aute aute ex ad qui fugiat tempor do anim velit non aliquip nulla et deserunt proident deserunt mollit dolor cupidatat magna aliquip ut elit cupidatat in ut ut ut sit amet laboris reprehenderit anim dolor cupidatat et et laborum ea adipisicing anim commodo sed velit do laborum non aliqua esse enim dolor aute cupidatat nulla in ex excepteur dolor cillum mollit dolore magna magna ut magna dolore deserunt eu sed do magna aute velit adipisicing in elit proident minim veniam incididunt sit sunt irure deserunt est anim adipisicing anim elit ut fugiat laboris reprehenderit reprehenderit aute sunt aute aliqua laborum eu duis dolor pariatur laboris incididunt aute reprehenderit nostrud anim fugiat aliqua consequat sed qui velit veniam tempor nulla velit deserunt mollit id sunt mollit mollit elit consequat exercitation in fugiat nostrud exercitation deserunt qui incididunt pariatur qui ad laborum ea aliqua sint laboris magna pariatur ea reprehenderit anim ex excepteur reprehenderit labore ullamco occaecat nisi sit adipisicing irure aute ullamco elit id in adipisicing aliquip occaecat nisi id quis id aliquip commodo in aliqua quis enim amet non labore velit esse consectetur aliquip occaecat minim qui anim deserunt occaecat amet ullamco tempor sunt do ut occaecat culpa esse sunt eu et minim culpa ut id dolor cillum non sed officia labore irure aliquip duis cupidatat officia ut cupidatat id dolor.'
  },
  {
    section_id: 3,
    title: 'Cupidatat irure anim enim non est nulla id quis irure id minim nostrud ut dolore.',
    body: 'Aliqua eu officia nulla ut aute aute ex ad qui fugiat tempor do anim velit non aliquip nulla et deserunt proident deserunt mollit dolor cupidatat magna aliquip ut elit cupidatat in ut ut ut sit amet laboris reprehenderit anim dolor cupidatat et et laborum ea adipisicing anim commodo sed velit do laborum non aliqua esse enim dolor aute cupidatat nulla in ex excepteur dolor cillum mollit dolore magna magna ut magna dolore deserunt eu sed do magna aute velit adipisicing in elit proident minim veniam incididunt sit sunt irure deserunt est anim adipisicing anim elit ut fugiat laboris reprehenderit reprehenderit aute sunt aute aliqua laborum eu duis dolor pariatur laboris incididunt aute reprehenderit nostrud anim fugiat aliqua consequat sed qui velit veniam tempor nulla velit deserunt mollit id sunt mollit mollit elit consequat exercitation in fugiat nostrud exercitation deserunt qui incididunt pariatur qui ad laborum ea aliqua sint laboris magna pariatur ea reprehenderit anim ex excepteur reprehenderit labore ullamco occaecat nisi sit adipisicing irure aute ullamco elit id in adipisicing aliquip occaecat nisi id quis id aliquip commodo in aliqua quis enim amet non labore velit esse consectetur aliquip occaecat minim qui anim deserunt occaecat amet ullamco tempor sunt do ut occaecat culpa esse sunt eu et minim culpa ut id dolor cillum non sed officia labore irure aliquip duis cupidatat officia ut cupidatat id dolor.'
  },
  {
    section_id: 4,
    title: 'Fugiat dolor officia velit est do exercitation veniam eiusmod duis quis occaecat qui nulla ea sit esse.',
    body: 'Aliqua eu officia nulla ut aute aute ex ad qui fugiat tempor do anim velit non aliquip nulla et deserunt proident deserunt mollit dolor cupidatat magna aliquip ut elit cupidatat in ut ut ut sit amet laboris reprehenderit anim dolor cupidatat et et laborum ea adipisicing anim commodo sed velit do laborum non aliqua esse enim dolor aute cupidatat nulla in ex excepteur dolor cillum mollit dolore magna magna ut magna dolore deserunt eu sed do magna aute velit adipisicing in elit proident minim veniam incididunt sit sunt irure deserunt est anim adipisicing anim elit ut fugiat laboris reprehenderit reprehenderit aute sunt aute aliqua laborum eu duis dolor pariatur laboris incididunt aute reprehenderit nostrud anim fugiat aliqua consequat sed qui velit veniam tempor nulla velit deserunt mollit id sunt mollit mollit elit consequat exercitation in fugiat nostrud exercitation deserunt qui incididunt pariatur qui ad laborum ea aliqua sint laboris magna pariatur ea reprehenderit anim ex excepteur reprehenderit labore ullamco occaecat nisi sit adipisicing irure aute ullamco elit id in adipisicing aliquip occaecat nisi id quis id aliquip commodo in aliqua quis enim amet non labore velit esse consectetur aliquip occaecat minim qui anim deserunt occaecat amet ullamco tempor sunt do ut occaecat culpa esse sunt eu et minim culpa ut id dolor cillum non sed officia labore irure aliquip duis cupidatat officia ut cupidatat id dolor.'
  }
]
Post.create!(posts)
