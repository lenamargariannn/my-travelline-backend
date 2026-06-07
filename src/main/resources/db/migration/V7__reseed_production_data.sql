-- V7__reseed_production_data.sql
-- Replace all placeholder seed content with production-quality data.
-- Admin user is preserved. Sequences are reset so IDs start from 1.

-- =========================================================
-- 1. Clear all content (order respects FK constraints)
-- =========================================================
DELETE FROM translations;
DELETE FROM review;
DELETE FROM booking;
DELETE FROM gallery_image;
DELETE FROM tour;          -- cascades to tour_image, tour_itinerary_day
DELETE FROM blog_post;
DELETE FROM category;
DELETE FROM destination;

ALTER SEQUENCE category_id_seq RESTART WITH 1;
ALTER SEQUENCE destination_id_seq RESTART WITH 1;
ALTER SEQUENCE tour_id_seq RESTART WITH 1;
ALTER SEQUENCE tour_itinerary_day_id_seq RESTART WITH 1;
ALTER SEQUENCE tour_image_id_seq RESTART WITH 1;
ALTER SEQUENCE blog_post_id_seq RESTART WITH 1;
ALTER SEQUENCE review_id_seq RESTART WITH 1;
ALTER SEQUENCE gallery_image_id_seq RESTART WITH 1;
ALTER SEQUENCE translations_id_seq RESTART WITH 1;
ALTER SEQUENCE booking_id_seq RESTART WITH 1;

-- =========================================================
-- 2. Categories
-- =========================================================
INSERT INTO category (name, slug, description, cover_image, active) VALUES
('Beach & Island',  'beach',     'Sun-soaked beach holidays and tropical island escapes',             'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80&auto=format&fit=crop', true),
('Honeymoon',       'honeymoon', 'Romantic getaways crafted for couples celebrating their love',       'https://images.unsplash.com/photo-1518998053901-5348d3961a04?w=800&q=80&auto=format&fit=crop', true),
('Adventure',       'adventure', 'Thrilling expeditions for those who seek the extraordinary',         'https://images.unsplash.com/photo-1551632811-561732d1e306?w=800&q=80&auto=format&fit=crop', true),
('Cultural',        'cultural',  'Immersive journeys into history, art, and local traditions',         'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800&q=80&auto=format&fit=crop', true),
('City Break',      'city-break','Short escapes to the world''s most exciting and vibrant cities',    'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=800&q=80&auto=format&fit=crop', true),
('Family',          'family',    'Memorable family holidays designed for all ages',                    'https://images.unsplash.com/photo-1502086223501-7ea6ecd79368?w=800&q=80&auto=format&fit=crop', true);

-- =========================================================
-- 3. Destinations
-- =========================================================
INSERT INTO destination (name, slug, country, description, cover_image, active) VALUES
(
    'Maldives', 'maldives', 'Maldives',
    'A necklace of 1,200 coral islands scattered across the Indian Ocean — the Maldives is the world''s ultimate island escape. Expect overwater villas, house reefs teeming with sea turtles, and sunsets that set the entire horizon on fire.',
    'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&q=80&auto=format&fit=crop',
    true
),
(
    'Bali', 'bali', 'Indonesia',
    'Bali is the Island of the Gods for good reason. Sacred Hindu temples rise from emerald rice terraces, world-class surf breaks meet white-sand beaches, and the warmth of Balinese culture permeates every corner of island life.',
    'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&q=80&auto=format&fit=crop',
    true
),
(
    'Dubai', 'dubai', 'UAE',
    'Dubai defies imagination — a futuristic skyline rising from the desert, record-breaking architecture, world-class shopping, and golden desert dunes all within a single city. Add pristine beaches and year-round sunshine and the result is irresistible.',
    'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800&q=80&auto=format&fit=crop',
    true
),
(
    'Santorini', 'santorini', 'Greece',
    'Formed by one of the largest volcanic eruptions in human history, Santorini''s dramatic caldera, iconic white-washed villages, and legendary sunsets make it one of the most photographed — and most magical — places on earth.',
    'https://images.unsplash.com/photo-1507501336603-6260d4b3f430?w=800&q=80&auto=format&fit=crop',
    true
),
(
    'Paris', 'paris', 'France',
    'The City of Light needs no introduction. Paris rewards visitors with world-class museums, timeless architecture, extraordinary cuisine, and an unmatched atmosphere of romance and intellectual energy that has inspired artists for centuries.',
    'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800&q=80&auto=format&fit=crop',
    true
),
(
    'Phuket', 'phuket', 'Thailand',
    'Thailand''s largest island combines spectacular beaches, vibrant nightlife, ancient Buddhist temples, and a warm, welcoming culture. Whether you want to island-hop by longtail boat or simply unwind on a powdery shore, Phuket delivers.',
    'https://images.unsplash.com/photo-1589394815804-964ed0be2eb5?w=800&q=80&auto=format&fit=crop',
    true
),
(
    'Tbilisi', 'tbilisi', 'Georgia',
    'Georgia''s ancient capital is one of the Caucasus'' best-kept secrets. Tbilisi blends medieval fortresses, sulphur-bath districts, and a thriving food and wine scene, all framed by the dramatic backdrop of the Caucasus Mountains.',
    'https://images.unsplash.com/photo-1565008576549-57569a49371d?w=800&q=80&auto=format&fit=crop',
    true
),
(
    'Kyoto', 'kyoto', 'Japan',
    'Japan''s ancient imperial capital is a living museum. Seventeen UNESCO World Heritage Sites, thousands of temples and shrines, geisha districts, bamboo groves, and a deeply refined aesthetic make Kyoto one of the most culturally rich cities on earth.',
    'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80&auto=format&fit=crop',
    true
);

