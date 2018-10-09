restaurant = Restaurant.create(name: 'Taco Heaven',
                               price_level: 1,
                               rating: 3,
                               address1: '123 Anywhere Lane',
                               city: 'Oklahoma City',
                               state: 'OK',
                               zipcode: '73120',
                               phone: '405-555-1234')             
restaurant.reviews.create(username: 'joebob',
                          body: 'This place has some dang good tacos, bo',
                          rating: 5)
restaurant.reviews.create(username: 'jimbob',
                          body: 'The tacos are a lie. They are really tires covered in cheese.',
                          rating: 1)

restaurant = Restaurant.create(name: 'Pho Bruh Noodle Hut',
                               price_level: 2,
                               rating: 4,
                               address1: '123 Nowhere Lane',
                               city: 'Oklahoma City',
                               state: 'OK',
                               zipcode: '73120',
                               phone: '405-555-5678')             
restaurant.reviews.create(username: 'phoreal',
                          body: 'Best noodles, hands down. But service is slow.',
                          rating: 4)
restaurant.reviews.create(username: 'poodlemama3',
                          body: 'My Poodle, Mr. Poodles, loves this place.',
                          rating: 4)

restaurant = Restaurant.create(name: 'Confuzed Thai Mexican Canadian Fusion',
                               price_level: 5,
                               rating: 2,
                               address1: '123 Inyadreams Lane',
                               city: 'Oklahoma City',
                               state: 'OK',
                               zipcode: '73120',
                               phone: '405-555-1111')             
restaurant.reviews.create(username: 'pretentioushispter42',
                          body: 'mind. blown.',
                          rating: 5)
restaurant.reviews.create(username: 'wha',
                          body: 'Bruh. Srsly. What?',
                          rating: 1)
restaurant.reviews.create(username: 'blegh',
                          body: 'I don\'t know what to think of the level 5 spicy poutine quesadilla curry.',
                          rating: 1)


