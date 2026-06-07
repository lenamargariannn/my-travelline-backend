-- V9__fix_armenian_translations.sql
-- Corrects Armenian translations inserted with Latin/transliterated text in V8.
-- Keep old migrations immutable; apply this as a data-fix migration.

BEGIN;

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('category', (SELECT id FROM category WHERE slug = 'beach'), 'HY', 'name', 'Ծովափ և կղզիներ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('category', (SELECT id FROM category WHERE slug = 'honeymoon'), 'HY', 'name', 'Մեղրամիս')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('category', (SELECT id FROM category WHERE slug = 'adventure'), 'HY', 'name', 'Արկածային')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('category', (SELECT id FROM category WHERE slug = 'cultural'), 'HY', 'name', 'Մշակութային')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('category', (SELECT id FROM category WHERE slug = 'city-break'), 'HY', 'name', 'Քաղաքային հանգիստ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('category', (SELECT id FROM category WHERE slug = 'family'), 'HY', 'name', 'Ընտանեկան')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'maldives'), 'HY', 'name', 'Մալդիվներ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'maldives'), 'HY', 'description', 'Հնդկական օվկիանոսում սփռված 1200 մարջանային կղզիների շղթա․ Մալդիվները աշխարհի լավագույն կղզային հանգիստներից են։ Ձեզ սպասում են ջրի վրա կառուցված վիլլաներ, ծովային կրիաներով հարուստ ռիֆեր և մայրամուտներ, որոնք կրակոտ գույներով լցնում են ամբողջ հորիզոնը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'bali'), 'HY', 'name', 'Բալի')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'bali'), 'HY', 'description', 'Բալին իզուր չէ կոչվում «Աստվածների կղզի»։ Սրբազան հինդուական տաճարները բարձրանում են զմրուխտե բրնձի տեռասների ֆոնին, համաշխարհային մակարդակի սերֆինգի վայրերը հանդիպում են սպիտակ ավազով լողափերին, իսկ բալիական մշակույթի ջերմությունը զգացվում է կղզու յուրաքանչյուր անկյունում։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'dubai'), 'HY', 'name', 'Դուբայ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'dubai'), 'HY', 'description', 'Դուբայը զարմացնում է երևակայությունը․ անապատից բարձրացող ապագայամետ երկնագիծ, ռեկորդային ճարտարապետություն, համաշխարհային մակարդակի գնումներ և ոսկեգույն դյուներ մեկ քաղաքի մեջ։ Ավելացրեք մաքուր լողափերն ու տարվա բոլոր եղանակներին արևը, և արդյունքը դառնում է անդիմադրելի։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'santorini'), 'HY', 'name', 'Սանտորինի')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'santorini'), 'HY', 'description', 'Մարդկության պատմության ամենախոշոր հրաբխային ժայթքումներից մեկի արդյունքում ձևավորված Սանտորինիի դրամատիկ կալդերան, խորհրդանշական սպիտակ գյուղերն ու լեգենդար մայրամուտները այն դարձնում են աշխարհի ամենաշատ լուսանկարվող և ամենակախարդական վայրերից մեկը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'paris'), 'HY', 'name', 'Փարիզ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'paris'), 'HY', 'description', 'Լույսի քաղաքը ներկայացման կարիք չունի։ Փարիզը այցելուներին պարգևում է համաշխարհային մակարդակի թանգարաններ, ժամանակից դուրս ճարտարապետություն, բացառիկ խոհանոց և ռոմանտիկայի ու մտավոր էներգիայի անկրկնելի մթնոլորտ, որը դարեր շարունակ ոգեշնչել է արվեստագետներին։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'phuket'), 'HY', 'name', 'Փհուկետ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'phuket'), 'HY', 'description', 'Թաիլանդի ամենամեծ կղզին միավորում է հիասքանչ լողափերը, աշխույժ գիշերային կյանքը, հին բուդդայական տաճարներն ու ջերմ, հյուրընկալ մշակույթը։ Կղզիներով շրջագայություն երկարապոչ նավակով, թե պարզապես հանգիստ փոշենման ավազի վրա՝ Փհուկետը տալիս է երկուսն էլ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'tbilisi'), 'HY', 'name', 'Թբիլիսի')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'tbilisi'), 'HY', 'description', 'Վրաստանի հին մայրաքաղաքը Կովկասի լավագույն բացահայտումներից է։ Թբիլիսին միավորում է միջնադարյան բերդերը, ծծմբային բաղնիքների թաղամասերը և զարգացող գինու ու խոհանոցի մշակույթը՝ Կովկասյան լեռների տպավորիչ ֆոնի վրա։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'kyoto'), 'HY', 'name', 'Կիոտո')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('destination', (SELECT id FROM destination WHERE slug = 'kyoto'), 'HY', 'description', 'Ճապոնիայի հին կայսերական մայրաքաղաքը կենդանի թանգարան է։ ՅՈՒՆԵՍԿՕ-ի համաշխարհային ժառանգության 17 վայրեր, հազարավոր տաճարներ ու սրբավայրեր, գեյշաների թաղամասեր, բամբուկե պուրակներ և նրբագեղ գեղագիտություն Կիոտոն դարձնում են աշխարհի մշակութային ամենահարուստ քաղաքներից մեկը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'name', 'Մեղրամսի հանգիստ Մալդիվներում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'description', '<p>Սկսեք ձեր համատեղ կյանքը աշխարհի ամենահիասքանչ վայրերից մեկում։ Այս 6-օրյա մեղրամսի փաթեթը ձեզ տեղավորում է ջրի վրա կառուցված մասնավոր վիլլայում, որի ապակե հատակից երևում է փիրուզագույն լագունան։ Ամեն առավոտ արթնանում եք օվկիանոսի ձայնից, իսկ ամեն երեկո ավարտվում է ավազե ծանծաղուտի վրա աստղազարդ երկնքի տակ մոմերով ընթրիքով։</p><p>Օրվա ընթացքում սուզալող արեք մանտաների և ռիֆային շնաձկների կողքին, հանգստացեք ձեր մասնավոր անվերջանալի լողավազանում կամ վայելեք զույգերի սպա արարողությունը՝ մալդիվյան բուսական բաղադրիչներով։ Մեր մեղրամսի անձնական խորհրդատուն հոգում է բոլոր մանրամասները՝ հիդրոինքնաթիռի տեղափոխումից մինչև շամպայն վիլլայում։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'name', 'Բալիի ամբողջական փորձառություն')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'description', '<p>Բալին բացառիկ հակադրությունների ուղղություն է, և այս 8-օրյա տուրը ստեղծված է դրանք ամբողջությամբ ցույց տալու համար։ Սկսեք Ուբուդից՝ Բալիի արվեստային սրտից․ բրնձի տեռասներ, Սուրբ Կապիկների անտառ և մայրամուտի կախարդական Կեչակ պարային ներկայացում։</p><p>Շաբաթվա ընթացքում կբարձրանաք գործող Բատուր հրաբուխը լուսաբացին, կզգաք Այունգ գետի ջրային ռաֆթինգի ադրենալինը, իսկ վերջին օրերին կբացահայտեք Սեմինյակի և Ուլուվատուի լողափերը, սերֆինգը, ժայռի գլխին կանգնած տաճարը և բալիական խոհարարական դասը տեղական ընտանիքի հետ։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'name', 'Դուբայ․ քաղաք և անապատ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'description', '<p>Դուբայը գերլատիվների քաղաք է, և այս 5-օրյա տուրը ձեզ տանում է դրանց լավագույնների մոտ։ Կբարձրանաք Բուրջ Խալիֆայի գագաթը՝ աշխարհի ամենաբարձր շենքը, կբացահայտեք Դուբայ Քրիքի մոտ գտնվող հին ոսկու և համեմունքների շուկաները, ապա կանցնեք քաղաքի փայլուն ժամանակակից հատվածներին։</p><p>Երրորդ օրը 4x4 մեքենաների շարասյունը շարժվում է դեպի Արաբական անապատի կարմիր դյուները․ դյուներով սահք, ուղտավարություն և շքեղ ընթրիք բեդվինական ճամբարում՝ աստղերի տակ։ Քաղաքի և անապատի հակադրությունը մնում է անմոռանալի։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'name', 'Սանտորինիի երազանք')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'description', '<p>Երկրի վրա քիչ վայրեր են առաջին հայացքից այդքան ուժեղ տպավորություն թողնում, որքան Սանտորինին։ Հին հրաբխային կալդերայի եզրին տեղակայված սպիտակ գյուղերը կարծես թափվում են ուղիղ դեպի Էգեյան ծովի խոր կապույտը։ Այս 7-օրյա տուրը տալիս է ժամանակ և ուղեկցություն՝ Սանտորինին լուսանկարներից շատ ավելի խորությամբ տեսնելու համար։</p><p>Կբացահայտեք Օյան լուսաբացին, կկատարեք կատամարանով նավարկություն կալդերայի շուրջ, կլողաք ջերմ աղբյուրներում, կայցելեք հին Ակրոտիրիի ավերակներ և կճաշակեք կղզու առանձնահատուկ Ասիրտիկո գինիները կալդերայի եզրին գտնվող գինեգործարանում։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'name', 'Ռոմանտիկ փախուստ Փարիզ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'description', '<p>Փարիզը ամեն օր արդարացնում է աշխարհի ամենառոմանտիկ քաղաքի իր համբավը, և այս 5-օրյա հանգիստը ստեղծված է այդ ռոմանտիկան ամբողջությամբ փոխանցելու համար։ Ժամանման պահին հյուրանոցային համարում ձեզ սպասում են ծաղիկներ և շամպայն, իսկ առաջին երեկոն ավարտվում է գիշերային երկնքի տակ շողացող Էյֆելյան աշտարակով։</p><p>Լուվր, Մոնմարտր, Վերսալ, Սեն գետով մասնավոր նավարկություն մայրամուտին, Սենտ-Շապելի վիտրաժներ և Սեն-Ժերմենի բուտիկներ․ սա Փարիզն է իր ամենամտերմիկ և անմոռանալի տեսքով։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'name', 'Փհուկետ․ ընտանեկան ծովափնյա հանգիստ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'description', '<p>Թաիլանդը աշխարհի ամենահյուրընկալ ուղղություններից է ընտանիքների համար, և այս 8-օրյա Փհուկետի հանգիստը ստեղծված է բոլոր սերունդներին ուրախացնելու համար։ Ձեր հանգրվանը ծովափնյա ընդարձակ հանգստավայր է Պատոնգ կամ Կատա լողափի մոտ՝ հանգիստ ջրերով և ընտանիքի համար անհրաժեշտ բոլոր հարմարություններով։</p><p>Ձեզ սպասում են նավարկություններ դեպի Փանգ Նգա ծոց, այցելություն էթիկական փղերի ապաստարան, Կոհ Պի Պիի փիրուզագույն ջրեր, սուզալող մարջանային ռիֆերի վրա և թաիլանդական խոհարարական դաս, որին կարող է մասնակցել ամբողջ ընտանիքը։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'name', 'Վրաստան և Կովկաս․ բացահայտում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'description', '<p>Վրաստանը աշխարհի ամենահին և ամենաթերագնահատված ճանապարհորդական ուղղություններից է, և այս 6-օրյա տուրը բացահայտում է նրա խորությունը։ Սկսեք Թբիլիսիից՝ Հին քաղաքի քարապատ փողոցներ, Խաղաղության կամուրջ, Աբանոտուբանիի հայտնի ծծմբային բաղնիքներ և գինու ու խոհանոցի հարուստ միջավայր։</p><p>Այնուհետև ուղևորվեք Մեծ Կովկասի լեռներ՝ Կազբեգի, Գերգետի Երրորդության եկեղեցի, լեռնային արահետներ և Կախեթիի գինու տարածաշրջան՝ կվևրիի հին ավանդույթով ու ջերմ վրացական սուպրայով։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'name', 'Կիոտո․ մշակութային խորասուզում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'description', '<p>Կիոտոն Ճապոնիայի մաքուր էությունն է։ Այս 7-օրյա մշակութային տուրը ոչ միայն ցույց է տալիս քաղաքի բացառիկ վայրերը, այլև բացում է դրանց հետևում կանգնած ավանդույթները, փիլիսոփայությունն ու մարդկային պատմությունները։ Ձեզ ուղեկցում է ճապոնական մշակութային ժառանգության մասնագետ։</p><p>Մասնակցեք իսկական թեյի արարողության, լուսաբացին քայլեք Ֆուշիմի Ինարիի հազարավոր տորիի դարպասների միջով, այցելեք Արաշիյամայի բամբուկե պուրակ, Նիձո ամրոց, Կինկակու-ձի և երեկոյան Գիոնում հետևեք մաիկոների աշխարհին։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_1_title', 'Ժամանում և հիդրոինքնաթիռի տեղափոխում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_1_description', 'Վայրէջք կատարեք Մալեի միջազգային օդանավակայանում և նստեք ձեր մասնավոր հիդրոինքնաթիռը՝ կյանքի ամենագեղատեսիլ 30 րոպեանոց թռիչքի համար։ Ջրի վրա գտնվող վիլլայում ձեզ սպասում են շամպայն, թարմ ծաղիկներ և մինչև հորիզոն ձգվող Հնդկական օվկիանոսը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_2_title', 'Տան ռիֆում սուզալող և սպա')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_2_description', 'Ձեր տեմպով բացահայտեք կղզու մասնավոր ռիֆը․ ծովային կրիաները, ռիֆային շնաձկներն ու մանտաները հաճախակի հյուրեր են։ Կեսօրից հետո՝ 90 րոպեանոց զույգերի սպա արարողություն մալդիվյան բուսական բաղադրիչներով և տաք կոկոսի յուղով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_3_title', 'Ավազե ծանծաղուտի պիկնիկ և մայրամուտի նավարկություն')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_3_description', 'Ձեր մասնավոր դհոնին ձեզ կտանի լագունայի մեջտեղում գտնվող առանձնացված ավազե ծանծաղուտ՝ շամպայնով պիկնիկի համար։ Մայրամուտին կվերադառնաք նավով՝ ատոլի վրայով ոսկե ժամի կախարդական նավարկությամբ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_4_title', 'Դելֆինների դիտում և խորը սուզալող')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_4_description', 'Առավոտյան էքսկուրսիա բաց օվկիանոսում դելֆիններ տեսնելու համար․ Մալդիվներում դելֆինների խտությունը աշխարհում ամենաբարձրերից է։ Կեսօրից հետո՝ սուզալող խոր մարջանային պատի վրայով՝ ձկներով, կրիաներով և գունավոր ռիֆային կյանքով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_5_title', 'Մասնավոր ընթրիք լողափին')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_5_description', 'Օրը ամբողջությամբ ձերն է․ քնեք երկար, լողացեք մասնավոր լողավազանում, կարդացեք տախտակամածին։ Գիշերը ձեր անձնական սպասավորը մոմերով սեղան է պատրաստում լողափին՝ աստղերը արտացոլվող խաղաղ օվկիանոսի վրա։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_6_title', 'Մեկնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), 'HY', 'itinerary_day_6_description', 'Վերջին առավոտյան լողը մինչև հիդրոինքնաթիռը ձեզ վերադարձնի Մալե՝ հաջորդ ճանապարհորդության համար։ Դուք հեռանում եք հիշողություններով, որոնք կմնան ամբողջ կյանքի համար։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_1_title', 'Ժամանում Ուբուդ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_1_description', 'Տեղափոխում Ուբուդ՝ Բալիի մշակութային սիրտը։ Երեկոյան ողջույնի ընթրիք ավանդական Լեգոնգ պարային ներկայացմամբ, որը ցույց է տալիս բալիական արվեստի նրբագեղությունը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_2_title', 'Տեգալալանգ և Սուրբ Կապիկների անտառ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_2_description', 'Առավոտը անցկացրեք Տեգալալանգի տեռասավորված բրնձի դաշտերում՝ Ասիայի ամենալուսանկարվող տեսարաններից մեկում։ Կեսօրից հետո քայլեք հին Սանգեհ Կապիկների անտառով և այցելեք Տիրտա Էմպուլ ջրային տաճարը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_3_title', 'Բատուր լեռան լուսաբացի արշավ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_3_description', 'Գիշերվա ժամը 2-ին սկսվում է բարձրացումը Բալիի գործող հրաբուխը։ Լուսաբացին հասեք 1717 մետրանոց գագաթ և դիտեք արևածագը ամպերի, Բատուր լճի և Ագունգ լեռան վրայով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_4_title', 'Այունգ գետի ռաֆթինգ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_4_description', 'Այունգ գետը անցնում է խորը ջունգլային կիրճով՝ ջրվեժների, փորագրված ժայռերի և կախված արևադարձային ծառերի կողքով։ Փորձառու ուղեկցորդները պահում են ռաֆթինգը միաժամանակ հուզիչ և անվտանգ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_5_title', 'Բալիական խոհարարական դաս')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_5_description', 'Առավոտն անցկացրեք տեղական ընտանիքի տանը՝ սովորելով պատրաստել ավանդական բալիական ուտեստներ՝ լավար, սատե լիլիթ, նասի ճամպուր։ Կեսօրից հետո ազատ ժամանակ սպայի կամ Ուբուդի արվեստի շուկայի համար։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_6_title', 'Տեղափոխում հարավ և Տանա Լոտ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_6_description', 'Ուղևորվեք հարավ Բալիի կենտրոնական շրջաններով։ Ոսկե ժամին այցելեք Տանա Լոտ ծովային տաճարը, որը կանգնած է օվկիանոսի ժայռի վրա։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_7_title', 'Ուլուվատու և Կեչակ կրակի պար')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_7_description', 'Բացահայտեք Բուկիտ թերակղզին․ Ուլուվատու տաճարը՝ օվկիանոսի վրա 70 մետր բարձրությամբ ժայռին, Պադանգ Պադանգ լողափը և մայրամուտի խորհրդանշական Կեչակ կրակի պարը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_8_title', 'Սեմինյակ և մեկնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'bali-complete-experience'), 'HY', 'itinerary_day_8_description', 'Վերջին առավոտը Սեմինյակ լողափին։ Նախաճաշ-ճաշ ծովափնյա սրճարանում, ապա տեղափոխում Նգուրահ Ռայ միջազգային օդանավակայան։ Բալին ձեզ հետ կկանչի։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_1_title', 'Ժամանում և Դուբայ Մարինա')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_1_description', 'Տեղավորվեք հյուրանոցում և առաջին երեկոն անցկացրեք Դուբայ Մարինայի լուսավորված զբոսավայրում՝ ջրի մեջ արտացոլվող երկնաքերերի անտառի կողքով։ Ընթրիք մարինայի ռեստորանում, երբ քաղաքը կենդանանում է լույսերով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_2_title', 'Բուրջ Խալիֆա և հին Դուբայ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_2_description', 'Առավոտը Բուրջ Խալիֆայի 148-րդ հարկի դիտահարթակում․ քաղաքը, անապատն ու Ծոցը բացվում են մինչև հորիզոն։ Կեսօրից հետո նավակով Դուբայ Քրիքի երկայնքով՝ դեպի հին Դուբայի ոսկու և համեմունքների շուկաներ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_3_title', 'Անապատային սաֆարի')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_3_description', 'Կեսօրից հետո 4x4 մեքենաների շարասյունը շարժվում է Արաբական անապատի կարմիր դյուները։ Դյուներով սահք, սենդբորդինգ, ուղտավարություն, ապա մայրամուտին բեդվինական ճամբար՝ արաբական ընթրիքով, շիշայով, կենդանի երաժշտությամբ և աստղազարդ երկնքով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_4_title', 'Ատլանտիս, Փալմ և JBR լողափ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_4_description', 'Առավոտը Palm Jumeirah-ի Atlantis հանգստավայրի Aquaventure ջրաշխարհում՝ սահարաններ և մասնավոր լողափ Դուբայի երկնագծի տեսարանով։ Կեսօրից հետո՝ JBR լողափ՝ լողի և մայրամուտի համար։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_5_title', 'Dubai Mall և մեկնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'dubai-city-desert'), 'HY', 'itinerary_day_5_description', 'Վերջին առավոտը՝ վերջին գնումների համար Dubai Mall-ում՝ աշխարհի ամենամեծ առևտրի կենտրոնում։ Կեսօրին շատրվանների շոու, ապա տեղափոխում Դուբայի միջազգային օդանավակայան։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_1_title', 'Ժամանում Սանտորինի')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_1_description', 'Թռիչք դեպի Սանտորինի և տեղափոխում կալդերայի վերևում գտնվող ձեր ժայռափոր հյուրանոց։ Առաջին երեկո՝ հանգիստ զբոսանք Ֆիրայից կալդերայի եզրով՝ Էգեյան ծովի վրա օրվա վերջին լույսը դիտելու համար։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_2_title', 'Օյա գյուղ և Ակրոտիրիի ավերակներ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_2_description', 'Բացահայտեք Օյան լուսաբացին՝ կապույտ գմբեթավոր եկեղեցիները, հողմաղացները և ժայռափոր աստիճանները, մինչև զբոսաշրջիկների հոսքը։ Կեսօրից հետո՝ հին մինոյական Ակրոտիրի քաղաքի ուղեկցվող շրջայց, որը պահպանվել է մ.թ.ա. 1613 թվականից։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_3_title', 'Կալդերայի կատամարանով նավարկություն')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_3_description', 'Ամբողջօրյա նավարկություն հրաբխային կղզիների շուրջ․ լող ջերմ աղբյուրներում, սուզալող գունավոր ծովահատակի վրա, այց Նեա Կամենիսի սև ավազով լողափ և մայրամուտի խորոված-ճաշ տախտակամածին՝ կալդերայի մեջտեղում։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_4_title', 'Գինու համտես կալդերայի վրա')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_4_description', 'Սանտորինին արտադրում է Հունաստանի լավագույն գինիներից մի քանիսը։ Այցելեք երկու գինեգործարան, որոնցից մեկը փորված է հրաբխային ժայռի մեջ, և համտեսեք Ասիրտիկո, Վինսանտո և Նիկտերի տեսակները տեղական սոմելյեի հետ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_5_title', 'Սև լողափ և Պերիսա գյուղ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_5_description', 'Օրը անցկացրեք Պերիսայում՝ Սանտորինիի հայտնի սև ավազով լողափին։ Լողացեք, արևայրուք ընդունեք և գյուղական տավերնաներում փորձեք թարմ խորոված ութոտնուկ և ծովամթերք։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_6_title', 'Ֆիրա և Պիրգոս գյուղ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_6_description', 'Բացահայտեք աշխույժ մայրաքաղաք Ֆիրան՝ Նախապատմական Թերայի թանգարանը և ճոպանուղով իջնելը դեպի հին նավահանգիստ։ Կեսօրից հետո՝ Պիրգոս միջնադարյան բարձունքային գյուղում՝ զբոսաշրջային հիմնական ուղուց հեռու։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_7_title', 'Մեկնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'santorini-dream'), 'HY', 'itinerary_day_7_description', 'Վերջին արևածագը կալդերայի վրա ձեր տեռասից։ Տեղափոխում Սանտորինիի օդանավակայան։ Կղզին ձեզ հետ կմնա երկար ժամանակ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_1_title', 'Ժամանում և Էյֆելյան աշտարակի երեկո')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_1_description', 'Տեղավորվեք Left Bank-ի ձեր հյուրանոցում։ Երեկոյան զբոսանք Սեն գետի երկայնքով դեպի Տրոկադերո՝ Էյֆելյան աշտարակի հայտնի լուսային շոուն դիտելու համար։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_2_title', 'Լուվր և Մոնմարտր')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_2_description', 'Առավոտը Լուվրում՝ առանց հերթի տոմսերով․ Թևավոր Հաղթանակը, Վեներա Միլոսացին և Մոնա Լիզան հարաբերական խաղաղության մեջ։ Կեսօրից հետո բարձրացեք Մոնմարտրի զառիթափ փողոցներով դեպի Սակրե-Կյոր՝ Փարիզի լավագույն անվճար տեսարաններից մեկը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_3_title', 'Վերսալ և Սեն գետի նավարկություն')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_3_description', 'Օրյա այց Վերսալի պալատ՝ Հայելիների սրահով և դասական այգիներով։ Վերադարձ Փարիզ՝ մայրամուտի մասնավոր նավարկության Սենով, երբ կամուրջներն ու հուշարձանները ոսկեգույն են փայլում։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_4_title', 'Լե Մարե և Սենտ-Շապել')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_4_description', 'Բացահայտեք Մարե թաղամասը՝ Place des Vosges, Պիկասոյի թանգարան և բուտիկներ քարապատ փողոցներում։ Այցելեք Սենտ-Շապել՝ 13-րդ դարի շունչ կտրող վիտրաժներով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_5_title', 'Սեն-Ժերմեն և մեկնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), 'HY', 'itinerary_day_5_description', 'Վերջին առավոտը Սեն-Ժերմեն-դե-Պրեի սրճարաններով լի փողոցներում։ Կրուասան և café crème լեգենդար Left Bank բրասերիում, ապա տեղափոխում Շառլ դը Գոլի օդանավակայան։ Մինչ հանդիպում, Փարիզ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_1_title', 'Ժամանում Փհուկետ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_1_description', 'Տեղափոխում ձեր ծովափնյա հանգստավայր։ Կեսօրից հետո առաջին լողը Կատա լողափի հանգիստ ջրերում, որը հարմար է ընտանիքի բոլոր անդամների համար։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_2_title', 'Փղերի ապաստարան')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_2_description', 'Առավոտը անցկացրեք էթիկական փղերի ապաստարանում՝ անտառի մեջ։ Կերակրեք, լողացրեք և քայլեք փրկված փղերի հետ՝ առանց կենդանիներին վնասող զվարճանքների։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_3_title', 'Փանգ Նգա ծոց')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_3_description', 'Ամբողջօրյա նավարկություն Փանգ Նգա ծոցում․ կրաքարային ժայռեր, մանգրովե ջրանցքներ, James Bond Island և լուսավոր ծովային քարանձավներ, որոնք կարելի է բացահայտել կայակով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_4_title', 'Պի Պի կղզիներ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_4_description', 'Արագընթաց նավակով դեպի Պի Պի կղզիներ՝ Maya Bay, Monkey Beach և Pileh Lagoon-ի բյուրեղյա ջրերը։ Սուզալող Shark Point-ում և հանգիստ ժամանակ լողափին։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_5_title', 'Թաիլանդական խոհարարական դաս')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_5_description', 'Ընտանեկան խոհարարական դաս տեղական խոհարարի հետ։ Սովորեք պատրաստել pad thai, կանաչ կարրի և mango sticky rice, ապա վայելեք ձեր պատրաստած ճաշը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_6_title', 'Ջրային ժամանց')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_6_description', 'Օր հանգստավայրի լողափում՝ ներառված ջրային զբաղմունքներով․ jet ski, parasailing, banana boat և paddleboard։ Կեսօրից հետո ազատ ժամանակ և վերջին մայրամուտը լողափին։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_7_title', 'Մեծ Բուդդա և Wat Chalong')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_7_description', 'Առավոտյան այց Մեծ Բուդդայի 45 մետրանոց արձանին՝ բլրի վրա 360 աստիճան տեսարանով։ Wat Chalong-ը Փհուկետի ամենահարգված տաճարն է։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_8_title', 'Մեկնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'phuket-family-beach'), 'HY', 'itinerary_day_8_description', 'Վերջին առավոտյան լող։ Տեղափոխում Փհուկետի միջազգային օդանավակայան։ Թաիլանդը՝ ժպիտների երկիրը, կկարոտի ամբողջ ընտանիքը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_1_title', 'Ժամանում Թբիլիսի')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_1_description', 'Ժամանեք Վրաստանի հին մայրաքաղաք և տեղավորվեք Հին քաղաքի բուտիկ հյուրանոցում։ Երեկոյան զբոսանք Աբանոտուբանիի մթնոլորտային ծծմբային բաղնիքների թաղամասում և ընթրիք հին քաղաքի տակ գտնվող գինու մառանում։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_2_title', 'Թբիլիսիի Հին քաղաք և Նարիկալա')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_2_description', 'Ուղեկցվող քայլարշավ Հին Թբիլիսիի ոլորուն փողոցներով՝ Սիոնի տաճար, Շարդենի փողոցի գունավոր պատշգամբներով տներ, քաղաքի վերևում գտնվող պարսկական դարաշրջանի Նարիկալա բերդ և բացօթյա ազգագրական թանգարան։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_3_title', 'Ճանապարհ դեպի Կազբեգիի լեռներ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_3_description', 'Անցեք Վրացական ռազմական ճանապարհով Մեծ Կովկասի տպավորիչ լեռներով։ Բարձրացեք միջնադարյան Գերգետի Երրորդության եկեղեցի՝ 2170 մ բարձրության վրա, Կազբեկ լեռան ֆոնին։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_4_title', 'Կազբեգիի արշավ և վերադարձ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_4_description', 'Առավոտյան քայլարշավ ալպյան մարգագետիններով՝ սառցադաշտերի տեսարաններով։ Կեսօրից հետո վերադարձ Թբիլիսիի ուղղությամբ՝ կանգառ Անանուրի բերդի համալիրում, որը արտացոլվում է փիրուզագույն Ժինվալի ջրամբարում։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_5_title', 'Կախեթիի գինու տարածաշրջան')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_5_description', 'Ուղևորվեք արևելք՝ Կախեթի, վրացական գինու սիրտը։ Այցելեք ընտանեկան գինեգործարան, սովորեք կվևրիի հին կավե անոթներում խմորման մեթոդը և համտեսեք տարածաշրջանի յուրահատուկ սաթագույն գինիները։ Ավարտը՝ ավանդական սուպրա ընտանիքի հետ։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_6_title', 'Մեկնում Թբիլիսիից')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), 'HY', 'itinerary_day_6_description', 'Վերջին առավոտյան զբոսանք Խաղաղության կամրջով և Մտկվարի գետի երկայնքով։ Տեղափոխում Թբիլիսիի միջազգային օդանավակայան։ Վրաստանի ջերմությունը, գեղեցկությունն ու առատ սեղանը ձեզ հետ կկանչեն։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_1_title', 'Ժամանում Կիոտո')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_1_description', 'Օսակայի օդանավակայանից Շինկանսենով ժամանում Կիոտո։ Ուղեկցորդը դիմավորում է ձեզ և տանում Գիոնով՝ հին գեյշաների թաղամասով, երբ երեկոյան լապտերները լուսավորում են փայտե մաչիա տները։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_2_title', 'Ֆուշիմի Ինարի և Նիշիկի շուկա')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_2_description', 'Լուսաբացին այցելություն Ֆուշիմի Ինարի սրբավայր․ քայլեք 10 000 վերմիլիոն տորիի դարպասների ամբողջ ցանցով անտառապատ լեռան միջով, մինչ լույսը դեռ ոսկեգույն է և բազմությունը բացակայում է։ Կեսօրից հետո՝ Նիշիկի ծածկած շուկան՝ Կիոտոյի խոհանոցը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_3_title', 'Թեյի արարողություն և Փիլիսոփայի արահետ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_3_description', 'Մասնակցեք մասնավոր թեյի արարողության երրորդ սերնդի թեյի վարպետի հետ նրա 300-ամյա մաչիա տանը։ Կեսօրից հետո զբոսանք Փիլիսոփայի արահետով՝ Հիգաշիյամայի տաճարային թաղամասով։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_4_title', 'Արաշիյամա և բամբուկե պուրակ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_4_description', 'Sagano Romantic Train-ով անցեք Հոզու գետի կիրճով դեպի Արաշիյամա։ Քայլեք բարձր բամբուկե պուրակով, այցելեք Tenryu-ji Զեն այգին և հանգիստ Jojakko-ji տաճարը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_5_title', 'Նիձո ամրոց և Կինկակու-ձի')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_5_description', 'Բացահայտեք Նիձո ամրոցը՝ շոգունի Կիոտոյի նստավայրը, իր հայտնի «սոխակի» հատակներով, որոնք քայլելիս ձայն են հանում։ Կեսօրից հետո՝ Կինկակու-ձի Ոսկե տաղավարը, որը արտացոլվում է հայելային լճակում։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_6_title', 'Իկեբանայի դաս և երեկո Գիոնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_6_description', 'Առավոտյան իկեբանայի՝ ճապոնական ծաղկահարդարման հին արվեստի դաս վարպետի հետ։ Երեկոյան Գիոնում՝ հետևելու մաիկոներին, որոնք գնում են հանդիպումների օչայա թեյատներում։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_7_title', 'Մեկնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('tour', (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), 'HY', 'itinerary_day_7_description', 'Վերջին առավոտը Նիշիկի շուկայում՝ թեյի, տոֆուի և հրաժեշտի գնումների համար։ Տեղափոխում Օսակայի օդանավակայան։ Ճապոնիան փոխում է աշխարհը տեսնելու ձեր ձևը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'why-maldives-perfect-honeymoon'), 'HY', 'title', 'Ինչու են Մալդիվները աշխարհի կատարյալ մեղրամսի ուղղությունը')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'why-maldives-perfect-honeymoon'), 'HY', 'excerpt', 'Բյուրեղյա լագունաներ, ջրի վրա կառուցված վիլլաներ, լիակատար գաղտնիություն և անկրկնելի մայրամուտներ․ ահա թե ինչու են Մալդիվները գլխավորում մեղրամսի ցանկերը։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'why-maldives-perfect-honeymoon'), 'HY', 'content', '<p>Ամեն տարի հազարավոր զույգեր ընտրում են Մալդիվները իրենց մեղրամսի համար, և գրեթե բոլորը ասում են, որ այն գերազանցել է սպասումները։ Ի՞նչն է Հնդկական օվկիանոսում սփռված այս արշիպելագը դարձնում այդքան կատարյալ ռոմանտիկ հանգստի համար։</p><p><strong>Գաղտնիությունը իրական է։</strong> Շատ հանգստավայրեր զբաղեցնում են ամբողջական մասնավոր կղզի․ չկան օրական այցելուներ, չկան ամբոխներ, և հաճախ ձեր ջրի վրայի վիլլայից այլ հյուրեր չեն երևում։ Օվկիանոսը կարծես ձերն է։</p><p><strong>Տեսարանը անհավանական է։</strong> Այստեղ Հնդկական օվկիանոսի կապույտը թվում է թվայնորեն ուժեղացված՝ լուսավոր, գրեթե թափանցիկ փիրուզագույն ծանծաղ լագունաներում և թանաքագույն բաց ջրերում։</p><p><strong>Սպասարկումը բացառիկ է։</strong> Անձնական սպասավորը ժամանման պահից սովորում է ձեր նախասիրությունները և կանխատեսում կարիքները ամբողջ հանգստի ընթացքում։</p><p><strong>Ծովային կյանքը բացառիկ է։</strong> Ձեր վիլլայի աստիճաններից սուզալող անելիս կարող եք հանդիպել ծովային կրիաների, ռիֆային շնաձկների, մանտաների և հազարավոր արևադարձային ձկների։</p><p>Մալդիվները պարզապես ուղղություն չեն․ դրանք չափանիշ են, որի հետ հետագա ճանապարհորդությունները համեմատվելու են։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'hidden-side-of-georgia'), 'HY', 'title', 'Վրաստանի թաքնված կողմը․ Թբիլիսիից այն կողմ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'hidden-side-of-georgia'), 'HY', 'excerpt', 'Շատերը տեսնում են միայն Թբիլիսին։ Բայց իրական Վրաստանը՝ հին քարանձավային քաղաքներով, լեռնային վանքերով և լեգենդար գինով, գտնվում է մայրաքաղաքից դուրս։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'hidden-side-of-georgia'), 'HY', 'content', '<p>Վրաստանը աստիճանաբար դառնում է աշխարհի ամենահետաքրքիր ճանապարհորդական ուղղություններից մեկը։ Թբիլիսին իր միջնադարյան, կայսերական ռուսական, խորհրդային և ժամանակակից ճարտարապետության խառնուրդով իսկապես յուրահատուկ մայրաքաղաք է։ Բայց քաղաքից դուրս բացվում է շատ ավելի հին և խորքային երկիր։</p><p><strong>Կազբեգի և Մեծ Կովկաս։</strong> Թբիլիսիից հյուսիս տանող Վրացական ռազմական ճանապարհը աշխարհի ամենատպավորիչ ավտոճանապարհներից է։ Գերգետի Երրորդության եկեղեցին, որը կանգնած է 2170 մետր բարձրության վրա Կազբեկ լեռան ֆոնին, ամբողջ Կովկասի խորհրդանշական պատկերներից է։</p><p><strong>Կախեթիի գինու երկիրը։</strong> Վրաստանը լայնորեն համարվում է գինու հայրենիք․ այստեղ խաղողը խմորվում է առնվազն 8000 տարի։ Կվևրիի հին մեթոդով ստացվող սաթագույն գինիները այսօր մեծ հետաքրքրություն են առաջացնում բնական գինու աշխարհում։</p><p><strong>Վարձիա քարանձավային քաղաք։</strong> Հարավային Վրաստանում 12-րդ դարում հրաբխային ժայռի մեջ փորված Վարձիան ունի հազարավոր սենյակներ, եկեղեցի, որմնանկարներ և բարդ ոռոգման համակարգ։</p><p>Վրաստանը հետաքրքրասեր ճանապարհորդին պարգևատրում է մեծահոգությամբ, ջերմությամբ և անմոռանալի սուպրայով։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'first-time-japan-guide'), 'HY', 'title', 'Առաջին անգամ Ճապոնիայում․ ինչ պետք է իմանալ ճանապարհորդությունից առաջ')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'first-time-japan-guide'), 'HY', 'excerpt', 'Գնացքների էթիկետից մինչև տաճարային կանոններ, կանխիկ գումարից մինչև կոնբինի նախաճաշեր․ անհրաժեշտ ուղեցույց Ճապոնիա առաջին անգամ այցելողների համար։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'first-time-japan-guide'), 'HY', 'content', '<p>Ճապոնիան այն ուղղություններից է, որտեղ նախապատրաստությունը մեծ արդյունք է տալիս։ Ոչ թե այն պատճառով, որ երկիրը դժվար է, այլ որովհետև մի քանի մշակութային նրբությունների իմացությունը լավ ճանապարհորդությունը դարձնում է հրաշալի։</p><p><strong>JR Pass։</strong> Եթե այցելում եք մի քանի քաղաք, Japan Rail Pass-ը հաճախ արժե գնել նախքան մեկնելը։ Այն ներառում է Շինկանսենի և բազմաթիվ տարածաշրջանային գնացքների ցանցը։</p><p><strong>Կանխիկը դեռ կարևոր է։</strong> Չնայած տեխնոլոգիական առաջատար լինելուն՝ Ճապոնիայում շատ ռեստորաններ, սրբավայրեր և փոքր խանութներ քարտ չեն ընդունում։ Միշտ ունեցեք յեն։</p><p><strong>Կոնբինի։</strong> Ճապոնական հարմարավետ խանութները՝ 7-Eleven, Lawson, FamilyMart, իսկական հաստատություններ են․ բաց են 24 ժամ և առաջարկում են տաք ուտեստներ, օնիգիրի, սենդվիչներ, սուրճ, դեղեր և շատ այլ բաներ։</p><p><strong>Տաճարների և սրբավայրերի էթիկետ։</strong> Տորիի դարպասով անցնելիս թեթև խոնարհվեք, մուտքից առաջ լվացեք ձեռքերը, իսկ տաճարային շենքերում հանեք կոշիկները։</p><p><strong>Գնացքները ժամանակին են։</strong> Նույնիսկ մեկ րոպե ուշացումը հայտարարվում է։ Բջջային հեռախոսները պահեք լուռ ռեժիմում, իսկ առաջնահերթ նստատեղերը թողեք տարեցներին և հաշմանդամություն ունեցողներին։</p><p>Ճապոնիան գերազանցում է գրեթե բոլոր սպասումները և փոխում է գեղեցկությունը, կարգը և վարպետությունը ընկալելու ձևը։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'dubai-beyond-the-skyscrapers'), 'HY', 'title', 'Դուբայը երկնաքերերից այն կողմ․ քաղաքը, որը շատերը չեն տեսնում')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'dubai-beyond-the-skyscrapers'), 'HY', 'excerpt', 'Դուբայը հայտնի է շքեղությամբ և ռեկորդներով, բայց մոլերի ու երկնաքերերի հետևում կա անսպասելի խորությամբ, պատմությամբ և մարդկայնությամբ քաղաք։')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

