import 'package:flutter/material.dart';

class PageViewController {
  PageViewController() {
    init();
  }

  late final PageController _pageControllerOne;
  late final PageController _pageControllerTwo;
  PageController get pageControllerOne => _pageControllerOne;
  PageController get pageControllerTwo => _pageControllerTwo;

  List<Map<String, String>> get dogs => _pages;

  void init() {
    _pageControllerOne = PageController(
      initialPage: 0,
    );
    _pageControllerTwo = PageController(
      initialPage: 0,
      
    );
  }

  void nextPage() {
    if (_pageControllerOne.page! + 1 >= dogs.length ||
        _pageControllerTwo.page! + 1 >= dogs.length) {
      _pageControllerOne.animateToPage(
        0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
      _pageControllerTwo.animateToPage(
        0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
      return;
    }
    _pageControllerOne.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    _pageControllerTwo.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}

const _pages = [
  {
    'image':
        'https://static.nationalgeographicbrasil.com/files/styles/image_3200/public/01-domesticated-dog.jpg?w=710&h=474',
    'name': 'Zeus',
    'race': 'Raça indefinida',
    'age': '5 anos',
    'shelter': 'Abrigo São Paulo'
  },
  {
    'image':
        'https://uploads.metropoles.com/wp-content/uploads/2022/07/04104339/saiba_quais_sao_as_10_racas_de_cachorro_mais_amadas_no_brasil_widexl-600x400.jpg',
    'name': 'Odin',
    'race': 'Gloden',
    'age': '7 anos',
    'shelter': 'Abrigo Rio de Janeiro'
  },
  {
    'image':
        'http://s2.glbimg.com/wB2k5I1ty4iVdwzurRl40rcoSqo=/e.glbimg.com/og/ed/f/original/2017/07/20/beach-1790049_960_720.jpg',
    'name': 'Poseidon',
    'race': 'Pastor Alemão',
    'age': '2 anos',
    'shelter': 'Abrigo Belo Horizonte'
  },
  {
    'image':
        'https://rotasdeviagem.com.br/wp-content/uploads/2022/03/cachorros-asiaticos-.jpg',
    'name': 'Hades',
    'race': 'Husky',
    'age': '10 anos',
    'shelter': 'Abrigo Curitiba'
  },
  {
    'image':
        'https://img.freepik.com/fotos-gratis/lindo-retrato-de-cachorro_23-2149218451.jpg?w=2000',
    'name': 'Thor',
    'race': 'Raça indefinida',
    'age': '6 anos',
    'shelter': 'Abrigo São José do Rio Preto'
  },
  {
    'image':
        'https://blog.probel.com.br/wp-content/uploads/2022/03/xsono-do-cachorro-3-1.jpg.pagespeed.ic.8WbcGWyaCU.jpg',
    'name': 'Eva',
    'race': 'Labrador',
    'age': '5 anos',
    'shelter': 'Abrigo São Paulo'
  },
  {
    'image':
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2021/06/26608_BDC7DFD52D235B4B.jpg?w=876&h=484&crop=1',
    'name': 'Midas',
    'race': 'Salsicha',
    'age': '10 meses',
    'shelter': 'Abrigo Pernambuco'
  },
  {
    'image':
        'https://uploads.metropoles.com/wp-content/uploads/2022/05/02141436/conheca_as_racas_de_cachorros_mais_inteligentes_widexl-600x400.jpg',
    'name': 'Urso',
    'race': 'Corgie',
    'age': '13 anos',
    'shelter': 'Abrigo Recife'
  },
  {
    'image':
        'https://s.yimg.com/ny/api/res/1.2/6e35V0V8bSSamYSsracrlQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQyNw--/https://s.yimg.com/os/creatr-uploaded-images/2022-09/39cb0e00-3e83-11ed-bbbd-6e412b22a37f',
    'name': 'Zeus',
    'race': 'Raça indefinida',
    'age': '5 anos',
    'shelter': 'Abrigo São Paulo'
  },
  {
    'image':
        'https://i2.wp.com/petanjo.com/blog/wp-content/uploads/2021/03/ra%C3%A7as-de-cachorro-para-apartamento-4-1.jpg?resize=584%2C390&ssl=1',
    'name': 'Pancake',
    'race': 'Lima',
    'age': '2 meses',
    'shelter': 'Abrigo Déizz'
  },
];
