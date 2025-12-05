import 'brand_recommend.dart';

class ShoppingTip {
  final String situation; // 상황 (예: "백화점에서 팬츠 고를 때")
  final List<String> checklist; // 체크리스트
  final List<BrandRecommend> brands; // 추천 브랜드
  final List<String> warnings; // 주의사항

  ShoppingTip({
    required this.situation,
    required this.checklist,
    required this.brands,
    this.warnings = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'situation': situation,
      'checklist': checklist,
      'brands': brands.map((b) => b.toJson()).toList(),
      'warnings': warnings,
    };
  }

  factory ShoppingTip.fromJson(Map<String, dynamic> json) {
    return ShoppingTip(
      situation: json['situation'],
      checklist: List<String>.from(json['checklist']),
      brands: (json['brands'] as List)
          .map((b) => BrandRecommend.fromJson(b))
          .toList(),
      warnings: json['warnings'] != null
          ? List<String>.from(json['warnings'])
          : [],
    );
  }
}
