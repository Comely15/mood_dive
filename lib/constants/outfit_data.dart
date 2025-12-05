import '../models/outfit.dart';

/// 스타일별 코디 데이터
/// 실제로는 스타일 ID를 기반으로 동적 생성하거나 Unsplash API 사용
Map<String, List<Outfit>> getOutfitsForStyle(String styleId) {
  // 간단한 매핑 (실제로는 더 정교하게 구현)
  final baseOutfits = {
    'daily': Outfit(
      title: '데일리 캐주얼',
      situation: '일상',
      items: [],
      imageUrl: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500',
      tip: '',
      tags: ['#편안함', '#데일리'],
    ),
    'meeting': Outfit(
      title: '미팅 룩',
      situation: '업무',
      items: [],
      imageUrl: 'https://images.unsplash.com/photo-1507680434567-5739c80be1ac?w=500',
      tip: '',
      tags: ['#비즈니스', '#세련됨'],
    ),
    'weekend': Outfit(
      title: '주말 외출',
      situation: '주말',
      items: [],
      imageUrl: 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500',
      tip: '',
      tags: ['#편안함', '#스타일리시'],
    ),
  };

  // 스타일에 따라 커스터마이즈
  if (styleId.contains('warm') && styleId.contains('tight')) {
    return {
      'outfits': [
        Outfit(
          title: '데일리 캐주얼',
          situation: '일상',
          items: [
            '베이지 슬림 치노팬츠',
            '화이트 크롭탑',
            '골드 미니백',
            '앵클부츠',
          ],
          imageUrl: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500',
          tip: '하이웨이스트 팬츠로 다리 라인을 길게 표현하세요.',
          tags: ['#웜톤', '#슬림핏', '#데일리'],
        ),
        Outfit(
          title: '미팅 룩',
          situation: '업무',
          items: [
            '카키 테일러드 재킷',
            '화이트 셔츠',
            '슬림 슬랙스',
            '로퍼',
          ],
          imageUrl: 'https://images.unsplash.com/photo-1507680434567-5739c80be1ac?w=500',
          tip: '골드 액세서리로 포인트를 주세요.',
          tags: ['#비즈니스', '#웜톤', '#포멀'],
        ),
        Outfit(
          title: '주말 외출',
          situation: '주말',
          items: [
            '베이지 니트',
            '스키니 진',
            '스니커즈',
            '크로스백',
          ],
          imageUrl: 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500',
          tip: '니트를 바지에 살짝 넣어서 비율을 좋게 만드세요.',
          tags: ['#주말', '#편안함', '#웜톤'],
        ),
      ],
    };
  } else if (styleId.contains('cool') && styleId.contains('loose')) {
    return {
      'outfits': [
        Outfit(
          title: '데일리 캐주얼',
          situation: '일상',
          items: [
            '그레이 오버사이즈 후디',
            '블랙 와이드 팬츠',
            '화이트 스니커즈',
            '크로스백',
          ],
          imageUrl: 'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=500',
          tip: '후디를 앞만 바지에 넣어서 멋스러운 느낌을 연출하세요.',
          tags: ['#스트릿', '#쿨톤', '#루즈핏'],
        ),
        Outfit(
          title: '미팅 룩',
          situation: '업무',
          items: [
            '네이비 오버사이즈 블레이저',
            '화이트 셔츠',
            '와이드 슬랙스',
            '로퍼',
          ],
          imageUrl: 'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500',
          tip: '실버 액세서리로 현대적인 감각을 더하세요.',
          tags: ['#모던포멀', '#쿨톤', '#루즈핏'],
        ),
        Outfit(
          title: '주말 외출',
          situation: '주말',
          items: [
            '블랙 루즈 니트',
            '데님 와이드 팬츠',
            '청키 스니커즈',
            '토트백',
          ],
          imageUrl: 'https://images.unsplash.com/photo-1515347619252-60a6bf4fffce?w=500',
          tip: '레이어드로 입체감을 더해보세요.',
          tags: ['#주말', '#편안함', '#쿨톤'],
        ),
      ],
    };
  }

  // 기본 코디 (모든 스타일에 적용 가능한 기본)
  return {
    'outfits': [
      Outfit(
        title: '데일리 캐주얼',
        situation: '일상',
        items: [
          '베이직 티셔츠',
          '편한 진',
          '스니커즈',
          '심플 백',
        ],
        imageUrl: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500',
        tip: '자신의 스타일 컬러에 맞는 색상을 선택하세요.',
        tags: ['#데일리', '#베이직'],
      ),
      Outfit(
        title: '미팅 룩',
        situation: '업무',
        items: [
          '블레이저',
          '셔츠',
          '슬랙스',
          '로퍼',
        ],
        imageUrl: 'https://images.unsplash.com/photo-1507680434567-5739c80be1ac?w=500',
        tip: '깔끔한 핏으로 전문성을 표현하세요.',
        tags: ['#비즈니스', '#포멀'],
      ),
      Outfit(
        title: '주말 외출',
        situation: '주말',
        items: [
          '니트',
          '팬츠',
          '편한 신발',
          '백',
        ],
        imageUrl: 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500',
        tip: '편안하면서도 스타일리시하게 연출하세요.',
        tags: ['#주말', '#편안함'],
      ),
    ],
  };
}
