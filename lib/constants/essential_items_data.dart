import '../models/essential_item.dart';

// 카테고리별 필수 아이템 데이터
final Map<String, List<EssentialItem>> essentialItemsData = {
  'pants': [
    EssentialItem(
      name: '슬림 치노팬츠',
      category: 'pants',
      description: '어디에나 어울리는 기본 중의 기본',
      imageUrl: 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=500',
      tips: [
        '발목이 살짝 보이는 길이가 좋아요',
        '앉았을 때 불편하지 않은지 확인하세요',
        '베이지, 카키, 네이비 색상 추천',
      ],
      priceGuide: '5-15만원',
    ),
    EssentialItem(
      name: '블랙 스키니진',
      category: 'pants',
      description: '다리 라인을 살려주는 필수템',
      imageUrl: 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500',
      tips: [
        '하이웨이스트로 비율 UP',
        '발목까지 딱 떨어지는 길이가 베스트',
        '신축성 있는 소재 선택',
      ],
      priceGuide: '5-12만원',
    ),
    EssentialItem(
      name: '와이드 팬츠',
      category: 'pants',
      description: '편안하면서도 세련된 실루엣',
      imageUrl: 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=500',
      tips: [
        '허리 라인이 중요해요',
        '바닥에 끌리지 않는 길이로',
        '핏한 상의와 매치',
      ],
      priceGuide: '7-20만원',
    ),
    EssentialItem(
      name: '슬림 슬랙스',
      category: 'pants',
      description: '포멀한 자리에 필수',
      imageUrl: 'https://images.unsplash.com/photo-1594938291221-94f18cbb5660?w=500',
      tips: [
        '센터라인이 있는 제품 추천',
        '허리 핏이 편안한지 확인',
        '블랙, 그레이, 네이비 기본',
      ],
      priceGuide: '10-25만원',
    ),
  ],
  'top': [
    EssentialItem(
      name: '화이트 셔츠',
      category: 'top',
      description: '모든 스타일의 시작',
      imageUrl: 'https://images.unsplash.com/photo-1603252109303-2751441dd157?w=500',
      tips: [
        '면 100% 또는 면 혼방',
        '어깨 라인이 딱 맞아야 해요',
        '오버사이즈도 좋지만 기본 핏 먼저',
      ],
      priceGuide: '3-10만원',
    ),
    EssentialItem(
      name: '베이직 니트',
      category: 'top',
      description: '계절 전환기 필수템',
      imageUrl: 'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=500',
      tips: [
        '캐시미어 혼방 추천',
        '크루넥, 브이넥 각 1개씩',
        '베이지, 그레이, 블랙 기본',
      ],
      priceGuide: '5-15만원',
    ),
    EssentialItem(
      name: '테일러드 블레이저',
      category: 'top',
      description: '격을 높여주는 아이템',
      imageUrl: 'https://images.unsplash.com/photo-1591369822096-ffd140ec948f?w=500',
      tips: [
        '어깨와 팔 길이가 중요해요',
        '단추를 채웠을 때 편안해야',
        '네이비 or 블랙부터 시작',
      ],
      priceGuide: '15-40만원',
    ),
    EssentialItem(
      name: '크롭 티셔츠',
      category: 'top',
      description: '비율 조절의 핵심',
      imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
      tips: [
        '하이웨이스트 팬츠와 매치',
        '배꼽 살짝 위까지 오는 길이',
        '화이트, 블랙 기본 2장',
      ],
      priceGuide: '2-7만원',
    ),
  ],
  'shoes': [
    EssentialItem(
      name: '화이트 스니커즈',
      category: 'shoes',
      description: '어디든 신을 수 있는 만능템',
      imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500',
      tips: [
        '가죽 재질이 오래 갑니다',
        '발볼 여유있게',
        '정기적인 세척 필수',
      ],
      priceGuide: '8-20만원',
    ),
    EssentialItem(
      name: '블랙 로퍼',
      category: 'shoes',
      description: '포멀과 캐주얼의 경계',
      imageUrl: 'https://images.unsplash.com/photo-1533867617858-e7b97e060509?w=500',
      tips: [
        '발등이 편안한지 확인',
        '신발 창이 두툼한 제품 추천',
        '양말 매치도 중요해요',
      ],
      priceGuide: '10-25만원',
    ),
    EssentialItem(
      name: '앵클부츠',
      category: 'shoes',
      description: '다리 라인을 길게 만드는 비법',
      imageUrl: 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?w=500',
      tips: [
        '발목 라인이 예쁜 제품',
        '힐 높이 5-7cm 추천',
        '블랙, 베이지 기본',
      ],
      priceGuide: '12-30만원',
    ),
    EssentialItem(
      name: '플랫 슈즈',
      category: 'shoes',
      description: '편안함의 대명사',
      imageUrl: 'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=500',
      tips: [
        '발등이 보이는 디자인',
        '뒤꿈치가 안정적인지 확인',
        '베이지 or 블랙',
      ],
      priceGuide: '8-18만원',
    ),
  ],
  'accessory': [
    EssentialItem(
      name: '미니 크로스백',
      category: 'accessory',
      description: '실용성과 스타일 둘 다',
      imageUrl: 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=500',
      tips: [
        '스마트폰과 카드 들어가는 크기',
        '조절 가능한 스트랩',
        '블랙 or 베이지',
      ],
      priceGuide: '10-30만원',
    ),
    EssentialItem(
      name: '토트백',
      category: 'accessory',
      description: '데일리 필수 아이템',
      imageUrl: 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=500',
      tips: [
        '노트북 들어가는 크기',
        '내부 포켓 있는 제품',
        '가죽 or 캔버스',
      ],
      priceGuide: '15-50만원',
    ),
    EssentialItem(
      name: '심플 귀걸이',
      category: 'accessory',
      description: '얼굴 인상을 바꾸는 마법',
      imageUrl: 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=500',
      tips: [
        '얼굴형에 맞게 선택',
        '골드 or 실버',
        '피어싱 or 이어링',
      ],
      priceGuide: '3-15만원',
    ),
    EssentialItem(
      name: '미니멀 시계',
      category: 'accessory',
      description: '세련된 손목을 완성',
      imageUrl: 'https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=500',
      tips: [
        '너무 크지 않은 페이스',
        '가죽 or 메탈 스트랩',
        '색상은 전체 톤과 매치',
      ],
      priceGuide: '10-50만원',
    ),
  ],
};
