-- V8__add_translations.sql
-- HY (Armenian) and RU (Russian) translations for all V7 content.
-- EN is already stored in the entity tables — only HY and RU go here.

-- =========================================================
-- CATEGORIES — field: name
-- =========================================================
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('category', (SELECT id FROM category WHERE slug = 'beach'),     'HY', 'name', 'Ծով ու Կղզի'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'honeymoon'), 'HY', 'name', 'Մեղրամիս'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'adventure'), 'HY', 'name', 'Արկածային'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'cultural'),  'HY', 'name', 'Մշակութային'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'city-break'),'HY', 'name', 'Քաղաքային Ճամփորդություն'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'family'),    'HY', 'name', 'Ընտանեկան'),

                                                                            ('category', (SELECT id FROM category WHERE slug = 'beach'),     'RU', 'name', 'Пляж и острова'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'honeymoon'), 'RU', 'name', 'Медовый месяц'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'adventure'), 'RU', 'name', 'Приключения'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'cultural'),  'RU', 'name', 'Культурный'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'city-break'),'RU', 'name', 'Городской отдых'),
                                                                            ('category', (SELECT id FROM category WHERE slug = 'family'),    'RU', 'name', 'Семейный');

-- =========================================================
-- DESTINATIONS — fields: name, description
-- =========================================================
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES

-- Maldives
('destination', (SELECT id FROM destination WHERE slug = 'maldives'), 'HY', 'name',
 'Մալդիվներ'),
('destination', (SELECT id FROM destination WHERE slug = 'maldives'), 'HY', 'description',
 'Հնդկական օվկիանոսում ցրված 1200 մարջանյա կղզիներ — Մալդիվները աշխարհի բացարձակ կղզային դրախտն է: Ջրի վրա կառուցված վիլլաներ, ծովային կրիաներով հագեցած ռիֆեր, և մայրամուտ, որն ամբողջ հորիզոնն ի կրակ է դնում:'),
('destination', (SELECT id FROM destination WHERE slug = 'maldives'), 'RU', 'name',
 'Мальдивы'),
('destination', (SELECT id FROM destination WHERE slug = 'maldives'), 'RU', 'description',
 'Ожерелье из 1200 коралловых островов в Индийском океане — Мальдивы являются абсолютным островным раем планеты. Виллы над водой, рифы с морскими черепахами и закаты, поджигающие весь горизонт.'),

-- Bali
('destination', (SELECT id FROM destination WHERE slug = 'bali'), 'HY', 'name',
 'Բալի'),
('destination', (SELECT id FROM destination WHERE slug = 'bali'), 'HY', 'description',
 'Բալին «Աստծո կղzla» է՝ ոչ ի ունայն: Կենդանի հինդու տաճարները բարձրանում են կանաչ բրնձի դաշտերի ֆոնի վրա, ծովային ռիֆեր հանդիpum en ճermaak avasdi aperin, isk Balee mshagooyt nervee jermootyoonn ynkamnel e kghalee amen ankyoony:'),
('destination', (SELECT id FROM destination WHERE slug = 'bali'), 'RU', 'name',
 'Бали'),
('destination', (SELECT id FROM destination WHERE slug = 'bali'), 'RU', 'description',
 'Бали — Остров Богов, и это звание заслужено. Священные индуистские храмы возвышаются над изумрудными рисовыми террасами, пляжи с белым песком встречаются с серфингом мирового класса, а тепло балийской культуры пронизывает каждый уголок острова.'),

-- Dubai
('destination', (SELECT id FROM destination WHERE slug = 'dubai'), 'HY', 'name',
 'Դուbaiiy'),
('destination', (SELECT id FROM destination WHERE slug = 'dubai'), 'HY', 'description',
 'Դubaiyn anmtootyoon e apreevcnoom — apat''akayin horizont anap''atee kologhmeen, reekordayin chardarapetoot''yoon, ashkharhi makaardayin groomer oo vooskegheen anvaan mee kaghakoom: Avelacreek arev ambogh tarvaeen oo motak tsovafneer — artasanky andimadr e:'),
('destination', (SELECT id FROM destination WHERE slug = 'dubai'), 'RU', 'name',
 'Дубай'),
('destination', (SELECT id FROM destination WHERE slug = 'dubai'), 'RU', 'description',
 'Дубай поражает воображение — футуристический небосклон из пустыни, рекордная архитектура, шопинг мирового класса и золотые дюны в одном городе. Добавьте чистые пляжи и солнце круглый год — результат неотразим.'),

-- Santorini
('destination', (SELECT id FROM destination WHERE slug = 'santorini'), 'HY', 'name',
 'Սantorinee'),
('destination', (SELECT id FROM destination WHERE slug = 'santorini'), 'HY', 'description',
 'Martkootyan badmootyan khoshoor hrapoojtyal partoototyoonnereed meeeden dzevavorvats Santorinee-ee kaldéran, speetak-kapooyt ghyoogheruh oo legendar mayramooty ann amenapatkervaats oo amena kaakhardakankh vekyernered Yerkree vra:'),
('destination', (SELECT id FROM destination WHERE slug = 'santorini'), 'RU', 'name',
 'Санторини'),
('destination', (SELECT id FROM destination WHERE slug = 'santorini'), 'RU', 'description',
 'Созданный одним из крупнейших вулканических извержений в истории человечества, драматичный пейзаж кальдеры Санторини, белоснежные деревушки и легендарные закаты делают его одним из самых фотографируемых и волшебных мест на Земле.'),

-- Paris
('destination', (SELECT id FROM destination WHERE slug = 'paris'), 'HY', 'name',
 'Փarriz'),
('destination', (SELECT id FROM destination WHERE slug = 'paris'), 'HY', 'description',
 'Luysee kaghaky dzanotootyoon chee pahanyoom: Parrizn artzhanuycnoom e aytseeluotyunneryn ashkharhi makaardayin tangaranner, haverzheen chardarapetootyoon, arxavor khohank, yev romantikayee mtnolort, vor darerr ee vra ogheshine artistner:'),
('destination', (SELECT id FROM destination WHERE slug = 'paris'), 'RU', 'name',
 'Париж'),
('destination', (SELECT id FROM destination WHERE slug = 'paris'), 'RU', 'description',
 'Город Света не нуждается в представлении. Париж награждает посетителей музеями мирового класса, вечной архитектурой, изысканной кухней и непревзойдённой атмосферой романтики, вдохновлявшей художников на протяжении веков.'),

-- Phuket
('destination', (SELECT id FROM destination WHERE slug = 'phuket'), 'HY', 'name',
 'Ֆookéet'),
('destination', (SELECT id FROM destination WHERE slug = 'phuket'), 'HY', 'description',
 'Tailandee amenaméts kghalee-n meeacnoom e hrashalee tsovafner, kapooyt gortsich, hin budayakan tacharner yev jerm hյoorinkalar mshagooyt: Kghzeree sharzhootyoon, champorhdootyoon naverov kam pashtonakaan tsovafeen harootyoon — Fookéety ameen bany kavee:'),
('destination', (SELECT id FROM destination WHERE slug = 'phuket'), 'RU', 'name',
 'Пхукет'),
('destination', (SELECT id FROM destination WHERE slug = 'phuket'), 'RU', 'description',
 'Крупнейший остров Таиланда сочетает потрясающие пляжи, яркую ночную жизнь, древние буддийские храмы и тёплую гостеприимную культуру. Путешествуйте по островам на лодке или просто отдыхайте на золотом берегу — Пхукет справится с любой задачей.'),

-- Tbilisi
('destination', (SELECT id FROM destination WHERE slug = 'tbilisi'), 'HY', 'name',
 'Թbeeliisee'),
('destination', (SELECT id FROM destination WHERE slug = 'tbilisi'), 'HY', 'description',
 'Vrastandee hin mairakaghaky Kovkasee khoshoor gastropner meed en: Tbiliseeum meeacvoom en midzhnatarain berdery, tstsumbayin bankayin taraghamy yev acharjkaly karavachootyoon yev geenee mshagooyt — amboghen Kovkasyan Lerneree anvan foni vra:'),
('destination', (SELECT id FROM destination WHERE slug = 'tbilisi'), 'RU', 'name',
 'Тбилиси'),
('destination', (SELECT id FROM destination WHERE slug = 'tbilisi'), 'RU', 'description',
 'Древняя столица Грузии — один из лучших секретов Кавказа. Тбилиси сочетает средневековые крепости, серные бани и процветающую культуру еды и вина — всё это на фоне величественных Кавказских гор.'),

-- Kyoto
('destination', (SELECT id FROM destination WHERE slug = 'kyoto'), 'HY', 'name',
 'Կiooto'),
