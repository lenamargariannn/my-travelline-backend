-- V10__fix_armenian_and_russian_translations.sql
-- Fixes Armenian and Russian translation copy inserted by V8.
-- Keeps old migrations immutable and only updates translation values.
BEGIN;

UPDATE translations
SET value = 'Բալին իրավամբ կոչվում է «Աստվածների կղզի»։ Սրբազան հինդուիստական տաճարները բարձրանում են զմրուխտագույն բրնձի դաշտերի ֆոնին, սպիտակ ավազով լողափերը հանդիպում են համաշխարհային մակարդակի սերֆինգին, իսկ բալիական մշակույթի ջերմությունը զգացվում է կղզու ամեն անկյունում։', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'bali') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Դուբայ', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'dubai') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = 'Դուբայը զարմացնում է երևակայությունը՝ անապատից բարձրացող ապագայամետ երկնագծով, ռեկորդային ճարտարապետությամբ, համաշխարհային մակարդակի գնումներով և ոսկեգույն ավազաթմբերով մեկ քաղաքի մեջ։ Ավելացրեք մաքուր լողափերն ու շուրջտարյա արևը, և արդյունքը դառնում է անչափ գրավիչ։', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'dubai') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Սանտորինի', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'santorini') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = 'Մարդկության պատմության խոշորագույն հրաբխային ժայթքումներից մեկի արդյունքում ձևավորված Սանտորինիի դրամատիկ կալդերան, սպիտակ գյուղերն ու լեգենդար մայրամուտները այն դարձնում են Երկրի ամենալուսանկարվող և ամենահմայիչ վայրերից մեկը։', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'santorini') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Փարիզ', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'paris') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = 'Լույսի քաղաքը ներկայացման կարիք չունի։ Փարիզը ճանապարհորդներին պարգևում է համաշխարհային մակարդակի թանգարաններ, հավերժական ճարտարապետություն, նուրբ խոհանոց և անգերազանցելի ռոմանտիկ մթնոլորտ, որը դարեր շարունակ ոգեշնչել է արվեստագետներին։', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'paris') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Փուկետ', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'phuket') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = 'Թաիլանդի ամենամեծ կղզին միավորում է հիասքանչ լողափեր, աշխույժ գիշերային կյանք, հնագույն բուդդայական տաճարներ և ջերմ հյուրընկալ մշակույթ։ Նավով բացահայտեք կղզիները կամ պարզապես հանգստացեք ոսկե ափին․ Փուկետը հարմար է ցանկացած ճամփորդության համար։', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'phuket') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Թբիլիսի', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'tbilisi') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = 'Վրաստանի հնագույն մայրաքաղաքը Կովկասի լավագույն թաքնված գոհարներից է։ Թբիլիսին միավորում է միջնադարյան ամրոցներ, ծծմբային բաղնիքներ և զարգացող գինու ու խոհանոցի մշակույթ՝ Կովկասյան լեռների վեհ ֆոնի վրա։', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'tbilisi') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Կիոտո', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'kyoto') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = 'Ճապոնիայի հին կայսերական մայրաքաղաքը կենդանի թանգարան է։ ՅՈՒՆԵՍԿՕ-ի համաշխարհային ժառանգության տասնյոթ վայրեր, հազարավոր տաճարներ և սրբավայրեր, բամբուկի պուրակներ և խոր գեղագիտական նրբություն՝ Կիոտոն դարձնում են աշխարհի ամենամշակութային հարուստ քաղաքներից մեկը։', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'kyoto') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Մեղրամսային ճանապարհորդություն Մալդիվներում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Սկսեք ձեր համատեղ կյանքը Երկրի ամենահիասքանչ վայրերից մեկում։ Այս 6-օրյա մեղրամսային փաթեթը ձեզ տեղավորում է ջրի վրա կառուցված մասնավոր վիլլայում, որի ապակե հատակից բացվում է տեսարան դեպի փիրուզագույն լագունա։ Յուրաքանչյուր առավոտ սկսվում է օվկիանոսի ձայնով, իսկ յուրաքանչյուր երեկո ավարտվում է աստղերի տակ՝ ավազե ափին մոմերով ընթրիքով։</p><p>Ձեր անձնական սպասավորը կհոգա բոլոր մանրամասների մասին՝ հիդրոինքնաթիռով տեղափոխում, շամպայն ժամանման պահին և հաճելի անակնկալներ ամբողջ հանգստի ընթացքում։ Սա ձեր երազած մեղրամիսն է։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Բալիի ամբողջական փորձառություն', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Բալին զարմանալի հակադրությունների վայր է, և այս 8-օրյա տուրը ստեղծված է դրանք բոլորը ցույց տալու համար։ Սկսեք Ուբուդից՝ Բալիի մշակութային սրտից՝ բրնձի դաշտեր, Սրբազան կապիկների անտառ և Կեչակ պար մայրամուտին։</p><p>Տուրի կեսին լուսաբացին բարձրացեք գործող Բատուր հրաբուխը․ ամպերից վեր բարձրացող արևը փոխում է ձեր ընկալումը աշխարհի մասին։ Վերջին օրերը նվիրված են Սեմինյակի լողափերին, սերֆինգին և օվկիանոսի վրա բարձրացող Ուլուվատու տաճարին։ Բալին՝ ամբողջությամբ։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Դուբայ․ քաղաք և անապատ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Դուբայը ռեկորդների քաղաք է, և այս 5-օրյա տուրը ձեզ ծանոթացնում է դրանց լավագույններին։ Բարձրացեք աշխարհի ամենաբարձր շենքի՝ Բուրջ Խալիֆայի գագաթը, մինչ քաղաքը տարածվում է ձեր ոտքերի տակ։ Բացահայտեք Դուբայ Քրիքի մոտ գտնվող ոսկու և համեմունքների հին շուկաները։</p><p>Երրորդ օրը ամենագնացների շարասյունը շարժվում է դեպի Արաբական անապատի կարմիր ավազաթմբերը՝ ավազաբլուրներով երթ, ուղտերով զբոսանք և շքեղ ընթրիք բեդվինական ճամբարում՝ աստղերի տակ։ Քաղաքի հետ հակադրությունը ապշեցնող է և անմոռանալի։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Սանտորինիի երազանք', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Երկրի վրա քիչ վայրեր կան, որոնց առաջին տպավորությունն այնքան հզոր է, որքան Սանտորինիինը։ Այս 7-օրյա տուրը տալիս է ժամանակ և ուղեկցություն՝ կղզին տեսնելու ոչ միայն հայտնի լուսանկարների միջով։</p><p>Օիա գյուղը լուսաբացին՝ մինչև բազմության գալը, կատամարանով նավարկություն կալդերայում, հրաբխային տաք աղբյուրներ, ասիրտիկո գինու համտես կալդերայի եզրին և Ակրոտիրիի ավերակներ․ Սանտորինին՝ իր ամբողջ խորությամբ։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Ռոմանտիկ փախուստ Փարիզ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Փարիզն ամեն օր արդարացնում է աշխարհի ամենառոմանտիկ քաղաքի իր համբավը, և այս 5-օրյա տուրը ստեղծված է այդ ռոմանտիկան ամբողջությամբ փոխանցելու համար։ Ժամանում՝ ծաղիկներ և շամպայն Սենի մոտ գտնվող համարում։ Առաջին երեկո՝ լուսավորված Էյֆելյան աշտարակ։</p><p>Լուվր, Մոնմարտր, Վերսալ և մասնավոր նավարկություն Սենով մայրամուտին․ Փարիզը՝ ամենանուրբ և անմոռանալի ձևով։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Փուկետ․ ընտանեկան լողափային հանգիստ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Թաիլանդը ընտանիքների համար ամենահյուրընկալ ուղղություններից է, և Փուկետի այս 8-օրյա հանգիստը ստեղծված է յուրաքանչյուր սերնդին ուրախացնելու համար։ Ձեր հանգրվանը Կատա լողափի հանգիստ ջրերի մոտ գտնվող ընդարձակ ծովափնյա հանգստավայրն է։</p><p>Կղզային շրջագայություններ, փղերի ապաստարան, Փանգ Նգա ծովածոց և Փի Փի կղզիներ․ այստեղ յուրաքանչյուր ընտանիքի անդամ իր հետաքրքրությունը կգտնի։ Թաիլանդը կգրավի ամբողջ ընտանիքի սիրտը։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Վրաստան և Կովկաս․ բացահայտում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Վրաստանը աշխարհի ամենահին և ամենաթերագնահատված ուղղություններից է, և այս 6-օրյա տուրը բացահայտում է նրա զարմանալի խորությունը։ Սկսեք Թբիլիսիից՝ Հին քաղաքի քարապատ փողոցներ, Աբանոտուբանիի ծծմբային բաղնիքներ և գինու ու խոհանոցի հրաշալի մշակույթ։</p><p>Մեծ Կովկասի լեռներ, Գերգեթիի վանք, Կազբեգի և Կախեթիի գինեգործական շրջան՝ ավանդական քվևրիով․ Վրաստանը ջերմ է և իսկական։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Կիոտո․ մշակութային խորասուզում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'name';

