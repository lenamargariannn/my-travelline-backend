-- V3__seed_content.sql
-- Seed realistic content: cover images for destinations/categories, sample tours, blog posts, and reviews

-- =========================================================
-- Destination cover images (Unsplash public photo URLs)
-- =========================================================
UPDATE destination SET cover_image = 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&q=80&auto=format&fit=crop' WHERE slug = 'bali';
UPDATE destination SET cover_image = 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&q=80&auto=format&fit=crop' WHERE slug = 'maldives';
UPDATE destination SET cover_image = 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800&q=80&auto=format&fit=crop' WHERE slug = 'swiss-alps';
UPDATE destination SET cover_image = 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80&auto=format&fit=crop' WHERE slug = 'kyoto';
UPDATE destination SET cover_image = 'https://images.unsplash.com/photo-1507501336603-6260d4b3f430?w=800&q=80&auto=format&fit=crop' WHERE slug = 'santorini';
UPDATE destination SET cover_image = 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=800&q=80&auto=format&fit=crop' WHERE slug = 'serengeti';

-- =========================================================
-- Category cover images
-- =========================================================
UPDATE category SET cover_image = 'https://images.unsplash.com/photo-1551632811-561732d1e306?w=800&q=80&auto=format&fit=crop' WHERE slug = 'adventure';
UPDATE category SET cover_image = 'https://images.unsplash.com/photo-1518998053901-5348d3961a04?w=800&q=80&auto=format&fit=crop' WHERE slug = 'honeymoon';
UPDATE category SET cover_image = 'https://images.unsplash.com/photo-1502086223501-7ea6ecd79368?w=800&q=80&auto=format&fit=crop' WHERE slug = 'family';
UPDATE category SET cover_image = 'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800&q=80&auto=format&fit=crop' WHERE slug = 'cultural';
UPDATE category SET cover_image = 'https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?w=800&q=80&auto=format&fit=crop' WHERE slug = 'wildlife';
UPDATE category SET cover_image = 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80&auto=format&fit=crop' WHERE slug = 'beach';

