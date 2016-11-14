# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create(
    user_name: 'Hugo',
    email: 'hugo.martinez@polytechnique.edu',
    password: 'bonjour',
    first_name: 'hugo',
    last_name: 'martinez',
    location: 'Paris'
  )

  User.create(
    user_name: 'Etienne',
    email: 'etienne.marecal@polytechnique.edu',
    password: 'hello',
    first_name: 'etienne',
    last_name: 'marecal',
    location: 'Nantes'
  )

  User.create(
    user_name: 'Benjamin',
    email: 'benjamin.blanchard@gmail.com',
    password: 'workshop',
    first_name: 'benjamin',
    last_name: 'blanchard',
    location: 'Paris'
  )

  User.create(
    user_name: 'Candice',
    email: 'candice.cappa@gmail.com',
    password: 'windows',
    first_name: 'candice',
    last_name: 'cappa',
    location: 'Nantes'
  )

  Concert.create(
  	title: "Mon premier Show",
  	location: "Salle Pleyel",
  	description: "Concert blabla",
  	capacity: 500,
    price: 30,
    image: "http://www.sallepleyel.fr/img/visuel/diaporama/salle_concert_scene.jpg",
    date: "2014-10-30"
  )

  ConcertPreference.create(
      concert_id: 1,
      style_id: 1, #id Rock
      order: 1
  )

  Concert.create(
    title: "Sébastien Tellier",
    location: "Nouveau Casino",
    description: "L'Aventura",
    capacity: 500,
    price: 36,
    image: "http://www.gqmagazine.fr/uploads/images/201421/cc/l_aventura_de_s__bastien_tellier_7651.jpeg",
    date: "2014-10-19"
  )

  ConcertPreference.create(
    concert_id: 2,
    style_id: 2, #id Jazz
    order: 1
  )

#Ajout Rock
  # get JSON
  result = Net::HTTP.get(URI.parse('http://public.opendatasoft.com/api/records/1.0/search/?dataset=evenements-publics-cibul&facet=updated_at&facet=tags&facet=placename&facet=department&facet=region&facet=city&facet=date_start&facet=date_end&facet=pricing_info&refine.tags=rock'))

  # parse JSON
  json = JSON.parse(result)

  # save data to DB
  json['records'][1..-1].each do |data| # [1..-1] ignores first dummy element
    concert = Concert.create(
      title: data['fields']['title'],
      location: data['fields']['city'],
      description: data['fields']['description'],
      capacity: 500,
      price: 10,
      image: data['fields']['image'],
      date: data['fields']['date_start']
    )
    ConcertPreference.create(
      concert_id: concert.id,
      style_id: 1, #id Rock
      order: 1
    )
  end

#Ajout Jazz
  # get JSON
  resultJ = Net::HTTP.get(URI.parse('http://public.opendatasoft.com/api/records/1.0/search/?dataset=evenements-publics-cibul&facet=tags&facet=placename&facet=city&facet=date_start&facet=date_end&facet=pricing_info&refine.tags=jazz'))

  # parse JSON
  jsonJ = JSON.parse(resultJ)

  # save data to DB
  jsonJ['records'][1..-1].each do |data| # [1..-1] ignores first dummy element
    concertJ = Concert.create(
      title: data['fields']['title'],
      location: data['fields']['city'],
      description: data['fields']['description'],
      capacity: 500,
      price: 10,
      image: data['fields']['image'],
      date: data['fields']['date_start']
    )
    ConcertPreference.create(
      concert_id: concertJ.id,
      style_id: 2, #id Jazz
      order: 1
    )
  end

