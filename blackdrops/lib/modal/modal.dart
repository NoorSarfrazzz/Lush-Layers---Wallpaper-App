import 'dart:ui';

class Images {
  final int ImagesID;
  final String ImagesAlt;
  final String ImagesPortraitPath;

  const Images({
    required this.ImagesID,
    required this.ImagesAlt,
    required this.ImagesPortraitPath,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    ImagesID: json["id"] as int,
    ImagesAlt: json["alt"] as String,
    ImagesPortraitPath: json["src"]["portrait"] as String,
  );

  Images.emptyConstructor({
    this.ImagesID = 0,
    this.ImagesAlt = '',
    this.ImagesPortraitPath = '',
  });
}
