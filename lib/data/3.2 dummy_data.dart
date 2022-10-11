// ignore_for_file: constant_identifier_names, unnecessary_const

import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';

const DUMMY_CATEGORIES = const [
  Category(
      id: 'c1',
      title: 'Portuguesa',
      color: Colors.purple,
      pais: 'Angola', // so para exemplificar

      url:
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/260959438_428255445592628_3346165096753363096_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeHt-ZzxuvgIxILhJVXKpv2DA7KkUkNhUeQDsqRSQ2FR5FUyH1cO1-Ypo_F__9vl_V8-UVs4TGobbcewBDLtj6zG&_nc_ohc=yUgifJtv4EUAX8-5D1V&tn=5UKCpToG3IdVctR_&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b78aabe977c4a29b2580f1ee45229c18&oe=61CDB63C'),
  Category(
    id: 'c2',
    title: 'Francesa',
    color: Colors.red,
    pais: 'Angola',
    url: '',
  ),
  Category(
      id: 'c3',
      title: 'Angolano',
      color: Colors.lightGreen,
      url: '',
      pais: 'Angola'),
  Category(
      id: 'c4',
      title: 'Russia',
      color: Colors.lightGreen,
      url: '',
      pais: 'Russia'),
];

const DUMMY_MEALS = const [
  Meal(
    id: 'm1',
    categories: ['c1'],
    title: 'Sapateira-Recheada',
    imageUrl:
        'https://www.receitas-portuguesas.com/wp-content/uploads/2017/09/Sapateira-Recheada.jpg',
    duration: 20,
    ingredients: [
      '1 sapateira'
          '1 folha de louro'
          '1/2 limão'
          '200 gr de maionese caseira bem temperada'
          '1 ovo cozido'
          '4 rodelas de pepino em pickles'
          '1 colher de chá de mostarda'
          'Vinho verde q.b.'
          'Sal q.b.'
          'Pimenta em grão q.b.'
    ],
    stps: [
      'Coloque numa panela água em grande quantidade, o limão, o louro, '
          'sal grosso e uns grãos de pimenta.',
      'Deixe ferver e, junte a sapateira.',
      'Deixe cozer cerca de 20 ou 25 minutos conforme o tamanho.',
      'Depois de cozida retire a sapateira e deixe arrefecer.',
      'Abra a carapaça e retire um saquinho de areia preto que está junto à boca, de seguida, retire para uma tigela tudo o que houver comestível dentro da carapaça, acrescente a maionese, o ovo picado e os pepinos estes também picados, a mostarda e um pouco de vinho verde. '
          'Misture tudo muito bem até obter uma massa homogénea.',
      'Recheie a carapaça da sapateira com este preparado e sirva bem fresco com as patas e as pinças.',
    ],
    isAngola: false,
    isFranca: false,
    isPortugal: true,
  ),
  Meal(
    id: 'm2',
    categories: ['c1'],
    title: 'Caipirão',
    imageUrl:
        'https://www.receitas-portuguesas.com/wp-content/uploads/2017/09/Caipir%C3%A3o-489x381.png',
    duration: 10,
    ingredients: ['1/2 lima', '5 cl Licor Beirão', 'Gelo picado'],
    stps: [
      'Cortar a lima em rodelas finas e macerar no fundo de um copo.',
      'Colocar gelo picado ao gosto e encher com Licor Beirão.'
    ],
    isAngola: false,
    isFranca: false,
    isPortugal: true,
  ),
  Meal(
    id: 'm3',
    categories: ['c1'],
    title: 'Black Russian',
    imageUrl:
        'https://www.receitas-portuguesas.com/wp-content/uploads/2017/09/Black-Russian.jpg',
    duration: 45,
    ingredients: [
      '   4 cl de Vodka Wyborowa',
      '2 cl de Tijuana Neto Costa',
    ],
    stps: [
      'Usar o copo de misturas.',
      'Deitar bastante gelo dentro do copo, em seguida o Vodka Wyborowa e o Tijuana Neto Costa.',
      'Mexer muito bem.'
    ],
    isAngola: false,
    isFranca: false,
    isPortugal: true,
  ),
  Meal(
    id: 'm4',
    categories: ['c3'],
    title: 'CALULU À MODA DE ANGOLA',
    imageUrl:
        'https://img.itdg.com.br/tdg/images/recipes/000/021/562/175145/175145_original.jpg?mode=crop&width=710&height=400',
    duration: 60,
    ingredients: [
      '   4 postas grossas de peixe corvina (ou outro tipo de peixe fresco e grosso)',
      '4 postas de peixe corvina seco (pode ser outro tipo de peixe)',
      '300 g de quiabo',
      '2 beringelas',
      '1 cebola média picada',
      '3 dentes de alho',
      '1 folha de louro',
      '2 pacotes de espinafres',
      '1/2 dl de oléo de palma',
      '1 tomate médio'
    ],
    stps: [
      ' Escame as 4 postas do peixe fresco e também do peixe seco.',
      'Esmague os 3 dentes de alho e tempere todo o peixe.',
      'Não precisa deixar repousar.',
      'Retire as pontas dos quiabos. Descasque as beringelas e corte-as aos quadrados e coloque ambos num recipiente com água.',
      'Retire a pele da cebola e rale-a.',
      'Faça o mesmo com o tomate.',
      'Lave os espinafres com bastante água e reserve-os tal como fez com os outros ingredientes até a preparação do peixe.',
      'Num tacho largo comece por colocar uma parte da cebola ralada, uma parte do tomate picado, as postas de peixes (fresco e seco), os espinafres, a folha de louro, a beringela aos quadrados, o restante da cebola, o tomate e por cima o óleo de palma.',
      'Leve ao fogo médio para que todos os ingredientes cozinhem lentamente.',
      'Não adicione água pois os ingredientes utilizados já contém muita água.',
      'Após 30 minutos adicione os quiabos.',
      'Deixe cozinhar por volta de 40 minutos sempre tendo atenção para que o peixe não se desmanche.',
      'Deve engrossar o molho do calulu com farinha de milho ou farinha de mandioca.',
      'Desfaça em água uma colher de sopa de farinha (das indicadas), e misture ao cozido.',
      'Deixe no fogo por mais 2 minutinhos.'
          'Retire do tacho. ',
    ],
    isAngola: true,
    isFranca: false,
    isPortugal: false,
  ),
  Meal(
    id: 'm5',
    categories: ['c3'],
    title: 'Salada fria de arroz e atum',
    imageUrl:
        'https://pt.petitchef.com/imgupl/recipe/salada-fria-de-arroz-e-atum--md-273056p444354.jpg',
    duration: 15,
    ingredients: [
      ' 5 cogumelos pequenos portobello',
      '1 lata de atum',
      '3 colheres de sopa de maionese',
      '1 colher de chá de salsa picada',
      '1 colher de chá de coentros picados',
      '1 colher de café de alho em pó',
      '1 colher se sopa de sumo de limão',
      '2 dentes de alho picadinhos',
      '1 fio de azeite',
      '2 copos arroz cozido (em média)'
    ],
    stps: [
      'Alourar o alho no azeite. Acrescentar os cogumelos e deixar cozinhar um pouco em lume brando.',
      '  Adicionar o arroz e deixar fritar um pouco. Acrescentar o atum desfeito com um garfo.',
      'Entretanto, numa taça deitar a maionese, o alho em pó, o sumo de limão, a salsa e os coentros e mexer muito bem até ficar bem homogéneo.',
      'Deitar o arroz com os cogumelos e o atum numa taça e deixar arrefecer por 5 minutos.',
      'Verter a maionese e envolver muito bem. Servir frio.'
    ],
    isAngola: true,
    isFranca: false,
    isPortugal: false,
  ),
  Meal(
    id: 'm6',
    categories: ['c2' ],
    title: 'Tapenade de azeitonas pretas',
    imageUrl:
        'https://t1.rg.ltmcdn.com/pt/images/9/5/2/tapenade_de_azeitonas_pretas_2259_600.jpg',
    duration: 240,
    ingredients: [
      '1 xícara de azeitonas pretas',
      '½ xícara de salsinha fresca',
      '1 colher de sopa de alcaparras (lavadas e drenadas)',
      '1 limão siciliano (apenas as raspas da casca)',
      '  1 filé de anchova',
      '  1 colher de sopa de azeite extra virgem'
    ],
    stps: [
      'Fazer tapenade caseiro é muito simples! Comece picando as azeitonas com a ajuda de uma faca. Não precisa picar muito finamente, pode deixar a azeitona bem rústica mesmo.',
      "Junte os restantes ingredientes: a salsinha, a anchova, as alcaparras e as zestes do limão (casca ralada).",
      "Com uma faca vá picando e misturando todos os ingredientes, até tudo ficar bem misturado e integrado.",
      "Seguidamente coloque a mistura num recipiente e misture o azeite. O tapenade de azeitona original não precisa cozinhar, é só temperar e está pronto a servir!",
      "Sirva o tapenade de azeitonas pretas num potinho e já pode se deliciar! Se você quiser pode colocar num pote fechado e guardar como conserva de azeitona durante cerca de uma semana. Sirva com torradinhas ou como recheio de pão e tenho a certeza que você vai gostar. Bom apetite!"
    ],
    isAngola: false,
    isFranca: true,
    isPortugal: false,
  ),
  Meal(
    id: 'm7',
    categories: ['c2'],
    title: 'Pain au chocolat ',
    imageUrl:
        "https://t2.rg.ltmcdn.com/pt/images/1/5/6/pain_au_chocolat_9651_600.jpg",
    duration: 20,
    ingredients: [
      " 1 pacote de massa folhada retangular",
      '1 frasco de creme de chocolate para barrar (tipo Nutella)',
      '  4 colheres de sopa de geleia a seu gosto ou 1 ovo batido',
      "confeitos de chocolate (opcional)"
    ],
    stps: [
      "Para fazer o pão folhado de chocolate abra a massa folhada num tabuleiro de forno e corte em 6 partes iguais, como na fotografia. Se quiser pãezinhos menores, corte cada uma dessas partes em duas metades.",
      'Espalhe um pouco de creme de chocolate no centro de cada retângulo de massa, sem chegar nas beiradas. Dobre a massa por cima do creme, primeiro uma lateral e depois a outra',
      'Vire cada porção de massa folhada recheada de forma a que a junção da massa fique para baixo. Espalhe um pouco de geleia ou de ovo batido em cada um desses pedaços de massa folhada, para que fiquem douradinhos depois de assar.',
      'Leve os pedaços de massa folhada para assar no forno a 180ºC, com calor em cima e em baixo, por 15-20 minutos ou até dourarem.',
      'Quando o pão de massa folhada dourar como na foto, retire do forno e deixe esfriar um pouco.',
      'e quiser, pincele o pain chocolate com um pouco mais de geleia e polvilhe confeitos de chocolate (não pincele com ovo depois de assar). Pode servir e com certeza você vai gostar! '
    ],
    isAngola: false,
    isFranca: true,
    isPortugal: false,
  ),
//   Meal(
//     id: 'm8',
//     categories: ['c8'],
//     title: 'Creamy Indian Chicken Curry',
//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/175099671_105620541668253_4041065592839658610_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeH1kzru0anzeX339Ez1ic06HxXhTzwngssfFeFPPCeCyzu3A0Lv7F-QXI01_rM6fVKt5mZLM1TSXe2qAiTF1UTK&_nc_ohc=9REzQ65TzJIAX9D_o2q&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=743e28b4cf5e046822c025bea4d85d18&oe=6185FAE6',
//     duration: 35,
//     ingredients: [
//       '4 Chicken Breasts',
//       '1 Onion',
//       '2 Cloves of Garlic',
//       '1 Piece of Ginger',
//       '4 Tablespoons Almonds',
//       '1 Teaspoon Cayenne Pepper',
//       '500ml Coconut Milk',
//     ],
//     stps: [
//       'Slice and fry the chicken breast',
//       'Process onion, garlic and ginger into paste and sauté everything',
//       'Add spices and stir fry',
//       'Add chicken breast + 250ml of water and cook everything for 10 minutes',
//       'Add coconut milk',
//       'Serve with rice'
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm9',
//     categories: ['c9'],
//     title: 'Chocolate Souffle',
//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/109821718_107142237747387_3242320645659686871_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeGvL5fnfkvMET8ivDbiwFHSvGiuLh_y7s-8aK4uH_Luz3zlw0i01pI94MokBnB1Puy_niXi8vI4BCyYgMe8TKRk&_nc_ohc=9IHFglyuDbsAX_wyCI3&tn=Glz-Pbn7KK-5XKJG&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=0924959864960b8acd8f086f2a783eff&oe=6188985D',
//     duration: 45,
//     ingredients: [
//       '1 Teaspoon melted Butter',
//       '2 Tablespoons white Sugar',
//       '2 Ounces 70% dark Chocolate, broken into pieces',
//     ],
//     stps: [
//       'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm10',
//     categories: ['c2', 'c5', 'c10'],
//     title: 'Alface e Cebola',
//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t31.18172-8/fr/cp0/e15/q65/10257342_728981390551946_913611085726664487_o.jpg?_nc_cat=106&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFE8MTf780b0OmDWkjHq_zo1KToRCZ7IhHUpOhEJnsiEepzhDeFtSuLm9yURUW03vDnCuLFa_PstYDzDewtPK0n&_nc_ohc=C4vsKt4ssXsAX_mc9TE&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=f43be350858301425c3faaabb417deb3&oe=618947B3',
//     duration: 30,
//     ingredients: [
//       'Alface e Cebola',
//       'Tomate e Cebola',
//       'Cenoura e Cebola',
//     ],
//     stps: [
//       'Mista (alface, tomate, cenoura, cebola)',
//       'Di Castro (alface, tomate, milho, cenoura, azeitonas, fiambre, queijo, atum, ananás, cebola)',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm11',
//     categories: ['c11', 'c13', 'c10'],
//     title: 'Comida da Nossa Terra',
//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/168837763_106850374843711_5328737874312067863_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFtRhm_4opy909aYXbrcC4AHHqx-dXTLy4cerH51dMvLupaWffM1N407OZYlz62AOOpTzmuCtmtOnbrlTixKxe5&_nc_ohc=KlOjiniQTzUAX9Ks7q7&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=add58130428885336ac9fed19ccf0dd2&oe=618855BF',
//     duration: 250,
//     ingredients: [
//       '1 Slice White Bread',
//       '1 Slice Ham',
//       '1 Slice Pineapple',
//       '1-2 Slices of Cheese',
//       'Butter'
//     ],
//     stps: ['Bake the toast for round about 10 minutes in the oven at 200°C'],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm12',
//     categories: ['c12'],
//     title: 'Toast Hawaii',

//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.18169-9/fr/cp0/e15/q65/20479734_121374218500718_1152704017765001817_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeGcbTDVfYTfZqXz_YBS2JoQJ-P2nTH2WR4n4_adMfZZHhwzrhwhCcPFHa6JOdGpQfqlnwtzDAhA6m-3CYZNP0cb&_nc_ohc=WewV75In7p4AX_pz4PC&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=7a380d18ff8a9eeea079c36ff6fdc9fe&oe=6187CF32', //'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
//     duration: 10,

//     ingredients: [
//       '1 Slice White Bread',
//       '1 Slice Ham',
//       '1 Slice Pineapple',
//       '1-2 Slices of Cheese',
//       'Butter'
//     ],
//     stps: [
//       'Butter one side of the white bread',
//       'Layer ham, the pineapple and cheese on the white bread',
//       'Bake the toast for round about 10 minutes in the oven at 200°C'
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm13', //fotos da 50
//     categories: ['c13', 'c14', 'c12'],
//     title: 'Arroz',

//     imageUrl:
//         'https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/245920514_126492859747356_2847878158216317382_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeHbOKQN6_clffBwlUM-lbKHdEdg3JGD_vt0R2DckYP--xGCtn7ZV3xEBADSXA74BEJZpDH4I5rzXJORgIXFONFF&_nc_ohc=OifiyU_rPokAX_76FND&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=0711f0c9284eac15422ee6aa34a4dc14&oe=61935859',
//     duration: 10,

//     ingredients: [
//       '2 colheres (sopa) de manteiga',
//       '1 xícara (chá) de arroz lavado e escorrido',
//       '200g de peito de peru picado',
//       '50g de azeitonas pretas sem caroço',
//       '1 lata de milho verde',
//       '1 tablete de Caldo MaggI ®  de Carne',
//       '3 colheres (sopa) de queijo parmesão ralado',
//     ],
//     stps: [
//       'Coloque a manteiga, o arroz, o peito de peru, as azeitonas e o '
//           'milho em um recipiente refratário retangular médio (20 x 30cm).',
//       'Ferva três xícaras (chá) de água e dissolva o Caldo Maggi. ',
//       'Regue o conteúdo do refratário e misture. Cubra com papel de '
//           'alumínio e leve ao forno médio-alto (200°C), preaquecido, por '
//           'cerca de 25 minutos.',
//       'Quando o arroz estiver seco, retire-o do '
//           'forno, mexa e sirva a seguir, polvilhado com o queijo ralado.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm14', //novos
//     categories: ['c14', 'c15' 'c16' 'c17'],
//     title: 'Salada Natural',

//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/249988490_604207087432852_9187134465468695770_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeGVlb_A1LqGiiBDHlBoUbAw0yFvmlhoWBfTIW-aWGhYF94G3I8cOxIyuRMHe8iEvH9kOQjBjMLV57lvzznX0USu&_nc_ohc=0udrGUxyXk0AX-nz1me&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=dc0b3e8ac04c5aa3c9100a0600195e21&oe=619E2FD2',
//     duration: 10,

//     ingredients: [
//       '6 discos individuais de pizza',
//       '3 colheres (sopa) de azeite',
//       '200g de camarões médios limpos',
//       '100g de lula em anéis',
//       '1 stick de Meu Segredo MaGGi ®',
//       'meio maço de alface crespa',
//       'meio maço de alface romana',
//       '1 beterraba ralada',
//       'meio vidro de palmito em conserva, em cubos',
//       '2 pepinos japoneses em cubos',
//       'meia colher (sopa) de Fondor MaGGi ®',
//       'meia colher (sopa) de sementes de linhaça',
//     ],
//     stps: [
//       'Em um recipiente refratário pequeno e fundo '
//           '(14cm de diâmetro), disponha cada disco'
//           'de pizza.',
//       'Coloque uma porção de grãos de feijão crus sobre as massas e leve ao forno'
//           'médio (180°C), preaquecido, por cerca de 15 minutos ou até a massa ficar seca e firme.',
//       'Retire do forno, espere esfriar e desenforme.',
//       'Reserve Em uma frigideira grande, aqueça uma colher (sopa) de azeite.',
//       'Junte os camarões e as lulas e polvilhe o Meu Segredo MaGGi.',
//       'Deixe dourar levemente e reserve.',
//       'Distribua as folhas de alface rasgadas, a beterraba, o palmito e o pepino dentro das massas assadas.',
//       'Regue com o restante do azeite misturado com o Fondor MaGGi.',
//       'Coloque por cima os frutos do mar, polvilhe as sementes de linhaça e sirva.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
  //  Meal(
//     id: 'm15', //50 receitas
//     categories: ['c14', 'c15'],
//     title: 'Torta Rabanada',

//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/249466850_1514639795566241_3114770466291956330_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeH0KsV4hfgP7ltqIDbVv2JP-uO4gCVvJoT647iAJW8mhC57nmi76O1EYp81fSMWhsArGixIe07XWyf9hB1xYmBe&_nc_ohc=ehwMIvAIVJoAX9HSzaT&tn=vS1qQ_um6m4IJ5z4&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=5175ae18b02bfde34f4dd19a55a5f898&oe=61A20D15',
//     duration: 10,

//     ingredients: [
//       '1/2 xícara (chá) de açúcar',
//       '1 colher (sopa) de canela em pó',
//       '2 pães(Nozes picadas opcional)',
//       '2 ovos',
//       '1 colher (sobremesa) de essência de baunilha',
//       '400 ml de leite',
//       '1/2 lata ou caixinha de leite condesado',
//       '1 colher (sopa) cheia de amido de milho (maizena)',
//     ],
//     stps: [
//       'Misture 1/2 xícara (chá) de açúcar com 1 colher (sopa) de canela em pó',
//       'Une um refratário com manteiga ou margarina sem sal e polvilhe a mistura de açúcar com canela.',
//       'Você não usará tudo, guarde o que sobrou para polvilhar por cima. ',
//       'Pique 2 pães e 1/2 e espalhe sobre o refratário. ',
//       'Sobre eles eu coloquei um pouco de nozes picadas ',
//       'Bata no liquidificador ou mixer os ovos, a essência de baunilha, o leite, o leite condensado e a  maizena e espalhe essa mistura sobre os pães.',
//       'Salpique o que sobrou do açúcar com canela e leve ao forno por 35min (esse tempo pode variar para +ou - dependendo do forno).',
//       'Experimente servir com sorvete de creme, e boa apetite!!!.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm16', //50 receitas
//     categories: ['c14', 'c16'],
//     title: 'Sobre Mesa de Morango',

//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/250214767_301877818454862_2177087130030669365_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeF3VRPQxx63N0kPFKVvYgy6lMBWzwIkqc2UwFbPAiSpza1GUF7LRD3MsQ0buSMFDjVz6I5cm9sLvBsLj8CJaFHu&_nc_ohc=gpWm7wOwFOQAX-OArBc&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=331fa242b5c371046984b6d7cbd361bc&oe=61A110AF',
//     duration: 10,

//     ingredients: [
//       '1 lata de leite condensado',
//       '750 ml de leite',
//       '4 colheres (de sopa) de maisena',
//       '1 colher (de chá) de baunilha',
//       '4 colher (de sopa) de chocolate em pó',
//       'INGREDIENTES PARA A COBERTURA',
//       '2 claras',
//       '6 colheres (de sopa) de açúcar',
//       '1 lata de creme de leite sem soro',
//       '2 caixinhas de morangos picados',
//     ],
//     stps: [
//       'Para o creme misture todos os ingredientes e leve ao fogo,mexendo sempre. Deixe ferver e engrossar. Desligue e reserve.',
//       'Para a cobertura bata as claras em neve e vá acrescentando o açúcar aos poucos.',
//       'Depois acrescente o creme de leite sem soro.',
//       'Para montar coloque o creme em uma travessa única ou individual, depois acrescente os morangos picados e por fim a cobertura.',
//       'Decore com alguns morangos e leve para gelar',
//       'Boa Apetite!!!',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm17', //50 receitas
//     categories: ['c14', 'c17'],
//     title: 'Feijão Bem Temperado',

//     imageUrl:
//         'https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/245927045_4660619224029965_5513879734175745430_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeGivLuNf3m8MRhahG6XTttUhJ2qlXni2YiEnaqVeeLZiBYmh4XB70UDuoC-7BAUeba0Gg2IPY3e8-GQ4ktHE2i7&_nc_ohc=Ob89Pf-DarkAX8wYyuJ&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=578b831e3543da3e48dc4a56beee220c&oe=61934475',
//     duration: 10,

//     ingredients: [
//       'meio quilo de feijão cru (aproximadamente 1 xícara'
//           'e meia de chá)',
//       '3 tabletes de Caldo MaggI ®  de Bacon',
//     ],
//     stps: [
//       'Escolha os grãos, eliminando pedrinhas, grãos quebrados e palhas.'
//           'Lave-os em água corrente e deixe-os de molho por cerca de 3 horas.'
//           'Escorra e cozinhe em panela de pressão, coberto com água (aproximadamente 2 litros) por cerca de'
//           '30 minutos, após a fervura.',
//       'Assim que estiver cozido, retire uma concha do feijão, amasse com'
//           'as costas da concha ou um garfo e acrescente ao feijão restante.',
//       'Junte o Caldo Maggi e deixe cozinhar, mexendo de vez em quando'
//           'até que o caldo do feijão engrosse. Sirva',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm18', //50 receitas
//     categories: ['c14', 'c18'],
//     title: 'Bolo de Líquidificador com coco',

//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/249624918_605837547437664_4330502499769932548_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeE-SUuWDT_P-lHDL4Do7owt2m2QVPkatYjabZBU-Rq1iC0xcntVyACms1wdcF4DkMJAWbK93oJasQOMZmNVTLch&_nc_ohc=9sw5vRVnpSsAX__dUJ4&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=0bb42fb1cf3844e931493039bbe0b7c4&oe=619FCD31',
//     duration: 10,

//     ingredients: [
//       '6 ovos grandes',
//       '8colheres de sopa cheias de açúcar',
//       '4 colheres de sopa de achocolatado em pó',
//       '4 colheres de sopa de chocoloate em pó (ou cacau).',
//       '100 gramas de manteiga amolecida',
//       '1/2 colher de mainteiga químico em pó'
//     ],
//     stps: [
//       'Coloque os ovos, clara e gema, no liquidificador e bata bem por 5 minutos.',
//       'Junte o açúcar no liquidificador e bata por mais 30 segundos, junte o achocolatado e o chocolate e bata ppor mais 30 segundos.',
//       'junte o coco e a manteiga e bata até misturar',
//       'junte o fermento bata até misturar. Unte uma forma com manteiga e polvilhe com chocolate em pó.',
//       'Coloque a massa na formma e leve ao forno médio pré-aquecido por 30 minutos ou até que um palito inserido no centro do bolo saia limpo.',
//       'Deixe esfriar, desenforme e cubra e/ou recheie com ganache ou brigadeiro.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm19', //50 receitas
//     categories: ['c14', 'c19'],
//     title: 'Bolo de cenoura com brigadeiro',

//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/249494238_1067915133964340_7884623638285969203_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeHf29mzjWlcVhpBYebVMjUcvOFEjNS2c--84USM1LZz7y3TK4TW-KyjQP3CplenBWx1pG-NcR_B-SEnMdDnxu_j&_nc_ohc=GOn1qoUpvwsAX8GPqGs&tn=vS1qQ_um6m4IJ5z4&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=39bd661f080b6e48970d8aa7157f4921&oe=619FC65A',
//     duration: 10,

//     ingredients: [
//       '1 cenoura grande sem casca picada',
//       '4 ovos',
//       '150 ml de óleo',
//       '2 xícaras* de farinha de trigo',
//       '2 xícaras* de açúcar',
//       '1 colher (sopa) de fermento em pó.',
//       '*Xícara usada: 200ml',
//       'INGREDIENTES PARA COBERTURA',
//       '1 lata de leite condensado',
//       '1 colher (sopa) de manteiga sem sal',
//       '2 colheres (sopa) de chocolate em pó'
//     ],
//     stps: [
//       'Bata no liquidificador a cenoura, os ovos e o éleo. Em outro recipiente, junte esta '
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm20', //50 receitas
//     categories: ['c14', 'c20'],
//     title: 'Frango com Laranja ',

//     imageUrl:
//         'https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/245901048_181901657428577_5374466419010714901_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeGe-WJabIvtI7Cy-GOxxRq8o5ELZbR_mqqjkQtltH-aquLm6oCEEVQMmtkjufSdEmPtm0q-jgVyZBE7-iGDKDPL&_nc_ohc=qSdxn-qP5fcAX-9zDUV&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=29fb56b79b65c3e79ecd1cf30734d5fe&oe=6173B1D9',
//     duration: 10,

//     ingredients: [
//       '1 tablete de Caldo MaggI ®  de galinha',
//       '1 colher (sopa) de manteiga, derretida',
//       'Meio quilo de peito de frango',
//       'Meia xícara (chá) de suco de laranja',
//       '1 colher (sopa) de salsa picada',
//     ],
//     stps: [
//       ' Misture bem com um garfo o Caldo Maggi com a manteiga, até obter uma pasta.',
//       'Besunte o frango com esta pasta. asse em forno médio-alto (200ºC), preaquecido, por cerca de 40 minutos (ou até dourar ligeiramente). Regue com'
//           'o suco de laranja e leve novamente ao Alimento dos mais versáteis, o frango permite uma série de receitas que, uma vez aprendidas,  permitem'
//           'a você variar e criar à vontade na cozinha. forno até dourar bem (por cerca de 20 minutos).',
//       'Retire do forno, passe o frango para uma travessa e conserve em local aquecido. Leve a assadeira ao fogo forte e deixe o restante do'
//           'molho ferver bem, raspando com uma colher o fundo da assadeira ao comprar frango fresco ou refrigerado, observe a carne: deve ser firme e elástica.'
//           'Sendo frango inteiro, aperte o osso do peito: se estiver flexível, a ave é jovem, tenra.',
//       'Já o frango congelado deve estar em um só bloco, bem embalado. aves com cerca de 1 quilo são mais tenras; as de maior peso têm carne mais rija.'
//           'Corte o frango cru pelas juntas; isso dá 8 pedaços. Mais as laterais do peito, são 10 partes, usadas em ensopados e molhos.',
//       'Para fazer frango frito, “sauté” ou à caçadora, divida cada pedaço em dois.',
//       'Para retirar os filés, abra o peito e a peça que vai da coxa à sobrecoxa.',
//       'Para strogonoffs, fricassês, molhos, recheios e picadinhos, prefira o peito ou o filé de coxa.',
//       'Faça tiras a partir do peito inteiro ou filés, corte em 3 e pique as partes em tiras, em sentido perpendicular às fibras.'
//           'Como comprar e cortar o frango até que o molho encorpe.',
//       'Salpique a salsa picada sobre o frango e sirva com o molho, à parte.',
//     ],
//     isAngola: true,
//     isFranca: false,
//     isPortugal: false,
//   ),
//   Meal(
//     id: 'm21', //50 receitas
//     categories: ['c14', 'c21'],
//     title: 'FRANGO ENSOPADO',

//     imageUrl:
//         'https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/245165617_182108507413983_6964865232275759473_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeG0jlHwgX0Fey0Xj5lzEJWzZVxfJ8vN3zdlXF8ny83fN7msBc0-2tjnVaFLgpGHSE5zvQ-xy4qhk7py9pdmxWBv&_nc_ohc=8CrpRUQ59zsAX-CiUMe&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=0428f7e29a72e4082e3866464445dd4f&oe=61948F49',

//     duration: 10,

//     ingredients: [
//       'Meio quilo de frango em pedaços (coxa ou sobrecoxa) suco de meio limão',
//       '1 colher (sopa) de azeite',
//       '1 cenoura cortada em rodelas finas',
//       '1 tablete de Caldo MaggI ®  de galinha',
//       '1 colher (sopa) de farinha de trigo',
//       'Meia xícara (chá) de vagem picada',
//       '1 cebola pequena, em rodelas',
//       'Meio alho-poró cortado em rodelas finas',
//       '1 colher (sopa) de salsa picada',
//     ],
//     stps: [
//       ' Retire a pele, lave os pedaços de frango e regue com o suco de limão.',
//       'No azeite quente, junte a cenoura, os tabletes de Caldo Maggi e meia xícara (chá) de água e mexa bem para dissolvêlos.'
//           'Polvilhe a farinha de trigo, aos poucos, e acrescente uma xícara (chá) de água, sempre mexendo até dissolver a farinha.',
//       'Tampe a panela e cozinhe até que o frango esteja macio.',
//       'Adicione a vagem, a cebola, o alho-poró e deixe cozinhar por cerca de 10 minutos.',
//       'Quando os legumes estiverem macios, retire do fogo, misture a salsa e sirva a seguir.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: true,
//   ),
//   Meal(
//     id: 'm22', //50 receitas
//     categories: ['c14', 'c22'],
//     title: 'BIFE DE MARINHEIRO',

//     imageUrl:
//         'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/198851732_2920266641547438_8150940508233879725_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeESKJGx8AUSNtl1X-9eDORdlRSwmeVsRz2VFLCZ5WxHPVhsS7uy9cZlBP8lh7G9aEJ7OrimjnsVtPCw5wtELZOt&_nc_ohc=VkKkfzEoA0AAX_J3Q4z&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=ab4ec3b2940f96bce52e866541a582f0&oe=618CA64B',
//     duration: 10,

//     ingredients: [
//       '2 colheres (sopa) de azeite',
//       '4 bifes de coxão mole, pequenos',
//       '2 tomates em rodelas',
//       '1 cebola em rodelas',
//       '2 batatas grandes, em rodelas'
//           '1 tablete de Caldo MaggI ®  de Carne',
//       'Meio copo de vinho branco seco,',
//     ],
//     stps: [
//       ' Coloque uma colher (sopa) de azeite em uma panela de fundo largo.'
//           'Distribua uma camada de bifes, uma de tomate,uma de cebola e uma de batata.',
//       'Dissolva o Caldo Maggi em meia xícara (chá) de água fervente.',
//       'Acrescente o vinho e misture bem.',
//       'Espalhe metade deste líquido sobre as camadas da panela.',
//       'Regue com um pouco do azeite restante.',
//       'Repita mais uma vez as camadas, junte o resto do líquido e torne a regar com o azeite.'
//           'Tampe a panela e leve ao fogo baixo por aproximadamente 40 minutos. Sirva.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: true,
//   ),
//   Meal(
//     id: 'm23', //50 receitas
//     categories: ['c14', 'c23'],
//     title: 'BIFE GRELHADO ',

//     imageUrl:
//         'https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/245924983_181907824094627_2817566202512359628_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeHHfgW7q28ybYc3U6Gs5RxBT3O_JZt2IZ9Pc78lm3Yhn5zRkDGt46IdeIjOPNVFLc1crLfK7a4iiOdgHSOFF65n&_nc_ohc=WaEkxC8UQbsAX-kmqKF&_nc_oc=AQm4CTpfgUfxVAWGNPOX3enrZqxF97tQax0XZ2Nz_U_8vUVgTF2Hxgcv4cCMYcMScjM&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=a6b74e8cf3c2a4872764a0321b5c3012&oe=6173AA94',

//     duration: 10,

//     ingredients: [
//       '4 bifes de contra-filé',
//       'Azeite para pincelar',
//       '3 dentes de alho picados',
//       'Meia colher (sopa) de gril MaggI ®',
//     ],
//     stps: [
//       ' Preaqueça uma grelha ou frigideira em fogo alto.',
//       'Pincele os bifes com azeite, tempere-os com o alho e o gril Maggi. ',
//       'Toste os filés de um lado, e quando estiver dourado, vire-os para grelhar do outro lado.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: true,
//   ),
//   Meal(
//     id: 'm24', //50 receitas
//     categories: ['c14', 'c24'],
//     title: 'CREME DE MORANGO E SUSPIROS ',

//     imageUrl:
//         'https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/245951263_402534574917978_1665395563113527393_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFPGmUKHnHbVR-TVbwRFWejhbeaEmlBnCWFt5oSaUGcJVv8uwMgKXZNOL593ykGvPASJ8QvoulJK4G7R4cYzs2S&_nc_ohc=e1B6R82iXloAX_0rvdc&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=15eb90e526a08fe5b25a873b608d7586&oe=61739259',
//     duration: 10,

//     ingredients: [
//       'Meio quilo de morangos',
//       '4 colheres (sopa) de açúcar',
//       '1 colher (sopa) de conhaque',
//       'Meia lata de Creme de Leite NESTLé ® ',
//       '2 xícaras (chá) de suspiros,',
//     ],
//     stps: [
//       ' Lave, limpe e esmague ligeiramente os morangos com garfo (reservando alguns para decorar).',
//       'Junte  o açúcar, o conhaque e o Creme de Leite e misture bem.',
//       'Quebre alguns suspiros e misture-os ao creme de morangos.',
//       'Coloque em taças individuais ou em um recipiente refratário e decore com os morangos reservados intercalados de suspiro.',
//       'Sirva gelado.',
//     ],
//     isAngola: false,
//     isFranca: false,
//     isPortugal: true,
//   ),
];