UPDATE translations
SET value = '<p>Կիոտոն Ճապոնիան է իր ամենամաքուր ձևով։ Այս 7-օրյա տուրը ստեղծված է ոչ միայն Կիոտոյի կարևոր վայրերը ցույց տալու, այլև դրանց հետևում կանգնած ավանդույթներին ու պատմություններին իրական հասանելիություն տալու համար։</p><p>Ֆուշիմի Ինարի սրբավայրը լուսաբացին, մասնավոր թեյի արարողություն 300-ամյա տանը, Արաշիյամայի բամբուկի պուրակ, Ոսկե տաղավար և երեկոյան զբոսանք Գիոնով․ Կիոտոն բացվում է շերտ առ շերտ։</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'description';

UPDATE translations
SET value = 'Ժամանում և հիդրոինքնաթիռով տեղափոխում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Վայրէջք կատարեք Մալեի միջազգային օդանավակայանում և նստեք հիդրոինքնաթիռ՝ ձեր կյանքի ամենագեղեցիկ 30-րոպեանոց թռիչքի համար։ Վիլլայում ձեզ սպասում են շամպայն, ծաղիկներ և Հնդկական օվկիանոս՝ մինչև հորիզոն։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Ռիֆի սնորքելինգ և սպա', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Բացահայտեք կղզու մասնավոր ռիֆը ձեր ռիթմով․ ծովային կրիաները, ռիֆային շնաձկներն ու մանտաները հաճախակի հյուրեր են։ Երեկոյան՝ 90-րոպեանոց զույգերի սպա ծես մալդիվյան յուղերով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Պիկնիկ ավազե ծանծաղուտում և մայրամուտի նավարկություն', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Մասնավոր դհոնին ձեզ կտանի լագունայի մեջտեղի մեկուսացված ավազե ծանծաղուտ՝ շամպայնով պիկնիկի համար։ Մայրամուտին՝ կախարդական նավարկություն ատոլով ոսկե լույսերի միջով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Դելֆինների դիտում և սնորքելինգ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Առավոտյան էքսկուրսիա բաց օվկիանոսում դելֆինների դիտման համար։ Մալդիվները հայտնի են դելֆինների մեծ խտությամբ։ Այնուհետև սնորքելինգ՝ խոր մարջանյա պատի վրայով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Մասնավոր ընթրիք լողափին', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Օրը ամբողջությամբ ձերն է։ Գիշերվա գալուն պես սպասավորը մոմերով սեղան կպատրաստի հենց լողափին, իսկ աստղերը կարտացոլվեն օվկիանոսի հանգիստ մակերեսին։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Մեկնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Վերջին առավոտյան լողը՝ նախքան հիդրոինքնաթիռը ձեզ կվերադարձնի Մալե։ Դուք կմեկնեք ողջ կյանքի հիշողություններով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'HY' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Ժամանում Ուբուդ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Տեղափոխում Ուբուդ՝ Բալիի մշակութային սիրտ։ Երեկոյան ողջույնի ընթրիք՝ ավանդական Լեգոնգ պարով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Թեգալալանգ և Սրբազան կապիկների անտառ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Առավոտը՝ Թեգալալանգի բրնձի դաշտերում՝ Ասիայի ամենալուսանկարվող տեսարաններից մեկում։ Կեսօրին՝ Սանգեհի Սրբազան կապիկների անտառ և Տիրտա Էմպուլ ջրային տաճար։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Լուսաբաց Բատուր հրաբխի վրա', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Գիշերվա 2-ին սկսվող վերելք դեպի Բալիի գործող հրաբուխ։ 1717 մետր բարձրության գագաթին արևը բարձրանում է ամպերից վեր՝ Բատուր լճի և Ագունգ լեռան ֆոնին։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Ռաֆթինգ Այունգ գետով', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Այունգ գետը անցնում է ջունգլիների խոր կիրճով՝ ջրվեժների և կախված ծառերի կողքով։ Փորձառու գիդերը այն դարձնում են հուզիչ, բայց անվտանգ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Բալիական խոհարարական դաս', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Առավոտը՝ ընտանեկան տանը, որտեղ կսովորեք պատրաստել հինգ ավանդական բալիական ուտեստ։ Կեսօրն ազատ է սպայի կամ Ուբուդի արվեստի շուկայի համար։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Տեղափոխում հարավ և Տանահ Լոտ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Տեղափոխում Բալիի հարավ։ Այց Տանահ Լոտ ծովային տաճար՝ օվկիանոսի ժայռի վրա, ոսկե ժամին։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Ուլուվատու և Կեչակ պար', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Բացահայտեք Բուկիտի թերակղզին՝ Ուլուվատու տաճարը օվկիանոսից 70 մետր բարձր, Պադանգ Պադանգ լողափը և Կեչակ պարը մայրամուտին։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Սեմինյակ և մեկնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_8_title';

UPDATE translations
SET value = 'Վերջին առավոտը Սեմինյակի լողափին։ Բրանչ ծովափնյա սրճարանում՝ օդանավակայան մեկնելուց առաջ։ Բալին ձեզ հետ կմնա երկար ժամանակ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'HY' AND field = 'itinerary_day_8_description';