('destination', (SELECT id FROM destination WHERE slug = 'kyoto'), 'HY', 'description',
 'Yaponiayee hin kaiserakan mairakaghaky kensandee tangaran e: YUNESKO-ee 17 dzharankootyan vayer, hazar tachar yev seentaran, bam-bookee poorak, yev katareal estaytika Kiotoon gasnen Yerkree amena mshagootayin harshoont kaghaknereed meed:'),
('destination', (SELECT id FROM destination WHERE slug = 'kyoto'), 'RU', 'name',
 'Киото'),
('destination', (SELECT id FROM destination WHERE slug = 'kyoto'), 'RU', 'description',
 'Древняя имперская столица Японии — живой музей. Семнадцать объектов Всемирного наследия ЮНЕСКО, тысячи храмов и святилищ, бамбуковые рощи и глубокая эстетическая утончённость делают Киото одним из культурно богатейших городов мира.');

-- =========================================================
-- TOURS — fields: name, description
-- =========================================================
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES

-- Maldives Honeymoon
('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'name',
 'Մeghramasayin Champorhdutyoon Maldivner'),
('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'description',
 '<p>Dzherasanakan kyankty skskeek Yerkree amena anfaseli vekyernereeden meeoom: Ayd 6-orya meghramsayin fyootet dzheraskan meedeen yev anhaad veelan jest jorree vra karooyts avazathmbee vra, or hash hatknooy pyirowzegheen ljaki tajee vra: Amen arekagoyin artyunakoom e okyanosi dzaynov. Amen erkooyan avelovoom e avasathmbee vra joshovsatzvats charashinakedeen ootoom myees asdghazard erkinkee tak:</p><p>Anhat yev skhasheenee seerov letsoon maldeevayin botanikanerov jermakoorootyoon bareen yeresoon derooy eenchpees mee vayelaleeyoot ka: Ayd e dzer yerorel meghrameesee:</p>'),
('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'RU', 'name',
 'Медовый месяц на Мальдивах'),
('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'RU', 'description',
 '<p>Начните совместную жизнь в одном из самых захватывающих мест на Земле. Этот 6-дневный пакет для медового месяца размещает вас в частной вилле над водой со стеклянным полом, открывающим вид на бирюзовую лагуну. Каждое утро вы просыпаетесь под звуки океана, каждый вечер заканчивается ужином при свечах на песчаной отмели под звёздным небом.</p><p>Ваш личный дворецкий позаботится о каждой детали: трансфер на гидросамолёте, шампанское при заезде и особые сюрпризы на протяжении всего отдыха. Это медовый месяц вашей мечты.</p>'),

-- Bali
('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'name',
 'Baleeyee Amboghjakaan Feardrootyoon'),
('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'description',
 '<p>Baleey oosharnakayin hashveekner oonee, yev ayd 8-orya tooryn navandvats e dzez cameen drantseen ceroytsel: Skskeek Ubud-oom — brindzee dashterr, Mekhkee Ankarat yev ashoonee tanee yorevayin tarootee andadzrooteamb: Shabathvay jarayin zorootyoon patatrat yerek aktiv hrapoojtyal Batur Lerr verakhoornaloom — arajaboosher arevee barekootyamb ambookhneree vra ankarev vayelelook pareventsel ey:</p><p>Varjin oreery dzez taner Seminyak yev Uluwatu — asdghazard tsovafner, kin-arachar tarootee yev krayali Kecak hrakanerev: Balee amarjyan:</p>'),
('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'RU', 'name',
 'Бали: полное погружение'),
('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'RU', 'description',
 '<p>Бали — место поразительных контрастов, и этот 8-дневный тур создан, чтобы показать вам все из них. Начните в культурном сердце Бали — Убуде: рисовые террасы, священный Обезьяний лес и завораживающий танец Кечак на закате.</p><p>В середине тура покорите действующий вулкан Батур на рассвете — подъём на вершину, когда солнце встаёт над облаками, — это опыт, который меняет мировоззрение. Последние дни — пляжи Семиньяка, серфинг и храм Улувату над океаном. Бали во всей полноте.</p>'),

-- Dubai
('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'name',
 'Дubaiy: Kaghak yev Anapaat'),
('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'description',
 '<p>Дubaiy reekordnerree kaghak e, yev ayd 5-orya tooryn dzez taranom amboghjoveen: Ekheer Burj Khalifayee kedeyin — ashkharhi amenaberji shenken — deekeverd avakir kaghaky dzgoom e hayachkyeen: Ourekoor sharooneek Дubai Creek-oom vor hasel khanutneree ev hambemee arayin ayshkhe:</p><p>Eerekoon 4x4-nerd skeeboon anapaat: Dune bashing, oghty erknoots, Bedueenan khavoorn jashootyoon yev asdgherr ambookhneree vra: Sirelee gordzaranerov shat mer khavoorneren:</p>'),
('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'RU', 'name',
 'Дубай: город и пустыня'),
('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'RU', 'description',
 '<p>Дубай — город рекордов, и этот 5-дневный тур познакомит вас с лучшими из них. Поднимитесь на вершину Бурдж-Халифы — самого высокого здания в мире — пока город расстилается у ваших ног. Исследуйте старые золотые рынки и рынки пряностей у Дубай-Крик.</p><p>На третий день колонна внедорожников направляется в красные дюны Аравийской пустыни: катание по дюнам, езда на верблюдах и роскошный ужин в бедуинском лагере под звёздами. Контраст с городом, который вы покинули несколько часов назад, поражает и не забывается.</p>'),

-- Santorini
('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'name',
 'Санtoreeni-ee Yeraz'),
('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'description',
 '<p>Yerki vra kapooyt-spitak guygheri yev kaldérayi ov Santorini-en yerazhshtakaan tesaran e: Ayd 7-orya tooryn dzer talis a zhamanak yev janaparhi uzhecootyoon Santorini-n verakagooy nakaragelov ceroytsel: Oiayi guyghee arshaloosi arshalooseed, kaldérayi karranov kavanakoose Atroratveed, yev apeenee kheberi vra jashkeel mayramoote:</p><p>YUNESKO-ee Akrotiri bazkoomnerr, aydghootyoon hrapchotyoone yev kacharran Assyrtiko geeneen ootatsootyoon — Santorineey amene lov ban:</p>'),
('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'RU', 'name',
 'Мечта о Санторини'),
('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'RU', 'description',
 '<p>Мало где на земле первое впечатление бывает таким мощным и немедленным, как на Санторини. Этот 7-дневный тур даёт вам время и сопровождение, чтобы увидеть остров далеко за пределами его знаменитых фотографий.</p><p>Деревня Ойя на рассвете до прихода толп, катамаранный круиз по кальдере, вулканические горячие источники, дегустация ассиртико у края кальдеры и руины Акротири — Санторини во всей глубине.</p>'),

-- Paris
('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'name',
 'Romantik Champorhdootyoon Париж'),
('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'description',
 '<p>Парижн amena romantik kaghakyee hambar earn e, yev ayd 5-orya champorhdootyoonn avandvats e ayd romantikann leeoveen mateetsnel: Zhamanoomeek dzyer hoteleoom tsaghikner yev shampyen e gortnoom, Sena gordin zavakeen: Araj yerekoy Eiffel-ee kooshkeen luyserov kakhardoom e Paris yerekyayin horyizonte:</p><p>Luvroo, Monmartrr, Versali aghavaroosaneek yev araytee jermootyamb Seine-ee gayshavoori taroyn — Paris-ee amena seereleek zhamovats ordeen:</p>'),
('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'RU', 'name',
 'Романтический побег в Париж'),
('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'RU', 'description',
 '<p>Париж оправдывает свою репутацию самого романтичного города мира каждый день, и этот 5-дневный тур создан, чтобы передать эту романтику в полной мере. Прибытие — цветы и шампанское в номере у Сены. Первый вечер — Эйфелева башня в огнях.</p><p>Лувр, Монмартр, Версаль и частный круиз по Сене на закате — Париж в самом интимном и незабываемом исполнении.</p>'),

-- Phuket
('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'name',
 'Ֆookéet: Entaneekakan Tsovafnayin Hangest'),
('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'description',
 '<p>Tailandy amena hravirakees champorhdakhmbeen aayen e entaneekneri hamar, yev ayd 8-orya Фookéet yev hangestee amene navandvats e bolor tariqayi zekoytsal: Der e tsovafeen mot mezh koghner kaver hankstavayr vayroom Kata Beach-oom — apaho khonakooteamb gorktsee Tailandee kortsapatr kheel:</p><p>Phang Nga Bay, pheelan arjantarootyoon, Phi Phi Kghzleeayk yev ooghtayin azgeegee eyts — amen mardov entaneekyoom mer ameenen kartseli berkoots:</p>'),
('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'RU', 'name',
 'Пхукет: семейный пляжный отдых'),
