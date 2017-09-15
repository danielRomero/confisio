puts 'seeds sections'
sections = [
  {
    title: 'fisioterapia',
    body: <<BODY
<p>En Confisio Fisioterapia y Osteopatía apostamos por devolver el equilibrio a tu cuerpo llevando a cabo el tratamiento desde un enfoque global, abordando todos los aspectos relevantes de tu vida.</p>

<p>Trabajamos no solo para eliminar el dolor, también para recuperar tus actividades deportivas, explotar al máximo tus capacidades físicas y laborales, y puedas dejar de pelearte con tu cuerpo.</p>

<p>Puedes evitar la sobremedicación, y con ello sus efectos secundarios. Puedes recuperarte en menos tiempo, sin dejar de hacer tu actividad. Puedes encontrar el motivo que creo tu malestar.</p>

<p>Puedes dejar tu cuerpo en mejores condiciones tras la lesión. No es sólo vivir más años, sino vivirlos con calidad.</p>

<p>Contamos con los mejores profesionales, colegiados y en constante formación. Especializados en Osteopatía, Posturología, y el tratamiento de Cefaleas y Migrañas.</p>

<p>Para nosotros es importante resolver tus dudas, que entiendas las causas del problema, para hacerte participe del tratamiento y evitar recaidas.</p>

<p>Desde Confisio clínica de Fisioterapia en Ciudad Lineal, 28027 (Madrid) te podemos ayudar.</p>
BODY
  },
  {
    title: 'psicología',
    body: <<BODY
<p>En Confisio Psicología estamos especializados en el ámbito clínico y de la salud. Trabajamos desde un enfoque Cognitivo-Conductual, con una mirada desde el Mindfullnes hasta la Psicología Positiva.</p>

<p>Entendemos el tratamiento psicológico como una vía a través de la cual las personas aprenden estrategias y herramientas útiles para afrontar sus dificultades y explotar al máximo los aspectos positivos de cada uno y de la vida.</p>

<p>Nuestro objetivo es convertir la terapia en un espacio de crecimiento personal, donde los pacientes a parte de aliviar su malestar, aprendan a quererse, disfrutar de lo que la vida les ofrece y exploten sus recursos para alcanzar sus metas y objetivos. Para ello ajustamos los tratamientos a las necesidades de cada persona, propiciamos un ambiente terapéutico cercano donde se van adaptando las técnicas y respetando los ritmos de cada uno.</p>

<p>Nuestros tratamientos están dirigidos tanto a población adulta como a población infanto-juvenil.</p>

<p>Desde esta perspectiva trabajamos:</p>

En adultos:

<ul>
<li>Depresión  otros trastornos del estado del ánimo</li>
<li>Ansiedad</li>
<li>Estrés</li>
<li>Problemas de pareja</li>
<li>Sexualidad</li>
<li>Trastornos de personalidad</li>
<li>Trastornos de la alimentación, obesidad</li>
<li>Insomnio</li>
<li>Adicciones (Drogas, ludopatía...)</li>
</ul>

En atención Infanto-Juvenil:
<ul>
<li>Depresión y otros trastornos del estado del ánimo</li>
<li>Ansiedad</li>
<li>Problemas de aprendizaje</li>
<li>Bullying y Ciberbullying</li>
<li>Problemas de conducta</li>
<li>TDA-H</li>
<li>Trastornos de la alimentación</li>
<li>Adicciones (Drogas, videojuegos...)</li>
</ul>
BODY
  },
  {
    title: 'podología',
    body: <<BODY
<p>Si tiene un problema en los pies o necesita unas buenas plantillas que le ayuden en la práctica de su deporte favorito y prevengan futuras lesiones, puede contactar con nosotros y conocer nuestros servicios.</p>

<p>Los callos, durezas, ojos de gallo, clavos ... son un engrosamineto excesivo de la piel,  en un punto determinado, debido a causas mecánicas. ¡No dude en tratar sus pies con profesionales titulados!</p>

<p>En la clínica de Fisioterapia y Podología Confisio en Ciudad Lineal, 28027 (Madrid) te podemos ayudar.</p>
BODY
  },
  {
    title: 'nutrición',
    body: <<BODY
<p>La dieta más equilibrada es aquella que resulta compatible con el mejor estado de salud para cada uno.</p>

<p>Cada uno tiene una constitución heredada que no puede cambiar pero sí mantener y sacarle el máximo rendimiento.</p>

<p>El equilibrio a través de una óptima alimentación consiste en elegir los alimentos más adecuados a la constitución y a la condición individual que nos acerquen lo máximo posible al estado de salud óptimo, evitando los que nos aleje del mismo.</p>

<p>En Confisio realizamos un estudio personalizado (porcentajes de grasa, músculo y líquido, patologías, dolencias,…) para obtener los mejores resultados y encontrar el equilibrio o llegar al objetivo de la manera más saludable.</p>

Nutrición personal y especializada: 
<ul>
<li>Pérdida o aumento de peso.</li>
<li>Nutrición deportiva. </li>
<li>Tratamiento de dolencias y afecciones digestivas (colesterol, diabetes, hígado graso, úlcera, colon irritable, hemorroides, etc.)</li>
<li>Depuración, drenaje y detoxificación del organismo para contribuir a un aumento de energía. </li>
</ul>

Junto con terapias complementarias: 
<ul>
<li>Iridología: estudio del organismo a través del iris.</li>
<li>Kinesiología: test de alimentos y suplementación para aportar al organismo lo que necesita.  </li>
<li>Auriculoterapia: estimulación de puntos en la oreja para alcanzar el equilibrio.</li>
</ul>


<p>En la clínica de Fisioterapia y Nutrición Confisio en Ciudad Lineal, 28027 (Madrid) te podemos ayudar.</p>
BODY
  }
]

sections.each { |s| Section.find_or_create_by(s) }

puts "#{Section.count} sections\n\n"