UPDATE translations
SET value = 'Ժամանում և Դուբայ Մարինա', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Տեղավորվեք և առաջին երեկոն անցկացրեք Դուբայ Մարինայի լուսավորված զբոսավայրում՝ երկնաքերերի արտացոլումների կողքին։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Բուրջ Խալիֆա և հին Դուբայ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Առավոտյան բարձրացեք Բուրջ Խալիֆայի 148-րդ հարկ։ Կեսօրին նավակով անցեք Դուբայ Քրիքը և այցելեք ոսկու ու համեմունքների շուկաները։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Անապատային սաֆարի', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Կեսօրին 4x4 մեքենաներով շարժվեք դեպի արաբական անապատի կարմիր ավազաթմբերը՝ ավազաբլուրներով երթ, ուղտերով զբոսանք և ընթրիք բեդվինական ճամբարում։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Ատլանտիս, Փալմ և JBR լողափ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Առավոտը՝ Աքվավենչուր ջրաշխարհում՝ Փալմ Ջումեյրայում։ Հետո հանգիստ JBR լողափում՝ Դուբայի երկնագծի տեսարանով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Դուբայ Մոլ և մեկնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Վերջին առավոտը գնումների համար Դուբայ Մոլում։ Ճաշից հետո տեղափոխում օդանավակայան։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Ժամանում Սանտորինի', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Թռիչք դեպի Սանտորինի և տեղափոխում կալդերայի եզրին գտնվող հյուրանոց։ Առաջին երեկոն՝ երկար զբոսանք կալդերայի եզրով մինչև մայրամուտ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Օիա գյուղ և Ակրոտիրի', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Բացահայտեք Օիան լուսաբացին՝ կապույտ գմբեթներով և կալդերայի տեսարաններով, ապա այցելեք Ակրոտիրիի հնագիտական վայր։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Կատամարանով նավարկություն կալդերայում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Ամբողջօրյա կատամարանային նավարկություն հրաբխային կղզիների շուրջ՝ տաք աղբյուրներ, սնորքելինգ, Նեա Կամենի և խորոված ճաշ տախտակամածին։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Գինու համտես կալդերայի եզրին', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Այց երկու գինեգործարան և ասիրտիկո, վինսանտո ու նիկտերի գինիների համտես տեղական սոմելիեի հետ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Սև լողափ և Պերիսա', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Օրը Պերիսայում՝ սև ավազով հայտնի լողափին։ Լող, հանգիստ և ծովամթերքով տավերնաներ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Ֆիրա և Պիրգոս գյուղ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Ֆիրա մայրաքաղաքը, Նախապատմական Թերայի թանգարանը և հին նավահանգիստ տանող ճոպանուղին։ Կեսօրին՝ Պիրգոս միջնադարյան գյուղը։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Մեկնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Վերջին լուսաբացը կալդերայի վրա՝ ձեր պատշգամբից։ Տեղափոխում Սանտորինիի օդանավակայան։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'HY' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Ժամանում և երեկո Էյֆելյան աշտարակի մոտ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Տեղավորվեք Ձախ ափի հյուրանոցում։ Երեկոյան զբոսանք Սենի երկայնքով դեպի Տրոկադերո՝ լուսավորված Էյֆելյան աշտարակը տեսնելու համար։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Լուվր և Մոնմարտր', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Առավոտը Լուվրում՝ առանց հերթի տոմսերով։ Կեսօրին բարձրացում Մոնմարտր և Սակրե Քյոր՝ Փարիզի լավագույն անվճար տեսարանի համար։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Վերսալ և Սենով նավարկություն', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Այց Վերսալի պալատ՝ Հայելիների սրահ և այգիներ։ Վերադարձ Փարիզ՝ մայրամուտին Սենով մասնավոր նավարկության համար։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Մարե և Սենտ-Շապել', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Մարե թաղամաս՝ Վոժերի հրապարակ, Պիկասոյի թանգարան և բուտիկներ։ Սենտ-Շապելի ապշեցուցիչ վիտրաժները Եվրոպայի ամենագեղեցիկ ինտերիերներից են։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Սեն-Ժերմեն և մեկնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Վերջին առավոտը Սեն-Ժերմեն-դե-Պրեի սրճարաններում։ Կրուասան և սուրճ՝ Շառլ դը Գոլ օդանավակայան տեղափոխումից առաջ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Ժամանում Փուկետ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Տեղափոխում ծովափնյա հանգստավայր։ Առաջին լողը Կատա լողափի հանգիստ ջրերում, երեկոյան՝ թաիլանդական ողջույնի ընթրիք։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Փղերի ապաստարան', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Առավոտը պատասխանատու փղերի ապաստարանում՝ արևադարձային անտառում։ Կերակրում, լողացում և զբոսանք փրկված փղերի հետ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Փանգ Նգա ծովածոց', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Ամբողջօրյա նավարկություն Փանգ Նգա ծովածոցում՝ ծովային քարանձավներ, մանգրովյան ջրանցքներ, Ջեյմս Բոնդի կղզի և լուսավորող ձկնորսական գյուղ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Փի Փի կղզիներ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Արագընթաց նավակով այց Փի Փի կղզիներ՝ Մայա Բեյ, Մոնքի Բիչ և Պիլե լագունայի բյուրեղյա ջրեր։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Թաիլանդական խոհարարական դաս', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Ընտանեկան խոհարարական դաս տեղական շեֆի հետ։ Կսովորեք պատրաստել փադ թայ, կանաչ կարրի և մանգոյով կպչուն բրինձ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Ջրային զվարճանքներ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Հանգստավայրի լողափին ջրային ակտիվությունների օր՝ ջեթ-սկի, պարասեյլինգ, բանանա բոթ և փեդլբորդ։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Մեծ Բուդդա և Վատ Չալոնգ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Առավոտյան այց 45 մետրանոց Մեծ Բուդդային՝ 360 աստիճան տեսարանով, ապա Վատ Չալոնգ՝ Փուկետի ամենակարևոր բուդդայական տաճարը։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Մեկնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_8_title';

UPDATE translations
SET value = 'Վերջին առավոտյան լողը, ապա տեղափոխում Փուկետի օդանավակայան։ Թաիլանդը ձեզ կկանչի վերադառնալու։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'HY' AND field = 'itinerary_day_8_description';

UPDATE translations
SET value = 'Ժամանում Թբիլիսի', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Տեղավորվեք Հին քաղաքի բուտիկ հյուրանոցում։ Երեկոյան այց ծծմբային բաղնիքներ և ավանդական վրացական ընթրիք։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Հին Թբիլիսի և Նարիկալա', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Զբոսանք Հին Թբիլիսիի ոլորապտույտ փողոցներով՝ Սիոնի տաճար, Շարդենի, խաղաղության կամուրջ և ճոպանուղի դեպի Նարիկալա ամրոց։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Կազբեգիի լեռները', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Վրացական ռազմական ճանապարհով ուղևորություն դեպի Մեծ Կովկաս։ Վերելք Գերգեթիի եկեղեցի՝ Կազբեկ լեռան հզոր տեսարանով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Կազբեգի և վերադարձ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Առավոտյան քայլարշավ ալպյան մարգագետիններով և սառցադաշտերի տեսարաններով։ Վերադարձ Թբիլիսի՝ Անանուրի ամրոցի մոտ կանգառով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Կախեթիի գինու երկիր', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Ուղևորություն Կախեթի՝ վրացական գինեգործության սիրտ։ Այց ընտանեկան գինեգործարան, ծանոթություն քվևրի մեթոդին և ավանդական սուպրա։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Մեկնում Թբիլիսիից', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Վերջին զբոսանք Խաղաղության կամրջով և Մտկվարի գետի երկայնքով։ Տեղափոխում Թբիլիսիի միջազգային օդանավակայան։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'HY' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Ժամանում Կիոտո', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Ժամանում շինկանսենով Օսակայի օդանավակայանից։ Գիդը կդիմավորի ձեզ և կուղեկցի Գիոնով՝ հին գեյշաների թաղամասով։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Ֆուշիմի Ինարի և Նիշիկի շուկա', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Լուսաբացին այց Ֆուշիմի Ինարի սրբավայր՝ 10 000 կարմիր տորիի դարպասներով։ Կեսօրին՝ Նիշիկի ծածկած շուկա՝ Կիոտոյի խոհանոցը։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Թեյի արարողություն և Փիլիսոփայի արահետ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Մասնավոր թեյի արարողություն երրորդ սերնդի վարպետի հետ 300-ամյա մաչիայում։ Զբոսանք Փիլիսոփայի արահետով՝ Հիգաշիյամայի տաճարային շրջանում։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Արաշիյամա և բամբուկի պուրակ', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Սագանո ռոմանտիկ գնացքով դեպի Արաշիյամա։ Զբոսանք բամբուկի պուրակում, Տենրյուջի զեն այգի և լուռ լեռնային տաճար։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Նիձյո ամրոց և Կինկակուձի', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Նիձյո ամրոց՝ շոգունի նստավայր հայտնի «սոխակի հատակներով»։ Այնուհետև Ոսկե տաղավար Կինկակուձի՝ հայելային լճակում արտացոլված։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Իկեբանայի դաս և երեկո Գիոնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Առավոտյան իկեբանայի դաս՝ ճապոնական ծաղկահարդարման հնագույն արվեստի վարպետի հետ։ Երեկոն Գիոնում՝ թեյատներ շտապող մայկոներին տեսնելու համար։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Մեկնում', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Վերջին առավոտը Նիշիկի շուկայում։ Տեղափոխում Օսակայի օդանավակայան։ Ճապոնիան կփոխի ձեր հայացքը աշխարհին։', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'HY' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Ինչու են Մալդիվները աշխարհի իդեալական մեղրամսային ուղղությունը', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'why-maldives-perfect-honeymoon') AND locale = 'HY' AND field = 'title';