-- =========================================================
-- 4. Tours
-- =========================================================
INSERT INTO tour (slug, title, summary, description, price, currency, duration_days, max_group_size, cover_image, featured, status, category_id, destination_id) VALUES

-- 1. Maldives Honeymoon
(
    'maldives-honeymoon-escape',
    'Maldives Honeymoon Escape',
    'Overwater villas, private beach dinners, and coral reef snorkelling — the Maldives honeymoon you have always pictured.',
    '<p>Begin your married life in one of the most breathtaking places on earth. This 6-day honeymoon package places you in a private overwater villa with a glass floor panel revealing the turquoise lagoon below. Every morning you wake to the sound of the ocean; every evening ends with a private candlelit dinner on a sandbank under a canopy of stars.</p>
<p>During the day, snorkel with manta rays and reef sharks over pristine coral gardens, or simply float in your private infinity pool watching flying fish leap from the water. A couples'' spa session using traditional Maldivian botanicals is included on day three — a deeply restorative experience you will long remember.</p>
<p>Our dedicated honeymoon concierge handles every detail: airport transfers by seaplane, in-villa champagne on arrival, personalised excursions, and special touches throughout. This is the honeymoon that exceeds the dream.</p>',
    2899.00, 'USD', 6, 2,
    'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'honeymoon'),
    (SELECT id FROM destination WHERE slug = 'maldives')
),

-- 2. Bali Complete Experience
(
    'bali-complete-experience',
    'Bali Complete Experience',
    'Volcanic treks, ancient temples, jungle rafting, and pristine beaches — everything Bali has to offer in one perfect week.',
    '<p>Bali is a destination of extraordinary contrasts, and this 8-day tour is designed to show you all of them. Begin in the artistic heartland of Ubud: explore rice terraces carved from hillsides over centuries, visit the sacred Monkey Forest, and watch a mesmerising Kecak fire-dance ceremony at sunset.</p>
<p>Mid-week, challenge yourself with a pre-dawn ascent of the active volcano Mount Batur — reaching the summit just as the sun breaks the horizon over the clouds is a transformative experience. Then trade altitude for adrenaline with white-water rafting through the deep jungle gorge of the Ayung River.</p>
<p>The final days take you south to Seminyak and Uluwatu: iconic beach clubs, world-class surf, the clifftop Uluwatu Temple with its dramatic ocean views, and a private Balinese cooking class with a local family. Bali in full.</p>',
    1399.00, 'USD', 8, 12,
    'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'adventure'),
    (SELECT id FROM destination WHERE slug = 'bali')
),

-- 3. Dubai City & Desert
(
    'dubai-city-desert',
    'Dubai City & Desert',
    'World records by day, golden dunes by sunset — experience Dubai''s extraordinary contrast of futuristic city and ancient desert.',
    '<p>Dubai is a city of superlatives, and this 5-day tour takes you to the very best of them. Stand at the top of the Burj Khalifa — the world''s tallest building — as the city spreads below you to the horizon. Explore the labyrinthine old Gold and Spice Souks by the Dubai Creek before crossing to the gleaming towers of Deira by traditional abra.</p>
<p>No Dubai visit is complete without the desert. On day three, your 4x4 convoy heads into the red dunes of the Arabian Desert for dune bashing, camel riding, and a lavish dinner in a Bedouin camp beneath the stars, complete with live music and falconry. The contrast with the city you left hours earlier is startling and unforgettable.</p>
<p>Shop at the world''s largest mall, swim at JBR Beach, and take a Dubai Marina cruise at night. This tour gives you the full Dubai picture — every fascinating, extravagant layer of it.</p>',
    1199.00, 'USD', 5, 15,
    'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'city-break'),
    (SELECT id FROM destination WHERE slug = 'dubai')
),

-- 4. Santorini Dream
(
    'santorini-dream',
    'Santorini Dream',
    'Cliffside villages, caldera sunsets, volcanic beaches, and the finest Greek cuisine — Santorini at its most magical.',
    '<p>Few places on earth create such an immediate, overwhelming impression as Santorini. Perched on the rim of an ancient volcanic caldera, the island''s iconic white-washed villages seem to cascade directly into the deep-blue Aegean. This 7-day tour gives you the time and the guidance to experience Santorini far beyond its famous photographs.</p>
<p>Explore the village of Oia at dawn before the crowds arrive, then descend the caldera steps to the old port for a catamaran cruise around the volcanic islands. Swim in naturally heated thermal waters, snorkel over colourful volcanic rock, and watch the sunset from the most spectacular vantage point in Greece.</p>
<p>Visit the UNESCO-listed ruins of ancient Akrotiri — a Minoan city preserved under volcanic ash since 1613 BC — and sample the island''s distinctive Assyrtiko wines at a caldera-edge winery. Santorini rewards those who come curious, and this tour ensures you will see it all.</p>',
    1799.00, 'USD', 7, 14,
    'https://images.unsplash.com/photo-1507501336603-6260d4b3f430?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'honeymoon'),
    (SELECT id FROM destination WHERE slug = 'santorini')
),

