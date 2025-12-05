class Outfit {
  final String title;
  final String situation; // 데일리, 미팅, 주말 등
  final List<String> items; // 아이템 리스트
  final String imageUrl; // 이미지 URL (Unsplash 또는 로컬)
  final String tip; // 스타일링 팁
  final List<String> tags; // 태그 (예: #미니멀, #편안함)

  Outfit({
    required this.title,
    required this.situation,
    required this.items,
    required this.imageUrl,
    required this.tip,
    this.tags = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'situation': situation,
      'items': items,
      'imageUrl': imageUrl,
      'tip': tip,
      'tags': tags,
    };
  }

  factory Outfit.fromJson(Map<String, dynamic> json) {
    return Outfit(
      title: json['title'],
      situation: json['situation'],
      items: List<String>.from(json['items']),
      imageUrl: json['imageUrl'],
      tip: json['tip'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
    );
  }
}