UPDATE translations
SET value = 'Բյուրեղյա լագունաներ, ջրի վրա վիլլաներ, լիարժեք առանձնություն և անմոռանալի մայրամուտներ․ ահա թե ինչու են Մալդիվները գլխավորում մեղրամսի բոլոր ցանկերը։', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'why-maldives-perfect-honeymoon') AND locale = 'HY' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Ամեն տարի հազարավոր զույգեր Մալդիվներն ընտրում են մեղրամսի համար, և գրեթե բոլորը ասում են, որ իրականությունը գերազանցել է սպասելիքները։ Ո՞րն է Հնդկական օվկիանոսի այս արշիպելագի գաղտնիքը, որը նրան այդքան կատարյալ է դարձնում ռոմանտիկ հանգստի համար։</p><p><strong>Առանձնությունն իրական է։</strong> Մալդիվների գաղափարը կառուցված է մասնավոր կղզու շուրջ։ Շատ հանգստավայրեր զբաղեցնում են ամբողջական կղզի․ չկան օրվա զբոսաշրջիկներ, բազմություն, և հաճախ ձեր ջրային վիլլայի պատշգամբից այլ հյուրեր էլ չեն երևում։ Օվկիանոսը դառնում է ձերը։</p><p><strong>Տեսարանը անհավանական է։</strong> Այստեղ Հնդկական օվկիանոսը ստանում է գրեթե թվային թվացող կապույտ՝ լուսավոր փիրուզագույն լագունաներից մինչև բաց ջրի խոր կապույտը։</p><p><strong>Սպասարկումը բացառիկ է։</strong> Մալդիվյան հանգստավայրերը մշտապես դասվում են աշխարհի լավագույնների շարքում։ Անձնական սպասավորը ճանաչում է ձեր նախասիրությունները և կանխատեսում ձեր կարիքները։</p><p>Մալդիվները պարզապես ուղղություն չեն․ դրանք չափանիշ են, որի հետ կհամեմատեք ձեր բոլոր հետագա արձակուրդները։</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'why-maldives-perfect-honeymoon') AND locale = 'HY' AND field = 'content';

UPDATE translations
SET value = 'Վրաստանի թաքնված կողմը․ Թբիլիսիից այն կողմ', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'hidden-side-of-georgia') AND locale = 'HY' AND field = 'title';

UPDATE translations
SET value = 'Ճանապարհորդների մեծ մասը տեսնում է միայն Թբիլիսին, բայց իրական Վրաստանը՝ հին քարանձավային քաղաքներ, լեռնային վանքեր և լեգենդար գինի, գտնվում է մայրաքաղաքից դուրս։', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'hidden-side-of-georgia') AND locale = 'HY' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Վրաստանը կամաց-կամաց դառնում է աշխարհի ամենահետաքրքիր ուղղություններից մեկը։ Թբիլիսին՝ միջնադարյան, կայսերական, խորհրդային և ժամանակակից ճարտարապետության խառնուրդով, Եվրոպայի ամենախարիզմատիկ քաղաքներից է։ Սակայն քաղաքից դուրս բացվում է շատ ավելի հին և խոր երկիր։</p><p><strong>Կազբեգի և Մեծ Կովկաս։</strong> Թբիլիսիից հյուսիս տանող Վրացական ռազմական ճանապարհը աշխարհի ամենադրամատիկ ավտոճանապարհներից է։ Գերգեթիի եկեղեցին՝ Կազբեկի ֆոնին, Կովկասի խորհրդանշական տեսարաններից է։</p><p><strong>Կախեթիի գինու շրջան։</strong> Վրաստանը համարվում է գինու հայրենիքը։ Քվևրիի մեթոդը տալիս է այն սաթագույն գինիները, որոնք գրավել են բնական գինու աշխարհը։</p><p><strong>Վարձիա քարանձավային քաղաք։</strong> XII դարում հրաբխային ժայռի մեջ փորված վանական քաղաքը Կովկասի ամենաառանձնահատուկ հուշարձաններից է։</p><p>Վրաստանը հետաքրքրասեր ճանապարհորդին վարձատրում է բացառիկ ջերմությամբ։</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'hidden-side-of-georgia') AND locale = 'HY' AND field = 'content';

UPDATE translations
SET value = 'Առաջին անգամ Ճապոնիայում․ ինչ պետք է իմանալ ճանապարհորդությունից առաջ', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'first-time-japan-guide') AND locale = 'HY' AND field = 'title';

UPDATE translations
SET value = 'Գնացքների էթիկետից մինչև տաճարների կանոններ, կանխիկի մշակույթից մինչև կոնբինի նախաճաշեր․ կարևոր ուղեցույց Ճապոնիա առաջին անգամ մեկնողների համար։', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'first-time-japan-guide') AND locale = 'HY' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Ճապոնիան այն ուղղությունն է, որը պարգևատրում է պատրաստվածությանը։ Ոչ թե որովհետև բարդ է, այլ որովհետև մի քանի մշակութային նրբությունների ըմբռնումը լավ ճանապարհորդությունը դարձնում է գերազանց։</p><p><strong>JR Pass։</strong> Եթե այցելում եք մի քանի քաղաք, Japan Rail Pass-ը հաճախ արժե գնել մինչև մեկնումը։ Այն ընդգրկում է շինկանսենների և շատ տարածաշրջանային գնացքների ցանցը։</p><p><strong>Կանխիկը դեռ կարևոր է։</strong> Թեև Ճապոնիան տեխնոլոգիապես զարգացած է, շատ փոքր ռեստորաններ, սրբավայրեր և խանութներ քարտեր չեն ընդունում։</p><p><strong>Կոնբինի։</strong> Ճապոնական 24-ժամյա խանութները՝ 7-Eleven, Lawson, FamilyMart, իրականում հրաշալի են՝ տաք սնունդ, օնիգիրի, սուրճ, դեղեր և SIM քարտեր։</p><p><strong>Տաճարային էթիկետ։</strong> Տորիի դարպասով անցնելիս թեթևակի խոնարհվեք, լվացման վայրում ողողեք ձեռքերը և տաճարի շենք մտնելիս հանեք կոշիկները։</p><p>Ճապոնիան գերազանցում է սպասելիքները և փոխում է աշխարհի հանդեպ ձեր հայացքը։</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'first-time-japan-guide') AND locale = 'HY' AND field = 'content';

