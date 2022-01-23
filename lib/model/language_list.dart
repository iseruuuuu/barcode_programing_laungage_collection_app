class LanguageList {
  late String code;
  late String image;
  late String languageName;
  late String explain;

  LanguageList({
    required this.code,
    required this.image,
    required this.languageName,
    required this.explain,
  });

  Map toJson() {
    return {
      'code': code,
      'image': image,
      'languageName': languageName,
      'explain': explain,
    };
  }

  LanguageList.fromJson(Map json) {
    code = json['code'];
    image = json['image'];
    languageName = json['languageName'];
    explain = json['explain'];
  }
}
