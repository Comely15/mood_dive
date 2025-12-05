import '../models/question.dart';

// 7개 진단 질문 (이미지 기반)
final List<Question> diagnosticQuestions = [
  // Q1: 색상 (웜톤 vs 쿨톤)
  Question(
    id: 1,
    text: '어떤 색상 조합이 더 끌리시나요?',
    category: 'color',
    options: [
      QuestionOption(
        id: 'warm',
        label: '베이지, 카키, 테라코타',
        imageUrl: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500',
        scoreValue: 2, // 웜톤
      ),
      QuestionOption(
        id: 'cool',
        label: '네이비, 그레이, 블랙',
        imageUrl: 'https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?w=500',
        scoreValue: 8, // 쿨톤
      ),
      QuestionOption(
        id: 'neutral',
        label: '화이트, 아이보리, 연베이지',
        imageUrl: 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=500',
        scoreValue: 5, // 중립톤
      ),
    ],
  ),

  // Q2: 실루엣 (타이트 vs 루즈)
  Question(
    id: 2,
    text: '편안하게 느껴지는 핏은 무엇인가요?',
    category: 'silhouette',
    options: [
      QuestionOption(
        id: 'tight',
        label: '슬림핏, 몸에 맞는',
        imageUrl: 'https://images.unsplash.com/photo-1515347619252-60a6bf4fffce?w=500',
        scoreValue: 2, // 타이트
      ),
      QuestionOption(
        id: 'loose',
        label: '오버사이즈, 여유있는',
        imageUrl: 'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=500',
        scoreValue: 8, // 루즈
      ),
      QuestionOption(
        id: 'regular',
        label: '레귤러핏, 적당한',
        imageUrl: 'https://images.unsplash.com/photo-1485230946086-1d99d529c7c4?w=500',
        scoreValue: 5, // 레귤러
      ),
    ],
  ),

  // Q3: 분위기 (캐주얼 vs 포멀)
  Question(
    id: 3,
    text: '어떤 느낌의 스타일을 선호하시나요?',
    category: 'vibe',
    options: [
      QuestionOption(
        id: 'casual',
        label: '편안하고 자유로운',
        imageUrl: 'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500',
        scoreValue: 2, // 캐주얼
      ),
      QuestionOption(
        id: 'formal',
        label: '깔끔하고 정돈된',
        imageUrl: 'https://images.unsplash.com/photo-1507680434567-5739c80be1ac?w=500',
        scoreValue: 8, // 포멀
      ),
      QuestionOption(
        id: 'semi_formal',
        label: '스마트 캐주얼',
        imageUrl: 'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=500',
        scoreValue: 5, // 세미 포멀
      ),
    ],
  ),

  // Q4: 무드 (트렌디 vs 미니멀)
  Question(
    id: 4,
    text: '추구하는 스타일 방향은 무엇인가요?',
    category: 'mood',
    options: [
      QuestionOption(
        id: 'trendy',
        label: '최신 트렌드, 개성있는',
        imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500',
        scoreValue: 2, // 트렌디
      ),
      QuestionOption(
        id: 'minimal',
        label: '심플하고 클래식한',
        imageUrl: 'https://images.unsplash.com/photo-1574634534894-89d7576c8259?w=500',
        scoreValue: 8, // 미니멀
      ),
      QuestionOption(
        id: 'modern',
        label: '모던하고 세련된',
        imageUrl: 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500',
        scoreValue: 5, // 모던
      ),
    ],
  ),

  // Q5: 패턴 선호도 (색상 보조)
  Question(
    id: 5,
    text: '선호하는 패턴은 무엇인가요?',
    category: 'color',
    options: [
      QuestionOption(
        id: 'warm_pattern',
        label: '체크, 플로럴',
        imageUrl: 'https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=500',
        scoreValue: 3, // 웜톤 경향
      ),
      QuestionOption(
        id: 'cool_pattern',
        label: '스트라이프, 도트',
        imageUrl: 'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=500',
        scoreValue: 7, // 쿨톤 경향
      ),
      QuestionOption(
        id: 'no_pattern',
        label: '무지',
        imageUrl: 'https://images.unsplash.com/photo-1523381210434-271e8be1f52b?w=500',
        scoreValue: 5, // 중립
      ),
    ],
  ),

  // Q6: 액세서리 스타일 (실루엣 보조)
  Question(
    id: 6,
    text: '선호하는 액세서리 스타일은?',
    category: 'silhouette',
    options: [
      QuestionOption(
        id: 'minimal_acc',
        label: '작고 섬세한',
        imageUrl: 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=500',
        scoreValue: 2, // 타이트 경향
      ),
      QuestionOption(
        id: 'bold_acc',
        label: '크고 과감한',
        imageUrl: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=500',
        scoreValue: 8, // 루즈 경향
      ),
      QuestionOption(
        id: 'medium_acc',
        label: '적당한 크기',
        imageUrl: 'https://images.unsplash.com/photo-1617038260897-41a1f14a8ca0?w=500',
        scoreValue: 5, // 중립
      ),
    ],
  ),

  // Q7: 신발 스타일 (분위기 보조)
  Question(
    id: 7,
    text: '가장 자주 신는 신발 스타일은?',
    category: 'vibe',
    options: [
      QuestionOption(
        id: 'sneakers',
        label: '스니커즈',
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
        scoreValue: 2, // 캐주얼
      ),
      QuestionOption(
        id: 'loafers',
        label: '로퍼, 구두',
        imageUrl: 'https://images.unsplash.com/photo-1533867617858-e7b97e060509?w=500',
        scoreValue: 8, // 포멀
      ),
      QuestionOption(
        id: 'boots',
        label: '부츠, 앵클부츠',
        imageUrl: 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?w=500',
        scoreValue: 5, // 세미 포멀
      ),
    ],
  ),
];