UPDATE translations
SET value = 'Դուբայը երկնաքերերից այն կողմ․ քաղաք, որը զբոսաշրջիկների մեծ մասը չի տեսնում', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'dubai-beyond-the-skyscrapers') AND locale = 'HY' AND field = 'title';

UPDATE translations
SET value = 'Դուբայը հայտնի է շքեղությամբ և ռեկորդներով, բայց առևտրի կենտրոններից ու երկնաքերերից այն կողմ կա պատմությամբ և մարդկայնությամբ լի քաղաք։', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'dubai-beyond-the-skyscrapers') AND locale = 'HY' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Դուբայի միջազգային համբավը կառուցված է գերադրականների վրա՝ ամենաբարձր շենքը, ամենամեծ առևտրի կենտրոնը, ամենաշքեղ բրանչը։ Եվ թեև այս ամենը իրական է ու տպավորիչ, այն միայն մեկ շերտն է մի քաղաքի, որը արժե ավելի ուշադիր դիտել։</p><p><strong>Հին քաղաքը։</strong> Նստեք աբրա՝ ավանդական փայտե ջրային տաքսի, և անցեք Դուբայ Քրիքը ոսկու շուկայից դեպի համեմունքների շուկա։ Ջրի վրայով օդը բուրում է սանդալով, խնկով և զաֆրանով։ Սա Դուբայն է, որը գոյություն ուներ նավթի դարաշրջանից դարեր առաջ։</p><p><strong>Ալ Ֆահիդի պատմական թաղամաս։</strong> Քրիքի մոտ գտնվում է քամու աշտարակներով և նեղ ավազագույն նրբանցքներով թաղամասը։ Դուբայի թանգարանը տեղակայված է 1787 թվականի բերդում՝ քաղաքի ամենահին պահպանված շենքում։</p><p><strong>Անապատը գիշերը։</strong> Բուրջ Խալիֆայից քառասուն րոպե հեռու քաղաքը լուծվում է, և սկսվում է Արաբական անապատը։ Աստղերը ավազաթմբերի վրա հիշեցնում են, որ Դուբայի արդիականությունը կառուցված է շատ ավելի հին հիմքի վրա։</p><p>Եկեք ռեկորդների համար, մնացեք խորության համար։</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'dubai-beyond-the-skyscrapers') AND locale = 'HY' AND field = 'content';

UPDATE translations
SET value = 'Пляж и острова', updated_at = NOW()
WHERE entity_type = 'category' AND entity_id = (SELECT id FROM category WHERE slug = 'beach') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Медовый месяц', updated_at = NOW()
WHERE entity_type = 'category' AND entity_id = (SELECT id FROM category WHERE slug = 'honeymoon') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Приключенческий отдых', updated_at = NOW()
WHERE entity_type = 'category' AND entity_id = (SELECT id FROM category WHERE slug = 'adventure') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Культура', updated_at = NOW()
WHERE entity_type = 'category' AND entity_id = (SELECT id FROM category WHERE slug = 'cultural') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Городской отдых', updated_at = NOW()
WHERE entity_type = 'category' AND entity_id = (SELECT id FROM category WHERE slug = 'city-break') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Семейный отдых', updated_at = NOW()
WHERE entity_type = 'category' AND entity_id = (SELECT id FROM category WHERE slug = 'family') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Мальдивы', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'maldives') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Ожерелье из 1200 коралловых островов в Индийском океане — Мальдивы являются абсолютным островным раем планеты. Виллы над водой, рифы с морскими черепахами и закаты, поджигающие весь горизонт.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'maldives') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Бали', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'bali') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Бали — Остров Богов, и это звание заслужено. Священные индуистские храмы возвышаются над изумрудными рисовыми террасами, пляжи с белым песком встречаются с серфингом мирового класса, а тепло балийской культуры пронизывает каждый уголок острова.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'bali') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Дубай', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'dubai') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Дубай поражает воображение — футуристический небосклон из пустыни, рекордная архитектура, шопинг мирового класса и золотые дюны в одном городе. Добавьте чистые пляжи и солнце круглый год — результат неотразим.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'dubai') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Санторини', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'santorini') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Созданный одним из крупнейших вулканических извержений в истории человечества, драматичный пейзаж кальдеры Санторини, белоснежные деревушки и легендарные закаты делают его одним из самых фотографируемых и волшебных мест на Земле.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'santorini') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Париж', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'paris') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Город Света не нуждается в представлении. Париж награждает посетителей музеями мирового класса, вечной архитектурой, изысканной кухней и непревзойдённой атмосферой романтики, вдохновлявшей художников на протяжении веков.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'paris') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Пхукет', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'phuket') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Крупнейший остров Таиланда сочетает потрясающие пляжи, яркую ночную жизнь, древние буддийские храмы и тёплую гостеприимную культуру. Путешествуйте по островам на лодке или просто отдыхайте на золотом берегу — Пхукет справится с любой задачей.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'phuket') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Тбилиси', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'tbilisi') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Древняя столица Грузии — один из лучших секретов Кавказа. Тбилиси сочетает средневековые крепости, серные бани и процветающую культуру еды и вина — всё это на фоне величественных Кавказских гор.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'tbilisi') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Киото', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'kyoto') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = 'Древняя имперская столица Японии — живой музей. Семнадцать объектов Всемирного наследия ЮНЕСКО, тысячи храмов и святилищ, бамбуковые рощи и глубокая эстетическая утончённость делают Киото одним из культурно богатейших городов мира.', updated_at = NOW()
WHERE entity_type = 'destination' AND entity_id = (SELECT id FROM destination WHERE slug = 'kyoto') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Медовый месяц на Мальдивах', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Начните совместную жизнь в одном из самых захватывающих мест на Земле. Этот 6-дневный пакет для медового месяца размещает вас в частной вилле над водой со стеклянным полом, открывающим вид на бирюзовую лагуну. Каждое утро вы просыпаетесь под звуки океана, каждый вечер заканчивается ужином при свечах на песчаной отмели под звёздным небом.</p><p>Ваш личный дворецкий позаботится о каждой детали: трансфер на гидросамолёте, шампанское при заезде и особые сюрпризы на протяжении всего отдыха. Это медовый месяц вашей мечты.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Бали: полное погружение', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Бали — место поразительных контрастов, и этот 8-дневный тур создан, чтобы показать вам все из них. Начните в культурном сердце Бали — Убуде: рисовые террасы, священный Обезьяний лес и завораживающий танец Кечак на закате.</p><p>В середине тура покорите действующий вулкан Батур на рассвете — подъём на вершину, когда солнце встаёт над облаками, — это опыт, который меняет мировоззрение. Последние дни — пляжи Семиньяка, серфинг и храм Улувату над океаном. Бали во всей полноте.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Дубай: город и пустыня', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Дубай — город рекордов, и этот 5-дневный тур познакомит вас с лучшими из них. Поднимитесь на вершину Бурдж-Халифы — самого высокого здания в мире — пока город расстилается у ваших ног. Исследуйте старые золотые рынки и рынки пряностей у Дубай-Крик.</p><p>На третий день колонна внедорожников направляется в красные дюны Аравийской пустыни: катание по дюнам, езда на верблюдах и роскошный ужин в бедуинском лагере под звёздами. Контраст с городом, который вы покинули несколько часов назад, поражает и не забывается.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Мечта о Санторини', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Мало где на земле первое впечатление бывает таким мощным и немедленным, как на Санторини. Этот 7-дневный тур даёт вам время и сопровождение, чтобы увидеть остров далеко за пределами его знаменитых фотографий.</p><p>Деревня Ойя на рассвете до прихода толп, катамаранный круиз по кальдере, вулканические горячие источники, дегустация ассиртико у края кальдеры и руины Акротири — Санторини во всей глубине.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Романтический побег в Париж', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Париж оправдывает свою репутацию самого романтичного города мира каждый день, и этот 5-дневный тур создан, чтобы передать эту романтику в полной мере. Прибытие — цветы и шампанское в номере у Сены. Первый вечер — Эйфелева башня в огнях.</p><p>Лувр, Монмартр, Версаль и частный круиз по Сене на закате — Париж в самом интимном и незабываемом исполнении.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Пхукет: семейный пляжный отдых', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Таиланд — одно из самых гостеприимных направлений для семей, и этот 8-дневный отдых на Пхукете создан, чтобы порадовать каждое поколение. Ваша база — просторный пляжный курорт у спокойных вод пляжа Ката.</p><p>Поездки на острова, заповедник слонов, бухта Пханг Нга и острова Пхи-Пхи — что-то для каждого члена семьи. Таиланд покорит все сердца в семье.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Грузия и Кавказ: открытие', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Грузия — одно из старейших и самых недооценённых направлений в мире, и этот 6-дневный тур раскрывает её удивительную глубину. Начните в Тбилиси: мощёные улочки Старого города, серные бани Абанотубани и потрясающая сцена вина и еды.</p><p>Горы Большого Кавказа, монастырь Гергети, Казбеги и винный регион Кахети с традиционными квеври — Грузия тёплая и настоящая.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Киото: культурное погружение', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'name';