#Ajout Pop
  # get JSON
  resultP = Net::HTTP.get(URI.parse('http://public.opendatasoft.com/api/records/1.0/search/?dataset=evenements-publics-cibul&facet=city&facet=date_start&facet=pricing_info&facet=title&refine.tags=pop'))

  # parse JSON
  jsonP = JSON.parse(resultP)

  # save data to DB
  jsonP['records'][1..-1].each do |data| # [1..-1] ignores first dummy element
    concertP = Concert.create(
      title: data['fields']['title'],
      location: data['fields']['city'],
      description: data['fields']['description'],
      capacity: 500,
      price: 10,
      image: data['fields']['image'],
      date: data['fields']['date_start']
    )
    ConcertPreference.create(
      concert_id: concertP.id,
      style_id: 3, #id Pop
      order: 1
    )
  end

#Ajout Electro
  # get JSON
  resultE = Net::HTTP.get(URI.parse('http://public.opendatasoft.com/api/records/1.0/search/?dataset=evenements-publics-cibul&facet=city&facet=date_start&facet=pricing_info&facet=title&refine.tags=electro'))

  # parse JSON
  jsonE = JSON.parse(resultE)

  # save data to DB
  jsonE['records'][1..-1].each do |data| # [1..-1] ignores first dummy element
    concertE = Concert.create(
      title: data['fields']['title'],
      location: data['fields']['city'],
      description: data['fields']['description'],
      capacity: 500,
      price: 10,
      image: data['fields']['image'],
      date: data['fields']['date_start']
    )
    ConcertPreference.create(
      concert_id: concertE.id,
      style_id: 4, #id Electro
      order: 1
    )
  end
  MusicStyle.create(
    name: 'Rock',
    description: 'Le rock est un genre musical apparu dans les années 1950 aux États-Unis et qui s est développé en différents sous-genres à partir des années 1960, particulièrement aux États-Unis et au Royaume-Uni. Il prend ses racines dans le rock n roll des années 1940 et 1950, lui-même grandement influencé par le rhythm and blues et la country. Le rock a également beaucoup tiré d autres genres dont le folk, le blues, le jazz, la musique classique .'
  )

  MusicStyle.create(
    name: 'Jazz',
    description: 'Le jazz est un genre musical originaire du Sud des États-Unis, créé à la fin du xixe siècle et au début du xxe siècle au sein des communautés afro-américaines. Avec plus de cent ans d existence, du ragtime au jazz actuel, il recouvre de nombreux sous-genres marqués par un héritage de la musique euro-américaine et afro-américaine, et conçus pour être joués en public1. Il émerge à partir d autres genres musicaux, dont le ragtime, la marche, le negro spiritual et le blues, et comporte des caractéristiques telles que l utilisation fréquente de l improvisation, de la polyrythmie, de la syncope, du shuffle, du scat et des notes bleues2. En outre, il emprunte de nombreux éléments à la musique populaire américaine (en) et à la tradition des brass bands. Couramment associé aux cinq instruments emblématiques du jazz — le saxophone, la trompette, le trombone, la clarinette et le piano —, le jazz mobilise cependant un grand nombre d instruments différents, dont la guitare, la batterie, et la contrebasse.'
  )

  MusicStyle.create(
    name: 'Pop',
    description: 'La musique pop est un genre musical apparu dans les années 1960 aux États-Unis. Ces chansons parlent en général de l amour ou des relations entre les femmes et les hommes. Elle met l accent sur la chanson individuelle plutôt que sur l album, et utilise essentiellement des chansons courtes avec des rythmes associés à la danse1. La musique pop fut beaucoup influencée par les technologies, comme l enregistrement à pistes multiples (vers la fin des années 1960) et le synthétiseur (durant les années 1970 et 1980).'
  )

  MusicStyle.create(
    name: 'Electro',
    description: 'L electro (apocope d electro-funk ou electro-boogie) est un genre de musique électronique directement influencée par l utilisation d une boîte à rythmes TR-808 et de quelques samples dérivés du funk.'
  )

  UserPreference.create(
    user_id: 1,
    style_id: 1,
    order: 1
  )

  UserPreference.create(
    user_id: 1,
    style_id: 2,
    order: 2
  )

  UserPreference.create(
    user_id: 2,
    style_id: 2,
    order:1
  )

  UserPreference.create(
    user_id: 2,
    style_id: 4,
    order: 2
  )


  