class StyleResult {
  final String id;
  final String name;
  final String description;

  // 4개 축 점수 (0-10)
  final int colorScore; // 0: 웜톤, 10: 쿨톤
  final int silhouetteScore; // 0: 타이트, 10: 루즈
  final int vibeScore; // 0: 캐주얼, 10: 포멀
  final int moodScore; // 0: 트렌디, 10: 미니멀

  final List<String> colors; // 추천 색상
  final List<String> keywords; // 핵심 키워드
  final String detailDescription; // 상세 설명

  StyleResult({
    required this.id,
    required this.name,
    required this.description,
    required this.colorScore,
    required this.silhouetteScore,
    required this.vibeScore,
    required this.moodScore,
    required this.colors,
    required this.keywords,
    required this.detailDescription,
  });

  // JSON 직렬화
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'colorScore': colorScore,
      'silhouetteScore': silhouetteScore,
      'vibeScore': vibeScore,
      'moodScore': moodScore,
      'colors': colors,
      'keywords': keywords,
      'detailDescription': detailDescription,
    };
  }

  // JSON 역직렬화
  factory StyleResult.fromJson(Map<String, dynamic> json) {
    return StyleResult(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      colorScore: json['colorScore'],
      silhouetteScore: json['silhouetteScore'],
      vibeScore: json['vibeScore'],
      moodScore: json['moodScore'],
      colors: List<String>.from(json['colors']),
      keywords: List<String>.from(json['keywords']),
      detailDescription: json['detailDescription'],
    );
  }

  // 색상 분류 헬퍼
  String get colorCategory {
    if (colorScore < 4) return '웜톤';
    if (colorScore > 6) return '쿨톤';
    return '중립톤';
  }

  // 실루엣 분류 헬퍼
  String get silhouetteCategory {
    if (silhouetteScore < 4) return '타이트';
    if (silhouetteScore > 6) return '루즈';
    return '레귤러';
  }

  // 분위기 분류 헬퍼
  String get vibeCategory {
    if (vibeScore < 4) return '캐주얼';
    if (vibeScore > 6) return '포멀';
    return '세미 포멀';
  }

  // 무드 분류 헬퍼
  String get moodCategory {
    if (moodScore < 4) return '트렌디';
    if (moodScore > 6) return '미니멀';
    return '모던';
  }
}