INSERT INTO translations (entity_type, entity_id, locale, field, value)
VALUES ('blog', (SELECT id FROM blog_post WHERE slug = 'dubai-beyond-the-skyscrapers'), 'HY', 'content', '<p>Դուբայի միջազգային համբավը կառուցված է գերլատիվների վրա՝ աշխարհի ամենաբարձր շենքը, ամենամեծ առևտրի կենտրոնը, ամենաշքեղ բրանչերը։ Բայց դրանք քաղաքի միայն մեկ շերտն են։</p><p><strong>Հին քաղաքը։</strong> Դուբայ Քրիքը անցեք ավանդական փայտե աբրայով՝ ոսկու շուկայից դեպի համեմունքների շուկա։ Ջրի վրա օդը լցված է սանդալի, խնկի և զաֆրանի բույրերով։ Սա նավթի դարաշրջանից շատ առաջ գոյություն ունեցող Դուբայն է։</p><p><strong>Ալ Ֆահիդի պատմական թաղամաս։</strong> Քրիքի մոտ գտնվող այս թաղամասը՝ քամու աշտարակներով և նեղ ավազոտ փողոցներով, գեղեցիկ պահպանվել է։ Այստեղ կան արվեստանոցներ, սուրճի թանգարան և մշակութային կենտրոն, որտեղ կարելի է բաց հարցեր տալ Էմիրաթների կյանքի ու մշակույթի մասին։</p><p><strong>Անապատը գիշերը։</strong> Բուրջ Խալիֆայից քառասուն րոպե հեռու քաղաքը անհետանում է, և սկսվում է Արաբական անապատը։ Լույսի աղտոտումից հեռու դյուների վերևում աստղերը անսովոր պայծառ են։</p><p>Եկեք ռեկորդների համար, մնացեք խորության համար։ Դուբայը ավելի տարօրինակ և հետաքրքիր է, քան թվում է Instagram-ում։</p>')
ON CONFLICT (entity_type, entity_id, locale, field)
DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

COMMIT;