UPDATE translations
SET value = '<p>Киото — это Япония в чистом виде. Этот 7-дневный тур создан не только для того, чтобы показать вам выдающиеся достопримечательности Киото, но и чтобы дать вам настоящий доступ к традициям и историям, стоящим за ними.</p><p>Святилище Фусими Инари на рассвете, частная чайная церемония с мастером в трёхсотлетнем доме, бамбуковая роща Арасияма, Золотой павильон и вечерняя прогулка по Гиону — Киото открывается слой за слоем.</p>', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'description';

UPDATE translations
SET value = 'Прибытие и перелёт на гидросамолёте', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Приземлитесь в международном аэропорту Мале и сядьте на гидросамолёт для самого живописного 30-минутного перелёта в вашей жизни. В вилле вас ждут шампанское, цветы и Индийский океан до горизонта.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Снорклинг на рифе и спа', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Исследуйте частный домашний риф острова в собственном темпе — морские черепахи, рифовые акулы и манты являются постоянными гостями. Вечером: 90-минутный спа-ритуал для пары с традиционными мальдивскими ботаническими маслами.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Пикник на отмели и круиз на закате', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Частная дхони доставит вас на уединённую отмель посреди лагуны для пикника с шампанским. На закате — волшебный круиз через атолл в золотых лучах.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Наблюдение за дельфинами и снорклинг', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Утренняя экскурсия для наблюдения за дельфинами-спиннерами в открытом океане — Мальдивы обладают наибольшей концентрацией дельфинов в мире. Снорклинг над глубокой коралловой стеной.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Частный ужин на пляже', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'День полностью в вашем распоряжении. С наступлением ночи дворецкий сервирует стол со свечами прямо на пляже — звёзды отражаются в зеркально спокойном океане.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Отъезд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Последнее утреннее купание перед тем, как гидросамолёт доставит вас обратно в Мале. Вы уезжаете с воспоминаниями на всю жизнь.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape') AND locale = 'RU' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Прибытие в Убуд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Переезд в Убуд — культурное сердце Бали. Вечерний приветственный ужин с традиционным танцем Легонг.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Тегаллаланг и Священный лес обезьян', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Утро среди рисовых террас Тегаллаланга — одного из самых фотографируемых пейзажей Азии. Днём: прогулка по Священному обезьяньему лесу Сангех и водяной храм Тирта Эмпул.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Восход на вулкане Батур', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Подъём в 2 ночи для восхождения на действующий вулкан Бали. Вершина 1717 м на рассвете — солнце встаёт над облаками над озером Батур и горой Агунг. Момент абсолютной, невыразимой красоты.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Рафтинг по реке Аюнг', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Река Аюнг прорезает глубокое ущелье джунглей мимо водопадов и нависающих тропических деревьев. Опытные гиды делают рафтинг захватывающим, но безопасным.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Кулинарный мастер-класс по-балийски', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Утро в семейном доме — учитесь готовить пять традиционных балийских блюд: лавар, сате лилит, наси чампур. День свободен для спа или рынка искусств Убуда.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Переезд на юг и Танах Лот', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Переезд на юг Бали. Посещение морского храма Танах Лот на скале в океане в золотой час — одна из самых драматично красивых храмовых декораций в мире.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Улувату и танец Кечак', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Храм Улувату на скале высотой 70 м над океаном, пляж Паданг-Паданг и легендарный танец Кечак у огня на закате.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Семиньяк и отъезд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_8_title';

UPDATE translations
SET value = 'Последнее утро на пляже Семиньяк. Бранч в кафе у океана перед трансфером в аэропорт. Бали позовёт вас обратно.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'bali-complete-experience') AND locale = 'RU' AND field = 'itinerary_day_8_description';

