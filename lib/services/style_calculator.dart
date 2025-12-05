import '../models/question.dart';
import '../models/style_result.dart';
import '../constants/style_data.dart';

class StyleCalculator {
  /// 선택한 답변들을 기반으로 스타일 결과를 계산합니다.
  StyleResult calculateStyle(Map<int, QuestionOption> answers) {
    // 1. 각 카테고리별 점수 계산
    final scores = _calculateScores(answers);

    // 2. 점수를 기반으로 스타일 ID 생성
    final styleId = _generateStyleId(scores);

    // 3. 스타일 데이터베이스에서 결과 반환
    return styleDatabase[styleId] ?? _getDefaultStyle();
  }

  /// 각 축별 점수를 계산합니다 (0-10 점수)
  Map<String, int> _calculateScores(Map<int, QuestionOption> answers) {
    final Map<String, List<int>> categoryScores = {
      'color': [],
      'silhouette': [],
      'vibe': [],
      'mood': [],
    };

    // 각 답변의 점수를 카테고리별로 분류
    answers.forEach((questionIndex, option) {
      final category = _getCategoryFromQuestionIndex(questionIndex);
      categoryScores[category]?.add(option.scoreValue);
    });

    // 각 카테고리별 평균 점수 계산
    return {
      'color': _calculateAverage(categoryScores['color']!),
      'silhouette': _calculateAverage(categoryScores['silhouette']!),
      'vibe': _calculateAverage(categoryScores['vibe']!),
      'mood': _calculateAverage(categoryScores['mood']!),
    };
  }

  /// 질문 인덱스로 카테고리 추출
  /// (실제로는 Question 객체를 사용하면 더 정확하지만, 간단히 구현)
  String _getCategoryFromQuestionIndex(int index) {
    // questions.dart의 순서를 기반으로 매핑
    // Q1: color, Q2: silhouette, Q3: vibe, Q4: mood
    // Q5: color, Q6: silhouette, Q7: vibe
    const categoryMap = {
      0: 'color', // Q1
      1: 'silhouette', // Q2
      2: 'vibe', // Q3
      3: 'mood', // Q4
      4: 'color', // Q5
      5: 'silhouette', // Q6
      6: 'vibe', // Q7
    };
    return categoryMap[index] ?? 'color';
  }

  /// 평균 계산
  int _calculateAverage(List<int> scores) {
    if (scores.isEmpty) return 5; // 기본값
    final sum = scores.reduce((a, b) => a + b);
    return (sum / scores.length).round();
  }

  /// 스타일 ID 생성 (16가지 조합)
  String _generateStyleId(Map<String, int> scores) {
    final parts = <String>[];

    // Color: warm(0-4) vs cool(7-10)
    parts.add(scores['color']! <= 4 ? 'warm' : 'cool');

    // Silhouette: tight(0-4) vs loose(7-10)
    parts.add(scores['silhouette']! <= 4 ? 'tight' : 'loose');

    // Vibe: casual(0-4) vs formal(7-10)
    parts.add(scores['vibe']! <= 4 ? 'casual' : 'formal');

    // Mood: trendy(0-4) vs minimal(7-10)
    parts.add(scores['mood']! <= 4 ? 'trendy' : 'minimal');

    return parts.join('_');
  }

  /// 기본 스타일 (오류 방지)
  StyleResult _getDefaultStyle() {
    return styleDatabase['warm_tight_casual_trendy']!;
  }

  /// 스타일 점수 상세 정보 반환 (디버깅용)
  Map<String, dynamic> getDetailedScore(Map<int, QuestionOption> answers) {
    final scores = _calculateScores(answers);
    final styleId = _generateStyleId(scores);

    return {
      'scores': scores,
      'styleId': styleId,
      'colorCategory': scores['color']! <= 4 ? '웜톤' : '쿨톤',
      'silhouetteCategory': scores['silhouette']! <= 4 ? '타이트' : '루즈',
      'vibeCategory': scores['vibe']! <= 4 ? '캐주얼' : '포멀',
      'moodCategory': scores['mood']! <= 4 ? '트렌디' : '미니멀',
    };
  }
}