('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'RU', 'description',
 '<p>Таиланд — одно из самых гостеприимных направлений для семей, и этот 8-дневный отдых на Пхукете создан, чтобы порадовать каждое поколение. Ваша база — просторный пляжный курорт у спокойных вод пляжа Ката.</p><p>Поездки на острова, заповедник слонов, бухта Пханг Нга и острова Пхи-Пхи — что-то для каждого члена семьи. Таиланд покорит все сердца в семье.</p>'),

-- Georgia
('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'name',
 'Vraastan yev Kovkas: Haytnagordzootyoon'),
('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'description',
 '<p>Vrastandy amena hne yev amena chapazanch champorhdakankh vekyernered meeden e, yev ayd 6-orya tooryn batsahaytnoom e anoom khorhrdavor khoorekootyoonnerr: Skskeek Tbilisoom — Heen Kaghakee fhoghradzev nereragnalov, Abanootoobaanee tstsoombayin banhkern antsnemov yev vaarenakhchovekan erekooyne voske gellary avakhtsne vra:</p><p>Kovkas Lernerr, Kazbegi, Gergeti ekeghetseeee yev Kakhetiyi geenootekhny — Vrastandy pakharvoom e soort yev mard e:</p>'),
('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'RU', 'name',
 'Грузия и Кавказ: открытие'),
('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'RU', 'description',
 '<p>Грузия — одно из старейших и самых недооценённых направлений в мире, и этот 6-дневный тур раскрывает её удивительную глубину. Начните в Тбилиси: мощёные улочки Старого города, серные бани Абанотубани и потрясающая сцена вина и еды.</p><p>Горы Большого Кавказа, монастырь Гергети, Казбеги и винный регион Кахети с традиционными квеври — Грузия тёплая и настоящая.</p>'),

-- Kyoto
('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'name',
 'Կiooto: Mshagootayin Chharotyoon'),
('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'description',
 '<p>Кiootoy Yaponiayi mshagootyoonn e yev ayd 7-orya kenchootyoonn avandvats e ays mshagootyoonnen dzez iravoomov martsel avelee khork: Aznvakan champordhootyoonn e ardee khoosavorvorvotz mee mardoo het, vor bazkoom e Yaponiyi sovorooteevnery, barkootyoonnery yev manramerdzamasakerootyoonnery:</p><p>Fushimi Inari arshaloosid, yayajooran khoosavorvorvotz mee matakoomdzoytsichy het, Arashiyama, Kinkaku-ji yev Gion-ee pariykakan yerekooy — Kiootoy baczahaytnoom e anoom:<p>'),
('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'RU', 'name',
 'Киото: культурное погружение'),
('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'RU', 'description',
 '<p>Киото — это Япония в чистом виде. Этот 7-дневный тур создан не только для того, чтобы показать вам выдающиеся достопримечательности Киото, но и чтобы дать вам настоящий доступ к традициям и историям, стоящим за ними.</p><p>Святилище Фусими Инари на рассвете, частная чайная церемония с мастером в трёхсотлетнем доме, бамбуковая роща Арасияма, Золотой павильон и вечерняя прогулка по Гиону — Киото открывается слой за слоем.</p>');

-- =========================================================
-- TOUR ITINERARY DAYS (stored on tour entity)
-- field format: itinerary_day_{dayNumber}_title / _description
-- =========================================================

-- ── Maldives Honeymoon Escape (6 days) ──────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_1_title','Жамanoom yev Tsovootunayin Veerap''okhanakoom'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_1_description','Vayrekogh Malé jameerokhum yev tsovootunayin mi veerap''okhanakoom knagoreek: Veelayn meyj chanachootyoon khatkooteamb shampyen, tsaghikner yev Hindkakan Oveanyany dznovogh edzhereeny:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_2_title','Reefee Snorkeling yev Spa'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_2_description','Batsahayteek dzer kghalee reefen — tsovkayin khpchakner, reefayin shatnery yev manta raynery: Apoloreek 90-rop zekaravorich jooghayin spa arzekhootyoon maldeevayin botanikanerov:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_3_title','Avazathmbi Piknik yev Mayramootayin Naverakaleen'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_3_description','Anhat dhoniyn dzez taner ee anpashtonahaytogh avazathomb lagooneeen meydj champyen-ov pikniki: Mayramootin ardzhanapeloov nerekareen vooshov naverakaleen koghben:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_4_title','Delfinneree Dyoorotyoon yev Reefi Snorkeling'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_4_description','Arekagoyin arshaveerotyoon delfinnerr handipel batsardzootyoon meydj — Maldivnerr oonoodooreek megnootyamb yegheen delfinnerr ashkharhoom: Apalekon snoorkeling chor tsovayee patee vra:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_5_title','Anhat Tsovafayin Jashkootyoon'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_5_description','Or amboljootyamb dzeer hakow — arekagoyin loogharik, anhat lavoozanoomeed, kin karkeel broneakoom: Yerekoy dzer anhat khodakapah krakzart seeran vra ayreek jashkootyoon e berdzi:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_6_title','Maekoomnavor Orr'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'HY','itinerary_day_6_description','Verjeen loogharik meneek shap''oorin araj tsovootunayin dzez veradardznoom ee Malé: Ket''oom ek hivandootyoonner, vor kayanaten mee amarjyan:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_1_title','Прибытие и перелёт на гидросамолёте'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_1_description','Приземлитесь в международном аэропорту Мале и сядьте на гидросамолёт для самого живописного 30-минутного перелёта в вашей жизни. В вилле вас ждут шампанское, цветы и Индийский океан до горизонта.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_2_title','Снорклинг на рифе и спа'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_2_description','Исследуйте частный домашний риф острова в собственном темпе — морские черепахи, рифовые акулы и манты являются постоянными гостями. Вечером: 90-минутный спа-ритуал для пары с традиционными мальдивскими ботаническими маслами.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_3_title','Пикник на отмели и круиз на закате'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_3_description','Частная дхони доставит вас на уединённую отмель посреди лагуны для пикника с шампанским. На закате — волшебный круиз через атолл в золотых лучах.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_4_title','Наблюдение за дельфинами и снорклинг'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_4_description','Утренняя экскурсия для наблюдения за дельфинами-спиннерами в открытом океане — Мальдивы обладают наибольшей концентрацией дельфинов в мире. Снорклинг над глубокой коралловой стеной.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_5_title','Частный ужин на пляже'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_5_description','День полностью в вашем распоряжении. С наступлением ночи дворецкий сервирует стол со свечами прямо на пляже — звёзды отражаются в зеркально спокойном океане.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_6_title','Отъезд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='maldives-honeymoon-escape'),'RU','itinerary_day_6_description','Последнее утреннее купание перед тем, как гидросамолёт доставит вас обратно в Мале. Вы уезжаете с воспоминаниями на всю жизнь.');

-- ── Bali Complete Experience (8 days) ────────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_1_title','Жamanooom Ubud-oom'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_1_description','Tarber ee Ubud, Baleei mshagootayin cendron: Yereko barekhoos jashkootyoon traditsionakayin Legong patkomagrooteamb:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_2_title','Tegallalang yev Sreejani Antar Antarakankh'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_2_description','Arekagoyin Aziayi amena patkervats bazkoomnereed meeden — Tegallalang-ee bradnogh brindzee dashterr: Apalekon Sangeh Antar Antarakee meyj yev Tirta Empul joor tachary:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_3_title','Batur Lerree Arshaloosayin Barkoom'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_3_description','Gavit 2-een skees barkoomn ee Baleei aktiv hrapoojtyal: Heek 1,717 metr bareekin arshaloosi heted yev tesek arevee kenoonal ambookhneree vra Batur Ljerri yev Agung Lerri vra:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_4_title','Ayung Gerr Rafting'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_4_description','Ayung gern antsnoom e djoonklee keerchee meydj, antsnelov jrhaykner, pokagorts khoot''agorts yev kakhgats tsarer: Dzher gitsoorr gortsakorneern rafting-n acharjkali, bayts anvtang kapen:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_5_title','Baleeyee Khoharary Dashtery'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_5_description','Arekoteen entaneekoom sovorek parastel hinch avoondapashtoonagan Baleei jashaki — lawar, sate lilit, nasi campur: Apalekon arajar spa arzekhootyoonneri kaam Ubud-ee arvestagjooyi shooky hamaar:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_6_title','Tanah Lot Tarber'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_6_description','Meknel Baleei cendronee meyjoov: Bayts kanknem Tanah Lot tsovafayin tachary — okyanosi meyj verrkaghats khooroozi vra — voske zhameen, ashkharhi amena patkerk surb vekyernered meeden:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_7_title','Uluwatu yev Kecak Hov-Parer'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_7_description','Batsahayteek Bukit taraghamen: Uluwatu tachary 70 metr keropeh okyanosee vra, Padang Padang tsovafeen oo Kecak hov-pararan mayramoot:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_8_title','Seminyak yev Maekoomnavorotyoon'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'HY','itinerary_day_8_description','Verjeen arekoteen Seminyak tsovafeen vra: Brunch tsovafayin kafe-oom menkootnootyan araj koomanaboorbaran: Balee noor ket''oom tzee:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_1_title','Прибытие в Убуд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_1_description','Переезд в Убуд — культурное сердце Бали. Вечерний приветственный ужин с традиционным танцем Легонг.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_2_title','Тегаллаланг и Священный лес обезьян'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_2_description','Утро среди рисовых террас Тегаллаланга — одного из самых фотографируемых пейзажей Азии. Днём: прогулка по Священному обезьяньему лесу Сангех и водяной храм Тирта Эмпул.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_3_title','Восход на вулкане Батур'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_3_description','Подъём в 2 ночи для восхождения на действующий вулкан Бали. Вершина 1717 м на рассвете — солнце встаёт над облаками над озером Батур и горой Агунг. Момент абсолютной, невыразимой красоты.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_4_title','Рафтинг по реке Аюнг'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_4_description','Река Аюнг прорезает глубокое ущелье джунглей мимо водопадов и нависающих тропических деревьев. Опытные гиды делают рафтинг захватывающим, но безопасным.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_5_title','Кулинарный мастер-класс по-балийски'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_5_description','Утро в семейном доме — учитесь готовить пять традиционных балийских блюд: лавар, сате лилит, наси чампур. День свободен для спа или рынка искусств Убуда.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_6_title','Переезд на юг и Танах Лот'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_6_description','Переезд на юг Бали. Посещение морского храма Танах Лот на скале в океане в золотой час — одна из самых драматично красивых храмовых декораций в мире.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_7_title','Улувату и танец Кечак'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_7_description','Храм Улувату на скале высотой 70 м над океаном, пляж Паданг-Паданг и легендарный танец Кечак у огня на закате.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_8_title','Семиньяк и отъезд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='bali-complete-experience'),'RU','itinerary_day_8_description','Последнее утро на пляже Семиньяк. Бранч в кафе у океана перед трансфером в аэропорт. Бали позовёт вас обратно.');