-- 5. Paris Romantic Escape
(
    'paris-romantic-escape',
    'Paris Romantic Escape',
    'The Eiffel Tower at night, candlelit bistros, and the Louvre — a perfectly curated 5-day romance in the City of Light.',
    '<p>Paris earns its reputation as the world''s most romantic city every single day, and this 5-day escape is crafted to deliver that romance in full. Arrive to find your hotel room dressed with flowers and champagne, a stone''s throw from the Seine. Your first evening culminates with the Eiffel Tower sparkling against the Paris night sky.</p>
<p>Spend your days as Parisians do: mornings in the Louvre or the Musée d''Orsay, afternoons wandering the cobblestoned streets of Montmartre or the Marais, evenings in intimate bistros over steak tartare and Burgundy. A private cruise along the Seine at sunset is the centrepiece of day three — arguably the most beautiful hour Paris has to offer.</p>
<p>Explore the Palace of Versailles, visit the Sainte-Chapelle with its extraordinary medieval stained glass, and shop the boutiques of Saint-Germain-des-Prés. Paris at its most intimate and unforgettable.</p>',
    1499.00, 'USD', 5, 12,
    'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800&q=80&auto=format&fit=crop',
    false, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'city-break'),
    (SELECT id FROM destination WHERE slug = 'paris')
),

-- 6. Phuket Family Beach Holiday
(
    'phuket-family-beach',
    'Phuket Family Beach Holiday',
    'Island-hopping, elephant sanctuaries, and world-class beaches — an unforgettable family adventure in tropical Thailand.',
    '<p>Thailand is one of the world''s most welcoming destinations for families, and this 8-day Phuket holiday is designed to delight every generation. Your base is a spacious beachfront resort on Patong or Kata Beach — a short walk from calm, swimmable waters and all the facilities a family needs.</p>
<p>Day trips take you to the spectacular Phang Nga Bay, immortalised in a James Bond film, where you kayak through sea caves and beneath towering limestone karsts. Visit the ethical Elephant Jungle Sanctuary, where children and adults alike can feed, bathe, and walk with rescued elephants in a natural forest setting.</p>
<p>Island-hop by longtail boat to the turquoise waters around Koh Phi Phi, snorkel over coral reefs, and enjoy a Thai cooking class the whole family can join. Evenings bring night markets, street food, and spectacular sunsets over the Andaman Sea. Thailand will capture every heart in the family.</p>',
    1299.00, 'USD', 8, 20,
    'https://images.unsplash.com/photo-1589394815804-964ed0be2eb5?w=800&q=80&auto=format&fit=crop',
    false, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'family'),
    (SELECT id FROM destination WHERE slug = 'phuket')
),

-- 7. Georgia & Caucasus Discovery
(
    'georgia-caucasus-discovery',
    'Georgia & Caucasus Discovery',
    'Ancient cave cities, mountain monasteries, volcanic peaks, and legendary wine — the Caucasus at its most captivating.',
    '<p>Georgia is one of the world''s oldest and most underrated travel destinations, and this 6-day tour reveals its remarkable depth. Begin in Tbilisi: wander the Old Town''s cobblestoned lanes, cross the Bridge of Peace, and soak in the famous sulphur baths of Abanotubani that have drawn visitors for centuries.</p>
<p>Head north into the Greater Caucasus Mountains to the village of Kazbegi, where the medieval Gergeti Trinity Church sits on a 2,170-metre peak with Mount Kazbek — Georgia''s highest — as its dramatic backdrop. Trek the surrounding highland trails, meet local shepherds, and breathe the mountain air.</p>
<p>No Georgian journey is complete without wine. Georgia is widely considered the birthplace of wine, with an 8,000-year tradition of fermenting grapes in clay kvevri vessels buried underground. Visit a family winery in the Alazani Valley, taste the extraordinary amber wines of Kakheti, and share a traditional supra feast with a local family — a Georgian table of extraordinary generosity and warmth.</p>',
    899.00, 'USD', 6, 12,
    'https://images.unsplash.com/photo-1565008576549-57569a49371d?w=800&q=80&auto=format&fit=crop',
    false, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'cultural'),
    (SELECT id FROM destination WHERE slug = 'tbilisi')
),

-- 8. Kyoto Cultural Immersion
(
    'kyoto-cultural-immersion',
    'Kyoto Cultural Immersion',
    'Tea ceremonies, bamboo groves, thousand torii gates, and 17 UNESCO sites — the full depth of Japan''s ancient capital.',
    '<p>Kyoto is Japan distilled to its purest essence. This 7-day cultural immersion is designed not just to show you Kyoto''s extraordinary sites, but to give you genuine access to the traditions, philosophies, and human stories behind them. Your journey is guided by a specialist in Japanese cultural heritage.</p>
<p>Participate in an authentic tea ceremony with a third-generation tea master in her private machiya townhouse — a deeply meditative experience very different from the tourist versions offered elsewhere. Explore the thousand vermillion torii gates of Fushimi Inari Shrine at dawn, when the mountain is almost silent. Walk the Philosopher''s Path through the Higashiyama temple district as cherry blossoms (or autumn leaves, depending on your season) drift across the canal.</p>
<p>Visit Nijo Castle, Kinkaku-ji (the Golden Pavilion), and the Arashiyama bamboo grove. Learn the art of ikebana flower arrangement and watch a private maiko (apprentice geisha) performance in Gion. Kyoto reveals itself slowly, layer by extraordinary layer.</p>',
    1699.00, 'USD', 7, 10,
    'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'cultural'),
    (SELECT id FROM destination WHERE slug = 'kyoto')
);

