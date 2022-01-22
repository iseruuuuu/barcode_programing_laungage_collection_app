class LanguageList {
  late String code;
  late String image;
  late String languageName;

  LanguageList({
    required this.code,
    required this.image,
    required this.languageName,
  });

  Map toJson() {
    return {
      'code': code,
      'image': image,
      'languageName': languageName,
    };
  }

  LanguageList.fromJson(Map json) {
    code = json['code'];
    image = json['image'];
    languageName = json['languageName'];
  }
}
