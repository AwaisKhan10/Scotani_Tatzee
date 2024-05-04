class WebUtils {
  List<ComboData> inspirationalCategories = [
    ComboData(
      categoryId: '650db98185ec407c946dcff0',
      categoryName: 'Anime',
      imagePath: 'assets/Images/anime.png',
    ),
    ComboData(
      categoryId: '65c670dee35dd1ced874bdb3',
      categoryName: 'Bottoms',
      imagePath: 'assets/Images/bottoms.png',
    ),
    ComboData(
      categoryId: '650db9de85ec407c946dd023',
      categoryName: 'Punk',
      imagePath: 'assets/Images/punk.png',
    ),
    ComboData(
      categoryId: '65c68501e35dd1ced874be52',
      categoryName: 'Sportswear',
      imagePath: 'assets/Images/sports-wear.png',
    ),
  ];

  List<ComboData> discoverCategories = [
    ComboData(
      categoryId: '650db98185ec407c946dcff0',
      categoryName: 'Anime',
      imagePath: 'assets/Images/anime.png',
    ),
    ComboData(
      categoryId: '656a9848d4567a7ea52bef68',
      categoryName: 'Androgynous',
      imagePath: 'assets/Images/androgynous.jpeg',
    ),
    ComboData(
      categoryId: '656a9da1d4567a7ea52befc6',
      categoryName: 'Athleisure',
      imagePath: 'assets/Images/athleisure.png',
    ),
    ComboData(
      categoryId: '650db9de85ec407c946dd023',
      categoryName: 'Punk',
      imagePath: 'assets/Images/punk.png',
    ),
    ComboData(
      categoryId: '656a99c6d4567a7ea52bef7a',
      categoryName: 'Tops Ans Shirts',
      imagePath: 'assets/Images/tops-and-shirts.png',
    ),
    ComboData(
      categoryId: '656a9e32d4567a7ea52befcf',
      categoryName: 'Biker',
      imagePath: 'assets/Images/biker.png',
    ),
    ComboData(
      categoryId: '650db9c585ec407c946dd01e',
      categoryName: 'Hipster',
      imagePath: 'assets/Images/hipster.png',
    ),
  ];

  List<ComboData> tattoos = [
    ComboData(
      categoryId: '656a9b93d4567a7ea52bef97',
      categoryName: 'Vintage',
      imagePath: 'assets/Images/vintage.jpeg',
    ),
    ComboData(
      categoryId: '656a9d11d4567a7ea52befbd',
      categoryName: 'Gothic',
      imagePath: 'assets/Images/gothic.png',
    ),
    ComboData(
      categoryId: '650dba1285ec407c946dd028',
      categoryName: 'High End',
      imagePath: 'assets/Images/high-end.png',
    ),
  ];

  List<ComboData> shirts = [
    ComboData(
      categoryId: '656a9c36d4567a7ea52befa9',
      categoryName: 'Streetwear',
      imagePath: 'assets/Images/Streetwear.png',
    ),
    ComboData(
      categoryId: '656a9aa6d4567a7ea52bef8e',
      categoryName: 'Women',
      imagePath: 'assets/Images/Women.png',
    ),
    ComboData(
      categoryId: '650db99f85ec407c946dd019',
      categoryName: 'Global Fusion',
      imagePath: 'assets/Images/Global-Fusion.png',
    ),
    ComboData(
      categoryId: '656a9941d4567a7ea52bef71',
      categoryName: 'Boho',
      imagePath: 'assets/Images/Boho.jpeg',
    ),
    ComboData(
      categoryId: '656a9da1d4567a7ea52befc6',
      categoryName: 'Athleisure',
      imagePath: 'assets/Images/athleisure.png',
    ),
  ];
}

class ComboData {
  String categoryId;
  String categoryName;
  String imagePath;
  ComboData(
      {required this.categoryId,
      required this.categoryName,
      required this.imagePath});
}