-- =========================================================
-- 5. Tour itinerary days
-- =========================================================

-- Maldives Honeymoon (6 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival & Seaplane Transfer',      'Land at Malé International Airport and board your private seaplane for the most scenic 30-minute flight of your life. Arrive at your overwater villa to find champagne, fresh flowers, and the Indian Ocean stretching to the horizon.', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape')),
(2, 'House Reef Snorkelling & Spa',     'Explore your island''s private house reef at your own pace — sea turtles, reef sharks, and manta rays are frequent visitors. Afternoon: a 90-minute couples'' spa ritual using traditional Maldivian botanicals and warm coconut oil.', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape')),
(3, 'Sandbank Picnic & Sunset Cruise',  'Your private dhoni takes you to a secluded sandbank in the middle of the lagoon for a champagne picnic. As the sun drops toward the horizon, return by boat for a magical golden-hour cruise across the atoll.', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape')),
(4, 'Dolphin Watching & Deep Snorkel',  'Morning excursion to spot spinner dolphins in the open ocean — the Maldives has the highest concentration of dolphins in the world. Afternoon snorkel over a deep coral wall teeming with fish, turtles, and vibrant reef life.', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape')),
(5, 'Private Beach Dinner',             'A day entirely at your leisure — sleep in, float in your private pool, read on the deck. As night falls, your personal butler sets a candlelit table on the beach, the stars reflecting off a glassy, perfectly still ocean.', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape')),
(6, 'Departure',                        'A final morning swim before your seaplane returns you to Malé for your onward journey. You leave with memories that will last a lifetime.', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'));

-- Bali Complete Experience (8 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival in Ubud',                  'Transfer to Ubud, the cultural heart of Bali. Evening welcome dinner with a traditional Legong dance performance showcasing the extraordinary grace of Balinese art.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience')),
(2, 'Tegallalang & Sacred Monkey Forest','Morning among the terraced rice paddies of Tegallalang — one of the most photographed landscapes in Asia. Afternoon: walk through the ancient Sangeh Monkey Forest and visit the water temple of Tirta Empul.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience')),
(3, 'Mount Batur Sunrise Trek',         'A 2 am start for the climb up Bali''s active volcano. Reach the 1,717-metre summit at dawn and watch the sun rise above the clouds over Lake Batur and Mount Agung — a moment of profound, wordless beauty.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience')),
(4, 'Ayung River White-Water Rafting',  'The Ayung River carves through a deep jungle gorge, passing waterfalls, carved rock faces, and overhanging tropical trees. Your expert guides keep the rafting thrilling but safe.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience')),
(5, 'Balinese Cooking Class',           'Spend the morning in a family compound learning to prepare five traditional Balinese dishes — lawar, sate lilit, nasi campur. Afternoon free for spa treatments or exploring Ubud''s art market.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience')),
(6, 'Transfer South & Tanah Lot',       'Drive south through Bali''s heartland. Visit the sea temple of Tanah Lot, perched on a rock formation in the ocean, at golden hour — one of the most dramatically beautiful temple settings in the world.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience')),
(7, 'Uluwatu & Kecak Fire Dance',       'Explore the Bukit Peninsula: the clifftop Uluwatu Temple with its 70-metre drop to the crashing ocean, Padang Padang Beach for snorkelling, and the iconic Kecak fire dance ceremony at sunset.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience')),
(8, 'Seminyak & Departure',             'Final morning on Seminyak Beach. Brunch at a beachfront café before transfer to Ngurah Rai International Airport. Bali will call you back.', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'));

-- Dubai City & Desert (5 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival & Dubai Marina',           'Check in and spend your first evening walking the illuminated promenade of Dubai Marina — a stunning forest of skyscrapers reflected in the water. Dinner at a marina-side restaurant as the city blazes into life.', (SELECT id FROM tour WHERE slug = 'dubai-city-desert')),
(2, 'Burj Khalifa & Old Dubai',         'Morning at the top of the Burj Khalifa (148th-floor observation deck): the city, the desert, and the Gulf spread to the horizon. Afternoon by boat through the Dubai Creek to the Gold and Spice Souks of Old Dubai.', (SELECT id FROM tour WHERE slug = 'dubai-city-desert')),
(3, 'Desert Safari',                    'Afternoon convoy of 4x4s heads into the red Arabian Desert. Dune bashing, sandboarding, camel riding. As the sun sets, arrive at a Bedouin camp for a feast of Arabic food, shisha, live music, and a sky full of stars.', (SELECT id FROM tour WHERE slug = 'dubai-city-desert')),
(4, 'Atlantis, The Palm & JBR Beach',   'Morning at Aquaventure Waterpark at the Atlantis resort on Palm Jumeirah — thrilling slides and a private beach with views of the Dubai skyline. Afternoon at JBR Beach for swimming and sunset.', (SELECT id FROM tour WHERE slug = 'dubai-city-desert')),
(5, 'Dubai Mall & Departure',           'Final morning for last-minute shopping at the Dubai Mall (the world''s largest). Fountain show at noon before transfer to Dubai International Airport.', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'));

-- Santorini Dream (7 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival in Santorini',             'Fly into Santorini and transfer to your cliffside hotel above the caldera. First evening: a leisurely walk along the caldera edge path from Fira to watch the day''s last light disappear over the Aegean.', (SELECT id FROM tour WHERE slug = 'santorini-dream')),
(2, 'Oia Village & Akrotiri Ruins',     'Explore Oia at dawn — the blue-domed churches, the windmills, the clifftop steps — before the day-trippers arrive. Afternoon: guided tour of the ancient Minoan city of Akrotiri, buried and preserved since 1613 BC.', (SELECT id FROM tour WHERE slug = 'santorini-dream')),
(3, 'Caldera Catamaran Cruise',         'Full-day catamaran cruise around the volcanic islands: swim in thermal hot springs, snorkel over colourful sea beds, visit the black-sand beach of Nea Kameni, and share a sunset barbecue lunch on deck in the middle of the caldera.', (SELECT id FROM tour WHERE slug = 'santorini-dream')),
(4, 'Wine Tasting on the Caldera',      'Santorini produces some of Greece''s finest wines. Visit two estate wineries — one carved into the volcanic cliff — and taste the island''s distinctive Assyrtiko, Vinsanto, and Nykteri varieties with a local sommelier.', (SELECT id FROM tour WHERE slug = 'santorini-dream')),
(5, 'Black Beach & Perissa Village',    'Spend the day at Perissa, Santorini''s famous black-sand beach. Swim, sunbathe, and explore the village tavernas for fresh grilled octopus and the freshest seafood on the island.', (SELECT id FROM tour WHERE slug = 'santorini-dream')),
(6, 'Fira & Pyrgos Village',            'Explore the bustling capital Fira: the Museum of Prehistoric Thera and the cable car ride to the old port. Afternoon in the hilltop medieval village of Pyrgos — the highest point on the island and away from the tourist trail.', (SELECT id FROM tour WHERE slug = 'santorini-dream')),
(7, 'Departure',                        'Final sunrise over the caldera from your terrace. Transfer to Santorini Airport. The island stays with you long after you leave.', (SELECT id FROM tour WHERE slug = 'santorini-dream'));

-- Paris Romantic Escape (5 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival & Eiffel Tower Evening',   'Check into your hotel on the Left Bank. Evening stroll along the Seine to Trocadéro for the Eiffel Tower''s famous light show — 20,000 bulbs flickering across the Paris skyline at 10 pm.', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape')),
(2, 'Louvre & Montmartre',              'Morning in the Louvre (skip-the-line tickets included): the Winged Victory, the Venus de Milo, and the Mona Lisa in relative peace. Afternoon climbing the steep streets of Montmartre to Sacré-Cœur — the best free view in Paris.', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape')),
(3, 'Versailles & Seine Cruise',        'Day trip to the Palace of Versailles and its extraordinary Hall of Mirrors and formal gardens. Return to Paris for a private sunset cruise along the Seine, with the bridges and monuments glowing gold in the evening light.', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape')),
(4, 'Le Marais & Sainte-Chapelle',      'Explore the Marais district: the Place des Vosges, the Picasso Museum, and boutique shopping in the cobblestoned streets. Visit the Sainte-Chapelle with its breathtaking 13th-century stained glass — one of the most beautiful interiors in Europe.', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape')),
(5, 'Saint-Germain & Departure',        'Final morning in the café-lined streets of Saint-Germain-des-Prés. Croissant and café crème at a legendary Left Bank brasserie before transfer to Charles de Gaulle Airport. À bientôt, Paris.', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'));

-- Phuket Family Beach (8 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival in Phuket',                'Transfer to your beachfront resort. Afternoon: first dip in the Andaman Sea at Kata Beach, which has calm, safe waters perfect for all ages. Evening: Thai welcome dinner at the resort.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach')),
(2, 'Elephant Jungle Sanctuary',        'Spend the morning at a responsible elephant sanctuary deep in the rainforest. Feed, bathe, and walk with rescued elephants — an experience children remember their entire lives. Afternoon back at the beach.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach')),
(3, 'Phang Nga Bay by Longtail',        'Full-day boat trip into the spectacular Phang Nga Bay: sea caves, mangrove channels, the famous James Bond Island, and a floating Muslim fishing village. Kayak through low caves accessible only at certain tides.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach')),
(4, 'Phi Phi Islands & Snorkelling',    'Speedboat to the Phi Phi Islands — Maya Bay, Monkey Beach, and the crystal-clear waters of Pileh Lagoon. Snorkel over the colourful coral reefs of Shark Point with your guide.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach')),
(5, 'Thai Cooking Class',               'A family cooking class with a local chef: learn to make pad thai, green curry, and mango sticky rice. Afternoon free on the beach. Evening: Phuket Old Town''s colourful Sino-Portuguese streets for street food and shopping.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach')),
(6, 'Water Sports Day',                 'A dedicated water sports day at the resort beach: jet skiing, parasailing, banana boat rides, paddleboarding. Afternoon at the resort''s freshwater pool.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach')),
(7, 'Big Buddha & Wat Chalong',         'Morning visit to the giant Big Buddha statue (45 metres tall) on a hilltop with 360-degree island views. Visit Wat Chalong, Phuket''s most important Buddhist temple. Afternoon: free time and final sunset on the beach.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach')),
(8, 'Departure',                        'Final morning swim. Transfer to Phuket International Airport. Thailand — land of smiles — will be missed by the whole family.', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'));

-- Georgia & Caucasus Discovery (6 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival in Tbilisi',               'Arrive in Georgia''s ancient capital and check into a boutique hotel in the Old Town. Evening stroll through the atmospheric Abanotubani sulphur-bath district and dinner in a wine cellar restaurant beneath the old city.', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery')),
(2, 'Tbilisi Old Town & Narikala',      'Guided walk through the winding streets of Old Tbilisi: the Sioni Cathedral, the colourful balconied houses of Shardeni Street, the Persian-era Narikala Fortress above the city, and the remarkable open-air ethnographic museum.', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery')),
(3, 'Drive to Kazbegi Mountains',       'Cross the stunning Georgian Military Highway through the Greater Caucasus Mountains. Trek to the medieval Gergeti Trinity Church (2,170 m) with Mount Kazbek as its backdrop — one of the most dramatic scenes in the entire Caucasus.', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery')),
(4, 'Kazbegi Hiking & Return',          'Morning hike through alpine meadows with glacier views. Afternoon drive back toward Tbilisi, stopping at the Ananuri Fortress complex reflected in the turquoise Zhinvali Reservoir.', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery')),
(5, 'Kakheti Wine Region',              'Drive east to Kakheti — the heartland of Georgian wine. Visit a family winery, learn about the ancient kvevri clay-vessel fermentation method, and taste the distinctive amber wines of the region. A traditional supra feast with the family.', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery')),
(6, 'Departure from Tbilisi',           'Final morning walk across the Bridge of Peace and along the Mtkvari River. Transfer to Tbilisi International Airport. Georgia''s warmth, beauty, and extraordinary table will pull you back.', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'));

-- Kyoto Cultural Immersion (7 days)
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
(1, 'Arrival in Kyoto',                 'Arrive in Kyoto by Shinkansen from Osaka airport. Your guide meets you and walks you through Gion — the old geisha district — as evening lanterns illuminate the wooden machiya townhouses.', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion')),
(2, 'Fushimi Inari & Nishiki Market',   'Dawn visit to Fushimi Inari Shrine — walk the entire network of 10,000 vermillion torii gates through the forested mountain while the light is still golden and the crowds are absent. Afternoon: the Nishiki covered market, Kyoto''s kitchen.', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion')),
(3, 'Tea Ceremony & Philosopher''s Path','Participate in a private tea ceremony with a third-generation tea master in her 300-year-old machiya. Afternoon walk along the Philosopher''s Path through the Higashiyama temple district, the stone path lined with cherry trees.', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion')),
(4, 'Arashiyama & Bamboo Grove',        'Take the Sagano Romantic Train through the Hozu River gorge to Arashiyama. Walk through the towering bamboo grove, visit the Tenryu-ji Zen garden (a UNESCO World Heritage Site), and explore the quiet hillside temple of Jojakko-ji.', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion')),
(5, 'Nijo Castle & Kinkaku-ji',         'Explore Nijo Castle — the shogun''s Kyoto residence with its famous ''nightingale'' floors that chirp when walked upon. Afternoon at Kinkaku-ji, the Golden Pavilion, reflected in its mirror-still pond.', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion')),
(6, 'Ikebana Class & Gion Evening',     'Morning workshop in ikebana — the ancient Japanese art of flower arrangement — with a master practitioner. Evening in Gion watching for maiko (apprentice geisha) on their way to appointments in the ochaya teahouses.', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion')),
(7, 'Departure',                        'Final morning at the Nishiki Market for tea, tofu, and farewell shopping. Transfer to Osaka Airport. Japan recalibrates how you see the world.', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'));

-- =========================================================
-- 6. Blog posts
-- =========================================================
INSERT INTO blog_post (slug, title, summary, content, cover_image, author, tags, published, published_at) VALUES
(
    'why-maldives-perfect-honeymoon',
    'Why the Maldives Is the World''s Perfect Honeymoon Destination',
    'Crystal lagoons, overwater villas, absolute privacy, and sunsets unlike anywhere else — here is exactly why the Maldives tops every honeymoon list.',
    '<p>Every year, thousands of couples choose the Maldives for their honeymoon — and every year, virtually all of them say it exceeded every expectation. What is it about this scattered archipelago in the Indian Ocean that makes it so consistently, overwhelmingly perfect for romance?</p>
<p><strong>The privacy is genuine.</strong> Unlike most resort destinations, the Maldives is built on the concept of the private island. Many resorts occupy their own island entirely, meaning no day-trippers, no crowds, and often no other guests visible from your overwater villa deck. The ocean becomes yours.</p>
<p><strong>The setting is unreal.</strong> The Indian Ocean here achieves a blue that seems digitally enhanced — a luminous, almost transparent turquoise in the shallow lagoons that deepens to ink-blue in the open water. Floating in your private pool above it at sunset feels like being suspended inside a painting.</p>
<p><strong>The service is exceptional.</strong> Maldivian resorts consistently rank among the world''s best for hospitality. Your personal butler learns your preferences on arrival and anticipates every need throughout your stay — the champagne is already chilled when you return from snorkelling; the sundowner cocktails appear at the precise moment the sun touches the horizon.</p>
<p><strong>The marine life is extraordinary.</strong> The Maldives sits atop one of the most biodiverse marine ecosystems on earth. Snorkelling from your overwater villa steps, you will encounter sea turtles, reef sharks, manta rays, and thousands of tropical fish — a privilege that never becomes ordinary.</p>
<p>If you are planning your honeymoon, the Maldives is not just a destination. It is a benchmark — a memory against which every holiday that follows will be measured. Our specialist honeymoon team is here to make yours perfect.</p>',
    'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'Maldives, honeymoon, luxury travel, romantic getaway',
    true, NOW() - INTERVAL '18 days'
),
(
    'hidden-side-of-georgia',
    'The Hidden Side of Georgia: Beyond Tbilisi',
    'Most travellers see only Tbilisi. But the real Georgia — ancient cave cities, mountain monasteries, and legendary wine — lies in the valleys and peaks beyond the capital.',
    '<p>Georgia has been quietly building a reputation as one of the world''s most surprising travel destinations. Tbilisi — with its distinctive mix of medieval, imperial Russian, Soviet, and contemporary architecture — is genuinely one of Europe''s most characterful capitals. But venture beyond the city, and you encounter a country of profound ancient depth.</p>
<p><strong>Kazbegi and the Greater Caucasus.</strong> The drive north from Tbilisi along the Georgian Military Highway is one of the most dramatic road journeys in the world. As you climb into the Greater Caucasus, the scale of the landscape becomes overwhelming — deep gorges, glaciated peaks rising to over 5,000 metres, and medieval watchtower villages clinging to impossibly steep hillsides. The Gergeti Trinity Church, perched on a 2,170-metre ridge with Mount Kazbek behind it, is one of the defining images of the entire Caucasus.</p>
<p><strong>The wine country of Kakheti.</strong> Georgia is widely acknowledged as the birthplace of wine — humans have been fermenting grapes here for at least 8,000 years. The Alazani Valley in Kakheti is lined with family wineries producing wines using the ancient kvevri method: fermenting whole grape clusters, skins and all, in large clay vessels buried underground. The result is the distinctive amber (or ''orange'') wines that have recently taken the natural wine world by storm.</p>
<p><strong>Vardzia cave city.</strong> Deep in southern Georgia, carved into a volcanic cliff face in the 12th century, the cave monastery city of Vardzia contains over 3,000 rooms, 13 floors, a church with original frescoes, and a complex irrigation system — all cut by hand from solid rock. It is one of the most extraordinary human achievements in the Caucasus, and most visitors have never heard of it.</p>
<p>Georgia rewards the curious traveller with extraordinary generosity. The famous Georgian supra — a lavish feast presided over by a toastmaster, with wine flowing and songs being sung — is one of the great hospitality traditions of the world. Come curious, leave transformed.</p>',
    'https://images.unsplash.com/photo-1565008576549-57569a49371d?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'Georgia, Tbilisi, Caucasus, wine, adventure, hidden gems',
    true, NOW() - INTERVAL '12 days'
),
(
    'first-time-japan-guide',
    'First Time in Japan: Everything You Need to Know Before You Go',
    'From train etiquette to temple rules, cash culture to konbini breakfasts — the essential guide for first-time travellers to Japan.',
    '<p>Japan is a destination that repays preparation. Not because it is difficult — Japan is in fact one of the easiest and most logistically smooth countries in the world to travel — but because understanding a few cultural nuances transforms a good trip into a great one.</p>
<p><strong>The JR Pass.</strong> If you are visiting multiple cities, a Japan Rail Pass is almost certainly worth purchasing before you leave home (it cannot be bought in Japan). It covers the Shinkansen bullet train network and most regional trains, cutting transport costs significantly.</p>
<p><strong>Cash is still king.</strong> Despite being one of the world''s most technologically advanced nations, Japan remains surprisingly cash-oriented. Many restaurants, shrines, and smaller shops do not accept cards. Always carry yen; 7-Eleven ATMs reliably accept foreign cards.</p>
<p><strong>The konbini.</strong> Japanese convenience stores — 7-Eleven, Lawson, FamilyMart — are genuinely extraordinary institutions. Open 24 hours, they sell hot food, fresh onigiri, quality sandwiches, coffee, beer, medicine, SIM cards, and almost anything else you might need. Your konbini breakfast will be better than most hotel buffets.</p>
<p><strong>Temple and shrine etiquette.</strong> Bow slightly on passing through a torii gate. At shrine water basins, rinse both hands before entering. Remove shoes before entering temple buildings — you will see a step and a rack of slippers indicating this. Speaking quietly and refraining from photography inside sacred spaces is always appreciated.</p>
<p><strong>The trains run on time.</strong> Announcements are made when a train is even one minute late. Eating on trains (except the Shinkansen) is considered impolite. Mobile phones should be on silent. Seats near the doors are priority seats for elderly and disabled passengers.</p>
<p>Japan is a country that will exceed every expectation you bring to it. The depth of craft, the extraordinary food culture, the combination of ancient beauty and hypermodern energy — nothing quite prepares you for the reality. Go, and return changed.</p>',
    'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'Japan, Kyoto, travel tips, first time, guide',
    true, NOW() - INTERVAL '6 days'
),
(
    'dubai-beyond-the-skyscrapers',
    'Dubai Beyond the Skyscrapers: The City Most Visitors Never See',
    'Dubai is famous for excess and spectacle — but behind the records and the malls is a city of surprising depth, history, and humanity.',
    '<p>Dubai''s international reputation is built on superlatives: the world''s tallest building, the world''s largest mall, the world''s hottest brunch. And while those things are real and genuinely remarkable, the city they define is only one layer of a place that rewards closer attention.</p>
<p><strong>The Old City.</strong> Take an abra — a traditional wooden water taxi — across the Dubai Creek from the gold souk to the spice souk. The air over the water smells of sandalwood, frankincense, and saffron. The spice traders'' stalls are piled high with turmeric, sumac, and dried rose petals. This is the Dubai that existed for centuries before the oil era, and it is still very much alive.</p>
<p><strong>Al Fahidi Historical Neighbourhood.</strong> A 15-minute walk from the creek, this district of wind-tower architecture and narrow sandy lanes has been beautifully preserved. The Dubai Museum occupies a 1787 fort — the oldest standing building in the city. The lanes contain artist studios, a fantastic coffee museum, and the Sheikh Mohammed Centre for Cultural Understanding, which runs extraordinary ''Open Doors, Open Minds'' breakfasts where you eat an Emirati meal, ask any question you like about Islamic culture, and receive genuinely open, honest answers.</p>
<p><strong>The desert at night.</strong> Forty minutes from the Burj Khalifa, the city evaporates and the Arabian Desert begins. At night, away from the light pollution, the stars above the dunes are extraordinary. Spending an evening in a Bedouin camp — dune bashing done, camel ridden, dinner eaten — looking up at the Milky Way is a reminder that Dubai''s modernity is built on something much older and stranger than glass and steel.</p>
<p>Come for the records, stay for the depth. Dubai is stranger and more interesting than its Instagram profile suggests.</p>',
    'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'Dubai, UAE, travel guide, culture, city break',
    true, NOW() - INTERVAL '2 days'
);

-- =========================================================
-- 7. Approved reviews
-- =========================================================
INSERT INTO review (author_name, author_location, rating, content, approved, tour_id) VALUES
(
    'Armine Petrosyan', 'Yerevan, Armenia', 5,
    'The Maldives honeymoon package was beyond anything we imagined. Every single detail was perfect — the seaplane arrival, the flowers in our villa, the private beach dinner. We have travelled together many times, but nothing has ever come close to this. The MyTravelLine team answered every question patiently and made the entire planning process effortless. We are already talking about our anniversary trip.',
    true, (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape')
),
(
    'Karen Mkrtchyan', 'Moscow, Russia', 5,
    'Bali exceeded every expectation. The Mount Batur sunrise trek was the highlight of my year — standing above the clouds at dawn with an active volcano beneath you is one of those moments that recalibrates how you see your life. The cooking class with the local family was equally wonderful. Our guide Wayan spoke perfect Russian and his knowledge of Balinese culture was extraordinary. I recommend MyTravelLine without reservation.',
    true, (SELECT id FROM tour WHERE slug = 'bali-complete-experience')
),
(
    'Davit Harutyunyan', 'Yerevan, Armenia', 5,
    'We took the Dubai tour as a family with our two teenage daughters and it was a complete success. The girls loved the waterpark and the desert safari, my wife was happy with the shopping and the food, and I loved the Old City and the spice souk. Something genuinely different for everyone. The organisation was seamless — every transfer, every booking exactly as described. Five stars.',
    true, (SELECT id FROM tour WHERE slug = 'dubai-city-desert')
),
(
    'Nora Grigoryan', 'Tbilisi, Georgia', 5,
    'The Santorini tour was magical. Oia at dawn, before the cruise ships arrive, is one of the most beautiful things I have ever seen in my life. The catamaran day in the caldera was incredible — swimming in the thermal springs, the barbecue lunch on deck. And the wine tasting at the caldera-edge winery in the evening light. My husband proposed at the sunset point in Oia. We will remember every moment of this trip forever.',
    true, (SELECT id FROM tour WHERE slug = 'santorini-dream')
),
(
    'Tigran Sargsyan', 'Gyumri, Armenia', 5,
    'Georgia & Caucasus Discovery was extraordinary. I live in Armenia and have visited Tbilisi before, but this tour showed me a completely different Georgia. The Kazbegi hike to Gergeti Church with Mount Kazbek above — I have no words for it. The supra dinner with the winery family in Kakheti was the warmest, most generous evening I have ever spent as a traveller. Georgia is a remarkable country and MyTravelLine planned a remarkable tour.',
    true, (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery')
),
(
    'Yuki & Hana Watanabe', 'London, UK', 5,
    'As Japanese-British travellers, we were curious how a non-Japanese company would handle a Kyoto cultural tour. The answer: exceptionally. Our guide had clearly spent years studying Japanese aesthetics and history, and the tea ceremony he arranged — with a third-generation tea master in a private machiya — was the most authentic and moving cultural experience either of us has had in Japan. The dawn visit to Fushimi Inari when the mountain was silent was extraordinary. We are deeply grateful.',
    true, (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion')
);