UPDATE translations
SET value = 'Прибытие и Dubai Marina', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Заселение и прогулка по освещённой набережной Дубай Марины — лес небоскрёбов, отражённых в воде. Ужин в ресторане у марины.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Бурдж-Халифа и Старый Дубай', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Утро на вершине Бурдж-Халифы (смотровая площадка 148-го этажа): город, пустыня и Персидский залив до горизонта. Днём — прогулка на лодке по Дубай-Крик к золотым и пряным рынкам.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Сафари в пустыне', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Колонна внедорожников в красные дюны Аравийской пустыни. Дрифт по дюнам, езда на верблюдах. На закате — бедуинский лагерь: арабская кухня, кальян, живая музыка и звёздное небо.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Атлантис, Палм и пляж JBR', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Утро в Aquaventure Waterpark на Пальм Джумейра. Частный пляж с видом на небоскрёбы Дубая. Вечером — пляж JBR и закат.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Dubai Mall и отъезд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Последнее утро для шопинга в Dubai Mall — крупнейшем торговом центре мира. Фонтанное шоу в полдень перед трансфером в аэропорт.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'dubai-city-desert') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Прибытие на Санторини', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Перелёт на Санторини и трансфер в отель на краю кальдеры. Вечерняя прогулка по тропе от Фиры до Ойи — последний свет дня гаснет над Эгейским морем.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Деревня Ойя и руины Акротири', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Ойя на рассвете — синие купола, ветряные мельницы и ступени кальдеры — до прихода дневных туристов. Затем — экскурсия по минойскому городу Акротири, погребённому под пеплом в 1613 г. до н.э.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Катамаранный круиз по кальдере', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Целый день на катамаране вокруг вулканических островов: купание в термальных источниках, снорклинг, посещение Неа Камени и барбекю-ланч на палубе посреди кальдеры на закате.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Дегустация вин на кальдере', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Санторини производит одни из лучших вин Греции. Посещение двух винодельческих поместий и дегустация ассиртико, винсанто и никтери с местным сомелье у края кальдеры.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Чёрный пляж и Периса', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'День на Перисе — знаменитом пляже с чёрным песком. Купание, отдых и таверны с жареным осьминогом и свежими морепродуктами.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Фира и деревня Пиргос', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Столица Фира: музей доисторической Феры и канатная дорога к старому порту. Днём — средневековая деревня Пиргос на вершине горы, вдали от туристических троп.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Отъезд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Последний рассвет над кальдерой с вашей террасы. Трансфер в аэропорт Санторини. Остров остаётся с вами надолго после отъезда.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'santorini-dream') AND locale = 'RU' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Прибытие и вечер у Эйфелевой башни', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Заселение в отель на Левом берегу. Вечерняя прогулка вдоль Сены к Трокадеро — Эйфелева башня в огнях 20 000 лампочек в 22:00.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Лувр и Монмартр', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Утро в Лувре (билеты без очереди включены): Ника Самофракийская, Венера Милосская, Мона Лиза в относительной тишине. Днём — подъём на Монмартр к Сакре-Кёр — лучший бесплатный вид Парижа.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Версаль и круиз по Сене', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Поездка в Версальский дворец: Зеркальный зал и сады. Возвращение в Париж для частного круиза по Сене на закате — мосты и памятники в золотом свете.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Марэ и Сент-Шапель', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Квартал Марэ: Пляс-де-Вож, Музей Пикассо и бутики. Сент-Шапель с её потрясающими средневековыми витражами XIII века — один из красивейших интерьеров Европы.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Сен-Жермен и отъезд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Последнее утро в кафе Сен-Жермен-де-Пре. Круассан и кофе в легендарной брассери перед трансфером в аэропорт Шарль-де-Голль. À bientôt, Париж.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'paris-romantic-escape') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Прибытие на Пхукет', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Трансфер на пляжный курорт. Первое купание в Андаманском море на пляже Ката — спокойные воды, безопасные для всех возрастов. Вечером — тайский приветственный ужин.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Заповедник слонов', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Утро в ответственном заповеднике слонов в тропическом лесу. Кормление, купание и прогулки со спасёнными слонами — опыт, который дети помнят всю жизнь.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Бухта Пханг Нга', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Полный день на лодке в бухте Пханг Нга: морские пещеры, мангровые каналы, остров Джеймса Бонда и плавучая рыбацкая деревня. Каякинг через низкие пещеры.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Острова Пхи-Пхи и снорклинг', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Скоростная лодка к островам Пхи-Пхи: бухта Майя, пляж Обезьян и кристально чистые воды лагуны Пилех. Снорклинг над коралловыми рифами Shark Point.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Тайский кулинарный мастер-класс', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Семейный кулинарный мастер-класс с местным шеф-поваром: пад тай, зелёное карри и манго с липким рисом. Вечером — Старый город Пхукета с уличной едой.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'День водных видов спорта', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Джет-скинг, парасейлинг, банановая лодка, сёрфинг и вейкборд на пляже курорта. Вечером — бассейн.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Большой Будда и Ват Чалонг', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Гигантская статуя Большого Будды (45 м) на вершине холма с панорамным видом 360°. Ват Чалонг — главный буддийский храм Пхукета. Последний закат на пляже.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Отъезд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_8_title';

UPDATE translations
SET value = 'Последнее купание. Трансфер в аэропорт Пхукета. Таиланд — страна улыбок — будет скучать по всей семье.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'phuket-family-beach') AND locale = 'RU' AND field = 'itinerary_day_8_description';

UPDATE translations
SET value = 'Прибытие в Тбилиси', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Приезд в древнюю столицу Грузии. Вечерняя прогулка по Абанотубанскому серно-банному кварталу и ужин в винном подвале под старым городом.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Старый город Тбилиси и крепость Нарикала', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Пешеходная экскурсия по узким улочкам Старого Тбилиси: собор Сиони, дома с балконами на Шарденй, персидская крепость Нарикала над городом и замечательный этнографический музей под открытым небом.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Горы Казбеги', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Переезд по Военно-Грузинской дороге через Большой Кавказ. Поход к средневековой церкви Гергети (2170 м) с горой Казбек на фоне — один из самых драматичных видов на всём Кавказе.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Казбеги и возвращение', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Утренний поход по альпийским лугам с видами на ледники. Возвращение в Тбилиси с остановкой у крепостного комплекса Ананури, отражённого в бирюзовом водохранилище Жинвали.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Винный регион Кахети', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Поездка в Кахети — сердце грузинского виноделия. Посещение семейной винодельни, знакомство с методом квеври и дегустация знаменитых янтарных вин. Традиционная супра с семьёй.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Отъезд из Тбилиси', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Последняя прогулка по мосту Мира и вдоль реки Мтквари. Трансфер в международный аэропорт Тбилиси. Тепло, красота и щедрый стол Грузии позовут вас обратно.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery') AND locale = 'RU' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Прибытие в Киото', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_1_title';

UPDATE translations
SET value = 'Приезд на синкансэне из аэропорта Осаки. Гид встречает вас и проводит по Гиону — старому гейшскому кварталу — в свете вечерних фонарей над деревянными домами мачия.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_1_description';

UPDATE translations
SET value = 'Фусими Инари и рынок Нисики', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_2_title';

UPDATE translations
SET value = 'Рассветное посещение святилища Фусими Инари — сеть из 10 000 красных ворот тории через лесистую гору, пока свет ещё золотой и толпы отсутствуют. Днём — крытый рынок Нисики, «кухня Киото».', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_2_description';

UPDATE translations
SET value = 'Чайная церемония и Тропа Философа', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_3_title';

UPDATE translations
SET value = 'Частная чайная церемония с мастером третьего поколения в 300-летнем доме мачия. Прогулка по Тропе Философа через храмовый квартал Хигасияма — вдоль канала, обсаженного сакурой.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_3_description';

UPDATE translations
SET value = 'Арасияма и бамбуковая роща', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_4_title';

UPDATE translations
SET value = 'Романтический поезд Сагано через ущелье реки Хозу до Арасиямы. Прогулка через бамбуковую рощу, сад дзен Тэнрюдзи (ЮНЕСКО) и тихий горный храм Дзякко-дзи.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_4_description';

UPDATE translations
SET value = 'Замок Нидзё и Кинкакудзи', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_5_title';

UPDATE translations
SET value = 'Замок Нидзё — резиденция сёгуна со знаменитыми «соловьиными» полами, скрипящими при ходьбе. Золотой павильон Кинкакудзи, отражённый в зеркальном пруду.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_5_description';

UPDATE translations
SET value = 'Мастер-класс икэбана и вечер в Гионе', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_6_title';

UPDATE translations
SET value = 'Утренний мастер-класс по икэбана — древнему японскому искусству аранжировки цветов — с мастером. Вечер в Гионе в поисках майко на пути к чайным домам.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_6_description';

UPDATE translations
SET value = 'Отъезд', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_7_title';

UPDATE translations
SET value = 'Последнее утро на рынке Нисики. Трансфер в аэропорт Осаки. Япония меняет то, как вы смотрите на мир.', updated_at = NOW()
WHERE entity_type = 'tour' AND entity_id = (SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion') AND locale = 'RU' AND field = 'itinerary_day_7_description';

UPDATE translations
SET value = 'Почему Мальдивы — идеальное место для медового месяца в мире', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'why-maldives-perfect-honeymoon') AND locale = 'RU' AND field = 'title';

