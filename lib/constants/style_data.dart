import '../models/style_result.dart';

// 16가지 스타일 타입 데이터
final Map<String, StyleResult> styleDatabase = {
  // 웜톤 + 타이트 + 캐주얼 + 트렌디
  'warm_tight_casual_trendy': StyleResult(
    id: 'warm_tight_casual_trendy',
    name: '시티 트렌디',
    description: '따뜻한 색감과 슬림한 핏으로 도시적인 트렌디함을 표현',
    colorScore: 2,
    silhouetteScore: 2,
    vibeScore: 2,
    moodScore: 2,
    colors: ['베이지', '카키', '테라코타', '골드'],
    keywords: ['스키니진', '크롭탑', '앵클부츠', '미니백'],
    detailDescription:
        '베이지 톤의 슬림핏 의류와 골드 액세서리로 도시적인 세련미를 강조합니다. '
        '하이웨이스트 팬츠로 다리 라인을 길게 표현하고, 크롭 탑으로 균형을 맞춥니다.',
  ),

  // 웜톤 + 타이트 + 캐주얼 + 미니멀
  'warm_tight_casual_minimal': StyleResult(
    id: 'warm_tight_casual_minimal',
    name: '내추럴 베이직',
    description: '자연스러운 색감과 간결한 라인의 데일리 룩',
    colorScore: 2,
    silhouetteScore: 2,
    vibeScore: 2,
    moodScore: 8,
    colors: ['아이보리', '연베이지', '카키', '브라운'],
    keywords: ['슬림 치노팬츠', '화이트 셔츠', '로퍼', '심플 백'],
    detailDescription:
        '베이직한 아이템으로 심플하게 구성하되, 웜톤 컬러로 부드러운 느낌을 줍니다. '
        '과하지 않은 슬림핏으로 깔끔한 실루엣을 완성합니다.',
  ),

  // 웜톤 + 타이트 + 포멀 + 트렌디
  'warm_tight_formal_trendy': StyleResult(
    id: 'warm_tight_formal_trendy',
    name: '엘레강스 웜',
    description: '따뜻한 색감의 정제된 포멀 스타일',
    colorScore: 2,
    silhouetteScore: 2,
    vibeScore: 8,
    moodScore: 2,
    colors: ['캐멀', '버건디', '골드', '크림'],
    keywords: ['테일러드 재킷', '하이웨이스트 스커트', '펌프스', '구조적 백'],
    detailDescription:
        '따뜻한 톤의 테일러드 재킷과 하이웨이스트 스커트로 우아함을 표현합니다. '
        '골드 액세서리로 포인트를 주어 격식있으면서도 세련된 느낌을 연출합니다.',
  ),

  // 웜톤 + 타이트 + 포멀 + 미니멀
  'warm_tight_formal_minimal': StyleResult(
    id: 'warm_tight_formal_minimal',
    name: '클래식 웜',
    description: '시간이 지나도 변하지 않는 웜톤 클래식',
    colorScore: 2,
    silhouetteScore: 2,
    vibeScore: 8,
    moodScore: 8,
    colors: ['베이지', '카키', '브라운', '아이보리'],
    keywords: ['트렌치코트', '슬림 팬츠', '로퍼', '레더 백'],
    detailDescription:
        '트렌치코트와 슬림 팬츠의 조합으로 클래식한 우아함을 완성합니다. '
        '베이지 톤의 절제된 색상 사용으로 세련되고 품격있는 이미지를 만듭니다.',
  ),

  // 웜톤 + 루즈 + 캐주얼 + 트렌디
  'warm_loose_casual_trendy': StyleResult(
    id: 'warm_loose_casual_trendy',
    name: '릴렉스 트렌디',
    description: '편안함과 트렌디함을 동시에',
    colorScore: 2,
    silhouetteScore: 8,
    vibeScore: 2,
    moodScore: 2,
    colors: ['카키', '올리브', '머스타드', '코랄'],
    keywords: ['오버사이즈 셔츠', '와이드 팬츠', '청키 스니커즈', '크로스백'],
    detailDescription:
        '오버사이즈 셔츠와 와이드 팬츠로 편안하면서도 멋스러운 실루엣을 만듭니다. '
        '웜톤 컬러의 레이어드로 감각적인 스트릿 무드를 연출합니다.',
  ),

  // 웜톤 + 루즈 + 캐주얼 + 미니멀
  'warm_loose_casual_minimal': StyleResult(
    id: 'warm_loose_casual_minimal',
    name: '미니멀 웜',
    description: '편안하고 심플한 웜톤 미니멀',
    colorScore: 2,
    silhouetteScore: 8,
    vibeScore: 2,
    moodScore: 8,
    colors: ['베이지', '아이보리', '연그레이', '브라운'],
    keywords: ['루즈 니트', '와이드 팬츠', '플랫 슈즈', '토트백'],
    detailDescription:
        '루즈한 니트와 와이드 팬츠로 편안하면서도 세련된 느낌을 줍니다. '
        '베이지 톤의 단순한 구성으로 미니멀하지만 따뜻한 이미지를 만듭니다.',
  ),

  // 웜톤 + 루즈 + 포멀 + 트렌디
  'warm_loose_formal_trendy': StyleResult(
    id: 'warm_loose_formal_trendy',
    name: '모던 웜 포멀',
    description: '현대적으로 재해석한 웜톤 포멀',
    colorScore: 2,
    silhouetteScore: 8,
    vibeScore: 8,
    moodScore: 2,
    colors: ['카키', '베이지', '버건디', '골드'],
    keywords: ['오버사이즈 블레이저', '와이드 슬랙스', '로퍼', '스트럭쳐 백'],
    detailDescription:
        '오버사이즈 블레이저로 현대적인 감각을 더한 포멀 스타일입니다. '
        '웜톤 컬러와 볼륨감 있는 실루엣으로 격식을 유지하면서도 트렌디한 느낌을 줍니다.',
  ),

  // 웜톤 + 루즈 + 포멀 + 미니멀
  'warm_loose_formal_minimal': StyleResult(
    id: 'warm_loose_formal_minimal',
    name: '소프트 클래식',
    description: '부드럽고 우아한 클래식 스타일',
    colorScore: 2,
    silhouetteScore: 8,
    vibeScore: 8,
    moodScore: 8,
    colors: ['베이지', '아이보리', '그레이지', '브라운'],
    keywords: ['루즈 블레이저', '와이드 슬랙스', '로퍼', '레더 백'],
    detailDescription:
        '루즈한 블레이저와 와이드 슬랙스로 편안하면서도 품격있는 느낌을 줍니다. '
        '베이지 톤의 절제된 색상으로 우아하고 세련된 이미지를 완성합니다.',
  ),

  // 쿨톤 + 타이트 + 캐주얼 + 트렌디
  'cool_tight_casual_trendy': StyleResult(
    id: 'cool_tight_casual_trendy',
    name: '어반 쿨',
    description: '도시적이고 쿨한 스트릿 스타일',
    colorScore: 8,
    silhouetteScore: 2,
    vibeScore: 2,
    moodScore: 2,
    colors: ['블랙', '화이트', '네이비', '실버'],
    keywords: ['스키니진', '그래픽 티', '하이탑 스니커즈', '미니백'],
    detailDescription:
        '블랙과 화이트의 강렬한 대비로 도시적인 감각을 표현합니다. '
        '슬림한 실루엣과 실버 액세서리로 쿨하고 세련된 이미지를 완성합니다.',
  ),

  // 쿨톤 + 타이트 + 캐주얼 + 미니멀
  'cool_tight_casual_minimal': StyleResult(
    id: 'cool_tight_casual_minimal',
    name: '쿨 베이직',
    description: '깔끔하고 세련된 쿨톤 데일리',
    colorScore: 8,
    silhouetteScore: 2,
    vibeScore: 2,
    moodScore: 8,
    colors: ['그레이', '화이트', '블랙', '네이비'],
    keywords: ['슬림 진', '화이트 셔츠', '스니커즈', '심플 백'],
    detailDescription:
        '그레이와 화이트의 깔끔한 조합으로 미니멀한 데일리 룩을 완성합니다. '
        '슬림한 핏으로 단정하고 세련된 느낌을 줍니다.',
  ),

  // 쿨톤 + 타이트 + 포멀 + 트렌디
  'cool_tight_formal_trendy': StyleResult(
    id: 'cool_tight_formal_trendy',
    name: '모던 시크',
    description: '현대적이고 세련된 포멀 스타일',
    colorScore: 8,
    silhouetteScore: 2,
    vibeScore: 8,
    moodScore: 2,
    colors: ['네이비', '그레이', '블랙', '실버'],
    keywords: ['테일러드 재킷', '펜슬 스커트', '펌프스', '클러치'],
    detailDescription:
        '네이비 재킷과 펜슬 스커트로 현대적인 여성미를 표현합니다. '
        '쿨톤 컬러와 슬림한 라인으로 시크하고 전문적인 이미지를 만듭니다.',
  ),

  // 쿨톤 + 타이트 + 포멀 + 미니멀
  'cool_tight_formal_minimal': StyleResult(
    id: 'cool_tight_formal_minimal',
    name: '미니멀 포멀',
    description: '절제된 우아함의 정수',
    colorScore: 8,
    silhouetteScore: 2,
    vibeScore: 8,
    moodScore: 8,
    colors: ['그레이', '블랙', '화이트', '네이비'],
    keywords: ['슬림 블레이저', '슬랙스', '로퍼', '레더 백'],
    detailDescription:
        '그레이와 블랙의 절제된 색상으로 품격있는 이미지를 만듭니다. '
        '슬림한 실루엣과 미니멀한 디자인으로 세련되고 전문적인 느낌을 줍니다.',
  ),

  // 쿨톤 + 루즈 + 캐주얼 + 트렌디
  'cool_loose_casual_trendy': StyleResult(
    id: 'cool_loose_casual_trendy',
    name: '스트릿 쿨',
    description: '편안하고 힙한 스트릿 패션',
    colorScore: 8,
    silhouetteScore: 8,
    vibeScore: 2,
    moodScore: 2,
    colors: ['블랙', '그레이', '화이트', '데님'],
    keywords: ['오버사이즈 후디', '와이드 팬츠', '청키 스니커즈', '크로스백'],
    detailDescription:
        '오버사이즈 후디와 와이드 팬츠로 편안하면서도 힙한 느낌을 줍니다. '
        '쿨톤 컬러의 레이어드로 도시적인 스트릿 무드를 완성합니다.',
  ),

  // 쿨톤 + 루즈 + 캐주얼 + 미니멀
  'cool_loose_casual_minimal': StyleResult(
    id: 'cool_loose_casual_minimal',
    name: '미니멀 쿨',
    description: '심플하고 쿨한 데일리 룩',
    colorScore: 8,
    silhouetteScore: 8,
    vibeScore: 2,
    moodScore: 8,
    colors: ['그레이', '화이트', '블랙', '연그레이'],
    keywords: ['루즈 니트', '와이드 팬츠', '플랫 슈즈', '토트백'],
    detailDescription:
        '루즈한 니트와 와이드 팬츠로 편안하면서도 세련된 느낌을 줍니다. '
        '그레이 톤의 심플한 구성으로 미니멀하고 쿨한 이미지를 만듭니다.',
  ),

  // 쿨톤 + 루즈 + 포멀 + 트렌디
  'cool_loose_formal_trendy': StyleResult(
    id: 'cool_loose_formal_trendy',
    name: '모던 포멀',
    description: '현대적으로 재해석한 포멀 스타일',
    colorScore: 8,
    silhouetteScore: 8,
    vibeScore: 8,
    moodScore: 2,
    colors: ['네이비', '그레이', '블랙', '화이트'],
    keywords: ['오버사이즈 블레이저', '와이드 슬랙스', '로퍼', '스트럭쳐 백'],
    detailDescription:
        '오버사이즈 블레이저로 현대적인 감각을 더한 포멀 스타일입니다. '
        '쿨톤 컬러와 볼륨감 있는 실루엣으로 격식을 유지하면서도 트렌디한 느낌을 줍니다.',
  ),

  // 쿨톤 + 루즈 + 포멀 + 미니멀
  'cool_loose_formal_minimal': StyleResult(
    id: 'cool_loose_formal_minimal',
    name: '하드 클래식',
    description: '강인하고 세련된 클래식 스타일',
    colorScore: 8,
    silhouetteScore: 8,
    vibeScore: 8,
    moodScore: 8,
    colors: ['그레이', '블랙', '화이트', '네이비'],
    keywords: ['루즈 블레이저', '와이드 슬랙스', '로퍼', '레더 백'],
    detailDescription:
        '루즈한 블레이저와 와이드 슬랙스로 편안하면서도 품격있는 느낌을 줍니다. '
        '그레이 톤의 절제된 색상으로 강인하고 세련된 이미지를 완성합니다.',
  ),
};
