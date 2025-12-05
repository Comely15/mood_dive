class EssentialItem {
  final String name; // 아이템명
  final String category; // 카테고리 (pants, top, shoes, accessory)
  final String description; // 설명
  final String imageUrl; // 이미지 URL
  final List<String> tips; // 착용 팁
  final String? priceGuide; // 가격 가이드 (선택)

  EssentialItem({
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.tips = const [],
    this.priceGuide,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'tips': tips,
      'priceGuide': priceGuide,
    };
  }

  factory EssentialItem.fromJson(Map<String, dynamic> json) {
    return EssentialItem(
      name: json['name'],
      category: json['category'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      tips: json['tips'] != null ? List<String>.from(json['tips']) : [],
      priceGuide: json['priceGuide'],
    );
  }
}
