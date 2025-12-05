import '../models/seasonal_tip.dart';

// 계절별 팁 데이터
final List<SeasonalTip> seasonalTipsData = [
  SeasonalTip(
    season: 'spring',
    displayName: '봄',
    colors: ['파스텔 핑크', '라벤더', '민트', '연베이지'],
    items: [
      '가디건 (레이어드용)',
      '트렌치코트',
      '화이트 스니커즈',
      '플라워 패턴 원피스',
    ],
    keyPoint: '레이어드가 핵심! 아침저녁 온도차에 대비하세요.',
    imageUrl: 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=500',
  ),
  SeasonalTip(
    season: 'summer',
    displayName: '여름',
    colors: ['화이트', '스카이블루', '옐로우', '코랄'],
    items: [
      '린넨 셔츠',
      '데님 반바지',
      '샌들',
      '밀짚 모자',
    ],
    keyPoint: '통풍과 흡수가 좋은 린넨, 면 소재를 선택하세요.',
    imageUrl: 'https://images.unsplash.com/photo-1523381210434-271e8be1f52b?w=500',
  ),
  SeasonalTip(
    season: 'fall',
    displayName: '가을',
    colors: ['버건디', '머스타드', '카키', '브라운'],
    items: [
      '니트 (다양한 두께)',
      '체크 셔츠',
      '앵클부츠',
      '숄더백',
    ],
    keyPoint: '니트 레이어드로 깊이감을 주세요. 웜톤의 계절!',
    imageUrl: 'https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=500',
  ),
  SeasonalTip(
    season: 'winter',
    displayName: '겨울',
    colors: ['블랙', '그레이', '네이비', '크림'],
    items: [
      '패딩 or 울코트',
      '터틀넥',
      '부츠',
      '머플러',
    ],
    keyPoint: '아우터가 전체 룩을 결정해요. 좋은 코트 1벌은 필수!',
    imageUrl: 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500',
  ),
];
