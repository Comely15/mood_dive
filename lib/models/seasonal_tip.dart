class SeasonalTip {
  final String season; // 계절 (spring, summer, fall, winter)
  final String displayName; // 표시명 (봄, 여름, 가을, 겨울)
  final List<String> colors; // 추천 색상
  final List<String> items; // 추천 아이템
  final String keyPoint; // 핵심 포인트
  final String imageUrl; // 대표 이미지

  SeasonalTip({
    required this.season,
    required this.displayName,
    required this.colors,
    required this.items,
    required this.keyPoint,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'season': season,
      'displayName': displayName,
      'colors': colors,
      'items': items,
      'keyPoint': keyPoint,
      'imageUrl': imageUrl,
    };
  }

  factory SeasonalTip.fromJson(Map<String, dynamic> json) {
    return SeasonalTip(
      season: json['season'],
      displayName: json['displayName'],
      colors: List<String>.from(json['colors']),
      items: List<String>.from(json['items']),
      keyPoint: json['keyPoint'],
      imageUrl: json['imageUrl'],
    );
  }
}