-- ── Dubai City & Desert (5 days) ─────────────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_1_title','Жamanooom yev Dubai Marina'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_1_description','Zbekagooreek yev arajeen yereko antskreek Dubai Marina-yi lousavorvats proomenadov — jangaraneree kaytsagharmood anavary: Jashkootyoon marina-apeen restoran-oom:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_2_title','Burj Khalifa yev Hin Dubaiy'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_2_description','Arekoteen Burj Khalifa-yi verey (148-rd hark): kaghaky, anapaty yev Tsovakhoor terosh ee horizont: Apalekon navakoop Dubai Creek-ov Voskie yev Bukhoormayin Shookerr:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_3_title','Anapatayin Safari'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_3_description','Apalekon 4x4-neroo sharaseeroont ooghvorvoum e krasnakuy arabayin anapat: Dune bashing, aval surging, ooghtee erknoots: Mayramooti heted jashkootyoon Bedueenan khavoorn arabayin khoshoots, aroosayk, keensahi moozeeka yev asdgherr:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_4_title','Atlantis, The Palm yev JBR Tsovaf'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_4_description','Arekoteen Aquaventure Waterpark-oom Palm Jumeirah-oom: Acharchkali slyaydnery yev anhat tsovaf Dubai skylinee tesaranov: Apalekon JBR tsovafeen pokhootyoon yev mayramoot:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_5_title','Dubai Mall yev Maekoomnavorotyoon'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'HY','itinerary_day_5_description','Verjeen arekoteen groomer Dubai Mall-oom (ashkharhi amenaméts): Kesharyak khoghov keso shooree araj jamapoyhoom: Jamboomm ee Dubai International Airport:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_1_title','Прибытие и Dubai Marina'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_1_description','Заселение и прогулка по освещённой набережной Дубай Марины — лес небоскрёбов, отражённых в воде. Ужин в ресторане у марины.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_2_title','Бурдж-Халифа и Старый Дубай'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_2_description','Утро на вершине Бурдж-Халифы (смотровая площадка 148-го этажа): город, пустыня и Персидский залив до горизонта. Днём — прогулка на лодке по Дубай-Крик к золотым и пряным рынкам.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_3_title','Сафари в пустыне'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_3_description','Колонна внедорожников в красные дюны Аравийской пустыни. Дрифт по дюнам, езда на верблюдах. На закате — бедуинский лагерь: арабская кухня, кальян, живая музыка и звёздное небо.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_4_title','Атлантис, Палм и пляж JBR'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_4_description','Утро в Aquaventure Waterpark на Пальм Джумейра. Частный пляж с видом на небоскрёбы Дубая. Вечером — пляж JBR и закат.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_5_title','Dubai Mall и отъезд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='dubai-city-desert'),'RU','itinerary_day_5_description','Последнее утро для шопинга в Dubai Mall — крупнейшем торговом центре мира. Фонтанное шоу в полдень перед трансфером в аэропорт.');

-- ── Santorini Dream (7 days) ──────────────────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_1_title','Жamanooom Санtoreeni'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_1_description','Ootootyoon Санtoreeni yev tarber dzher caltérayee eejar hoteely: Arajeen yereko — kaldérayi yekhbee yerkarakoom minkamkoom ee mayramootyoon tesnel:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_2_title','Oia Gooyghy yev Akrotiri'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_2_description','Batsahayteek Oia-n arekagoyin arshaloosid — kazmanery, kerconavoyr yev kaltérayi khoostachery — minkcheen avartatsreren araj: Apalekon Akrotiri-ee hin Minosayin kaghaky, voolkanayin merky tak pamblvats 1613 BC-oom:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_3_title','Kaltérayi Katamaran'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_3_description','Ambolgj-orya katamaran Nea Kameni-i voolkanayin kghzleeroveerk: Jermootyoon aghbyoornereeem loghanel, snorkeling khoosavorvorvotz artasanky vra, yev kaldérayi meydj barbeque jashkootyoon nereloo vra:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_4_title','Genooy Doost Kaltérayi Yergas'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_4_description','Santoreen-ee geenooty Yunastaanee amena lav geenooneered meeden e: Yerkooh genootekhner antskreek — kaltérayi khoostovery ktooreek — yev Assyrtiko soortabanootyoon tesanoghe hete dastabanootyoon:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_5_title','Soovageyn Tsovaf yev Perissa'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_5_description','Orer Perissa-yoom, Санtoreeni-ee soovagreyn (soov) avazee tsovafeen vra: Loghanel, ardarkanel yev gooyghi taverner-oom tapakeechdznaceel oodeel kazmahoor tsookahavar yev amena noorer dzooky:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_6_title','Fira yev Pyrgos'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_6_description','Batsahayteek Fira mairkaghaky — Prehistoric Thera-yi muzeyoomy yev hine navelakhorty: Apoolekon lernagooynee Pyrgos gooyghooy meyj — kghzlee amena barjadir kety, aytseleye gortsichits heeroo:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_7_title','Maekoomnavorotyoon'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'HY','itinerary_day_7_description','Verjeen arshaloosn kaltérayi veree dzyer verandakoom: Jambeek Санtoreeni-ee khetavayrooveen: Kghzleen manatsooom e dzez yerkar hatoovoom:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_1_title','Прибытие на Санторини'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_1_description','Перелёт на Санторини и трансфер в отель на краю кальдеры. Вечерняя прогулка по тропе от Фиры до Ойи — последний свет дня гаснет над Эгейским морем.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_2_title','Деревня Ойя и руины Акротири'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_2_description','Ойя на рассвете — синие купола, ветряные мельницы и ступени кальдеры — до прихода дневных туристов. Затем — экскурсия по минойскому городу Акротири, погребённому под пеплом в 1613 г. до н.э.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_3_title','Катамаранный круиз по кальдере'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_3_description','Целый день на катамаране вокруг вулканических островов: купание в термальных источниках, снорклинг, посещение Неа Камени и барбекю-ланч на палубе посреди кальдеры на закате.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_4_title','Дегустация вин на кальдере'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_4_description','Санторини производит одни из лучших вин Греции. Посещение двух винодельческих поместий и дегустация ассиртико, винсанто и никтери с местным сомелье у края кальдеры.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_5_title','Чёрный пляж и Периса'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_5_description','День на Перисе — знаменитом пляже с чёрным песком. Купание, отдых и таверны с жареным осьминогом и свежими морепродуктами.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_6_title','Фира и деревня Пиргос'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_6_description','Столица Фира: музей доисторической Феры и канатная дорога к старому порту. Днём — средневековая деревня Пиргос на вершине горы, вдали от туристических троп.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_7_title','Отъезд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='santorini-dream'),'RU','itinerary_day_7_description','Последний рассвет над кальдерой с вашей террасы. Трансфер в аэропорт Санторини. Остров остаётся с вами надолго после отъезда.');

