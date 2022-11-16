import 'dart:math';

class SoulMateResultController {
  dogShort() {
    final int index = Random().nextInt(8);
    return _pages[index];
  }
}

const _pages = [
  {
    'image':
        'https://static.nationalgeographicbrasil.com/files/styles/image_3200/public/01-domesticated-dog.jpg?w=710&h=474',
    'name': 'Zeus',
    'race': 'Raça indefinida',
    'age': '5 anos',
    'description':
        'O porte de cachorro poderoso e a carinha fofa vão te conquistar à primeira vista, mas será no dia a dia que vai ganhar de vez o seu coração. Por mais que esse cachorro precise de uma dose extra de paciência para o adestramento, é um ótimo companheiro – protetor, leal e muito brincalhão. Certamente será um grande amigo para o seu tutor e sua família!'
  },
  {
    'image':
        'https://uploads.metropoles.com/wp-content/uploads/2022/07/04104339/saiba_quais_sao_as_10_racas_de_cachorro_mais_amadas_no_brasil_widexl-600x400.jpg',
    'name': 'Odin',
    'race': 'Glolden',
    'age': '7 anos',
    'description':
        'O jeito dócil e gentil dessa raça segue uma direção completamente oposta de sua história. A raça foi idealizada inicialmente para encarar grandes animais como touros, trabalhando para açougueiros. Pouco depois, ao perceberem sua desenvoltura e tônus muscular, os criadores prepararam os cachorros dessa raça para lutar em ringues. Infelizmente, era uma prática comum entre os séculos XVIII e XIX para entreter multidões.'
  },
  {
    'image':
        'http://s2.glbimg.com/wB2k5I1ty4iVdwzurRl40rcoSqo=/e.glbimg.com/og/ed/f/original/2017/07/20/beach-1790049_960_720.jpg',
    'name': 'Poseidon',
    'race': 'Pastor Marroquino',
    'age': '2 anos',
    'description':
        'Quando o bicho entra em sua casa, saiba que toda a sua vida ganhará um novo brilho. A alegria contagiante e o seu jeito brincalhão são capazes de iluminar toda a atmosfera ao redor. Mesmo quando você tem um dia ruim, lá está o peludo entregando toda a sua gentileza, carinho e energia.'
  },
  {
    'image':
        'https://rotasdeviagem.com.br/wp-content/uploads/2022/03/cachorros-asiaticos-.jpg',
    'name': 'Hades',
    'race': 'Husky ',
    'age': '10 anos',
    'description':
        'É um cachorro de pastoreio muito resistente e ativo, mas também leal e companheiro. Criado para suportar as condições extremas do terreno australiano, ele é quase como um cão raposa, e pode se comportar como uma às vezes – ele pode querer caçar pequenos animais ou enterrar ossos e outras coisas no seu quintal!'
  },
  {
    'image':
        'https://img.freepik.com/fotos-gratis/lindo-retrato-de-cachorro_23-2149218451.jpg?w=2000',
    'name': 'Thor',
    'race': 'Raça indefinida',
    'age': '6 anos',
    'description':
        'Muito dóceis e trapalhões, esses monstrinhos são a alegria da família, a quem protegem com unhas e dentes. Muito apegados aos donos, são grandes companheiros e ótimos com crianças. Inclusive, não é raro as fêmeas da raça adotarem os “filhotes” de seus tutores como se fossem seus'
  },
  {
    'image':
        'https://blog.probel.com.br/wp-content/uploads/2022/03/xsono-do-cachorro-3-1.jpg.pagespeed.ic.8WbcGWyaCU.jpg',
    'name': 'Eva',
    'race': 'Labrador',
    'age': '5 anos',
    'description':
        'Uma prova de que tamanho não é documento, mesmo com toda a sua altura, caber em nossos corações. Sim, estamos diante de um cachorro único: a raça é especial em vários sentidos e vai amar, proteger e divertir seu tutor e sua família. E, quando você menos esperar, também vai amá-lo na mesma proporção. Uma paixão tocada a duas mãos e quatro patas pelo resto da vida!'
  },
  {
    'image':
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2021/06/26608_BDC7DFD52D235B4B.jpg?w=876&h=484&crop=1',
    'name': 'Midas',
    'race': 'Salsicha',
    'age': '10 meses',
    'description':
        'Os cachorros dessa raça adoram brincar e se dão bem com qualquer um, inclusive com estranhos, crianças e outros animais. Por isso, são companheiros muito leais para famílias, especialmente quando seu tutor gosta de esportes. Ama agradar e também se destaca por sua inteligência e obediência.'
  },
  {
    'image':
        'https://uploads.metropoles.com/wp-content/uploads/2022/05/02141436/conheca_as_racas_de_cachorros_mais_inteligentes_widexl-600x400.jpg',
    'name': 'Urso',
    'race': 'Corgie',
    'age': '13 anos',
    'description':
        'É um cãozinho independente e afetuoso, que é chamado por muitos de “cão-mudo”, pois não costuma latir nem fazer barulhos muito altos. Esses cães representam uma das raças mais primitivas e uma das poucas que foram originadas na África Central, tendo como país de origem locais como a República Democrática do Congo.'
  },
  {
    'image':
        'https://i2.wp.com/petanjo.com/blog/wp-content/uploads/2021/03/ra%C3%A7as-de-cachorro-para-apartamento-4-1.jpg?resize=584%2C390&ssl=1',
    'name': 'Pancake',
    'race': 'Lima',
    'age': '2 meses',
    'description':
        'São pequenos no tamanho (é a menor raça do mundo!), mas são grandes no quesito animação. São capazes de surpreender com a sua energia e vontade de brincar, o que os torna cachorros ideais para a família. Inteligentes e muito devotos ao seu tutor, esses cachorros são capazes conquistar qualquer um com a sua personalidade única, segura e atrevida – sem falar em sua admirável inteligência.'
  },
];