-- =========================================================
-- Sample tours (6 tours: 4 featured, 2 not featured)
-- =========================================================
INSERT INTO tour (slug, title, summary, description, price, duration_days, max_group_size, cover_image, featured, status, category_id, destination_id) VALUES
(
    'bali-adventure-package',
    'Bali Adventure Package',
    'Experience the magic of Bali with volcanic treks, temple tours, and white-water rafting through lush tropical landscapes.',
    '<p>Immerse yourself in the Island of the Gods with this action-packed 7-day adventure. Trek to the summit of Mount Batur at sunrise, explore ancient Hindu temples, ride the rapids of the Ayung River, and relax on pristine beaches.</p><p>Our expert local guides ensure a safe and deeply authentic experience. You will visit iconic sites like Tanah Lot and Uluwatu, discover hidden waterfalls in the jungle, and enjoy a traditional Balinese cooking class. This tour is designed for adventurers who want more than just a beach holiday.</p>',
    1299.00, 7, 12,
    'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'adventure'),
    (SELECT id FROM destination WHERE slug = 'bali')
),
(
    'maldives-honeymoon-escape',
    'Maldives Honeymoon Escape',
    'Romantic overwater bungalows, crystal-clear lagoons, and sunset cruises — the perfect escape for couples celebrating love.',
    '<p>Celebrate your love in paradise with this exclusive 5-day honeymoon package in the Maldives. Stay in a luxurious overwater villa with direct ocean access, enjoy private beach dinners under the stars, and snorkel among vibrant coral reefs teeming with colourful fish.</p><p>Every detail is curated for romance: couples spa treatments using traditional island remedies, a private sunrise yoga session on the deck, and a candlelit dhoni cruise at sunset. This is the honeymoon you have always dreamed of.</p>',
    2999.00, 5, 2,
    'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'honeymoon'),
    (SELECT id FROM destination WHERE slug = 'maldives')
),
(
    'swiss-alps-hiking',
    'Swiss Alps Hiking Adventure',
    'Conquer breathtaking Alpine trails with panoramic views, charming mountain villages, and crisp mountain air.',
    '<p>Lace up your boots and discover the majesty of the Swiss Alps on this 8-day hiking adventure. Trek through flower-filled meadows, cross glacial valleys, and reach summits offering jaw-dropping views across Switzerland, France, and Italy.</p><p>Visit the picturesque towns of Grindelwald and Zermatt, stay in traditional mountain huts, and experience authentic Swiss hospitality. Suitable for moderately fit hikers — no mountaineering experience required. Daily distances range from 10 to 18 km with experienced mountain guides throughout.</p>',
    2199.00, 8, 10,
    'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'adventure'),
    (SELECT id FROM destination WHERE slug = 'swiss-alps')
),
(
    'kyoto-cultural-journey',
    'Kyoto Cultural Journey',
    'Immerse yourself in ancient Japanese culture, traditional tea ceremonies, zen gardens, and sacred temple rituals.',
    '<p>Step back in time on this immersive 6-day cultural tour through Kyoto, Japan''s ancient capital. Participate in an authentic tea ceremony with a local tea master, wander through the mystical bamboo groves of Arashiyama, and visit 17 UNESCO World Heritage Sites.</p><p>Stroll along the historic Philosopher''s Path lined with cherry trees, discover the thousand torii gates of Fushimi Inari Shrine, and explore the traditional machiya townhouses of the Gion district. A deep, authentic journey into the heart of Japanese tradition and aesthetics.</p>',
    1599.00, 6, 12,
    'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80&auto=format&fit=crop',
    false, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'cultural'),
    (SELECT id FROM destination WHERE slug = 'kyoto')
),
(
    'santorini-family-holiday',
    'Santorini Family Holiday',
    'Discover iconic white-washed villages, volcanic beaches, and legendary sunsets — a perfect family escape to Greece.',
    '<p>Create magical family memories on the stunning island of Santorini. Over 7 days, explore the clifftop village of Oia, swim at the unique black and red sand beaches, and discover the ancient ruins of Akrotiri preserved under volcanic ash for 3,600 years.</p><p>Enjoy boat trips around the volcanic caldera, visit traditional wineries, and savour authentic Greek cuisine with the whole family. Our family-friendly itinerary balances adventure, culture, and relaxation for guests of all ages — from young explorers to grandparents.</p>',
    1899.00, 7, 16,
    'https://images.unsplash.com/photo-1507501336603-6260d4b3f430?w=800&q=80&auto=format&fit=crop',
    false, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'family'),
    (SELECT id FROM destination WHERE slug = 'santorini')
),
(
    'serengeti-wildlife-safari',
    'Serengeti Wildlife Safari',
    'Witness the greatest wildlife spectacle on earth during the Great Migration across Tanzania''s endless golden plains.',
    '<p>Embark on the safari of a lifetime across the vast plains of the Serengeti. Over 10 extraordinary days, witness the thundering Great Migration of over a million wildebeest and zebra, track the Big Five with expert rangers, and fall asleep to the sounds of the African night.</p><p>Stay in exclusive luxury tented camps positioned for prime game viewing. Enjoy morning and evening game drives, guided bush walks, and sundowners on the open savanna. This is Africa at its most raw and magnificent — an experience that will profoundly move you.</p>',
    3499.00, 10, 8,
    'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=800&q=80&auto=format&fit=crop',
    true, 'PUBLISHED',
    (SELECT id FROM category WHERE slug = 'wildlife'),
    (SELECT id FROM destination WHERE slug = 'serengeti')
);

