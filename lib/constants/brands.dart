import '../models/brand_recommend.dart';

// 브랜드 추천 데이터 (가격대별)
final List<BrandRecommend> affordableBrands = [
  BrandRecommend(
    name: 'Uniqlo',
    priceRange: '3-7만원',
    strength: '베이직 아이템, 높은 가성비',
    recommendItems: ['슬림 치노팬츠', '화이트 셔츠', '니트', '데님'],
  ),
  BrandRecommend(
    name: 'H&M',
    priceRange: '3-8만원',
    strength: '트렌디한 디자인, 합리적 가격',
    recommendItems: ['트렌디 아우터', '액세서리', '기본 티셔츠'],
  ),
  BrandRecommend(
    name: 'Zara',
    priceRange: '5-15만원',
    strength: '빠른 트렌드 반영, 세련된 디자인',
    recommendItems: ['블레이저', '팬츠', '원피스', '백'],
  ),
  BrandRecommend(
    name: 'Mango',
    priceRange: '5-12만원',
    strength: '여성스러운 디자인, 좋은 품질',
    recommendItems: ['블라우스', '니트', '팬츠', '코트'],
  ),
];

final List<BrandRecommend> midRangeBrands = [
  BrandRecommend(
    name: 'COS',
    priceRange: '10-25만원',
    strength: '미니멀 디자인, 우수한 품질',
    recommendItems: ['블레이저', '코트', '니트', '슬랙스'],
  ),
  BrandRecommend(
    name: 'Arket',
    priceRange: '8-20만원',
    strength: '지속가능한 소재, 베이직 라인',
    recommendItems: ['셔츠', '니트', '데님', '코트'],
  ),
  BrandRecommend(
    name: 'Everlane',
    priceRange: '10-20만원',
    strength: '투명한 가격정책, 심플 디자인',
    recommendItems: ['기본 티셔츠', '진', '스웨터', '아우터'],
  ),
  BrandRecommend(
    name: '& Other Stories',
    priceRange: '10-30만원',
    strength: '독특한 디자인, 트렌디한 스타일',
    recommendItems: ['드레스', '블라우스', '액세서리', '슈즈'],
  ),
];

final List<BrandRecommend> premiumBrands = [
  BrandRecommend(
    name: 'Club Monaco',
    priceRange: '15-40만원',
    strength: '세련된 디자인, 좋은 소재',
    recommendItems: ['블레이저', '코트', '드레스', '니트'],
  ),
  BrandRecommend(
    name: 'Sandro',
    priceRange: '30-60만원',
    strength: '프렌치 시크, 여성스러운 디테일',
    recommendItems: ['재킷', '드레스', '니트', '백'],
  ),
  BrandRecommend(
    name: 'Theory',
    priceRange: '30-80만원',
    strength: '고급스러운 소재, 미니멀 디자인',
    recommendItems: ['블레이저', '셔츠', '팬츠', '코트'],
  ),
  BrandRecommend(
    name: 'Acne Studios',
    priceRange: '40-100만원',
    strength: '스칸디나비안 미니멀, 독특한 핏',
    recommendItems: ['데님', '니트', '코트', '액세서리'],
  ),
];

// 카테고리별 브랜드 추천
final Map<String, List<BrandRecommend>> brandsByCategory = {
  'pants': [
    BrandRecommend(
      name: 'Uniqlo',
      priceRange: '3-5만원',
      strength: '기본 치노, 슬랙스',
      recommendItems: ['슬림 치노', '와이드 팬츠', '스키니진'],
    ),
    BrandRecommend(
      name: 'Zara',
      priceRange: '5-10만원',
      strength: '트렌디한 핏과 디자인',
      recommendItems: ['와이드 슬랙스', '크롭 팬츠', '하이웨이스트진'],
    ),
    BrandRecommend(
      name: 'COS',
      priceRange: '10-18만원',
      strength: '미니멀 디자인, 좋은 핏',
      recommendItems: ['와이드 슬랙스', '테일러드 팬츠', '데님'],
    ),
  ],
  'top': [
    BrandRecommend(
      name: 'Uniqlo',
      priceRange: '2-5만원',
      strength: '기본 셔츠, 티셔츠',
      recommendItems: ['화이트 셔츠', '기본 티', '니트'],
    ),
    BrandRecommend(
      name: 'Mango',
      priceRange: '5-12만원',
      strength: '여성스러운 블라우스',
      recommendItems: ['블라우스', '니트', '셔츠'],
    ),
    BrandRecommend(
      name: 'COS',
      priceRange: '8-20만원',
      strength: '미니멀 셔츠, 니트',
      recommendItems: ['오버사이즈 셔츠', '캐시미어 니트', '블레이저'],
    ),
  ],
  'shoes': [
    BrandRecommend(
      name: 'Converse',
      priceRange: '6-8만원',
      strength: '클래식 스니커즈',
      recommendItems: ['척테일러', '원스타'],
    ),
    BrandRecommend(
      name: 'Veja',
      priceRange: '15-20만원',
      strength: '친환경 스니커즈, 세련된 디자인',
      recommendItems: ['V-10', 'Esplar'],
    ),
    BrandRecommend(
      name: 'Everlane',
      priceRange: '12-18만원',
      strength: '미니멀 로퍼, 플랫',
      recommendItems: ['로퍼', '뮬', '앵클부츠'],
    ),
  ],
  'accessory': [
    BrandRecommend(
      name: 'Mango',
      priceRange: '3-8만원',
      strength: '트렌디한 액세서리',
      recommendItems: ['미니백', '귀걸이', '목걸이'],
    ),
    BrandRecommend(
      name: 'Arket',
      priceRange: '5-15만원',
      strength: '미니멀 디자인',
      recommendItems: ['레더 백', '스카프', '벨트'],
    ),
    BrandRecommend(
      name: 'COS',
      priceRange: '8-25만원',
      strength: '심플하고 고급스러운',
      recommendItems: ['토트백', '크로스백', '주얼리'],
    ),
  ],
};