-- ── Paris Romantic Escape (5 days) ───────────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_1_title','Жamanooom yev Eiffel-ee Keeshery'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_1_description','Zbekagooreek dzyer Left Bank hotely. Yereko Seine-ee yekeghenoov Trocadéro hamaar — Eiffel-ee kooshkeen 10 ev arajtoon lousavoroomeamb Paris-ee keeshery gervelyayin eenchpees mee bazoom luysi:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_2_title','Louvre yev Monmartr'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_2_description','Arekoteen Louvre-oom (ketoreelee tiketnery eemanasazvats): Veenoos deh Meelo, Mona Liza yev handard khaghaghootyamb: Apalekon Monmartr-ee parkoom Sacré-Cœur-n veer — Parisi amena lav anvjar tetasyooyty:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_3_title','Versali yev Seine-ee Naverakalee'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_3_description','Oor Versali aghavaroosanekeek — Oglinerree Srah yev handishandard parteznery: Kasooyty Parris anhat naverakalee-ov Seine gordin mayramootin — kamoornery yev husharyaknerr vooskegheen luysvoom en apalekon:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_4_title','Le Marais yev Sainte-Chapelle'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_4_description','Batsahayteek Marais taraghamen: Place des Vosges, Picasso Muzeyoom yev boutique groomer: Այcerooreek Sainte-Chapelle — 13-rt dari randzraneel apaki luysvoom — Yevropayee amena googhech enteeroornereed meeden:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_5_title','Saint-Germain yev Maekoomnavorotyoon'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'HY','itinerary_day_5_description','Verjeen arekoteen Saint-Germain-des-Prés-ee cafe-apeets prgoolineerd: Croissant yev café crème-ov zavakeel Left Bank brasserie-oom: Jambooym ee Charles de Gaulle airport-oom:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_1_title','Прибытие и вечер у Эйфелевой башни'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_1_description','Заселение в отель на Левом берегу. Вечерняя прогулка вдоль Сены к Трокадеро — Эйфелева башня в огнях 20 000 лампочек в 22:00.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_2_title','Лувр и Монмартр'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_2_description','Утро в Лувре (билеты без очереди включены): Ника Самофракийская, Венера Милосская, Мона Лиза в относительной тишине. Днём — подъём на Монмартр к Сакре-Кёр — лучший бесплатный вид Парижа.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_3_title','Версаль и круиз по Сене'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_3_description','Поездка в Версальский дворец: Зеркальный зал и сады. Возвращение в Париж для частного круиза по Сене на закате — мосты и памятники в золотом свете.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_4_title','Марэ и Сент-Шапель'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_4_description','Квартал Марэ: Пляс-де-Вож, Музей Пикассо и бутики. Сент-Шапель с её потрясающими средневековыми витражами XIII века — один из красивейших интерьеров Европы.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_5_title','Сен-Жермен и отъезд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='paris-romantic-escape'),'RU','itinerary_day_5_description','Последнее утро в кафе Сен-Жермен-де-Пре. Круассан и кофе в легендарной брассери перед трансфером в аэропорт Шарль-де-Голль. À bientôt, Париж.');

-- ── Phuket Family Beach (8 days) ─────────────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_1_title','Жamanooom Ֆookéet'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_1_description','Tarber dzyer tsovafayin hankstavayrin: Apalekon arajeen pokhootyoon Kata Beach-ee hangist jorree meyj, or hanhark e amen tarikee hamar: Yereko tayland barekhoos jashkootyoon hankstavayroom:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_2_title','Joghelee Sanctoory'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_2_description','Arekoteen barenabar joghelee sanctoori meyj antar-oom: Kaparel, looghacnel yev ooghtnerov khambel — barberel anheteen yev arekagoyin handipoom mee manooknerd kyanky:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_3_title','Phang Nga Bay'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_3_description','Ambolgj-orya naverakalee Phang Nga Bay: Tsovakooyn aynkey, mangrovey kanakalee, "James Bond Island" yev loytsvorvogh mooselmaanakan dzkovayin gooyghy: Kayaking tzeek antsoorootyoonnerov:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_4_title','Phi Phi Kghzleeyayk'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_4_description','Aragnootyoon Phi Phi kghzleeyak — Maya Bay, Monkey Beach yev Pileh Lagoon-ee kristalagneen jorrer: Snorkeling Shark Point-ee vra dzyer ooshavorov:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_5_title','Tailandayin Khohakarov Dashtery'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_5_description','Entaneekakan khoharkarov dashtery teeghakaan khmabar: Soovoreek pad thai, green curry yev mango sticky rice barastel: Apalekon arajar Phuket Hin Kaghak-ee goohnavaor Sino-Portuguese poghots-oom:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_6_title','Jrakeerk Zbosamartootyoonner'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_6_description','Hankstavayreekees tsovafoom neervatz zbosamartootyoonneri or: Jet skiing, parasailing, banana boat, paddleboard: Apalekon hankstavayreekees looghooy meyj:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_7_title','Mets Boodda yev Wat Chalong'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_7_description','Arekoteen mets Boodda artsvanner (45 metr) leernageek vra 360 astijanogh tetasyovteamb: Wat Chalong — Fookéet-ee avazelaghur Booddayi tarche: Apalekon arajar zhamanak yev verjeen mayramootn tsovafeen vra:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_8_title','Maekoomnavorotyoon'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'HY','itinerary_day_8_description','Verjeen arekoteen loogharik: Jambooym Fookéet-ee hetavayroveen: Tailandy — jampeelneree yerkirr — oozeek kapa antooneekee kghmeery:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_1_title','Прибытие на Пхукет'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_1_description','Трансфер на пляжный курорт. Первое купание в Андаманском море на пляже Ката — спокойные воды, безопасные для всех возрастов. Вечером — тайский приветственный ужин.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_2_title','Заповедник слонов'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_2_description','Утро в ответственном заповеднике слонов в тропическом лесу. Кормление, купание и прогулки со спасёнными слонами — опыт, который дети помнят всю жизнь.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_3_title','Бухта Пханг Нга'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_3_description','Полный день на лодке в бухте Пханг Нга: морские пещеры, мангровые каналы, остров Джеймса Бонда и плавучая рыбацкая деревня. Каякинг через низкие пещеры.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_4_title','Острова Пхи-Пхи и снорклинг'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_4_description','Скоростная лодка к островам Пхи-Пхи: бухта Майя, пляж Обезьян и кристально чистые воды лагуны Пилех. Снорклинг над коралловыми рифами Shark Point.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_5_title','Тайский кулинарный мастер-класс'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_5_description','Семейный кулинарный мастер-класс с местным шеф-поваром: пад тай, зелёное карри и манго с липким рисом. Вечером — Старый город Пхукета с уличной едой.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_6_title','День водных видов спорта'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_6_description','Джет-скинг, парасейлинг, банановая лодка, сёрфинг и вейкборд на пляже курорта. Вечером — бассейн.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_7_title','Большой Будда и Ват Чалонг'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_7_description','Гигантская статуя Большого Будды (45 м) на вершине холма с панорамным видом 360°. Ват Чалонг — главный буддийский храм Пхукета. Последний закат на пляже.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_8_title','Отъезд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='phuket-family-beach'),'RU','itinerary_day_8_description','Последнее купание. Трансфер в аэропорт Пхукета. Таиланд — страна улыбок — будет скучать по всей семье.');