UPDATE translations
SET value = 'Хрустальные лагуны, виллы над водой, полная приватность и закаты ни с чем не сравнимые — вот почему Мальдивы возглавляют каждый список медового месяца.', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'why-maldives-perfect-honeymoon') AND locale = 'RU' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Каждый год тысячи пар выбирают Мальдивы для медового месяца — и каждый год почти все они говорят, что реальность превзошла все ожидания. В чём секрет этого архипелага в Индийском океане, который делает его столь последовательно, подавляюще идеальным для романтики?</p><p><strong>Приватность настоящая.</strong> В отличие от большинства курортных направлений, концепция Мальдив построена на частном острове. Многие курорты занимают свой собственный остров целиком — никаких однодневных туристов, толп, и часто других гостей не видно с террасы вашей виллы над водой. Океан становится вашим.</p><p><strong>Пейзаж нереальный.</strong> Индийский океан здесь приобретает голубизну, которая кажется цифровой — светящийся, почти прозрачный бирюзовый в мелких лагунах, переходящий в чернильно-синий в открытой воде. Плавать в своём частном бассейне над ним на закате — всё равно что висеть внутри картины.</p><p><strong>Сервис исключительный.</strong> Мальдивские курорты неизменно входят в число лучших в мире по гостеприимству. Ваш личный дворецкий узнаёт ваши предпочтения при заезде и предугадывает каждую потребность — шампанское уже охлаждено, когда вы возвращаетесь со снорклинга.</p><p>Если вы планируете медовый месяц, Мальдивы — это не просто направление. Это эталон — воспоминание, с которым будет сравниваться каждый последующий отпуск. Наша команда специалистов готова сделать ваш совершенным.</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'why-maldives-perfect-honeymoon') AND locale = 'RU' AND field = 'content';

UPDATE translations
SET value = 'Скрытая сторона Грузии: за пределами Тбилиси', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'hidden-side-of-georgia') AND locale = 'RU' AND field = 'title';

UPDATE translations
SET value = 'Большинство путешественников видят только Тбилиси. Но настоящая Грузия — древние пещерные города, горные монастыри и легендарное вино — лежит в долинах и горных вершинах за столицей.', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'hidden-side-of-georgia') AND locale = 'RU' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Грузия тихо строит репутацию одного из самых удивительных направлений в мире. Тбилиси — со своим особым сочетанием средневековой, имперской русской, советской и современной архитектуры — один из самых харизматичных городов Европы. Но выйдите за пределы города, и вы откроете страну глубокой древней глубины.</p><p><strong>Казбеги и Большой Кавказ.</strong> Дорога на север от Тбилиси по Военно-Грузинской дороге — один из самых драматичных автомобильных маршрутов в мире. Церковь Гергети, стоящая на хребте высотой 2170 м с горой Казбек позади — один из определяющих образов всего Кавказа.</p><p><strong>Винный регион Кахети.</strong> Грузия считается родиной вина — люди производят виноград здесь не менее 8000 лет. Метод квеври — ферментация в глиняных кувшинах, закопанных в землю — даёт те самые янтарные вина, покорившие мир натурального вина.</p><p><strong>Пещерный город Вардзия.</strong> Высеченный в вулканической скале в XII веке, монастырский пещерный город Вардзия содержит более 3000 комнат, 13 этажей и церковь с оригинальными фресками. Один из самых выдающихся памятников Кавказа.</p><p>Грузия вознаграждает любопытного путешественника с исключительной щедростью. Приезжайте любопытным, уезжайте изменившимся.</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'hidden-side-of-georgia') AND locale = 'RU' AND field = 'content';

UPDATE translations
SET value = 'Первый раз в Японии: всё, что нужно знать перед поездкой', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'first-time-japan-guide') AND locale = 'RU' AND field = 'title';

UPDATE translations
SET value = 'От этикета в поездах до правил в храмах, от культуры наличных до завтраков в конбини — главное руководство для первых путешественников в Японию.', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'first-time-japan-guide') AND locale = 'RU' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Япония — направление, которое вознаграждает подготовку. Не потому что она сложная — Япония на самом деле одна из самых лёгких и логистически гладких стран в мире — но потому что понимание нескольких культурных нюансов превращает хорошую поездку в отличную.</p><p><strong>JR Pass.</strong> Если вы посещаете несколько городов, Japan Rail Pass почти наверняка стоит купить до отъезда из дома (в Японии его купить нельзя). Он покрывает сеть скоростных поездов синкансэн и большинство региональных поездов.</p><p><strong>Наличные — всё ещё главные.</strong> Несмотря на то что Япония — одна из самых технологически развитых стран мира, она остаётся удивительно ориентированной на наличные. Многие рестораны, святилища и небольшие магазины не принимают карты. Банкоматы 7-Eleven надёжно принимают иностранные карты.</p><p><strong>Конбини.</strong> Японские круглосуточные магазины — 7-Eleven, Lawson, FamilyMart — подлинно выдающиеся заведения: горячая еда, свежие онигири, кофе, пиво, лекарства, SIM-карты. Ваш завтрак из конбини будет лучше большинства гостиничных шведских столов.</p><p><strong>Этикет в храмах.</strong> Слегка поклонитесь, проходя через ворота тории. У раковин для омовения ополосните обе руки. Снимайте обувь перед входом в здания храма. Говорите тихо и воздерживайтесь от фотографии в священных помещениях.</p><p>Япония — страна, которая превзойдёт все ожидания. Глубина мастерства, культура еды, сочетание древней красоты и гиперсовременной энергии — ничто не подготавливает вас к реальности по-настоящему. Езжайте, и вернитесь изменившимися.</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'first-time-japan-guide') AND locale = 'RU' AND field = 'content';

UPDATE translations
SET value = 'Дубай за пределами небоскрёбов: город, которого большинство туристов не видит', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'dubai-beyond-the-skyscrapers') AND locale = 'RU' AND field = 'title';

UPDATE translations
SET value = 'Дубай славится излишествами и зрелищностью — но за рекордами и торговыми центрами скрывается город удивительной глубины, истории и человечности.', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'dubai-beyond-the-skyscrapers') AND locale = 'RU' AND field = 'excerpt';

UPDATE translations
SET value = '<p>Международная репутация Дубая построена на суперлативах: самое высокое здание, самый большой торговый центр, самый горячий бранч. И хотя всё это реально и по-настоящему впечатляет, город, который они описывают — лишь один слой места, вознаграждающего более пристальное внимание.</p><p><strong>Старый город.</strong> Сядьте на абру — традиционное деревянное водное такси — и переправьтесь через Дубай-Крик от рынка золота к рынку пряностей. Воздух над водой пахнет сандалом, ладаном и шафраном. Торговые ряды завалены куркумой, сумахом и сушёными лепестками роз. Это Дубай, существовавший столетиями до нефтяной эпохи — и он по-прежнему живёт.</p><p><strong>Исторический квартал Аль-Фахиди.</strong> В 15 минутах ходьбы от крика — квартал ветряно-башенной архитектуры и узких песчаных переулков. Музей Дубая занимает форт 1787 года — самое старое сохранившееся здание города. Центр культурного взаимопонимания шейха Мохаммеда проводит завтраки «Открытые двери, открытые умы», где вы едите эмиратскую еду и получаете искренние ответы на любые вопросы об исламской культуре.</p><p><strong>Пустыня ночью.</strong> В сорока минутах от Бурдж-Халифы город растворяется и начинается Аравийская пустыня. Ночью, вдали от светового загрязнения, звёзды над дюнами поразительны. Провести вечер в бедуинском лагере, глядя на Млечный Путь — напоминание о том, что современность Дубая построена на чём-то гораздо более древнем и странном, чем стекло и сталь.</p><p>Приезжайте за рекордами, оставайтесь ради глубины. Дубай страннее и интереснее, чем его Instagram-профиль.</p>', updated_at = NOW()
WHERE entity_type = 'blog' AND entity_id = (SELECT id FROM blog WHERE slug = 'dubai-beyond-the-skyscrapers') AND locale = 'RU' AND field = 'content';

COMMIT;