-- =========================================================
-- Tour itinerary days (sample for 3 tours)
-- =========================================================
INSERT INTO tour_itinerary_day (day_number, title, description, tour_id) VALUES
-- Bali Adventure
(1, 'Arrival & Ubud Orientation', 'Arrive in Bali and transfer to Ubud. Evening welcome dinner with traditional Kecak fire dance performance.', (SELECT id FROM tour WHERE slug = 'bali-adventure-package')),
(2, 'Mount Batur Sunrise Trek', 'Pre-dawn ascent of the active volcano Mount Batur (1,717 m) for a spectacular sunrise above the clouds.', (SELECT id FROM tour WHERE slug = 'bali-adventure-package')),
(3, 'Ayung River Rafting', 'White-water rafting through the jungle gorge of the Ayung River, followed by temple visits at Tirta Empul.', (SELECT id FROM tour WHERE slug = 'bali-adventure-package')),
(4, 'Temples & Rice Terraces', 'Explore the iconic Tegallalang rice terraces and the water temple of Pura Ulun Danu Bratan.', (SELECT id FROM tour WHERE slug = 'bali-adventure-package')),
(5, 'Cooking Class & Free Time', 'Morning Balinese cooking class with a local family; afternoon free for spa or shopping in Ubud.', (SELECT id FROM tour WHERE slug = 'bali-adventure-package')),
(6, 'South Bali & Uluwatu', 'Transfer to south Bali, visit Tanah Lot and the clifftop Uluwatu Temple with sunset Kecak ceremony.', (SELECT id FROM tour WHERE slug = 'bali-adventure-package')),
(7, 'Departure Day', 'Morning at leisure on the beach. Transfer to Ngurah Rai International Airport for departure.', (SELECT id FROM tour WHERE slug = 'bali-adventure-package')),
-- Serengeti Safari
(1, 'Arrival in Arusha', 'Fly into Kilimanjaro International Airport. Transfer to lodge in Arusha for briefing and overnight.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(2, 'Drive to Serengeti', 'Early morning drive into the Serengeti National Park via the Ngorongoro Crater rim. Afternoon game drive.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(3, 'Full Day Game Drives', 'Two game drives in the central Serengeti. Look for lion prides, leopards, and elephant herds.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(4, 'Migration Viewing', 'Track the wildebeest migration with your expert ranger. River crossing viewing (seasonal).', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(5, 'Guided Bush Walk', 'Morning guided walk with armed ranger. Afternoon at camp — sundowners on the open savanna.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(6, 'Northern Serengeti', 'Drive to the northern sector, known for the best migration river crossings and cheetah sightings.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(7, 'Balloon Safari Option', 'Optional hot-air balloon safari at dawn over the plains, followed by champagne breakfast in the bush.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(8, 'Ngorongoro Crater', 'Transfer to Ngorongoro Conservation Area. Full day game drive inside the crater — world''s largest caldera.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(9, 'Cultural Village Visit', 'Morning visit to a Maasai village. Afternoon drive back to Arusha.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
(10, 'Departure', 'Transfer to Kilimanjaro Airport for departure. Farewell to Tanzania.', (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')),
-- Swiss Alps Hiking
(1, 'Arrival in Zurich & Transfer', 'Arrive in Zurich and take the scenic train to Grindelwald. Evening walk in the village.', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')),
(2, 'First Valley Trek', 'First full day hike through Grindelwald valley with views of the Eiger north face (14 km).', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')),
(3, 'Jungfraujoch Excursion', 'Take the rack railway to Jungfraujoch — the Top of Europe at 3,454 m. Afternoon free.', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')),
(4, 'Lauterbrunnen Valley', 'Hike through the dramatic Lauterbrunnen valley past 72 waterfalls. Overnight in Mürren (car-free village).', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')),
(5, 'Schilthorn & Views', 'Cable car to Schilthorn (2,970 m), James Bond location. Afternoon hike down to Grütschalp.', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')),
(6, 'Transfer to Zermatt', 'Morning train journey to Zermatt. Afternoon acclimatisation walk with views of the Matterhorn.', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')),
(7, 'Matterhorn Views Hike', 'Trek to Schwarzsee (2,583 m) for the best up-close Matterhorn views. Optional glacier walk.', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')),
(8, 'Departure', 'Farewell breakfast in Zermatt. Train to Zurich Airport for departure.', (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking'));

-- =========================================================
-- Sample blog posts
-- =========================================================
INSERT INTO blog_post (slug, title, summary, content, cover_image, author, tags, published, published_at) VALUES
(
    'top-beach-destinations-2025',
    'Top 10 Beach Destinations for 2025',
    'From the Maldives to Santorini, discover the world''s most breathtaking beach getaways for your 2025 bucket list.',
    '<p>Whether you are chasing turquoise waters, powder-white sands, or dramatic volcanic shores, 2025 is the perfect year to book your dream beach escape. Here are our top ten picks, curated by our travel experts.</p><p>The <strong>Maldives</strong> continues to reign supreme with impossibly blue lagoons and overwater villas designed for complete privacy. <strong>Santorini</strong> enchants with its dramatic caldera views and unique black and red sand beaches. <strong>Bali</strong> offers a spiritual twist on the classic beach holiday — combine temple visits with surf lessons in Seminyak.</p><p>Further afield, <strong>the Seychelles</strong> offer granite-boulder beaches unlike anywhere else on earth, while <strong>the Azores</strong> in Portugal give you dramatic volcanic coastlines and whale watching. Closer to home, <strong>Algarve</strong> in Portugal and <strong>Dubrovnik</strong> in Croatia round out the European offerings.</p><p>Wherever you choose, book early — these destinations sell out fast in peak season. Our team is ready to help you plan the perfect beach holiday.</p>',
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'beach, destinations, 2025, travel tips',
    true, NOW() - INTERVAL '21 days'
),
(
    'how-to-pack-light-travel',
    'How to Pack Light for a 2-Week Trip',
    'Our expert travel tips for traveling with just a carry-on, no matter where you are headed or how long your trip.',
    '<p>Overpacking is the number one travel mistake. Lugging a heavy suitcase through cobblestone streets or crowded airports can turn a dream holiday into hard work. The good news? With the right strategy, you can fit everything you need for two weeks into a single carry-on bag.</p><p><strong>Choose the right fabrics.</strong> Merino wool and technical synthetic fabrics resist odour, dry fast, and pack small. They also work in hot and cold climates. Avoid denim — it is heavy, slow to dry, and inflexible.</p><p><strong>Stick to a three-colour palette</strong> so every piece of clothing mixes and matches. If everything goes with navy, white, and khaki, you can create many different outfits with far fewer items.</p><p><strong>Roll, do not fold.</strong> Rolling clothes reduces wrinkles and saves space. Use packing cubes to keep things organised and compressible.</p><p><strong>Use travel-sized toiletries</strong> or solid bars (shampoo, conditioner, soap) that take up almost no space and won''t leak. Most hotels and guesthouses provide the basics anyway.</p><p>The golden rule: lay out everything you plan to pack, then put half of it back. You will not miss it — and your back will thank you.</p>',
    'https://images.unsplash.com/photo-1553361371-9b22f78e8b1d?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'travel tips, packing, advice, carry-on',
    true, NOW() - INTERVAL '14 days'
),
(
    'hidden-gems-southeast-asia',
    'Hidden Gems: Off the Beaten Path in Southeast Asia',
    'Escape the tourist crowds and explore these lesser-known wonders scattered across one of the world''s most diverse regions.',
    '<p>Southeast Asia is home to some of the world''s most visited destinations — Bali, Phuket, Angkor Wat. But venture off the main trail and you will discover a completely different world: one of silence, authenticity, and genuine connection.</p><p><strong>Ha Giang, Vietnam.</strong> While tourists flock to Halong Bay and Sapa, the extreme north of Vietnam remains almost entirely unexplored by foreigners. The Ha Giang loop — a 350 km motorbike circuit through jaw-dropping karst mountains and ethnic minority villages — is one of Asia''s great road trips.</p><p><strong>Kep, Cambodia.</strong> Most visitors rush from Phnom Penh to Siem Reap. But the sleepy coastal town of Kep, once a French colonial retreat, offers crab markets, pepper plantations, and a genuinely unhurried pace of life.</p><p><strong>Siargao, Philippines.</strong> Famous among surfers but still quiet compared to Boracay. Siargao offers world-class waves, pristine lagoons, and the famous cloud-nine break — all in an island atmosphere that feels undiscovered.</p><p>The best travel experiences are rarely found in guidebook headlines. Ask locals, follow the small roads, and be willing to go slow.</p>',
    'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'Southeast Asia, hidden gems, backpacking, off the beaten path',
    true, NOW() - INTERVAL '7 days'
),
(
    'why-santorini-bucket-list',
    'Why Santorini Should Be on Your Bucket List',
    'The iconic Greek island offers far more than just stunning sunsets — here is everything that makes Santorini unmissable.',
    '<p>There is a reason Santorini appears on virtually every bucket list. The island''s dramatic caldera, formed by one of the largest volcanic eruptions in recorded history, creates a landscape unlike anywhere else on earth. Perched on the crater''s rim, the iconic villages of Oia and Fira shimmer in brilliant white and blue against the impossibly deep Aegean Sea.</p><p><strong>The sunsets.</strong> Oia''s legendary sunset draws crowds each evening — and rightly so. The way the light changes over the caldera, from gold to amber to deep purple, is genuinely breathtaking. Arrive early to secure a spot on the castle ruins.</p><p><strong>The history.</strong> Santorini is not just beautiful — it is archaeologically profound. The ancient Minoan city of Akrotiri, buried under volcanic ash in 1613 BC and preserved like a Greek Pompeii, is one of the most significant Bronze Age sites in the world.</p><p><strong>The beaches.</strong> Santorini''s volcanic heritage gives it beaches unlike any other: Red Beach with its rust-coloured cliffs, black-sand Perissa where you can swim until midnight, and the dramatic Vlychada with its lunar rock formations.</p><p><strong>The food and wine.</strong> The island''s volcanic soil produces distinctive wines — particularly the crisp, mineral Assyrtiko grape — and its restaurants serve some of the finest seafood in Greece.</p><p>Santorini rewards those who come curious. Go beyond the photographs, and you will find a place that gets under your skin permanently.</p>',
    'https://images.unsplash.com/photo-1507501336603-6260d4b3f430?w=800&q=80&auto=format&fit=crop',
    'MyTravelLine Team', 'Greece, Santorini, Europe, island, bucket list',
    true, NOW() - INTERVAL '3 days'
);

-- =========================================================
-- Sample approved reviews
-- =========================================================
INSERT INTO review (author_name, author_location, rating, content, approved, tour_id) VALUES
(
    'Sarah Mitchell', 'London, UK', 5,
    'The Bali Adventure Package was everything I dreamed of and more. Our guide Wayan was incredibly knowledgeable and made every moment feel special. The sunrise trek up Mount Batur was breathtaking — standing above the clouds as the sun rose over the volcano is something I will remember for the rest of my life. Highly recommend MyTravelLine!',
    true, (SELECT id FROM tour WHERE slug = 'bali-adventure-package')
),
(
    'James & Emma Thompson', 'New York, USA', 5,
    'My wife and I had the most magical honeymoon in the Maldives. Every single detail was perfectly arranged — from the stunning overwater villa to the private sunset beach dinner. The coral snorkelling was incredible; we had never seen marine life like that. Worth every penny. Thank you MyTravelLine for making our honeymoon absolutely unforgettable.',
    true, (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape')
),
(
    'Emma Krause', 'Berlin, Germany', 4,
    'The Swiss Alps Hiking Adventure was spectacular. The trails were challenging in the best possible way, and the scenery is beyond what any photograph can capture. Our guide was excellent — patient, knowledgeable, and always attentive to safety. One hiking day was cut short due to weather, but that is just the mountains. An experience I would do again without hesitation.',
    true, (SELECT id FROM tour WHERE slug = 'swiss-alps-hiking')
),
(
    'Michael Barnes', 'Sydney, Australia', 5,
    'The Serengeti Safari was simply a life-changing experience. Watching the wildebeest migration up close is something no documentary can prepare you for — the scale, the sound, the raw power of nature. Our ranger Elias was phenomenal: knowledgeable, passionate, and he always found the wildlife even when others could not. The luxury tented camps were extraordinary. 10 out of 10.',
    true, (SELECT id FROM tour WHERE slug = 'serengeti-wildlife-safari')
),
(
    'Priya Sharma', 'Dubai, UAE', 5,
    'I have travelled extensively across Asia but this Bali trip was truly special. The combination of adventure, spirituality, and natural beauty is unmatched anywhere. The white-water rafting was exhilarating, the temple ceremonies were awe-inspiring, and the cooking class with the local family was the highlight of the week. MyTravelLine took care of every detail seamlessly. Already planning my next trip with them!',
    true, (SELECT id FROM tour WHERE slug = 'bali-adventure-package')
),
(
    'David Laurent', 'Toronto, Canada', 4,
    'The Kyoto Cultural Journey exceeded every expectation. The tea ceremony with our host Michiko was the highlight — she was so warm and patient, and we left feeling like we truly understood something about Japanese culture. The itinerary struck the perfect balance between structured sightseeing and free time to wander and discover on our own. Kyoto is a treasure and MyTravelLine showed us the very best of it.',
    true, (SELECT id FROM tour WHERE slug = 'kyoto-cultural-journey')
);