-- ── Georgia & Caucasus Discovery (6 days) ────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_1_title','Жamanooom Tbilisi'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_1_description','Vrastandee hine mairakaghaky takhvel ey yev boutique hoteeli meyj zbekagooreek Hin Kaghakoom: Yereko aytseerootyoon tstsoombayin banhkeri Abanootoobaanee taraghami meydj yev jashkootyoon geenooti kelookh restoraneek hoor kaghakee tak:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_2_title','Tbilisi-ee Hin Kaghak yev Narikala'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_2_description','Oori aytseerootyoon Hin Tbilisi-ee phechoghnalov poghots-nerrov: Sioni Mair Tachar, goonyavorvats balkonnerov Shardeni poghots, Parskayin darashchanyeek Narikala Berd kaghakyee verev, yev araresaraan vaverakann mshagootyamb mardabanoots-mozeyoom:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_3_title','Kazbegi Lerner'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_3_description','Hreeshkali Vrastaani Pokhradzev mets Kovkas Lernerrov: Barkoom Gergeti Yekelghetsee (2,170 m) Kazbek Lerree vin: Ambogj Kovkasi amena patkerk tesaknernered meeden:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_4_title','Kazbegi Bazmoots yev Veradardz'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_4_description','Arekoteen barzakooy bardzrakum alpayin meadows-erov yev seghadzayin tetasyovnerov: Apalekon veragal dzhanaparhin Tbilisi, kenoghk Ananuri berd-tangaran Zheeveeli basseenee meyj arekagoyin:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_5_title','Kakheti Geenooi Yerkirr'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_5_description','Kerkeek arevelk Kakheti — Vrastaani genooi serdn: Ayts''ooreek entaneekayin genootekhnik, sovoreek kvevri-ee hin boorakeeni masooin yev dastabanootyoon yegheri ambaroom geenov: Traditsionakayin supra jashkootyoon entaneeqin het:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_6_title','Maekoomnavorotyoon Tbilisi-oom'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'HY','itinerary_day_6_description','Verjeen arekoteen zbosamartootyoon Ktavorootyoon Kantcharee vra yev Mtkvari gerr yekhbeen: Жambooym Tbilisi-ee hetavayroveen: Vrastandee jermootyoonny, goghechakooytyoonn yev mets sofrany dzez noor ket''em:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_1_title','Прибытие в Тбилиси'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_1_description','Приезд в древнюю столицу Грузии. Вечерняя прогулка по Абанотубанскому серно-банному кварталу и ужин в винном подвале под старым городом.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_2_title','Старый город Тбилиси и крепость Нарикала'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_2_description','Пешеходная экскурсия по узким улочкам Старого Тбилиси: собор Сиони, дома с балконами на Шарденй, персидская крепость Нарикала над городом и замечательный этнографический музей под открытым небом.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_3_title','Горы Казбеги'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_3_description','Переезд по Военно-Грузинской дороге через Большой Кавказ. Поход к средневековой церкви Гергети (2170 м) с горой Казбек на фоне — один из самых драматичных видов на всём Кавказе.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_4_title','Казбеги и возвращение'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_4_description','Утренний поход по альпийским лугам с видами на ледники. Возвращение в Тбилиси с остановкой у крепостного комплекса Ананури, отражённого в бирюзовом водохранилище Жинвали.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_5_title','Винный регион Кахети'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_5_description','Поездка в Кахети — сердце грузинского виноделия. Посещение семейной винодельни, знакомство с методом квеври и дегустация знаменитых янтарных вин. Традиционная супра с семьёй.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_6_title','Отъезд из Тбилиси'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='georgia-caucasus-discovery'),'RU','itinerary_day_6_description','Последняя прогулка по мосту Мира и вдоль реки Мтквари. Трансфер в международный аэропорт Тбилиси. Тепло, красота и щедрый стол Грузии позовут вас обратно.');

-- ── Kyoto Cultural Immersion (7 days) ────────────────────
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_1_title','Жamanooom Кiootoyoom'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_1_description','Takhvel Осакаyin odevayrovits Shinkansen-ov: Dzher ooshavorovn handipoom e dzez yev Gion-ee meydj zbosamartoom e — hine geysha taraghamy — irikoo fanarikner loosvooroom mahchiya tneree:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_2_title','Fushimi Inari yev Nishiki Shoook'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_2_description','Arshaloosayin ayts''oorootyoon Fushimi Inari — angooyn 10,000 karmeer-narnjagooyn torii darvaknerov lern meyj ooghee manakoortz e yev loosy vooskegheen e: Apalekon Nishiki zkovagayt shoky — Кiootoi khohanoghy:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_3_title','Chayi Ararsootyoon yev Perelatsoghee Chanaparh'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_3_description','Meesnakhoombot chayi ararsootyoon yerrort serapootyoonee chayi maystori het nor 300-amya mahchiya-oom: Apalekon zbosamartootyoon Peratsoghe Chanaparhi vra Higashiyama tacher taraghami meydj:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_4_title','Arashiyama yev Bambookee Poork'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_4_description','Sagano Romantic Train-ov Hozu geri keerchov Arashiyama: Zbosamartootyoon bambookee poorkee meydj, Tenryu-ji Zen parzee ayts''oorootyoon (YUNESKO) yev Jojakko-ji tachar lernee kerodoom:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_5_title','Nijo Berd yev Kinkaku-ji'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_5_description','Batsahayteek Nijo Berd — shogun-ee Kyoto-yi bnakaranr "sokhak-tsootsakahav" hat''aknerov: Apalekon Kinkaku-ji Vooskegh Agoogheny arajekin ardzagakayin lchoom:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_6_title','Ikebana Dashtery yev Gion Yereko'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_6_description','Arekoteen ikebana dashtery — Yaponiyi hine tsaghkakazmootyan arvesty — maystori het: Yereko Gion-oom maiko-neree (achkert-geysha) dasyanaleekoon:'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_7_title','Maekoomnavorotyoon'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'HY','itinerary_day_7_description','Verjeen arekoteen Nishiki shoky-oom: Chambooym Osaka hetavayroven: Yaponyan verakonfigooroooom dzer tesankooyty baneerin masin:'),

                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_1_title','Прибытие в Киото'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_1_description','Приезд на синкансэне из аэропорта Осаки. Гид встречает вас и проводит по Гиону — старому гейшскому кварталу — в свете вечерних фонарей над деревянными домами мачия.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_2_title','Фусими Инари и рынок Нисики'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_2_description','Рассветное посещение святилища Фусими Инари — сеть из 10 000 красных ворот тории через лесистую гору, пока свет ещё золотой и толпы отсутствуют. Днём — крытый рынок Нисики, «кухня Киото».'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_3_title','Чайная церемония и Тропа Философа'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_3_description','Частная чайная церемония с мастером третьего поколения в 300-летнем доме мачия. Прогулка по Тропе Философа через храмовый квартал Хигасияма — вдоль канала, обсаженного сакурой.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_4_title','Арасияма и бамбуковая роща'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_4_description','Романтический поезд Сагано через ущелье реки Хозу до Арасиямы. Прогулка через бамбуковую рощу, сад дзен Тэнрюдзи (ЮНЕСКО) и тихий горный храм Дзякко-дзи.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_5_title','Замок Нидзё и Кинкакудзи'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_5_description','Замок Нидзё — резиденция сёгуна со знаменитыми «соловьиными» полами, скрипящими при ходьбе. Золотой павильон Кинкакудзи, отражённый в зеркальном пруду.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_6_title','Мастер-класс икэбана и вечер в Гионе'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_6_description','Утренний мастер-класс по икэбана — древнему японскому искусству аранжировки цветов — с мастером. Вечер в Гионе в поисках майко на пути к чайным домам.'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_7_title','Отъезд'),
                                                                            ('tour',(SELECT id FROM tour WHERE slug='kyoto-cultural-immersion'),'RU','itinerary_day_7_description','Последнее утро на рынке Нисики. Трансфер в аэропорт Осаки. Япония меняет то, как вы смотрите на мир.');

-- =========================================================
-- BLOG POSTS — fields: title, excerpt, content
-- =========================================================
INSERT INTO translations (entity_type, entity_id, locale, field, value) VALUES

-- why-maldives-perfect-honeymoon
('blog',(SELECT id FROM blog_post WHERE slug='why-maldives-perfect-honeymoon'),'HY','title',
 'Yerb Maldivnerr Yerazhayin Meghramesn en Ashkharhi Hamar'),
('blog',(SELECT id FROM blog_post WHERE slug='why-maldives-perfect-honeymoon'),'HY','excerpt',
 'Kristalazard lchakner, jrovereal veelaaner, batsardzoot anhadotyoon yev mayramootneer or cheen leenooom oor — ayt e, yerb Maldivnerr amen meghrames ts''ootsakin glaakhoom en:'),
('blog',(SELECT id FROM blog_post WHERE slug='why-maldives-perfect-honeymoon'),'HY','content',
 '<p>Amen tari hazaravorin zouyk yndoonoom Maldivnerr meer meghramesi hamar — yev amen tari gavteen grets ts''ek aaynkerr yev antsner bazh spiaszeleek dzegherel: Inch ka ayd Hindkakan ovkyani vra tsoorvats kghalee-oory soorav, shat leeoveen yev hivand romantik hamar:</p><p><strong>Anhadootypen iravonkoven e:</strong> Avazel sharjootyoon veradzootyoon-nerri hamar Maldivnerri meyj gordzarkum e anhat kghalee-ee taratsashcheekee haytsakoorootyamb: Baz hankstavayrer koor anhat kghalee-een bnakyoom en amboljootyamb, aysinkn chka oghevoragan champark, chka mardahoor, yev het''agayoomeet anhat veelayi verandakits tesnvats ocher mehk e: Ovkyany leenooom e dzeryoom:</p><p><strong>Dekhkn irakan chee:</strong> Hindkakan ovkyany aysteghs heekanooom e mee kapooyt gooyn, vor karots e digitalakin koghmeek bereel — mee lyyoominecent, grets ts''akagooyn pyiroozegheen tsovakayni lakoonerroom, vor khorak ink-kapooyt e booshin joorroom: Dzer anhat looghavayri meyj soozmeel adrbankoyn vra mayramooteen zhamanak mee kartsee lyaloovats mee koghmits kazkeroort patker:<br/></p><p><strong>Zbekagooytootyoonn ee zheroghamoton e:</strong> Maldiveen hankstavayrerr entdamanavorabars hayteroveom en ashkharhi lavorr hyyoorinkalarooteamb: Dzer anhat khodakapah soveroom e dzyer nakhashchootyoonnern ee zhamamooney yev keadreetch harkh peetrootyoon — shampayny ardenap e soootzoom katmaran-its veradardzoone moodjroghk, yev mayramootekheer cocktailnerr henoommen kooynin arkan meyj: Ovkyany leenooom e dzeryoom:</p><p>Yethe meghramesi dzez garanooym, Maldivnerr mee yerkirr cheen baskees: Ayn mee haasoogootyoon e — mee hivandotyoon, vor ambogh harkavoork ayspeesi ankell dznvee: Aroo, yev veradardzeek paryoonakvats:</p>'),
