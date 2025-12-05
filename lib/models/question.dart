class Question {
  final int id;
  final String text; // 질문 텍스트
  final String category; // 카테고리 (color, silhouette, vibe, mood)
  final List<QuestionOption> options; // 선택지

  Question({
    required this.id,
    required this.text,
    required this.category,
    required this.options,
  });
}

class QuestionOption {
  final String id;
  final String label; // 라벨
  final String imageUrl; // 이미지 URL
  final int scoreValue; // 점수 값 (0-10)
  final String? description; // 설명 (선택)

  QuestionOption({
    required this.id,
    required this.label,
    required this.imageUrl,
    required this.scoreValue,
    this.description,
  });
}
