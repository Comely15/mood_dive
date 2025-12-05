class BrandRecommend {
  final String name; // 브랜드명
  final String priceRange; // 가격대 (예: "5만원대", "10-20만원")
  final String strength; // 브랜드 강점
  final List<String> recommendItems; // 추천 아이템
  final String? websiteUrl; // 웹사이트 (선택)

  BrandRecommend({
    required this.name,
    required this.priceRange,
    required this.strength,
    required this.recommendItems,
    this.websiteUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'priceRange': priceRange,
      'strength': strength,
      'recommendItems': recommendItems,
      'websiteUrl': websiteUrl,
    };
  }

  factory BrandRecommend.fromJson(Map<String, dynamic> json) {
    return BrandRecommend(
      name: json['name'],
      priceRange: json['priceRange'],
      strength: json['strength'],
      recommendItems: List<String>.from(json['recommendItems']),
      websiteUrl: json['websiteUrl'],
    );
  }
}