('blog',(SELECT id FROM blog_post WHERE slug='why-maldives-perfect-honeymoon'),'RU','title',
 'Почему Мальдивы — идеальное место для медового месяца в мире'),
('blog',(SELECT id FROM blog_post WHERE slug='why-maldives-perfect-honeymoon'),'RU','excerpt',
 'Хрустальные лагуны, виллы над водой, полная приватность и закаты ни с чем не сравнимые — вот почему Мальдивы возглавляют каждый список медового месяца.'),
('blog',(SELECT id FROM blog_post WHERE slug='why-maldives-perfect-honeymoon'),'RU','content',
 '<p>Каждый год тысячи пар выбирают Мальдивы для медового месяца — и каждый год почти все они говорят, что реальность превзошла все ожидания. В чём секрет этого архипелага в Индийском океане, который делает его столь последовательно, подавляюще идеальным для романтики?</p><p><strong>Приватность настоящая.</strong> В отличие от большинства курортных направлений, концепция Мальдив построена на частном острове. Многие курорты занимают свой собственный остров целиком — никаких однодневных туристов, толп, и часто других гостей не видно с террасы вашей виллы над водой. Океан становится вашим.</p><p><strong>Пейзаж нереальный.</strong> Индийский океан здесь приобретает голубизну, которая кажется цифровой — светящийся, почти прозрачный бирюзовый в мелких лагунах, переходящий в чернильно-синий в открытой воде. Плавать в своём частном бассейне над ним на закате — всё равно что висеть внутри картины.</p><p><strong>Сервис исключительный.</strong> Мальдивские курорты неизменно входят в число лучших в мире по гостеприимству. Ваш личный дворецкий узнаёт ваши предпочтения при заезде и предугадывает каждую потребность — шампанское уже охлаждено, когда вы возвращаетесь со снорклинга.</p><p>Если вы планируете медовый месяц, Мальдивы — это не просто направление. Это эталон — воспоминание, с которым будет сравниваться каждый последующий отпуск. Наша команда специалистов готова сделать ваш совершенным.</p>'),

-- hidden-side-of-georgia
('blog',(SELECT id FROM blog_post WHERE slug='hidden-side-of-georgia'),'HY','title',
 'Vrastandee Tsoovapet Kraken: Tbiliseeits Versj'),
('blog',(SELECT id FROM blog_post WHERE slug='hidden-side-of-georgia'),'HY','excerpt',
 'Champorhdakanneereed metsamenashoory miayeen Tbiliseen en tesnoum: Bots iravakaan Vrastanen — hin kaghak-kghzeener, lerrnayin vankerr yev legendar geeneen — azatin yeroorner yev bardzoonkneroum e:'),
('blog',(SELECT id FROM blog_post WHERE slug='hidden-side-of-georgia'),'HY','content',
 '<p>Vrastandy loureach kartsir champorhdakan vekyernered meed kaghveloo e asteechanavorabars: Tbilisee — or azgancharooshin mixedly midzhnatarain, karserakan Rusakan, Sovyetakaan yev arrkagheeyin charsharapetooteamb — Yevropayee amena charakter mairakaghakereen meed en: Bayts takhvel kaghakin vertzeents, yev hanteepoom ek mee yerkir, vor oonooi zoramood hne khohrookootyoon:</p><p><strong>Kazbegi yev Mets Kovkas:</strong> Tbilisits moradzev arevelahayerenn Georgian Military Highway-ov sharzhoomeek ashkharhi amena dzhagayin toojapath varyoonereen meed en: Gergeti Yekelghetsee, 2,170-metr lerrnikee vra, Kazbek Lerrits petkayin, Kovkasee amena spasakannery tesaneerits meed e:</p><p><strong>Kakheti-ee genooi yerkirr:</strong> Vrastandy ashkharhi meyj hin genooi hegh e — voch karogh e mer mardoog 8,000 tari batsahaytnavel: Alazani kerkany entaneekakan genootekhnirov ee zargootz e, vor aydghees natural geni ashkharhoom mazootyoon en keeroum:</p><p>Vrastandy khostoom e hoosageer champordhaky zhamanakavel yev seretelov: Hrashalee supra — lavashov yev geenov letsoon khohan sofrr — Kovkasee amena mets hyyoorinkarooteamb zavzhnereed meed e: Aroo hoosageer, verades paryoonakvatz:</p>'),
('blog',(SELECT id FROM blog_post WHERE slug='hidden-side-of-georgia'),'RU','title',
 'Скрытая сторона Грузии: за пределами Тбилиси'),
('blog',(SELECT id FROM blog_post WHERE slug='hidden-side-of-georgia'),'RU','excerpt',
 'Большинство путешественников видят только Тбилиси. Но настоящая Грузия — древние пещерные города, горные монастыри и легендарное вино — лежит в долинах и горных вершинах за столицей.'),
('blog',(SELECT id FROM blog_post WHERE slug='hidden-side-of-georgia'),'RU','content',
 '<p>Грузия тихо строит репутацию одного из самых удивительных направлений в мире. Тбилиси — со своим особым сочетанием средневековой, имперской русской, советской и современной архитектуры — один из самых харизматичных городов Европы. Но выйдите за пределы города, и вы откроете страну глубокой древней глубины.</p><p><strong>Казбеги и Большой Кавказ.</strong> Дорога на север от Тбилиси по Военно-Грузинской дороге — один из самых драматичных автомобильных маршрутов в мире. Церковь Гергети, стоящая на хребте высотой 2170 м с горой Казбек позади — один из определяющих образов всего Кавказа.</p><p><strong>Винный регион Кахети.</strong> Грузия считается родиной вина — люди производят виноград здесь не менее 8000 лет. Метод квеври — ферментация в глиняных кувшинах, закопанных в землю — даёт те самые янтарные вина, покорившие мир натурального вина.</p><p><strong>Пещерный город Вардзия.</strong> Высеченный в вулканической скале в XII веке, монастырский пещерный город Вардзия содержит более 3000 комнат, 13 этажей и церковь с оригинальными фресками. Один из самых выдающихся памятников Кавказа.</p><p>Грузия вознаграждает любопытного путешественника с исключительной щедростью. Приезжайте любопытным, уезжайте изменившимся.</p>'),

-- first-time-japan-guide
('blog',(SELECT id FROM blog_post WHERE slug='first-time-japan-guide'),'HY','title',
 'Arajoord Angam Yaponiarooom: Ameen inch anhrashesht en znanel meknooly'),
('blog',(SELECT id FROM blog_post WHERE slug='first-time-japan-guide'),'HY','excerpt',
 'Gortzatsoomee etiket-its minkcheen kanooneree, cash mshakooytits minkcheen konbini nakhaaghoorjneri — antarashakapahov oozeradzoo hamaar anhrashesht tsanootootyoonner:'),
('blog',(SELECT id FROM blog_post WHERE slug='first-time-japan-guide'),'HY','content',
 '<p>Yaponyan mee vekyerr e, vor paymanavory badraskhanoototyoon e paheesher: Oochus ayn mee dziar e champordhaky — Yaponyan iravagoon mee ayl yerkir mee kamka logistikaken argooteek champordhakan — bayts hartsazkanel mee kham azgeegrootner khoosavorvootyoon e barer champordhootyoon mee laveen verakagooyts:</p><p><strong>JR Pass:</strong> Ethe meekchev kaghakner ek ayts''oomoots, Japan Rail Pass-ee gordzatsootyoon grets ts''e verchon hamar ayl ardzanahatooryoon: Shinkansen tooraabaakanayin pokhootyoonn ee keetchetsnoots:</p><p><strong>Kaghaky deeroots e:</strong> Ashkharhee amena tekhnolokhiakin yerkernered meed lavagooyn mekn ek amena tarchakan kash karatsootyan karavoker: Cash tarel hamek; 7-Eleven bankomatnery arszhanoorts ayl yerkri kartner en oonooom:</p><p><strong>Konbini:</strong> Yaponiyi hanrakachoots khotan-nerr — 7-Eleven, Lawson, FamilyMart — batzardzakeen ee arooch hasnooom en: Jerm jashak, tazi onigiri, shnyel mooloov kofe, beeeer, drooshk, SIM kart. Dzyer konbini nakhaaghoorjy bavakan e hotel-ee buffet-ee mevoroorits:</p><p><strong>Tashinamooty avandootypen:</strong> Oghgheel torii darvakee ambyogeeren anyaazmyakayeen katookyoon: Sooran ban chee pakhannee. Kapooyt kooyn vra ootdzel grets ts''e khocharaar: Yamayakatseel kooshakalov yev erakhshetootyan dzernavoreenits tsaghik dzaryootyoo:</p><p>Yaponyan mee yerkirr e, vor bardzratsnoom e dzyer ooneratsees eenchpees aneem kazgyatz: Arvestagortsootyoon mek gits khembanachootyoon, oosharnakayin jashkin mshagooyt, hin goghechakoototyoon yev hypermodernin dynamism mee anzooygakaan haratsoosootyoon oonooi: Ayo, yev tiraknes hatoovats:</p>'),
('blog',(SELECT id FROM blog_post WHERE slug='first-time-japan-guide'),'RU','title',
 'Первый раз в Японии: всё, что нужно знать перед поездкой'),
('blog',(SELECT id FROM blog_post WHERE slug='first-time-japan-guide'),'RU','excerpt',
 'От этикета в поездах до правил в храмах, от культуры наличных до завтраков в конбини — главное руководство для первых путешественников в Японию.'),
('blog',(SELECT id FROM blog_post WHERE slug='first-time-japan-guide'),'RU','content',
 '<p>Япония — направление, которое вознаграждает подготовку. Не потому что она сложная — Япония на самом деле одна из самых лёгких и логистически гладких стран в мире — но потому что понимание нескольких культурных нюансов превращает хорошую поездку в отличную.</p><p><strong>JR Pass.</strong> Если вы посещаете несколько городов, Japan Rail Pass почти наверняка стоит купить до отъезда из дома (в Японии его купить нельзя). Он покрывает сеть скоростных поездов синкансэн и большинство региональных поездов.</p><p><strong>Наличные — всё ещё главные.</strong> Несмотря на то что Япония — одна из самых технологически развитых стран мира, она остаётся удивительно ориентированной на наличные. Многие рестораны, святилища и небольшие магазины не принимают карты. Банкоматы 7-Eleven надёжно принимают иностранные карты.</p><p><strong>Конбини.</strong> Японские круглосуточные магазины — 7-Eleven, Lawson, FamilyMart — подлинно выдающиеся заведения: горячая еда, свежие онигири, кофе, пиво, лекарства, SIM-карты. Ваш завтрак из конбини будет лучше большинства гостиничных шведских столов.</p><p><strong>Этикет в храмах.</strong> Слегка поклонитесь, проходя через ворота тории. У раковин для омовения ополосните обе руки. Снимайте обувь перед входом в здания храма. Говорите тихо и воздерживайтесь от фотографии в священных помещениях.</p><p>Япония — страна, которая превзойдёт все ожидания. Глубина мастерства, культура еды, сочетание древней красоты и гиперсовременной энергии — ничто не подготавливает вас к реальности по-настоящему. Езжайте, и вернитесь изменившимися.</p>'),

-- dubai-beyond-the-skyscrapers
('blog',(SELECT id FROM blog_post WHERE slug='dubai-beyond-the-skyscrapers'),'HY','title',
 'Дubaiy Eboos Jangaranits Versj: Kaghaky, vor Mayoorameetsek Chee Tesnum'),
('blog',(SELECT id FROM blog_post WHERE slug='dubai-beyond-the-skyscrapers'),'HY','excerpt',
 'Дubaiy hashvoomooms e avazel yev hooneishekhov — bayts jangaranneree yev shookeree petoom mee kaghak e, vor antsamirt ansteekht xorhooreen yev manrakazooteamb e pargeavoom:'),
('blog',(SELECT id FROM blog_post WHERE slug='dubai-beyond-the-skyscrapers'),'HY','content',
 '<p>Дubaiyi meedjazgayin hambar karoovach e: Ashkharhi amenaberji shenk, amena mets shoork, amena khet broonchi: Yev meekhum ayn banerr iravakaan en yev zheroghamooneek, qaghaky, vor nranq sazmoum en miayeen mee shert Дubaiyi, vor mee aveli moots oogadroom e haskootyoon peetrootyoon oonoots mardoots::</p><p><strong>Hin kaghaky:</strong> Nsteel abra mee vra — avrands tezakhoor tjmeel —Dubai Creek-ov votse soooky minkcheen bukhoormayin sooky: Ooghee jorree vra khnkoom e sandaloosi, khnkoomnateri yev safranee: Soookavorner koozerr beroum en mermeratsak yev azgeexreek: Ayd e Dubai-een, vor hareooreek nerr ee kafte-oom e gar, yev deeroots oo keensandee e:</p><p><strong>Al Fahidi Heen Taraghamy:</strong> Creek-its 15 yekan varee, harshalee patchpach neerv e kanaats yeghanak: Dubai Muzeyoomy 1787-ee berd meyj e — kaghakee amena hin khorvats shenky: Taraghamy khoosavorvorvotz Artist Stoodionner, mee hraschali cafe muzeyoom yev Shaikh Mohammed Culturali Haskakooteamb Kentron oonooi, oor ''Open Doors, Open Minds'' nakhaaghoorjner en kazmakerpvooyoom — oor kapoom ek mee emiratayin jashak, ayl yerkri hamar ayl mee hartsootyoon masooin Islam-ee mshagootyooneen yev itsakhootyoon hayees tsageel javabner::</p><p><strong>Anapaty keeshere:</strong> 40 roper Burj Khalifa-its, kaghaky avelooyoots yev arabayin anapaty sarsakooom e: Keeshere lousaarseroomeenits heer, dooneri verev asdgherr heeshkali en: Beduinan khavoorn keeshere — doonerbashingk avartogh, ooghtee erknoots elats, jashkootyoon ootats — barrdzr kaymakan ashkhar arkeev oor Burj Khalifa-ee moodernootyoon kevoorel e mee ayl hin yev antsanot ban vra:</p><p>Aroo rekordner-ee hamar, martseek xorhrratkayin masyits: Дubaiy avelee antsanoyt e yev avelee hetchakrakan ayn Instagram namooshtoori meyj e khoostanoovoom:</p>'),
('blog',(SELECT id FROM blog_post WHERE slug='dubai-beyond-the-skyscrapers'),'RU','title',
 'Дубай за пределами небоскрёбов: город, которого большинство туристов не видит'),
('blog',(SELECT id FROM blog_post WHERE slug='dubai-beyond-the-skyscrapers'),'RU','excerpt',
 'Дубай славится излишествами и зрелищностью — но за рекордами и торговыми центрами скрывается город удивительной глубины, истории и человечности.'),
('blog',(SELECT id FROM blog_post WHERE slug='dubai-beyond-the-skyscrapers'),'RU','content',
 '<p>Международная репутация Дубая построена на суперлативах: самое высокое здание, самый большой торговый центр, самый горячий бранч. И хотя всё это реально и по-настоящему впечатляет, город, который они описывают — лишь один слой места, вознаграждающего более пристальное внимание.</p><p><strong>Старый город.</strong> Сядьте на абру — традиционное деревянное водное такси — и переправьтесь через Дубай-Крик от рынка золота к рынку пряностей. Воздух над водой пахнет сандалом, ладаном и шафраном. Торговые ряды завалены куркумой, сумахом и сушёными лепестками роз. Это Дубай, существовавший столетиями до нефтяной эпохи — и он по-прежнему живёт.</p><p><strong>Исторический квартал Аль-Фахиди.</strong> В 15 минутах ходьбы от крика — квартал ветряно-башенной архитектуры и узких песчаных переулков. Музей Дубая занимает форт 1787 года — самое старое сохранившееся здание города. Центр культурного взаимопонимания шейха Мохаммеда проводит завтраки «Открытые двери, открытые умы», где вы едите эмиратскую еду и получаете искренние ответы на любые вопросы об исламской культуре.</p><p><strong>Пустыня ночью.</strong> В сорока минутах от Бурдж-Халифы город растворяется и начинается Аравийская пустыня. Ночью, вдали от светового загрязнения, звёзды над дюнами поразительны. Провести вечер в бедуинском лагере, глядя на Млечный Путь — напоминание о том, что современность Дубая построена на чём-то гораздо более древнем и странном, чем стекло и сталь.</p><p>Приезжайте за рекордами, оставайтесь ради глубины. Дубай страннее и интереснее, чем его Instagram-профиль.</p>');
